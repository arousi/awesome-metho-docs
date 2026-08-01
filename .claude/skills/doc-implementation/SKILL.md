---
name: doc-implementation
description: Phase 5 (Implementation traceability). Use to record how approved requirements map to the build - ask the SWE which design components, modules, and code/PRs implement each FR, and link test IDs. Documents traceability only; no code lives here. Trigger on "link requirements to code", "update traceability", "which FRs did this PR implement", "record design components".
---

# Doc: Implementation Traceability (Phase 5)

Record the mapping from Approved requirements to the code that builds them. This repo holds documentation, not code - this skill maintains the traceability links only. Owns Phase 5 only (`SCHEMA.md` traceability rules). Consumes `doc-design` / `doc-requirements`; feeds `doc-testing`.

## Inputs
- Approved FR/UC IDs + their design components/entities.
- Build references the SWE can provide: module names, code paths, PR/commit URLs, test IDs.

## Process (elicitation loop)
1. Read the FR files' Traceability sections.
2. Ask the batch from the bank per Approved FR.
3. Write: fill each FR's Traceability with Design Components + code/PR/commit references + related FRs + test-case IDs.
4. Re-read; flag Approved FRs still missing a design-component or code link; ask follow-ups.
5. If the build deviated from the spec, DO NOT rewrite the FR - log a new candidate for `doc-analysis` / `doc-requirements` to handle. Repeat until DoD.

## Questions to ask (bank)
- Components: Which design components/modules implement FR X?
- Code: Link to the implementing code, PR, or commit (if known)?
- Tests: Which test-case IDs cover FR X?
- Deviations: Did the implementation diverge from the spec? (capture as a new requirement candidate, not an edit)
- Status: Has this been reviewed/approved? (status stays a review-state; there is no Implemented status)

## Outputs (updates)
- `5-implementation/Traceability.md`: the traceability overview (Approved FR/UC -> design -> code/PR links).
- Traceability section of each `modules/<Module>/FR-*.md`: Design Components, code/PR/commit refs, Related FRs, Test Cases.

## Definition of Done (gate)
Each Approved FR/UC links its design components and, where known, the implementing code/PR and test IDs. (LIFECYCLE.md Phase 5.)

## Handoff
FRs carrying design + code + test references -> `doc-testing` verifies coverage.

## Guardrails
Never add an "Implemented" status (CI rejects it) - track build via links. Deviations become new IDs, never silent rewrites. ASCII; append-only. See `SCHEMA.md`, `LIFECYCLE.md` Phase 5.
