Example Project: Identity & Billing
===================================

Overview
--------
- A filled worked sample that mirrors the repo-root layout (phases `0-planning/`
  .. `6-testing/` plus `modules/`).
- Modules: Identity, Billing, Notifications.
- Illustrative IDs only; replace with your own.

Phase layout (0-6)
------------------
- `0-planning/` - Charter, Stakeholders, Risks, Decisions, Issues.
- `1-analysis/Analysis.md` - classified candidates (AN-ID-001, AN-BI-001).
- `2-requirements/` - `FRs.md`, `UCs.md`, `NFRs.md` registries.
- `3-ux/` - `Screens.md` + Personas, UserFlows, DesignSystem, Accessibility, UsabilityTests, Wireframes.
- `4-design/` - `Entities.md` and `Diagrams/` (ERD).
- `5-implementation/Traceability.md` - FR -> design -> code/PR -> test links.
- `6-testing/TestCases.md` - test-case registry.
- `modules/Module1|Module2|ModuleN/` - each module's `FR-*.md`, `UC-*.md`, `UI-*.md`, `Entities.md`.

Registry entries (sample)
-------------------------
- 2-requirements/FRs.md rows:
  - FR-ID-001 | Identity | Passwordless email sign-in | Draft
  - FR-ID-002 | Identity | Device binding enforcement | Draft
  - FR-BI-001 | Billing  | Generate monthly invoice | Draft
- 2-requirements/UCs.md rows:
  - UC-ID-Login | Identity | Magic-link login | Draft
  - UC-BI-ViewInvoice | Billing | Customer views invoice | Draft

Sample FR (Identity)
--------------------
- FR-ID-001, registered in 2-requirements/FRs.md; per-module detail template at modules/Module1/FR-XXX1.md.
- Description: System shall authenticate a user via a passwordless email magic link valid for 10 minutes.
- Acceptance Criteria (Given/When/Then): success with valid token, reject expired token, reject reused token.
- Traceability: Related UCs: UC-ID-Login; Tests: TC-Login-001; Related FRs: FR-ID-002.

Sample UC (Identity)
--------------------
- UC-ID-Login, registered in 2-requirements/UCs.md; per-module detail template at modules/Module1/UC-XXX1.md.
- Actors: End User, Email Service.
- Trigger: User requests magic link.
- Main flow: request link, receive email, follow link, system verifies token, user signed in.
- Alternates: expired token, reused token.
- Impacted NFRs: NFR-2 Performance (latency), NFR-4 Security (token replay protection).
- Related FRs: FR-ID-001, FR-ID-002.

Sample screen (UX)
------------------
- UI-ID-001 "Sign-in (magic link)", spec at modules/Module1/UI-XXX1.md, registered in 3-ux/Screens.md.
- Realizes FR-ID-001 and UC-ID-Login; persona PER-ID-001 (3-ux/Personas.md), flow UF-ID-001 (3-ux/UserFlows.md).

Traceability and tests
----------------------
- 5-implementation/Traceability.md maps FR-ID-001 -> UI-ID-001 -> TC-Login-001.
- 6-testing/TestCases.md holds TC-Login-001..003 verifying FR-ID-001 / UC-ID-Login.

Gap analysis linkage
--------------------
- Capability: Identity & Access Mgmt; Current solution lacks device binding; To-Be includes FR-ID-002.
- Gap row cites FR-ID-002 and UC-ID-Login; remediation: add device fingerprint validation.
