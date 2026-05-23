---
name: l-spec
description: >-
  Project and feature planning with 5 adaptive phases: Discovery, Specify,
  Design, Tasks, Execute. Based on TLC Spec-Driven v2.0.0 with enhanced
  deep discovery (22 questions, 6 phases), design references, and pluggable
  subagents. Use when starting new projects, mapping existing codebases,
  planning features, implementing with atomic commits, or pausing/resuming
  work across sessions.
license: CC-BY-4.0
metadata:
  based-on: tlc-spec-driven v2.0.0 by Felipe Rodrigues
  version: 1.0.0
---

# L-Spec — Spec-Driven Development

> Plan and implement projects with precision. Enhanced discovery, design references, pluggable subagents.

```
┌───────────┐   ┌─────────┐   ┌────────┐   ┌───────┐
│ DISCOVERY │ → │ SPECIFY │ → │ DESIGN │ → │ TASKS │ → EXECUTE
└───────────┘   └─────────┘   └────────┘   └───────┘
   required       required      optional*    optional*    required

* Agent auto-skips when scope doesn't need it. Quick mode for small changes (≤3 files).
```

## Auto-Sizing

The complexity determines the depth, not a fixed pipeline. Before starting any feature, assess its scope and apply only what's needed:

| Scope | What | Discovery/Specify | Design | Tasks | Execute |
|-------|------|-------------------|--------|-------|---------|
| **Small** | ≤3 files, one sentence | Quick mode — skip pipeline entirely | - | - | - |
| **Medium** | Clear feature, <10 tasks | Discovery optional, spec (brief) | Skip — inline | Skip | Implement + verify |
| **Large** | Multi-component feature | Discovery + Full spec + IDs | Architecture + components | Full breakdown + deps | Implement + verify per task |
| **Complex** | Ambiguity, new domain | Discovery + Full spec + discuss gray areas | Research + architecture | Breakdown + parallel plan | Implement + verification per task |

**Rules:**
- Discovery, Specify and Execute are always required
- Design is skipped when straightforward (no architectural decisions)
- **Design is REQUIRED when `design-references/` exists** — references need architectural integration
- Tasks is skipped when ≤3 obvious steps
- Discuss triggered within Specify when ambiguous gray areas detected
- Quick mode for bug fixes, config changes, small tweaks (≤3 files, one sentence scope)

**Quick mode process:** Describe → Implement → Verify → Commit

## Commands

All commands use `/skill:l-spec <command>` format.

### Project-Level

| Command | What it does |
|---------|-------------|
| `/skill:l-spec discovery` | Deep project init — 22 questions in 6 phases, captures design references |
| `/skill:l-spec map` | Analyze existing codebase → 7 docs (stack, arch, conventions, structure, testing, integrations, concerns) |
| `/skill:l-spec pause` | Save STATE.md + HANDOFF.md for resumption |
| `/skill:l-spec resume` | Load STATE.md + HANDOFF.md, show where you left off |
| `/skill:l-spec next` | Go to next step manually |
| `/skill:l-spec auto` | Run all phases automatically with auto-sizing |

### Feature-Level

| Command | What it does |
|---------|-------------|
| `/skill:l-spec specify` | Define WHAT to build with testable requirements |
| `/skill:l-spec discuss` | Capture user decisions on gray areas |
| `/skill:l-spec design` | Define HOW — architecture, components, code reuse |
| `/skill:l-spec tasks` | Create task plan with dependencies and phases |
| `/skill:l-spec execute` | Follow task plan — RED/GREEN/GATE/COMMIT per task |
| `/skill:l-spec bugfix` | Quick mode for small bugs, full cycle for complex |
| `/skill:l-spec feature-clarify` | Pre-feature rapid questions — 5 basic context captures before specifying |

## Discovery (22 Questions, 6 Phases)

### Phase 1: Context & Problem
1. What's the project about? Describe in one sentence.
2. What problem are you solving? Who has this problem?
3. How do you know this is a real problem? (data, feedback, instinct?)
4. What's the current situation / workaround? What sucks about it?
5. What happens if you DON'T build this?

### Phase 2: Vision & Scope
6. What does success look like? How will you measure it?
7. What's the MVP? The absolute minimum to launch?
8. What's explicitly OUT of scope for now?
9. Who's the target user? Describe them.
10. Any non-functional requirements? (performance, security, scale, compliance)

