---
name: lspec-discuss
description: "Discussão colaborativa para explorar áreas cinzentas, trade-offs e ambiguidades antes de especificar."
---

# discuss

Fase de discussão colaborativa para explorar problemas complexos, trade-offs de design ou ambiguidades. Ativada **apenas quando há incerteza** que requer deliberação antes de Specification.

## Quando Ativar

- Decisões de design com múltiplas abordagens válidas
- Trade-offs entre simplicidade, performance, manutenibilidade
- Requisitos vagos ou conflitantes
- Necessidade de alinhar expectativas entre stakeholders
- Ambiguidades que podem afetar o escopo

**NÃO usar quando:** o caminho está claro e não há ambiguidade real.

## Pipeline Completo

```
Discovery → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute
                         ↑
                         └── OPCIONAL — só quando necessário
```

### Fases Obrigatórias
- **Discovery**: Sempre. Define o contexto e problema.
- **Specify**: Sempre. Produz a especificação formal.
- **Tasks**: Sempre. Gera itens executáveis.
- **Execute**: Sempre. Realiza o trabalho.

### Fases Opcionais
- **Discuss**: Apenas quando há áreas cinzentas, trade-offs não resolvidos ou ambiguidade.
- **Clarify**: Apenas quando a especificação precisa de refinamento após discussão.
- **Design**: Apenas quando decisões arquiteturais requerem documentação explícita.

## Workflow

### 1. Autosave de Estado

A cada transição de fase, salvar estado em `features/[name]/{phase}-state.md`:

```markdown
# {phase} — {timestamp}

## Contexto
Descrição do estado atual.

## Decisões Tomadas
- ...

## Artefatos Gerados
- ...

## Próximo Passo
Proxima fase ou ação.
```

### 2. Content-Type: discuss.md

Toda discussão produz `features/[name]/discuss.md`:

```markdown
# Discuss — {feature_name}

## Contexto
Problema ou decisão a ser deliberada.

## Opções Consideradas
### Opção A: ...
- Prós: ...
- Contras: ...

### Opção B: ...
- Prós: ...
- Contras: ...

## Trade-offs Identificados
- ...

## Decisão Final
Recomendação com justificativa.

## Riscos e Mitigações
- ...
```

### 3. Critérios para Ativar Discuss

Responder: "Podemos especificar isso claramente?"

| Resposta | Ação |
|----------|------|
| Sim, sem ambiguidade | Pular Discuss, ir direto para Specify |
| Sim, mas múltiplas abordagens | Ativar Discuss |
| Não, contexto insuficiente | Voltar para Discovery |

### 4. Transição para Specify

Discuss conclude com:
- Decisão documentada em `discuss.md`
- Estado salvo em `discuss-state.md`
- Critérios claros para Specification
- Forward-port de artefatos de Discovery relevantes

## Estrutura de Diretórios

```
features/[name]/
├── discovery-state.md    # Estado final do Discovery
├── discuss-state.md      # Estado após Discuss (se aplicável)
├── discuss.md            # Conteúdo da discussão
├── specify-state.md      # Estado após Specify
├── clarify-state.md      # Estado após Clarify (se aplicável)
├── design-state.md       # Estado após Design (se aplicável)
├── tasks-state.md        # Estado após Tasks
├── SPEC.md               # Especificação formal
└── tasks.md              # Lista de tarefas
```

## Regras

- **NUNCA**: quick mode, auto-sizing, pular fases obrigatórias
- **SEMPRE**: autosave em cada transição de fase
- **Content-type**: discuss.md em features/[name]/ para discussões
- **Estrutura**: tudo em features/, sem fixes/

## Discuss Gray Areas

**Goal:** Capture HOW the user envisions the feature when the spec has ambiguous areas. This is NOT a separate phase — it's triggered within Specify when the agent detects gray areas that need user input.

**Trigger:** Automatically when gray areas are detected during spec creation, or explicitly via "discuss feature", "how should this work?", "capture context"

**When to trigger (auto-detect):** The spec contains user-facing behavior that could go multiple ways AND the user hasn't expressed a preference. If the spec is clear and unambiguous, skip this entirely.

**When NOT to trigger:** Infrastructure work, CRUD operations, well-defined API contracts, anything where the "how" is obvious from the "what".

## Why This Phase Exists

Specifications capture WHAT to build. Design captures the architecture. But neither captures the user's vision for ambiguous areas — layout preferences, interaction patterns, error handling style, content tone. Without this, the agent guesses. With this, the agent builds what the user actually imagined.

The output — `context.md` — feeds directly into Design and Tasks:

- **Design reads it** to know what decisions are locked vs. flexible
- **Tasks reads it** to include specific behaviors in task definitions

## Process

### 1. Analyze the Feature

Read `.specs/features/[feature]/spec.md` and identify the domain:

| Domain                         | Gray areas to explore                                         |
| ------------------------------ | ------------------------------------------------------------- |
| Something users **SEE**        | Layout, density, interactions, empty states, visual hierarchy |
| Something users **CALL** (API) | Response format, errors, auth, versioning, rate limiting      |
| Something users **RUN** (CLI)  | Output format, flags, modes, error handling, verbosity        |
| Something users **READ**       | Structure, tone, depth, flow, navigation                      |
| Something being **ORGANIZED**  | Grouping criteria, naming, duplicates, exceptions             |

Generate 3-4 **feature-specific** gray areas. Not generic categories, but concrete decisions for THIS feature.

### 2. Present Gray Areas

Present the feature boundary (from spec.md) and the gray areas to the user. Let them choose which to discuss. Do NOT include a "skip all" option — the user invoked this phase to discuss.

### 3. Deep-Dive Each Area

For each selected area:

1. Ask 3-4 concrete questions with specific options (not vague categories)
2. After the questions, check: "More about [area], or move on?"
3. If more → ask 3-4 more, check again
4. After all areas → "Ready to create context?"

**Question design:**

- Options should be concrete ("Card layout" not "Option A")
- Each answer should inform the next question
- Include "You decide" as an option when reasonable — captures agent discretion

### 4. Scope Guardrail (CRITICAL)

The feature boundary from spec.md is **fixed**. Discussion clarifies HOW to implement, never WHETHER to add new capabilities.

**Allowed:** "How should posts be displayed?" (clarifying ambiguity)
**Not allowed:** "Should we also add comments?" (new capability)

When user suggests scope creep: "That sounds like a separate feature. I'll note it in Deferred Ideas. Back to [current area]."

### 5. Write context.md

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