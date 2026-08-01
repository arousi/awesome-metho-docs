# Non-Functional Requirements (NFRs)

Project-level NFR catalog. One entry per NFR with an ID and a measurable target.
Reference these NFR IDs in UC section 9 where a flow depends on them. See
`SCHEMA.md` and `QUALITY-GUIDE.md`.

## NFR-1: Availability

- <Target, e.g. 99.9% monthly uptime for the core service.>

## NFR-2: Performance

- <Latency target, e.g. p95 request latency under 300 ms.>
- <Throughput target, e.g. >= X requests/second sustained.>

## NFR-3: Scalability

- <e.g. supports X concurrent users / Y records without redesign.>

## NFR-4: Security

- <Credential handling, e.g. secrets encrypted at rest and in transit.>
- <Access control, e.g. admin actions require RBAC.>

## NFR-5: Reliability

- <e.g. state-changing operations are idempotent; failed jobs are retried.>

## NFR-6: Observability

- <e.g. structured logs, key metrics (success/failure rate, latency), alerting.>

## NFR-7: Data Retention

- <Retention / erasure target per data class.>

## NFR-8: Maintainability

- <e.g. modular architecture; third-party-specific logic isolated.>

## NFR-9: Compliance (if applicable)

- <Regulatory / audit requirements, if any.>