### Phase 3: Technical Stack
11. What language / framework / platform?
12. Is there existing code to integrate with?
13. Any constraints? (budget, team size, timeline, hosting, APIs)
14. Preference for backend / frontend / database?

### Phase 4: Design References
15. **Any design references?** (screenshot, HTML, mockup, Figma link)
    - If yes → create `.specs/design-references/` with files
    - Generate `README.md` describing each reference
    - Extract visual patterns: colors, layout, components, interactions

### Phase 5: Prior Art & Risks
16. What has been tried before? What didn't work?
17. Biggest risk? What could kill this project?
18. Hardest part — technically or otherwise?
19. Any deadline? Fixed date or "when it's ready"?

### Phase 6: Milestones
20. How would you break this into milestones?
21. First thing you want working?
22. "Wow" feature for launch?

**Output:** `.specs/project/PROJECT.md`

## Specify

Defines WHAT to build with testable, traceable requirements.

**Process:**
1. **Clarify Requirements** — start conversational, let user dump their mental model
   - Ask open: "What problem?", "Who is the user?", "What does success look like?"
   - **Challenge vagueness** — "Good" means what? "Users" means who? "Simple" means how?
2. **Capture User Stories with Priorities**
   - P1 = MVP (must ship), P2 = should have, P3 = nice to have
   - Each story must be independently testable
3. **Write Acceptance Criteria** — WHEN/THEN/SHALL format
   - `WHEN [event/action] THEN system SHALL [response/behavior]`
4. **Document Edge Cases** — what breaks? what's empty? what's huge?
5. **Assign Requirement IDs** — `FEAT-01`, `FEAT-02`...
6. **Define Out of Scope**
7. If ambiguous areas → trigger `/skill:l-spec discuss`

**Output:** `.specs/features/[feature]/spec.md`

## Discuss

Captures user decisions on gray areas.

**When to trigger:**
- Multiple valid layout/UI approaches
- API design trade-offs
- Error handling strategies
- Data structure choices
- Any "it depends" situation

**Process:**
- Present each gray area with trade-offs
- Capture user's decision
- Mark items as "User Decided" or "Agent's Discretion"
- Confirm understanding before proceeding

**Output:** `.specs/features/[feature]/context.md`

## Design

Defines HOW to build — architecture, components, code reuse.

> Design is auto-skipped for straightforward changes (no architectural decisions, no new patterns).

**Process:**
1. **Load Context** — read spec.md, context.md, design-references/
2. **Research** — unfamiliar tech → research before designing
3. **Define Architecture** — component interactions (use mermaid diagrams)
4. **Identify Code Reuse** — what exists that we can leverage
5. **Define Components & Interfaces** — purpose, location, interfaces, deps
6. **Define Data Models** — if feature involves data
7. **Error Handling Strategy** — what breaks, how handled
8. **Document Tech Decisions** — only non-obvious ones with rationale

**Knowledge Verification Chain** (strict order):
```
Codebase → Project docs → Web search → Flag as uncertain
```
- Never skip to "uncertain" if earlier steps available
- Never fabricate — "I don't know" is always better than inventing

**Output:** `.specs/features/[feature]/design.md`

## Tasks

Creates the complete task plan.

**Process:**
1. Review design, spec, and TESTING.md
2. Break into atomic tasks (one task = one component / one function / one file)
3. Define dependencies
4. Create execution plan with phases (sequential + parallel with `[P]` marker)
5. Validate: granularity check + diagram cross-check + test co-location

Each task includes:
- **What** — description
- **Where** — files to create/modify
- **Depends on** — prerequisite tasks
- **Reuses** — existing code to leverage
- **Done when** — success criteria
- **Tests** — what and how
- **Gate** — verification command
- **`[P]` marker** — parallel execution

**Output:** `.specs/features/[feature]/tasks.md`

## Execute

Follows the task plan — one task at a time.

**Per-task cycle:**
1. **Plan** — state assumptions, files to touch, success criteria
2. **RED** — write tests that fail
3. **GREEN** — minimum implementation to pass
4. **GATE CHECK** — verification command (tests, lint, build)
5. **REVIEW** — test count, spec deviation, complexity
6. **COMMIT** — atomic commit per task
7. **REPEAT** — next task

