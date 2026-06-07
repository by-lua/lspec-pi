---
name: lspec-clarify
description: "Clarifies ambiguous requirements before formal specification. OPTIONAL — use only when there is real ambiguity."
---

# lspec-clarify Skill

## Purpose

Clarify ambiguous requirements before formal specification. This skill is **OPTIONAL** — use only when there is real ambiguity in requirements that prevents advancing to Specify.

---

## Phase Flow

```
Discovery → Discuss (OPTIONAL) → Specify → Clarify (OPTIONAL) → Design (OPTIONAL) → Tasks → Execute
```

**Required phases:** Discovery → Specify → Tasks → Execute
**Optional phases:** Discuss, Clarify, Design

---

## State Autosave

After each phase, save state in `features/[name]/.state.json`:

```json
{
  "feature": "[name]",
  "current_phase": "specify",
  "completed_phases": ["discovery", "specify"],
  "artifacts": {
    "discovery": "features/[name]/discovery.md",
    "specify": "features/[name]/context.md"
  },
  "pending_issues": [],
  "timestamp": "2026-06-04T21:22:00Z"
}
```

---

## Pipeline Phases

### 1. Discovery (REQUIRED)

**Input:** Theme or initial idea from user
**Output:** `features/[name]/discovery.md`

Gather information about the problem, context, and needs.

```
1. Identify scope and feature name
2. Document current problem and pain
3. List affected stakeholders/users
4. Collect implicit requirements
5. Autosave: completed_phases = ["discovery"]
```

**Template:**
```markdown
# Discovery: [name]

## Problem
[Description of current problem]

## Context
[Relevant context]

## Stakeholders
- [List of stakeholders]

## Implicit Requirements
- [Identified requirements]

## Open Questions
- [Questions for clarification]
```

---

### 2. Discuss (OPTIONAL)

**Input:** Questions from Discovery
**Output:** `features/[name]/discuss.md`

Use ONLY when there is need for requirement validation with stakeholders or alignment of understanding.

```
1. Present open questions
2. Collect feedback/validation
3. Document decisions
4. Autosave: completed_phases += ["discuss"]
```

**Template:**
```markdown
# Discuss: [name]

## Questions Presented
[Questions sent for alignment]

## Answers and Decisions
[Collected answers]

## Validations
[Obtained validations]
```

---

### 3. Specify (REQUIRED)

**Input:** Discovery (and Discuss if applicable)
**Output:** `features/[name]/context.md`

Formalize requirements into a structured specification.

```
1. Consolidate validated requirements
2. Define precise scope of the feature
3. Specify expected behavior
4. Identify acceptance criteria
5. Autosave: completed_phases += ["specify"]
```

**Template:**
```markdown
# Context: [name]

## Feature
[Feature name]

## Problem
[Problem it solves]

## Proposed Solution
[Solution description]

## Scope
### In Scope
- [Included items]

### Out of Scope
- [Excluded items]

## Expected Behavior
[Detailed behavior description]

## Acceptance Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]

## Dependencies
[Identified dependencies]

## Risks
[Potential risks]
```

---

### 4. Clarify (OPTIONAL)

**Input:** context.md with identified ambiguities
**Output:** `features/[name]/clarify.md`

Use ONLY when there is ambiguity in requirements that prevents advancing to Design/Tasks.

```
1. Identify specific ambiguities
2. List found ambiguities
3. Propose resolutions or confirm with user
4. Document obtained clarifications
5. Autosave: completed_phases += ["clarify"]
```

**Template:**
```markdown
# Clarify: [name]

## Identified Ambiguities
[List of ambiguities]

## Clarifications
[Obtained clarifications]

## Decisions Made
[Decisions to resolve ambiguities]

## Impact on Specification
[Necessary updates to context.md]
```

---

### 5. Design (OPTIONAL)

**Input:** context.md (and clarify.md if applicable)
**Output:** `features/[name]/design.md`

Define architecture and technical approach.

```
1. Define components/structure
2. Draw interactions
3. Specify interfaces
4. Document design decisions
5. Autosave: completed_phases += ["design"]
```

---

### 6. Tasks (REQUIRED)

**Input:** context.md (and clarify.md, design.md if applicable)
**Output:** `features/[name]/tasks.md`

Decompose into executable tasks.

```
1. List all necessary tasks
2. Prioritize tasks
3. Estimate effort if applicable
4. Identify blockers
5. Autosave: completed_phases += ["tasks"]
```

**Template:**
```markdown
# Tasks: [name]

## Backlog
| ID | Task | Priority | Status |
|----|--------|------------|--------|
| 001 | [Task] | high | pending |

## Blockers
[Identified blockers]
```

---

### 7. Execute (REQUIRED)

**Input:** tasks.md
**Output:** Feature implemented + tests

```
1. Execute tasks in priority order
2. Keep context updated
3. Validate each completed task
4. Autosave: completed_phases += ["execute"]
```

---

## Directory Structure

```
features/
└── [name]/
    ├── .state.json      # State autosave
    ├── discovery.md     # Discovery result
    ├── discuss.md       # Discuss result (if applicable)
    ├── context.md       # Specify result
    ├── clarify.md       # Clarify result (if applicable)
    ├── design.md        # Design result (if applicable)
    └── tasks.md         # Tasks result

# NEVER use:
# - fixes/
# - quick mode
# - auto-sizing
```

---

## Execution Rules

1. **Never use:** quick mode, auto-sizing
2. **Never create:** `fixes/` directories
3. **Always:** autosave after each phase in `.state.json`
4. **Context output:** ALWAYS in `features/[name]/context.md`
5. **Clarify is optional:** Use only when there is real ambiguity
6. **Discuss is optional:** Use only when there is need for external validation

---

## Continuation Flow

**Clarify complete.** Ambiguous requirements resolved and saved in `features/[name]/clarify.md`.

→ Do you want to advance to **Design** (optional — architectural decisions)?

If **no design needed**: → save state and advance directly to **Tasks** (required).

If **not advancing**: save state in `STATE.md` and wait for new instructions.

---

## Integration with lspec

This skill works together with:
- `lspec-discovery`: For discovery phase
- `lspec-tasks`: For task decomposition
- `lspec-execute`: For task execution
