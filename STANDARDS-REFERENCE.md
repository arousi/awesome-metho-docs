Standards Reference
====================

Purpose
-------
- Ground this template's FR/UC/UI rules (SCHEMA.md, ANALYSIS-STANDARD.md,
  QUALITY-GUIDE.md, UX-STANDARD.md, ENTITY-GUIDE.md, LIFECYCLE.md) in named,
  external requirements-engineering standards, so "written correctly" has a
  checkable definition instead of only house convention -- for any project
  instantiated from this template, not one specific project's Charter.
- The Requirements/Design/Testing/Quality sections below are grounded directly in
  the SWEBOK v4 primary text and ITSE311 university course material (see Sources).
  ISO/IEC/IEEE 29148 and 12207 material is a secondary-source synthesis (the
  primary standards are paywalled) -- treat that material as informed guidance to
  calibrate against, not a certified quote.
- Consulted by QUALITY-GUIDE.md (writing rules) and ANALYSIS-STANDARD.md (quality
  gates). When this file changes what a standard says, update those files' own
  checklists to match -- this file documents the standard, it does not itself
  enforce anything.

ISO/IEC/IEEE 29148 -- Requirements Engineering
-----------------------------------------------
The requirements-specific standard (most recent edition 2018, an earlier edition
2011). Defines quality criteria for individual requirements and for a requirements
set, plus the requirements-engineering process and a set of standard document types
(Business Requirements Spec, Stakeholder Requirements Spec, System/Software
Requirements Spec, Operational Concept).

**Individual requirement characteristics** (secondary sources vary between 8 and 11
items depending on edition/summary -- the union, deduplicated, is what this template
checks for):

