# CLAUDE.md

Guidance for AI agents working in this repository. Keep this file lean -- it loads into every session.

## What this is

`awesome-metho-docs` is (1) a documentation **methodology** for software projects across the full lifecycle (planning -> testing) and (2) a **hub** hosting many projects' docs. It is NOT an application: every tracked file is Markdown, `.ods`, or CI config. There is no source code, build, test suite, or package manager. "Doing work" here means editing project documents under a strict schema.

## Lifecycle and layout

- Phases (see `LIFECYCLE.md`): 0 Planning (`PM/`) -> 1 Analysis (`Analysis/`) -> 2 Requirements (FR/UC/NFR) -> 3 Design and Modeling (Entities + `Diagrams/`) -> 4 Implementation traceability -> 5 Testing (`Testing/TestCases.md`). Each phase has a Definition of Done; keep traceability by ID across phases.
- Each hosted project is self-contained under `projects/<slug>/` (see `projects/README.md`), mirroring `example/`. The root standards apply to every project. Root-level `Analysis/`, `FR-Registry/`, `Package1..3/`, `PM/`, `NFRs.md` currently double as the reference template.
- Skills live in `skills/`: `document-software-project` (umbrella) routes to one decoupled skill per phase - `doc-planning`, `doc-analysis`, `doc-requirements`, `doc-design`, `doc-implementation`, `doc-testing`. Each elicits from the SWE and writes only its phase's artifacts.

## Hard rules (do not break)

- Append-only IDs: never rename or delete a published ID; add a new ID for changes. Filename must match its ID (e.g. `FR-ID-001.md`).
- Preserve templates: fill fields and append rows only. No bulk rewrites or template reshaping.
- ASCII only. Do not introduce non-ASCII characters (use `<->`, `>=`, not arrows or symbols).
- One major artifact per file; every FR/UC file has a matching registry row -- keep both in sync.
- Reciprocal traceability: UCs list related FR IDs; FRs list related UC IDs, tests, and design components.
- When actor / trigger / acceptance criteria / priority / release / FR-UC mapping is unclear, ASK. Do not speculate; keep unresolved items in Draft.

## Canonical vocabulary

- Status: `Draft | In Review | Approved | Deprecated` (exactly these four).
- Priority: `Must | Should | Could`.
- WARNING: `SCHEMA.md` and `README.md` still list a stale 5th status, `Implemented`. Do NOT use it -- CI rejects it (see CI gate).

## Artifact pipeline

Analysis (`Analysis/Analysis.md`) -> FR/UC -> Entities (DDT + PlantUML) -> NFR refs -> traceability.

- Analyze first: normalize raw input into atomic candidates in `Analysis/Analysis.md` before drafting FR/UC files.
- FRs: testable "system shall ..." statements; acceptance criteria as Given/When/Then (happy, boundary, failure).
- UCs: actors, trigger, preconditions, main flow (3-7 steps), alternates, postconditions; reference impacted NFR IDs in section 9.
- Entities: attribute-level DDT rows (Key / Data Type / Not Null / Length / FK Table / Description) plus a PlantUML diagram covering the same entity set; classify each as Core / Column / Complementary; register in `Data/Entities.md`.

## Where things live

- Standards (read before large edits): `SCHEMA.md` (IDs + enums), `AGENTS.md` (guardrails), `LIFECYCLE.md` (phases + DoD), `ANALYSIS-STANDARD.md`, `WORKFLOWS.md` (per-task steps), `QUALITY-GUIDE.md`, `ENTITY-GUIDE.md`, `skills/` (per-phase SOP; umbrella at `skills/document-software-project/SKILL.md`).
- Hosted projects: `projects/<slug>/...` (see `projects/README.md`). Paths below are relative to the active project root.
- Registries: `FR-Registry/FRs.md`, `UC-Registry/UCs.md`, `Data/Entities.md`, `Analysis/Analysis.md`, `Testing/TestCases.md`.
- Detail files: `Packages/<Package>/FR-*.md`, `Packages/<Package>/UC-*.md`, `Packages/<Package>/Entities.md`.
- AI tooling: `.github/agents/*.agent.md` (Copilot custom agents; only `requirements-engineer` orchestrates subagents), `.github/prompts/*.prompt.md`.
- `example/` is the reference template, not live content.

## CI gate

`.github/workflows/docs-quality.yml` runs on every PR to `main`, over changed `.md` files only:

1. markdownlint (`markdownlint-cli2`, globs `**/*.md` except `LICENSE`).
2. `Status:` lines must be `Draft|In Review|Approved|Deprecated`.
3. `Priority:` lines must be `Must|Should|Could`.
4. `FR-*.md` must reference a `UC-*` ID; `UC-*.md` must reference an `FR-*` ID.

Get it green locally before opening a PR. Because it is diff-scoped, editing a file can surface pre-existing violations in that file.
