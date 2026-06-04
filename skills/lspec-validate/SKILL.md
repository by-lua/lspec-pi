---
name: lspec-validate
description: "Valida e verifica implementacao contra spec."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - Verifique TODOS os criterios de aceitacao antes de declarar completo
  - Execute gate check de nivel Build OBRIGATORIO
  - Apresente resultado por tarefa e aguarde confirmacao do usuario
  - NUNCA use quick mode ou auto-sizing
  - Estrutura: features/ apenas, NAO use fixes/

# validate — Validacao e Verificacao

**Goal:** Verificar que implementacao atende spec E principios de codigo.

---

## Pipeline de Validacao

### FASE 1: Discovery

Colete informacoes da feature:

```
.specs/features/[feature]/
  - spec.md          (user stories + criterios)
  - edge-cases.md    (casos limites se existir)
```

Verifique:
- [ ] spec.md existe em `.specs/features/[feature]/`
- [ ] user stories P1 estao definidas
- [ ] criterios de aceitacao estao claros

### FASE 2: Discuss (OPCIONAL)

Se houver ambiguidade no spec:
- Confirme interpretacao com usuario
- Documente decisoes tomadas
- Prossiga apenas apos alinhamento

### FASE 3: Specify

Para cada user story P1 (MVP):

```
### P1: [Story Title]

**Acceptance Criteria:**
1. WHEN [X] THEN [Y] → [PASS/FAIL]
2. WHEN [X] THEN [Y] → [PASS/FAIL]
```

Registre criterios que serao validados.

### FASE 4: Clarify (OPCIONAL)

Se edge-cases.md existir:
- Revise casos limites
- Confirme handling implementado

### FASE 5: Design (OPCIONAL)

Se design.md existir:
- Verifique implementacao segue estrutura definida
- Confirme componentes/módulos estao corretos

### FASE 6: Tasks

Verifique tasks.md:
- [ ] Todas as tarefas marcadas como done?
- [ ] Alguma bloqueada ou parcial?
- [ ] Nenhuma tarefa em fixes/

### FASE 7: Execute

Execute validacao completa:

#### 1. Code Quality Check (OBRIGATORIO)

Para cada arquivo modificado, verifique contra coding-principles.md:

| Check | Pass? |
| ----- | ----- |
| Nao adicionou features alem do pedido | |
| Nao criou abstrações para codigo single-use | |
| Nao adicionou "flexibilidade" desnecessaria | |
| Apenas tocou arquivos necessarios para task | |
| Nao "melhorou" codigo nao relacionado | |
| Matches existing patterns/style | |

❌ Algum "No"? → Corrija antes de marcar completo.

#### 2. Gate Check de Build (OBRIGATORIO)

Rode o comando de gate check de nivel Build do TESTING.md.

1. Run: `[build gate command from TESTING.md]`
2. Non-zero exit code = STOP. Nao prossiga.
3. Registre resultados:
   - Total test count: [N]
   - Passed: [N]
   - Failed: [list]

---

## Validation Report Template

```markdown
# [Feature] Validation

**Date:** [YYYY-MM-DD]
**Spec:** `.specs/features/[feature]/spec.md`

---

## Task Completion

| Task | Status | Notes |
| ---- | ------ | ----- |
| T1 | ✅ Done | - |
| T2 | ⚠️ Partial | [Issue] |

---

## User Story Validation

### P1: [Story Title] ⭐ MVP

| Criterion | Result |
| --------- | ------ |
| WHEN X THEN Y | ✅ PASS |
| WHEN A THEN B | ❌ FAIL - [reason] |

---

## Code Quality

| Check | Pass? |
| ----- | ----- |
| No features beyond what was asked | ✅ |
| No single-use abstractions | ✅ |
| No unnecessary flexibility | ✅ |
| Only touched required files | ✅ |
| Matches existing patterns | ✅ |

---

## Tests

- **Gate command:** [full command]
- **Result:** [X] passed, [Y] failed

---

## Summary

**Overall:** ✅ Ready | ⚠️ Issues | ❌ Not Ready

**What works:** [List]
**Issues found:** [Issue 1: How to fix]
**Next steps:** [Action]
```

---

## Tips

- **P1 first** — MVP deve funcionar antes de P2/P3
- **WHEN/THEN = Test** — Cada criterio e um test case
- **Be specific** — "Doesn't work" nao e util
- **Recommend fixes** — Nao apenas reportar problemas, criar tasks
- **Quality check e mandatory** — Nao opcional
- **NUNCA quick mode** — Validacao completa sempre
- **Estrutura features/** — Nunca use fixes/