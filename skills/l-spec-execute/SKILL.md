---
name: l-spec-execute
description: >-
  Follow task plan — RED/GREEN/GATE/COMMIT per task. Implements code with
  atomic commits and verification at each step.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: execute
  next: pause
---

# L-Spec Execute — Implement & Verify

Follows the task plan — one task at a time.

## Prerequisites

- ✅ `.specs/features/[feature]/spec.md` must exist
- ✅ `.specs/features/[feature]/tasks.md` must exist
- ✅ If `.specs/features/[feature]/design.md` exists → read it

## Per-Task Cycle

1. **Plan** — state assumptions, files to touch, success criteria
2. **RED** — write tests that fail
3. **GREEN** — minimum implementation to pass
4. **GATE CHECK** — verification command (tests, lint, build)
5. **REVIEW** — test count, spec deviation, complexity
6. **COMMIT** — atomic commit per task
7. **REPEAT** — next task

## Subagent Execution

Each task delegated with clean context (only task's spec + design + conventions + TESTING.md). Subagent returns: status, files changed, gate result, issues.

## Output

Code + `.specs/features/[feature]/SUMMARY.md`

## Next Step

After completing all tasks → suggest `/skill:l-spec-pause` to save state