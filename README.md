# L-Spec PI — Spec-Driven Development Skill for PI.dev

> A 5-phase SDD workflow: Discovery → Specify → Design → Tasks → Execute. With deep discovery (22 questions), design references, auto-sizing, and quick mode.

## What's Inside

```
skill/
├── SKILL.md                    # Main skill definition
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

## How to Install

```bash
# 1. Install PI.dev (if you haven't)
curl -fsSL https://pi.dev/install.sh | sh

# 2. Install the skill package
pi install /path/to/lspec-pi.tar.gz

# 3. Or clone from GitHub (requires access)
git clone https://github.com/by-lua/lspec-pi.git
cd lspec-pi
pi install ./skill
```

After install, all commands appear in PI's autocomplete bar:

| Command | What it does |
|---------|-------------|
| `/lspec discovery` | Deep project init — 22 questions, 6 phases |
| `/lspec feature-clarify` | 5 rapid questions before specifying |
| `/lspec specify` | Define WHAT with testable requirements |
| `/lspec discuss` | Capture user decisions on gray areas |
| `/lspec design` | Define HOW — architecture, components |
| `/lspec tasks` | Create task plan with dependencies |
| `/lspec execute` | Follow task plan (RED/GREEN/GATE/COMMIT) |
| `/lspec bugfix` | Quick mode for small bugs |
| `/lspec map` | Analyze existing codebase → 7 docs |
| `/lspec pause` | Save session state |
| `/lspec resume` | Resume from last state |
| `/lspec next` | Go to next phase manually |
| `/lspec auto` | Run all phases automatically |
| `/lspec help` | Show this command list |

## Features

- **Auto-Sizing** — agent decides depth based on complexity (small/medium/large/complex)
- **Quick Mode** — features ≤3 files skip the full pipeline
- **Design References** — optional but integrated when visual references exist
- **Feature Clarify** — lightweight 5-question pre-spec capture
- **Subagent Pluggable** — define which subagent (model, tools, prompt) in a separate skill
- **State Management** — auto-saves decisions, blockers, and lessons for clean resumption

## License

CC-BY-4.0 — Based on TLC Spec-Driven v2.0.0 by Felipe Rodrigues.
