<p align="center">
  <img src="https://img.shields.io/badge/Skill-L--Spec%20PI-blue?style=for-the-badge" alt="skill badge" />
  <img src="https://img.shields.io/badge/Mode-Discovery%20Adaptive-green?style=for-the-badge" alt="discovery adaptive" />
  <img src="https://img.shields.io/badge/Version-3.0.0-purple?style=for-the-badge" alt="version" />
</p>

<h1 align="center">🎯 L-Spec PI</h1>

<p align="center">
  <strong>Spec-Driven Development for PI: adaptive discovery, task-oriented execution, and real session continuity.</strong>
</p>

<p align="center">
  <strong>Maintained by:</strong> <a href="https://github.com/by-lua">by-lua</a>
</p>

<p align="center">
  <sub>Conceptual base inspired by TLC Spec-Driven (Tech Lead's Club), with practical evolution and upgrades in the PI ecosystem.</sub>
</p>

## ✨ What is SDD and what is L-Spec PI?

**SDD (Spec-Driven Development)** is developing by specification first and code later.
In L-Spec PI, this becomes a practical workflow for AI: discovery, definition, task breakdown, and verifiable execution.

**L-Spec PI** organizes work in a consistent flow, maintaining rigor without skipping essential steps.

```
┌───────────┐   ┌──────────┐   ┌──────────┐   ┌─────────┐   ┌─────────┐
│ DISCOVERY │ → │ SPECIFY  │ → │ CLARIFY* │ → │ DESIGN* │ → │  TASKS  │ → │ EXECUTE │
└───────────┘   └──────────┘   └──────────┘   └─────────┘   └─────────┘
   required        required       optional      optional      required      required

* Optional by task context
```

## ❓ Why does this exist?

Most AI programming sessions waste **40–60% of tokens** on rewrites, clarifications, and "I thought you meant...".

**L-Spec** solves this by specifying what needs to be done **before coding** — so each token generates value, not guesswork.

| Without SDD | With L-Spec |
|---|---|
| ❌ "Create a login for me" → AI tries → rewrite → rewrite | ✅ First discovery → AI knows exactly what you need |
| ❌ No proof until the end (or never) | ✅ RED/GREEN/GATE — each feature is verified before advancing |
| ❌ Knowledge is lost when context rolls | ✅ `.specs/` stays in the repository — any AI continues from where it left off |
| ❌ Scope grows silently ("just one more thing") | ✅ Out of scope is defined first — changes become conscious decisions |

**Result:** fewer rewrites, fewer bugs, cleaner commits, and projects that survive between sessions.

## 🚀 Install, upgrade, and removal

### Prerequisites (required)

- **PI.dev** installed and functional

### Install L-Spec

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash
```

### Upgrade

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/update.sh | bash
```

### Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/uninstall.sh | bash
```

## 🧩 Navigation Tools (built-in to PI.dev)

PI.dev provides native navigation tools — no installation needed:

**cymbal_* — structural navigation:**
- `cymbal_map`, `cymbal_search`, `cymbal_outline`, `cymbal_show`, `cymbal_refs`, `cymbal_impact`, `cymbal_importers`, `cymbal_impls`

**lsp_* — technical precision:**
- `lsp_goto_definition`, `lsp_find_references`, `lsp_diagnostics`, `lsp_symbols`, `lsp_rename`

## ➕ Optional PI packages (strongly recommended)

| Package | Install | Why |
|---|---|---|
| `pi-lens` | `pi install npm:pi-lens` | LSP, linters, formatters, type-checking, structural analysis |
| `pi-hermes-memory` | `pi install npm:pi-hermes-memory` | Persistent memory + session search + secret scanning |
| `@gotgenes/pi-subagents` | `pi install npm:@gotgenes/pi-subagents` | Autonomous subagents like Claude Code style |

> **Mermaid Diagrams:** PI.dev doesn't have a native package. Use inline `mermaid` blocks in markdown — renders in any viewer that supports Mermaid.

## 🤖 Recommended: L-Spec Subagents (by-lua)

If you want to extract more quality from execution, also use the extension:

- **Repo:** https://github.com/by-lua/lspec-subagents

With it, you can delegate by specialty, for example:

- **Opus** as **orchestrator** (coordinates strategy and work division)
- **Gemini** as **designer** (UX, visual structure, interface direction)
- **GPT** as **executor** (implementation and technical delivery)

This multi-agent model fits very well with L-Spec PI because it keeps discovery/spec centralized and distributes execution with clear roles.

## 📚 Additional Information

For PI.dev configuration and packages, see the official lspec-pi documentation on GitHub.

### First Commands

| What You Want           | Say This                                      |
| ----------------------- | --------------------------------------------- |
| Start a new project     | `"Initialize project"` or `"Setup project"`   |
| Work with existing code | `"Map codebase"` or `"Analyze existing code"` |
| Plan a feature          | `"Specify feature [name]"`                    |
| Resume previous work    | `"Resume work"` or `"Continue"`               |

> 💬 **Natural Conversation, Not Commands**
>
> These are trigger phrases, not strict commands. The skill works through **natural conversation** — talk to your agent like you would to a colleague. Say things like _"I want to build an authentication system"_ or _"Fix the login button, it returns 401"_. The agent understands context and intent, not just keywords.
## 📁 Project Structure

The skill creates a `.specs/` directory to organize all project documentation:

```
.specs/
├── project/
│   ├── PROJECT.md      # Vision, goals, tech stack, constraints
│   ├── ROADMAP.md      # Milestones, features, status tracking
│   └── STATE.md        # Persistent memory: decisions, blockers, learnings, todos, deferred ideas
│
├── codebase/           # Brownfield analysis (existing projects only)
│   ├── STACK.md        # Technology stack and dependencies
│   ├── ARCHITECTURE.md # Patterns, data flow, code organization
│   ├── CONVENTIONS.md  # Naming, style, coding patterns
│   ├── STRUCTURE.md    # Directory layout and modules
│   ├── TESTING.md      # Test frameworks and patterns
│   ├── INTEGRATIONS.md # External services and APIs
│   └── CONCERNS.md     # Tech debt, risks, fragile areas
│
├── features/           # Feature specifications
│   └── [feature-name]/
│       ├── spec.md     # Requirements with traceable IDs (FEAT-01, AUTH-02...)
│       ├── context.md  # User decisions for gray areas (only when needed)
│       ├── design.md   # Architecture and components (when needed)
│       └── tasks.md    # Atomic tasks with dependencies (required)
│
```

## 🔄 L-Spec PI Flow

### Specify (always)

**Goal:** Capture WHAT to build with testable, traceable requirements.

The agent acts as a thinking partner — not an interviewer. It asks clarifying questions, challenges vagueness, and captures requirements with traceable IDs:

```markdown
### P1: User Login ⭐ MVP

**User Story:** As a user, I want to log in so that I can access my account.

| Requirement ID | Acceptance Criteria                                                            |
| -------------- | ------------------------------------------------------------------------------ |
| AUTH-01        | WHEN user enters valid credentials THEN system SHALL authenticate and redirect |
| AUTH-02        | WHEN user enters invalid credentials THEN system SHALL display error message   |
| AUTH-03        | WHEN user is already logged in THEN system SHALL redirect to dashboard         |
```

**Discuss gray areas (auto-triggered):** When the spec has ambiguous, user-facing decisions (layout preferences, interaction patterns, error handling style), the agent automatically asks the user about them — creating a `context.md` that locks those decisions before design. This is NOT a separate phase — it only happens within Specify when ambiguity is detected.

### Design (optional)

**Goal:** Define HOW to build it. Architecture, components, what to reuse.

**Skipped when:** The change is straightforward — no architectural decisions, no new patterns. For simple features, design happens inline during Execute.

**Includes research:** Before designing with unfamiliar tech, the agent follows the **Knowledge Verification Chain** (codebase → project docs → Context7 MCP → web search → flag uncertain). It **never assumes or fabricates** — if it can't find documentation, it says so.

**Output:** `design.md` with architecture diagrams, component definitions, and integration points.

### Tasks (required)

**Goal:** Break into GRANULAR, ATOMIC tasks with clear dependencies.

Tasks always exists as a formal step before Execute.

| ❌ Vague Task | ✅ Atomic Tasks                   |
| ------------- | --------------------------------- |
| "Create form" | T1: Create email input component  |
|               | T2: Add email validation function |
|               | T3: Create submit button          |
|               | T4: Add form state management     |

Each task includes: What (deliverable), Where (file path), Depends on (prerequisites), Reuses (existing code), Requirement (traceable ID), Done when (verifiable criteria), Commit (message format).

### Execute (always)

**Goal:** Implement one task at a time. Verify. Commit. Repeat.

Every task follows the same cycle:

```
Plan → Implement → Verify → Commit → Next
```

**Key principles:**

- **Surgical changes** — Only touch required files
- **No scope creep** — If it's not in the task, don't touch it. Capture ideas in STATE.md as Deferred Ideas
- **Verify before commit** — Check all "Done when" criteria
- **Atomic git commits** — One task = one commit, following [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)

```
feat(auth): add email validation to login form

refactor(api): extract token refresh logic into service

fix(cart): prevent negative quantity on item decrement
```

**Feature-level validation** happens after all tasks complete — including acceptance criteria checks, code quality review, and optionally interactive UAT for complex user-facing features.

## 📋 Complete Command Reference

These trigger patterns help the agent recognize your intent, but you don't need to use them verbatim. Speak naturally — the agent understands variations and context.

### Project-Level

| Trigger Pattern                              | Description                                           |
| -------------------------------------------- | ----------------------------------------------------- |
| `Initialize project`, `Setup project`        | Create PROJECT.md with vision, goals, and constraints |
| `Create roadmap`, `Plan features`            | Create ROADMAP.md with milestones and features        |
| `Map codebase`, `Analyze existing code`      | Create 7 brownfield docs for existing projects        |
| `Document concerns`, `Find tech debt`        | Identify and document codebase risks                  |
| `Record decision`, `Log blocker`, `Add todo` | Add entries to STATE.md                               |
| `Pause work`, `End session`                  | Create handoff for session continuity                 |
| `Resume work`, `Continue`                    | Load previous state and continue                      |



| Trigger Pattern                           | Description                             |
| ----------------------------------------- | --------------------------------------- |
| `Discovery`, `Start discovery`           | Run adaptive discovery and capture context |
| `Specify feature`, `Define requirements`  | Create spec.md with requirement IDs        |
| `Discuss feature`, `How should this work` | Capture user decisions for gray areas   |
| `Design feature`, `Architecture`          | Create design.md with architecture         |
| `Break into tasks`, `Create tasks`        | Create tasks.md with atomic breakdown      |
| `Implement task`, `Build`, `Execute`      | Execute specific task with verification    |
| `Validate`, `Verify work`, `UAT`          | Feature-level validation and testing       |

## 🔁 Workflow Examples

### Starting a New Project

```
You: Initialize project

Agent: I'll help you set up your project. Let me ask a few questions:
       1. What are you building?
       2. Who is it for and what problem does it solve?
       ...

You: [Answer questions]

Agent: ✅ Created .specs/project/PROJECT.md
       Next: Would you like to create a roadmap? Say "Create roadmap"
```

### Working with an Existing Codebase

```
You: Discovery + Map codebase

Agent: I'll analyze your existing codebase and document:
       - Technology stack, Architecture patterns, Coding conventions
       - Project structure, Testing infrastructure, External integrations
       - Concerns (tech debt, risks, fragile areas)

       [Analyzes codebase...]

       ✅ Created 7 brownfield docs in .specs/codebase/
       Next: Initialize project to define goals and roadmap
```



```
You: Specify feature user-authentication

Agent: [Asks clarifying questions, creates spec.md with requirement IDs]
       I notice some gray areas in the UX — how should failed login attempts behave?
       [Discusses gray areas, creates context.md]

You: Design the feature

Agent: [Researches JWT best practices via Context7, creates design.md]

You: Break into tasks

Agent: [Creates tasks.md with 8 atomic tasks + parallel execution plan]

You: Implement T1

Agent: Implementing T1: Create auth service interface
       Files: src/services/auth.interface.ts
       Approach: Define interface based on design
       Verify: Interface compiles, exports correctly

       [Implements...]

       ✅ Committed: feat(auth): create auth service interface
       Next available: T2, T3 [P] (parallel)
```

### Session Continuity

```
You: Pause work

Agent: ✅ Created .specs/HANDOFF.md
       - Feature: user-authentication
       - Completed: T1, T2 (committed)
       - In progress: T3 (70%)
       - Next session: Continue T3, then T4

--- Later, new session ---

You: Resume work

Agent: Resuming user-authentication at T3
       - Completed: T1 (auth interface), T2 (token storage)
       - In progress: T3 - auth service at src/services/auth.service.ts:45
       - Next: Complete T3, then T4 (parallel with T5)

       Continue with T3?
```

## 🧠 Context Management

The skill is designed to work within context limits:

| Load Strategy          | Documents                                   | Tokens |
| ---------------------- | ------------------------------------------- | ------ |
| **Base load** (always) | PROJECT.md, ROADMAP.md, STATE.md            | ~15k   |
| **On-demand**          | Current spec, context, design, or tasks     | +5-10k |
| **Never simultaneous** | Multiple feature specs or architecture docs | —      |

**Target:** <40k tokens loaded (20% of context)
**Reserve:** 160k+ tokens for work, reasoning, outputs

## Available Skills

| Skill | Description |
|----------------------- | ---------------------------------------------------------------------- |
| `lspec-discovery`      | Adaptive discovery (BUG/FEATURE/NEW)                               |
| `lspec-discuss`        | Capture context in gray areas                                  |
| `lspec-specify`        | Requirements with traceable IDs                                        |
| `lspec-clarify`        | Resolve ambiguities before specifying                            |
| `lspec-design`         | Architecture and component design                                   |
| `lspec-tasks`          | Decomposition into atomic tasks                                      |
| `lspec-execute`        | Implementation + verification + atomic commits                        |
| `lspec-auto`           | Complete automatic cycle (all phases)                           |
| `lspec-ask`            | Ask questions during the process                                    |
| `lspec-pause`          | Save checkpoint to continue later                               |
| `lspec-resume`         | Resume from where you left off                                                 |
| `lspec-map`            | Map existing codebase (brownfield)                                |
| `lspec-reverse`        | Reverse engineering: code → .specs                                   |
| `lspec-validate`       | Feature validation and interactive UAT                                 |

## Inline Containers

All content has been distributed inline in the skills — no external references.

## ⚡ Tips for Best Results

### Do's ✅

- **Start with project initialization** — Even for existing codebases
- **Be specific about scope** — Clear boundaries prevent creep
- **Use natural language** — No need to memorize commands
- **Say "pause work" before ending** — Enables seamless resumption
- **Challenge the agent** — If something looks wrong, say so

### Don'ts ❌

- **Don't work on multiple features at once** — One feature per cycle
- **Don't ignore verification** — Every task needs a verify step
- **Don't accept vague answers** — If the agent says something fuzzy, ask for specifics

## 💡 Model Recommendation

> **Best results with modern, reasoning-capable models:**
>
> - **Claude Opus 4.6 / Sonnet 4.5** — Excellent for all phases
> - **Gemini 3 Pro / GPT 5.2** — Strong reasoning and large context window
> - **Gemini 3 Flash / Claude Haiku 4.5** — Great general-purpose performance
>
> For cost optimization, the skill will suggest when lighter models are sufficient for simple tasks like validation or session handoff.

**Q: What if the agent invents an API or pattern that doesn't exist?**
A: The skill enforces a strict **Knowledge Verification Chain**: codebase → project docs → Context7 MCP → web search → flag as uncertain. It NEVER fabricates information. If the agent can't find documentation, it will say "I don't know" instead of guessing.