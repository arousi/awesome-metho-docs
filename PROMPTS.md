Agent Prompt Library
====================

Analyze requirement inputs
-------------------------
Input: source notes/ticket text, domain/module, constraints, known actors, target release (if any).

Output:
- Update 1-analysis/Analysis.md with a new or revised analysis entry.
- Source summary (scope, assumptions, date).
- Candidate requirement table with type tags (FR/UC/NFR/Gap).
- Ambiguity/questions table with requested clarifications.
- Traceability preview (FR<->UC<->NFR/test links, missing links).
- Recommended file-level updates (registries + module files + gap rows).

Rules:
- Keep requirement statements atomic and testable.
- Use "system shall" for FR candidates.
- Use Given/When/Then style for acceptance criteria proposals.
- Do not invent missing facts; list open questions instead.
- Follow ANALYSIS-STANDARD.md and SCHEMA.md conventions.

Capture entities (DDT + PlantUML)
---------------------------------
Input: FR/UC context, module, known domain objects, attributes/columns, keys, relationships.

Output:
- Update modules/<Module>/Entities.md Entity Classification rows (Core/Column/Complementary).
- Update modules/<Module>/Entities.md DDT rows at attribute level with Key (PK/FK/-), Data Type, Not Null (Y/N), Length, FK Table, Description.
- Update PlantUML block in modules/<Module>/Entities.md to reflect the same entities and relationships.
- Update 4-design/Entities.md to map each entity to module(s), source FR/UC, and diagram reference.

Rules:
- Every entity must appear in DDT and in PlantUML.
- Do not leave unclassified entities.
- Do not omit any DDT attribute columns.
- Keep entity names consistent across FR/UC/analysis/entity files.

Draft a Functional Requirement (FR)
-----------------------------------
Input: goal, domain, module, source, constraints, related UCs/NFRs.


Output: FR file filled: Description with "system shall" statement; Rationale; AC table with at least 2 cases; Traceability linking UCs/tests/design.

Draft a Use Case (UC)
--------------------- 

Input: actor(s), trigger, goal, related FRs, preconditions, postconditions, alternates, impacted NFRs.

Output: UC file filled: identification block, brief description, preconditions, trigger, main flow (3-7 steps), alternates, postconditions, business rules, NFR impacts.

Draft a screen (UI)
-------------------

Input: FR/UC context, module, states, components, data shown/captured.

Output: UI screen spec (modules/<Module>/UI-*.md) filled: identification (UI ID/title/module), realizes FR/UC, states, components and actions, data and validation, accessibility notes, traceability; and a row appended to 3-ux/Screens.md.

Sync registry rows
------------------
Input: FR or UC metadata (ID, title, domain/module, actor, status, priority).


Output: Update 2-requirements/FRs.md or 2-requirements/UCs.md row with consistent status/priority and link to file.

Expand acceptance criteria
--------------------------
Input: FR statement + context + edge cases.


Output: Given/When/Then rows covering happy path, boundary, and failure modes.

Fill gap analysis row
---------------------
Input: capability/requirement + As-Is + To-Be candidates.

Output: Gap row with Gap Type (missing/partial/process), Business Impact, Priority, Remediation Action, Owner, Timeline, and FR/UC IDs involved.

Traceability check
------------------
Input: FR and UC IDs.

Output: List missing links (FR<->UC<->tests/NFRs), suggest updates to traceability tables.
