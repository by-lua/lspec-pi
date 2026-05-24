---
name: l-spec-resume
description: >-
  Load STATE.md + HANDOFF.md and show where you left off. Picks up from
  the last completed phase with full context.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: resume
  next: varies
---

# L-Spec Resume — Pick Up Where You Left Off

Load STATE.md + HANDOFF.md, show where you left off.

## Prerequisites

- ✅ `.specs/project/STATE.md` must exist (project was paused)
- ❌ If no STATE.md → tell user: "No paused state found. Start with `/skill:l-spec-discovery`."

## Process

1. Read `.specs/project/STATE.md`
2. Read `.specs/project/HANDOFF.md` (if exists)
3. Summarize: what was done, what's next, any blockers
4. Suggest the next phase command based on where they left off

## Next Step

Depends on where the project was paused. Suggest the appropriate next command.