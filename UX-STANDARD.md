UX and Screen Standard
======================

Purpose
-------
- Define the Phase 3 (UX) artifacts, their fields, IDs, and Definition of Done.
- Keep UX inside the traceability spine: every screen links back to the FR/UC it
  serves and forward to the test cases that verify it.

Scope note
----------
- This repo documents UX; it does not hold the running UI code. Wireframes and
  mockups are images or links (for example, Figma); the specs here are the
  source of truth.

Artifacts (Phase 3, `3-ux/`)
----------------------------
- `Screens.md` - the screen registry (one row per screen; `UI-<DomainCode>-NNN`).
- `Personas.md` - the users the product is designed for.
- `UserFlows.md` - task flows across screens (actor -> goal -> steps -> screens).
- `DesignSystem.md` - tokens, components, and patterns the screens reuse.
- `Accessibility.md` - the a11y target (WCAG) and per-screen acceptance criteria.
- `UsabilityTests.md` - usability test plans and findings.
- `Wireframes/` - mockup images or links, named by UI ID.
- `modules/<Module>/UI-*.md` - one screen specification per file (the detail).

IDs
---
- Screen (UI) IDs: `UI-<DomainCode>-<NNN>` (for example, `UI-ID-001`). Stable once published.
- Supporting UX IDs (optional): Persona `PER-<DomainCode>-NNN`, User Flow
  `UF-<DomainCode>-NNN`, Usability study `UT-<DomainCode>-NNN`.
- Filename matches the ID: `UI-ID-001.md`. One screen per file.

Screen specification (required fields)
--------------------------------------
- UI ID, Title, Module, Purpose.
- Realizes: the Related FRs / UCs this screen implements.
- States: empty / loading / error / success / permission-denied (as applicable).
  Loading is not "just a spinner": if the underlying work has known steps or
  duration, show real progress (percentage, step count, ETA) -- a bare
  indeterminate spinner fails the Gulf of Evaluation (user can't tell how much
  progress has actually been made). Error/success must give closure (rule 4
  below) with a clear, specific recovery path (rule 5).
- Key components (from the design system) and primary actions. Classify each
  component using the 4-category taxonomy: input controls (checkbox, radio,
  dropdown, button, toggle, text/date field), navigational (breadcrumb,
  pagination, tabs, search field), informational (tooltip, progress bar,
  notification, modal), containers (accordion, card group, panel). Containers
  nest **at most one level deep** -- a container inside a container inside a
  container is a smell, flag it in review.
- Data shown / captured (fields, validation) and the API/entity it binds to.
  Any long identifier (VIN, tracking number, order/invoice number) is
  displayed **chunked** (e.g. `1HG-CM82-6-3A004352`, not one unbroken run) -- 
  long unbroken strings are hard to recall/transcribe (Miller chunking); see
  `form-input-rules` for the input-side convention.
- Accessibility notes (keyboard, focus order, contrast, labels). Icon-only
  buttons/controls are a **signifier gap**, not a generic a11y note: the icon
  has the affordance (it looks clickable) but nothing signals what it *does*
  unless paired with a label/tooltip or a well-established icon convention
  (trash = delete). Call this out explicitly, don't fold it into "labels".
- Mockup link (a `Wireframes/` image or a Figma URL).
- External-consistency note: if this screen introduces an interaction pattern
  with an established convention elsewhere (Jakob's Law -- cart icon, checkout
  steps, notification bell placement) or diverges from export119's own
  existing convention for the same pattern, the spec states the justification
  for the deviation. A breaking redesign of an already-Approved screen is
  called out here for a staged/feature-flagged rollout, not a silent swap.

Screen-review heuristic checklist
----------------------------------
Before a screen spec can move to Approved, check it against Shneiderman's
Eight Golden Rules by name:
1. Consistency (internal + external/Jakob's Law).
2. Shortcuts for frequent users (keyboard accelerators, saved filters).
3. Informative feedback on every action with consequences.
4. Dialogs yield closure (a visible end-of-interaction, e.g. a confirmation).
5. Simple, specific error handling with a recovery path.
6. Easy reversal of actions (undo, visible cancel, action history).
7. Internal locus of control (user feels in charge; no non-essential element
   steals focus from the primary action).
8. Reduced short-term memory load (recognition over recall; nothing carried
   between screens/steps that the UI could just keep visible).

Plus two items from Sommerville's GUI principles not already covered above:
- Minimal surprise: a command should behave the way a comparable command
  elsewhere in export119 already behaves.
- User diversity: the interface adapts to different user needs (e.g. larger
  text for low-vision users) as a design requirement, not an afterthought.

Registry rules
--------------
- `3-ux/Screens.md`: one row per screen with module, purpose, related FR/UC, status.
- Every screen file has a registry row; the registry reflects any change immediately.

Traceability rules
------------------
- A screen lists the Related FRs/UCs it realizes.
- The FR/UC references the screen (UI ID) in its UI/API notes.
- Test cases that verify the screen cite the UI ID alongside the FR/UC.
- Spine segment: FR/UC -> Screen (UI) -> Test case.

Status / Priority
-----------------
- Canonical Status: Draft | In Review | Approved | Deprecated.
- Canonical Priority: Must | Should | Could.

Definition of Done (Phase 3)
----------------------------
- Every Must FR with a user-facing surface has >= 1 documented screen.
- Each screen: registry row + spec file + states + related FR/UC + mockup link.
- Personas, the primary user flows, and the a11y target are recorded.
- Each wireframe/flow reviewed for correctness (LLM-drafted flows are asserted, not trusted).
- Every Must-priority screen passes through at least one prototype -> evaluate
  -> refine touchpoint (recorded in `UsabilityTests.md`) before status moves
  to Approved.
