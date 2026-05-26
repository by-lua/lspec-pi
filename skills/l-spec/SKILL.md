---
name: l-spec
description: >-
  Project and feature planning with 5 adaptive phases - Discovery, Specify,
  Design, Tasks, Execute. Enhanced project initialization with 22-question
  deep discovery, design references, and pluggable subagents. Based on TLC
  Spec-Driven v2.0.0. Use when (1) Starting new projects, (2) Working with
  existing codebases (map stack, architecture, conventions), (3) Planning
  features (requirements, design, task breakdown), (4) Implementing with
  verification and atomic commits, (5) Tracking decisions/blockers/deferred
  ideas across sessions, (6) Pausing/resuming work. Triggers on all L-Spec
  slash commands: /lspec discovery, /lspec ask, /lspec specify, /lspec discuss, /lspec design,
  /lspec tasks, /lspec execute, /lspec bugfix, /lspec feature-clarify, /lspec map,
  /lspec pause, /lspec resume, /lspec next, /lspec auto.
license: CC-BY-4.0
metadata:
  author: Lua (Hermes Agent)
  version: 1.0.0
  based-on: tlc-spec-driven v2.0.0 by Felipe Rodrigues
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

---

## Auto-Sizing

**The complexity determines the depth, not a fixed pipeline.** Before starting any feature, assess its scope and apply only what's needed:

| Scope       | What                     | Discovery/ Specify | Design | Tasks | Execute |
| ----------- | ------------------------ | ------------------ | ------ | ----- | ------- |
| **Small**   | ≤3 files, one sentence   | Quick mode — skip pipeline | - | - | - |
| **Medium**  | Clear feature, <10 tasks | Discovery optional, spec (brief) | Skip — design inline | Skip — tasks implicit | Implement + verify |
| **Large**   | Multi-component feature  | Discovery + Full spec + requirement IDs | Architecture + components | Full breakdown + deps | Implement + verify per task |
| **Complex** | Ambiguity, new domain    | Discovery + Full spec + discuss gray areas | Research + architecture | Breakdown + parallel plan | Implement + verification per task |

**Rules:**
- **Discovery, Specify and Execute are always required**
- **Design is skipped** when straightforward (no architectural decisions)
- **⚠️ Design is REQUIRED when `design-references/` exists**
- **Tasks is skipped** when ≤3 obvious steps
- **Quick mode** for small fixes, config changes, small tweaks (≤3 files)
- **⚠️ 3+ distinct issues REQUIRES doc first** — even if each fix is ≤1 file, any batch of 3+ changes needs brief spec or task plan before execution

**Safety valve:** If inline listing in Execute reveals >5 steps or complex deps → STOP, create `tasks.md`.

**Quick mode process:** Describe → Implement → Verify → Commit

## Recommended Flow

The order depends on what you're doing:

```
NEW PROJECT     → discovery → specify → discuss? → design? → tasks? → execute
EXISTING:
  New feature   → feature-clarify? → specify → discuss? → design? → tasks? → execute
  Quick idea    → specify (skip clarify)
  Understand    → ask
  Fix bug       → bugfix
  Map codebase  → map
```

- **?** = optional (agent decides by complexity)
- **feature-clarify** = optional — skip when idea is already clear
- **design** = auto-skipped for simple changes, REQUIRED when `design-references/` exists
- **tasks** = skipped when ≤3 obvious steps
- **No subagent skill?** Orchestrator handles everything directly — skill works standalone

---

## Subagents

L-Spec defines **when** to delegate. A separate subagent skill defines **which** subagent (model, tools, prompt).

| Phase | Uses subagent? | Details |
|-------|---------------|---------|
| `/lspec discovery` | No | Orchestrator + user |
| `/lspec ask` | No | Direct dialogue with user |
| `/lspec feature-clarify` | No | Direct dialogue with user |
| `/lspec specify` | Optional | May delegate to design subagent |
| `/lspec discuss` | No | Direct dialogue with user |
| `/lspec design` | **Yes** | Subagent receives spec + design-references + context, produces design.md |
| `/lspec tasks` | Optional | Orchestrator decides |
| `/lspec execute` | **Yes** | Subagent runs each task with clean context |
| `/lspec bugfix` | Yes | Same as execute cycle |
| `/lspec map` | Optional | May delegate to code-navigation subagent |

