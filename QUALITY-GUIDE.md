Quality Guide
=============

Writing principles
------------------
- Be concise; one behavior per FR.
- Use clear, testable language ("system shall ...").
- Prefer specifics (numbers, roles, systems) over vague words.

Acceptance criteria
-------------------
- Use Given/When/Then format.
- Include happy path, boundary, and failure cases when relevant.

Use Cases
---------
- Actor-centric: list primary and supporting actors.
- Flows: 3-7 steps main success, alternates for branches/errors.
- Preconditions and postconditions are explicit.

UX / Screens
------------
- Every screen has a registry row in 3-ux/Screens.md and a spec file modules/<Module>/UI-*.md.
- Screen lists the Related FR/UC it realizes.
- States enumerated (empty/loading/error/success/permission-denied as applicable).
- Mockup link present (a Wireframes image or a Figma URL).
- Accessibility notes present (keyboard, focus order, contrast, labels).
- UI ID matches the filename.

Traceability
------------
- UC lists FR IDs; FR lists UC IDs, related FRs, tests, design components.
- Gap rows cite FR/UC IDs to show coverage or gaps.
- Analysis entries in 1-analysis/Analysis.md map source refs to FR/UC/NFR/Gap candidates.
- Entity rows in 4-design/Entities.md and modules/<Module>/Entities.md map entities to modules and source FR/UC IDs.

Entities
--------
- Use DDT format for entity capture.
- Classify each entity as Core, Column, or Complementary in module entity files.
- Ensure DDT is attribute-level with columns: Key (PK/FK/-), Data Type, Not Null (Y/N), Length, FK Table, Description.
- Keep PlantUML diagrams consistent with DDT rows.

Style
-----
- Keep ASCII; avoid jargon; no marketing language.
- Keep status/priority enums canonical (Draft/In Review/Approved/Deprecated; Must/Should/Could).

Checklist before closing
------------------------
- Analysis entry exists and includes candidate table, open questions, and traceability preview.
- Entity updates exist in 4-design/Entities.md and relevant modules/<Module>/Entities.md.
- DDT rows include Key, Data Type, Not Null, Length, FK Table, and Description.
- DDT rows and PlantUML diagrams describe the same entity set.
- IDs match filenames and registry entries.
- Acceptance criteria present and testable.
- NFR impacts noted where applicable.
- Links/IDs consistent across files.
