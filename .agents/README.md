# Portable agent roster (`.agents/`)

Tool-neutral charters for the subagents that document a software project the
methodological way in this repo. These are the canonical, portable role
definitions -- plain Markdown any agent runtime or human can read. They say
*what each role is, when to use it, what it owns, and where it stops*; the
*how* lives in the phase skills under `skills/`.

Each role has three homes. Keep them in step when a charter changes:

| Home | Format | Read by |
|------|--------|---------|
| `.agents/*.md` | Portable charter (this dir) | Humans and any tool; the source of truth for the role |
| `.claude/agents/*.md` | Claude Code subagent (frontmatter + system prompt + tools) | Claude Code (`Task`/subagent spawn) |
| `.github/agents/*.agent.md` | GitHub Copilot custom agent | Copilot |

The operating procedure each role follows is the matching skill in `skills/`
(mirrored into `.claude/skills/` for Claude Code auto-activation). Charters do
not restate the skill -- they point to it.

## Roster

| Role | Phase | Drives skill | Claude agent | Closest Copilot agent |
|------|-------|--------------|--------------|-----------------------|
| `doc-orchestrator` | All (umbrella) | `document-software-project` | `.claude/agents/doc-orchestrator.md` | `requirements-engineer` |
| `doc-planner` | 0 Planning | `doc-planning` | `.claude/agents/doc-planner.md` | `planner` |
| `doc-analyst` | 1 Analysis | `doc-analysis` | `.claude/agents/doc-analyst.md` | `business-analyst` |
| `doc-requirements-engineer` | 2 Requirements | `doc-requirements` | `.claude/agents/doc-requirements-engineer.md` | `requirements-engineer` |
| `doc-modeler` | 3 Design and Modeling | `doc-design` | `.claude/agents/doc-modeler.md` | `diagrammer`, `architect`, `senior-database-engineer` |
| `doc-traceability-recorder` | 4 Implementation | `doc-implementation` | `.claude/agents/doc-traceability-recorder.md` | `software-architect` |
| `doc-test-designer` | 5 Testing | `doc-testing` | `.claude/agents/doc-test-designer.md` | (none) |
| `doc-quality-reviewer` | Cross-cutting gate | (reviews all) | `.claude/agents/doc-quality-reviewer.md` | `senior-software-engineer-critical` |

`doc-orchestrator` sequences the phases (0 -> 5) and hands each to its driver;
`doc-quality-reviewer` verifies the output before a PR. Phases are cumulative
and may loop -- testing or implementation can surface new candidates that
re-enter analysis.

## Specialist consultants (Copilot-side only, not phase drivers)

The `.github/agents/` set also carries advisory consultants that are not part of
the phase pipeline and are not mirrored here: the ISO experts (`iso-9001-qms`,
`iso-27001-security`, `iso-15489-records`, `iso-22301-continuity`,
`iso-30301-governance`), `bpmn-2-process-architecture-expert`, `sqler`, and
`senior-software-architect-final-decision`. Summon them for opinions; they do
not own a lifecycle phase.

## Shared guardrails (every role)

- Append-only IDs; filename matches the ID; no rename/delete of a published ID.
- Preserve templates: fill fields, append rows, no bulk rewrites.
- ASCII only (`<->`, `>=`, not arrows/symbols).
- Reciprocal traceability: UCs list FR IDs; FRs list UC IDs, tests, design
  components.
- Canonical Status `Draft | In Review | Approved | Deprecated` (no
  `Implemented`); Priority `Must | Should | Could`.
- Ask -- do not speculate; keep unresolved items in `Draft`.

See `AGENTS.md`, `SCHEMA.md`, and `LIFECYCLE.md` at the repo root for the full
standards.
