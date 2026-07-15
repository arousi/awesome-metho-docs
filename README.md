# Awesome SWE Methodology Docs

## Purpose

This repository is two things:

1. A **methodology** for documenting a software project across its full lifecycle - from planning to testing. See `LIFECYCLE.md` for the phase model and `skills/` for the phase skills agents and contributors follow (`document-software-project` orchestrates `doc-planning` -> `doc-testing`).
2. A **multi-project hub**: it hosts the documentation of many software projects, each self-contained under `projects/<slug>/` and following the same methodology. See `projects/README.md`.

It helps teams and agents produce, per project and per phase:

- Planning/charter records (`PM/`)
- Requirements analysis records (`Analysis/`)
- Functional Requirements (FRs)
- Use Cases (UCs)
- Non-Functional Requirements (NFRs)
- Entity documentation (Data Dictionary Table + Class Diagram in PlantUML)
- Diagrams (ERD, sequence, state, architecture)
- Implementation traceability and test-case registries
- Gap analysis inputs

## Primary users

- SWEs and analysts authoring requirements artifacts.
- AI agents assisting with capture, normalization, and traceability.
- Project leads reviewing completeness and quality.

## Start here in 5 minutes

1) Open `Analysis/Analysis.md` and add one Draft analysis row for your incoming requirement source.
2) Add any required FR and UC registry rows in `FR-Registry/FRs.md` and `UC-Registry/UCs.md`.
3) Create or update one FR file and one UC file in the target package (`PackageX/`).
4) Add or update entities in `PackageX/Entities.md` and mirror package mapping in `Data/Entities.md`.
5) In the UC, reference impacted NFR IDs from `NFRs.md`.
6) Run a quick traceability pass: FR <-> UC links present on both sides, IDs match filenames, status/priority are canonical.

## Quick start

1) Start in `Analysis/Analysis.md` and capture incoming requirement input.
2) Register or update entities in `Data/Entities.md` and in the target `PackageX/Entities.md`.
3) Add FR rows to `FR-Registry/FRs.md` and UC rows to `UC-Registry/UCs.md`.
4) Create or update detailed FR/UC files in the target package folder.
5) Add impacted NFR IDs from `NFRs.md` to UC section 9.
6) Ensure reciprocal traceability (FR <-> UC <-> tests/design where known).

## Repository map

Top-level standards and controls:
- `AGENTS.md` - agent guardrails and canonical vocabulary.
- `SCHEMA.md` - ID formats, status/priority enums, naming and traceability rules.
- `LIFECYCLE.md` - the six SDLC phases (planning -> testing), their artifacts and Definition of Done.
- `QUALITY-GUIDE.md` - quality checklist for FR/UC/entity artifacts.
- `ANALYSIS-STANDARD.md` - required analysis workflow and output sections.
- `WORKFLOWS.md` - operational steps for common authoring activities.
- `PROMPTS.md` - prompt patterns for analysis and artifact drafting.

Multi-project hub:
- `projects/` - one self-contained doc tree per hosted software project (`projects/<slug>/`). See `projects/README.md`.
- Root-level `Analysis/`, `FR-Registry/`, `UC-Registry/`, `Data/`, `Package1..3/`, `PM/`, `NFRs.md` currently serve as the reference template alongside `example/`.

## Core working artifacts:

- `Analysis/Analysis.md` - analysis registry + template.
- `NFRs.md` - project-level NFR catalog.
- `FR-Registry/FRs.md` - FR registry and FR template section.
- `UC-Registry/UCs.md` - UC registry and UC template section.
- `Data/Entities.md` - cross-package entity registry + DDT template.
- `ENTITY-GUIDE.md` - entity documentation and PlantUML rules.

## Package-level artifacts

- `Package1/`, `Package2/`, `Package3/` - domain modules for FR/UC/entity detail files.
- `PackageX/Entities.md` - package entity classification, DDT rows, PlantUML.
- `PackageX/FR-*.md` - one FR per file.
- `PackageX/UC-*.md` - one UC per file.

## Supporting areas

- `Diagrams/` - storage for behavioral/structural visual artifacts.
- `PM/README.md` - project-charter style baseline template.
- `example/` - sample project structure and reference artifacts.
- `automation/` - automation and lint ideas for documentation workflow.

## How to work (SWE and agent playbook)

### 1) Analyze first

- Do not draft FR/UC files directly from raw notes.
- Normalize input into atomic candidates in `Analysis/Analysis.md`.

### 2) Keep IDs and filenames aligned

- One major artifact per file.
- Filenames must match IDs (for example: `FR-ID-001.md`, `UC-ID-Login.md`).
- Do not rename published IDs; append new IDs for changes.

### 3) Maintain registries and detail files together

- Every FR/UC file must have a corresponding registry row.
- Every new entity used in FR/UC flows must be reflected in entity registries.

### 4) Preserve templates

- Fill fields and add rows.
- Avoid bulk rewrites or template reshaping.

### 5) Make traceability explicit

- UCs list related FR IDs.
- FRs list related UC IDs, tests, and design components when known.
- Gap rows cite FR/UC IDs.

## Canonical vocabulary

- Status: Draft | In Review | Approved | Implemented | Deprecated.
- Priority: Must | Should | Could.

Note: some templates may still include `Implemented`; use the canonical set above unless your project explicitly extends it.

## Documentation skills (per lifecycle phase)

Use the skills in `skills/` as the standard operating procedure for documenting a project here. `skills/document-software-project/SKILL.md` is the umbrella orchestrator; each lifecycle phase has its own decoupled skill that elicits from the SWE and writes only that phase's artifacts:

- `doc-planning` - Phase 0 Planning
- `doc-analysis` - Phase 1 Analysis
- `doc-requirements` - Phase 2 Requirements
- `doc-design` - Phase 3 Design and Modeling
- `doc-implementation` - Phase 4 Implementation traceability
- `doc-testing` - Phase 5 Testing

They carry skill frontmatter; copy or symlink `skills/*` into a Claude Code skills root (`~/.claude/skills/`) to auto-activate.

## It contains:

- A folder/file map with the intent of each location.
- Step-by-step instructions for which file to update for each task.
- Do/Do-not guardrails for safe edits.
- A completion checklist for handoff quality.

## Contributing

- Keep edits focused and traceable.
- Prefer append-only updates for IDs and registries.
- Ask for clarification when actor, trigger, acceptance criteria, priority, release, or FR<->UC mapping is ambiguous.

## License

Apache License 2.0. See `LICENSE`.