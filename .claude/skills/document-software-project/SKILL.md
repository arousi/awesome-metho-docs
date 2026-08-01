---
name: document-software-project
description: Umbrella skill to document a software project in this repo across the full lifecycle - planning, analysis, requirements (FR/UC/NFR), UX (screens), design/diagrams, implementation traceability, and testing. Routes to the phase skills doc-planning / doc-analysis / doc-requirements / doc-ux / doc-design / doc-implementation / doc-testing. Trigger when asked to document a project end-to-end, set one up, or when the phase is unclear.
---

# Skill: Document a Software Project (umbrella)

Drive a project's documentation through the full lifecycle. This is the orchestrator; each phase is a decoupled skill with its own inputs, process, and outputs. Read the standards at the repo root - do not restate them: `SCHEMA.md`, `AGENTS.md`, `LIFECYCLE.md`, `ANALYSIS-STANDARD.md`, `UX-STANDARD.md`, `WORKFLOWS.md`, `QUALITY-GUIDE.md`, `ENTITY-GUIDE.md`.

## Phase skills (route by phase)
| Phase | Skill | Produces |
|-------|-------|----------|
| 0 Planning | `doc-planning` | `0-planning/` charter, stakeholders, risks, decisions, issues |
| 1 Analysis | `doc-analysis` | `1-analysis/Analysis.md` classified candidates |
| 2 Requirements | `doc-requirements` | FR/UC files + registries, NFR refs |
| 3 UX | `doc-ux` | `3-ux/Screens.md` + `modules/<Module>/UI-*.md`, personas, flows, a11y |
| 4 Design and Modeling | `doc-design` | Entities (DDT + PlantUML), `4-design/Diagrams/` |
| 5 Implementation | `doc-implementation` | FR traceability -> code/PR/test links |
| 6 Testing | `doc-testing` | `6-testing/TestCases.md` |

Run phases in order; each hands off to the next by ID (see the traceability spine in `LIFECYCLE.md`). Phases are cumulative and may loop - testing or usability findings can surface new candidates that re-enter `doc-analysis`.

## Layout
The repo root is one project template: clone it per project and fill the phase folders (`example/` is a filled sample). Two axes: phase folders (`0-planning/` .. `6-testing/`) hold each phase's registries and cross-cutting artifacts; `modules/<Module>/` holds one module's detail files (FR / UC / UI / Entities). All phase-skill paths are relative to the project root.

## When the phase is unclear
Ask the SWE what stage they are at, or infer from what exists: no `0-planning/` charter -> `doc-planning`; charter but no Analysis rows -> `doc-analysis`; candidates but no FR/UC files -> `doc-requirements`; FR/UC but no screens -> `doc-ux`; screens but no entities/diagrams -> `doc-design`; approved FRs without code links -> `doc-implementation`; FRs without test cases -> `doc-testing`.

## Guardrails (all phases)
Append-only IDs (never rename/delete a published ID; filename matches ID); preserve templates (fill fields, add rows, no bulk rewrites); ASCII only; canonical Status (Draft|In Review|Approved|Deprecated) and Priority (Must|Should|Could); ask - do not speculate, keep open questions explicit. See `AGENTS.md`.

## Install
These skills are portable markdown any agent can follow. To auto-activate in Claude Code, copy or symlink `.claude/skills/*` into a skills root (`~/.claude/skills/` global, or keep them at `<repo>/.claude/skills/` project-local); each folder is already `<name>/SKILL.md`.
