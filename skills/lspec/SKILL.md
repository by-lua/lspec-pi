---
name: lspec
description: "LSpec PI — Spec-Driven Development. Entry point. Auto-detects context then loads lspec-auto to execute the full pipeline: Discovery → Research → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute."
license: CC-BY-4.0
metadata:
  author: Lua - github.com/by-lua
  version: 3.7.0
---

# LSpec PI — Hub

## Entry Point

```
/lspec [request]
```

After auto-detection → **load lspec-auto** to execute the pipeline.

## How It Works

```
/lspec [request]
  → Auto-detects context (.specs/, code-only, or empty)
  → load lspec-auto
    → Discovery (adaptive: bug/feature/new)
    → Research (analyzes code)
    → [Discuss?] (if ambiguity)
    → Specify (requirements)
    → [Clarify?] (if ambiguity)
    → [Design?] (if architectural decision)
    → Tasks (break down)
    → Execute (implement)
    → SAVE state after each phase
```

The hub is just the entry point. All pipeline execution happens in lspec-auto.

---

## Sequential Pipeline

```
DISCOVERY → RESEARCH → [DISCUSS?] → SPECIFY → [CLARIFY?] → [DESIGN?] → TASKS → EXECUTE
**FASES DO PIPELINE:**

```
Discovery → Research → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute
```

Cada fase carrega automaticamente o skill correspondente (`lspec-discovery`, `lspec-research`, etc). O hub só needca saber a ordem.

**Phases in [] are OPTIONAL** — executed only when needed, but are part of the pipeline when activated.

---

## Absolute Rules

**AUTO-DETECTION — CRÍTICO:**
```
/lspec [request] → verificar contexto:
  if [ tem .specs/ ]; then
    → load lspec-auto (Forward)
  elif [ tem código ]; then
    → load lspec-map (mapeia codebase)
    → depois load lspec-auto (pergunta o que fazer)
  else
    → load lspec-auto (Discovery completo)
  fi
```

**NEVER:**
- ❌ Skip required phase (Discovery, Research, Specify, Tasks, Execute)
- ❌ Go directly to code
- ❌ Implement without spec
- ❌ Edit without going through the pipeline
- ❌ Create duplicate spec — verify if it already exists in `.specs/features/[name]/`
- ❌ Ignore design reference — if `.specs/features/[name]/design.md` exists, READ and FOLLOW

**ALWAYS:**
- ✓ Save state after each phase
- ✓ Next phase uses previous one's artifact
- ✓ Optional phases activated when needed
- ✓ Structural changes → update `.specs/project/{PROJECT.md, ROADMAP.md}`
- ✓ SPEC Enforcement: change occurs → verify if spec exists. If yes → update. If no → create.

---

## Blocking Gates

### Compliance Gate (before ANY edit)

```
┌────────────────────────────────────────────────────────────────┐
│ COMPLIANCE GATE CHECKLIST                                      │
├────────────────────────────────────────────────────────────────┤
│ □ 1. Discovery complete — context collected                    │
│ □ 2. Clear requirements — spec.md exists                      │
│ □ 3. Design verified — design.md exists (if applicable)       │
│ □ 4. Tasks approved — tasks.md with defined tasks             │
│ □ 5. State updated — STATE.md reflects current state          │
└────────────────────────────────────────────────────────────────┘
```

If any □ = false → **BLOCKS. Resolve before editing.**

### State Saved Gate (between each phase)

```
┌────────────────────────────────────────────────────────────────┐
│ STATE SAVED GATE                                               │
├────────────────────────────────────────────────────────────────┤
│ □ STATE.md exists for this feature                            │
│ □ Last completed phase is marked                              │
│ □ Progress updated (ROADMAP.md)                              │
│ □ Decisions documented (AD-NNN)                              │
└────────────────────────────────────────────────────────────────┘
```

---

## NUNCA Rules (Complete)

**NEVER:**
- ❌ Quick mode
- ❌ Auto-sizing
- ❌ Skip required phases
- ❌ Stop mid-flow
- ❌ Edit code outside of spec/design
- ❌ Skip State Autosave
- ❌ Proceed with red gate
- ❌ Create `fixes/` structure (everything is a feature)
- ❌ Fabricate information (if you don't know, say "I don't know")
- ❌ Modify tests written in RED
- ❌ Weaken assertions to pass
- ❌ "While I'm here" during implementation

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

## Project Structure

```
.specs/
├── project/
│   ├── STATE.md         # Current project state
│   ├── PROJECT.md       # Vision, goals, stack
│   └── ROADMAP.md       # Features and milestones
└── features/
    └── [feature]/
        ├── research.md   # Analysis of existing code
        ├── discuss.md    # Gray areas (if activated)
        ├── spec.md       # Testable requirements
        ├── clarify.md    # Resolved ambiguities (if activated)
        ├── design.md     # Architectural decisions (if activated)
        └── tasks.md      # Atomic tasks
```

**Notes:**
- Bugs and adjustments use prefix `fix-` or `bug-` in the folder name under `features/`
- If feature already exists, update existing docs and continue pipeline
- **NO `fixes/` folder** — everything in `features/`

---

## Artifact Enforcement

Each phase produces an artifact that the next one uses:

```
Discovery  → STATE.md       → Research
Research   → research.md    → Discuss?
Discuss    → discuss.md     → Specify
Specify    → spec.md        → Clarify?
Clarify    → clarify.md     → Design?
Design     → design.md     → Tasks
Tasks      → tasks.md       → Execute
```

**No artifact = blocks.** The phase doesn't start without the previous one's artifact.

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

### Mode: Reverse
```
/lspec reverse → Map existing code → SPEC.md
```
For: analyze existing code and generate spec

**When to use:**
- Project without documentation
- Legacy code to understand
- "How does this project work?"

### Mode: Map (internal — auto-triggered when no .specs/)
```
MAP analisa código → gera .specs/codebase/ com 7 arquivos
→ Depois continua com pipeline solicitado
```
For: código existente sem specs — executado automaticamente

---

## Commands

| Command | Usage |
|---------|-------|
| `/lspec [request]` | **Único comando** — auto-detecta contexto |

**Auto-detecção:**
- Projeto com `.specs/` → Forward
- Projeto sem `.specs/` + tem código → MAP → pergunta o que quer fazer
- Projeto sem `.specs/` + vazio → NEW PROJECT → Discovery (6 fases)

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

## Map Flow (Brownfield Mapping)

**Trigger:** `/lspec map` OR `/lspec [request]` on project WITHOUT `.specs/`

**Auto-detection behavior:**
- `/lspec [request]` + no `.specs/` → **auto-activates MAP first**
- MAP runs → generates `.specs/codebase/` with 7 docs
- Then continues with the requested pipeline

**What it does:**
1. Detects project type (CODE_ONLY vs EXISTING)
2. If CODE_ONLY (no `.specs/` folder but has code):
   - Explores directory structure
   - Identifies technology stack
   - Maps architecture and patterns
   - Documents conventions
   - Catalogs integrations
   - Identifies concerns (tech debt, bugs, security, performance)
3. Outputs 7 files in `.specs/codebase/`:
   - `STACK.md` — tech stack from dependency manifests
   - `ARCHITECTURE.md` — structure and components
   - `CONVENTIONS.md` — coding patterns and rules
   - `STRUCTURE.md` — directory layout
   - `TESTING.md` — test setup and coverage
   - `INTEGRATIONS.md` — external services/APIs
   - `CONCERNS.md` — tech debt, risks, bottlenecks

**No questions asked.** Analyzes the codebase automatically. Just run `/lspec map` and it produces the 7 docs.