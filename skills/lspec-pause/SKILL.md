---
name: lspec-pause
description: "Pauses feature work and saves state."
---

# lspec-pause Skill

## Purpose

Pause feature work and save the current state for later resumption.

---

## When to Use

Use Pause when:
- User requests pause
- Work needs to be interrupted
- Waiting for external input
- Context switch required

---

## Pause Process

### 1. Read Current State

Read `features/[name]/STATE.md` to understand current progress.

### 2. Document Current Status

Update STATE.md with pause information:

```markdown
# State: [feature-name]

## Last Updated
[ISO timestamp]

## Current Phase
[Current phase]

## Pause Information
Paused at: [ISO timestamp]
Reason: [User-provided reason]
Resume from: [Phase name]

## Phase Data
[Current phase data]

## Progress
- [x] Discovery
- [ ] Discuss
- [x] Research
- [x] Specify
- [ ] Clarify
- [ ] Design
- [ ] Tasks
- [ ] Execute

## Notes
[Additional notes for resumption]
```

### 3. Document Pending Items

Create or update `features/[name]/PENDING.md`:

```markdown
# Pending: [feature-name]

## Paused At
[ISO timestamp]

## Pending Items
- [ ] [Item 1]
- [ ] [Item 2]

## Blockers
- [Blocker description]

## Resume Instructions
1. [Step 1]
2. [Step 2]

## Next Action
[What to do next when resuming]
```

### 4. Save Context

Ensure all artifacts are saved:
- `features/[name]/STATE.md`
- `features/[name]/PENDING.md`
- `features/[name]/[current-phase].md`

---

## Pause Confirmation

```
Feature work PAUSED.

Current Phase: [phase]
Completed: [list]
Paused at: [timestamp]

Resume with: /lspec resume [feature-name]

→ Ready for new instructions.
```

---

## Integration with lspec

This skill works together with:
- `lspec-resume`: For resuming paused work
- `lspec-next`: For determining next phase
- All phase skills for saving state
