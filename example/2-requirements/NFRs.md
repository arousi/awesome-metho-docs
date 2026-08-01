# Non-Functional Requirements (NFRs)

Non-functional targets for the Identity & Billing example. Use Cases reference
these NFR IDs in their section 9. IDs are stable once published.

## NFR-1: Availability

- The sign-in and invoice APIs shall target 99.5% monthly availability.

---

## NFR-2: Performance

### NFR-2.1 Authentication Latency
- A magic-link verification shall complete in under 500 ms at the 95th percentile.

### NFR-2.2 Concurrency
- The system shall support at least 200 concurrent active sessions.

---

## NFR-3: Scalability

- Invoice generation shall process a month of accounts within the nightly window.

---

## NFR-4: Security

### NFR-4.1 Credential Security
- Magic-link tokens shall be single-use and expire within 10 minutes.
- Reused or expired tokens shall be rejected (token replay protection).

### NFR-4.2 Transport Security
- All sign-in and billing traffic shall use TLS 1.2 or higher.

---

## NFR-5: Reliability

- Invoice generation shall be idempotent; duplicate billing events shall be tolerated.

---

## NFR-6: Observability

- The system shall emit auth success/failure and invoice-run metrics with alerting on failure spikes.

---

# Assumptions

- Email delivery is provided by an external service with its own SLA.

# Open Questions

- Target retention period for session logs (pending compliance input).
