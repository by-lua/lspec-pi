---
description: Run the Discovery phase: deep project initialization with 22 questions in 6 phases
argument-hint: "[feature-name]"
---
Load the l-spec skill and run the "discovery" command. 
If no arguments given, ask the user what feature/project they want to work on first.

After completing discovery, suggest the next step:
- If user wants to add a feature → suggest `/lspec feature-clarify`
- If user wants to specify directly → suggest `/lspec specify`
- If user wants the full pipeline automatically → suggest `/lspec auto`