Implementation Traceability (Phase 5)
=====================================

Phase 5 records how Approved requirements map to the build. No source code lives
in this repo; the mapping is by ID to code/PRs/commits that live in the
project's own repository. See `LIFECYCLE.md` Phase 5 and `SCHEMA.md`
(traceability rules).

Where the links live
--------------------
- Primary: the Traceability section of each `modules/<Module>/FR-*.md`
  (Design Component, Related FRs, and links to code / PR / commit).
- A screen's build links live in its `modules/<Module>/UI-*.md` spec.

Status note
-----------
- There is NO "Implemented" status. Canonical: Draft | In Review | Approved | Deprecated.
- Build progress is tracked by these traceability links, not by a status value.

Optional roll-up matrix
-----------------------
Keep this table only if a single overview helps; the FR files remain the source
of truth.

| FR ID | UC ID(s) | Screen(s) | Design Component | Code / PR ref | Test Cases | Status |
|-------|----------|-----------|------------------|---------------|------------|--------|
| FR-XXX-001 | UC-XXX | UI-XXX-001 | | repo#PR | TC-XXX-001 | Draft |

Definition of Done (Phase 5)
----------------------------
Each Approved FR/UC links to its design components and, where known, the
implementing code/PR and test IDs.
