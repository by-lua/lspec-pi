---
name: lspec-resume
description: "Resume sessão de trabalho carregando estado de HANDOFF.md, identificando posição no pipeline e propondo próxima ação estruturada."
---

# lspec-resume

Carrega `.specs/HANDOFF.md` e mostra posição atual no pipeline, propondo próxima ação.

---

## Session Handoff

### Pause Work

**Trigger:** "Pause work", "End session", "Create handoff"

**Purpose:** Checkpoint current state for resumption.

**Output:** `.specs/HANDOFF.md` (overwrites previous)

**Size target:** ~500 tokens

**Structure:**

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

**Instructions:**

- Focus on actionable information for resumption
- Include specific file/line references where relevant
- Note uncommitted changes explicitly
- Reference related STATE.md entries if applicable

### Resume Work

**Trigger:** "Resume work", "Continue", "Load handoff"

**Process:**

1. Load HANDOFF.md
2. Load STATE.md for context
3. Summarize current position
4. Propose next action

**Response pattern:**

- "Resuming [feature] at [task]"
- "Completed: [summary]"
- "Next: [immediate action]"
- "Continue with [specific step]?"

---

## Pipeline de Sessão

```
Discovery → Discuss (OPCIONAL) → Specify → Clarify (OPCIONAL) → Design (OPCIONAL) → Tasks → Execute
```

| Fase | Descrição |
|------|-----------|
| **Discovery** | Identificar objetivo e escopo da tarefa |
| **Discuss** | Discutir requisitos com usuário (opcional) |
| **Specify** | Especificar funcionalidades e estrutura |
| **Clarify** | Esclarecer ambiguidades (opcional) |
| **Design** | Criar design de código (opcional) |
| **Tasks** | Decompor em tarefas executáveis |
| **Execute** | Executar e entregar resultado |

---

## Estrutura de Saída

```
## Posição Atual
- Pipeline: [fase atual]
- Última ação: [resumo]
- Estado: [ativo/pausado/concluído]

## Próxima Ação Proposta
- Fase: [próxima fase]
- Ação: [descrição específica]
- Opções:
  1. [opção A]
  2. [opção B]
```

---

## Regras Obrigatórias

- **NUNCA** usar quick mode
- **NUNCA** usar auto-sizing
- Estrutura: apenas `features/`, sem `fixes/`
- Sempre ler HANDOFF.md antes de propor ação