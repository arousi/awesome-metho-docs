## 1. Screen Identification

| Field | Value |
|-------|--------|
| UI ID | UI-ID-001 |
| Title | Sign-in (magic link) |
| Module | Identity |
| Purpose | Let a user request and complete passwordless email sign-in |
| Status | Draft |
| Priority | Must |
| Mockup | ../../3-ux/Wireframes/UI-ID-001.png (or Figma URL) |

---

## 2. Realizes (Requirements)

| Related Artifact | Reference |
|------------------|-----------|
| Use Cases | UC-ID-Login |
| Functional Requirements | FR-ID-001 |

---

## 3. States

| State | Trigger | What the user sees |
|-------|---------|--------------------|
| Empty | Screen first opens | Email field and a "Send magic link" button |
| Loading | Link request submitted | Button shows a spinner; field is disabled |
| Success | Link sent | "Check your email" confirmation with a resend option |
| Error | Expired or reused token | Inline error and an offer to request a fresh link |
| Permission denied | Account is disabled | Message that sign-in is not available for this account |

---

## 4. Components and Actions

| Element | Type (from Design System) | Action | Notes |
|---------|---------------------------|--------|-------|
| Email field | Input (email) | Capture email | Required; validated format |
| Send magic link | Button (primary) | Request link | Disabled until email is valid |
| Resend link | Button (ghost) | Re-request link | Shown in the Success state |

---

## 5. Data

| Field | Shown / Captured | Validation | Bound to (API / entity) |
|-------|------------------|------------|-------------------------|
| email | Captured | Valid email format; required | Auth API / User entity |
| token | Captured (from link) | Single-use; not expired | Auth API / MagicLinkToken |

---

## 6. Accessibility

- Keyboard / focus order: email field, then Send button; visible focus ring on each.
- Screen-reader labels: email field labelled; error announced and tied to the field.
- Contrast / color independence: primary and error colors meet WCAG AA; errors use text, not color alone.

---

## 7. Traceability

| Related Artifact | Reference |
|------------------|-----------|
| Related UIs | |
| Design Component | Auth/SignInForm |
| Test Cases | TC-Login-001 |

---
