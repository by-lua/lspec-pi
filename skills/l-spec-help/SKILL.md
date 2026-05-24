---
name: l-spec-help
description: >-
  List all L-Spec commands with descriptions and pipeline order.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: help
  next: varies
---

# L-Spec Help — Command Reference

List all L-Spec commands with descriptions.

## Commands

### Pipeline Order

```
discovery → feature-clarify? → specify → discuss? → design? → tasks? → execute
```

### Project-Level

- `/skill:l-spec-discovery` — Deep project init. 22 questions, 6 phases
- `/skill:l-spec-feature-clarify` — Pre-feature 5 rapid questions
- `/skill:l-spec-map` — Analyze existing codebase → 7 docs
- `/skill:l-spec-pause` — Save STATE + HANDOFF for resumption
- `/skill:l-spec-resume` — Load STATE + HANDOFF, show where you left off
- `/skill:l-spec-next` — Go to next phase manually
- `/skill:l-spec-auto` — Run all phases automatically with auto-sizing

### Feature-Level

- `/skill:l-spec-specify` — Define WHAT with testable requirements
- `/skill:l-spec-discuss` — Capture user decisions on gray areas
- `/skill:l-spec-design` — Define HOW — architecture, components
- `/skill:l-spec-tasks` — Create task plan with dependencies
- `/skill:l-spec-execute` — Follow task plan (RED/GREEN/GATE/COMMIT)

### Utility

- `/skill:l-spec-bugfix` — Quick mode for bugs, full cycle for complex
- `/skill:l-spec-ask` — Ask about existing code (no planning)
- `/skill:l-spec-help` — This command

## Quick Guide

```
NEW PROJECT       → discovery → feature-clarify? → specify → discuss? → design? → tasks? → execute
EXISTING PROJECT:
  No .specs yet?  → map → then use any command
  New feature     → feature-clarify? → specify → discuss? → design? → tasks? → execute
  Quick idea      → specify (skip clarify)
  Understand code → ask
  Fix a bug       → bugfix
  Map codebase    → map
```

`?` = optional (agent decides by complexity)