### Orchestrator Identity

**The model the user is talking to IS the orchestrator.** There is no separate "orchestrator model" configured elsewhere. The orchestrator is a *behavior*, not a model instance.

When the user asks "which model is the orchestrator?" — the answer is: **the model you are currently talking to.** The `model-config.json` entry labeled "orchestrator" exists only for edge cases (nested orchestration, automation with no user). In the live conversation, the orchestrator IS whatever model the user selected.

### Delegation Visibility Protocol

When delegating, the talking model must display:

```
▶ Delegating to [role] — model: [model_name]
   · Loading: [context files]
   Status: ⏳ started → ✅ done / ❌ failed
   · Files: ...
   · Summary: ...
```

- **Which role**: designer, coder, fixer, etc.
- **Which model**: from `model-config.json`
- **Status**: ⏳ started / ✅ completed / ❌ failed
- **Result summary**: files created, decisions made, issues found

The orchestrator **never disappears** — it delegates, receives results, and continues the conversation. The user always knows who's speaking and which model backs them.

### Data Contract Between Phases

| Phase | Produces | Consumed by |
|-------|----------|-------------|
| discovery | PROJECT.md | specify |
| feature-clarify | intake.md | specify |
| specify | spec.md | design, execute |
| discuss | context.md | design |
| design | design.md | tasks |
| tasks | tasks.md | execute |
| execute | code + SUMMARY.md | — |

---

## Commands

All commands use `/lspec <command>` format. You can also use natural trigger phrases.

### Project-Level

| Command | Trigger phrases | What it does |
|---------|----------------|-------------|
| `/lspec discovery` | "initialize project", "setup project", "start project", brainstorm | Deep project initialization — 22 questions in 6 phases, captures design references |
| `/lspec ask` | "explain code", "what does this do", "understand", "summarize" | Read, explain, or summarize code without planning |
| `/lspec map` | "map codebase", "analyze existing code", "brownfield" | Analyzes existing codebase → 7 docs (stack, arch, conventions, structure, testing, integrations, concerns) |
| `/lspec pause` | "pause", "stop", "end session" | Saves STATE.md + HANDOFF.md |
| `/lspec resume` | "resume", "continue", "what was i doing" | Loads STATE.md + HANDOFF.md |
| `/lspec next` | "next", "proceed", "skip" | Advance to next phase manually |
| `/lspec auto` | "run all", "full cycle", "auto" | Run all phases automatically with auto-sizing |

### Feature-Level

| Command | Trigger phrases | What it does |
|---------|----------------|-------------|
| `/lspec feature-clarify` | "clarify feature", "quick context", "what feature" | 5 rapid questions before specifying — lightweight context capture |
| `/lspec specify` | "specify feature", "define requirements", "new feature" | Defines WHAT to build with testable requirements |
| `/lspec discuss` | "discuss feature", "gray areas", "decisions" | Captures user decisions on ambiguous areas |
| `/lspec design` | "design feature", "architecture" | Defines HOW to build it — architecture, components, code reuse |
| `/lspec tasks` | "break into tasks", "create tasks", "plan" | Creates complete task plan with dependencies |
| `/lspec execute` | "implement", "build", "execute", "start coding" | Follows task plan (RED → GREEN → GATE → COMMIT) |
| `/lspec bugfix` | "bug fix", "bug", "fix issue" | Quick mode for small bugs, full cycle for complex |

---

### /lspec feature-clarify

**Pre-feature rapid context capture.** Lightweight — not a full discovery.

> ✅ If `.specs/project/PROJECT.md` doesn't exist → redirect user to run `/lspec discovery` first.

**5 rapid questions:**
1. What feature? (one-sentence description)
2. Who uses it? (user/case)
3. What already exists? (current code, screens, APIs)
4. Any references? (design, screenshot, link)
5. Any blockers or deadlines?

**Behavior:**
- After answers → save to `.specs/features/[feature]/intake.md`
- If feature ≤3 files → ask: "Want to skip to quick mode execution?"
- If feature needs proper spec → suggest: "Run `/lspec specify [feature]` now?"

**Output:** `.specs/features/[feature]/intake.md`

---

### /lspec ask

