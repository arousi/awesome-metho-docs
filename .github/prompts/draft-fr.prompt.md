---
name: Draft FR
description: "Draft or refine a Functional Requirement (FR) artifact with concise, testable statements and full traceability fields."
argument-hint: "Target module, FR ID, business goal, actors, and acceptance criteria context"
agent: "requirements-engineer"
---
Draft or refine one Functional Requirement artifact in this repository.

Instructions:
- Work on a single FR file first (for example `modules/<Module>/FR-XXX.md`) before touching registries.
- Preserve existing IDs, canonical status values (`Draft | In Review | Approved | Deprecated`), and priority values (`Must | Should | Could`).
- Keep output concise, testable, and traceable.
- If required details are missing, ask focused clarification questions instead of guessing.

Required output sections:
1. FR summary (ID, title, status, priority, target release)
2. Scope and business value
3. Functional behavior statements
4. Acceptance criteria table in Given/When/Then format
5. Traceability links (UC IDs, NFR IDs, related design/tests)
6. Open questions and assumptions

Quality checks before finalizing:
- No ID format changes.
- No template field deletions unless replaced with real content.
- Traceability uses IDs, not titles only.
