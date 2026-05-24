---
name: l-spec-feature-clarify
description: >-
  Pre-feature rapid questions — 5 basic context captures before specifying.
  Lightweight intake for adding features to an existing project.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: feature-clarify
  next: specify
---

# L-Spec Feature Clarify — 5 Rapid Questions

Pre-feature rapid context capture. Lightweight — not a full discovery.

## Prerequisites

- ✅ `.specs/project/PROJECT.md` must exist (project initialized)
- ❌ If NO PROJECT.md → tell user: "Run `/skill:l-spec-discovery` first to initialize the project."

## Process

Ask these 5 rapid questions:

1. **What feature?** (one-sentence description)
2. **Who uses it?** (user/case)
3. **What already exists?** (current code, screens, APIs)
4. **Any references?** (design, screenshot, link)
5. **Any blockers or deadlines?**

## Output

Save to `.specs/features/[feature]/intake.md`

## Next Step

After answers:
- Feature **≤3 files** → ask: "Want to skip to quick mode execution?"
- Feature **needs proper spec** → suggest: `/skill:l-spec-specify`