**Ask about existing code.** Read, explain, or summarize code without planning.

> Use this when you need to understand existing code — not to build something new.

**Capabilities:**
- Explain a specific file or function
- Summarize a module or directory
- Trace how data flows through the code
- Suggest improvements or point out issues
- Answer questions about the codebase

**When NOT to use:**
- You want to plan or build a feature → use specify
- You want to fix a bug → use bugfix
- You want to map the full codebase → use map

---

### /lspec discovery

**Enhanced project init.** 22 questions in 6 phases.

**Phase 1: Context & Problem**
1. What's the project about? Describe in one sentence.
2. What problem are you solving? Who has this problem?
3. How do you know this is a real problem? (data, feedback, instinct?)
4. What's the current situation / workaround? What sucks about it?
5. What happens if you DON'T build this?

**Phase 2: Vision & Scope**
6. What does success look like? How will you measure it?
7. What's the MVP? What's the absolute minimum to launch?
8. What's explicitly OUT of scope for now?
9. Who's the target user? Describe them.
10. Any non-functional requirements? (performance, security, scale, compliance)

**Phase 3: Technical Stack**
11. What language / framework / platform?
12. Is there existing code to integrate with?
13. Any constraints? (budget, team size, timeline, hosting, APIs)
14. Do you have a preference for backend / frontend / database?

**Phase 4: Design References**
15. **DO YOU HAVE DESIGN REFERENCES?** (screenshot, HTML, mockup, similar site, Figma link)
    - If yes → creates `.specs/design-references/`
    - Generates `README.md` describing each reference
    - Extracts visual patterns: colors, layout, components, interactions

**Phase 5: Prior Art & Risks**
16. What has been tried before? What didn't work?
17. What's the biggest risk? What could kill this project?
18. What's the hardest part — technically or otherwise?
19. Is there any deadline? Fixed date or "when it's ready"?

**Phase 6: Milestones (optional roadmap)**
20. How would you break this into milestones?
21. What's the first thing you want working?
22. What's the "wow" feature for launch?

**Output:** `.specs/project/PROJECT.md`

---

### /lspec specify

**Specify feature.** Defines WHAT to build with testable, traceable requirements.

**Process:**
1. **Clarify Requirements** — start conversational, let user dump their mental model
   - "What problem?", "Who is the user?", "What does success look like?"
   - **Challenge vagueness** — "Good" means what? "Users" means who? "Simple" means how?
2. **Capture User Stories with Priorities** — P1 (MVP), P2, P3
   - Each story independently testable
3. **Write Acceptance Criteria** — **WHEN/THEN/SHALL format**
   - `WHEN [event/action] THEN system SHALL [response/behavior]`
4. **Document Edge Cases** — what breaks? what's empty? what's huge?
5. **Assign Requirement IDs** — `FEAT-01`, `FEAT-02`...
6. **Define Out of Scope**
7. If ambiguous areas → trigger `/lspec discuss`

**Output:** `.specs/features/[feature]/spec.md`

---

### /lspec discuss

**Discuss feature.** Captures user decisions on gray areas.

**When to trigger:**
- Multiple valid layout/UI approaches
- API design trade-offs
- Error handling strategies
- Data structure choices
- Any "it depends" situation

**Process:** Present trade-offs → capture decision → mark "User Decided" or "Agent's Discretion" → confirm.

**Output:** `.specs/features/[feature]/context.md`

---

### /lspec design

**Design feature.** Defines HOW to build it — architecture, components, code reuse.

> **Auto-skipped** for straightforward changes. **REQUIRED** when `design-references/` exists.

**Process:**
1. Load Context — spec.md, context.md, design-references/
2. Research unfamiliar tech (follow Knowledge Verification Chain)
3. Define Architecture — component interactions (mermaid diagrams)
4. Identify Code Reuse — check CONCERNS.md for fragile areas
5. Define Components & Interfaces — purpose, location, deps
6. Define Data Models (if applicable)
7. Error Handling Strategy
8. Document Tech Decisions (only non-obvious with rationale)

**Knowledge Verification Chain:**
```
Codebase → Project docs → Web search → Flag as uncertain
```

**Output:** `.specs/features/[feature]/design.md`

---

### /lspec tasks

