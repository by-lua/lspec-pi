---
name: lspec-resume
description: Retoma sessão anterior carregando .specs/HANDOFF.md e STATE.md, resumindo posição e propondo próxima ação.
---

# lspec-resume

Carrega o checkpoint salvo pelo pause e retoma o trabalho de onde parou.

## O que faz

1. **Carrega** `.specs/HANDOFF.md` (checkpoint da última sessão)
2. **Carrega** `.specs/project/STATE.md` (memória persistente do projeto)
3. **Resume** feature/tarefa + completed + pending + blockers
4. **Propoe** próxima ação

## Como usar

```
/lspec resume
```

Responde no padrão:

- "Resumindo [feature] em [tarefa]"
- "Completed: [resumo do que foi feito]"
- "Next: [ação imediata]"
- "Continue with [passo específico]?"

## Pré-requisito

Execute `/lspec pause` antes para criar o HANDOOK.md. Sem ele, o resume não tem o que carregar.

## Padrão de resposta

```
Resuming [feature] at [task]
Completed: [resumo]
Next: [ação imediata]
Continue with [passo]?
```

## Fluxo

```
pause (salva HANDOFF.md) → sessão encerra
    ↓
resume (carrega HANDOFF.md + STATE.md) → sessão continua
```