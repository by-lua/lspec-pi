---
name: l-spec-bugfix
description: >-
  Quick mode for small bugs (≤3 files), full cycle for complex ones. Identifies,
  specifies, and fixes bugs with verification.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: bugfix
  next: none
---

# L-Spec Bugfix

Quick mode for small bugs, full cycle for complex ones.

## Prerequisites

- ✅ Bug description provided or asked

## Process

1. **Identify and document** — reproduction, impact, root cause
2. **Quick discovery** — 1-2 questions about the solution
3. **Specify the fix** as mini-feature
4. **Execute with TDD**

## Auto-Sizing

- **Small bug (≤3 files)** → Quick mode: Describe → Fix → Verify → Commit
- **Complex bug** → Full cycle: Discovery → Specify → Design (if needed) → Tasks → Execute

## Output

`.specs/fixes/NNN-description/`