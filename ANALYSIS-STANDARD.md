Requirements Analysis Standard
==============================

Purpose
-------
- Define a consistent way to analyze incoming requirements before creating or updating FRs, UCs, NFR references, and gap rows.
- Ensure outputs are testable, traceable, and review-ready.

Scope
-----
- Applies to new requirements, change requests, and gap-analysis inputs.
- Applies to human contributors (SWEs/BAs/PMs) and AI agents.
- Default working artifact: 1-analysis/Analysis.md.

Roles
-----
- Analyst (SWE or agent): performs analysis and drafts artifacts.
- Reviewer (lead/owner): validates ambiguity handling, traceability, and acceptance criteria quality.
- Approver (product/stakeholder): confirms priority, scope, and readiness.

Required Inputs
---------------
- Source material (notes, ticket, PRD, workshop output, migration findings).
- Domain/module target.
- Known constraints (security, compliance, integration, timeline).
- Stakeholder list or owner. Derive a complete list with the 6-question
  checklist: (1) Who is paying for the system? (2) Who is going to use the
  system? (3) Who will judge the fitness of the system for use (often a
  different party than the user)? (4) What agencies/entities regulate any
  aspect of the system? (5) Who is involved in specification, design,
  construction, testing, maintenance, or retirement of the system? (6) Who
  will be negatively affected if the system is built (competitors, displaced
  roles, opposed third parties)? Question 6 is easy to skip and often
  surfaces real delivery risk, not just documentation completeness.

Analysis Workflow
-----------------
1) Intake and normalize
   - Capture source reference and date.
   - Create or update an analysis entry in 1-analysis/Analysis.md.
   - Split composite statements into atomic requirements.
   - Mark each candidate as FR, UC detail, NFR impact, gap item, or entity candidate.

2) Classify and assign IDs
   - Reuse existing IDs when refining an existing artifact.
   - Create new IDs only for net-new behavior.
   - Keep filename-to-ID matching.

3) Quality shaping
   - FR wording uses testable "system shall" statements.
   - Explicitly consider negative/exclusionary requirements: "system shall
     not" statements are a distinct FR category, not implicit side effects.
     During elicitation, ask "what must this system never do?" alongside the
     positive requirement candidates. These are commonly missed until a
     prototype or delivered system surfaces the gap ("customers don't know
     what they don't want until they see it") - classify a captured example
     as a shall-not FR rather than dropping it or forcing it into an NFR.
   - UCs include actors, trigger, preconditions, main flow, alternates, postconditions.
   - NFR impacts reference IDs from 2-requirements/NFRs.md.
   - Acceptance criteria use Given/When/Then with happy, boundary, and failure coverage where relevant.

4) Traceability and coverage
   - Link UC to related FR IDs.
   - Link FR to UC IDs, related FRs, tests, and design components when known.
   - For gaps, include FR/UC IDs in the gap register row.
   - Link entities to source FR/UC IDs and module mappings in 4-design/Entities.md.
   - Keep module-level DDT and PlantUML in modules/<Module>/Entities.md synchronized.

5) Ambiguity resolution
   - Record open questions explicitly.
   - Ask for clarification when actors, triggers, acceptance criteria, priority, release, or FR-to-UC mapping is unclear.
   - Do not speculate; keep unresolved items in Draft.
   - When the ambiguity is a priority/ranking disagreement between multiple
     stakeholders (not an unclear acceptance criterion), use Wideband
     Delphi: each stakeholder rates candidates anonymously (e.g. a 1-5
     preference scale), the coordinator compiles and shares the spread, and
     the group meets to discuss only the widely-varying points before
     re-rating anonymously; repeat until estimates converge. Anonymity is
     load-bearing - it lets a stakeholder revise a public position without
     losing face. Record each round's spread in the "Proposed options"
     column of the Ambiguity and Questions table. Unanimous agreement is not
     required; the goal is every stakeholder feeling heard.
   - Goal evolution: a candidate should also stay in Draft when the
     stakeholder goal it derives from is still being elaborated/refined
     between elicitation sessions, even if the requirement's own wording is
     syntactically clean. Stakeholders legitimately change their minds as an
     abstract goal is operationalized into concrete behavior - a
     well-written requirement can still be wrong if its underlying goal
     hasn't stabilized. Treat "the Source Summary shows the goal changed
     since the prior session" as its own Draft signal, distinct from
     "acceptance criteria are unclear."