**Break into tasks.** Creates complete task plan.

**Process:**
1. Review design, spec, and TESTING.md
2. Break into atomic tasks (one component / one function / one file)
3. Define dependencies
4. Create execution plan with phases (sequential + parallel with `[P]`)
5. Validate: granularity, diagram cross-check, test co-location

Each task: What, Where, Depends on, Reuses, Done when, Tests, Gate, `[P]` marker.

**Output:** `.specs/features/[feature]/tasks.md`

---

### /lspec execute

**Implement.** Follows task plan — one task at a time.

**Per-task cycle:**
1. **Plan** — assumptions, files, success criteria
2. **RED** — write tests that fail
3. **GREEN** — minimum implementation to pass
4. **GATE CHECK** — verification command (tests, lint, build)
5. **REVIEW** — test count, spec deviation, complexity
6. **COMMIT** — atomic commit
7. **REPEAT** — next task

**Output:** Code + `.specs/features/[feature]/SUMMARY.md`

---

### /lspec bugfix

**Bug fix.** Quick mode for small bugs (≤3 files), full cycle for complex.

**Process:** Identify & document → quick discovery → specify fix → TDD execute.

**Output:** `.specs/fixes/NNN-description/`

---

### /lspec map

**Map codebase.** 7 docs in `.specs/codebase/`: STACK.md, ARCHITECTURE.md, CONVENTIONS.md, STRUCTURE.md, TESTING.md, INTEGRATIONS.md, CONCERNS.md.

---

### /lspec resume / /lspec pause / /lspec next / /lspec auto

| Command | Behavior |
|---------|----------|
| `/lspec pause` | Save STATE.md + HANDOFF.md |
| `/lspec resume` | Load both, show where you left off |
| `/lspec next` | Advance one phase — useful when you don't remember what comes next or want to override auto-sizing |
| `/lspec auto` | Full cycle with auto-sizing. Use `/lspec pause` to interrupt |

---

## Directory Structure

```
.specs/
├── project/
│   ├── PROJECT.md
│   ├── ROADMAP.md
│   └── STATE.md
├── design-references/
│   ├── ref-01.png
│   ├── ref-01.html
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
│       ├── intake.md    (from feature-clarify)
│       ├── spec.md
│       ├── context.md   (only when discuss triggered)
│       ├── design.md
│       ├── tasks.md
│       └── SUMMARY.md
└── fixes/
    └── NNN-description/
```

## Context Loading Strategy

**Base load (~15k tokens):** PROJECT.md + ROADMAP.md + STATE.md

**On-demand:** Codebase docs, CONCERNS.md, TESTING.md, spec.md, context.md, design.md, tasks.md

**Never simultaneously:** multiple feature specs, multiple architecture docs, archived documents

---

## STATE.md

Auto-updated at end of each phase: AD-NNN (decisions), B-NNN (blockers), L-NNN (lessons), deferred ideas, todos.

---

## Design References

**During `/lspec discovery`** (question 15): If yes → creates `.specs/design-references/`, saves files, extracts patterns.

**During `/lspec design`:** If folder exists → orchestrator analyzes and incorporates (may delegate to subagent).

---

## Subagents

L-Spec defines **when** to delegate. It doesn't care which subagent skill you use — any PI-compatible subagent that provides the needed roles works.

