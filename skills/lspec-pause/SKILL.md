---
name: lspec-pause
description: Salva checkpoint do estado atual da sessão em .specs/HANDOFF.md para permitir retomada limpa depois.
---

# lspec-pause

Salva o estado atual da sessão para poder continuar depois sem perder contexto.

## O que faz

Quando você precisa pausar o trabalho (fim de sessão, trocar de tarefa, ir dormir), o pause salva:

- **Feature atual** e **tarefa em andamento**
- **O que já foi feito** nesta sessão
- **O que está pendente** (próximos passos)
- **Blockers** (o que está travando)
- **Contexto git** (branch, arquivos com changes)

O resultado vai para `.specs/HANDOFF.md`.

## Como usar

```
/lspec pause
```

O sistema salva o handoff automaticamente. Depois, quando quiser continuar:

```
/lspec resume
```

## Estrutura do HANDOOK.md gerado

```markdown
# Handoff

**Date:** [timestamp]
**Feature:** [feature name]
**Task:** [task identifier] - [status]

## Completed ✓

- [item completo]

## In Progress

- [trabalho atual] ([porcentagem/status])
- Local: [file:line]

## Pending

- [próximo passo]
- [passo seguinte]

## Blockers

- [descrição do bloqueio] - [impacto]

## Context

- Branch: [git branch]
- Uncommitted: [arquivos modificados]
- Decisions: [referências do STATE.md]
```

## Regra

- Sempre salve antes de encerrar sessão ou trocar de contexto
- O HANDOOK.md é sobrescrito a cada pause (mantém apenas o estado mais recente)
- target: ~500 tokens