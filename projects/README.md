Projects Hub
============

Purpose
-------
This directory holds the documentation of individual software projects. Each project has its own self-contained tree and follows the shared methodology at the repo root (`SCHEMA.md`, `AGENTS.md`, `ANALYSIS-STANDARD.md`, `WORKFLOWS.md`, `QUALITY-GUIDE.md`, `ENTITY-GUIDE.md`, `LIFECYCLE.md`) and the skills in `skills/` (umbrella `skills/document-software-project/SKILL.md`).

Layout
------
```
projects/
  <project-slug>/
    PM/                     Planning: charter, stakeholders, milestones, risks, decisions, issues
    Analysis/Analysis.md    Analysis registry
    NFRs.md                 Non-functional requirements catalog
    FR-Registry/FRs.md      Functional requirement registry
    UC-Registry/UCs.md      Use case registry
    Data/Entities.md        Cross-package entity registry
    Packages/
      <PackageName>/
        FR-*.md             One functional requirement per file
        UC-*.md             One use case per file
        Entities.md         Package entity classification + DDT + PlantUML
    Diagrams/               ERD / sequence / state / architecture diagrams
    Testing/TestCases.md    Test-case registry (TC-<Area>-NNN) linked to FR/UC IDs
```

Add a new project
-----------------
1. Choose a short kebab-case `<project-slug>` and a per-project DomainCode used in IDs (e.g. ID, BI).
2. Create `projects/<project-slug>/` with the layout above. Use `example/` for the annotated folder structure and sample package files; copy the working registry/template files from the repo-root instance (`Analysis/Analysis.md`, `FR-Registry/FRs.md`, `UC-Registry/UCs.md`, `Data/Entities.md`, `NFRs.md`, `PM/`) and `Testing/TestCases.md` from `example/Testing/`.
3. Clear the sample rows and the `XXX` placeholders; keep the templates, headers, and column order intact.
4. Work the phases in `LIFECYCLE.md`, phase 0 -> 5. Keep IDs append-only and filenames matched to IDs.

Rules (per project)
-------------------
- Each project is self-contained under its slug; do not share IDs or registries across projects.
- Follow the root standards; do not copy them into the project tree.
- Canonical Status: Draft | In Review | Approved | Deprecated. Canonical Priority: Must | Should | Could.
- The Docs Quality CI (`.github/workflows/docs-quality.yml`) applies to all `*.md`, project trees included.
