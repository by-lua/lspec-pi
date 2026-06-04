---
name: lspec-execute
description: "Executa tarefa/implementa codigo seguindo spec e design."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - Execute APENAS tarefas aprovadas na fase Tasks
  - NUNCA invente codigo fora do spec
  - A cada tarefa, mostre o resultado e aguarde confirmacao
  - Ao completar, mostre o que mudou e aguarde validacao

# execute — Implementacao de Tarefas

**Goal:** Implementar UMA tarefa por vez. Mudancas cirurgicas. Verificar. Comitar. Repetir.

---

## MANDATORY: Antes de Comecar Qualquer Implementacao

**Leia e declare:**

1. **Suposicoes** - O que estou assumindo? Alguma incerteza?
2. **Arquivos a mexer** - Liste SOMENTE os arquivos que esta tarefa requer
3. **Criterios de sucesso** - Como vou verificar se funciona?

⚠️ **Nao prossiga sem declarar isso explicitamente.**

---

## Processo

### 0. Listar Passos Atomicos (OBRIGATORIO se Tasks foi pulada)

Se nao existir `tasks.md` para esta feature, voce DEVE listar passos atomicos antes de escrever qualquer codigo. Isso e inegociavel.

```
## Execution Plan

1. [Step] → files: [list] → verify: [how] → commit: [message]
2. [Step] → files: [list] → verify: [how] → commit: [message]
3. [Step] → files: [list] → verify: [how] → commit: [message]
```

**Cada passo deve ser:**
- UM entregavel (um componente, uma funcao, um endpoint, uma mudanca de arquivo)
- Verificavel independentemente (pode provar que funciona antes de continuar)
- Comitavel independentemente (tem seu proprio commit atomico)

Se listar passos revelar >5 passos ou dependencias complexas, PARE e crie um `tasks.md` formal. A fase Tasks foi erroneamente pulada.

### 1. Escolher Tarefa

De tasks.md (se existir) ou do plano inline acima. Usuario especifica ("implemente T3") ou sugira proxima disponivel.

### 2. Verificar Dependencias

Se tasks.md existe, check dependencies. Se usando plano inline, siga a ordem listada.

❌ Se bloqueado: "T3 depende de T2 que ainda nao esta pronto. Devo fazer T2 primeiro?"

### 3. Declarar Plano de Implementacao

Antes de escrever codigo:

```
Files: [list]
Approach: [brief description]
Success: [how to verify]
```

### 4. Escrever Testes Primeiro (RED)

Se a tarefa inclui testes (per campo Tests em tasks.md ou TESTING.md coverage matrix):

1. Escreva o arquivo(s) de teste ANTES de escrever qualquer implementacao
2. Testes devem codificar o comportamento esperado dos criterios "Done when" da tarefa
3. Rode o comando de teste — confirme que testes FALHAM (estado RED)
4. Se testes passam antes da implementacao existir, os testes estao fracos demais — reescreva-os

**Constraints:**
- Testes definem comportamento correto independentemente da implementacao
- Cada criterio de aceitacao de "Done when" mapeia pra pelo menos uma assercao de teste
- Edge cases de spec.md que se aplicam a esta tarefa tambem recebem casos de teste

Se a tarefa NAO inclui testes (ex: entity-only, config-only), pule para o Passo 4b.

### 4b. Implementar (GREEN)

Escreva a implementacao minima necessaria para satisfazer os criterios de sucesso da tarefa.

**HARD CONSTRAINTS:**
- NAO modifique testes escritos no Passo 4. Testes sao o spec — implementacao conforma a eles.
- NAO enfraqueça asserções (tornando-as menos especificas para passar mais facilmente)
- NAO delete ou skip casos de teste
- NAO use mecanismos skip/disable/pending do framework de testes para bypassar testes falhando
- Codigo minimo para passar — salve melhorias estruturais para uma tarefa de refactor

Se um teste esta genuinamente errado (testa o comportamento errado per spec), PARE e pergunte ao usuario antes de modifica-lo. Nunca mude um teste silenciosamente.

Siga coding-principles.md:
- Codigo mais simples que funciona
- Mexa SOMENTE nos arquivos listados
- Sem scope creep

### 5. Gate Check (VERIFY)

Rode o comando de gate check da definicao da tarefa. Isso e OBRIGATORIO.

