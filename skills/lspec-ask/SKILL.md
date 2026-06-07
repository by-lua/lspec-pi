---
name: lspec-ask
description: "Asks a question about the project, decision, or technical context. Determines which pipeline phase to activate."
---

# ask

Asks a question to understand context, determine type of work, and activate the correct pipeline phase.

**CRITICAL WARNING:**
- Respond ONLY with questions from the current phase
- NEVER skip phases or dump all questions at once
- CONFIRM before continuing to the next phase
- NEVER skip to implementation during Discovery

**Pipeline:** Discovery → Discuss (OPTIONAL) → Specify → Clarify (OPTIONAL) → Design (OPTIONAL) → Tasks → Execute

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

---

## Feature Flow (focused)

1. What should the feature do?
2. Who will use it?
3. How do you know it's done?

→ Generates `features/[feature]/spec.md`

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

### Phase 4: References

12. Any design reference?

If there is: create `.specs/design-references/`

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

## Discuss (OPTIONAL)

**Goal:** Capture HOW the user envisions the feature when the spec has ambiguous areas. This is NOT a separate phase — it's triggered within Specify when the agent detects gray areas that need user input.

**Trigger:** Automatically when gray areas are detected during spec creation, or explicitly via "discuss feature", "how should this work?", "capture context"

**When to trigger (auto-detect):** The spec contains user-facing behavior that could go multiple ways AND the user hasn't expressed a preference. If the spec is clear and unambiguous, skip this entirely.

**When NOT to trigger:** Infrastructure work, CRUD operations, well-defined API contracts, anything where the "how" is obvious from the "what".

### Why This Phase Exists

Specifications capture WHAT to build. Design captures the architecture. But neither captures the user's vision for ambiguous areas — layout preferences, interaction patterns, error handling style, content tone. Without this, the agent guesses. With this, the agent builds what the user actually imagined.

The output — `context.md` — feeds directly into Design and Tasks:

- **Design reads it** to know what decisions are locked vs. flexible
- **Tasks reads it** to include specific behaviors in task definitions

### Process

#### 1. Analyze the Feature

Read `.specs/features/[feature]/spec.md` and identify the domain:

| Domain | Gray areas to explore |
| ------------------------------ | ------------------------------------------------------------- |
| Something users **SEE** | Layout, density, interactions, empty states, visual hierarchy |
| Something users **CALL** (API) | Response format, errors, auth, versioning, rate limiting |
| Something users **RUN** (CLI) | Output format, flags, modes, error handling, verbosity |
| Something users **READ** | Structure, tone, depth, flow, navigation |
| Something being **ORGANIZED** | Grouping criteria, naming, duplicates, exceptions |

Generate 3-4 **feature-specific** gray areas. Not generic categories, but concrete decisions for THIS feature.

#### 2. Present Gray Areas

Present the feature boundary (from spec.md) and the gray areas to the user. Let them choose which to discuss. Do NOT include a "skip all" option — the user invoked this phase to discuss.

#### 3. Deep-Dive Each Area

For each selected area:

1. Ask 3-4 concrete questions with specific options (not vague categories)
2. After the questions, check: "More about [area], or move on?"
3. If more → ask 3-4 more, check again
4. After all areas → "Ready to create context?"

**Question design:**

- Options should be concrete ("Card layout" not "Option A")
- Each answer should inform the next question
- Include "You decide" as an option when reasonable — captures agent discretion

#### 4. Scope Guardrail (CRITICAL)

The feature boundary from spec.md is **fixed**. Discussion clarifies HOW to implement, never WHETHER to add new capabilities.

**Allowed:** "How should posts be displayed?" (clarifying ambiguity)
**Not allowed:** "Should we also add comments?" (new capability)

When user suggests scope creep: "That sounds like a separate feature. I'll note it in Deferred Ideas. Back to [current area]."

#### 5. Write context.md

---

## Template: `.specs/features/[feature]/context.md`

```markdown
# [Feature] Context

**Gathered:** [date]
**Spec:** `.specs/features/[feature]/spec.md`
**Status:** Ready for design

---

## Feature Boundary

[Clear statement of what this feature delivers — the scope anchor from spec.md]

---

## Implementation Decisions

### [Area 1 that was discussed]

- [Specific decision made]
- [Another decision if applicable]

### [Area 2 that was discussed]

- [Specific decision made]

### [Area 3 that was discussed]

- [Specific decision made]

### Agent's Discretion

[Areas where user explicitly said "you decide" — agent has flexibility here during design/implementation]

---

## Specific References

[Any "I want it like X" moments, product references, specific behaviors, interaction patterns mentioned during discussion]

[If none: "No specific requirements — open to standard approaches"]

---

## Deferred Ideas

[Ideas that came up during discussion but belong in other features/phases. Captured here so they're not lost, but explicitly out of scope]

[If none: "None — discussion stayed within feature scope"]
```

---

## Tips

- **Decisions, not vision** — "Card-based layout with subtle shadows" is a decision. "Should feel modern" is not.
- **Scope is sacred** — Deferred Ideas captures scope creep without losing ideas
- **User = visionary, Agent = builder** — Ask about how they imagine it, not about technical implementation
- **Don't ask about:** Technical architecture, performance, implementation details — that's Design's job
- **Confirm before Design** — User approves context.md before moving to design phase

---

## Clarify (OPTIONAL)

Spec review and clarification.

**Checklist:**
- [ ] All terms defined?
- [ ] ALL acceptance criteria are testable?
- [ ] Out of scope clear?
- [ ] Unique requirement IDs?

**Fix vagueness:**
- Replace "must be fast" → "SHALL respond in <200ms"
- Replace "good UX" → specific criteria
- Replace "secure" → specific controls

---

## Design (OPTIONAL)

Technical design decisions (API, schema, flow).

**If necessary:**
- Flow diagram
- API endpoints
- Data model
- Dependencies

**When to SKIP this phase:**
- Direct change — no architectural decisions, no new patterns
- Simple feature that can be implemented inline during Execute
- Only adjustments to existing code without structural changes

---

## Output

```
features/
└── [feature]/
    └── spec.md
```

---

## Rules

**NEVER:**
- quick mode
- auto-sizing
- skip required phases

**ALWAYS:**
- autosave at each phase transition
- confirm before advancing

**Structure:** everything in `features/`, no `fixes/`
