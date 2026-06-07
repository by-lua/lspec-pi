---
name: lspec-help
description: "Shows help about available LSpec commands."
---

# help

This command **only shows information** — does not execute operations, does not modify files, does not change code.

## LSpec Pipeline

Discovery → Discuss (OPTIONAL) → Specify → Clarify (OPTIONAL) → Design (OPTIONAL) → Tasks → Execute

### Pipeline Phases

| Phase | Description | Trigger | Type |
|------|-----------|---------|------|
| `discovery` | Identifies task type and loads the right context | new project, bug, feature, test | REQUIRED |
| `discuss` | Initial discussion to align expectations | when you need to explore ideas | OPTIONAL |
| `specify` | Captures requirements and generates `features/[feature]/spec.md` | after discovery | REQUIRED |
| `clarify` | Asks questions to understand requirements | when something is ambiguous | OPTIONAL |
| `design` | Projects architecture if necessary | when you need to decide structure | OPTIONAL |
| `tasks` | Breaks into atomic tasks | after specify/design | REQUIRED |
| `execute` | Executes a specific task | when receiving a task | REQUIRED |

### Auxiliary Commands

| Command | Description | Trigger |
|---------|-----------|---------|
| `ask` | Asks a question during the process | when you have a question |
| `pause` | Saves checkpoint to continue later | before leaving |
| `resume` | Resumes from where you left off | when returning |
| `next` | Shows next task | when you need to know the next step |
| `auto` | Auto-advances if context is complete | when you want automation |

## Directory Structure

- `features/` — all specs and feature artifacts
  - `features/[feature]/spec.md` — feature specification
  - `features/[feature]/design.md` — feature design (if applicable)
  - `features/[feature]/tasks.md` — feature tasks

## Rules

1. **NEVER use quick mode** — always follow the complete pipeline
2. **NEVER use auto-sizing** — respect explicit sizes
3. **features/ only** — don't create `fixes/`, use `features/` for everything
4. Don't execute anything — only show this help table