1. Look up the command for the task's Gate level (quick/full/build) in TESTING.md's Gate Check Commands section, then run it
2. Non-zero exit code = STOP. Fix the failure. Re-run. Nao prossiga ate ficar verde.
3. Confirme que o count de testes corresponde as expectativas (nenhum teste foi silenciosamente deletado ou skipped)

**Tiered gates (from TESTING.md Gate Check Commands):**

| Task includes | Gate level | What runs |
|--------------|------------|------------|
| Unit tests only | Quick | Unit test command |
| E2E or integration tests | Full | Unit + E2E commands |
| Last task in a phase | Build | Build + lint + all tests |
| No tests (config, entities, etc) | Build | Build + lint only |

### 6. Pos-Gate Review

Apos o gate check passar:

1. Verificar test count: Ha pelo menos tantos casos de teste quanto antes? (previne deletion silenciosa)
2. Verificar que nao ha SPEC_DEVIATION: Se implementacao divergiu do spec/design, adicione um marcador:

```
// SPEC_DEVIATION: [what diverged]
// Reason: [why the deviation was necessary]
```

3. Verificacao rapida de complexidade: "Um engenior senior sinalizaria isso como complicado demais?"
   - Sim → Simplifique, re-rode gate
   - Nao → Prossiga para commit

### 7. Git Commit Atomico

Cada tarefa tem seu proprio commit imediatamente apos verificacao. Nunca agrupe multiplas tarefas em um commit.

**Format (Conventional Commits):**

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

**Types:**
- `feat` — New feature or capability
- `fix` — Bug fix
- `refactor` — Code change that neither fixes a bug nor adds a feature
- `docs` — Documentation only
- `test` — Adding or correcting tests
- `style` — Formatting, missing semicolons, etc. (no code change)
- `perf` — Performance improvement
- `build` — Build system or external dependencies
- `ci` — CI configuration files and scripts
- `chore` — Maintenance tasks

**Rules:**
- One task = one commit
- Description references what was DONE, not what was planned
- Include only files listed in the task — never sneak in "while I'm here" changes
- If tests are part of the task, include them in the same commit

### 8. Scope Guardrail

Durante implementacao, voce notara coisas que podem ser melhoradas, refatoradas ou adicionadas. **Nao atue nelas.** Em vez disso:

- Se e bug: anote em STATE.md como blocker
- Se e melhoria: anote em STATE.md em "Deferred Ideas" ou "Lessons Learned"
- Se e relacionado a tarefa atual: only include it if it's in the "Done when" criteria

**The heuristic:** "Is this in my task definition?" If no, don't touch it.

### 9. Atualizar Status da Tarefa

Marque tarefa completa em tasks.md. Atualize rastreabilidade de requisitos em spec.md se IDs de requisito forem usados.

---

## Execution Template

```markdown
## Implementing T[X]: [Task Title]

**Reading:** task definition from tasks.md
**Dependencies:** [All done? ✅ | Blocked by: TY]
**Tests:** [unit/e2e/integration/none]
**Gate:** [quick/full/build]

### Pre-Implementation (MANDATORY)

- **Assumptions:** [state explicitly]
- **Files to touch:** [list ONLY these]
- **Success criteria:** [how to verify]

### RED: Write Tests

- Test file(s): [paths]
- Test count: [N test cases]
- Confirmed failing: [Yes — all N tests fail as expected]

### GREEN: Implement

[Write minimum code to pass tests]

- Tests modified: None
- Tests skipped/deleted: None

### VERIFY: Gate Check

- Command: [gate check command]
- Result: [X passed, 0 failed]
- Test count: [N — matches RED phase count]

### Post-Gate

- [x] No SPEC_DEVIATION (or markers added)
- [x] No unnecessary changes made
- [x] Matches existing patterns

**Status:** ✅ Complete | ❌ Blocked | ⚠️ Partial
```

---

## Tips

- **One task at a time** — Focus prevents errors
- **Tools matter** — Wrong MCP = wrong approach
- **Reuses save tokens** — Copy patterns, don't reinvent
- **Check before commit** — Verify all criteria, then commit
- **Stay surgical** — Touch only what's necessary
- **Commit per task** — Clean git history enables bisect and rollback
- **Never "while I'm here"** — Scope creep during implementation is the #1 quality killer
- **Learn from mistakes** — If something goes wrong, add a Lesson Learned to STATE.md