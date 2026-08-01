# Claude Code integration (`.claude/`)

This directory makes the repo's documentation methodology usable from
[Claude Code](https://claude.ai/code) with zero setup: the phase skills
auto-activate and purpose-built subagents are available when you work inside a
project's doc tree here.

## Layout

| Path | What it is |
|------|------------|
| `.claude/skills/` | The 7 phase skills + the `document-software-project` umbrella, auto-discovered project-locally by Claude Code |
| `.claude/agents/` | Claude-native subagents (one driver per phase + an orchestrator + a read-only quality reviewer) |
| `.claude/worktrees/` | Local git worktrees (ignored; not tracked) |

The GitHub Copilot versions of the agent roster live in `.github/agents/`.

## Skills

The phase skills live here as `<name>/SKILL.md` and auto-activate
project-locally when you work in the repo with Claude Code. `README.md`,
`CLAUDE.md`, and `automation/` reference them at `.claude/skills/`.

(Or copy/symlink `.claude/skills/*` into your global `~/.claude/skills/`
instead -- see the `document-software-project` skill's "Install" note.)

## Agents

One subagent drives each lifecycle phase; `doc-orchestrator` sequences them and
`doc-quality-reviewer` gates the result. Each subagent invokes its matching
skill and enforces the repo guardrails.

| Subagent | Phase | Drives skill |
|----------|-------|--------------|
| `doc-orchestrator` | All (umbrella) | `document-software-project` |
| `doc-planner` | 0 Planning | `doc-planning` |
| `doc-analyst` | 1 Analysis | `doc-analysis` |
| `doc-requirements-engineer` | 2 Requirements | `doc-requirements` |
| `doc-ux-designer` | 3 UX | `doc-ux` |
| `doc-modeler` | 4 Design and Modeling | `doc-design` |
| `doc-traceability-recorder` | 5 Implementation | `doc-implementation` |
| `doc-test-designer` | 6 Testing | `doc-testing` |
| `doc-quality-reviewer` | Cross-cutting gate | reviews against the standards |

## Usage

- Just describe the task ("document this feature", "write the FRs for X",
  "model these entities") -- the phase skills trigger on intent, and the main
  agent can hand a scoped phase to the matching subagent.
- Or start with `doc-orchestrator` when the phase is unclear or you want the
  full lifecycle sequenced end-to-end.
- All work stays under the active project root (the repo root is one project
  template; clone it per project). Get the docs-quality CI gate green before a PR
  to `main` (see `CLAUDE.md`).
