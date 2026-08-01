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
- The repo root is one project template: clone it per project and fill the phase folders. `example/` is a filled sample.
- "Implementation" and "Testing" below mean the DOCUMENTATION and TRACEABILITY of build and test work, linked by ID to code, PRs, and test cases that live in the project's own codebase.

Two axes
--------
- Phase folders (`0-planning/` .. `6-testing/`) hold each phase's registries and cross-cutting artifacts.
- `modules/<Module>/` holds one module's detail files (FR / UC / UI / Entities). A registry row points into the module folder by ID.

Phase 0 - Planning
------------------
- Produces: project charter, stakeholders, milestones, risks, decisions, issues.
- Location: `0-planning/` (`Charter.md`, `Stakeholders.md`, `Milestones.md`, `Risks.md`, `Decisions.md`, `Issues.md`).
- DoD: charter approved; scope (in/out) stated; stakeholders and risks registered; success criteria measurable.

Phase 1 - Analysis
------------------
- Produces: normalized, atomic requirement candidates classified as FR / UC / NFR / Gap / Entity, with ambiguities and a traceability preview.
- Location: `1-analysis/Analysis.md`.
- Owning standard: `ANALYSIS-STANDARD.md`.
- DoD: every candidate classified; open questions logged; file-by-file update plan listed; no hidden assumptions. Unresolved items stay Draft.

Phase 2 - Requirements
----------------------
- Produces: Functional Requirements, Use Cases, and Non-Functional Requirements.
- Location: `2-requirements/FRs.md` + `modules/<Module>/FR-*.md`; `2-requirements/UCs.md` + `modules/<Module>/UC-*.md`; `2-requirements/NFRs.md`.
- Owning standards: `WORKFLOWS.md`, `QUALITY-GUIDE.md`, `SCHEMA.md`.
- DoD: FRs atomic and testable ("system shall ..."); UCs have actors/trigger/preconditions/flows/postconditions; reciprocal FR<->UC links; impacted NFR IDs referenced in UC section 9; registry rows in sync with detail files.

Phase 3 - UX
------------
- Produces: personas, user flows, screens (UI specs), a design-system reference, accessibility criteria, and usability test plans.
- Location: `3-ux/Screens.md` (UI registry) + `modules/<Module>/UI-*.md` (screen specs); `3-ux/Personas.md`, `UserFlows.md`, `DesignSystem.md`, `Accessibility.md`, `UsabilityTests.md`, `Wireframes/`.
- Owning standard: `UX-STANDARD.md`.
- DoD: every Must FR with a user-facing surface has >= 1 registered screen (states, related FR/UC, mockup link); personas, primary flows, and the a11y target recorded; each flow/mockup reviewed (LLM drafts asserted, not trusted).

Phase 4 - Design and Modeling
-----------------------------
- Produces: entity/data model (DDT + PlantUML) and behavioral/structural diagrams.
- Location: `modules/<Module>/Entities.md` (classification + attribute-level DDT + PlantUML) + `4-design/Entities.md` (cross-module registry); `4-design/Diagrams/` (ERD, sequence, state, architecture).
- Owning standards: `ENTITY-GUIDE.md`, `4-design/Diagrams/README.md`.
- DoD: every entity appears in a DDT row AND the module PlantUML, classified Core/Column/Complementary, registered in `4-design/Entities.md` with source FR/UC; each diagram reviewed for correctness (LLM-drafted diagrams must be asserted, not trusted).

Phase 5 - Implementation (traceability)
---------------------------------------
- Produces: the mapping from Approved requirements to the code that builds them. No code lives in this repo.
- Location: `5-implementation/Traceability.md` (overview) and the Traceability section of each `modules/<Module>/FR-*.md` (Design Components, Related FRs, and links to code / PR / commit references).
- Owning standard: `SCHEMA.md` (traceability rules).
- DoD: each Approved FR/UC links to its design components and, where known, the implementing code/PR and test IDs.
- Status note: there is NO "Implemented" status. The canonical set is Draft | In Review | Approved | Deprecated. Build progress is tracked by traceability links, not by a status value. Do not add an Implemented status - CI rejects it.

Phase 6 - Testing
-----------------
- Produces: a test-case registry linking verification back to requirements.
- Location: `6-testing/TestCases.md` (rows keyed `TC-<Area>-NNN`, each citing the FR/UC/UI IDs it verifies). The Given/When/Then acceptance criteria inside each FR are the test basis.
- Owning standards: `QUALITY-GUIDE.md`, `SCHEMA.md`.
- DoD: every Must FR has >= 1 TC; each TC cites its FR/UC (and screen where a UI test); happy, boundary, and failure paths covered; TC IDs back-referenced in the FR Traceability section.

Traceability spine (all phases)
-------------------------------
Charter scope -> Analysis candidate -> FR/UC (+ NFR refs) -> Screen (UI) -> Entity/Diagram -> Design component / code ref -> Test case.
Every link is by ID and reciprocal. A phase is not done while its outward links are missing.
