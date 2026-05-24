---
name: l-spec-discuss
description: >-
  Capture user decisions on gray areas and trade-offs. Triggered when specify
  reveals ambiguous choices with multiple valid approaches.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: discuss
  next: design
---

# L-Spec Discuss — Gray Area Decisions

Captures user decisions on gray areas.

## Prerequisites

- ✅ `.specs/features/[feature]/spec.md` must exist

## When to Trigger

- Multiple valid layout/UI approaches
- API design trade-offs
- Error handling strategies
- Data structure choices
- Any "it depends" situation

## Process

- Present each gray area with trade-offs
- Capture user's decision
- Mark items as "User Decided" or "Agent's Discretion"
- Confirm understanding before proceeding

## Output

`.specs/features/[feature]/context.md`

## Next Step

After completing discuss → suggest `/skill:l-spec-design`