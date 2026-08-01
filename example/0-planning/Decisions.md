# Decision Log

One row per decision (ADR-style). Illustrative entry for the Identity & Billing example.
Reversibility is High / Medium / Low.

| ID    | Date | Context | Options Considered | Decision | Owner | Approvers | Rationale | Reversibility | Review Date | Links (FR/UC/NFR) |
|-------|------|---------|--------------------|----------|-------|-----------|-----------|---------------|-------------|-------------------|
| ADR-001 | 2026-01-10 | How should users authenticate? | Password + reset / Magic link / SSO | Magic link | Product Owner | Security Lead | Removes password storage and reset flows | Medium | 2026-04-10 | FR-ID-001, UC-ID-Login |
