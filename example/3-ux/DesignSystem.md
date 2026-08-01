Design System
=============

The shared tokens, components, and patterns the screens reuse. This is the one
place a screen spec points to instead of re-describing a button or a color.

## Tokens

| Token | Value | Usage |
|-------|-------|-------|
| color.primary | #2563EB | Primary actions (Send magic link) |
| color.danger | #DC2626 | Error text and states |
| space.md | 16px | Default control spacing |
| font.body | Inter 16/24 | Body and form text |

## Components

| Component | Variants | States | Notes |
|-----------|----------|--------|-------|
| Button | primary / secondary / ghost | default / hover / disabled / loading | Sign-in uses primary |
| Input | text / email / number | default / focus / error / disabled | Sign-in uses email |
| Table | | empty / loading / error | Invoice list uses this |

## Patterns

- Empty states, loading, error handling, form validation, pagination.
- Reference: link the live design-system / Figma library here, if any.
