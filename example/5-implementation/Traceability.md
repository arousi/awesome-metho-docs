Implementation Traceability (Phase 5)
=====================================

Phase 5 records how Approved requirements map to the build. No source code lives
in this repo; the mapping is by ID to code/PRs/commits that live in the
project's own repository. See the root `LIFECYCLE.md` Phase 5 and `SCHEMA.md`
(traceability rules).

Where the links live
--------------------
- Primary: the Traceability section of each `../modules/<Module>/FR-*.md`
  (Design Component, Related FRs, and links to code / PR / commit).
- A screen's build links live in its `../modules/<Module>/UI-*.md` spec.

Status note
-----------
- There is NO "Implemented" status. Canonical: Draft | In Review | Approved | Deprecated.
- Build progress is tracked by these traceability links, not by a status value.

Roll-up matrix (example)
------------------------
The FR files remain the source of truth; this overview mirrors them.

| FR ID | UC ID(s) | Screen(s) | Design Component | Code / PR ref | Test Cases | Status |
|-------|----------|-----------|------------------|---------------|------------|--------|
| FR-ID-001 | UC-ID-Login | UI-ID-001 | Auth/SignInForm | repo#PR (TBD) | TC-Login-001, TC-Login-002, TC-Login-003 | Draft |
| FR-ID-002 | UC-ID-Login | UI-ID-001 | Auth/DeviceBinding | repo#PR (TBD) | | Draft |
| FR-BI-001 | UC-BI-ViewInvoice | | Billing/InvoiceJob | repo#PR (TBD) | | Draft |

Definition of Done (Phase 5)
----------------------------
Each Approved FR/UC links to its design components and, where known, the
implementing code/PR and test IDs.
