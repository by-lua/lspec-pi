---
name: lspec-auto
description: Executa o ciclo completo do pipeline LSpec — discovery → specify → discuss → design → tasks → execute — sem quick mode, passo a passo.
---

# lspec-auto

Executa o ciclo completo do pipeline LSpec em sequência, sem atalhos.

## Como usar

```
/lspec auto
```

## O que faz

Executa cada fase em ordem:

```
1. Discovery → captura contexto do projeto
2. Specify → define requisitos testáveis
3. Discuss → captura decisões em áreas cinzas (se houver)
4. Design → define arquitetura (se necessário)
5. Tasks → quebra em tarefas atômicas
6. Execute → implementa tarefa por tarefa
```

## Interrupção

```
/lspec pause
```

Pausa o auto e salva checkpoint. Pode continuar depois com `/lspec resume`.

## Diferente de "next"

- `next` → avança uma fase
- `auto` → executa todas as fases até o fim

## Pré-requisito

- Projeto inicializado (`/lspec discovery` já rodou)
- Feature definida (ou usa a feature atual do STATE)

## Regra

Sem quick mode, sem auto-sizing. Cada fase roda completa antes de avançar.