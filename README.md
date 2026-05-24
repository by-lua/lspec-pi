# L-Spec PI — Spec-Driven Development Skill for PI.dev

> A 5-phase SDD workflow: Discovery → Specify → Design → Tasks → Execute. With deep discovery (22 questions), design references, auto-sizing, and quick mode.

**⚠️ This is a PI.dev skill — it only runs inside PI.** It does NOT work on raw Hermes Agent or any other CLI.

## Prerequisites

| Required | Install |
|----------|---------|
| **PI.dev** | `curl -fsSL https://pi.dev/install.sh \| sh` |
| **L-Spec skill** | `pi install npm:@by-lua/lspec-pi` or via tarball |

## Recommended: Subagents

Install the companion skill for subagent-powered phases (Design, Execute):

**[github.com/by-lua/lspec-subagents](https://github.com/by-lua/lspec-subagents)**

Provides 9 specialized agents (orchestrator, explorer, designer, fixer, etc.) with central model config.

> **No subagents?** The orchestrator handles everything directly. L-Spec works fully standalone.

## Optional Enhancements

These PI packages make L-Spec more capable — install what you need:

| Package | Command | Why it helps |
|---------|---------|-------------|
| **`@dreki-gg/pi-context7`** | `pi install npm:@dreki-gg/pi-context7` | Fetches up-to-date library docs via Context7. More accurate than web search. Recommended by TLC. |
| **`context-mode`** | `pi install npm:context-mode` | MCP plugin that saves ~98% of context window. FTS5 knowledge base, sandboxed code execution, intent-driven search. |
| **`pi-mcp-adapter`** | `pi install npm:pi-mcp-adapter` | Run MCP servers inside Pi — filesystem, database, or custom tools as native Pi tools. |
| **`pi-web-access`** | `pi install npm:pi-web-access` | Web search, URL fetch, GitHub clone, PDF extract, YouTube understanding, video analysis. |
| **`pi-ask-user`** | `pi install npm:pi-ask-user` | Interactive ask_user with split-pane UI, multi-select, freeform input. Better UX than plain text. |

## What's Inside

```
skill/
├── SKILL.md                    # Main skill definition
├── lspec-ask.md                # Ask about existing code
├── lspec-discovery.md          # Deep project init — 22 questions
├── lspec-feature-clarify.md    # 5 rapid questions before specifying
├── lspec-specify.md            # Define WHAT with testable requirements
├── lspec-discuss.md            # Capture user decisions on gray areas
├── lspec-design.md             # Define HOW — architecture, components
├── lspec-tasks.md              # Create task plan with dependencies
├── lspec-execute.md            # Follow task plan (RED/GREEN/GATE/COMMIT)
├── lspec-bugfix.md             # Quick mode for bugs, full cycle for complex
├── lspec-map.md                # Analyze existing codebase → 7 docs
├── lspec-pause.md              # Save STATE + HANDOFF for resumption
├── lspec-resume.md             # Load STATE + HANDOFF
├── lspec-next.md               # Go to next step manually
├── lspec-auto.md               # Run all phases automatically
└── lspec-help.md               # List all commands with descriptions
```

## Commands

### Project-Level

| Command | What it does |
|---------|-------------|
| `/lspec discovery` | **Start a new project.** 22 questions, 6 phases — vision, scope, stack, design refs, risks, milestones |
| `/lspec ask` | **Ask about existing code.** Explain, summarize, trace without planning |
| `/lspec map` | **Analyze existing codebase.** 7 docs: stack, arch, conventions, structure, testing, integrations, concerns |
| `/lspec pause` | Save STATE + HANDOFF for resumption |
| `/lspec resume` | Load STATE + HANDOFF, show where you left off |
| `/lspec next` | Go to next phase manually |
| `/lspec auto` | Run all phases automatically with auto-sizing |

### Feature-Level

| Command | What it does |
|---------|-------------|
| `/lspec feature-clarify` | **Add feature to existing project.** 5 rapid questions, saves intake.md |
| `/lspec specify` | **Define WHAT to build.** Use after discovery or clarify, or standalone if already clear |
| `/lspec discuss` | Capture user decisions on gray areas / trade-offs |
| `/lspec design` | **Define HOW —** architecture, components. Auto-skipped for simple changes |
| `/lspec tasks` | Create task plan with dependencies and phases |
| `/lspec execute` | Follow task plan — RED/GREEN/GATE/COMMIT per task |
| `/lspec bugfix` | Quick mode for small bugs, full cycle for complex |

### Quick Guide

```
NEW PROJECT       → discovery → specify → discuss? → design? → tasks? → execute
EXISTING:
  New feature     → feature-clarify? → specify → discuss? → design? → tasks? → execute
  Quick idea      → specify (skip clarify)
  Understand code → ask
  Fix a bug       → bugfix
  Map codebase    → map
```

`?` = optional (agent decides by complexity)

## Features

- **Auto-Sizing** — agent decides depth based on complexity (small/medium/large/complex)
- **Quick Mode** — features ≤3 files skip the full pipeline
- **Design References** — optional but integrated when visual references exist
- **Feature Clarify** — lightweight 5-question pre-spec capture
- **Subagent Pluggable** — define which subagent (model, tools, prompt) in a separate skill
- **Standalone** — works with zero subagents installed
- **State Management** — auto-saves decisions, blockers, and lessons for clean resumption

## License

CC-BY-4.0 — Based on TLC Spec-Driven v2.0.0 by Felipe Rodrigues.
