---
name: l-spec-map
description: >-
  Analyze existing codebase → 7 docs (STACK, ARCHITECTURE, CONVENTIONS,
  STRUCTURE, TESTING, INTEGRATIONS, CONCERNS). For onboarding onto existing projects.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: map
  next: feature-clarify, specify
---

# L-Spec Map — Codebase Analysis

Analyzes existing codebase.

## Prerequisites

- ✅ Must be inside a project directory with existing code

## Output (7 files in `.specs/codebase/`)

- `STACK.md` — language, framework, database, infrastructure
- `ARCHITECTURE.md` — high-level component relationships
- `CONVENTIONS.md` — naming, patterns, coding style
- `STRUCTURE.md` — directory layout, file organization
- `TESTING.md` — test framework, patterns, commands
- `INTEGRATIONS.md` — external services, APIs, dependencies
- `CONCERNS.md` — tech debt, fragile areas, bugs, risks

## Next Step

After mapping → suggest:
- **Add a feature** → `/skill:l-spec-feature-clarify`
- **Understand code** → `/skill:l-spec-ask`