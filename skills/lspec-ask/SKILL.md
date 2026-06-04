---
name: lspec-ask
description: "Faz pergunta sobre o projeto, decisão ou contexto técnico. Determina qual fase do pipeline ativar."
---

# ask

Faz pergunta para entender contexto, determinar tipo de trabalho e ativar a fase correta do pipeline.

**Aviso CRÍTICO:**
- Responda APENAS com perguntas da fase atual
- NUNCA pule fases ou despeje todas perguntas de uma vez
- CONFIRME antes de continuar para próxima fase
- NUNCA pule para implementação durante Discovery

**Pipeline:** Discovery → Discuss (OPCIONAL) → Specify → Clarify (OPCIONAL) → Design (OPCIONAL) → Tasks → Execute

---

## AUTO-DETECÇÃO (rode primeiro)

```bash
# Verificar tipo de projeto
if [ -f ".specs/project/PROJECT.md" ]; then
  echo "EXISTING"
elif [ -d ".specs/features" ]; then
  echo "EXISTING"
elif [ -d "$(find . -name '*.py' -o -name '*.js' -o -name '*.ts' 2>/dev/null | head -1)" ]; then
  echo "CODE_ONLY"
else
  echo "NEW"
fi
```

**Matriz de decisões:**

| Contexto | Ação |
|----------|------|
| EXISTING + bug na msg | Bug Flow — descubra o bug |
| EXISTING + feature na msg | Feature Flow — descubra a feature |
| EXISTING + sem contexto | "Ouvindo..." — escute o usuário |
| CODE_ONLY | Sugira `/lspec reverse` primeiro |
| NEW | 6 fases completas |

---

## Fluxo Adaptativo

**PROJETO NOVO:** 6 fases completas

**BUG:** 3 fases curtas (foco no problema)

**FEATURE:** 4 fases focadas

---

## Bug Flow (curto)

1. O que não está funcionando?
2. Qual o comportamento esperado vs atual?
3. Como reproduzir o bug?

→ Gera `features/bug-[nome]/spec.md`

---

## Feature Flow (focado)

1. O que a feature deve fazer?
2. Quem vai usar?
3. Como você sabe que está pronto?

→ Gera `features/[feature]/spec.md`

---

## Projeto Novo — 6 Fases

### Fase 1: Contexto e Problema

1. Qual o objetivo do projeto?
2. Que problema resolve? Quem tem esse problema?
3. Como sabe que é problema real?
4. O que acontece se não construir?

> CONFIRME antes de continuar

### Fase 2: Visão e Escopo

5. Como define sucesso?
6. O que é o MVP?
7. O que está fora do escopo?
8. Quem é o usuário-alvo?

> CONFIRME antes de continuar

### Fase 3: Stack Técnica

9. Qual linguagem/framework?
10. Código existente para integrar?
11. Restrições (orçamento, equipe, prazo)?

> CONFIRME antes de continuar

### Fase 4: Referências

12. Alguma referência de design?

Se houver: criar `.specs/design-references/`

> CONFIRME antes de continuar

### Fase 5: Riscos

13. O que já foi tentado antes?
14. Qual o maior risco?
15. Parte mais difícil?

> CONFIRME antes de continuar

### Fase 6: Marcos

16. Como dividir em etapas?
17. Primeira coisa que funciona?

→ Gera `PROJECT.md`

---

## Discuss (OPCIONAL)

**Goal:** Capture HOW the user envisions the feature when the spec has ambiguous areas. This is NOT a separate phase — it's triggered within Specify when the agent detects gray areas that need user input.

**Trigger:** Automatically when gray areas are detected during spec creation, or explicitly via "discuss feature", "how should this work?", "capture context"

**When to trigger (auto-detect):** The spec contains user-facing behavior that could go multiple ways AND the user hasn't expressed a preference. If the spec is clear and unambiguous, skip this entirely.

**When NOT to trigger:** Infrastructure work, CRUD operations, well-defined API contracts, anything where the "how" is obvious from the "what".

### Why This Phase Exists

Specifications capture WHAT to build. Design captures the architecture. But neither captures the user's vision for ambiguous areas — layout preferences, interaction patterns, error handling style, content tone. Without this, the agent guesses. With this, the agent builds what the user actually imagined.

The output — `context.md` — feeds directly into Design and Tasks:

- **Design reads it** to know what decisions are locked vs. flexible
- **Tasks reads it** to include specific behaviors in task definitions

### Process

#### 1. Analyze the Feature

