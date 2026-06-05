---
name: lspec-execute
description: "Executa implementação de feature seguindo Discovery, Spec, Design e Tasks. Execute é OBRIGATÓRIO — nunca pular."
---

# lspec-execute — Execução de Implementação

**Fase do pipeline:** Execute (última fase, obrigatória)

**Precede:** Nenhuma (fase final)
**Depende de:** Tasks (tarefas aprovadas e ordenadas)

---

## Pipeline Context

```
Discovery → [Discuss] → Specify → [Clarify] → [Design] → Tasks → Execute
                                        ↑__________________|
```

| Fase | Status | Descrição |
|------|--------|-----------|
| Discovery | Obrigatório | Análise de código existente, coleta de contexto |
| Discuss | Opcional | Debate com usuário sobre requisitos, trade-offs |
| Specify | Obrigatório | Criação de spec.md com requisitos |
| Clarify | Opcional | Clarificação de pontos ambíguos |
| Design | Opcional | Criação de design.md com abordagem técnica |
| Tasks | Obrigatório | Decomposição em tarefas verificáveis |
| **Execute** | **OBRIGATÓRIO** | Implementação código |

**⚠️ Execute NUNCA pode ser pulado. Se chegar aqui, implementação é mandatória.**

---

## Regra Absoluta

```
⚠️ EXECUTE É FASE FINAL — CÓDIGO DEVE SER ESCRITO
- Execute APENAS tarefas aprovadas na fase Tasks
- NUNCA invente código fora do spec/design
- Autosave de estado após cada fase
```

### Proibidos

