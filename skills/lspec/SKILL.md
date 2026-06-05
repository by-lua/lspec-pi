---
name: lspec
description: "LSpec PI — Spec-Driven Development. Pipeline SEQUENCIAL fixo: /lspec [request] → Discovery → Research → Specify → Tasks → Execute. Auto-avança. Salva estado após cada fase."
license: CC-BY-4.0
metadata:
  author: Lua - github.com/by-lua
  version: 3.2.0
---

# LSpec PI — Hub

## Como Funciona (igual RPIV)

```
Você: /lspec [request]

→ Discovery (pergunta o que você quer)
→ SALVA estado
→ Research (analisa o código)
→ SALVA estado
→ Specify (especifica requisitos)
→ SALVA estado
→ Tasks (quebra em tarefas)
→ SALVA estado
→ Execute (implementa)
→ SALVA estado
→ Pronto
```

**ÚNICO comando:** `/lspec [o que você quer]`

O sistema executa TODO o pipeline em ordem, salvando após cada fase. Nunca pergunta qual fase executar. Nunca pula. Nunca vai direto para código.

---

## Pipeline Sequencial

```
DISCOVERY → RESEARCH → SPECIFY → TASKS → EXECUTE
```

| FASE | O QUE FAZ | QUANDO TERMINA |
|------|-----------|----------------|
| Discovery | Pergunta o que você quer | Salva STATE.md |
| Research | Analisa o código existente | Salva research.md |
| Specify | Especifica requisitos | Salva spec.md |
| Tasks | Quebra em tarefas | Salva tasks.md |
| Execute | Implementa o código | Salva mudanças |

---

## Regras Absolutas

**NUNCA:**
- ❌ Pular fase
- ❌ Ir direto para código
- ❌ Implementar sem spec
- ❌ Editar sem passar pelo pipeline
- ❌ "Decidir" se uma fase é necessária

**SEMPRE:**
- ✓ Salvar estado após cada fase
- ✓ Próxima fase usa artifact da anterior
- ✓ Pipeline completo para qualquer request

---

## Estrutura de Projeto

```
.specs/
├── project/
│   ├── STATE.md         # Estado atual do projeto
│   ├── PROJECT.md       # Visão, objetivos, stack
│   └── ROADMAP.md       # Features e milestones
└── features/
    └── [feature]/
        ├── research.md   # Análise do código existente
        ├── spec.md       # Requisitos testáveis
        └── tasks.md      # Tarefas atômicas
```

---

## Artifact Enforcement

Cada fase produz um artifact que a próxima usa:

```
Discovery  → STATE.md       → Research
Research   → research.md     → Specify
Specify    → spec.md        → Tasks
Tasks      → tasks.md       → Execute
```

**Sem artifact = bloqueia.** A fase não começa sem o artifact da anterior.

---

## Comandos

| Comando | Uso |
|---------|-----|
| `/lspec [request]` | Iniciar pipeline completo (única entrada) |
| `/lspec pause` | Pausar e salvar estado |
| `/lspec resume` | Retomar de onde parou |
| `/lspec map` | Mapear projeto existente |
| `/lspec help` | Mostrar ajuda |

---

## Fluxo Completo

**Você diz:** `/lspec quero adicionar autenticação por JWT`

**Sistema faz:**

```
1. Discovery
   → "Que tipo de autenticação?"
   → Salva .specs/project/STATE.md

2. Research
   → Analisa: existe auth no projeto?
   → Analisa: qual stack de auth?
   → Analisa: onde integrar?
   → Salva features/jwt-auth/research.md

3. Specify
   → Usa Discovery + Research
   → Escreve spec.md com requisitos
   → Salva features/jwt-auth/spec.md

4. Tasks
   → Usa spec.md
   → Quebra em tarefas
   → Salva features/jwt-auth/tasks.md

5. Execute
   → Usa tasks.md
   → Implementa código
   → Salva mudanças

→ Pronto!
```

**Você não precisa chamar cada fase manualmente. O sistema avança sozinho.**