**Recommended: [@lspec/subagents](https://github.com/by-lua/lspec-subagents)** — 9 specialized agents (orchestrator, explorer, designer, fixer, etc.) with central model config.

> ⚠️ **No subagent skill installed?** All phases run directly without delegation — the talking model handles everything. The skill works fully standalone. Subagents are an optimization, not a requirement.

### Optional PI packages

These make L-Spec more capable (install in PI):

| Package | Install | Why |
|---------|---------|-----|
| **`@dreki-gg/pi-context7`** | `pi install npm:@dreki-gg/pi-context7` | Up-to-date lib docs via Context7. Recommended by TLC. |
| **`context-mode`** | `pi install npm:context-mode` | Saves ~98% context window. FTS5 KB, sandboxed code, intent search. |
| **`pi-mcp-adapter`** | `pi install npm:pi-mcp-adapter` | Run MCP servers as native Pi tools. |
| **`pi-web-access`** | `pi install npm:pi-web-access` | Web search, URL fetch, GitHub clone, PDF extract, YouTube. |
| **`pi-ask-user`** | `pi install npm:pi-ask-user` | Interactive ask_user with split-pane UI, multi-select. |

> See [references/pi-version-setup.md](skill://l-spec/references/pi-version-setup.md) for PI.dev installation and setup details.
>
> See [references/pi-packages-guide.md](skill://l-spec/references/pi-packages-guide.md) for the full PI package comparison table and how to discover new packages.
>
> See [references/pi-v2-architecture.md](skill://l-spec/references/pi-v2-architecture.md) for the v2 hybrid architecture (skills as motor, prompts as menu shortcuts).
>
> See [references/subagent-context-budget.md](skill://l-spec/references/subagent-context-budget.md) for the context optimization guide — read strategy, `think: true` savings, `max_turns` calibration, and three-agent optimization applied after a 478k-token overshoot session.

### PI.dev Setup — Install / Update / Uninstall

**This skill is for PI.dev only.** Three separate scripts:

```bash
# Install (fresh install only)
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash

# Update (uninstall everything + reinstall clean)
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/update.sh | bash

# Uninstall (remove all l-spec* skills + lspec-* prompts)
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/uninstall.sh | bash
```

**v2 (skills-only architecture):** Each command is its own skill with full instructions (prerequisites, process, output, next step). There is NO prompts/ folder — commands appear as `/skill:l-spec-X` in PI's skill menu. The "Next Step" section at the end of each skill suggests what to run next, keeping the pipeline flowing without auto-advancing.

The install/update scripts use `find` (not shell glob) for reliable file copying via `curl | bash`. They always clone the repo via git, never rely on BASH_SOURCE.

(`models.json` is local user config — never shipped in repo.)

### Subagent Setup (npm package)

The companion repo for subagents — **install the official npm package first**, then swap agents:

```bash
# 1. Instalar extensão oficial (registra /agents no PI)
cd ~/.pi/agent/npm && npm install @tintinweb/pi-subagents@0.7.3

# 2. Remover agentes padrão
rm ~/.pi/agents/{general-purpose,Explore,Plan}.md 2>/dev/null

# 3. Instalar nossos 9 agentes
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-subagents/main/install.sh | bash
```

> ⚠️ **Sem o passo 1 (npm install), o comando `/agents` NÃO existe no PI.** Os .md agents sozinhos não registram a extensão. O `install.sh` do subagents já faz os 3 passos automaticamente.
>
> ⚠️ **Modelos no GitHub são genéricos** (claude-sonnet-4, gpt-4o-mini, etc.). Modelos Ominiroute ficam SOMENTE no config local (`~/.pi/agent/lspec-model-config.json`). NUNCA commitar modelos específicos do usuário.

> ⚠️ **L-Spec e subagentes são repos SEPARADOS.** O repo `by-lua/lspec-pi` contém SOMENTE 16 skills (no `prompts/` folder — v2 is skills-only). Os 9 agentes ficam em `by-lua/lspec-subagents`. NUNCA misturar agents/ no repo do lspec-pi.
>
> ⚠️ **NUNCA incluir `models.json` no repo** — é config local com API keys. Se precisar de exemplo, use `.example` com modelos genéricos (claude-sonnet-4, gpt-4o-mini, etc.), NUNCA modelos específicos do usuário (Ominiroute, etc.).
>
> ⚠️ **NUNCA criar repos paralelos** quando os arquivos já existem instalados. Trabalhe nos arquivos originais ou clone o repo correto.
>
> ⚠️ **Subagents install = npm install oficial + swap agents.** NÃO buildar o fork. O install.sh faz: (1) npm install @tintinweb/pi-subagents, (2) remove padrão, (3) copia .md L-Spec. Sem npm install, `/agents` não existe.

### Data Contract (PI.dev)

| Handoff | Orchestrator sends | Subagent receives | Returns |
|---------|-------------------|-------------------|---------|
| Design | spec.md + context.md + design-references/ | Designer agent | design.md |
| Execute | tasks.md + spec.md + design.md + conventions | Coder agent | Code files |
| Bugfix | bug spec + test + reproduction | Fixer agent | Fix + verification |

### Example Delegation Flow

```
/lspec design
  → "Delegating to designer (claude-sonnet-4)..."
  → Agent({subagent: "designer", model: "claude-sonnet-4", 
           prompt: "Design feature X per spec.md. Incorporate design-references/."})
  → ✅ Designer finished → design.md saved

/lspec execute
  → For each task:
    → "Delegating to coder (gpt-4o-mini)..."
    → Agent({subagent: "coder", model: "gpt-4o-mini", 
             prompt: "Implement task T1 per tasks.md + spec.md + design.md"})
    → ✅ Task done → commit
```

## Phase Transitions — How the Pipeline Flows

Each `/lspec <command>` runs **one phase then stops**. The pipeline does NOT auto-advance:

- `/lspec discovery` → runs discovery → suggests next: feature-clarify, specify, or auto
- `/lspec feature-clarify` → runs clarify → suggests next: specify (or quick mode if ≤3 files)
- `/lspec specify` → runs specify → suggests next: discuss, design, or tasks
- `/lspec discuss` → runs discuss → suggests next: design
- `/lspec design` → runs design → suggests next: tasks
- `/lspec tasks` → runs tasks → suggests next: execute
- `/lspec execute` → runs execute → suggests next: pause or commit summary

**To advance automatically, use:**
- `/lspec auto` — runs the full cycle with auto-sizing (skips phases not needed)
- `/lspec next` — advance to the next phase manually

## Pitfalls

- **Each command is isolated.** Running `/lspec discovery` does NOT chain into specify — the user must explicitly call the next command (or use `auto`/`next`).
- **Feature-clarify requires PROJECT.md.** If `.specs/project/PROJECT.md` doesn't exist, redirect to `/lspec discovery` first.
- **Quick mode bypasses the pipeline entirely.** For ≤3 files, go straight to describe → implement → verify. Don't force users through discovery/specify for a one-liner fix.
- **Auto-sizing before starting.** Always assess scope BEFORE choosing which phases to run. Don't run discovery for a 2-file bugfix.
- **Discovery phase-by-phase, NEVER all at once.** The 22 questions must be asked phase by phase (5-6 questions at a time), collecting answers before moving to the next phase. Dumping all 22 questions at once overwhelms the user and produces shallow answers.
- **Skills-only, no prompts/ folder.** In the PI.dev repo, each command is its own skill (SKILL.md with prerequisites, process, output, next step). There is NO prompts/ folder — putting instructions in prompts caused the "dump all 22 questions at once" problem. Commands appear as `/skill:l-spec-X` in the skill menu. Each skill has a "Next Step" section suggesting what to run next, keeping the pipeline flowing without auto-advancing.
- **Install/update/uninstall are 3 separate scripts.** Install only installs, update removes everything then reinstalls, uninstall removes everything. Don't mix responsibilities.
- **Subagents requires npm install of official package.** Just copying .md agents is NOT enough — the TS extension registers `/agents` in PI. Install flow: (1) `npm install @tintinweb/pi-subagents`, (2) remove default agents, (3) copy L-Spec .md agents. Do NOT build the fork locally — use the official npm package.
- **Models in GitHub repo are GENERIC.** Never commit user-specific models (Ominiroute, custom endpoints). Use generic model names (claude-sonnet-4, gpt-4o-mini, codex, grok-2) in example configs and embedded defaults.
- **Luna-specific: Exploration token waste.** When dispatching Explorer subagents, instruct them to use targeted reads (`grep`, `sed -n`, `head`) instead of `cat` on full files. A full `cat` of a 500-line PHP file wastes 20x more tokens than grepping the relevant section. Default to `grep -n` + `sed -n` for file reading, only use `cat` when the entire file content is necessary. Without this constraint, Explorer can burn 400k+ tokens on one investigation.
- **Luna-specific: "pode fazer" does NOT skip planning.** When Luna authorizes execution with "pode fazer", still produce a brief task outline or bullet list of what'll be done before dispatching subagents. This lets her confirm scope and correct course without burning subagent tokens on wrong direction. Show the plan in chat — don't silently dispatch.

## Fixed Rules

1. **Quick mode ok** for small changes (≤3 files) — full cycle for bigger
2. **Always ask** "Any design/visual references?" before creating
3. **Design required when `design-references/` exists**
4. **Spec is truth** — code deviation = SPEC_DEVIATION marker
5. **STATE.md always updated** — clean resumption
6. **Clean context for subagents** — only spec + current task
7. **Subagents in separate skill** — L-Spec says WHEN, not WHICH
8. **All commands use `/lspec <command>` format**
9. **After each phase, tell user what's next** — never silently stop

---

## Why Spec-Driven Development (SDD)?

**Most coding projects fail not because of bad code, but because nobody defined what "done" looks like.**

SDD flips the usual approach: instead of coding first and hoping it's right, you **spec first** — define exactly what needs to exist, how it behaves, and how you'll know it works — *then* implement.

### Why this matters for AI-assisted coding

Without SDD, the typical flow is:

> "Build me a login system" → AI writes 500 lines → "No, I meant with OAuth" → AI rewrites → "Actually, just email + password" → AI rewrites again

Each cycle wastes tokens, time, and patience. The AI is guessing your intent.

With SDD:

| Phase | What it does |
|-------|-------------|
| **Discovery** | Captures full context — problem, users, constraints, risks |
| **Specify** | Turns intent into testable requirements (FEAT-01, FEAT-02...) |
| **Design** | Defines architecture before writing code |
| **Tasks** | Breaks into atomic steps with dependencies |
| **Execute** | Implements with RED/GREEN — tests pass = feature done ✅ |

The spec becomes the **source of truth**. If code drifts from spec, it's a SPEC_DEVIATION — not a surprise.

### What you avoid

- ❌ "I thought you meant something else" rewrites
- ❌ Scope creep disguised as "just one more thing"
- ❌ Code that works but does the wrong thing
- ❌ Wasted tokens on AI guessing your intent

---

## Why Tests Matter

Every phase in L-Spec is designed around **testability**:

| Phase | Testable output |
|-------|----------------|
| **Specify** | Acceptance criteria in WHEN/THEN/SHALL format — each is a test case |
| **Design** | Component interfaces defined — each can be unit-tested |
| **Tasks** | Each task has "Done when" criteria + a Gate command |
| **Execute** | RED → write test first, GREEN → make it pass, GATE → verify everything passes |

> "It looks like it works" is not the same as "it works."

Tests are not optional documentation — they're the **verification mechanism** for the spec. If a requirement says:

> WHEN user submits invalid email THEN system SHALL show error message

The test is: submit invalid email → check for error message. If the test passes, the requirement is met. If it fails, it's not done — no amount of "looks fine" changes that.

### The RED/GREEN/GATE cycle

```
RED    → Write a test that fails (the requirement isn't implemented yet)
GREEN  → Write the minimum code to make it pass
GATE   → Run ALL tests + lint + build — nothing broken
COMMIT → Atomic commit with test + code together
```

This ensures:
- Every requirement has a test ✅
- Tests pass before you move on ✅
- You never break existing features (GATE catches regressions) ✅

---

## Project State: Memory vs Context

**The spec IS the memory.** It lives in `.specs/`, not in the AI's conversation.

### What goes where

| Lives in `.specs/` (persistent) | Lives in AI context (volatile) |
|--------------------------------|--------------------------------|
| Requirements (spec.md) | Current task instructions |
| Architecture decisions (design.md) | Files being edited |
| User decisions (context.md) | Recent commands |
| Blockers and lessons (STATE.md) | This error message |
| Task plans (tasks.md) | The next line of code |

### Why this separation matters

**Every conversation is a new flight.** The crew (AI) forgets everything when the plane lands. If you didn't leave the flight manual in the cabin (`.specs/`), the next crew starts from zero — no idea where you were, what you decided, or what still needs fixing.

This is how LLMs actually work:
- Switch projects? Context is gone.
- Come back tomorrow? Everything was scrolled off.
- Hand off to someone else? They start from zero.
- Browser refreshes, chat restarts, new tab? Blank slate.

By keeping state in **files inside the project** (`.specs/`):

- **Any AI agent** can pick up where you left off — just load STATE.md
- **Any tool** can read it (grep, cat, editor)
- **You** can read it too — no need to scroll through chat history
- **Git tracks changes** — see how decisions evolved

> The chat is for conversation. The `.specs/` folder is for memory.
