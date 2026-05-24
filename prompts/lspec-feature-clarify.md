---
description: Pre-feature rapid questions — 5 basic context captures before specifying
argument-hint: "[feature-name]"
---
Load the l-spec skill and run the "feature-clarify" command.

First check if you're in a project context (look for .specs/project/PROJECT.md):
- If NO PROJECT.md → tell the user to run `/lspec-discovery` first
- If YES PROJECT.md → run 5 rapid questions:
  1. What feature? (one-sentence description)
  2. Who uses it? (user/case)
  3. What already exists? (current code, screens, APIs)
  4. Any references? (design, screenshot, link)
  5. Any blockers or deadlines?

Save to `.specs/features/[feature]/intake.md`.
If feature is ≤3 files → ask user if they want to skip to quick mode execution.