Required Analysis Output
------------------------
Provide these sections in every analysis handoff:

- Record the handoff in 1-analysis/Analysis.md unless a project-specific analysis file is explicitly required.

1) Source Summary
   - Input source(s), date, scope, and assumptions.

2) Candidate Requirement Table

| Ref | Candidate ID | Type (FR/UC/NFR/Gap/Entity) | Normalized Statement | Priority | Status |
|-----|--------------|-----------------------------|----------------------|----------|--------|
| SRC-1 | FR-... / UC-... | | | | |

3) Ambiguity and Questions

| # | Item | Why ambiguous | Proposed options | Needed from |
|---|------|---------------|------------------|-------------|
| 1 |      |               |                  |             |

4) Traceability Preview

| Artifact | Links to | Missing links |
|----------|----------|---------------|
| FR-...   | UC-..., TC-... | NFR ID, Design Component |

5) Recommended Next Actions
   - List exact file updates (registries, module files, NFR references, gap rows, entity files).

Quality Gates (Pass/Fail)
-------------------------
- Atomicity: one behavior per FR statement.
- Testability: acceptance criteria are measurable and verifiable.
- Traceability: FR<->UC links present; NFR IDs referenced where applicable.
- Entity completeness: entity set is captured in entity classification + attribute-level DDT and mirrored in PlantUML.
- Consistency: IDs, filenames, and registry rows align.
- Vocabulary: status and priority follow canonical enums defined in SCHEMA.md.
- Completeness: open questions listed; no hidden assumptions.
- Traceability density ("test span"): beyond checking that a FR<->UC/test link
  exists, count requirements-per-test and tests-per-requirement. A requirement
  with 0 tests, or a single test exercising 10+ unrelated requirements, is a
  red flag even though the link is technically present - flag both extremes,
  not just missing links.

UC Content Review (distinct from structural completeness)
-----------------------------------------------------------
Structural completeness (actors, trigger, preconditions, main flow,
alternates, postconditions all present) is necessary but not sufficient. Run
this content-level pass on every drafted UC:

- Named traps to check for and fix:
  - Scenario duplication across UCs - extract a supplementary UC and use
    `<<include>>` instead of repeating the same flow.
  - UC name duplication - names must be unique across the whole UC model.
  - UI design bleeding into the UC - a UC describes system *functionality*,
    never screen/UI layout; move UI mechanics to a screen spec.
  - Data definitions embedded in the UC - literal data values/formats belong
    in entity/NFR docs, not baked into the UC flow text.
  - Over-decomposition - too many UCs for what is really one flow.
- Validation questions, asked once the UC is drafted:
  - Are there any additional actors not represented?
  - Are there any activities not represented?
  - Is each actor's goal actually being met by the flow as written?
  - Can the use case be simplified?
  (generate further related questions as needed - this is a starting set)

Definition of Done for Analysis
-------------------------------
- Candidate set is classified (FR/UC/NFR/Gap/Entity).
- Required clarifications are captured.
- Proposed artifact updates are listed file-by-file.
- Traceability preview has no critical missing links.
- Reviewer can approve or request changes without re-reading raw source material.

Agent Execution Notes
---------------------
- Prefer drafts over speculative completion.
- Preserve templates; fill fields and add rows only.
- Do not delete IDs or rename published artifacts.
- Keep outputs concise and ASCII.