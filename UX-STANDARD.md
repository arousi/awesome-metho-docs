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
- Key components (from the design system) and primary actions.
- Data shown / captured (fields, validation) and the API/entity it binds to.
- Accessibility notes (keyboard, focus order, contrast, labels).
- Mockup link (a `Wireframes/` image or a Figma URL).

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
