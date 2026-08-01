User Flows
==========

Task flows across screens. One section per flow. A flow shows how a persona
achieves a goal, the screens it touches, and the UC it realizes. Add a PlantUML
activity diagram for non-trivial flows (assert it; do not trust an LLM draft).

## Flow: Passwordless sign-in

| Field | Value |
|-------|-------|
| Flow ID | UF-ID-001 |
| Persona | PER-ID-001 |
| Goal | Sign in via an emailed magic link |
| Trigger | User enters their email and requests a link |
| Realizes (UC/FR) | UC-ID-Login, FR-ID-001 |
| Screens touched (UI IDs) | UI-ID-001 |

Steps:

1. User enters email on Sign-in -> UI-ID-001 -> system sends a magic link and shows "check your email".
2. User opens the email and follows the link -> system verifies the token -> user is signed in.

Alternate / error paths:

- Expired token -> system shows the error state and offers to resend.
- Reused token -> system rejects the link and requires a fresh request.

---
