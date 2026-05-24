---
name: l-spec-pause
description: >-
  Save STATE.md + HANDOFF.md for clean resumption between sessions.
  Preserves decisions, blockers, and context for later.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: pause
  next: resume
---

# L-Spec Pause — Save State

Save STATE.md + HANDOFF.md for resumption.

## Prerequisites

- ✅ Any L-Spec project with `.specs/` directory

## Process

1. Update `STATE.md` with current phase, decisions, blockers, lessons
2. Create `HANDOFF.md` with:
   - What was completed
   - What's next
   - Any open questions
   - Context needed to resume

## Output

- `.specs/project/STATE.md` — updated
- `.specs/project/HANDOFF.md` — created

## Next Step

When ready to continue → `/skill:l-spec-resume`