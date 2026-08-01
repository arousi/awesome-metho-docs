# CLAUDE.md

Guidance for AI agents working in this repository. Keep this file lean -- it loads into every session.

## What this is

`awesome-metho-docs` is a documentation **methodology and template** for software projects across the full SDLC (planning -> testing). The repo root IS one project template: clone it per project and fill the phase folders. It is NOT an application: every tracked file is Markdown, `.ods`, or CI config. There is no source code, build, test suite, or package manager. "Doing work" here means editing project documents under a strict schema.

## Lifecycle and layout

- Phases (see `LIFECYCLE.md`): 0 Planning (`0-planning/`) -> 1 Analysis (`1-analysis/`) -> 2 Requirements (`2-requirements/`) -> 3 UX (`3-ux/`) -> 4 Design and Modeling (`4-design/`) -> 5 Implementation traceability (`5-implementation/`) -> 6 Testing (`6-testing/`). Each phase has a Definition of Done; keep traceability by ID across phases.
- Two axes: phase folders hold each phase's registries and cross-cutting artifacts; `modules/<Module>/` holds one module's detail files (`FR-*.md`, `UC-*.md`, `UI-*.md`, `Entities.md`). A registry row points into the module by ID.
- `example/` is a filled worked sample (same layout).
- Skills live in `.claude/skills/`: `document-software-project` (umbrella) routes to one decoupled skill per phase - `doc-planning`, `doc-analysis`, `doc-requirements`, `doc-ux`, `doc-design`, `doc-implementation`, `doc-testing`. Agents (phase drivers) live in `.claude/agents/`.

## Hard rules (do not break)

- Append-only IDs: never rename or delete a published ID; add a new ID for changes. Filename must match its ID (e.g. `FR-ID-001.md`, `UI-ID-001.md`).
- Preserve templates: fill fields and append rows only. No bulk rewrites or template reshaping.
- ASCII only. Do not introduce non-ASCII characters (use `<->`, `>=`, `->`, not arrows or symbols).
- One major artifact per file; every FR/UC/UI file has a matching registry row -- keep both in sync.
- Reciprocal traceability: UCs list related FR IDs; FRs list related UC IDs, screens, tests, and design components; screens list the FR/UC they realize.
- When actor / trigger / acceptance criteria / priority / release / screen / FR-UC mapping is unclear, ASK. Do not speculate; keep unresolved items in Draft.

## Canonical vocabulary

- Status: `Draft | In Review | Approved | Deprecated` (exactly these four).
- Priority: `Must | Should | Could`.

## Artifact pipeline

Analysis (`1-analysis/Analysis.md`) -> FR/UC -> Screens (UI) -> Entities (DDT + PlantUML) -> NFR refs -> traceability.

- Analyze first: normalize raw input into atomic candidates in `1-analysis/Analysis.md` before drafting FR/UC files.
- FRs: testable "system shall ..." statements; acceptance criteria as Given/When/Then (happy, boundary, failure).
- UCs: actors, trigger, preconditions, main flow (3-7 steps), alternates, postconditions; reference impacted NFR IDs in section 9.
- Screens (UI): one spec per `modules/<Module>/UI-*.md`, registered in `3-ux/Screens.md`, realizing FR/UC IDs.
- Entities: attribute-level DDT rows (Key / Data Type / Not Null / Length / FK Table / Description) plus a PlantUML diagram covering the same entity set; classify each as Core / Column / Complementary; register in `4-design/Entities.md`.

## Where things live

- Standards (read before large edits): `SCHEMA.md` (IDs + enums), `AGENTS.md` (guardrails), `LIFECYCLE.md` (phases + DoD), `ANALYSIS-STANDARD.md`, `UX-STANDARD.md`, `WORKFLOWS.md` (per-task steps), `QUALITY-GUIDE.md`, `ENTITY-GUIDE.md`, `.claude/skills/` (per-phase SOP; umbrella at `.claude/skills/document-software-project/SKILL.md`).
- Registries: `2-requirements/FRs.md`, `2-requirements/UCs.md`, `3-ux/Screens.md`, `4-design/Entities.md`, `1-analysis/Analysis.md`, `6-testing/TestCases.md`.
- Detail files: `modules/<Module>/FR-*.md`, `modules/<Module>/UC-*.md`, `modules/<Module>/UI-*.md`, `modules/<Module>/Entities.md`.
- AI tooling: `.claude/agents/*` (phase drivers) and `.claude/skills/*` (phase SOPs); `.github/agents/*.agent.md` (Copilot expert-advisor agents), `.github/prompts/*.prompt.md`.
- `example/` is a filled reference sample, not live content.

## CI gate

`.github/workflows/docs-quality.yml` runs on every PR to `main`, over changed `.md` files only:

1. markdownlint (`markdownlint-cli2`, globs `**/*.md` except `LICENSE`).
2. `Status:` lines must be `Draft|In Review|Approved|Deprecated`.
3. `Priority:` lines must be `Must|Should|Could`.
4. `FR-*.md` must reference a `UC-*` ID; `UC-*.md` must reference an `FR-*` ID.

Get it green locally before opening a PR. Because it is diff-scoped, editing a file can surface pre-existing violations in that file.
