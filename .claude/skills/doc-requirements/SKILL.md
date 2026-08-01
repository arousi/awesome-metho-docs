---
name: doc-requirements
description: Phase 2 (Requirements). Use to turn analysis candidates into Functional Requirements, Use Cases, and NFR references - ask the SWE for exact behavior, acceptance criteria, actors, flows, priorities, and NFR targets, then write the registry rows and per-module FR/UC files. Trigger on "write the FRs", "draft use cases", "define acceptance criteria", "specify NFRs".
---

# Doc: Requirements (Phase 2)

Promote analysis candidates into testable FRs, complete UCs, and referenced NFRs. Owns Phase 2 only (`WORKFLOWS.md`, `QUALITY-GUIDE.md`, `SCHEMA.md`). Consumes `doc-analysis` output; hands Approved requirements to `doc-ux`.

## Inputs
- Classified candidates + priorities + open questions from `1-analysis/Analysis.md`.
- Target module(s) and DomainCode.

## Process (elicitation loop)
1. Read the candidate table and existing registries/detail files.
2. For each FR/UC candidate, ask the relevant batch from the bank.
3. Write: add registry rows (`2-requirements/FRs.md`, `2-requirements/UCs.md`), create per-module detail files named after the ID, fill all sections, set reciprocal FR<->UC links, reference impacted NFR IDs in UC section 9.
4. Re-read; check atomicity, testability, missing alternates/edge cases; ask a follow-up batch.
5. Repeat until DoD. Keep unresolved as Draft. Hand off Approved IDs to `doc-ux`.

## Questions to ask (bank)
- FR behavior: For candidate X, what exactly shall the system do? (one behavior per FR)
- Priority: Must, Should, or Could? Target release?
- Acceptance: Given/When/Then for success, boundary, and failure - what are they?
- UC actors: Primary and supporting actors? Trigger?
- UC flow: Preconditions? Main flow (3-7 steps)? Alternate/error flows? Postconditions? Business rules?
- NFR: Which NFRs does this flow depend on (performance, security, availability, ...)? Concrete targets/numbers?
- Mapping: Which UCs realize which FRs, and vice versa?

## Outputs (creates / updates)
- `2-requirements/FRs.md` + `modules/<Module>/FR-*.md` (Identification, Description "system shall ...", Acceptance Criteria, Constraints, Traceability).
- `2-requirements/UCs.md` + `modules/<Module>/UC-*.md` (actors, trigger, pre/flows/post, business rules, NFR section 9, related FRs).
- `2-requirements/NFRs.md` (add/refine NFR entries referenced by UCs).

## Definition of Done (gate)
FRs atomic and testable; UCs complete; reciprocal FR<->UC links; NFR IDs referenced in UC section 9; registry rows in sync with detail files. (LIFECYCLE.md Phase 2.)

## Handoff
Approved FR/UC/NFR IDs + the entities named in their flows -> `doc-ux`.

## Guardrails
Append-only IDs; filename matches ID; canonical Status (Draft|In Review|Approved|Deprecated) and Priority (Must|Should|Could); ASCII; preserve templates; ask - do not speculate. Note: no "Implemented" status. See `SCHEMA.md`, `QUALITY-GUIDE.md`.
