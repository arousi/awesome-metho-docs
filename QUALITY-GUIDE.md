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
- Include happy path, boundary, and failure cases when relevant, derived via a named technique:
  - Happy path / valid classes: Equivalence Partitioning (EP) -- one representative case per
    valid/invalid input partition.
  - Boundary cases: Boundary Value Analysis (BVA) -- for a bounded range [A, B], test A, B, A-1,
    B+1 (both for inputs and for outputs with a range); for a loop/count bound `max`, test
    N=0, 1, max-1, max, max+1.
  - Failure/invalid cases: Robustness Testing (BVA's extension) -- deliberately out-of-domain
    inputs, distinct from in-domain BVA edges.
  - When a criterion has 2+ independent Given/When conditions, use a Decision Table (enumerate
    conditions Y/N/-- against actions) instead of ad hoc case listing, to guarantee combinatorial
    completeness.

Test Levels
-----------
- The 4 SWEBOK test levels (Unit / Integration / System / Acceptance) are defined by WHAT IS
  ISOLATED, not by who runs them.
- An FR's Given/When/Then criteria are Acceptance-level by default. If a criterion is actually
  testing System behavior (e.g. an NFR: security, speed, reliability) or Integration behavior
  (interactions among components), say so explicitly rather than defaulting to Acceptance.

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

Review / Inspection
-------------------
- Model a doc review pass on the Fagan Inspection process: Planning -> Overview -> Preparation ->
  Meeting -> Rework -> Follow-up. Roles: Author (explains, does not defend), Moderator (runs it,
  keeps focus on finding defects not fixing them), Reader, Recorder (logs defects as raised),
  Inspectors (find defects, varied backgrounds).
- Preparation is solo, against this file's checklist, BEFORE any group discussion or drafted
  comments -- most defects are found here, not in the meeting.
- Log every finding as Severity (Major = deviates from/stops the requirement; Minor = does not)
  x Nature (Wrong / Missing / Extra), e.g. "Missing, Major: FR-042 has no Given/When/Then for the
  failure path" -- not free-text prose.
- This step is not optional overhead: inspection-based defect removal is 5-10x cheaper than
  catching the same defect via testing, and inspection/testing are complementary, not substitutes.

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
- Acceptance criteria present and testable; the derivation technique (EP/BVA/Decision Table) is
  named per acceptance-criteria row where non-trivial, not just a bare "boundary" label.
- NFR impacts noted where applicable.
- Links/IDs consistent across files.
