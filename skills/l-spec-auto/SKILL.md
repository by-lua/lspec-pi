---
name: l-spec-auto
description: >-
  Run all phases automatically with auto-sizing. Agent decides depth based on
  complexity: small features skip pipeline, medium get brief spec, large get full cycle.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: auto
  next: none
---

# L-Spec Auto — Full Pipeline with Auto-Sizing

Run all phases automatically with auto-sizing.

## Prerequisites

- ✅ If no `.specs/project/PROJECT.md` → starts with discovery

## Auto-Sizing

The complexity determines the depth, not a fixed pipeline:

| Scope | What | Pipeline |
|-------|------|----------|
| **Small** | ≤3 files, one sentence | Quick mode — skip pipeline, Describe → Implement → Verify → Commit |
| **Medium** | Clear feature, <10 tasks | Spec (brief) → Implement + verify |
| **Large** | Multi-component feature | Discovery → Specify → Design → Tasks → Execute |
| **Complex** | Ambiguity, new domain | Discovery → Specify → Discuss → Design → Tasks → Execute |

## Rules

- Discovery, Specify and Execute are always required
- Design is skipped when straightforward (no architectural decisions)
- **Design is REQUIRED when `design-references/` exists**
- Tasks is skipped when ≤3 obvious steps
- Discuss triggered within Specify when ambiguous gray areas detected
- Quick mode for bug fixes, config changes, small tweaks (≤3 files)

## Process

1. Assess scope (small/medium/large/complex)
2. Apply auto-sizing rules
3. Run phases in order, skipping as appropriate
4. Create all output files
5. Update STATE.md at each phase

## Next Step

Auto completes the full pipeline. Use `/skill:l-spec-pause` to save state at any point.