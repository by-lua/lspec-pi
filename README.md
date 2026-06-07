# L-Spec PI (Beta)

**SDD (Spec-Driven Development) for PI.dev** — new AND existing projects.

Don't know where to start? L-Spec maps existing code, builds documentation, and only then implements. Everything starts with spec, never with code.

> **Spec-Driven Development** — never edit without spec. The sequential pipeline with blocking gates verifies spec, context, blast radius, and state **before** any change. Works on **new projects** (forward) and **existing code** (map). Mandatory research — the agent asks, never invents. No phase is skipped.

## Install, Update, Uninstall

```bash
# Install
pi install npm:@by-lua/lspec-pi

# Update
pi update npm:@by-lua/lspec-pi

# Uninstall
pi uninstall npm:@by-lua/lspec-pi
```

> Alternative (Git): `curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash`

## Subagents

[`by-lua/lspec-subagents`](https://github.com/by-lua/lspec-subagents) — **9 specialized agents** for the L-Spec flow (orchestrator, explorer, fixer, oracle, designer, librarian, observer, council, councillor). Each with optimized model (Claude Opus, Sonnet, GPT-4o-mini). Run in parallel via CodeX, Gemini, or any provider. Uses the same L-Spec PI native tools (cymbal_\*, lsp_\*). Ideal for deep research, parallel debugging, senior code review, or visual analysis of images/PDFs.

### Optional Dependencies (Recommended)

| Tool | Use | Agents |
|---|---|---|
| `pi install npm:pi-cymbal` | Code navigation | explorer, oracle, fixer, orchestrator |
| `pi install npm:@davehardy20/pi-lsp-tools` | LSP-powered code tools | explorer, fixer, oracle |
| `pi install npm:pi-mermaid` | Mermaid diagrams | orchestrator, designer |

Each agent uses available tools with grep/read fallback if the package is not installed.

## Usage Recommendations

### Quick Guide

| Scenario | Command | What happens |
|----------|---------|--------------|
| **Existing project** without `.specs/` | `/lspec map` | Map code → creates specs → then ask what to do |
| **Add feature** in existing project | `/lspec add [feature]` | Falls into correct flow automatically |
| **Fix bug** in existing project | `/lspec fix [bug]` | Short Discovery → Tasks → Execute |
| **New project** | `/lspec create [project]` | Full Discovery → pipeline |

### Decision Tree

```
START
 │
  ├─► Has .specs/ folder?
  │     │
  │     ├─► YES → Use /lspec [request] → Forward flow
  │     │
  │     └─► NO
  │           │
  │           ├─► Folder is empty?
  │           │     │
  │           │     ├─► YES → /lspec [new project] → Full Discovery
  │           │     │
  │           │     └─► NO (has code) → /lspec map → Map first → then ask what to do
  │           │
  │           └─► Has .specs/ but empty → /lspec [request] → Full Discovery
```

### Tips to Avoid Errors

**Use `/lspec auto [request]`** — the smart command that detects your project state and routes automatically:
- No need to guess which command to use
- Detects empty folder vs. existing code vs. has specs
- Less error-prone than calling specific phases manually

**Example**: `/lspec auto add user authentication`

Instead of manually calling `/lspec discover` → `/lspec specify` → etc., just use `auto` and let the system guide you through the phases.

### When to Use Each Command

**`/lspec map`** — for existing project without specs:
- Project exists but has no `.specs/`
- Need to understand structure before adding anything
- Taking over project from someone else
- Maps code automatically → generates 7 architecture docs → then asks what you want to do

**`/lspec [request]`** — for everything else:
- Add feature → Feature flow (phased Discovery)
- Fix bug → Bug flow (3 questions)
- New project → Full Discovery
- Refactor → Analyze → Specify → Execute

No need to choose phase manually. The system auto-detects and advances.

---

## What is SDD?

SDD is developing by specification first and code later.
In L-Spec PI this means: adaptive discovery, clear requirements, atomic tasks, and verifiable execution.

## Why SDD exists (and what you lose without it)?

Most AI sessions waste 40–60% of tokens on rework: ambiguity, rewriting, and "I thought that's what you meant".
SDD reduces this waste by defining what will be done **before** implementation.

### Without SDD you lose

- Scope clarity (project grows on the fly)
- Traceability (hard to prove what was validated)
- Continuity between sessions (each conversation starts from scratch)
- Delivery quality (more bugs, more rework, confusing commits)

### With L-Spec PI you gain

- Adaptive discovery + clear requirements before coding
- Execution by atomic, verifiable tasks
- Less rewriting, fewer bugs, and cleaner commits
- **Context living in the project (`.specs/`) and not just in the agent's memory**

> In L-Spec PI, project knowledge is versioned in the repository.  
> Any agent can continue from where it left off, without depending on a specific session's memory.

---

## Complete Flow with Gates

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                        L-SPEC PI PIPELINE WITH GATES                            │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                  │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐   │
│  │DISCOVERY │───▶│ RESEARCH │───▶│ SPECIFY  │───▶│  TASKS   │───▶│ EXECUTE  │   │
│  └──────────┘    └──────────┘    └──────────┘    └──────────┘    └──────────┘   │
│       │              │              │                           │              │
│       ▼              ▼              ▼                           ▼              │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐              ┌──────────┐        │
│  │ DISCUSS* │    │ DISCUSS* │    │ CLARIFY* │              │  GATE    │        │
│  └──────────┘    └──────────┘    └──────────┘              │  CHECK   │        │
│       │              │              │                      └──────────┘        │
│       ▼              ▼              ▼                           │              │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐                  ▼              │
│  │  STATE   │    │  STATE   │    │  STATE   │              ┌──────────┐       │
│  │  GATE    │    │  GATE    │    │  GATE    │              │  COMMIT  │       │
│  └──────────┘    └──────────┘    └──────────┘              └──────────┘       │
│                                                                                  │
│  (*) OPTIONAL — only if gray/ambiguous area or architectural need              │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### Phase Table

```
┌────────────┬──────────────────────────────────────────────────────────────────────┐
│ PHASE      │ WHEN IT RUNS                                                        │
├────────────┼──────────────────────────────────────────────────────────────────────┤
│ Discovery  │ ALWAYS                                                              │
│ Research   │ ALWAYS (REQUIRED before Specify)                                   │
│ Discuss*   │ OPTIONAL — only if gray/ambiguous area                            │
│ Specify    │ ALWAYS (REQUIRED)                                                  │
│ Clarify*   │ OPTIONAL — only if ambiguity in requirements                       │
│ Design*    │ OPTIONAL — only if architectural need                              │
│ Tasks      │ ALWAYS                                                              │
│ Execute    │ ALWAYS                                                              │
└────────────┴──────────────────────────────────────────────────────────────────────┘
```

### Auto-detection

- `BUG` → Short Discovery (3 questions) → Research → Tasks → Execute
- `FEATURE` → Focused Discovery → Research → Specify → Tasks → Execute
- `NEW` → 6 complete phases + Research

---

Don't know where to start? L-Spec maps existing code, builds documentation, and only then implements. Everything starts with spec, never with code.
## How It Works

```
You: /lspec [request]

→ Discovery (asks what you want)
→ SAVE state
→ Research (analyzes code)
→ SAVE state
→ [Discuss?] (if there's ambiguity)
→ SAVE state
→ Specify (specifies requirements)
→ SAVE state
→ [Clarify?] (if there's ambiguity)
→ SAVE state
→ [Design?] (if there's architectural decision)
→ SAVE state
→ Tasks (breaks into tasks)
→ SAVE state
→ Execute (implements)
→ SAVE state
→ Done
```

**SINGLE command:** `/lspec [what you want]`

The system executes the ENTIRE pipeline in order, saving after each phase. Never asks which phase to run. Never skips. Never goes directly to code.

---

## Artifact Enforcement

Each phase produces an artifact that the next one uses:

```
Discovery  → STATE.md       → Research
Research   → research.md     → Discuss?
Discuss    → discuss.md      → Specify
Specify    → spec.md         → Clarify?
Clarify    → clarify.md      → Design?
Design     → design.md       → Tasks
Tasks      → tasks.md        → Execute
```

**No artifact = blocks.** The phase doesn't start without the previous one's artifact.

---



## Gates and Blockers (Enforcement)

L-Spec PI uses **blocking gates** to ensure quality. Each gate must pass before advancing.

### 1. Compliance Gate (Blocking)

**Before ANY edit to code**, execute the checklist:

```
┌────────────────────────────────────────────────────────────────┐
│ COMPLIANCE GATE CHECKLIST                                      │
├────────────────────────────────────────────────────────────────┤
│ [ ] 1. Discovery complete — context collected                  │
│ [ ] 2. Clear requirements — spec.md exists                    │
│ [ ] 3. Design verified — design.md exists (if applicable)    │
│ [ ] 4. Tasks approved — tasks.md with defined artifacts      │
│ [ ] 5. State updated — STATE.md reflects current state        │
└────────────────────────────────────────────────────────────────┘
```

**If any item ❌ → BLOCKS. Resolve before editing.**

### 2. State Saved Gate (Blocking)

**Between each phase**, verify:

```
┌────────────────────────────────────────────────────────────────┐
│ STATE SAVED GATE                                               │
├────────────────────────────────────────────────────────────────┤
│ [ ] STATE.md exists for this feature                           │
│ [ ] Last completed phase is marked                            │
│ [ ] Progress updated (ROADMAP.md)                             │
│ [ ] Decisions documented (AD-NNN)                             │
│ [ ] Blockers identified (B-NNN)                               │
└────────────────────────────────────────────────────────────────┘
```

### 3. Design Reference Enforcement

**Before implementing (Execute)**, if Design was executed:

```
┌────────────────────────────────────────────────────────────────┐
│ DESIGN REFERENCE ENFORCEMENT                                   │
├────────────────────────────────────────────────────────────────┤
│ [ ] design.md exists in features/[name]/                       │
│ [ ] Design was approved by user                               │
│ [ ] Components defined in design                             │
│ [ ] Interfaces documented                                     │
│ [ ] Code reuse identified                                     │
└────────────────────────────────────────────────────────────────┘
```

### 4. Artifact Enforcement

Each phase produces **artifacts** that the next phase needs. No artifact = blocks.

```
┌────────────┬────────────────────────┬─────────────────────────────────────┐
│ PHASE      │ PRODUCES               │ NEXT PHASE NEEDS                    │
├────────────┼────────────────────────┼─────────────────────────────────────┤
│ Discovery  │ PROJECT.md, ROADMAP.md │ Research, Specify                  │
│ Research   │ findings documented    │ Design, Specify                     │
│ Specify    │ spec.md                │ Tasks, Design                       │
│ Design     │ design.md              │ Tasks                               │
│ Tasks      │ tasks.md               │ Execute                             │
│ Execute    │ code + commits         │ final validation                   │
└────────────┴────────────────────────┴─────────────────────────────────────┘
```

**No artifact from previous phase → Execute blocked.**

### 5. Gate Check (Verify)

During Execute, each task has a **gate level**:

```
┌────────────────────────────────────────────────────────────────┐
│ TIERED GATE CHECKS                                             │
├────────────────────────────────────────────────────────────────┤
│ Task with unit tests          │ Gate: QUICK  (unit only)       │
│ Task with e2e/integration     │ Gate: FULL (unit + e2e)       │
│ Last task of phase            │ Gate: BUILD (build + lint + all)│
│ Task without tests            │ Gate: BUILD (build + lint only)│
└────────────────────────────────────────────────────────────────┘
```

**Rule: Never proceed with a red gate.**

---

## Enforcement Pattern

The enforcement pattern combines **Compliance Gate + State Saved Gate**:

```
┌─────────────────────────────────────────────────────────────────┐
│ ENFORCEMENT PATTERN (REQUIRED)                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  BEFORE EACH PHASE:                                             │
│  ┌──────────────────┐    ┌──────────────────┐                   │
│  │ Compliance Gate  │ AND │ State Saved Gate │                   │
│  │ (5 items)        │     │ (verification)    │                   │
│  └────────┬─────────┘    └────────┬─────────┘                   │
│           │                       │                              │
│           └───────────┬───────────┘                              │
│                       ▼                                          │
│              ┌──────────────┐                                    │
│              │ ADVANCE?     │                                    │
│              └──────────────┘                                    │
│                                                                  │
│  BOTH gates must pass to proceed.                               │
│  If one fails → BLOCK and resolve first.                         │
└─────────────────────────────────────────────────────────────────┘
```

---

## Absolute Rules

**NEVER:**
- ❌ Skip required phase (Discovery, Research, Specify, Tasks, Execute)
- ❌ Go directly to code
- ❌ Implement without spec
- ❌ Edit without going through the pipeline
- ❌ Create duplicate spec — verify if it already exists in `.specs/features/[name]/`
- ❌ Ignore design reference — if design.md exists, READ and FOLLOW

**ALWAYS:**
- ✓ Save state after each phase
- ✓ Next phase uses previous one's artifact
- ✓ Optional phases activated when needed
- ✓ Structural changes → update `.specs/project/{PROJECT.md, ROADMAP.md}`
- ✓ SPEC Enforcement: change occurs → verify if spec exists. If yes → update. If no → create.

---



## NUNCA Rules (Complete)

**NEVER:**
- Quick mode
- Auto-sizing
- Skip required phases
- Stop mid-flow
- Edit code outside of spec/design
- Skip State Autosave
- Proceed with red gate
- Create `fixes/` structure (everything is a feature)
- Fabricate information (if you don't know, say "I don't know")
- Modify tests written in RED
- Weaken assertions to pass
- "While I'm here" during implementation

**ALWAYS:**
- ✓ Complete pipeline (even in BUG flow)
- ✓ State Autosave at each phase
- ✓ Confirm before advancing
- ✓ Update STATE.md
- ✓ Verify design.md before implementing
- ✓ Tests first (RED phase)
- ✓ Gate check after each task
- ✓ Atomic commit per task
- ✓ Reuse existing code

---

## Operation Modes

### Mode: Forward (default)
```
/lspec [request] → Discovery → Research → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute
```
For: new project, feature, bug, improvement

**Adaptive Discovery:**
- Bug: short questions (1-3)
- Feature: medium questions (5-8)
- New project: complete questions (10-15)

### Mode: Map
```
/lspec map → Map existing code → SPEC.md
```
For: analyze existing code and generate spec

**When to use:**
- Project without documentation
- Legacy code to understand
- "How does this project work?"

### Mode: Map (brownfield)
```
/lspec map → Analyze codebase → 7 architecture docs
```
For: existing projects need a map

---



## Which Command to Use

### Single Entry Point — `/lspec`

The `/lspec` command is the **only entry point**. It auto-detects the project type and executes the complete pipeline.

**No need to choose command by phase.** The system advances automatically.

| Scenario | Command | What happens |
|----------|---------|--------------|
| New project | `/lspec create a system for...` | Complete Discovery (17 questions) → Research → Specify → ... |
| Feature in existing project | `/lspec add login with...` | Focused Discovery → Research → Specify → ... |
| Bug in existing project | `/lspec fix error with...` | Short Discovery (3 questions) → Research → Tasks → Execute |
| Existing project without specs | `/lspec map current code` | **Map mode** — code survey → spec auto-generated |

### Map — When to Use

Use `/lspec map` (or `/lspec mapear`) when:

- Project exists but **doesn't have `.specs/`**
- Need to understand structure before touching
- Taking over project from someone else

The map scans the code, generates `.specs/project/` and `.specs/features/[name]/` automatically.

### Flow by Type

**NEW PROJECT:**
```
Discovery (complete) → Research → Discuss? → Specify → Clarify? → Design? → Tasks → Execute
```

**BUG:**
```
Discovery (short) → Research → Specify → Tasks → Execute
```

**FEATURE:**
```
Discovery (focused) → Research → Specify → Clarify? → Tasks → Execute
```

**EXISTING PROJECT (without .specs/):**
```
Discovery (short) → Research → Specify → Clarify? → Design? → Tasks → Execute
```

---

## Complete Forward Flow

**You say:** `/lspec I want to add JWT authentication`

**System does:**

```
1. Discovery
   → "What type of authentication?"
   → Saves .specs/project/STATE.md

2. Research
   → Analyzes: does auth exist in project?
   → Analyzes: what auth stack?
   → Analyzes: where to integrate?
   → Saves features/jwt-auth/research.md

3. Discuss? (if there's ambiguity)
   → Captures gray area
   → Saves features/jwt-auth/discuss.md

4. Specify
   → Uses Discovery + Research
   → Writes spec.md with requirements
   → Saves features/jwt-auth/spec.md

5. Clarify? (if there's ambiguity)
   → Resolves ambiguity
   → Saves features/jwt-auth/clarify.md

6. Design? (if there's architectural decision)
   → Architecture decisions
   → Saves features/jwt-auth/design.md

7. Tasks
   → Uses spec.md
   → Breaks into tasks
   → Saves features/jwt-auth/tasks.md

8. Execute
   → Uses tasks.md
   → Implements code
   → Saves changes

→ Done!
```

**You don't need to call each phase manually. The system advances on its own.**

---



## Research

**REQUIRED** phase between Discovery and Specify.

**When to execute:**
- Feature involves unfamiliar technology
- Integrations with new systems
- Patterns not used before in this codebase

**Knowledge Verification Chain (strict order):**
```
Codebase → Project docs → Context7 MCP → Web search → Flag as uncertain
```

**CRITICAL: NEVER assume or fabricate information.** If you can't find an answer, say "I don't know" or "I couldn't find documentation for this." Made-up information propagates through design → tasks → implementation and causes cascading failures.

---

## Project Structure

```
.specs/
├── project/
│   ├── PROJECT.md       # Vision, goals, stack
│   ├── ROADMAP.md       # Features and milestones
│   └── STATE.md         # Decisions, blockers, current state
└── features/
    └── [feature]/
        ├── spec.md      # Testable requirements
        ├── context.md   # Gray area decisions (optional)
        ├── design.md    # Architectural decisions (optional)
        └── tasks.md     # Atomic tasks
```

**Note:** Bugs are registered as features in `features/` — prefix `fix-` or `bug-` in name.

---

## State Autosave

**At each phase, WHEN COMPLETING:**
1. Save decisions to STATE.md
2. Update progress in ROADMAP.md
3. Persist context for next session

**STATE.md updated with:**
- AD-NNN: decisions
- B-NNN: blockers
- L-NNN: learnings
- All pending items
- Deferred ideas

---

## Git Workflow

**Where to edit:**
1. Clone the project's git repository
2. Edit in local clone
3. Atomic commit per task
4. Push when gate passes

**NEVER edit skills locally.** Skills live in the git repository, not in the agent's local filesystem.

**Commit format (Conventional Commits 1.0.0):**
```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

**Allowed types:**
- `feat` — New feature
- `fix` — Bug fix
- `refactor` — Code change (no bug fix, no feature)
- `docs` — Documentation
- `test` — Tests
- `style` — Formatting
- `perf` — Performance
- `build` — Build system
- `ci` — CI config
- `chore` — Maintenance

**Rules:**
- One task = one commit
- Description = what was DONE, not planned
- Include only files in task definition
- Tests in same commit if part of the task

---

## Recommended Tools

### Hermes (agent-lsp)

**Hermes uses `agent-lsp` for code navigation.** Not `pi-cymbal`.

```
┌────────────────────────────────────────────────────────────────┐
│ agent-lsp Skills (66 tools + 23 workflow skills)                │
├────────────────────────────────────────────────────────────────┤
│ Before editing:        blast_radius — blast-radius analysis    │
│ Before applying:       preview_edit — preview diagnostic delta │
│ After changing:        get_diagnostics, run_build, run_tests    │
└────────────────────────────────────────────────────────────────┘
```

**Task-to-tool mapping:**

| Task | Use this | Not this |
|------|----------|----------|
| See file structure | `list_symbols` | Read + manual scanning |
| Find a symbol by name | `find_symbol` | Grep across files |
| Find all usages | `find_references` | Grep for the name |
| Understand a symbol | `inspect_symbol` | Read the file |
| What calls this function | `find_callers` | Grep for the name |
| Replace a function body | `replace_symbol_body` | Edit with text matching |
| Delete unused symbol | `safe_delete_symbol` | Edit to remove lines |

**Skills available via `/lsp-*`:**
- `/lsp-architecture` — Structural overview
- `/lsp-concurrency-audit` — Concurrency safety
- `/lsp-cross-repo` — Cross-repository analysis
- `/lsp-dead-code` — Dead code detection
- `/lsp-edit-export` — Safe workflow for public APIs
- `/lsp-refactor` — End-to-end safe refactor
- `/lsp-rename` — Two-phase safe rename
- `/lsp-safe-edit` — Wrap edits with preview
- `/lsp-verify` — Three-layer verification (LSP + build + tests)

### PI Packages (built-in to PI.dev)

PI.dev provides native navigation tools — no installation needed:

**cymbal_* — structural navigation:**
- `cymbal_map`, `cymbal_search`, `cymbal_outline`, `cymbal_show`, `cymbal_refs`, `cymbal_impact`, `cymbal_importers`, `cymbal_impls`

**lsp_* — technical precision:**
- `lsp_goto_definition`, `lsp_find_references`, `lsp_diagnostics`, `lsp_symbols`, `lsp_rename`

Use directly — they're part of the PI.dev runtime.

---

## Critical Pitfalls

### 1. Information Fabrication
```
❌ "It probably works like this..."
✅ "I don't know, let me search"
```

### 2. Skipping Gates
```
❌ "I'll skip the gate check, it looks ok"
✅ "Red gate = stop and resolve"
```

### 3. Scope Creep
```
❌ "While I'm here, I'll also do X"
✅ "Is this in my task definition? If no, don't touch it"
```

### 4. Silencing Tests
```
❌ "I'll temporarily disable this test"
✅ "Failing test = real problem, resolve it"
```

### 5. Auto-sizing
```
❌ "Looks like that's all, I'll adjust"
✅ "Manually verify blast radius"
```

### 6. Skipping Autosave
```
❌ "I'll remember the state mentally"
✅ "STATE.md updated after each phase"
```

### 7. Weak Tests
```
❌ "Test passes without implementation = ok"
✅ "Test must fail in RED, pass in GREEN"
```

### 8. Silent SPEC_DEVIATION
```
❌ "Implementation diverged, but it's fine"
✅ "// SPEC_DEVIATION: [what diverged] // Reason: [why]"
```

---

## Golden Rules

1. **ALWAYS Complete Pipeline** — no exceptions
2. **Autosave** — state saved at each phase
3. **Confirm** — before advancing to next phase
4. **Never Fabricate** — if you don't know, say "I don't know"
5. **Spec is Truth** — code deviates = SPEC_DEVIATION marker
6. **Gate is Deterministic** — the test runner decides, not the agent
7. **Reuse is King** — copy existing patterns, don't reinvent
8. **Atomic Commit** — one task = one commit

---



## Internal References

- `skills/lspec/README.md`
- `skills/lspec/SKILL.md`
- `skills/lspec-discovery/SKILL.md`
- `skills/lspec-specify/SKILL.md`
- `skills/lspec-design/SKILL.md`
- `skills/lspec-tasks/SKILL.md`
- `skills/lspec-execute/SKILL.md`
- `skills/lspec-auto/SKILL.md`
- `skills/lspec-next/SKILL.md`
- `skills/lspec-validate/SKILL.md`
- `skills/lspec-resume/SKILL.md`
- `skills/lspec-pause/SKILL.md`
- `references/pi-version-setup.md`
- `references/pi-packages-guide.md`
- `references/pi-v2-architecture.md`
- `references/subagent-context-budget.md`

---

## Credits

Conceptual base inspired by TLC Spec-Driven (Tech Lead's Club), with practical evolution for the PI ecosystem by **by-lua**.test
