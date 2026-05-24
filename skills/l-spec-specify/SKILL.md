---
name: l-spec-specify
description: >-
  Define WHAT to build with testable, traceable requirements. Creates spec.md
  with user stories, acceptance criteria (WHEN/THEN/SHALL), and edge cases.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: specify
  next: discuss, design, tasks
---

# L-Spec Specify — Testable Requirements

Defines WHAT to build with testable, traceable requirements.

## Prerequisites

- ✅ `.specs/project/PROJECT.md` must exist
- ✅ Feature name must be provided or asked
- 📋 If `.specs/features/[feature]/intake.md` exists → read it first

## Process

1. **Clarify Requirements** — start conversational, let user dump their mental model
   - Ask open: "What problem?", "Who is the user?", "What does success look like?"
   - **Challenge vagueness** — "Good" means what? "Users" means who? "Simple" means how?
2. **Capture User Stories with Priorities**
   - P1 = MVP (must ship), P2 = should have, P3 = nice to have
   - Each story must be independently testable
3. **Write Acceptance Criteria** — WHEN/THEN/SHALL format
   - `WHEN [event/action] THEN system SHALL [response/behavior]`
4. **Document Edge Cases** — what breaks? what's empty? what's huge?
5. **Assign Requirement IDs** — `FEAT-01`, `FEAT-02`...
6. **Define Out of Scope**

## Output

`.specs/features/[feature]/spec.md`

## Auto-Trigger

If ambiguous areas detected during specify → suggest `/skill:l-spec-discuss`

## Next Step

After completing specify:
- **Ambiguous gray areas found** → `/skill:l-spec-discuss`
- **No ambiguity, architectural decisions needed** → `/skill:l-spec-design`
- **Straightforward, no design needed** → `/skill:l-spec-tasks`
- **Simple feature (≤3 files)** → `/skill:l-spec-execute`