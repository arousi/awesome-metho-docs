ModuleN Entities (DDT)
======================

Entity Classification
---------------------

| Entity ID | Entity Name | Module Role (Core/Column/Complementary) | Source FR/UC | Owner | Status |
|-----------|-------------|------------------------------------------|--------------|-------|--------|
| ENT-MN-001 |             | Core                                     |              |       | Draft  |
| ENT-MN-002 |             | Column                                   |              |       | Draft  |
| ENT-MN-003 |             | Complementary                            |              |       | Draft  |

DDT (Attribute/Column Level)
----------------------------

| Entity Name | Attribute/Column Name | Key (PK/FK/-) | Data Type | Not Null (Y/N) | Length | FK Table | Description |
|-------------|------------------------|---------------|-----------|----------------|--------|----------|-------------|
|             |                        |               |           |                |        |          |             |

Relationship Notes
------------------
- Core entities drive module behavior and scenarios.
- Column entities represent data structures that are primarily attribute-focused in this module.
- Complementary entities support enrichment, integration, or reporting.
- DDT rows define attribute-level metadata (key type, datatype, nullability, length, FK table, description).

PlantUML
--------

```plantuml
@startuml
hide methods
hide stereotypes

entity "CoreEntity" as CoreEntity {
	*id : string
}

entity "ColumnEntity" as ColumnEntity {
	*id : string
	--
	columnName : string
}

entity "ComplementaryEntity" as ComplementaryEntity {
	*id : string
}

CoreEntity ||--o{ ColumnEntity : has columns
CoreEntity ||--o{ ComplementaryEntity : complemented by
@enduml
```
