# L-Spec PI — Spec-Driven Development Skill for PI.dev

> A 5-phase SDD workflow for **new AND existing projects**: Discovery → Feature-Clarify → Specify → Design → Tasks → Execute. Also: analyze existing code (`/lspec map`), ask questions (`/lspec ask`), and fix bugs (`/lspec bugfix`).

**⚠️ This is a PI.dev skill — it only runs inside PI.**

## Why this exists

Most AI coding sessions waste 40-60% of tokens on rewrites, clarifications, and "I thought you meant...". L-Spec fixes this by **specifying before coding** — so every token generates value, not guesses.

| Without SDD | With L-Spec |
|-------------|-------------|
| ❌ "Build me a login" → AI guesses → rewrite → rewrite | ✅ Discovery first → AI knows exactly what you need |
| ❌ No tests until the end (or never) | ✅ RED/GREEN/GATE — every feature verified before moving on |
| ❌ Project knowledge lost when context scrolls | ✅ `.specs/` lives in your repo — any AI picks up where you left off |
| ❌ Scope grows silently ("just one more thing") | ✅ Out-of-scope defined upfront — changes are conscious decisions |

**Result:** fewer rewrites, fewer bugs, cleaner commits, and projects that survive between sessions.

## Table of Contents

| Section | What you'll learn |
|---------|-----------------|
| [Quick Install](#quick-install) | Get running in 30 seconds |
| [Prerequisites](#prerequisites) | What to install before starting |
| [Recommended: Subagents](#recommended-subagents) | Optional companion for Design & Execute phases |
| [Optional Enhancements](#optional-enhancements) | Packages that extend capability |
| [What's Inside](#whats-inside) | All files and what each does |
| [Commands](#commands) | Every `/lspec` command in pipeline order |
| [Why Spec-Driven Development?](#why-spec-driven-development-sdd) | SDD defined — why it prevents rewrites |
| [Why Tests Matter](#why-tests-matter) | RED/GREEN/GATE cycle |
| [Project State: Memory vs Context](#project-state-memory-vs-context) | Why `.specs/` lives in the project |
| [Features](#features) | Auto-sizing, quick mode, design refs, subagents |
| [Uninstall](#uninstall) | Clean removal |
| [License](#license) | CC-BY-4.0 |

---

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash
```

Installs to `~/.pi/agent/skills/l-spec/` (skill) and `~/.pi/agent/prompts/` (slash commands).

### Manual install

```bash
git clone https://github.com/by-lua/lspec-pi.git ~/.lspec-pi
cd ~/.lspec-pi && bash install.sh
```

## Prerequisites

| Required | Install |
|----------|---------|
| **PI.dev** | `curl -fsSL https://pi.dev/install.sh \| sh` |
| **L-Spec skill** | `curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh \| bash` |

## Recommended: Subagents

Install the companion for subagent-powered phases (Design, Execute):

**[github.com/by-lua/lspec-subagents](https://github.com/by-lua/lspec-subagents)**

9 specialized agents with **per-role model AND provider assignment** — each task runs on whatever LLM makes sense:

| Role | Example model | Why it fits |
|------|--------------|-------------|
| **Orchestrator** | Claude Sonnet | Coordination, planning |
| **Explorer** | GPT-4o-mini | Cheapest — reads files, maps structure |
| **Librarian** | Claude Sonnet | Research, docs |
| **Oracle** | Claude Opus | Deep reasoning, architecture review |
| **Designer** | Gemini 2.5 Pro | UI/UX, visual design |
| **Fixer** | MiniMax | Fast code gen |
| **Observer** | GPT-4o | Visual analysis |
| **Council** | Claude Opus | Consensus from multiple models |
| **Councillor** | GPT-4o-mini | Individual council vote |

> **No subagents?** The orchestrator handles everything directly. L-Spec works fully standalone. Subagents are an optimization, not a requirement.

## Optional Enhancements

These PI packages make L-Spec more capable — install what you need:

| Package | Command | Why it helps |
|---------|---------|-------------|
| **`@dreki-gg/pi-context7`** | `pi install npm:@dreki-gg/pi-context7` | Fetches up-to-date library docs via Context7 |
| **`context-mode`** | `pi install npm:context-mode` | Saves ~98% of context window. FTS5 knowledge base |
| **`pi-mcp-adapter`** | `pi install npm:pi-mcp-adapter` | Run MCP servers inside Pi as native tools |
| **`pi-web-access`** | `pi install npm:pi-web-access` | Web search, URL fetch, GitHub, PDF, YouTube |
| **`pi-ask-user`** | `pi install npm:pi-ask-user` | Interactive input with split-pane UI |

## What's Inside

```
lspec-pi/
├── install.sh                          # curl | bash installer
├── uninstall.sh                        # clean removal
├── README.md                           # this file
├── .gitignore
├── skills/l-spec/
│   └── SKILL.md                        # main skill definition
└── prompts/                            # slash command templates
    ├── lspec-ask.md                   # ask about existing code
    ├── lspec-auto.md                   # run all phases automatically
    ├── lspec-bugfix.md                # bug fix (quick or full cycle)
    ├── lspec-design.md                # architecture & components
    ├── lspec-discovery.md             # deep project init — 22 questions
    ├── lspec-discuss.md               # capture decisions on gray areas
    ├── lspec-execute.md               # follow task plan (RED/GREEN/GATE/COMMIT)
    ├── lspec-feature-clarify.md      # 5 rapid questions before specifying
    ├── lspec-help.md                  # list all commands with descriptions
    ├── lspec-map.md                   # analyze existing codebase → 7 docs
    ├── lspec-next.md                  # go to next phase manually
    ├── lspec-pause.md                 # save STATE + HANDOFF
    ├── lspec-resume.md                # load STATE + HANDOFF
    ├── lspec-specify.md               # define WHAT with testable requirements
    └── lspec-tasks.md                # create task plan with dependencies
```

## Commands

| Command | What it does |
|---------|-------------|
| `/lspec discovery` | **Start a new project.** 22 questions, 6 phases — vision, scope, stack, design refs, risks, milestones |
| `/lspec feature-clarify` | **Add feature to existing project.** 5 rapid questions before specifying |
| `/lspec specify` | **Define WHAT to build.** Testable requirements (FEAT-01, FEAT-02...) |
| `/lspec discuss` | Capture user decisions on gray areas / trade-offs |
| `/lspec design` | **Define HOW —** architecture, components. Auto-skipped for simple changes |
| `/lspec tasks` | Create task plan with dependencies and phases |
| `/lspec execute` | Follow task plan — RED/GREEN/GATE/COMMIT per task |
| `/lspec bugfix` | Quick mode for small bugs, full cycle for complex |
| `/lspec ask` | **Ask about existing code.** Explain, summarize, trace — no planning, just understanding |
| `/lspec map` | **Analyze existing codebase.** 7 docs: stack, arch, conventions, structure, testing, integrations, concerns |
| `/lspec pause` | Save STATE + HANDOFF for resumption |
| `/lspec resume` | Load STATE + HANDOFF, show where you left off |
| `/lspec next` | Go to next phase manually |
| `/lspec auto` | Run all phases automatically with auto-sizing |
| `/lspec help` | List all commands with descriptions |

### Quick Guide

```
NEW PROJECT       → discovery → feature-clarify? → specify → discuss? → design? → tasks? → execute
EXISTING PROJECT:
  No .specs yet?  → map → then use any command
  New feature     → feature-clarify? → specify → discuss? → design? → tasks? → execute
  Quick idea      → specify (skip clarify)
  Understand code → ask
  Fix a bug       → bugfix
  Map codebase    → map
  All commands    → help
```

`?` = optional (agent decides by complexity)

## Why Spec-Driven Development (SDD)?

**Most coding projects fail not because of bad code, but because nobody defined what "done" looks like.**

SDD flips the usual approach: instead of coding first and hoping it's right, you **spec first** — define exactly what needs to exist, how it behaves, and how you'll know it works — *then* implement.

### Why this matters for AI-assisted coding

Without SDD, the typical flow is:
> "Build me a login system" → AI writes 500 lines → "No, I meant with OAuth" → AI rewrites → "Actually, just email + password" → AI rewrites again

Each cycle wastes tokens, time, and patience. The AI is guessing your intent.

With SDD (this skill):
> **Discovery** → captures full context (problem, users, constraints, risks)
> **Specify** → turns intent into testable requirements (FEAT-01, FEAT-02...)
> **Design** → defines architecture before writing code
> **Tasks** → breaks into atomic steps
> **Execute** → implements with RED/GREEN — tests pass = feature done ✅

The spec becomes the **source of truth**. If code drifts from spec, it's a SPEC_DEVIATION — not a surprise.

### What you avoid

- ❌ "I thought you meant something else" rewrites
- ❌ Scope creep disguised as "just one more thing"
- ❌ Code that works but does the wrong thing
- ❌ Wasted tokens on AI guessing your intent

## Why Tests Matter

Every phase in L-Spec is designed around **testability**:

| Phase | Testable output |
|-------|----------------|
| **Specify** | Acceptance criteria in WHEN/THEN/SHALL format — each is a test case |
| **Design** | Component interfaces defined — each can be unit-tested |
| **Tasks** | Each task has "Done when" criteria + a Gate command |
| **Execute** | RED → write test first, GREEN → make it pass, GATE → verify everything passes |

### Without tests, you're guessing

> "It looks like it works" is not the same as "it works."

Tests are not optional documentation — they're the **verification mechanism** for the spec.

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

## Project State: Memory vs Context

**The spec IS the memory.** It lives in `.specs/`, not in the AI's conversation.

### What goes where

| Lives in `.specs/` (persistent) | Lives in AI context (volatile) |
|--------------------------------|--------------------------------|
| Requirements (spec.md) | Current task instructions |
| Architecture decisions (design.md) | Files being edited |
| User decisions (context.md) | Recent commands |
| Blockers and lessons (STATE.md) | The next line of code |
| Task plans (tasks.md) | This error message |

### Why this separation matters

**Every conversation is a new flight.** The crew (AI) forgets everything when the plane lands. If you didn't leave the flight manual in the cabin (`.specs/`), the next crew starts from zero.

By keeping state in **files inside the project** (`.specs/`):
- **Any AI agent** can pick up where you left off — just load STATE.md
- **Any tool** can read it (grep, cat, editor)
- **You** can read it too — no need to scroll through chat history
- **Git tracks changes** — see how decisions evolved

> The chat is for conversation. The `.specs/` folder is for memory.

### `.specs/` Directory Structure

```
.specs/
├── project/
│   ├── PROJECT.md        # Vision and objectives
│   ├── ROADMAP.md        # Milestones
│   └── STATE.md          # Persistent memory between sessions
├── design-references/    # Prints, mockups, HTML
├── codebase/             # Mapping (7 docs)
├── features/
│   └── [feature]/
│       ├── spec.md       # Testable requirements
│       ├── context.md    # User decisions
│       ├── design.md     # Architecture
│       └── tasks.md      # Atomic tasks
└── fixes/
    └── NNN-description/
```

## Features

- **Auto-Sizing** — agent decides depth based on complexity (small/medium/large/complex)
- **Quick Mode** — features ≤3 files skip the full pipeline
- **Design References** — optional but integrated when visual references exist
- **Feature Clarify** — lightweight 5-question pre-spec capture
- **Subagent Pluggable** — define which subagent (model, tools, prompt) in a separate skill
- **Standalone** — works with zero subagents installed
- **State Management** — auto-saves decisions, blockers, and lessons for clean resumption
- **Knowledge Verification Chain** — Codebase → Docs → Web → Flag uncertain

## Uninstall

```bash
cd ~/.lspec-pi && bash uninstall.sh
```

Or manually remove:
- `~/.pi/agent/skills/l-spec/`
- `~/.pi/agent/prompts/lspec-*.md`

## License

CC-BY-4.0 — Based on TLC Spec-Driven v2.0.0 by Felipe Rodrigues