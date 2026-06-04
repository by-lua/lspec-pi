---
name: lspec-specify
description: "Cria/evolui especificacao da feature (SPEC.md)."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - Pergunte primeiro, COLLECT informacao antes de escrever spec
  - NUNCA pule pra codigo ou implementacao durante Specify
  - Ao final, mostre o spec e aguarde APROVACAO do usuario antes de continuar

# specify — Especificacao de Feature

**Goal:** Capturar O QUE construir com requisitos testaveis e rastreaveis.

---

## 1. Coletar Requisitos

Seja parceiro de pensamento, nao entrevistador. Comece aberto — deixe o usuario despejar seu modelo mental. Siga a energia: o que ele enfatizar, aprofunde.

Pergunte de forma conversacional:

- "Qual problema voce esta resolvendo?"
- "Quem e o usuario e qual e a dor?"
- "Como seria o sucesso?"

Se necessario:

- "Quais sao as restricoes (tempo, tech, recursos)?"
- "O que esta explicitamente fora do escopo?"

**Desafie vagueza.** Nunca aceite respostas fuzzy. "Bom" significa o que? "Usuarios" sao quem? "Simples" significa como? Torne o abstrato concreto: "Me walk through usando isso." "O que isso realmente parece?"

**Saiba quando parar.** Quando voce entender o que estao construindo, porque, para quem, e como sera o done — proponha prosseguir.

---

## 2. Capturar User Stories com Prioridades

**P1 = MVP** (deve lancar), **P2** (deveria ter), **P3** (nice to have)

Cada story DEVE ser **independente testavel** — voce pode implementar e demonstrar apenas aquela story.

---

## 3. Escrever Criterios de Aceitacao

Use formato **QUANDO/ENTAO/SHALL** — e preciso e testavel:

- QUANDO [evento/acao] ENTAO [sistema] SHALL [resposta/comportamento]

---

## Template: `.specs/[feature]/spec.md`

```markdown
# [Feature Name] Specification

## Problem Statement

[Describe the problem in 2-3 sentences. What pain point are we solving? Why now?]

## Goals

- [ ] [Primary goal with measurable outcome]
- [ ] [Secondary goal with measurable outcome]

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature     | Reason         |
| ----------- | -------------- |
| [Feature X] | [Why excluded] |
| [Feature Y] | [Why excluded] |

---

## User Stories

### P1: [Story Title] ⭐ MVP

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P1**: [Why this is critical for MVP]

**Acceptance Criteria**:

1. WHEN [user action/event] THEN system SHALL [expected behavior]
2. WHEN [user action/event] THEN system SHALL [expected behavior]
3. WHEN [edge case] THEN system SHALL [graceful handling]

**Independent Test**: [How to verify this story works alone]

---

### P2: [Story Title]

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P2**: [Why this isn't MVP but important]

**Acceptance Criteria**:

1. WHEN [event] THEN system SHALL [behavior]
2. WHEN [event] THEN system SHALL [behavior]

**Independent Test**: [How to verify]

---

### P3: [Story Title]

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P3**: [Why this is nice-to-have]

**Acceptance Criteria**:

1. WHEN [event] THEN system SHALL [behavior]

---

## Edge Cases

- WHEN [boundary condition] THEN system SHALL [behavior]
- WHEN [error scenario] THEN system SHALL [graceful handling]
- WHEN [unexpected input] THEN system SHALL [validation response]

---

## Requirement Traceability

Each requirement gets a unique ID for tracking.

| Requirement ID | Story       | Phase  | Status  |
| -------------- | ----------- | ------ | ------- |
| [FEAT]-01      | P1: [Story] | Design | Pending |
| [FEAT]-02      | P1: [Story] | Design | Pending |
| [FEAT]-03      | P2: [Story] | -      | Pending |

**Status values:** Pending → In Design → In Tasks → Implementing → Verified

---

## Success Criteria

How we know the feature is successful:

- [ ] [Measurable outcome]
- [ ] [Measurable outcome]
```

---

## Tips

- **P1 = Vertical Slice** — A complete, demo-able feature, not just backend or frontend
- **QUANDO/ENTAO e codigo** — Se voce nao consegue escrever como teste, reescreva
- **IDs de requisito sao obrigatorios** — Toda story mapeia pra IDs rastreaveis
- **Edge cases importam** — O que quebra? O que esta vazio? O que e enorme?
- **Out of Scope previne creep** — Se nao esta aqui, nao e construido
- **Confirme antes de avancar** — Usuario deve aprovar spec antes de mover para proxima fase