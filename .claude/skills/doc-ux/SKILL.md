---
name: doc-ux
description: Phase 3 (UX). Use to design the user-facing surface behind approved requirements - personas, user flows, wireframes/screens, the design system, and accessibility criteria. Ask the SWE which requirements have a UI, then write screen specs (UI IDs) plus the UX artifacts and register each screen. Trigger on "design the screens/UI", "user flows", "wireframes", "personas", "accessibility criteria".
---

# Doc: UX (Phase 3)

Turn approved FR/UC into the user-facing surface: personas, flows, screens (UI
specs), a design-system reference, and accessibility criteria. Owns Phase 3 only
(`UX-STANDARD.md`). Consumes `doc-requirements`; hands screen (UI) IDs to
`doc-design` and `doc-testing`.

## Inputs
- Approved FR/UC IDs and which of them have a user-facing surface.
- Target module(s) and the personas/roles involved.

## Process (elicitation loop)
1. Read the FR/UC files and any existing `3-ux/` artifacts and `modules/<Module>/UI-*.md`.
2. Ask the UX batch from the bank.
3. Write a screen spec per screen (`modules/<Module>/UI-*.md`), register it in
   `3-ux/Screens.md`, and update the shared artifacts (`Personas.md`,
   `UserFlows.md`, `DesignSystem.md`, `Accessibility.md`) as needed; drop mockups
   in `3-ux/Wireframes/` named by UI ID.
4. Re-read; verify each screen lists its Related FR/UC and states; review each
   flow/mockup for correctness (LLM drafts are asserted, not trusted); ask follow-ups.
5. Repeat until DoD. Hand off to `doc-design` and `doc-testing`.

## Questions to ask (bank)
- Surface: Which of these FR/UC have a user-facing screen? Any screen not yet named?
- Personas: Who uses each screen? Goals, context, access level?
- Flows: What is the task flow across screens to reach each goal? Alternate/error paths?
- Screen: States (empty/loading/error/success/denied)? Key components? Primary actions?
- Data: What does each screen show/capture? Validation? Bound to which API/entity?
- Design system: Which existing components/tokens does it reuse? Any new pattern?
- Accessibility: Keyboard path, focus order, labels, contrast? WCAG target?

## Outputs (creates / updates)
- `modules/<Module>/UI-*.md`: one screen spec (identification, realizes FR/UC,
  states, components, data, accessibility, traceability).
- `3-ux/Screens.md`: screen registry row (UI ID, module, purpose, related FR/UC, status).
- `3-ux/Personas.md`, `UserFlows.md`, `DesignSystem.md`, `Accessibility.md`,
  `UsabilityTests.md`, `Wireframes/` as needed.

## Definition of Done (gate)
Every Must FR with a user-facing surface has >= 1 registered screen with states,
related FR/UC, and a mockup link; personas, primary flows, and the a11y target
recorded; each flow/mockup reviewed. (LIFECYCLE.md Phase 3.)

## Handoff
Screen (UI) IDs -> `doc-design` (model the data behind the screens) and
`doc-testing` (verify the screens); usability findings can re-enter `doc-analysis`.

## Guardrails
Screens trace to FR/UC (never float); UI IDs append-only, filename matches ID;
mockups are links/images, not pasted binaries; ASCII; preserve templates; ask -- do not speculate.
