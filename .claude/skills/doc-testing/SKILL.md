---
name: doc-testing
description: Phase 6 (Testing). Use to build the test-case registry that verifies requirements - derive test cases from each FR's Given/When/Then acceptance criteria by asking the SWE about happy/boundary/failure paths and test data, then write 6-testing/TestCases.md and back-reference the FRs. Trigger on "write test cases", "define test coverage", "TC registry", "verify these requirements".
---

# Doc: Testing (Phase 6)

Produce the test-case registry that ties verification back to requirements. Owns Phase 6 only (`QUALITY-GUIDE.md`, `SCHEMA.md`). Consumes Approved FR/UC (and their acceptance criteria); closes the traceability spine.

## Inputs
- Approved FR/UC IDs and their Given/When/Then acceptance criteria.
- Area grouping for TC IDs; any known test data / preconditions.

## Process (elicitation loop)
1. Read the FRs' acceptance criteria and any existing `6-testing/TestCases.md`.
2. Ask the batch from the bank; derive candidate test cases from each FR's criteria.
3. Write TC rows (`TC-<Area>-NNN`) citing the FR/UC/UI each verifies, tagged Happy/Boundary/Failure; back-reference TC IDs in the FR Traceability section.
4. Re-read; find Must FRs with no test, and criteria with no boundary/failure case; ask follow-ups.
5. Repeat until DoD.

## Questions to ask (bank)
- Coverage: For FR X, what are the concrete test cases? (start from its Given/When/Then)
- Paths: What is the happy path? The boundary cases? The failure cases?
- Data: What test data or preconditions are needed?
- Area: Which area/grouping should the TC IDs use?
- Priority: Is this FR a Must? (Must FRs require >= 1 TC)

## Outputs (creates / updates)
- `6-testing/TestCases.md`: `TC-<Area>-NNN` rows (Area, Title, Verifies FR/UC/UI, Type, Status).
- Back-references: TC IDs added to the Traceability section of each verified FR.

## Definition of Done (gate)
Every Must FR has >= 1 TC; each TC cites its FR/UC; happy/boundary/failure covered; TC IDs back-referenced in FRs. (LIFECYCLE.md Phase 6.)

## Handoff
Coverage complete -> the phase loop closes. New gaps found while testing become candidates for `doc-analysis`.

## Guardrails
TC IDs append-only; canonical Status; ASCII; derive tests from documented acceptance criteria - do not invent behavior. See `QUALITY-GUIDE.md`.
