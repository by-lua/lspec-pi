---
name: lspec-discovery
description: "Discovers and documents initial project context. Adaptive discovery — depth varies by type (new, bug, feature)."
---

# Discovery — Initial Context

**CRITICAL WARNING:**
- Respond ONLY with questions from the current phase
- NEVER skip phases or dump all questions at once
- CONFIRM before continuing to the next phase
- NEVER skip to implementation during Discovery

**Pipeline:** Discovery → Discuss? → Specify → Clarify? → Design? → Tasks → Execute

---

## AUTO-DETECTION (run first)

```bash
# Check project type
if [ -f ".specs/project/PROJECT.md" ]; then
  echo "EXISTING"
elif [ -d ".specs/features" ]; then
  echo "EXISTING"
elif [ -d "$(find . -name '*.py' -o -name '*.js' -o -name '*.ts' 2>/dev/null | head -1)" ]; then
  echo "CODE_ONLY"
else
  echo "NEW"
fi
```

**Decision matrix:**

| Context | Action |
|----------|------|
| EXISTING + bug in msg | Bug Flow — discover the bug |
| EXISTING + feature in msg | Feature Flow — discover the feature |
| EXISTING + no context | "Listening..." — listen to the user |
| CODE_ONLY | Suggest `/lspec reverse` first |
| NEW | 6 complete phases |

---

## Adaptive Flow

**NEW PROJECT:** 6 complete phases

**BUG:** 3 short phases (focus on the problem)

**FEATURE:** 4 focused phases

---

## Bug Flow (short)

1. What is not working?
2. What is the expected vs current behavior?
3. How to reproduce the bug?

→ Generates `features/bug-[name]/spec.md`

**When finished:** "Bug documented. Do you want to advance to Tasks (required — fix the bug)?"

---

## Feature Flow (focused)

1. What should the feature do?
2. Who will use it?
3. How do you know it's done?

→ Generates `features/[feature]/spec.md`

**When finished:** "Feature documented. Do you want to advance to Tasks (required)?"

---

## New Project — 6 Phases

### Phase 1: Context and Problem

1. What is the project goal?
2. What problem does it solve? Who has this problem?
3. How do you know it's a real problem?
4. What happens if you don't build it?

> CONFIRM before continuing

### Phase 2: Vision and Scope

5. How do you define success?
6. What is the MVP?
7. What is out of scope?
8. Who is the target user?

> CONFIRM before continuing

### Phase 3: Technical Stack

9. What language/framework?
10. Existing code to integrate?
11. Constraints (budget, team, deadline)?

> CONFIRM before continuing

### Phase 4: References and Preferences

12. Any design reference? (Figma, screenshots, sites)

If there is: create `design-references/`

13. Any design preferences? (how you want it to look, style, tones, layout)

These preferences will be captured in the Design phase. Example: "I want it to have a minimalist feel" or "I prefer dark colors".

> Design (optional) will capture your preferences in detail

> CONFIRM before continuing

### Phase 5: Risks

13. What has been tried before?
14. What is the biggest risk?
15. Hardest part?

> CONFIRM before continuing

### Phase 6: Milestones

16. How to divide into stages?
17. First thing that works?

→ Generates `PROJECT.md`

---

## Continuation Flow

**Discovery complete.**

→ Do you want to advance to **Discuss** (optional — gray areas/ambiguity)?

If not: save state in `STATE.md` and wait for new instructions.

---

## Output

```
.specs/
├── project/
│   ├── PROJECT.md
│   ├── ROADMAP.md
│   └── STATE.md
└── features/
    └── [feature]/
        └── spec.md
```

---

## Validation Checklist

- [ ] Vision in 1-2 sentences
- [ ] Problem with evidence
- [ ] Scope defined (in/out)
- [ ] Success metrics
- [ ] First milestone defined
