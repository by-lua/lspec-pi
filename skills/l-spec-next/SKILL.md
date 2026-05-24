---
name: l-spec-next
description: >-
  Go to the next phase in the L-Spec pipeline manually. Reads STATE.md to
  determine current phase and suggests/starts the next one.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: next
  next: varies
---

# L-Spec Next — Advance Phase

Go to next step manually by reading STATE.md.

## Prerequisites

- ✅ `.specs/project/STATE.md` must exist
- ❌ If no STATE.md → tell user: "No project state found. Start with `/skill:l-spec-discovery`."

## Process

1. Read `.specs/project/STATE.md` to determine current phase
2. Determine next phase in the pipeline:
   - After **discovery** → **feature-clarify** or **specify**
   - After **feature-clarify** → **specify**
   - After **specify** → **discuss** (if ambiguous) or **design**
   - After **discuss** → **design**
   - After **design** → **tasks**
   - After **tasks** → **execute**
   - After **execute** → **pause** or done
3. Load and run the next phase's skill

## Next Step

Automatically determined by current pipeline position.