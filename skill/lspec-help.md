---
description: List all available L-Spec commands with descriptions
---
Load the l-spec skill and output the complete command list:

> 💡 **Quick guide:**
> ```
> NEW PROJECT          → discovery → specify → discuss? → design? → tasks? → execute
> EXISTING PROJECT:
>   New feature        → feature-clarify? → specify → discuss? → design? → tasks? → execute
>   Quick idea         → specify (skip clarify)
>   Understand code    → ask
>   Fix a bug          → bugfix
>   Map codebase       → map
> ```
> `?` = optional (agent decides by complexity)

**Project-Level:**
- `/lspec discovery` — **Start a new project.** 22 questions, 6 phases (vision, scope, stack, design refs, risks, milestones)
- `/lspec ask` — **Ask about existing code.** Explain, summarize, trace functions. No planning, just understanding.
- `/lspec map` — **Analyze existing codebase.** 7 docs: stack, arch, conventions, structure, testing, integrations, concerns
- `/lspec pause` — Save STATE + HANDOFF for resumption
- `/lspec resume` — Load STATE + HANDOFF
- `/lspec next` — Go to next phase manually
- `/lspec auto` — Run all phases automatically

**Feature-Level:**
- `/lspec feature-clarify` — **Add feature to existing project.** 5 rapid questions, saves intake.md. Skip if idea is crystal clear.
- `/lspec specify` — **Define WHAT to build.** Use after discovery (new project) or feature-clarify (new feature), or standalone if idea is clear.
- `/lspec discuss` — Capture user decisions on gray areas / trade-offs
- `/lspec design` — Define architecture, components, code reuse (auto-skipped for simple changes)
- `/lspec tasks` — Create task plan with dependencies
- `/lspec execute` — Follow task plan (RED/GREEN/GATE/COMMIT)
- `/lspec bugfix` — Quick mode for small bugs, full cycle for complex

Ask the user which command they want to run.
