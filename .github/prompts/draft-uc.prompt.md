---
name: Draft UC
description: "Draft or refine a Use Case (UC) with actors, triggers, basic/alternate flows, and requirement traceability."
argument-hint: "Target module, UC ID, primary actor, trigger, and related FR/NFR IDs"
agent: "requirements-engineer"
---
Draft or refine one Use Case artifact in this repository.

Instructions:
- Work on a single UC file first (for example `modules/<Module>/UC-XXX.md`) before touching registries.
- Ensure actors, triggers, preconditions, postconditions, and flows are explicit.
- Keep wording concise and verifiable.
- If conflicts or missing details exist, pause and ask clear questions.

Required output sections:
1. UC metadata (ID, title, status, priority)
2. Actors and stakeholders
3. Trigger, preconditions, and postconditions
4. Main success flow
5. Alternate and exception flows
6. Acceptance criteria table in Given/When/Then format
7. Traceability links (FR IDs, NFR IDs, diagrams/tests)
8. Open questions

Quality checks before finalizing:
- Preserve all IDs and canonical status/priority vocabulary.
- Include NFR linkage where relevant.
- Traceability references IDs only.
