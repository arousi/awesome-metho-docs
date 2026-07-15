Software Documentation Lifecycle
================================

Purpose
-------
- Define the phases a software project's documentation moves through in this repo, from planning to testing.
- For each phase: what it produces, where the artifacts live, the owning standard, and its Definition of Done (DoD).
- Phases are cumulative, not strictly sequential; later phases refine earlier artifacts. Traceability links them.

Scope note
----------
- This repo documents software projects; it does not hold their source code.
- "Implementation" and "Testing" below mean the DOCUMENTATION and TRACEABILITY of build and test work, linked by ID to code, PRs, and test cases that live in the project's own codebase.

Paths
-----
- Shared methodology and standards live at the repo root and apply to every project.
- A project's artifacts live under its own tree: `projects/<slug>/` for a hosted project (see `projects/README.md`), with `example/` as the reference template.
- Paths below are relative to the active project root.

Phase 0 - Planning
------------------
- Produces: project charter, stakeholders, milestones, risks, decisions, issues.
- Location: `PM/` (`README.md` charter, `Stakeholders.md`, `Milestones.md`, `Risks.md`, `Decisions.md`, `Issues.md`).
- DoD: charter approved; scope (in/out) stated; stakeholders and risks registered; success criteria measurable.

Phase 1 - Analysis
------------------
- Produces: normalized, atomic requirement candidates classified as FR / UC / NFR / Gap / Entity, with ambiguities and a traceability preview.
- Location: `Analysis/Analysis.md`.
- Owning standard: `ANALYSIS-STANDARD.md`.
- DoD: every candidate classified; open questions logged; file-by-file update plan listed; no hidden assumptions. Unresolved items stay Draft.

Phase 2 - Requirements
---------------------
- Produces: Functional Requirements, Use Cases, and Non-Functional Requirements.
- Location: `FR-Registry/FRs.md` + `Packages/<Package>/FR-*.md`; `UC-Registry/UCs.md` + `Packages/<Package>/UC-*.md`; `NFRs.md`.
- Owning standards: `WORKFLOWS.md`, `QUALITY-GUIDE.md`, `SCHEMA.md`.
- DoD: FRs atomic and testable ("system shall ..."); UCs have actors/trigger/preconditions/flows/postconditions; reciprocal FR<->UC links; impacted NFR IDs referenced in UC section 9; registry rows in sync with detail files.

Phase 3 - Design and Modeling
----------------------------
- Produces: entity/data model (DDT + PlantUML) and behavioral/structural diagrams.
- Location: `Packages/<Package>/Entities.md` (classification + attribute-level DDT + PlantUML) + `Data/Entities.md` (cross-package registry); `Diagrams/` (ERD, sequence, state, architecture).
- Owning standards: `ENTITY-GUIDE.md`, `Diagrams/README.md`.
- DoD: every entity appears in a DDT row AND the package PlantUML, classified Core/Column/Complementary, registered in `Data/Entities.md` with source FR/UC; each diagram reviewed for correctness (LLM-drafted diagrams must be asserted, not trusted).

Phase 4 - Implementation (traceability)
--------------------------------------
- Produces: the mapping from Approved requirements to the code that builds them. No code lives in this repo.
- Location: the Traceability section of each `Packages/<Package>/FR-*.md` (Design Components, Related FRs, and links to code / PR / commit references).
- Owning standard: `SCHEMA.md` (traceability rules).
- DoD: each Approved FR/UC links to its design components and, where known, the implementing code/PR and test IDs.
- Status note: there is NO "Implemented" status. The canonical set is Draft | In Review | Approved | Deprecated. Build progress is tracked by traceability links, not by a status value. Do not add an Implemented status - CI rejects it.

Phase 5 - Testing
----------------
- Produces: a test-case registry linking verification back to requirements.
- Location: `Testing/TestCases.md` (rows keyed `TC-<Area>-NNN`, each citing the FR/UC IDs it verifies). The Given/When/Then acceptance criteria inside each FR are the test basis.
- Owning standards: `QUALITY-GUIDE.md`, `SCHEMA.md`.
- DoD: every Must FR has >= 1 TC; each TC cites its FR/UC; happy, boundary, and failure paths covered; TC IDs back-referenced in the FR Traceability section.

Traceability spine (all phases)
------------------------------
Charter scope -> Analysis candidate -> FR/UC (+ NFR refs) -> Entity/Diagram -> Design component / code ref -> Test case.
Every link is by ID and reciprocal. A phase is not done while its outward links are missing.
