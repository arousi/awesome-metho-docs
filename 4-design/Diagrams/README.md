Diagrams
========

Phase 4 diagrams: ERD, sequence, state, activity, and architecture. The
attribute-level schema lives in each `../../modules/<Module>/Entities.md`; the
cross-module registry is `../Entities.md` and the consolidated view is
`../Full-DB-Schema.md`.

Note: most LLMs get diagram logic wrong. A generated diagram is a prototype -
go over each one and assert its correctness before you rely on it.


PlantUML lives in `.puml` files. Markdown carries ASCII.
--------------------------------------------------------

One diagram per `.puml` file, kept in this folder. A `.md` file beside it holds
an **ASCII diagram** plus a pointer to its `.puml` source, and **never** an
inline `@startuml` block.

Three reasons, in the order they bite:

1. **An inline block cannot be rendered without being extracted first**, so in
   practice it is not rendered, so it is not checked. A diagram nobody has
   rendered is a guess about syntax as well as about content.
2. **The editor preview breaks on large diagrams, with a misleading error.**
   The common extension deflates the whole source into a GET URL, and a large
   diagram overruns the servlet container's max header size (8KB by default on
   both the Tomcat and Jetty PlantUML server images). It returns
   `HTTP 400 - Request header is too large`. That is a TRANSPORT limit, not a
   diagram error, and it hides real syntax errors behind a message that points
   nowhere near them.
3. **Markdown is read far more often than it is rendered.** A reader skimming
   a `.md` in a browser, a diff, or a terminal gets nothing at all from a
   fenced PlantUML block. ASCII costs the author ten minutes and pays every
   reader afterwards.

The ASCII is not a transcription of the `.puml`. The `.puml` is the lossless
source; the ASCII is what a person actually reads, so draw it so its SHAPE
carries the point. A state diagram's ASCII should make the missing transition
visible if the absence is the requirement. A sequence diagram's ASCII should
put the boundary that matters where the eye lands.


Verify before committing
------------------------

`render-check.sh` in this folder renders every `.puml` and fails the
convention if any `.md` still carries an inline block. Copy it into each
project's own `4-design/Diagrams/`.

    bash render-check.sh            # check
    bash render-check.sh --out svg  # check and keep the SVGs

It renders through the `plantuml/plantuml` CLI image rather than a PlantUML
server, deliberately: the CLI reads files, so there is no request header to
overrun and its exit code means what it says.

Two implementation details worth keeping if you adapt it:

- **Render one file at a time.** Given a glob, PlantUML reports
  `Some diagram description contains errors` and `No diagram found` without
  ever naming which file broke. One at a time gives you file and line.
- **Git Bash mangles container paths.** MSYS rewrites any argument that looks
  like a Unix path before the child process sees it, so `-w /work` reaches
  docker as `C:/Program Files/Git/work` and every render fails for a reason
  unrelated to any diagram. The script guards this with `MSYS_NO_PATHCONV=1`
  and `cygpath -w`, behind a `uname` check so it stays portable.


The failure this convention was written after
---------------------------------------------

A sequence diagram carried `note as N1`. That is valid PlantUML in a CLASS
diagram and invalid in a SEQUENCE diagram, where a note must anchor to a
participant (`note over X, Y`). It was authored, reviewed and committed inline
in a `.md` and nobody rendered it. The failure surfaced only when the product
owner opened it - and it surfaced as the HTTP 400 above, from a DIFFERENT
diagram in the same folder, which pointed attention at the server rather than
at the broken file.

Both problems have the same root: PlantUML that lives inside markdown does not
get rendered as part of authoring it.