| Characteristic | What it means | Where this template enforces it |
|---|---|---|
| Necessary | Removing the requirement leaves a real capability gap -- it is not "nice to have" dressed as "shall" | Priority field (Must/Should/Could) forces this call explicitly |
| Appropriate | The level of detail matches the level of the document (a stakeholder requirement should not smuggle in implementation detail) | FR Description states behavior; implementation detail belongs in "Design Component", not the requirement text |
| Unambiguous | Reads one way, not several; no "user-friendly", "fast", "as needed" | QUALITY-GUIDE.md's Writing principles: "prefer specifics (numbers, roles, systems) over vague words" |
| Complete | Includes every condition/threshold needed to understand it standalone | Given/When/Then rows must cover the conditions the FR depends on |
| Singular | One capability, one requirement -- no "and" hiding a second FR | QUALITY-GUIDE.md's Writing principles: "one behavior per FR" |
| Feasible | Achievable within known technical/budget/regulatory limits | See "Feasible: the affordability-engineering check" below |
| Verifiable | A finite, concrete test can prove it holds (SWEBOK's definition of "functional requirement" is built on this same idea) | Acceptance Criteria table (Given/When/Then) IS the verification method, made explicit per FR |
| Correct | Accurately represents the actual stakeholder need, not an assumption about it | Reviewer/Approver sign-off in ANALYSIS-STANDARD.md's Roles section |
| Conforming | Follows the house style/template (ID format, required sections) | SCHEMA.md's ID/status/priority rules |
| Traceable | Can be followed forward (to design/code/test) and backward (to its source) | Traceability section in every FR/UC file; the FR<->UC<->Screen<->Entity<->Test spine in LIFECYCLE.md |

**Requirements-SET characteristics** (apply to the whole FRs.md/UCs.md registry, not
one row): Complete (covers everything the module needs), Consistent (no contradicting
requirements, uniform terms for the same concept), Feasible as a whole, Comprehensible
(a new reader can follow it), Able to be validated (there is a way to confirm the set
matches actual stakeholder intent, not just that each row is well-formed).

Practical read: an individual FR can pass every per-row check in SCHEMA.md and still
fail the standard if the *set* contradicts itself (two FRs claiming different behavior
for the same trigger) or is incomplete (a Must-priority user-facing capability with no
FR at all). The per-file checklist catches row-level defects; only a registry-level
read catches set-level ones -- this is why ANALYSIS-STANDARD.md's Traceability
Preview step exists, and why a registry (FRs.md/UCs.md) is not optional scaffolding.

### Where SWEBOK's own list diverges from 29148's (do not treat them as one standard)

SWEBOK v4's Software Requirements KA (Section 3.1, "Basic Requirements Analysis")
gives its OWN pair of quality lists, and they are genuinely NOT the same list as
29148's above. Naming which standard says what:

**SWEBOK's per-requirement properties:** unambiguous, testable/quantified,
**binding** (the stakeholder would pay for it / object if it were omitted), atomic
(single decision), represents true stakeholder needs, uses stakeholder vocabulary,
acceptable to all stakeholders.
- "Binding" is a cost/value check with no equivalent in 29148's per-requirement
  table -- 29148 has "Necessary" and "Feasible" but neither asks "would the client
  pay for this / object to its absence." Recommend treating Binding as a distinct
  additional check the Reviewer/Approver sign-off in ANALYSIS-STANDARD.md's Roles
  section should ask, alongside (not instead of) 29148's Necessary.

**SWEBOK's requirements-SET properties:** complete, **concise**, **internally
consistent**, **externally consistent**, feasible.
- "Concise" (no extraneous content) and the internal/external consistency split are
  SWEBOK-specific and absent from 29148's set list. Conversely, 29148's
  "comprehensible" and "able to be validated" are absent from SWEBOK's list. The two
  lists diverge -- they are not two summaries of the same standard, and a set-level
  review should check both, not assume one subsumes the other.

ISO/IEC/IEEE 12207 -- Software Life Cycle Processes
-----------------------------------------------------
The process-framework standard (most recent edition 2017, refreshed 2026). Defines
WHAT process groups a software lifecycle needs, not a fixed sequence of phases --
processes recur at every stage rather than running once. Four process groups:
Agreement, Organizational Project-Enabling, Technical Management, and Technical
Processes. This template's LIFECYCLE.md phases map onto a subset of the Technical
Processes group:

| 12207 technical process (approximate) | This template's phase |
|---|---|
| Stakeholder Needs and Requirements Definition | Phase 0 (Planning) + Phase 1 (Analysis) |
| System/Software Requirements Definition | Phase 2 (Requirements: FR/UC/NFR) |
| Architecture/Design Definition | Phase 3 (UX) + Phase 4 (Design and Modeling) |
| Implementation | Phase 5 (Implementation traceability -- this template only documents the mapping, code lives in the consuming project) |
| Verification / Validation | Phase 6 (Testing) -- 12207 treats these as two distinct processes (verification: did we build it right, against the spec; validation: did we build the right thing, against stakeholder need); this template's TestCases.md covers verification, and the Analysis/Approval sign-off in Phase 0/2 is where validation actually happens |

The useful takeaway for any project instantiated from this template is not the
process names -- it is that 12207 treats verification and validation as genuinely
different checks, and the phase split (Requirements -> UX -> Design ->
Traceability -> Testing, with an Approved status gate at each) is a lightweight
instance of the same discipline: nothing is "Approved" without a human/stakeholder
validation step, and nothing is "tested" (Phase 6) without a concrete verification
artifact (a TC row).

SWEBOK -- Software Requirements Knowledge Area
------------------------------------------------
The SWEBOK Guide (IEEE/ACM Software Engineering Body of Knowledge) treats
requirements as a four-part process: **elicitation** (get the requirement from a
source), **analysis** (resolve conflict, prioritize, decompose), **specification**
(write it down in a reviewable form), **validation** (confirm it is correct and
matches the requirements-set characteristics above). It defines a functional
requirement as one for which a finite set of test steps can be written -- the same
idea ISO 29148 calls "Verifiable," from a different angle.

**The "perfect technology" classification test (functional vs non-functional).**
SWEBOK gives a precise, mechanical test, sharper than a generic definition: imagine a
computer with infinite speed, unlimited memory, zero cost, and no failures. A
requirement is **functional** if it would STILL need to be stated even given that
perfect machine (it describes what the system must do, independent of the
implementing technology). A requirement is **non-functional** if it is purely a
constraint imposed by real-world technology limits (performance, resource cost,
reliability of actual hardware/software) -- it would evaporate on the perfect
machine. Use this directly when unsure whether a candidate belongs in FRs.md or as
an NFR target: ask whether it would survive on hardware with no speed/cost/failure
limits.

**Catching a solution disguised as a requirement (5-whys).** When an elicited
statement is actually a proposed SOLUTION rather than the true underlying stakeholder
need (e.g. "add a cache" instead of "response time must be under 2s"), SWEBOK names
the remediation as the 5-whys technique: repeatedly ask "why is this the
requirement?" until the answer becomes "if this isn't done, the stakeholder's
problem isn't solved" -- that is the real requirement. Typically converges in 2-3
cycles; named "5-whys" deliberately to push the analyst past the first
plausible-sounding answer, not because it always takes exactly five iterations. If a
candidate FR description names a specific mechanism/technology rather than an
observable behavior, apply 5-whys before accepting it as a Draft FR.

**Elicitation techniques (13-item catalog).** SWEBOK names elicitation as one of the
four requirements activities; ANALYSIS-STANDARD.md's Source Summary should record
which technique produced each candidate, since a code-read carries different
confidence than a stakeholder interview before Approval. ITSE311's elicitation
lecture catalogs 13 named techniques with selection cues:

| Technique | When it fits |
|---|---|
| Brainstorming | Informal, for overarching goals/mission statements, not detailed requirements |
| Card sorting | Stakeholders rank functionality cards (1-2 week turnaround); engineer clusters cards into requirement groups |
| Designer as apprentice | Engineer "looks over the shoulder" of the customer at work in progress; good when the customer can't articulate work but can demonstrate it |
| Domain analysis | Survey competing/related applications to find essential, missing, and reusable functionality |
| Ethnographic observation | Long, high-training-cost observation of work in its environment; best for understanding the problem domain, not for a tight timeline |
| Interviews (unstructured / structured / semi-structured) | Semi-structured (prepared questions + room for spontaneous follow-up) combines the best of both |
| JAD (Joint Application Design) | Structured multi-day group sessions with users, owners, analysts; also usable for design, code, and test-plan review, not just requirements |
| Prototyping | Working or non-working models; core to spiral/agile (non-throwaway prototype series) |
| Questionnaires | Closed-ended (easy to code, bounds scope) vs open-ended (richer, harder to analyze); best when the domain is already well understood |
| Scenarios | Informal high-level use narratives; user stories are a form of scenario |
| Task analysis | Functional decomposition of tasks top-down to single-task granularity |
| User stories | 2-4 sentence customer-voice cards; ~80 stories per increment is a rough rule of thumb, agile-oriented |
| Viewpoints | Organizes requirements info by stakeholder perspective; used for prioritization/agreement/ordering |

No single technique suffices -- the right mix depends on application domain,
customer org culture, requirements engineer experience, and project size. Recommend
adding an "elicitation technique" field to ANALYSIS-STANDARD.md's Source Summary
section, drawn from this vocabulary, instead of leaving it untracked.

**Specification approaches it names**: unstructured natural language, structured
natural language (what this template's FR fixed-section format is), acceptance-
criteria-based (what this template's Given/When/Then tables are), and model-based
(what this template's PlantUML entity/sequence diagrams are, for the parts of a
requirement a sentence cannot capture cleanly).

**Requirement classification dimensions it names**: functional vs non-functional
(see the perfect-technology test above), single vs emergent (a property that only
shows up when components interact -- worth remembering when an FR reads fine alone
but the set-level check above still matters), product vs process, priority, scope,
and volatility vs stability (this template's Draft vs Approved status is
effectively a volatility signal).

### Feasible: the affordability-engineering check

ITSE311's value-engineering lecture gives an operational 5-step recipe for checking
"Feasible" -- more concrete than a bare "consider feasibility" note:

1. Elicit, analyze, and draft the requirement(s) using standard approaches.
2. Estimate the effort to build them (the lecture names COCOMO/WEBMO/COSYSMO and
   Function Points/Use Case Points as estimation tools -- the specific tool matters
   less than "produce a number").
3. Generate a cost profile from that effort estimate.
4. **If the cost is too high, revise the requirement set** -- this is the actual
   feasibility gate: feasibility is decided by comparing estimated cost against
   budget, not by a gut call.
5. Recalculate effort/cost for the revised set and repeat until vendor and customer
   are both satisfied; then monitor actual build cost against the target as
   requirements are implemented.

Caveats worth keeping (not blockers): true costs are hard to estimate early,
requirement dependencies complicate estimates, different stakeholders decompose the
same feature differently (one calls a UI change "minor," another calls it "major"),
and participants' personal stakes/agendas bias their estimates.

**Application to this template:** the Approver's role in ANALYSIS-STANDARD.md's
Roles section should explicitly include a feasibility call -- does the FR/UC have
an effort estimate, does that estimate fit the stated budget/timeline constraint
from the project's Charter, and if not was the requirement revised or explicitly
flagged as a scope risk.

### Requirements Management Activities (distinct from elicitation/analysis/specification/validation)

SWEBOK names two further MANAGEMENT activities that don't fit the four-part
elicitation/analysis/specification/validation frame above:

- **Requirements Scrubbing** (SWEBOK Section 6.1): actively finding and removing the
  smallest-necessary requirement set -- cutting out-of-scope, low-ROI, or
  unimportant requirements, and simplifying overcomplicated ones. Done just before
  validation review in waterfall-style processes; implicit in Agile sprint planning.
- **Scope Matching** (SWEBOK Section 6.3): explicitly checking that the requirements
  scope doesn't exceed cost/schedule/staffing constraints, ideally quantified via
  functional-size units. Three resolution paths when it doesn't fit: cut
  lowest-priority requirements, increase capacity, or negotiate a combination of
  both.

**Application to this template:** before an FRs.md registry moves to Approved, an
explicit scrubbing pass (is every Must/Should FR still necessary and in scope) and a
scope-match check against the Charter's stated constraints belong in
ANALYSIS-STANDARD.md's gate, distinct from the per-row quality checklist.

Use Cases -- Cockburn's Structure (the convention SWEBOK references)
-----------------------------------------------------------------------
Alistair Cockburn's use-case template (Writing Effective Use Cases, 1999-2001) is the
de facto structure SWEBOK and most practitioner guidance point to. Fields, and how
they map onto this template's UC template:

| Cockburn field | This template's UC template |
|---|---|
| Primary Actor | Actor(s) |
| Trigger | Trigger |
| Preconditions | Preconditions |
| Main Success Scenario (numbered steps) | Main Flow |
| Extensions (numbered `3a`, `3a1`, ... branching off the main-scenario step they diverge from) | Alternate Flows -- this template lists them as separate flows; Cockburn's numeric-branch notation (`3a: <condition>`) is a slightly more precise way to say exactly where a flow diverges and is worth adopting when a UC has more than 2-3 alternates and "which step does this branch off of" gets ambiguous |
| Success Guarantee (a.k.a. Postcondition) | Postconditions |
| **Minimal Guarantee** | **Not currently a field in this template's UC template -- a candidate addition.** Cockburn's Minimal Guarantee is what the system still promises even if the use case fails partway through (e.g. "no partial charge is left pending" even if the payment use case errors out). For any UC touching money, state, or an external side effect, this is exactly the kind of thing a Draft-stage review should be asking for and a Failure-path Given/When/Then row often already captures implicitly -- but naming it explicitly as a Minimal Guarantee would make failure-safety a first-class, checkable field instead of something only caught if someone happens to write the right AC row. |
| Secondary Actors | Sharpened below into a three-way taxonomy (Primary/Supporting/Offstage) rather than left as a single vague "secondary" bucket. |

### Actor taxonomy (Primary / Supporting / Offstage)

ITSE311's use-case lecture gives a precise three-way taxonomy, sharper than folding
everything non-primary into "secondary actor":

- **Primary actor** -- has a goal met by using the system's services. Identifying
  all primary actors matters because their goals *drive* the use cases. Example: "A
  client (primary actor) deposits money (goal) in the bank (system)."
- **Supporting actor** -- provides supporting services to the system (often another
  computerized system, but can be an org or person). Identifying these surfaces the
  external interfaces/protocols the system needs. Example: "Any money transfer
  operation requires data exchange with the ATM server (supporting actor)." Naming
  the supporting actor in the UC is what *surfaces* the interface requirement in the
  first place -- a Supporting actor is not the same thing as "an external interface
  requirement," it is what makes that requirement visible.
- **Offstage actor** -- not directly involved in any use case, but has an interest
  in some aspect of system behavior. Usually omitted from the UC model unless
  another stakeholder explicitly names them. Example: "When pressed, the emergency
  button turns on the hidden camera and calls the police department (offstage
  actor)." This is a distinct, narrower concept than a generic stakeholder -- it
  specifically means "interested in this UC's outcome but never appears in its
  flow."

**Application to this template:** consider adding an optional "Supporting/Offstage
Actors" sub-field under Actor(s) in the UC template in SCHEMA.md -- a Supporting
actor should trigger a check for a matching external-interface FR or Design
Component note.

SWEBOK -- Software Design Knowledge Area
-------------------------------------------
Grounded in SWEBOK v4 Chapter 3, "Software Design."

### Design principles (10-item checklist)

SWEBOK names a specific, fixed set of design principles a design must demonstrate:
Abstraction, Separation of Concerns, Modularization, Encapsulation/Information
Hiding, Separation of Interface and Implementation, Coupling, Cohesion, Uniformity,
**Completeness**, and **Verifiability**. The last two are the most-skipped in
practice and the most actionable to check explicitly in a design doc:

- **Completeness**: "a design should be sufficient for designers to demonstrate how
  requirements will be met," and complete "with respect to the modes and states of
  the software" -- every state/mode the system can be in must be accounted for in
  the design, not just the primary flow.
- **Verifiability**: "information needed to verify the design against its
  requirements and other constraints is available" -- the design document itself
  must carry enough evidence (invariants, pre/post-conditions, test hooks) that a
  reviewer can confirm it meets requirements without reading all the implementation
  code.

**Application to this template:** ENTITY-GUIDE.md / the design/entity documentation
standard should require two explicit subsections per nontrivial design doc: a
"Completeness check" (which requirements/states/modes are covered, which explicitly
aren't) and a "Verifiability" note (what evidence lets a reviewer confirm
correctness without reading all the code).

### Design Rationale (required artifact, not free-text notes)

SWEBOK names "Design Rationale" as a required design-documentation artifact with
four fixed components: prior assumptions, alternatives considered,
trade-offs/criteria used to choose between them, and -- notably -- **rejected
decisions and why**, so a team can revisit a previously-rejected decision later if
assumptions, requirements, or constraints change. SWEBOK calls this out as
especially important for distributed/turnover-prone teams -- directly analogous to
a multi-contributor methodology repo where the original decision-maker may not be
the one reviewing it months later.

**Application to this template:** ENTITY-GUIDE.md / the design/entity documentation
standard should carry a mandatory "Design Rationale" section with four fixed
subheads -- Assumptions / Alternatives Considered (including rejected ones and why)
/ Trade-offs and Criteria / Decision -- replacing any free-text "notes" field
currently used for this purpose.

### Design stages and the structural/behavioral notation pairing

**Three design stages, each with a distinct completeness bar.** Architectural
(system-wide computational model, crosscutting strategies with rationale) ->
High-Level (outward-facing: component existence/role/interfaces, detailed enough a
client can use a service "without having to read its code" -- must cover external
events/messages, data formats/protocols, ordering/timing between input and output
events, end-to-end transaction tracing, and data persistence strategy) -> Detailed
(inward-facing: internal structure, algorithm/data-structure choices, sufficient
for a programmer to code the module). A design doc that doesn't state which stage
it is has no way to be checked against the right bar.

**Structural vs Behavioral notation split.** SWEBOK separates design notations into
Structural (class/component/deployment diagrams, CRC cards, ERDs, IDLs, structure
charts) and Behavioral (activity/sequence/communication diagrams, DFDs, decision
tables, flowcharts, state diagrams, formal specs, pseudocode) and expects a design
doc set to cover BOTH concerns, not structure alone. ERDs are explicitly scoped to
"conceptual, logical and physical models of data" only.

**Application to this template:** require every design doc to state its stage
(Architectural/High-Level/Detailed) and hit that stage's bar -- e.g. a high-level
design for a new module must include the event/message list and end-to-end
transaction trace, not just an ERD. Require every module Entities.md to pair its
ERD/PlantUML diagram (structural) with at least one behavioral artifact -- a
sequence diagram for the entity's key lifecycle transitions, or a state diagram
(see LIFECYCLE.md's Phase 4) for any entity with a status/state machine.

SWEBOK -- Software Testing Knowledge Area
---------------------------------------------
Grounded in SWEBOK v4 Chapter 5, "Software Testing." QUALITY-GUIDE.md's
"Acceptance criteria" and "Test Levels" sections already apply the derivation
techniques and level definitions below -- this section is their source citation.

### Test levels

Orthogonal to process/lifecycle -- defined by what's isolated, not by when the test
runs:

| Level | Isolation target |
|---|---|
| Unit | SUT elements tested separately (subprogram/component) |
| Integration | Interactions AMONG SUT elements (top-down/bottom-up/sandwich/big-bang strategies) |
| System | The SUT's behavior as a whole -- explicitly the level for assessing non-functional requirements (security, speed, reliability) |
| Acceptance | Targets deployment, verifies against requirements AND end-user expectations, typically run with end-users, tied to ATDD |

Since this template derives test cases from FR acceptance criteria, those are
Acceptance-level by default -- TestCases.md should require an explicit call when a
criterion is actually exercising System or Integration behavior instead of
silently tagging everything "acceptance."

### Derivation techniques mapped onto happy / boundary / failure

- **Equivalence Partitioning** -- split the input domain into classes (valid vs
  invalid), one representative case per class. This IS the formal basis for "happy
  path" (valid class) and part of "failure path" (invalid class) selection.
- **Boundary Value Analysis (BVA)** -- cases on/near domain boundaries, since
  "faults tend to concentrate near extreme values." Its named extension,
  **Robustness Testing**, picks cases OUTSIDE the valid domain specifically to test
  handling of unexpected/erroneous input -- this is the precise technique behind
  "failure path," distinct from in-domain BVA.
- **Decision Tables** -- when a Given/When/Then has 2+ independent conditions,
  decision tables systematically derive one case per condition/action combination,
  guaranteeing combinatorial completeness instead of ad hoc case listing.

This is the source citation for QUALITY-GUIDE.md's "Acceptance criteria" section,
which already applies EP/BVA/Robustness/Decision-Table by name.

### Verification vs Validation by test oracle

12207 already distinguishes verification ("did we build it right, against the
spec") from validation ("did we build the right thing, against stakeholder need")
at the process level. SWEBOK's Testing KA sharpens this to the level of an
individual test case's "Expected" property: checking observed SUT behavior against
a written **specification** is verification; checking it against **user needs** is
validation; checking against **implicit** requirements/expectations that were
never written down anywhere is a third, distinct case. A single Given/When/Then
acceptance criterion can therefore be checked TWO ways -- does the behavior match
the FR text (verification) vs does it match what the user actually needs
(validation) -- and these can diverge specifically when the FR itself is wrong or
incomplete. A passing test only proves verification; it says nothing about
validation unless the oracle was checked against real user intent, not just the
written FR.

**Application to this template:** add a field/tag per test case in TestCases.md
distinguishing "verifies FR text" from "validates user intent," so a doc reviewer
can catch the case where a test faithfully checks a wrong or ambiguous acceptance
criterion rather than the real underlying need -- a gap the Analysis/Approval
sign-off alone doesn't catch once a test is written against an already-Approved FR.

SWEBOK -- Software Quality Knowledge Area
---------------------------------------------
Grounded in SWEBOK v4 Chapter 12, "Software Quality."

### ISO/IEC 25010 -- the real quality taxonomy

SWEBOK defers entirely to ISO/IEC 25010:2011 (SQuaRE) for quality characteristics --
it does not invent its own taxonomy -- and names its 8 product-quality
characteristics explicitly, calling these "nonfunctional software requirements":
functional suitability, performance efficiency, compatibility, usability,
reliability, security, maintainability, portability. This is the correct external,
citable taxonomy for NFR categorization, not a house-invented bucket list.

Quality requirements are constraints ON functional requirements, not a separate FR
type, and are distinct from a third bucket, "technology constraints" (resource use,
protocols, etc.). An NFR that isn't traceable to the specific FR/UC it constrains
is a smell under this model -- SWEBOK has no concept of a free-floating NFR.

**Application to this template:** require every NFR to be tagged with one of the 8
ISO 25010 characteristics instead of free-text labels, and require every NFR to
name the specific FR/UC it constrains -- SCHEMA.md's "NFR references" rule already
requires the FR/UC link; add the ISO 25010 tag alongside it.

### SQA vs SQC vs testing

"SQA is testing" is explicitly named by SWEBOK as a common misunderstanding:

- **Software Quality Assurance (SQA)** = activities that define and assess the
  adequacy of the *process* (confidence the process produces suitable output), with
  two aspects: process assurance and product assurance.
- **Software Quality Control (SQC)** = activities that measure/evaluate/report on
  the quality of *artifacts* throughout the project -- testing, reviews, and
  inspections are SQC techniques, not SQA itself.

**Application to this template:** frame QUALITY-GUIDE.md's "Review / Inspection"
section (the Fagan-Inspection-modeled review pass) explicitly as an SQC activity
(product assurance on a work product), distinct from the phase-driver
skills/process that define the process itself (SQA). Name this distinction in
QUALITY-GUIDE.md's intro.

### Verification and Validation (Quality KA framing)

A generic V&V framing, distinct from the per-test-case oracle framing in the
Testing KA section above -- this one applies to any work product, not just code:
**Verification** = did the products of a given development phase satisfy the
conditions imposed at the START of that phase (built correctly per the prior
phase's spec). **Validation** = does the finished system/artifact satisfy the real
stakeholder need. Three technique classes apply to both: static (reviews,
inspections, no execution), dynamic (testing, execution), formal (mathematical),
with no strict boundary between them.

**Application to this template:** frame doc review as asking two separate gate
questions per this V&V split: verification (does this UC conform to the FR it
implements) vs validation (does the doc set actually satisfy the project's stated
need).

Recommended additions for any project instantiated from this template
-----------------------------------------------------------------------
These are gaps this reference surfaces in the base template today -- not fixed
here, since AGENTS.md's rule against unrequested bulk rewrites applies to this
template's own core files too. A project deciding to adopt this template should
weigh each:

1. **Feasible** has no dedicated checked field in ANALYSIS-STANDARD.md's Roles
   section today. Recommend adding the 5-step affordability-engineering check (see
   above) to the Approver's role description.
2. **Elicitation technique** is not recorded per candidate in Analysis.md's Source
   Summary. Recommend adding a field drawn from the 13-item catalog above.
3. **Minimal Guarantee** (failure-state postcondition) has no field in the UC
   template. Recommend an optional "Minimal Guarantee" row alongside
   Postconditions, required only for UCs with a money/state/external-side-effect
   Failure path.
4. **Set-level validation** (the five requirements-SET characteristics, further
   sharpened by SWEBOK's own divergent set-level list above) has no explicit
   checklist step distinct from per-row Analysis. Recommend a one-line set-level
   check in ANALYSIS-STANDARD.md's Quality Gates section referencing this file.
5. **Design Rationale** and the **Completeness/Verifiability** design-principle
   subsections have no template section in ENTITY-GUIDE.md today. Recommend adding
   both as described above.
6. **ISO 25010 tagging** is not yet a required NFR field. Recommend adding it
   alongside SCHEMA.md's existing NFR-reference rule.

Sources
-------
- **SWEBOK v4** (IEEE/ACM Software Engineering Body of Knowledge, primary text) --
  Chapter 1 "Software Requirements" (Sections 1.8, 3.1, 6.1, 6.3), Chapter 3
  "Software Design" (Sections 1.4, 2.1-2.2, 4.2-4.3, 4.6), Chapter 5 "Software
  Testing" (intro key-terms, Sections 2.1, 3.1), Chapter 12 "Software Quality"
  (Sections 3.1, 3.3, 3.4, 3.4.4, and its Introduction).
- **ITSE311 course material** (university software-requirements-engineering
  curriculum), used for the affordability-engineering recipe, the 13-item
  elicitation catalog, and the Primary/Supporting/Offstage actor taxonomy:
  the course's Requirements Management & Value Engineering lecture, Requirements
  Elicitation lecture, and Use Cases lecture.
- ISO/IEC/IEEE 29148:2018/2011, summarized via: https://www.modernrequirements.com/blogs/iso-29148-explained/
  and https://www.cwnp.com/req-eng/ (the two secondary summaries disagreed on the
  exact characteristic count -- 8-9 vs 11 -- the table above is the deduplicated
  union). Not primary-sourced; SWEBOK's own divergent list above is primary-sourced
  and should be trusted over any apparent conflict.
- ISO/IEC/IEEE 12207:2017/2026, summarized via: https://quality.arc42.org/standards/iso12207 ,
  https://blog.ansi.org/ansi/iso-iec-ieee-12207-2026-software-life-cycle/ , and
  https://en.wikipedia.org/wiki/ISO/IEC_12207
- Cockburn use-case template: Alistair Cockburn, "Writing Effective Use Cases" (1999-2001),
  template PDF: https://cis.bentley.edu/lwaguespack/CS360_Site/Downloads_files/Use%20Case%20Template%20(Cockburn).pdf
- Earlier secondary-source SWEBOK v3/v4 summaries (kept here for provenance):
  https://www.computer.org/resources/software-requirements-specifications ,
  http://swebokwiki.org/Chapter_1:_Software_Requirements , and
  https://cs.fit.edu/~kgallagher/Schtick/Serious/SWEBOKv3.pdf
