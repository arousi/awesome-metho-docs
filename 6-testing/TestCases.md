Test Case Registry
==================

Registry of test cases that verify requirements. One row per test case. IDs
follow `TC-<Area>-NNN`. Each test case cites the FR/UC (and Screen, when it is a
UI test) it verifies. The Given/When/Then acceptance criteria inside each FR are
the test basis. See `LIFECYCLE.md` Phase 6 and `QUALITY-GUIDE.md`.

| TC ID | Area | Title | Verifies (FR/UC/UI) | Type (Happy/Boundary/Failure) | Status |
|-------|------|-------|---------------------|-------------------------------|--------|
| TC-XXX-001 | | | FR-XXX-001, UC-XXX | Happy | Draft |
| TC-XXX-002 | | | FR-XXX-001 | Failure | Draft |

Status values follow `SCHEMA.md` (Draft | In Review | Approved | Deprecated).
Every Must FR has >= 1 test case; cover happy, boundary, and failure paths.
Back-reference each TC ID in the Traceability section of the FR it verifies.
