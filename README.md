# Awesome SWE Methodology Docs

## Purpose

A **methodology and template** for documenting a software project across its full
SDLC - from planning to testing - as one traceable, self-contained tree. The repo
root IS the template: clone it per project and fill the phase folders. See
`LIFECYCLE.md` for the phase model and `.claude/skills/` for the phase skills
(`document-software-project` orchestrates `doc-planning` -> `doc-testing`).

Everything about a project lives in one place, on two axes:

- **SDLC phases** (`0-planning/` .. `6-testing/`) hold each phase's registries and
  cross-cutting artifacts.
- **Modules** (`modules/<Module>/`) hold one module's detail files (FR / UC / UI /
  entities) together.

## Primary users

- SWEs and analysts authoring requirements, UX, and design artifacts.
- AI agents assisting with capture, normalization, and traceability.
- Project leads reviewing completeness and quality.

## Use it for a project

1. Create a repo from this template (or clone it) and pick a per-project DomainCode
   used in IDs (for example `ID`, `BI`).
2. Work the phases in `LIFECYCLE.md`, 0 -> 6. Clear the `XXX` placeholders; keep the
   templates, headers, and column order intact.
3. Keep IDs append-only and filenames matched to IDs.
4. `example/` is a filled worked sample; mirror its shape.

## Repository map

Standards (root, shared - read before large edits):

- `LIFECYCLE.md` - the seven SDLC phases (0-6), their artifacts and Definition of Done.
- `SCHEMA.md` - ID formats, status/priority enums, naming and traceability rules.
- `AGENTS.md` - agent guardrails and canonical vocabulary.
- `ANALYSIS-STANDARD.md` - required analysis workflow and output sections.
- `UX-STANDARD.md` - UX artifacts, screen IDs, and accessibility targets.
- `ENTITY-GUIDE.md` - entity documentation and PlantUML rules.
- `QUALITY-GUIDE.md` - quality checklist for FR/UC/UI/entity artifacts.
- `WORKFLOWS.md` - operational steps for common authoring activities.
- `PROMPTS.md` - prompt patterns for analysis and artifact drafting.

Phase folders (per project):

- `0-planning/` - charter, stakeholders, milestones, risks, **decisions**, **issues**.
- `1-analysis/` - `Analysis.md` classified candidates.
- `2-requirements/` - `FRs.md`, `UCs.md`, `NFRs.md` registries.
- `3-ux/` - `Screens.md` (UI registry), personas, user flows, design system,
  accessibility, usability tests, wireframes.
- `4-design/` - `Entities.md`, DDTs, DB schema, `Diagrams/` (ERD/sequence/state/architecture).
- `5-implementation/` - `Traceability.md` (FR -> design -> code/PR links).
- `6-testing/` - `TestCases.md`.

Modules (per project):

- `modules/<Module>/` - one module's `FR-*.md`, `UC-*.md`, `UI-*.md`, `Entities.md`.

Supporting:

- `example/` - a filled worked sample project (same layout).
- `.claude/` - Claude Code integration: `skills/` (phase SOPs) and `agents/` (phase drivers).
- `.github/` - CI (`workflows/docs-quality.yml`), expert-advisor agents, prompts, templates.
- `automation/`, `expert-opinion/` - automation notes and expert-review outputs.

## The traceability spine (all phases)

Charter scope -> Analysis candidate -> FR/UC (+ NFR refs) -> **Screen (UI)** ->
Entity/Diagram -> Design component / code ref -> Test case. Every link is by ID and
reciprocal. Your project's decisions, issues, features, and UIs each have one home:
`0-planning/Decisions.md`, `0-planning/Issues.md`, `2-requirements/FRs.md`,
`3-ux/Screens.md`.

## How to work (SWE and agent playbook)

### 1) Analyze first

- Normalize input into atomic candidates in `1-analysis/Analysis.md` before drafting FR/UC.

### 2) Keep IDs and filenames aligned

- One major artifact per file; filenames match IDs (`FR-ID-001.md`, `UI-ID-001.md`).
- Do not rename published IDs; append new IDs for changes.

### 3) Maintain registries and detail files together

- Every FR/UC/UI/entity detail file has a matching registry row.

### 4) Preserve templates

- Fill fields and add rows; avoid bulk rewrites.

### 5) Make traceability explicit

- UCs list FR IDs; FRs list UC IDs, screens, tests, design components; screens list
  the FR/UC they realize; gap rows cite FR/UC IDs.

## Canonical vocabulary

- Status: Draft | In Review | Approved | Deprecated.
- Priority: Must | Should | Could.

## Documentation skills (per lifecycle phase)

Use the skills in `.claude/skills/` as the standard operating procedure.
`document-software-project` is the umbrella orchestrator; each phase has its own skill:

- `doc-planning` - Phase 0 Planning
- `doc-analysis` - Phase 1 Analysis
- `doc-requirements` - Phase 2 Requirements
- `doc-ux` - Phase 3 UX
- `doc-design` - Phase 4 Design and Modeling
- `doc-implementation` - Phase 5 Implementation traceability
- `doc-testing` - Phase 6 Testing

They carry skill frontmatter and auto-activate in Claude Code from `.claude/skills/`.

## Contributing

- Keep edits focused and traceable; prefer append-only updates for IDs and registries.
- Ask for clarification when actor, trigger, acceptance criteria, priority, release,
  screen, or FR<->UC mapping is ambiguous.

## License

Apache License 2.0. See `LICENSE`.
