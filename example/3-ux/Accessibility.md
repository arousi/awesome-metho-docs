Accessibility
=============

The accessibility target and the acceptance criteria screens must meet. These
are testable and feed the test-case registry (Phase 6).

Target
------
- Conformance: WCAG 2.1 AA.
- Supported: keyboard-only, screen reader, 200% zoom, prefers-reduced-motion.

Acceptance criteria (apply to every screen)
--------------------------------------------

| # | Given | When | Then |
|---|-------|------|------|
| A11Y-1 | a keyboard-only user | they tab through the screen | every interactive element is reachable with a visible focus ring |
| A11Y-2 | a screen-reader user | they land on a control | it has an accessible name and role |
| A11Y-3 | any text | measured against its background | contrast is >= 4.5:1 (>= 3:1 for large text) |
| A11Y-4 | a form error | it is shown | it is announced and tied to its field (not color-only) |

Per-screen notes
----------------
- Record screen-specific accessibility notes in each `UI-*.md` spec (see `../modules/Module1/UI-XXX1.md`).
