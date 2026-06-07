---
name: lspec-next
description: "Determines the next phase in the feature pipeline."
---

# lspec-next Skill

## Purpose

Determine the next phase in the feature pipeline based on current state.

---

## Phase Flow

```
Discovery → Discuss (OPTIONAL) → Research → Specify → Clarify (OPTIONAL) → Design (OPTIONAL) → Tasks → Execute → Validate
```

**Required phases:** Discovery → Specify → Tasks → Execute
**Optional phases:** Discuss, Research, Clarify, Design, Validate

---

## Next Phase Logic

###1. Read Current State

Read `features/[name]/STATE.md` to identify current phase.

### 2. Determine Next Phase

```
Discovery complete?
  → YES: Next is Research (if needed) or Specify
  → NO: Continue Discovery

Research complete?
  → YES: Next is Specify
  → NO: Continue Research

Specify complete?
  → YES: Next is Clarify (if ambiguities) or Design (if needed) or Tasks
  → NO: Continue Specify

Clarify complete?
  → YES: Next is Design (if needed) or Tasks
  → NO: Continue Clarify

Design complete?
  → YES: Next is Tasks
  → NO: Continue Design

Tasks complete?
  → YES: Next is Execute
  → NO: Continue Tasks

Execute complete?
  → YES: Next is Validate
  → NO: Continue Execute

Validate complete?
  → YES: Feature is done
  → NO: Continue Validate
```

---

## Decision Matrix

| Current Phase | Next Phase | Condition |
|---------------|------------|-----------|
| Discovery | Research | Research needed |
| Discovery | Specify | Research not needed |
| Research | Specify | - |
| Specify | Clarify | Ambiguities found |
| Specify | Design | Design needed |
| Specify | Tasks | Design not needed |
| Clarify | Design | Design needed |
| Clarify | Tasks | Design not needed |
| Design | Tasks | - |
| Tasks | Execute | - |
| Execute | Validate | - |
| Validate | Done | All criteria met |

---

## Output Format

When determining next phase:

```
Current Phase: [phase]
Completed Phases: [list]
Next Phase: [phase]
Pipeline: [remaining phases]

→ Proceed to [next phase]?
```

---

## Integration with lspec

This skill works together with all other lspec skills:
- `lspec-discovery`: For discovery phase
- `lspec-research`: For research phase
- `lspec-specify`: For specification phase
- `lspec-clarify`: For clarification phase
- `lspec-design`: For design phase
- `lspec-tasks`: For task phase
- `lspec-execute`: For execution phase
- `lspec-validate`: For validation phase