- ❌ **quick mode** — sempre implementar completo, sem atalhos
- ❌ **auto-sizing** — não redimensionar automaticamente sem aprovação
- ❌ **pular tarefas** — implementar todas as tarefas listadas
- ❌ **features em fixes/** — toda estrutura vai em `features/`

---

## PI Packages — Navegação de Código

**Code Navigation — NUNCA use bash grep/find**

Use SOMENTE tools cymbal_* nativas do pi-cymbal (quando instalado):
- `cymbal_map` → estrutura do repo (arquivos, diretórios, módulos)
- `cymbal_search` → buscar símbolos/texto em todo o código
- `cymbal_outline` → symbols de um arquivo (classes, funções, métodos)
- `cymbal_show` → ler por símbolo ou linha específica
- `cymbal_refs` → encontrar todas as referências a um símbolo
- `cymbal_impact` → impacto a montante (upstream callers)

Se `pi-lsp-tools` instalado → use LSP para go-to-definition, refs, rename.

Bash grep/find SOLO quando:
- cymbal_* não está disponível (pacote não instalado)
- cymbal_* falha para um caso específico
- Precisa de output pipeado para outro comando

Se nenhum instalado → recomende instalar:
```bash
pi install npm:pi-cymbal
pi install npm:@davehardy20/pi-lsp-tools
```

**Fallback com agent-lsp:**
```markdown
<!-- agent-lsp:rules:start -->
[Usar tools agent-lsp para código: list_symbols, find_symbol, inspect_symbol, 
 find_references, find_callers, blast_radius, etc]
<!-- agent-lsp:rules:end -->
```

---

## Estrutura de Diretórios

```
features/
├── feature-name/
│   ├── STATE.md          # Estado do projeto (autosave por fase)
│   ├── spec.md           # Requisitos
│   ├── design.md         # Abordagem técnica
│   ├── tasks.md          # Tarefas aprovadas
│   └── impl/
│       ├── index.ts      # Entry point
│       ├── types.ts      # Tipos
│       └── [modulos].ts  # Módulos
└── shared/
    └── [componentes]
```

**NUNCA criar `fixes/` — tudo é feature.**

---

## Autosave de Estado

**Após cada fase do Execute, salvar estado em STATE.md:**

```markdown
## Execute Phase Status

### Current Task
- T[X]: [Title]
- Status: [in-progress/complete/blocked]
- Started: [timestamp]

### Completed Tasks
- T1: ✅ [date]
- T2: ✅ [date]

### Pending Tasks
- T3: [description]
- T4: [description]

### Blockers
- [ blocker description ]

### Recent Commits
- [hash] [message]
```

**Autosave triggers:**
1. Início de nova tarefa
2. Commit feito
3. Blocker identificado
4. Fim de sessão

---

## Processo de Implementação

### 0. Verificar Pré-condições

```markdown
## Pre-Implementation Check

✅ Discovery completo? → [y/n]
✅ Spec.md existe? → [y/n]
✅ Design.md existe? → [y/n]
✅ Tasks.md existe? → [y/n]

If any ❌ → PARE e resolva antes de prosseguir
```

### 1. Carregar Contexto

1. Ler `features/[name]/spec.md`
2. Ler `features/[name]/design.md`
3. Ler `features/[name]/tasks.md`
4. Ler `features/[name]/STATE.md`
5. Identificar tarefa atual

### 2. Declarar Plano de Implementação

**Antes de escrever código, declare:**

```markdown
## Implementing T[X]: [Task Title]

**Reading:**
- task definition from tasks.md
- design approach from design.md

**Dependencies:**
- [All done? ✅ | Blocked by: TY]

**Tests:** [unit/e2e/integration/none]
**Gate:** [full/build] — NUNCA quick

**Files to touch:**
- [list ONLY these files]

**Success criteria:**
- [how to verify]
```

### 3. TDD — RED (Testes Primeiro)

Se tarefa inclui testes:

1. Escrever arquivo(s) de teste ANTES de qualquer implementação
2. Mapear cada critério "Done when" → asserção de teste
3. Cobrir edge cases do spec.md
4. Rodar comando de teste → confirmar FALHAM (RED)
5. Se testes passam sem implementação → testes fracos, reescreva

**Se tarefa não inclui testes:**
- Pular para passo 4b
- Documentar em STATE.md: "No tests for this task"

### 4. Implementar — GREEN

Implementar código mínimo para satisfazer critérios de sucesso.

**HARD CONSTRAINTS:**
- ❌ NÃO modificar testes escritos no RED
- ❌ NÃO enfraquecer asserções
- ❌ NÃO deletar ou skipar casos de teste
- ❌ NÃO usar mecanismos skip/disable/pending

**Permitido:**
- ✅ Codigo mais simples que funciona
- ✅ Mexer SOMENTE nos arquivos declarados
- ✅ Sem scope creep

Se um teste está genuinamente errado (testa comportamento errado):
→ PARE e pergunte ao usuário ANTES de modificar

### 5. Gate Check — VERIFY

**⚠️ SEMPRE usar full ou build — NUNCA quick**

Rode o comando de gate check definido em TESTING.md:

| Task includes | Gate level | Command |
|---------------|------------|---------|
| Unit tests only | Build | build + lint + unit |
| E2E/integration | Full | unit + e2e |
| Last task | Build | build + lint + all tests |
| No tests | Build | build + lint only |

**Sequência:**
1. Run gate command
2. Non-zero exit → STOP → Fix → Re-run
3. Confirmar contagem de testes (nenhum silenciosamente deletado)

### 6. Post-Gate Review

```markdown
### Post-Gate Checklist

- [ ] Test count matches RED phase count
- [ ] No SPEC_DEVIATION (or markers added)
- [ ] No unnecessary changes made
- [ ] Matches existing patterns
- [ ] Complexity acceptable? (senior engineer flag?)

If [ ] not checked → fix before commit
```

**SPEC_DEVIATION marker (se necessário):**
```typescript
// SPEC_DEVIATION: [what diverged]
// Reason: [why deviation was necessary]
```

### 7. Git Commit Atômico

```bash
git add [files]
git commit -m "<type>(<scope>): <description>

[optional body]

[optional footer(s)]"
```

**Types permitidos:**
- `feat` — New feature
- `refactor` — Code change (no bug fix, no feature)
- `docs` — Documentation
- `test` — Tests
- `build` — Build system
- `ci` — CI config

**Rules:**
- One task = one commit
- Descrição = o que foi FEITO, não planejado
- Include only files in task definition
- Tests no mesmo commit se parte da tarefa

### 8. Autosave de Estado

Após commit, atualizar STATE.md:

```markdown
## Execute Status Update

**Completed:** T[X] - [date] - [commit hash]
**Next:** T[Y] - [description]

**Changes:**
- [file] - [change summary]
```

---

## Execution Template

```markdown
## Implementing T[X]: [Task Title]

**Dependencies:** ✅ [all done] | ❌ Blocked by TY
**Tests:** [type]
**Gate:** [full/build] — NEVER quick

### Pre-Implementation (MANDATORY)

- **Assumptions:** [state explicitly]
- **Files to touch:** [list ONLY these]
- **Success criteria:** [how to verify]

### RED: Write Tests

- Test file(s): [paths]
- Test count: [N test cases]
- Status: Confirmed failing ✅

### GREEN: Implement

[Write minimum code to pass tests]

- Tests modified: ❌ None
- Tests skipped/deleted: ❌ None

### VERIFY: Gate Check

- Command: [gate command]
- Result: [X passed, 0 failed]
- Test count: [N — matches RED]

### Post-Gate

- [x] No SPEC_DEVIATION
- [x] No unnecessary changes
- [x] Matches patterns

### Commit

- Hash: [git hash]
- Files: [list]

**Status:** ✅ Complete | ❌ Blocked | ⚠️ Partial
```

---

## Scope Guardrail

**Durante implementação, você notará coisas melhoráveis. NÃO atue nelas.**

| Type | Action |
|------|--------|
| Bug | Anotar em STATE.md como blocker |
| Melhoria | Anotar em "Deferred Ideas" |
| Related to current task | Include only if in "Done when" |

**Heuristic:** "Is this in my task definition?" → No → Don't touch it

---

## Tips

- **Uma tarefa por vez** — foco previne erros
- **Ferramentas importam** — LSP tools para navegação, não grep
- **Reuse padrões** — copy existing, don't reinvent
- **Verifique antes de commit** — todos critérios antes de commitar
- **Surgical changes** — toque só o necessário
- **Commit por task** — git history limpo = bisect fácil
- **Nunca "while I'm here"** — scope creep é assassino de qualidade
- **Learn from mistakes** — se algo der errado, adicione Lesson Learned

---

## Error Recovery

Se implementação falha:

1. Identificar erro específico
2. Verificar se é blocker ou não
3. Se blocker → anota em STATE.md, pergunta usuário
4. Se não blocker → fixa, re-roda gate
5. Nunca prossiga com gate vermelho

---

## Fluxo de Continuação

Ao finalizar todas as tasks da fase Execute:

```
→ Todas as tasks completas. Deseja fazer validação final?
```