---
name: lspec-tasks
description: "Gerencia lista de tarefas, atualiza status e progresso."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - NUNCA execute codigo fora da fase Execute
  - Liste tarefas e aguarde APROVACAO antes de implementar
  - Apresente diagrama de dependencias junto com as tarefas

# tasks — Divisao em Tarefas

**Goal:** Quebrar em tarefas GRANULARES, ATOMICAS. Dependencias claras. Plano de execucao paralelo.

**Pule esta fase quando:** Tiver <= 3 passos obvios. Entao tasks sao implicitas — va direto pro Execute e liste-as inline.

---

## Por que Tarefas Granulares?

| Tarefa Vazia (Ruim) | Tarefas Granulares (Bom) |
| ------------------- | ------------------------- |
| "Criar formulario" | T1: Criar input de email |
|                   | T2: Adicionar validacao de email |
|                   | T3: Criar botao de submit |
|                   | T4: Adicionar gerencia de estado do form |
|                   | T5: Conectar form a API |

**Beneficios:**
- Agentes nao erram — foco unico, sem ambiguidade
- Facil de testar — cada tarefa = um resultado verificavel
- Paralelizavel — tarefas independentes rodam simultaneamente
- Erros isolados — uma falha nao bloqueia tudo

**Regra:** Uma tarefa = UMA destas:
- Um componente
- Uma funcao
- Um endpoint de API
- Uma mudanca de arquivo

---

## Processo

### 1. Revisar Design

Leia `.specs/[feature]/design.md` antes de criar tarefas.

### 2. Quebrar em Tarefas Atomicas

**Tarefa = UM entregavel.** Exemplos:

- ✅ "Criar interface UserService" (um arquivo, um conceito)
- ❌ "Implementar gerenciamento de usuarios" (muito vago, multiplos arquivos)

### 3. Definir Dependencias

O que PRECISA ser feito antes desta tarefa poder comecar?

### 4. Criar Plano de Execucao

Agrupar tarefas em fases. Identificar o que pode rodar em paralelo.

### 5. Validar Antes de Apresentar (OBRIGATORIO)

Antes de mostrar tarefas ao usuario, rode TODOS os tres checks de pre-aprovacao:

**Check 1: Granularidade** — verify each task is atomic.

**Check 2: Diagrama-Definicao Cross-Check** — verify the execution diagram matches every task's `Depends on` field.

**Check 3: Co-localizacao de Testes** — verify every task's `Tests` field matches TESTING.md coverage matrix.

**Output both tables with the tasks** so the user can see the validation results. Any ❌ means you MUST restructure before presenting.

### 6. Perguntar Sobre MCPs e Skills

**CRITICO:** Antes da execucao, pergunte ao usuario:

> "Para cada tarefa, quais ferramentas devo usar?"
> 
> **MCPs Disponiveis:** [lista do projeto ou usuario]
> **Skills Disponiveis:** [lista do projeto ou usuario]

---

## Template: `.specs/[feature]/tasks.md`

```markdown
# [Feature] Tasks

**Design**: `.specs/[feature]/design.md`
**Status**: Draft | Approved | In Progress | Done

---

## Execution Plan

### Phase 1: Foundation (Sequential)

Tarefas que devem ser feitas primeiro, em ordem.

T1 → T2 → T3

### Phase 2: Core Implementation (Parallel OK)

Apos foundation, estas podem rodar em paralelo.

     ┌→ T4 ─┐

T3 ──┼→ T5 ─┼──→ T8
└→ T6 ─┘
T7 ──────→

### Phase 3: Integration (Sequential)

Juntando tudo.

T8 → T9

---

## Task Breakdown

### T1: [Criar Interface X]

**What:** [Uma frase: entregavel exato]
**Where:** `src/path/to/file.ts`
**Depends on:** None
**Reuses:** `src/existing/BaseInterface.ts`
**Requirement:** [FEAT]-01

**Tools:**
- MCP: `filesystem` (or NONE)
- Skill: NONE

**Done when:**
- [ ] Interface definida com todos os metodos do design
- [ ] Types exportados corretamente
- [ ] Sem erros TypeScript

**Tests:** [unit/e2e/integration/none — from coverage matrix]
**Gate:** [quick/full/build — from gate check commands]

---

### T2: [Implementar Servico Y] [P]

**What:** [Entregavel exato]
**Where:** `src/services/YService.ts`
**Depends on:** T1
**Reuses:** `src/services/BaseService.ts` patterns

**Tools:**
- MCP: `filesystem`, `context7`
- Skill: NONE

**Done when:**
- [ ] Implementa interface do T1
- [ ] Handles casos de erro do design
- [ ] Gate check passa
- [ ] Test count: [N] tests pass

**Tests:** unit
**Gate:** quick

---

## Parallel Execution Map

```
Phase 1 (Sequential):
  T1 ──→ T2 ──→ T3

Phase 2 (Parallel):
  T3 complete, then:
    ├── T4 [P]
    ├── T5 [P]  } Can run simultaneously
    └── T6 [P]

Phase 3 (Sequential):
  T4, T5, T6 complete, then:
    T7 ──→ T8
```

**Constraint:** Uma tarefa marcada `[P]` precisa de:
- Nenhuma dependencia nao terminada
- Tipo de teste requerido e parallel-safe (per TESTING.md)
- Nenhum estado mutavel compartilhado com outras tarefas `[P]` na mesma fase

---

## Task Granularity Check

| Task | Scope | Status |
| ---- | ----- | ------ |
| T1: Create email input | 1 component | ✅ Granular |
| T2: Add validation function | 1 function | ✅ Granular |
| T3: Create form with all fields | 5+ components | ❌ Split it! |
| T4: Connect to API | 1 function | ✅ Granular |

**Granularity check:**
- ✅ 1 component / 1 function / 1 endpoint = Good
- ⚠️ 2-3 related things in same file = OK if cohesive
- ❌ Multiple components or files = MUST split

---

## Tips

- **[P] = Parallel OK** — Mark tasks that can run simultaneously
- **Reuses = Token saver** — Always reference existing code
- **Tools per task** — MCPs and Skills prevent wrong approaches
- **Dependencies are gates** — Clear what blocks what
- **Done when = Testable** — If you can't verify it, rewrite it
- **One commit per task** — Plan the commit message format in advance