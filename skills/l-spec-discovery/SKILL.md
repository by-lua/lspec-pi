---
name: l-spec-discovery
description: >-
  Deep project initialization — 22 questions in 6 phases. First command for new
  projects. Creates PROJECT.md, ROADMAP.md, STATE.md, and captures design references.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: discovery
  next: feature-clarify, specify, auto
---

# L-Spec Discovery — 22 Questions, 6 Phases

Deep project init. This is always the **first command** for a new project.

## Prerequisites

- ✅ None — this is the entry point
- ❌ If `.specs/project/PROJECT.md` already exists → warn: "Project already initialized. Run `/skill:l-spec-feature-clarify` or `/skill:l-spec-map` instead."

## Process — ASK PHASE BY PHASE, NEVER ALL AT ONCE

**CRITICAL:** Present one phase at a time. Ask all questions in that phase, collect answers, then move to the next phase. Do NOT dump all 22 questions at once.

### Phase 1: Context & Problem
Ask questions 1-5, collect answers, then proceed to Phase 2.

1. What's the project about? Describe in one sentence.
2. What problem are you solving? Who has this problem?
3. How do you know this is a real problem? (data, feedback, instinct?)
4. What's the current situation / workaround? What sucks about it?
5. What happens if you DON'T build this?

### Phase 2: Vision & Scope
Ask questions 6-10, collect answers, then proceed to Phase 3.

6. What does success look like? How will you measure it?
7. What's the MVP? The absolute minimum to launch?
8. What's explicitly OUT of scope for now?
9. Who's the target user? Describe them.
10. Any non-functional requirements? (performance, security, scale, compliance)

### Phase 3: Technical Stack
Ask questions 11-14, collect answers, then proceed to Phase 4.

11. What language / framework / platform?
12. Is there existing code to integrate with?
13. Any constraints? (budget, team size, timeline, hosting, APIs)
14. Preference for backend / frontend / database?

### Phase 4: Design References
Ask question 15, collect answers, then proceed to Phase 5.

15. **Any design references?** (screenshot, HTML, mockup, Figma link)
    - If yes → create `.specs/design-references/` with files
    - Generate `README.md` describing each reference
    - Extract visual patterns: colors, layout, components, interactions

### Phase 5: Prior Art & Risks
Ask questions 16-19, collect answers, then proceed to Phase 6.

16. What has been tried before? What didn't work?
17. Biggest risk? What could kill this project?
18. Hardest part — technically or otherwise?
19. Any deadline? Fixed date or "when it's ready"?

### Phase 6: Milestones
Ask questions 20-22, collect answers. Discovery complete.

20. How would you break this into milestones?
21. First thing you want working?
22. "Wow" feature for launch?

## Output

Creates `.specs/project/PROJECT.md` with all answers organized.
Also creates `ROADMAP.md` (milestones) and `STATE.md` (memory).

## Next Step

After completing discovery, suggest:
- **Add a feature** → `/skill:l-spec-feature-clarify`
- **Specify directly** → `/skill:l-spec-specify`
- **Run full pipeline automatically** → `/skill:l-spec-auto`