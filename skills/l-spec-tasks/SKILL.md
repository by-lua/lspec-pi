---
name: l-spec-tasks
description: >-
  Create task plan with dependencies, phases, and parallel markers. Breaks
  design into atomic tasks with success criteria and gate checks.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: tasks
  next: execute
---

# L-Spec Tasks — Atomic Task Plan

Creates the complete task plan.

## Prerequisites

- ✅ `.specs/features/[feature]/spec.md` must exist
- ✅ If `.specs/features/[feature]/design.md` exists → read it
- ✅ Read `.specs/codebase/TESTING.md` if it exists

## Auto-Skip Rule

Tasks is skipped when ≤3 obvious steps (inline in execute instead).

## Process

1. Review design, spec, and TESTING.md
2. Break into atomic tasks (one task = one component / one function / one file)
3. Define dependencies
4. Create execution plan with phases (sequential + parallel with `[P]` marker)
5. Validate: granularity check + diagram cross-check + test co-location

## Each Task Includes

- **What** — description
- **Where** — files to create/modify
- **Depends on** — prerequisite tasks
- **Reuses** — existing code to leverage
- **Done when** — success criteria
- **Tests** — what and how
- **Gate** — verification command
- **`[P]` marker** — parallel execution

## Output

`.specs/features/[feature]/tasks.md`

## Next Step

After completing tasks → suggest `/skill:l-spec-execute`