Read `.specs/features/[feature]/spec.md` and identify the domain:

| Domain | Gray areas to explore |
| ------------------------------ | ------------------------------------------------------------- |
| Something users **SEE** | Layout, density, interactions, empty states, visual hierarchy |
| Something users **CALL** (API) | Response format, errors, auth, versioning, rate limiting |
| Something users **RUN** (CLI) | Output format, flags, modes, error handling, verbosity |
| Something users **READ** | Structure, tone, depth, flow, navigation |
| Something being **ORGANIZED** | Grouping criteria, naming, duplicates, exceptions |

Generate 3-4 **feature-specific** gray areas. Not generic categories, but concrete decisions for THIS feature.

#### 2. Present Gray Areas

Present the feature boundary (from spec.md) and the gray areas to the user. Let them choose which to discuss. Do NOT include a "skip all" option — the user invoked this phase to discuss.

#### 3. Deep-Dive Each Area

For each selected area:

1. Ask 3-4 concrete questions with specific options (not vague categories)
2. After the questions, check: "More about [area], or move on?"
3. If more → ask 3-4 more, check again
4. After all areas → "Ready to create context?"

**Question design:**

- Options should be concrete ("Card layout" not "Option A")
- Each answer should inform the next question
- Include "You decide" as an option when reasonable — captures agent discretion

#### 4. Scope Guardrail (CRITICAL)

The feature boundary from spec.md is **fixed**. Discussion clarifies HOW to implement, never WHETHER to add new capabilities.

**Allowed:** "How should posts be displayed?" (clarifying ambiguity)
**Not allowed:** "Should we also add comments?" (new capability)

When user suggests scope creep: "That sounds like a separate feature. I'll note it in Deferred Ideas. Back to [current area]."

#### 5. Write context.md

---

## Template: `.specs/features/[feature]/context.md`

```markdown
# [Feature] Context

**Gathered:** [date]
**Spec:** `.specs/features/[feature]/spec.md`
**Status:** Ready for design

---

## Feature Boundary

[Clear statement of what this feature delivers — the scope anchor from spec.md]

---

## Implementation Decisions

### [Area 1 that was discussed]

- [Specific decision made]
- [Another decision if applicable]

### [Area 2 that was discussed]

- [Specific decision made]

### [Area 3 that was discussed]

- [Specific decision made]

### Agent's Discretion

[Areas where user explicitly said "you decide" — agent has flexibility here during design/implementation]

---

## Specific References

[Any "I want it like X" moments, product references, specific behaviors, interaction patterns mentioned during discussion]

[If none: "No specific requirements — open to standard approaches"]

---

## Deferred Ideas

[Ideas that came up during discussion but belong in other features/phases. Captured here so they're not lost, but explicitly out of scope]

[If none: "None — discussion stayed within feature scope"]
```

---

## Tips

- **Decisions, not vision** — "Card-based layout with subtle shadows" is a decision. "Should feel modern" is not.
- **Scope is sacred** — Deferred Ideas captures scope creep without losing ideas
- **User = visionary, Agent = builder** — Ask about how they imagine it, not about technical implementation
- **Don't ask about:** Technical architecture, performance, implementation details — that's Design's job
- **Confirm before Design** — User approves context.md before moving to design phase

---

## Clarify (OPCIONAL)

Revisão e esclarecimento do spec.

**Checklist:**
- [ ] Todos os termos definidos?
- [ ] TODOS os critérios de aceite são testáveis?
- [ ] Out of scope claro?
- [ ] IDs de requisito únicos?

**Corrigir vagueza:**
- Substituir "deve ser rápido" → "SHALL responder em <200ms"
- Substituir "boa UX" → critérios específicos
- Substituir "seguro" → controles específicos

---

## Design (OPCIONAL)

Decisões de design técnicas (API, schema, fluxo).

**Se necessário:**
- Diagrama de fluxo
- API endpoints
- Data model
- Dependencies

**Quando PULAR esta fase:**
- Mudança direta — sem decisões arquiteturais, sem novos padrões
- Feature simples que pode ser implementada inline durante Execute
- Apenas ajustes em código existente sem mudanças estruturais

---

## Output

```
features/
└── [feature]/
    └── spec.md
```

---

## Regras

**NUNCA:**
- quick mode
- auto-sizing
- pular fases obrigatórias

**SEMPRE:**
- autosave em cada transição de fase
- confirmar antes de avançar

**Estrutura:** tudo em `features/`, sem `fixes/`