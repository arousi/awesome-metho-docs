Agent Workflows
===============

Analyze incoming requirements
-----------------------------
1) Ask the swe questions to help you understand the requirement.

2) Create or update an entry in 1-analysis/Analysis.md.
3) Capture source input, date, and module/domain context, then split into atomic candidate items and classify each as FR, UC detail, NFR impact, or gap.
4) Identify entities and classify each per module as Core, Column, or Complementary.
5) Update 4-design/Entities.md and modules/<Module>/Entities.md (Entity Classification + DDT + PlantUML) for identified entities.
6) Identify missing details (actors, trigger, acceptance criteria, priority, release, FR/UC mapping, entity ownership).
7) Fill analysis output sections in 1-analysis/Analysis.md: candidate table, ambiguity list, traceability preview, recommended file updates.
8) Resolve or log open questions before promoting artifacts beyond Draft.

Create a new FR
---------------
1) Confirm FR candidate and priority from 1-analysis/Analysis.md.
2) Add row to 2-requirements/FRs.md with ID, module, title, status Draft, priority.
3) Copy a module FR template to a new file named after the ID.
4) Fill Description (“system shall…”), Rationale, Acceptance Criteria (≥2), Constraints, Traceability (UC IDs, tests, related FRs).
5) Ensure related entities are present in modules/<Module>/Entities.md and 4-design/Entities.md.
6) If gaps exist, add gap matrix row referencing this FR.
7) Update status when reviewed/approved.

Create a new UC
---------------
1) Confirm UC candidate and related FRs from 1-analysis/Analysis.md.
2) Add row to 2-requirements/UCs.md with ID, title, domain, actors, status Draft.
3) Copy a module UC template to a new file named after the ID.
4) Fill actors, trigger, preconditions, main flow (3–7 steps), alternates, postconditions, business rules, impacted NFRs, related FRs.
5) Ensure FR files list this UC in their traceability tables.
6) Ensure entity usage in the flow is reflected in modules/<Module>/Entities.md and 4-design/Entities.md.

Maintain entities
-----------------
1) Update Entity Classification rows in modules/<Module>/Entities.md with module role (Core/Column/Complementary) and source FR/UC links.
2) Update DDT rows in modules/<Module>/Entities.md at attribute/column level with: Key (PK/FK/-), Data Type, Not Null (Y/N), Length, FK Table, Description.
3) Keep PlantUML diagrams in modules/<Module>/Entities.md aligned with DDT rows.
4) Update 4-design/Entities.md to map each entity to module(s) and diagram reference.
5) Do not leave entities undocumented if they appear in FRs/UCs.

Update traceability
-------------------
1) When FR↔UC linkage changes, update both sides.
2) Add test case IDs to FR traceability when available.
3) Add NFR IDs to UC section 9 if relevant.

Run gap analysis
----------------
1) For each capability, fill As-Is and To-Be columns.
2) Mark Gap Type (missing/partial/process) and Business Impact/Priority.
3) Reference FR/UC IDs tied to the gap; propose remediation and owner/timeline.

Quality checkpoint (for any change)
-----------------------------------
- IDs match filenames and registries.
- Status/priority use canonical enums.
- Acceptance criteria are testable and unambiguous.
- Links and references use IDs, not just titles.
- Ask user for missing actors, triggers, priorities, or ambiguous flows.
