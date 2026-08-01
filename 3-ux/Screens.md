Screen Registry (UI)
====================

Registry of screens (UIs). One row per screen. IDs follow `UI-<DomainCode>-NNN`.
Each screen cites the FR/UC IDs it realizes; the detail lives in
`modules/<Module>/UI-<ID>.md`. See `UX-STANDARD.md`.

| UI ID | Module | Screen | Purpose | States | Realizes (FR/UC) | Mockup | Status |
|-------|--------|--------|---------|--------|------------------|--------|--------|
| UI-XXX-001 | | | | empty/loading/error/ok | FR-XXX-001, UC-XXX | Wireframes/UI-XXX-001.png | Draft |

Status values follow `SCHEMA.md` (Draft | In Review | Approved | Deprecated).
Back-reference each UI ID in the UI/API notes of the FR/UC it realizes, and in
the Traceability section of the test cases that verify it.
