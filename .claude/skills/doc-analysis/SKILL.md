---
name: doc-analysis
description: Phase 1 (Analysis). Use to analyze a module, feature, or requirement source - ask the SWE questions to understand as-is/to-be, actors, and capabilities, then normalize into atomic candidates classified FR/UC/NFR/Gap/Entity in 1-analysis/Analysis.md. Trigger on "analyze this feature/module", "break this down", "what are the requirements here", "normalize these notes".
---

# Doc: Analysis (Phase 1)

Normalize incoming requirement input into atomic, classified candidates. Owns Phase 1 only (see `LIFECYCLE.md`, `ANALYSIS-STANDARD.md`). It interrogates a module/feature with the SWE and produces the analysis record. It does NOT write final FR/UC files - it produces candidates that `doc-requirements` promotes.

## Inputs
- Phase 0 scope + a target module/feature/source (notes, ticket, PRD, existing-system findings).
- Target module/domain and DomainCode.

## Process (elicitation loop)
1. Read the charter scope and any existing `1-analysis/Analysis.md` rows.
2. Ask a focused batch from the bank; capture source reference + date.
3. Split composite statements into atomic candidates; classify each as FR / UC / NFR / Gap / Entity.
4. Record ambiguities and a traceability preview; list file-by-file recommended updates.
5. Re-read; find missing actors / triggers / criteria / ownership; ask a follow-up batch.
6. Repeat until DoD. Unresolved -> stays Draft with an open question. Hand off classified candidates to `doc-requirements`.

## Questions to ask (bank)
- Target: Which module/feature/source are we analyzing? Point me to the notes/ticket/PRD/system.
- As-is: How does it work today (if it exists)? Pain points?
- To-be: What should it do instead? What is the desired outcome?
- Actors: Who/what interacts with it (users, roles, external systems)?
- Capabilities: What discrete things must it do? (help split compound asks into atomic ones)
- Data: What entities / records / fields are involved?
- Constraints: Security, compliance, performance, integration limits touching this?
- Ownership: Which module/domain does each candidate belong to? DomainCode?
- Unknowns: What is ambiguous or undecided right now?

## Outputs (creates / updates)
- `1-analysis/Analysis.md`: Source Summary; Candidate Requirement table (Ref, Candidate ID, Type, Normalized Statement, Priority, Status); Ambiguity/Questions; Traceability Preview; Recommended File Updates.

## Definition of Done (gate)
Every candidate classified; open questions logged; file-by-file update plan listed; no hidden assumptions. (LIFECYCLE.md Phase 1.)

## Handoff
Classified candidate IDs (FR-/UC-/NFR-/Gap/Entity) + priorities + open questions -> `doc-requirements` (for FR/UC/NFR) and `doc-design` (for entity candidates).

## Guardrails
Reuse existing IDs when refining; new IDs only for net-new behavior; ASCII; preserve template; ask - do not speculate. See `ANALYSIS-STANDARD.md`, `AGENTS.md`.
