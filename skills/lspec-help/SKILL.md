---
name: lspec-help
description: Mostra todos os comandos disponíveis do LSpec, pipeline, estrutura de arquivos e como usar cada comando.
---

# lspec-help

Mostra ajuda contextual do LSpec. Comandos, pipeline, estrutura.

## Como usar

```
/lspec help
/lspec help [comando]   # ajuda específica
```

## Comandos disponíveis

| Comando | O que faz |
|---|---|
| `/lspec discovery` | Inicializa projeto (Q&A ou mapeia existente) |
| `/lspec specify` | Define requisitos testáveis (WHEN/THEN/SHALL) |
| `/lspec discuss` | Captura decisões em áreas ambíguas |
| `/lspec design` | Define arquitetura e componentes |
| `/lspec tasks` | Quebra em tarefas atômicas |
| `/lspec execute` | Implementa tarefa por tarefa |
| `/lspec ask` | Explica código existente (leitura, sem implementar) |
| `/lspec map` | Mapeia projeto brownfield (7 docs) |
| `/lspec pause` | Salva checkpoint para retomada |
| `/lspec resume` | Carrega checkpoint e continua |
| `/lspec next` | Avança para próxima fase |
| `/lspec auto` | Executa ciclo completo |

## Pipeline

```
Discovery → Specify → (Discuss) → (Design) → Tasks → Execute
   obrigatório      opcional      opcional    obrigatório obrigatório
```

## Estrutura .specs/

```
.specs/
├── project/
│   ├── PROJECT.md      # visão e metas
│   ├── ROADMAP.md      # features e marcos
│   └── STATE.md        # decisões, blockers, lições
├── codebase/           # análise brownfield (7 docs)
├── features/
│   └── [feature]/
│       ├── spec.md     # requisitos rastreáveis
│       ├── context.md  # decisões do usuário
│       ├── design.md   # arquitetura
│       └── tasks.md    # tarefas atômicas
└── fixes/
    └── [fix]/
        └── spec.md     # descrição do bug e solução
```

## Auto-trigger

O LSpec detecta automaticamente intenção do usuário. Não precisa digitar comando — apenas descreva o que quer fazer.

Ex: "tenho um bug no login" → detecta como bug flow → inicia discovery reduzido.