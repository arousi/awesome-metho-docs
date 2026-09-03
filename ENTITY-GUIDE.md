Entity Documentation Guide
==========================

Purpose
-------
- Ensure entities are captured early and consistently during requirement analysis.
- Make entity design explicit through a DDT (Data Dictionary Table) and PlantUML diagrams.

Mandatory Rules
---------------
- Every documented attribute/column must appear in a DDT row.
- Every entity set must have a PlantUML diagram that reflects the same entities.
- Each module must classify entities as Core, Column, or Complementary.
- The project-wide entity registry in 4-design/Entities.md must map each entity to at least one module.

Entity Elicitation Gate (Before Classification)
------------------------------------------------
Run this gate before assigning Core/Column/Complementary. Only domain
classes get a module-scoped DDT row:

- Domain class: particular to this application, traces back to a specific
  FR/UC, and appears in that UC's sequence-diagram interaction (or would, if
  one were drawn). Domain classes together must be sufficient to cover the
  module's requirements.
- Non-domain class: a generic/abstract/utility abstraction (a shared base
  type, a value-object with no FK/business identity of its own) that arises
  from design considerations, not directly from a requirement.
- If the entity is a non-domain/generic abstraction, do not give it its own
  per-module Entity Classification row - record a one-line justification
  instead (why it exists, what domain entity(ies) use it).

Classification Vocabulary
-------------------------
- Core: central to module behavior and use cases.
- Column: data columns/attributes that are required to operate or query a core entity.
- Complementary: supporting or enrichment entities that are not primary drivers of module behavior.

DDT Standard Columns (Attribute-Level)
--------------------------------------
Use this exact column order in DDT tables:

| Entity Name | Attribute/Column Name | Key (PK/FK/-) | Data Type | Not Null (Y/N) | Length | FK Table | Description |
|-------------|------------------------|---------------|-----------|----------------|--------|----------|-------------|

Entity Classification Table (Per Module)
-----------------------------------------
Use a separate table for module role classification:

| Entity ID | Entity Name | Module | Module Role (Core/Column/Complementary) | Source FR/UC | Owner | Status |
|-----------|-------------|---------|-------------------------------------------|--------------|-------|--------|

Status and Priority
-------------------
- Status values follow SCHEMA.md.
- Priority values remain Must/Should/Could where prioritization is needed.

PlantUML Requirements
---------------------
- Keep entity names and relationships aligned with DDT rows.
- Prefer one diagram per module in modules/<Module>/Entities.md.
- Keep an optional aggregate view in 4-design/Entities.md when needed.
- Relationship notation legend - each relationship kind must render with its
  own distinct PlantUML arrowhead, not a uniform `--` line for everything:
  - Association (structural "uses/knows-about"): solid line, `A -- B`.
  - Aggregation (whole-part, part can outlive the whole): open diamond at
    the whole end, `A o-- B`.
  - Composition (whole-part, part's lifetime bound to the whole - cascade
    delete): filled diamond at the whole end, `A *-- B`.
  - Dependency (A uses B only transiently - a parameter/return/local type,
    not a stored reference): dashed arrow, `A ..> B`.
  - Generalization/Inheritance: open triangle pointing at the superclass,
    `A --|> B`.
  The choice of aggregation vs composition is what determines whether a
  child entity's rows must cascade-delete with the parent (composition) or
  merely reference it (aggregation/association).

State Diagrams for Status/Lifecycle Entities (Mandatory When Applicable)
--------------------------------------------------------------------------
- Any entity whose DDT includes a status/lifecycle enum column (a finite set
  of states with event-triggered transitions) requires a companion UML state
  diagram, not merely a permitted one:
  - States as rounded-rectangle nodes, events as labeled arcs, guard
    conditions in `[brackets]` where a transition is conditional.
  - A companion states-table (state -> meaning/display behavior) and
    stimuli-table (event -> what triggers it, what guard conditions apply).
- Place the diagram in 4-design/Diagrams/ alongside the entity's DDT/ERD
  placement - the DDT row and ERD placement alone are not sufficient for a
  status-bearing entity.

Deriving a Sequence Diagram From a UC
----------------------------------------
Use this 5-step recipe whenever a UC involves 2+ interacting
objects/services (e.g. checkout, FX conversion, invoice issue):

1. Identify the UC being diagrammed and which entity/actor initiates it
   (labeled `objectName:ClassName`, e.g. `:Checkout`).
2. Draw one lifeline (dashed vertical line) per participating object/actor
   involved in the UC's steps.
3. Draw an elongated activation-bar rectangle beneath a lifeline for each
   operation that object executes.
4. Walk the UC's numbered steps in order, adding one labeled arrow per step
   (annotated with the operation name, e.g. `read()`, `setDuration()`);
   nest sub-steps as `2.1`, `2.2` where a call spawns further steps.
5. Cross-check the resulting participant/object set against the DDT - the
   sequence diagram's objects should be a subset of the module's already-
   identified domain classes (see Entity Elicitation Gate above), and is
   itself a valid input for discovering an entity that gate missed.

Class Invariants (Optional, Per Entity)
------------------------------------------
- The DDT's per-column format (Not Null, Length, FK) cannot express a
  cross-field business rule that spans two or more columns. When such a
  rule exists, add a short "Entity-level Invariants" bullet list under the
  entity's DDT table (not a new DDT column), e.g. "if type=REGULAR then
  value <= originalPrice; if type=VINTAGE then value >= originalPrice."
  Optional - only add it when a real cross-field invariant exists.
- Cross-reference the invariant from the entity's traceability so a later
  code review can verify each documented invariant has an enforcing
  write-time guard (see ledger-invariants-style review for money/FX rules).

Template Snippet (Per Module)
------------------------------
1) Entity Classification table.
2) DDT (attribute/column) table.
3) Relationship notes.
4) PlantUML block with entity and relation lines.

Quality Checklist
-----------------
- DDT rows include Key, Data Type, Not Null, Length, FK Table, and Description.
- DDT and PlantUML contain the same entities.
- Each entity has module role classification (Core/Column/Complementary).
- Source FR/UC references are present where known.
- Entity is registered in 4-design/Entities.md with module mapping.
- Any entity with a status/lifecycle enum column has a companion state
  diagram plus states-table and stimuli-table in 4-design/Diagrams/.
- A Design Component citation (in an FR's Traceability section) is judged
  against the 7-goal design-quality checklist - Correctness, Robustness,
  Flexibility, Reusability, Efficiency, Reliability, Usability - not merely
  checked for presence of a file/PR link. A substantive citation names which
  goal(s) it primarily serves.