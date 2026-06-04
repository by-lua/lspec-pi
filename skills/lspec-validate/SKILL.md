---
name: lspec-validate
description: "Valida e verifica implementacao contra spec."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - Verifique TODOS os criterios de aceitacao antes de declarar completo
  - Execute gate check de nivel Build OBRIGATORIO
  - Apresente resultado por tarefa e aguarde confirmacao do usuario

# validate — Validacao e Verificacao

**Goal:** Verificar que implementacao atende spec E principios de codigo.

---

## Processo

### 1. Verificar Tarefas Completas

Verifique tasks.md:
- [ ] Todas as tarefas marcadas como done?
- [ ] Alguma bloqueada ou parcial?

### 2. Verificar Criterios de Aceitacao

Para cada user story em spec.md:

```markdown
### P1: [Story Title]

**Acceptance Criteria:**

1. WHEN [X] THEN [Y] → [PASS/FAIL]
2. WHEN [X] THEN [Y] → [PASS/FAIL]
```

### 3. Verificar Edge Cases

De spec.md edge cases:
- [ ] [Edge case 1] handled correctly
- [ ] [Edge case 2] handled correctly

### 4. Executar Gate Check de Build (OBRIGATORIO)

Rode o comando de gate check de nivel Build do TESTING.md. Isso NAO e opcional.

1. Run: `[build gate command from TESTING.md]`
2. Non-zero exit code = STOP. Nao prossiga para Code Quality Check.
3. Registre resultados:
   - Total test count: [N]
   - Passed: [N]
   - Failed: [list]

### 5. Code Quality Check (OBRIGATORIO)

Para cada arquivo modificado, verifique contra coding-principles.md:

| Check | Pass? |
| ----- | ----- |
| No features beyond what was asked | |
| No abstractions for single-use code | |
| No unnecessary "flexibility" added | |
| Only touched files required for task | |
| Didn't "improve" unrelated code | |
| Matches existing patterns/style | |

❌ Algum "No"? → Corrija antes de marcar completo.

### 6. Relatorio

---

## Validation Report Template

```markdown
# [Feature] Validation

**Date:** [YYYY-MM-DD]
**Spec:** `.specs/[feature]/spec.md`

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

## Tests

- **Gate command:** [full command]
- **Result:** [X] passed, [Y] failed
- **Test count before feature:** [N]
- **Test count after feature:** [M]

---

## Summary

**Overall:** ✅ Ready | ⚠️ Issues | ❌ Not Ready

**What works:** [List]
**Issues found:** [Issue 1: How to fix]
**Next steps:** [Action]
```

---

## Tips

- **P1 first** — MVP must work before P2/P3
- **WHEN/THEN = Test** — Each criterion is a test case
- **Be specific** — "Doesn't work" isn't helpful
- **Recommend fixes** — Don't just report problems, create fix tasks
- **Quality check is mandatory** — Not optional