Test Case Registry (Example)
============================

Registry of test cases that verify requirements. One row per test case.
IDs follow `TC-<Area>-NNN`. Each test case cites the FR/UC IDs it verifies.
The Given/When/Then acceptance criteria inside each FR are the test basis.

| TC ID | Area | Title | Verifies (FR/UC) | Type (Happy/Boundary/Failure) | Status |
|-------|------|-------|------------------|-------------------------------|--------|
| TC-Login-001 | Identity | Valid magic link signs user in | FR-ID-001, UC-ID-Login | Happy | Draft |
| TC-Login-002 | Identity | Expired token is rejected | FR-ID-001 | Failure | Draft |
| TC-Login-003 | Identity | Reused token is rejected | FR-ID-001 | Failure | Draft |

Status values follow `SCHEMA.md` (Draft | In Review | Approved | Deprecated).
Back-reference each TC ID in the Traceability section of the FR it verifies.
