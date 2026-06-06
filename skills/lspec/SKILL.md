---
name: lspec
description: "LSpec PI — Spec-Driven Development. Pipeline SEQUENCIAL: /lspec [request] → Discovery → Research → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute. Auto-avança. Salva estado após cada fase."
license: CC-BY-4.0
metadata:
  author: Lua - github.com/by-lua
  version: 3.6.0
---

# LSpec PI — Hub

## Como Funciona

```
Você: /lspec [request]

→ Discovery (pergunta o que você quer)
→ SALVA estado
→ Research (analisa o código)
→ SALVA estado
→ [Discuss?] (se há ambiguidade)
→ SALVA estado
→ Specify (especifica requisitos)
→ SALVA estado
→ [Clarify?] (se há ambiguidade)
→ SALVA estado
→ [Design?] (se há decisão arquitetural)
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
DISCOVERY → RESEARCH → [DISCUSS?] → SPECIFY → [CLARIFY?] → [DESIGN?] → TASKS → EXECUTE
```

| FASE | O QUE FAZ | QUANDO TERMINA |
|------|-----------|----------------|
| Discovery | Pergunta o que você quer | Salva STATE.md |
| Research | Analisa o código existente | Salva research.md |
| Discuss | Captura áreas cinzentas | Salva discuss.md |
| Specify | Especifica requisitos | Salva spec.md |
| Clarify | Resolve ambiguidades | Salva clarify.md |
| Design | Decisões arquiteturais | Salva design.md |
| Tasks | Quebra em tarefas | Salva tasks.md |
| Execute | Implementa o código | Salva mudanças |

**Fases entre [] são OPICIONAIS** — executadas só quando necessário, mas fazem parte do pipeline quando ativadas.

---

## Regras Absolutas

**NUNCA:**
- ❌ Pular fase obrigatória (Discovery, Research, Specify, Tasks, Execute)
- ❌ Ir direto para código
- ❌ Implementar sem spec
- ❌ Editar sem passar pelo pipeline
- ❌ Criar spec duplicada — verificar se já existe em `.specs/features/[name]/`
- ❌ Ignorar design reference — se `.specs/features/[name]/design.md` existir, LER e SEGUIR

**SEMPRE:**
- ✓ Salvar estado após cada fase
- ✓ Próxima fase usa artifact da anterior
- ✓ Fases opcionais ativadas quando necessário
- ✓ Mudanças estruturais → atualizar `.specs/project/{PROJECT.md, ROADMAP.md}`
- ✓ SPEC Enforcement: mudança ocorre → verificar se spec existe. Se sim → atualizar. Se não → criar.

---

## Gates Bloqueantes

### Compliance Gate (antes de QUALQUER edit)

```
┌────────────────────────────────────────────────────────────────┐
│ COMPLIANCE GATE CHECKLIST                                      │
├────────────────────────────────────────────────────────────────┤
│ □ 1. Discovery completo — contexto coletado                    │
│ □ 2. Requirements claros — spec.md existente                    │
│ □ 3. Design verificado — design.md existe (se aplicável)       │
│ □ 4. Tasks aprovadas — tasks.md com tarefas definidas          │
│ □ 5. State atualizado — STATE.md reflete estado atual          │
└────────────────────────────────────────────────────────────────┘
```

Se qualquer □ = false → **BLOQUEIA**. Resolva antes de editar.

### State Saved Gate (entre cada fase)

```
┌────────────────────────────────────────────────────────────────┐
│ STATE SAVED GATE                                               │
├────────────────────────────────────────────────────────────────┤
│ □ STATE.md existe para esta feature                            │
│ □ Última fase completada está marcada                          │
│ □ Progresso atualizado (ROADMAP.md)                            │
│ □ Decisões documentadas (AD-NNN)                              │
└────────────────────────────────────────────────────────────────┘
```

---

## NUNCA Rules (Completas)

**NUNCA:**
- ❌ Quick mode
- ❌ Auto-sizing
- ❌ Pular fases obrigatórias
- ❌ Parar no meio do fluxo
- ❌ Editar código fora do spec/design
- ❌ Pular Autosave de estado
- ❌ Prosseguir com gate vermelho
- ❌ Criar estrutura `fixes/` (tudo é feature)
- ❌ Fabricar informação (se não sabe, diga "não sei")
- ❌ Modificar testes escritos no RED
- ❌ Enfraquecer asserções para passar
- ❌ "While I'm here" durante implementação

