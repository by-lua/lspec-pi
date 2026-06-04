---
name: lspec-next
description: Avança para próxima fase do pipeline LSpec — Specify→Design→Tasks→Execute seguindo ordem correta.
---

# lspec-next

Avança para a próxima fase do pipeline. Move sequencialmente pelo fluxo.

## Fluxo completo

```
discovery → specify → discuss → design → tasks → execute
```

## Como usar

```
/lspec next
```

Avança de:
- `discovery` → `specify`
- `specify` → `design` (ou `discuss` se houver área cinza)
- `design` → `tasks`
- `tasks` → `execute`

## O que faz

1. **Verifica** se a fase atual foi completada
2. **Confirma** que deliverables existem (spec.md, design.md, tasks.md)
3. **Avança** para a próxima fase do fluxo
4. **Sugere** ação imediata da nova fase

## Estado atual

O sistema rastreia posição no STATE.md:

```markdown
## Current Work
**Phase:** [fase atual]
**Feature:** [feature name]
**Last Completed:** [o que foi feito]
**Next:** [próxima fase]
```

## Alternativa

Em vez de `next`, você pode chamar diretamente:

```
/lspec specify [feature]   # pular direto para Specify
/lspec design [feature]     # pular direto para Design
/lspec tasks [feature]     # pular direto para Tasks
/lspec execute [feature]    # pular direto para Execute
```

O `next` é só um atalho para avançar na ordem sem precisar saber o nome da próxima fase.