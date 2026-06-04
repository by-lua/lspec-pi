---
name: lspec-pause
description: "Pausa trabalho e cria checkpoint de handoff."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - Salve estado atual ANTES de qualquer outra acao
  - Documente TODO o contexto necessario para ressumir

# pause — Pausar Trabalho

**Trigger:** "Pause work", "End session", "Create handoff", "/lspec pause"

**Purpose:** Checkpoint current state for resumption.

---

## Processo

### 1. Identificar Estado Atual

- Quais tarefas estao em progresso?
- Quais arquivos estao modificados?
- Quais decisoes foram tomadas?

### 2. Documentar Handoff

Crie/actualize `.specs/HANDOFF.md`:

```markdown
# Handoff

**Date:** [ISO timestamp]
**Feature:** [feature name]
**Task:** [task identifier] - [brief status]

## Completed ✓

- [Completed work item]
- [Completed work item]

## In Progress

- [Current work] ([percentage or status])
- Specific location: [file:line if applicable]

## Pending

- [Next immediate step]
- [Following step]

## Blockers

- [Blocker description] - [impact]

## Context

- Branch: [git branch if applicable]
- Uncommitted: [files with changes]
- Related decisions: [STATE.md references if applicable]
```

---

## Tips

- Focus on actionable information for resumption
- Include specific file/line references where relevant
- Note uncommitted changes explicitly
- Reference related STATE.md entries if applicable

**Proximo passo:** `/lspec resume` para continuar de onde parou.