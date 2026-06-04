---
name: lspec-specify
description: Define os requisitos testáveis da feature em formato WHEN/THEN/SHALL, gerando spec.md com rastreabilidade.
---

# lspec-specify

Define **O QUE** construir. Requisitos testáveis e rastreáveis.

## Como usar

```
/lspec specify [feature]
```

## Processo

### 1. Clarificar Requisitos

Conversa aberta — deixe o usuário despejar o modelo mental. Pergunte:

- "Qual problema resolve?"
- "Quem é o usuário e qual a dor?"
- "Como é o sucesso?"

Desafie vaguidade: "bom" significa o quê? "simples" significa como?

### 2. Capturar User Stories com Prioridade

- **P1 = MVP** (precisa shipar)
- **P2** (deveria ter)
- **P3** (seria legal)

Cada story deve ser **independentemente testável**.

### 3. Escrever Critérios de Aceitação

Formato **QUANDO/ENTÃO/SHALL**:

```
QUANDO [evento/ação] ENTÃO [sistema] SHALL [resposta/comportamento]
```

### 4. Documentar Edge Cases

O que quebra? O que é vazio? O que é gigante?

### 5. Atribuir IDs de Requisito

`FEAT-01`, `FEAT-02`...

### 6. Definir Out of Scope

O que está explicitamente fora.

## Estrutura do spec.md

```markdown
# [Feature] Specification

## Problem Statement

[Problema em 2-3 frases]

## Goals

- [ ] [Meta primária com métrica mensurável]
- [ ] [Meta secundária com métrica mensurável]

## User Stories

### P1: [Título]
**Como:** [persona]
**Quero:** [ação]
**Para:** [benefício]

**Critérios de Aceitação:**
1. QUANDO [X] ENTÃO [Y] SHALL [Z] → [ ]
2. ...

### P2: [Título]
...

## Edge Cases

- [Caso 1]
- [Caso 2]

## Out of Scope

- [Item 1]
- [Item 2]
```

## Output

`.specs/features/[feature]/spec.md`

## Se existir área cinza

Dispara `/lspec discuss` automaticamente antes de finalizar.