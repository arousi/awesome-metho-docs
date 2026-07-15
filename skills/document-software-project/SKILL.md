---
name: document-software-project
description: Umbrella skill to document a software project in this repo across the full lifecycle - planning, analysis, requirements (FR/UC/NFR), design/diagrams, implementation traceability, and testing. Routes to the phase skills doc-planning / doc-analysis / doc-requirements / doc-design / doc-implementation / doc-testing. Trigger when asked to document a project end-to-end, set one up, or when the phase is unclear.
---

# Skill: Document a Software Project (umbrella)

Drive a project's documentation through the full lifecycle. This is the orchestrator; each phase is a decoupled skill with its own inputs, process, and outputs. Read the standards at the repo root - do not restate them: `SCHEMA.md`, `AGENTS.md`, `LIFECYCLE.md`, `ANALYSIS-STANDARD.md`, `WORKFLOWS.md`, `QUALITY-GUIDE.md`, `ENTITY-GUIDE.md`.

## Phase skills (route by phase)
| Phase | Skill | Produces |
|-------|-------|----------|
| 0 Planning | `doc-planning` | `PM/` charter, stakeholders, risks |
| 1 Analysis | `doc-analysis` | `Analysis/Analysis.md` classified candidates |
| 2 Requirements | `doc-requirements` | FR/UC files + registries, NFR refs |
| 3 Design and Modeling | `doc-design` | Entities (DDT + PlantUML), `Diagrams/` |
| 4 Implementation | `doc-implementation` | FR traceability -> code/PR/test links |
| 5 Testing | `doc-testing` | `Testing/TestCases.md` |

Run phases in order; each hands off to the next by ID (see the traceability spine in `LIFECYCLE.md`). Phases are cumulative and may loop - testing or implementation can surface new candidates that re-enter `doc-analysis`.

## Multi-project hub
Each project's docs are self-contained under `projects/<slug>/` (see `projects/README.md`); the root standards and `example/` template are shared. Work inside the active project's tree. All phase-skill paths are relative to that project root (`projects/<slug>/`, or repo root for the shared template).

## When the phase is unclear
Ask the SWE what stage they are at, or infer from what exists: no `PM/` charter -> `doc-planning`; charter but no Analysis rows -> `doc-analysis`; candidates but no FR/UC files -> `doc-requirements`; FR/UC but no entities/diagrams -> `doc-design`; approved FRs without code links -> `doc-implementation`; FRs without test cases -> `doc-testing`.

## Guardrails (all phases)
Append-only IDs (never rename/delete a published ID; filename matches ID); preserve templates (fill fields, add rows, no bulk rewrites); ASCII only; canonical Status (Draft|In Review|Approved|Deprecated) and Priority (Must|Should|Could); ask - do not speculate, keep open questions explicit. See `AGENTS.md`.

## Install
These skills are portable markdown any agent can follow. To auto-activate in Claude Code, copy or symlink `skills/*` into a skills root (`~/.claude/skills/` global, or `<repo>/.claude/skills/` project-local); each folder is already `<name>/SKILL.md`.
