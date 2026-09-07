#!/usr/bin/env bash
# render-check.sh - prove every .puml in this folder actually renders.
#
# WHY THIS EXISTS
# ---------------
# A diagram that has never been rendered is a guess. This folder shipped with a
# sequence diagram carrying `note as N1`, which is valid PlantUML in a CLASS
# diagram and invalid in a SEQUENCE diagram - a floating note needs a
# participant to anchor to (`note over X, Y`). It was written, reviewed and
# committed without anyone rendering it, and surfaced only when the owner
# opened it in the editor. Run this before committing a diagram.
#
# WHY THE CLI IMAGE AND NOT THE SERVER
# ------------------------------------
# The editor extension deflates the whole diagram source into a GET URL, and a
# large diagram overruns the servlet container's max header size (8KB by
# default on both the Tomcat and Jetty images). It comes back as
# "HTTP 400 - Request header is too large", which is a TRANSPORT limit and not
# a diagram error - and it hides real syntax errors behind a misleading
# message. That is precisely how the bug above survived review. The CLI reads
# files, so there is no header to overrun and its exit code means what it says.
#
# CONVENTION THIS ENFORCES (owner, 2026-09-07)
# --------------------------------------------
# PlantUML lives in `.puml` files. A `.md` file carries an ASCII diagram plus a
# pointer to its `.puml`, never an inline `@startuml` block. So this script
# checks `*.puml` directly, and FAILS if it finds PlantUML inlined in a `.md`.
#
# USAGE
#   bash render-check.sh            # check only
#   bash render-check.sh --out DIR  # also keep the SVGs in DIR
#
# EXIT 0 = every .puml rendered and no .md carries inline PlantUML.

set -uo pipefail
cd "$(dirname "$0")"

IMAGE="plantuml/plantuml:latest"
KEEP=""
[ "${1:-}" = "--out" ] && KEEP="${2:?--out needs a directory}"

rc=0

# --- convention check: no inline PlantUML in markdown ------------------------
inline="$(grep -l "@startuml" -- *.md 2>/dev/null || true)"
if [ -n "$inline" ]; then
  echo "CONVENTION FAIL - PlantUML is inlined in markdown:"
  echo "$inline" | sed 's/^/        /'
  echo "        Move each block to its own .puml and leave an ASCII diagram"
  echo "        plus a pointer in the .md."
  rc=1
fi

# --- Git Bash / MSYS path mangling ------------------------------------------
# MSYS rewrites any argument that looks like a Unix path before the child
# process sees it, so `-w /work` reaches docker as `C:/Program Files/Git/work`
# and every render fails for a reason unrelated to any diagram.
DOCKER_ENV=""
MOUNT="$PWD"
case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*)
    DOCKER_ENV="MSYS_NO_PATHCONV=1"
    MOUNT="$(cygpath -w "$PWD")"
    ;;
esac

OUTDIR=""
if [ -n "$KEEP" ]; then
  mkdir -p "$KEEP"
  case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*) OUTDIR="$(cygpath -w "$(cd "$KEEP" && pwd)")" ;;
    *) OUTDIR="$(cd "$KEEP" && pwd)" ;;
  esac
fi

total=0; failed=0
for f in *.puml; do
  [ -e "$f" ] || continue
  total=$((total + 1))
  # Rendered ONE AT A TIME on purpose: given a glob, plantuml reports
  # "Some diagram description contains errors" and "No diagram found" without
  # ever naming which file broke.
  if [ -n "$OUTDIR" ]; then
    err="$(env $DOCKER_ENV docker run --rm -v "$MOUNT:/work" -v "$OUTDIR:/out" -w /work \
             "$IMAGE" -tsvg -o /out "$f" 2>&1)"; st=$?
  else
    err="$(env $DOCKER_ENV docker run --rm -v "$MOUNT:/work" -w /work \
             "$IMAGE" -tsvg -o /tmp "$f" 2>&1)"; st=$?
  fi
  if [ "$st" -ne 0 ] || echo "$err" | grep -qiE "error|exception"; then
    echo "FAIL  $f"
    echo "$err" | sed 's/^/        /'
    failed=$((failed + 1))
  else
    echo "ok    $f"
  fi
done

echo "---"
if [ "$total" -eq 0 ]; then
  echo "No .puml files found - nothing to check. That is almost certainly wrong."
  exit 1
fi
if [ "$failed" -eq 0 ] && [ "$rc" -eq 0 ]; then
  echo "$total/$total rendered, convention clean."
  exit 0
fi
[ "$failed" -gt 0 ] && echo "$failed of $total FAILED."
exit 1
