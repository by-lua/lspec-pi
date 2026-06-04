---
name: lspec-discuss
description: Captura decisões do usuário em áreas ambíguas do design, preenchendo context.md com preferências de layout, interação, erros, etc.
---

# lspec-discuss

Captura **COMO** o usuário imagina a feature quando existem áreas ambíguas. Não é fase separada — é acionado dentro do Specify quando detecta ambiguidade.

## Quando usar

- A spec tem comportamento com múltiplas abordagens válidas
- Layout, densidade, interações, empty states, hierarquia visual
- Formato de resposta de API, erros, auth, rate limiting
- Output de CLI, flags, modos, verbosidade
- Estrutura de conteúdo, tom, navegação

**Não usar quando:** infraestrutura, CRUD, contratos de API claros — quando o "como" é óbvio pelo "o que".

## Como usar

```
/lspec discuss [feature]
```

O sistema identifica as áreas cinzas da feature e pergunta ao usuário.

## Processo

1. **Analisar** spec.md → identificar domínio
2. **Apresentar** áreas cinzas → usuário escolhe quais discutir
3. **Deep-dive** em cada área (3-4 perguntas concretas por área)
4. **Gerar** `context.md` com decisões capturadas

## Estrutura do context.md

```markdown
# [Feature] Context

## Layout & Presentation
- [decisão 1]
- [decisão 2]

## Interaction Patterns
- [decisão 1]

## Error Handling
- [decisão 1]

## [Other gray areas]
```

## Regra de escopo

Discuss clarifica **COMO** implementar, nunca **SE** adiciona capability nova. Feature boundary é fixa.

**Permitido:** "Como posts são exibidos?"
**Não permitido:** "Também adicionamos comentários?"