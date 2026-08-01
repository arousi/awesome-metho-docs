---
name: doc-design
description: Phase 4 (Design and Modeling). Use to model the data and behavior behind approved requirements - ask the SWE about entities, attributes, keys, relationships, and which flows need diagrams, then write the DDT + PlantUML and register entities. Trigger on "model the entities", "design the schema/ERD", "add a sequence/architecture diagram", "data dictionary".
---

# Doc: Design and Modeling (Phase 4)

Turn approved FR/UC into an explicit entity model (DDT + PlantUML) and the diagrams that describe behavior/structure. Owns Phase 4 only (`ENTITY-GUIDE.md`, `4-design/Diagrams/README.md`). Consumes `doc-ux`; hands entity + design-component IDs to `doc-implementation`.

## Inputs
- Approved FR/UC IDs, the entities named in their flows, and any screens (UI IDs) that realize them.
- Target module(s).

## Process (elicitation loop)
1. Read the FR/UC files and any existing `modules/<Module>/Entities.md`, `4-design/Entities.md`.
2. Ask the entity/diagram batch from the bank.
3. Write: Entity Classification rows (Core/Column/Complementary + source FR/UC), attribute-level DDT rows, a PlantUML block covering the same entity set; register each entity in `4-design/Entities.md`; add diagrams under `4-design/Diagrams/`.
4. Re-read; verify DDT and PlantUML describe the same entities; review each diagram for correctness (LLM diagrams must be asserted, not trusted); ask follow-ups.
5. Repeat until DoD. Hand off to `doc-implementation`.

## Questions to ask (bank)
- Entities: Which entities appear in these requirements? Any not yet named?
- Attributes: For each entity, what attributes/columns? Which is the PK? Which are FKs (to what)?
- Types: Data type, length, nullability (Not Null Y/N) per attribute?
- Relationships: How do entities relate (1-1, 1-many, many-many)? Cardinality?
- Role: Per module, is each entity Core, Column, or Complementary?
- Ownership: Which module owns each entity?
- Diagrams: Which flows need a sequence diagram? Do we need an ERD, state, or architecture view?

## Outputs (creates / updates)
- `modules/<Module>/Entities.md`: Entity Classification table + attribute-level DDT (Key / Data Type / Not Null / Length / FK Table / Description) + PlantUML.
- `4-design/Entities.md`: entity -> module mapping + diagram reference + source FR/UC.
- `4-design/Diagrams/`: ERD / sequence / state / architecture artifacts.

## Definition of Done (gate)
Every entity in a DDT row AND the module PlantUML, classified, registered with source FR/UC; each diagram reviewed for correctness. (LIFECYCLE.md Phase 4.)

## Handoff
Entity + design-component references -> `doc-implementation` (for code-linkage) and inform `doc-testing`.

## Guardrails
DDT and PlantUML stay in sync; attribute-level columns exact per `ENTITY-GUIDE.md`; ASCII; preserve templates; ask - do not speculate.
