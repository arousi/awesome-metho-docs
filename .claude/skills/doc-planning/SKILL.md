---
name: doc-planning
description: Phase 0 (Planning). Use to start documenting a software project or a major initiative - elicit the project charter by asking the SWE about goals, stakeholders, scope, constraints, risks, and success criteria, then generate or update the 0-planning/ planning files. Trigger on "plan a project", "write a charter", "brainstorm scope", "who are the stakeholders", "define scope/risks".
---

# Doc: Planning (Phase 0)

Elicit and record the project charter. This skill owns Phase 0 only (see `LIFECYCLE.md`). It asks the SWE about the project, brainstorms scope with them, and writes the planning artifacts. It does NOT analyze requirements or write FRs/UCs - that is `doc-analysis` / `doc-requirements`.

## Inputs
- The SWE's intent and any seed material (a pitch, a ticket, a system to replace).
- Target project location: `0-planning/` (the repo root is one project template; clone it per project).

## Process (elicitation loop)
1. Read any existing `0-planning/` files and the project slug/DomainCode.
2. Ask the SWE a focused batch from the question bank below - group related questions; do not ask one at a time.
3. Write answers into the `0-planning/` files (create from template if missing).
4. Re-read what you captured; surface gaps, contradictions, and unstated assumptions; ask a follow-up batch.
5. Repeat until the DoD holds. Keep unresolved items as open questions in `0-planning/Issues.md` - do not invent answers.
6. Stop at the phase boundary. Hand off an approved, scoped charter to `doc-analysis`.

## Questions to ask (bank)
- Goal: In one sentence, what will this project deliver, and for whom? What problem does it solve?
- Trigger: Why now? New build, replacement, compliance, scaling, cost?
- Stakeholders: Who is the sponsor? Primary users? SMEs? Who approves / signs off?
- Scope: What is explicitly IN scope? What is explicitly OUT of scope?
- Timeline: Duration, hard deadlines, major milestones?
- Constraints: Budget, team size/skills, mandated tech, regulatory/compliance, integrations?
- Assumptions: What are we assuming is true (access, cooperation, stability)?
- Risks: What could derail this? Likelihood / impact?
- Success: What measurable criteria mean "done and successful"? Key deliverables?

## Outputs (creates / updates)
- `0-planning/Charter.md` - charter (about, purpose, objectives, scope in/out, constraints, assumptions, success criteria).
- `0-planning/Stakeholders.md`, `0-planning/Milestones.md`, `0-planning/Risks.md`, `0-planning/Decisions.md`, `0-planning/Issues.md`.

## Definition of Done (gate)
Charter approved; scope in/out stated; stakeholders and risks registered; success criteria measurable. (LIFECYCLE.md Phase 0.)

## Handoff
An approved charter + scope boundary. `doc-analysis` consumes this to bound what gets analyzed. Pass forward: scope statement, module/domain list, known constraints, stakeholder/owner list.

## Guardrails
Preserve templates (fill fields, add rows); ASCII only; ask - do not speculate; keep open items explicit. See `AGENTS.md`.
