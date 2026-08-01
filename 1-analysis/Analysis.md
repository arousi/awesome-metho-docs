# Requirements Analysis


Full List
---------

| Analysis ID | Source Ref | Domain / Module | Scope Summary | Owner | Status | Last Updated |
|-------------|------------|------------------|---------------|-------|--------|--------------|
| AN-XXX      | SRC-XXX    | Module1         | Short scope statement | Name | Draft | YYYY-MM-DD |
| ...         | ...        | ...              | ...           | ...   | ...    | ...          |

---

Analysis Template
-----------------

## 1. Analysis Identification

| Field | Value |
|-------|-------|
| Analysis ID | AN-XXX |
| Source Ref | Ticket/Doc/Workshop ID |
| Domain / Module | (e.g., Identity / Billing / Module1) |
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
| SRC-1 | FR-... / UC-... | | | Must/Should/Could | Draft |

---

## 4. Ambiguity and Questions

| # | Item | Why Ambiguous | Proposed Options | Needed From |
|---|------|---------------|------------------|-------------|
| 1 | | | | |

---

## 5. Traceability Preview

| Artifact | Links To | Missing Links |
|----------|----------|---------------|
| FR-... | UC-..., TC-... | NFR ID, Design Component |

---

## 6. Quality Check (MoSCoW + INVEST)

### 6.1 Prioritization (MoSCoW)

| Candidate ID | Must | Should | Could | Won't (This Release) | Rationale |
|--------------|------|--------|-------|----------------------|-----------|
| FR-... / UC-... | | | | | |

### 6.2 Requirement Quality (INVEST)

| Candidate ID | Independent | Negotiable | Valuable | Estimable | Small | Testable | Notes |
|--------------|-------------|------------|----------|-----------|-------|----------|-------|
| FR-... / UC-... | Yes/No | Yes/No | Yes/No | Yes/No | Yes/No | Yes/No | |

---

## 7. Recommended File Updates

| File | Planned Update | Reason |
|------|----------------|--------|
| 2-requirements/FRs.md | Add/Update row(s) | Register FR candidates |
| 2-requirements/UCs.md | Add/Update row(s) | Register UC candidates |
| modules/<Module>/FR-*.md | Create/Update | Detailed FR content |
| modules/<Module>/UC-*.md | Create/Update | Detailed UC content |
| 2-requirements/NFRs.md | Add/Update NFR refs | NFR impact alignment |
| README.md / WORKFLOWS.md | Update guidance (if needed) | Process alignment |

---

## 8. Decision and Sign-off

| Decision | Value |
|----------|-------|
| Ready for authoring | Yes / No |
| Blockers | |
| Reviewer notes | |
| Approval date | YYYY-MM-DD |