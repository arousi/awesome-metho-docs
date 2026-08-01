# Risk Register

One row per risk. Illustrative entries for the Identity & Billing example.
Exposure is Impact x Likelihood; Status is Open / Mitigated / Closed.

| ID    | Title | Category | Impact | Likelihood | Exposure | Owner | Mitigation | Trigger | Status | Target Date | Links |
|-------|-------|----------|--------|------------|----------|-------|------------|---------|--------|-------------|-------|
| R-001 | Email delivery delays block sign-in | Vendor | High | Medium | H x M | PM | Add a fallback provider; monitor delivery latency | Bounce/latency spike | Open | 2026-02-01 | FR-ID-001 |
| R-002 | Magic-link token replay | Technical | High | Low | H x L | Security | Single-use, short-lived tokens | Reuse detected in logs | Open | 2026-02-01 | NFR-4, UC-ID-Login |
