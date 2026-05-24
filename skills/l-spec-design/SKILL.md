---
name: l-spec-design
description: >-
  Define HOW to build — architecture, components, code reuse. Skipped automatically
  for straightforward changes with no architectural decisions.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: design
  next: tasks
---

# L-Spec Design — Architecture & Components

Defines HOW to build — architecture, components, code reuse.

## Prerequisites

- ✅ `.specs/features/[feature]/spec.md` must exist
- ✅ If `.specs/design-references/` exists → design is REQUIRED (not optional)
- ⚠️ If no architectural decisions needed → suggest skipping to `/skill:l-spec-tasks`

## Auto-Skip Rule

Design is auto-skipped for straightforward changes (no architectural decisions, no new patterns).
**Design is REQUIRED when `design-references/` exists** — references need architectural integration.

## Process

1. **Load Context** — read spec.md, context.md, design-references/
2. **Research** — unfamiliar tech → research before designing
3. **Define Architecture** — component interactions (use mermaid diagrams)
4. **Identify Code Reuse** — what exists that we can leverage
5. **Define Components & Interfaces** — purpose, location, interfaces, deps
6. **Define Data Models** — if feature involves data
7. **Error Handling Strategy** — what breaks, how handled
8. **Document Tech Decisions** — only non-obvious ones with rationale

## Knowledge Verification Chain (strict order)

```
Codebase → Project docs → Web search → Flag as uncertain
```
- Never skip to "uncertain" if earlier steps available
- Never fabricate — "I don't know" is always better than inventing

## Output

`.specs/features/[feature]/design.md`

## Next Step

After completing design → suggest `/skill:l-spec-tasks`