**SEMPRE:**
- ✓ Pipeline completo (mesmo em BUG flow)
- ✓ Autosave de estado em cada fase
- ✓ Confirmar antes de avançar
- ✓ Atualizar STATE.md
- ✓ Verificar design.md antes de implementar
- ✓ Testes primeiro (RED phase)
- ✓ Gate check após cada tarefa
- ✓ Commit atômico por tarefa
- ✓ Reuse de código existente

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
        ├── discuss.md    # Áreas cinzentas (se ativado)
        ├── spec.md       # Requisitos testáveis
        ├── clarify.md    # Ambiguidades resolvidas (se ativado)
        ├── design.md     # Decisões arquiteturais (se ativado)
        └── tasks.md      # Tarefas atômicas
```

**Notas:**
- Bugs e ajustes usam prefixo `fix-` ou `bug-` no nome da pasta em `features/`
- Se feature já existe, atualiza docs existentes e segue pipeline
- **NÃO existe pasta `fixes/`** — tudo em `features/`

---

## Artifact Enforcement

Cada fase produz um artifact que a próxima usa:

```
Discovery  → STATE.md       → Research
Research   → research.md     → Discuss?
Discuss    → discuss.md      → Specify
Specify    → spec.md        → Clarify?
Clarify    → clarify.md      → Design?
Design     → design.md       → Tasks
Tasks      → tasks.md       → Execute
```

**Sem artifact = bloqueia.** A fase não começa sem o artifact da anterior.

---

## Modos de Operação

### Modo: Forward (padrão)
```
/lspec [request] → Discovery → Research → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute
```
Para: projeto novo, feature, bug, melhoria

**Discovery adaptativo:**
- Bug: perguntas curtas (1-3)
- Feature: perguntas médias (5-8)
- Projeto novo: perguntas completas (10-15)

### Modo: Reverse
```
/lspec reverse → Mapear código existente → SPEC.md
```
Para: analisar código existente e gerar spec

**Quando usar:**
- Projeto sem documentação
- Código legado para entender
- "Como esse projeto funciona?"

### Modo: Map (brownfield)
```
/lspec map → Analisar codebase → 7 docs de arquitetura
```
Para: projetos existentes precisam de mapa

---

## Comandos

| Comando | Modo | Uso |
|---------|------|-----|
| `/lspec [request]` | Forward | Pipeline completo |
| `/lspec reverse` | Reverse | Mapear código → spec |
| `/lspec map` | Map | Analisar projeto existente |
| `/lspec pause` | - | Pausar e salvar estado |
| `/lspec resume` | - | Retomar de onde parou |
| `/lspec help` | - | Mostrar ajuda |

---

## Fluxo Forward Completo

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

3. Discuss? (se há ambiguidade)
   → Captura área cinzenta
   → Salva features/jwt-auth/discuss.md

4. Specify
   → Usa Discovery + Research
   → Escreve spec.md com requisitos
   → Salva features/jwt-auth/spec.md

5. Clarify? (se há ambiguidade)
   → Resolve ambiguidade
   → Salva features/jwt-auth/clarify.md

6. Design? (se há decisão arquitetural)
   → Decisões de arquitetura
   → Salva features/jwt-auth/design.md

7. Tasks
   → Usa spec.md
   → Quebra em tarefas
   → Salva features/jwt-auth/tasks.md

8. Execute
   → Usa tasks.md
   → Implementa código
   → Salva mudanças

→ Pronto!
```

**Você não precisa chamar cada fase manualmente. O sistema avança sozinho.**

---

## 🤖 Compatibility

This skill works with any AI coding agent that supports skills or custom instructions.

Tested and verified on:

| Agent | Status |
|---|---|
| Antigravity (Gemini) | ✅ Tested |
| Claude Code | ✅ Tested |
| GitHub Copilot | ✅ Tested |
| Cursor | ✅ Tested |
| Opencode | ✅ Tested |

Note: If your agent supports loading custom instructions or skills, this skill should work. The agents above are simply where it has been actively tested.

---

📄 License: CC-BY-4.0 © Tech Lead's Club
Built with ❤️ by the Tech Lead's Club community