---
name: lspec-resume
description: "Resumes paused feature work."
---

# lspec-resume Skill

## Purpose

Resume previously paused feature work from saved state.

---

## When to Use

Use Resume when:
- User requests to continue paused work
- New instructions to resume feature
- External input has been received

---

## Resume Process

### 1. Read Saved State

Read `features/[name]/STATE.md` and `features/[name]/PENDING.md`.

### 2. Analyze Pause Context

```
Paused at: [phase]
Completed: [list]
Pending items: [list]
Blockers: [list]
```

### 3. Check Blockers

Verify that previously identified blockers have been resolved.

### 4. Determine Resume Point

```
Blockers resolved?
  → YES: Continue from paused phase
  → NO: Address blockers first
```

### 5. Load Context

Read all relevant artifacts:
- `features/[name]/STATE.md`
- `features/[name]/PENDING.md`
- `features/[name]/[phase].md`

---

## Resume Confirmation

```
Feature work RESUMED.

Feature: [name]
Paused at: [phase]
Resume from: [phase]

Completed Phases:
- [x] Discovery
- [x] Research
- [x] Specify

Current Phase:
- [ ] Tasks (resuming)

Pending Items:
- [ ] [Item 1]
- [ ] [Item 2]

→ Proceed with [next phase]?
```

---

## Integration with lspec

This skill works together with:
- `lspec-pause`: For pausing work
- `lspec-next`: For determining next phase
- All phase skills for continuing work
