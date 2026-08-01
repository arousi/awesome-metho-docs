Requirements Analysis Standard
==============================

Purpose
-------
- Define a consistent way to analyze incoming requirements before creating or updating FRs, UCs, NFR references, and gap rows.
- Ensure outputs are testable, traceable, and review-ready.

Scope
-----
- Applies to new requirements, change requests, and gap-analysis inputs.
- Applies to human contributors (SWEs/BAs/PMs) and AI agents.
- Default working artifact: 1-analysis/Analysis.md.

Roles
-----
- Analyst (SWE or agent): performs analysis and drafts artifacts.
- Reviewer (lead/owner): validates ambiguity handling, traceability, and acceptance criteria quality.
- Approver (product/stakeholder): confirms priority, scope, and readiness.

Required Inputs
---------------
- Source material (notes, ticket, PRD, workshop output, migration findings).
- Domain/module target.
- Known constraints (security, compliance, integration, timeline).
- Stakeholder list or owner.

Analysis Workflow
-----------------
1) Intake and normalize
   - Capture source reference and date.
   - Create or update an analysis entry in 1-analysis/Analysis.md.
   - Split composite statements into atomic requirements.
   - Mark each candidate as FR, UC detail, NFR impact, gap item, or entity candidate.

2) Classify and assign IDs
   - Reuse existing IDs when refining an existing artifact.
   - Create new IDs only for net-new behavior.
   - Keep filename-to-ID matching.

3) Quality shaping
   - FR wording uses testable "system shall" statements.
   - UCs include actors, trigger, preconditions, main flow, alternates, postconditions.
   - NFR impacts reference IDs from 2-requirements/NFRs.md.
   - Acceptance criteria use Given/When/Then with happy, boundary, and failure coverage where relevant.

4) Traceability and coverage
   - Link UC to related FR IDs.
   - Link FR to UC IDs, related FRs, tests, and design components when known.
   - For gaps, include FR/UC IDs in the gap register row.
   - Link entities to source FR/UC IDs and module mappings in 4-design/Entities.md.
   - Keep module-level DDT and PlantUML in modules/<Module>/Entities.md synchronized.

5) Ambiguity resolution
   - Record open questions explicitly.
   - Ask for clarification when actors, triggers, acceptance criteria, priority, release, or FR-to-UC mapping is unclear.
   - Do not speculate; keep unresolved items in Draft.

Required Analysis Output
------------------------
Provide these sections in every analysis handoff:

- Record the handoff in 1-analysis/Analysis.md unless a project-specific analysis file is explicitly required.

1) Source Summary
   - Input source(s), date, scope, and assumptions.

2) Candidate Requirement Table

| Ref | Candidate ID | Type (FR/UC/NFR/Gap/Entity) | Normalized Statement | Priority | Status |
|-----|--------------|-----------------------------|----------------------|----------|--------|
| SRC-1 | FR-... / UC-... | | | | |

3) Ambiguity and Questions

| # | Item | Why ambiguous | Proposed options | Needed from |
|---|------|---------------|------------------|-------------|
| 1 |      |               |                  |             |

4) Traceability Preview

| Artifact | Links to | Missing links |
|----------|----------|---------------|
| FR-...   | UC-..., TC-... | NFR ID, Design Component |

5) Recommended Next Actions
   - List exact file updates (registries, module files, NFR references, gap rows, entity files).

Quality Gates (Pass/Fail)
-------------------------
- Atomicity: one behavior per FR statement.
- Testability: acceptance criteria are measurable and verifiable.
- Traceability: FR<->UC links present; NFR IDs referenced where applicable.
- Entity completeness: entity set is captured in entity classification + attribute-level DDT and mirrored in PlantUML.
- Consistency: IDs, filenames, and registry rows align.
- Vocabulary: status and priority follow canonical enums defined in SCHEMA.md.
- Completeness: open questions listed; no hidden assumptions.

Definition of Done for Analysis
-------------------------------
- Candidate set is classified (FR/UC/NFR/Gap/Entity).
- Required clarifications are captured.
- Proposed artifact updates are listed file-by-file.
- Traceability preview has no critical missing links.
- Reviewer can approve or request changes without re-reading raw source material.

Agent Execution Notes
---------------------
- Prefer drafts over speculative completion.
- Preserve templates; fill fields and add rows only.
- Do not delete IDs or rename published artifacts.
- Keep outputs concise and ASCII.