---
description: Run the Specify phase: define requirements for a feature with testable acceptance criteria
argument-hint: "[feature-name]"
---
Load the l-spec skill and run the "specify" command. 
If no arguments given, ask the user what feature/project they want to work on first.

After completing specify, suggest the next step:
- If ambiguous gray areas were found → suggest `/lspec discuss`
- If no ambiguity → suggest `/lspec design`
- If feature is straightforward (no architectural decisions) → suggest `/lspec tasks` or `/lspec execute`