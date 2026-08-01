# Requirements Analysis


Full List
---------

| Analysis ID | Source Ref | Domain / Module | Scope Summary | Owner | Status | Last Updated |
|-------------|------------|-----------------|---------------|-------|--------|--------------|
| AN-ID-001   | ADR-001    | Identity        | Passwordless sign-in and device binding | PM | Draft | 2026-01-12 |
| AN-BI-001   | Charter    | Billing         | Monthly invoice generation and view | PM | Draft | 2026-01-12 |

---

Analysis Template
-----------------

## 1. Analysis Identification

| Field | Value |
|-------|-------|
| Analysis ID | AN-XXX |
| Source Ref | Ticket/Doc/Workshop ID |
| Domain / Module | (e.g., Identity / Billing) |
| Scope Summary | Short scope statement |
| Analyst | |
| Reviewer | |
| Status | Draft / In Review / Approved / Deprecated |
| Priority Context | Must / Should / Could |
| Analysis Date | YYYY-MM-DD |

---

## 2. Source Summary

- Source material:
- Business objective:
- Scope boundaries:
- Assumptions:

---

## 3. Candidate Requirement Table

| Ref | Candidate ID | Type (FR/UC/NFR/Gap/Entity) | Normalized Statement | Priority | Status |
|-----|--------------|-----------------------------|----------------------|----------|--------|
| SRC-1 | FR-ID-001 | FR | System shall authenticate a user via a passwordless email magic link. | Must | Draft |
| SRC-2 | UC-ID-Login | UC | End user signs in with an emailed magic link. | Must | Draft |

---

## 4. Ambiguity and Questions

| # | Item | Why Ambiguous | Proposed Options | Needed From |
|---|------|---------------|------------------|-------------|
| 1 | Session-log retention | Compliance target undefined | 30d / 90d / 1y | Compliance |

---

## 5. Traceability Preview

| Artifact | Links To | Missing Links |
|----------|----------|---------------|
| FR-ID-001 | UC-ID-Login, TC-Login-001 | Design Component |

---

## 6. Quality Check (MoSCoW + INVEST)

### 6.1 Prioritization (MoSCoW)

| Candidate ID | Must | Should | Could | Won't (This Release) | Rationale |
|--------------|------|--------|-------|----------------------|-----------|
| FR-ID-001 | Yes | | | | Core sign-in path |

### 6.2 Requirement Quality (INVEST)

| Candidate ID | Independent | Negotiable | Valuable | Estimable | Small | Testable | Notes |
|--------------|-------------|------------|----------|-----------|-------|----------|-------|
| FR-ID-001 | Yes | Yes | Yes | Yes | Yes | Yes | |

---

## 7. Recommended File Updates

| File | Planned Update | Reason |
|------|----------------|--------|
| 2-requirements/FRs.md | Add/Update row(s) | Register FR candidates |
| 2-requirements/UCs.md | Add/Update row(s) | Register UC candidates |
| modules/Module1/FR-*.md | Create/Update | Detailed FR content |
| modules/Module1/UC-*.md | Create/Update | Detailed UC content |
| 2-requirements/NFRs.md | Add/Update NFR refs | NFR impact alignment |

---

## 8. Decision and Sign-off

| Decision | Value |
|----------|-------|
| Ready for authoring | Yes |
| Blockers | |
| Reviewer notes | |
| Approval date | 2026-01-12 |
