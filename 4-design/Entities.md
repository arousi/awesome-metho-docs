Project Entities Registry (DDT)
===============================

Full List
---------

| Entity ID | Entity Name | Module | Module Role (Core/Column/Complementary) | Source FR/UC | Diagram Ref | Owner | Status |
|-----------|-------------|---------|-------------------------------------------|--------------|-------------|-------|--------|
| ENT-XXX   | EntityName  | Module1 | Core                                     | FR-XXX, UC-XXX | modules/Module1/Entities.md | Name | Draft |
| ...       | ...         | ...     | ...                                       | ...          | ...         | ...   | ...    |

---

Module Mapping Template
------------------------

| Entity ID | Module | Role in Module | Notes |
|-----------|---------|-----------------|-------|
| ENT-XXX   | Module1 | Core / Column / Complementary | |

---

DDT Attribute Template
----------------------

| Entity Name | Attribute/Column Name | Key (PK/FK/-) | Data Type | Not Null (Y/N) | Length | FK Table | Description |
|-------------|------------------------|---------------|-----------|----------------|--------|----------|-------------|
| EntityName  | id                     | PK            | UUID      | Y              | 36     | -        | Primary identifier |
| EntityName  | related_id             | FK            | UUID      | Y              | 36     | RelatedEntity | Foreign key to related entity |

---

Aggregate PlantUML (Optional)
-----------------------------

```plantuml
@startuml
hide methods
hide stereotypes

entity "EntityName" as EntityName {
	*id : string
	--
	field1 : string
}

entity "RelatedEntity" as RelatedEntity {
	*id : string
}

EntityName }o--|| RelatedEntity : references
@enduml
```