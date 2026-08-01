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