Agent Playbook
==============

Purpose
-------
- Help engineers capture and document FRs, UCs, NFRs, methodologically, with minimal friction.
- Preserve IDs, traceability, and template structure.

Guardrails
----------
- Do not delete files or IDs. **Append** new artifacts instead of renaming existing IDs.
- Keep templates intact; only fill fields or add new rows.
- Ask for clarification when requirements are ambiguous or conflicting.
- Keep ASCII; avoid non-ASCII unless already present.
- When unsure, prefer drafts over speculative content and flag open questions.

How to work in this repo
------------------------
- Use single files first: create or patch Functional Requirements or Use-Cases in their singular files before including them in their registries and modules.
- Match filenames to IDs (FR-XXX.md, UC-XXX.md). Keep one major artifact per file.
- Link everything: UCs list related FRs; FRs list UCs/tests/design; NFRs referenced in UCs section 9.
- Gap analysis rows should cite FR/UC IDs when identifying coverage/shortfalls.

Behaviors to avoid
------------------
- No bulk rewrites of templates.
- No removal of placeholders unless replacing with real content.
- No changing status enums, priority enums, or ID formats without explicit approval.

When to ask the user
--------------------
- Conflicting sources or duplicated IDs.
- Missing actors/triggers/acceptance criteria.
- Unclear priority or target release.
- Uncertain mapping between FRs and UCs.

Outputs expected from agents
----------------------------
- Concise, testable statements; avoid prose drift.
- Acceptance criteria in Given/When/Then tables.
- Traceability tables filled with IDs (not titles only).
- For gap rows: explicit As-Is/To-Be, gap type, business impact, remediation.

Status vocabulary (canonical)
-----------------------------
- Draft | In Review | Approved | Deprecated.

Priority vocabulary (canonical)
-------------------------------
- Must | Should | Could.
