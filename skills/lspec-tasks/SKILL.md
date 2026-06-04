---
name: lspec-tasks
description: "Quebra requirements em tarefas granulares, atômicas, com dependências claras e plano de execução. Fase OBRIGATÓRIA antes de Execute."
---

warning: |
  ⚠️ REGRAS ABSOLUTAS:
  - Tasks É OBRIGATÓRIA — NUNCA pule esta fase
  - NUNCA use quick mode ou auto-sizing
  - Output vai para `features/[name]/tasks.md` (NÃO em fixes/)
  - Autosave de estado em cada transição de fase

# Tasks — Divisão em Tarefas Granulares

**Goal:** Transformar requirements em tarefas ATÔMICAS, PARALELIZÁVEIS, VERIFICÁVEIS.

**Pipeline completo:**
```
Discovery → [Discuss (opcional)] → Specify → [Clarify (opcional)] → [Design (opcional)] → Tasks → Execute
```

**Tasks é OBRIGATÓRIA.** Execute não começa sem tarefas aprovadas.

---

## Por que Tarefas Granulares?

| Tarefa Vazia (Ruim) | Tarefas Granulares (Bom) |
|---------------------|--------------------------|
| "Criar formulário" | T1: Criar input de email |
|                   | T2: Adicionar validação de email |
|                   | T3: Criar botão de submit |
|                   | T4: Adicionar gerência de estado do form |
|                   | T5: Conectar form a API |

**Benefícios:**
- Agentes não erram — foco único, sem ambiguidade
- Fácil de testar — cada tarefa = um resultado verificável
- Paralelizável — tarefas independentes rodam simultaneamente
- Erros isolados — uma falha não bloqueia tudo

**Regra:** Uma tarefa = UMA destas:
- Um componente
- Uma função
- Um endpoint de API
- Uma mudança de arquivo

---

## Fluxo de Trabalho

### Fase 1: Carregar Contexto

Antes de criar tarefas, carregue:

1. **Requirements:** `features/[name]/requirements.md`
2. **Spec (se existir):** `features/[name]/spec.md`
3. **Design (se existir):** `features/[name]/design.md`

```markdown
## Contexto Carregado

- [x] requirements.md ✓
- [x] spec.md ✓
- [ ] design.md (opcional)
```

### Fase 2: Quebrar em Tarefas Atômicas

**Tarefa = UM entregável.**

| ✅ Bom | ❌ Mau |
|--------|--------|
| "Criar interface UserService" | "Implementar gerenciamento de usuários" |
| "Adicionar validação de email" | "Fazer validações" |
| "Criar endpoint /api/users" | "Criar API de users" |

### Fase 3: Definir Dependências

O que PRECISA ser feito antes desta tarefa poder começar?

```markdown
T1 → T2 → T3
T3 → T4
T3 → T5
T4 + T5 → T6
```

### Fase 4: Identificar Tarefas Paralelas

Tarefas são paralelas se:
- Nenhuma depende da outra
- Não compartilham estado mutável
- Testes são idempotentes

Marcamos com `[P]` para paralelo.

### Fase 5: Validar (OBRIGATÓRIO)

Antes de apresentar, rode os checks:

#### Check 1: Granularidade

| Task | Scope | Status |
|------|-------|--------|
| T1: Create email input | 1 component | ✅ |
| T2: Add validation | 1 function | ✅ |
| T3: Create form + DB + API | 3 domains | ❌ SPLIT |

#### Check 2: Diagrama vs Depends

Verificar que o execution plan corresponde aos campos `Depends on`.

#### Check 3: Ferramentas Definidas

Cada tarefa deve ter MCPs/Skills definidos antes de prosseguir.

---

## Autosave de Estado

A cada transição de fase, salvar estado em `features/[name]/state.md`:

```markdown
# [Feature] State

**Pipeline:** Discovery → Discuss → Specify → Clarify → Design → **Tasks** → Execute

**Current Phase:** Tasks
**Started:** YYYY-MM-DD HH:MM
**Last Updated:** YYYY-MM-DD HH:MM

## Phase Status

| Phase | Status | Timestamp |
|-------|--------|-----------|
| Discovery | ✅ Done | ... |
| Specify | ✅ Done | ... |
| Tasks | 🔄 In Progress | ... |

## Decisions Made

- [Lista de decisões tomadas durante as fases]

## Blockers

- [Nenhum / lista de bloqueios pendentes]
```

---

## Template: `features/[name]/tasks.md`

```markdown
# [Feature] Tasks

**Design:** `features/[name]/design.md` (se existir)
**Requirements:** `features/[name]/requirements.md`
**Status:** Draft → Approved → In Progress → Done
**Created:** YYYY-MM-DD HH:MM
**Updated:** YYYY-MM-DD HH:MM

---

## Execution Plan

### Phase 1: Foundation (Sequential)

Tarefas que devem ser feitas primeiro, em ordem.

```
T1 → T2 → T3
```

### Phase 2: Core Implementation (Parallel OK)

Após foundation, estas podem rodar em paralelo.

```
     ┌→ T4 ─┐
T3 ──┼→ T5 ─┼──→ T8
└→ T6 ─┘
T7 ──────→
```

### Phase 3: Integration (Sequential)

Juntando tudo.

```
T8 → T9
```

---

## Task Breakdown

### T1: [Nome da Tarefa]

**What:** [Uma frase: entregável exato]
**Where:** `src/path/to/file.ts`
**Depends on:** None
**Reuses:** `src/existing/BaseInterface.ts`
**Requirement:** [REQ]-01

**Tools:**
- MCP: `pi-lsp-tools` / `filesystem` / NONE
- Skill: NONE

**Done when:**
- [ ] Interface definida com todos os métodos do design
- [ ] Types exportados corretamente
- [ ] Sem erros TypeScript

**Tests:** unit / e2e / integration / none
**Gate:** build (NUNCA quick)

---

### T2: [Nome da Tarefa] [P]

**What:** [Entregável exato]
**Where:** `src/services/YService.ts`
**Depends on:** T1
**Reuses:** `src/services/BaseService.ts` patterns

**Tools:**
- MCP: `pi-cymbal` / `pi-lsp-tools`
- Skill: NONE

**Done when:**
- [ ] Implementa interface do T1
- [ ] Handles casos de erro do design
- [ ] Build passa
- [ ] Test count: [N] tests pass

**Tests:** unit
**Gate:** build

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
- Nenhuma dependência não terminada
- Tipo de teste requerido e parallel-safe
- Nenhum estado mutável compartilhado com outras tarefas `[P]` na mesma fase

---

## Validation Results

### Granularity Check

| Task | Scope | Status |
|------|-------|--------|
| T1: Create email input | 1 component | ✅ Granular |
| T2: Add validation function | 1 function | ✅ Granular |
| T3: Create form with all fields | 5+ components | ❌ SPLIT |
| T4: Connect to API | 1 function | ✅ Granular |

### Dependency vs Execution Plan Check

| Task | Depends | In Execution Plan | Status |
|------|---------|-------------------|--------|
| T1 | None | Phase 1 | ✅ |
| T2 | T1 | Phase 1 after T1 | ✅ |
| T3 | T2 | Phase 2 | ✅ |

---

## Approval Gate

Antes de Execute, confirmar:

1. ✅ Todas tarefas são granulares (≥8 tarefas = bom sinal)
2. ✅ Execution plan corresponde a dependencies
3. ✅ Tools definidas para cada tarefa
4. ✅ Sem "quick mode" ou "auto-sizing" em Gates

**Output:** Aprovar para Execute ou pedir refinamento.

---

## Tips

- **[P] = Parallel OK** — Marcar tarefas que podem rodar simultaneamente
- **Reuses = Token saver** — Sempre referenciar código existente
- **Tools por tarefa** — MCPs e Skills previnem abordagens erradas
- **Dependencies são gates** — Claro o que bloqueia o quê
- **Done when = Testable** — Se não pode verificar, reescreva
- **One commit por tarefa** — Plano do formato da mensagem de commit
- **Autosave** — Salvar estado em cada transição