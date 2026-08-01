Schema and Conventions
======================

IDs
---
- Analysis IDs: AN-<DomainCode>-<NNN> (e.g., AN-ID-001).
- Entity IDs: ENT-<DomainCode>-<NNN> (e.g., ENT-ID-001).
- FR IDs: FR-<DomainCode>-<NNN> (e.g., FR-ID-001). Stable once published.
- UC IDs: UC-<DomainCode>-<NNN> (e.g., UC-ID-Login).
- Screen (UI) IDs: UI-<DomainCode>-<NNN> (e.g., UI-ID-001).
- Test IDs: TC-<Area>-<NNN> (when referenced).
- Supporting UX IDs (optional): Persona PER-<DomainCode>-NNN, User Flow UF-<DomainCode>-NNN, Usability study UT-<DomainCode>-NNN.
- Requirement Code (inside FR): [FR-...-NNN] Short Name, mirrors the file ID.

Status enums
------------
- Draft | In Review | Approved | Deprecated.

Priority enums
--------------
- Must | Should | Could.

File naming
-----------
- One major artifact per file; filename matches the ID (e.g., FR-ID-001.md, UI-ID-001.md).
- Keep templates; duplicate them when adding new artifacts.

Layout (per project)
--------------------
- Phase folders `0-planning/` .. `6-testing/` hold each phase's registries and cross-cutting artifacts.
- `modules/<Module>/` holds one module's detail files (FR-*.md, UC-*.md, UI-*.md, Entities.md). A registry row points into the module by ID.

Registry rules
--------------
- 1-analysis/Analysis.md: one row per analysis effort with source, scope, owner, and status.
- 2-requirements/FRs.md: one row per FR with module, title, status.
- 2-requirements/UCs.md: one row per UC with domain, actor, status.
- 3-ux/Screens.md: one row per screen with module, purpose, related FR/UC, status.
- 4-design/Entities.md: one row per entity with module mapping and diagram reference.
- Registries must reflect any new or changed artifact immediately.

Entity documentation rules
--------------------------
- Every module maintains modules/<Module>/Entities.md.
- Entities use DDT (Data Dictionary Table) columns as defined in ENTITY-GUIDE.md.
- Each module classifies entities as Core, Column, or Complementary.
- Each module entity file includes a PlantUML diagram reflecting documented entities.
- DDT rows are attribute/column-level and include: Key (PK/FK/-), Data Type, Not Null (Y/N), Length, FK Table, Description.

Traceability rules
------------------
- UC files list Related FRs (IDs) and impacted NFRs.
- FR files list Related UCs, related FRs, screens, design components, and test cases.
- Screen (UI) files list the Related FRs/UCs they realize; the FR/UC references the screen in its UI/API notes.
- Gap matrix rows cite FR/UC IDs to show coverage or gaps.
- Spine: FR/UC -> Screen (UI) -> Test case.

Acceptance criteria
-------------------
- Use Given/When/Then tables.
- Cover success, boundary, and failure where applicable.

NFR references
--------------
- Reference NFR IDs in UC section 9 when the flow depends on them.

Link hygiene
------------
- Use relative links within markdown when adding explicit links; keep IDs consistent with filenames.
