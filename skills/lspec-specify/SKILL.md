---
name: lspec-specify
description: "Feature specification — REQUIRED in the pipeline."
---

# Specify — Feature Specification

**CRITICAL WARNING:**
- Specify is **REQUIRED** — cannot be skipped
- NEVER use "quick mode" or auto-sizing
- CONFIRM each phase before advancing
- NEVER skip to implementation during Specify

**Pipeline:** Discovery → Research → Specify → Clarify? → Design? → Tasks → Execute

---

## ⚠️ ARTIFACT ENFORCEMENT — Specify needs research.md

**"The artifact one writes is the next one's input."**

Specify **CANNOT run** if the Research artifact does not exist.

```
╔══════════════════════════════════════════════════════════════════════╗
║  GATE: ARTIFACT CHECK — before starting Specify                   ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  Specify depends on: features/[name]/research.md (from Research)  ║
║                                                                      ║
║  □  research.md exists in features/[name]/                          ║
║  □  research.md was read and understood                             ║
║  □  Findings answer the research questions                           ║
║                                                                      ║
╠══════════════════════════════════════════════════════════════════════╣
║ ⚠️  If research.md DOES NOT EXIST → BLOCKS.                           ║
║  ⚠️  Message: "Specify requires research.md. Run /lspec research."  ║
╚══════════════════════════════════════════════════════════════════════╝
```

---

## AUTO-DETECTION

First, check if there is prior context:

```bash
# Check current state
if [ -f ".specs/features/[name]/STATE.md" ]; then
  echo "HAS_STATE"
elif [ -f ".specs/features/[name]/spec.md" ]; then
  echo "HAS_SPEC"
else
  echo "FRESH"
fi
```

**Decision matrix:**

| Context | Action |
|----------|------|
| FRESH + feature name | Create spec from scratch |
| HAS_STATE | Continue from saved phase |
| HAS_SPEC | Offer review/evolution |
| Discuss? complete | Use Discuss context |

---

## State Autosave

**REQUIRED:** Save state after each phase.

Save in `features/[name]/STATE.md`:

```markdown
# State: [feature-name]

## Last Updated
[ISO timestamp]

## Current Phase
[Phase name]

## Phase Data
[Current phase with collected answers]

## Progress
- [x] Discovery
- [ ] Discuss
- [x] Specify (in progress)
- [ ] Clarify
- [ ] Design
- [ ] Tasks
- [ ] Execute

## Notes
[Session observations]
```

---

## Phase 1: Define (REQUIRED)

Collect information before writing. Be a thinking partner.

**Key questions:**

1. What problem are we solving?
2. Who is the user and what is the pain?
3. What would success look like?
4. What is out of scope?

**Challenge vagueness:**
- "Good" means what?
- "Users" means who?
- "Simple" means how?
- "Walk me through using this"
- "What does that actually look like?"

> **AUTOSAVE:** Save state after completing Define

---

## Phase 2: Discuss (OPTIONAL)

In-depth discussion about technical details or scope.

**Questions when needed:**

- What are the constraints (time, tech, resources)?
- What has been tried before?
- What are the decision points?

**Skip if:** Discovery or Discuss context already covered this.

> **AUTOSAVE:** Save state if you went through Discuss

---

## Phase 3: Specify (REQUIRED)

Write complete spec with user stories and acceptance criteria.

### 3.1 User Stories with Priorities

**P1 = MVP** (must ship), **P2** (should have), **P3** (nice to have)

Each story **MUST** be independently testable.

### 3.2 Acceptance Criteria

**WHEN/THEN/SHALL** format:

- WHEN [event/action] THEN [system] SHALL [response/behavior]

### 3.3 Edge Cases

- What breaks? What is empty? What is huge?
- What happens with invalid input?
- What happens with timeout?

> **AUTOSAVE:** Save state with spec draft

---

## Phase 4: Clarify (OPTIONAL)

Spec review and clarification.

**Checklist:**
- [ ] All terms defined?
- [ ] ALL acceptance criteria are testable?
- [ ] Out of scope clear?
- [ ] Unique requirement IDs?

**Fix vagueness:**
- Replace "must be fast" → "SHALL respond in <200ms"
- Replace "good UX" → specific criteria
- Replace "secure" → specific controls

> **AUTOSAVE:** Save state with clarified spec

---

## Phase 5: Design (OPTIONAL)

Technical design decisions (API, schema, flow).

**If necessary:**
- Flow diagram
- API endpoints
- Data model
- Dependencies

> **AUTOSAVE:** Save state with design decisions

---

## Final Output

```
features/
└── [name]/
    ├── STATE.md      # Autosave at each phase
    ├── spec.md       # Final specification
    └── design/       # Optional
        └── [files]
```

---

## Template: `features/[name]/spec.md`

```markdown
# [Feature Name] Specification

## Problem Statement

[Describe the problem in 2-3 sentences. What pain point? Why now?]

## Goals

- [ ] [Primary goal with measurable outcome]
- [ ] [Secondary goal with measurable outcome]

## Out of Scope

Explicitly excluded items.

| Feature | Reason |
|---------|--------|
| [X] | [Why excluded] |

---

## User Stories

### P1: [Story Title] ⭐ MVP

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P1**: [Critical for MVP]

**Acceptance Criteria**:

1. WHEN [user action/event] THEN system SHALL [expected behavior]
2. WHEN [user action/event] THEN system SHALL [expected behavior]
3. WHEN [edge case] THEN system SHALL [graceful handling]

**Independent Test**: [How to verify this story works alone]

---

### P2: [Story Title]

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P2**: [Not MVP but important]

**Acceptance Criteria**:

1. WHEN [event] THEN system SHALL [behavior]
2. WHEN [event] THEN system SHALL [behavior]

---

### P3: [Story Title]

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P3**: [Nice-to-have]

**Acceptance Criteria**:

1. WHEN [event] THEN system SHALL [behavior]

---

## Edge Cases

- WHEN [boundary] THEN system SHALL [behavior]
- WHEN [error] THEN system SHALL [handling]
- WHEN [invalid input] THEN system SHALL [validation]

---

## Requirement Traceability

| ID | Story | Phase | Status |
|----|-------|-------|--------|
| [FEAT]-01 | P1: [Story] | Specify | Pending |
| [FEAT]-02 | P1: [Story] | Specify | Pending |
| [FEAT]-03 | P2: [Story] | Specify | Pending |

**Status:** Pending → In Design → In Tasks → Implementing → Verified

---

## Success Criteria

How we know this is successful:

- [ ] [Measurable outcome]
- [ ] [Measurable outcome]
```

---

## Validation Checklist

Before moving to Tasks:

- [ ] User stories with P1/P2/P3 priorities
- [ ] All acceptance criteria in WHEN/THEN/SHALL format
- [ ] ALL criteria are testable
- [ ] Edge cases documented
- [ ] Out of scope defined
- [ ] Unique requirement IDs
- [ ] State saved in STATE.md
- [ ] **User approval obtained**

---

## Tips
- **P1 = Vertical Slice** — demo-able, not just backend or frontend
- **If you can't test it, rewrite** — non-testable criteria = no spec
- **IDs are mandatory** — traceability is critical
- **Autosave at each phase** — never lose progress
- **Confirm before advancing** — user approves spec

---

## Continuation Flow

**Specify complete.** Spec approved and saved in `features/[name]/spec.md`.

→ Do you want to advance to **Tasks** (required)?

If not: save state in `STATE.md` and wait for new instructions.

---
