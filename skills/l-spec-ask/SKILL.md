---
name: l-spec-ask
description: >-
  Ask about existing code — explain, summarize, trace. No planning, just
  understanding. Uses codebase docs from /skill:l-spec-map if available.
license: CC-BY-4.0
metadata:
  based-on: l-spec (TLC Spec-Driven v2.0.0)
  phase: ask
  next: varies
---

# L-Spec Ask — Understand Existing Code

Ask about existing code. Explain, summarize, trace — no planning, just understanding.

## Prerequisites

- ✅ Must be inside a project directory
- 📋 If `.specs/codebase/` exists → use it for context
- 📋 If no codebase docs → suggest `/skill:l-spec-map` first

## Process

1. Read the question from the user
2. Load relevant codebase docs if available
3. Search/read relevant source files
4. Answer the question clearly with references

## What Ask Does NOT Do

- No planning, no specs, no implementation
- If the question implies building something → suggest the appropriate L-Spec command

## Next Step

If the question reveals a feature need → suggest appropriate L-Spec command.