**Subagent execution:** Each task delegated with clean context (only task's spec + design + conventions + TESTING.md). Subagent returns: status, files changed, gate result, issues.

**Output:** Code + `.specs/features/[feature]/SUMMARY.md`

## Bugfix

Quick mode for small bugs (≤3 files), full cycle for complex ones.

**Process:**
1. Identify and document (reproduction, impact, root cause)
2. Quick discovery (1-2 questions about the solution)
3. Specify the fix as mini-feature
4. Execute with TDD

**Output:** `.specs/fixes/NNN-description/`

## Feature Clarify

Pre-feature rapid context capture. Lightweight — not a full discovery.

> ✅ If `.specs/project/PROJECT.md` doesn't exist → redirect user to run `/skill:l-spec discovery` first.

**5 rapid questions:**
1. What feature? (one-sentence description)
2. Who uses it? (user/case)
3. What already exists? (current code, screens, APIs)
4. Any references? (design, screenshot, link)
5. Any blockers or deadlines?

**Behavior:**
- After answers → save to `.specs/features/[feature]/intake.md`
- If feature ≤3 files → ask: "Want to skip to quick mode execution?"
- If feature needs proper spec → suggest: "Run `/skill:l-spec specify [feature]` now?"

**Output:** `.specs/features/[feature]/intake.md`

## Map

Analyzes existing codebase.

**Output (7 files in `.specs/codebase/`):**
- `STACK.md` — language, framework, database, infrastructure
- `ARCHITECTURE.md` — high-level component relationships
- `CONVENTIONS.md` — naming, patterns, coding style
- `STRUCTURE.md` — directory layout, file organization
- `TESTING.md` — test framework, patterns, commands
- `INTEGRATIONS.md` — external services, APIs, dependencies
- `CONCERNS.md` — tech debt, fragile areas, bugs, risks

## Directory Structure

```
.specs/
├── project/
│   ├── PROJECT.md      # Vision & goals
│   ├── ROADMAP.md      # Milestones
│   └── STATE.md        # Memory: decisions, blockers, lessons
├── design-references/
│   ├── ref-01.html
│   ├── ref-01.png
│   └── README.md
├── codebase/
│   ├── STACK.md
│   ├── ARCHITECTURE.md
│   ├── CONVENTIONS.md
│   ├── STRUCTURE.md
│   ├── TESTING.md
│   ├── INTEGRATIONS.md
│   └── CONCERNS.md
├── features/
│   └── [feature]/
│       ├── spec.md     # Requirements
│       ├── context.md  # User decisions
│       ├── design.md   # Architecture & components
│       ├── tasks.md    # Atomic tasks
│       └── SUMMARY.md  # Post-execution
└── fixes/
    └── NNN-description/
        ├── spec.md
        ├── code/
        └── verification.md
```

## State Management

Auto-updated at end of each phase in `STATE.md`:
- **AD-NNN** — Architectural decisions
- **B-NNN** — Blockers
- **L-NNN** — Lessons learned
- Deferred ideas, todos

## Design References

**During discovery:** Question 15 asks about design references. If yes:
1. Create `.specs/design-references/` at project level
2. Save files (screenshot → .png, HTML → .html, link → document)
3. Generate README.md describing each reference
4. Extract visual patterns: colors, layout, components, interactions

**During design:** If `design-references/` exists, orchestrator incorporates references.

## Subagents

L-Spec defines **when** to use subagents. A separate subagent skill defines **which** subagent (model, tools, prompt).

| Phase | Subagent receives | Subagent produces |
|-------|------------------|------------------|
| Design | spec.md + design-references/ + context.md | design.md |
| Execute | tasks.md + spec.md + design.md + TESTING.md + CONVENTIONS.md | Code + verification report |

**Recommended roles** (define in separate skill):
- **Designer** — architecture, components (model with large context)
- **Coder** — implement tasks (fast, cost-effective)
- **Reviewer** — verify spec compliance, code quality

## Context Loading

**Base load:** PROJECT.md + ROADMAP.md + STATE.md (≈15k tokens)

**On-demand (load as needed):**
- Codebase docs, CONCERNS.md, TESTING.md, spec.md, context.md, design.md, tasks.md

**Never simultaneously:** multiple feature specs, multiple architecture docs, archived documents

## Rules

1. Quick mode for small changes (≤3 files) — full cycle for bigger
2. Always ask "Any design/visual references?" before creating
3. Spec is truth — if code deviates, mark SPEC_DEVIATION
4. STATE.md always updated — clean resumption between sessions
5. Clean context for subagents — only spec + current task
6. WHEN/THEN/SHALL — acceptance criteria must be testable
