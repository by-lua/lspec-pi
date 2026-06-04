---
name: lspec-discovery
description: "Descobre e documenta contexto inicial do projeto."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - Responda ONLY com perguntas da fase atual
  - NUNCA pule fases ou despeje todas perguntas de uma vez
  - Ao final de cada fase, CONFIRME com o usuario antes de continuar
  - NUNCA pule pra implementacao, codigo ou edicao durante Discovery

# discovery — Inicializacao de Projeto

**Processo:** Discovery guiado por fases. Uma fase por vez.

---

## Fase 1 — Contexto e Problema

1. Qual e o objetivo do projeto? Descreva em uma frase.
2. Que problema voce esta resolvendo? Quem tem esse problema?
3. Como voce sabe que isso e um problema real? (dados, feedback, instinto?)
4. Qual e a situacao atual/solucao alternativa? O que ha de ruim nisso?
5. O que acontece se voce **nao** construir isso?

> Apos coletar respostas da Fase 1, prossiga para a Fase 2.

---

## Fase 2 — Visao e Escopo

6. Como voce define sucesso? E como voce medira?
7. O que e o MVP? O minimo absoluto necessario para lancar o produto?
8. O que esta explicitamente **fora do escopo** por enquanto?
9. Quem e o usuario-alvo? Descreva-o.
10. Existem requisitos nao funcionais? (desempenho, seguranca, escalabilidade, conformidade)

> Apos coletar respostas da Fase 2, prossiga para a Fase 3.

---

## Fase 3 — Conjunto Tecnico

11. Qual linguagem/framework/plataforma?
12. Existe algum codigo existente que possa ser integrado?
13. Ha alguma restricao? (orcamento, tamanho da equipe, cronograma, hospedagem, APIs)
14. Preferencia por backend / frontend / banco de dados?

> Apos coletar respostas da Fase 3, prossiga para a Fase 4.

---

## Fase 4 — Referencias de Projeto

15. Alguma referencia de design? (captura de tela, HTML, mockup, link do Figma)

Se houver referencias:
- criar `.specs/design-references/` com os arquivos/links organizados;
- gerar `README.md` descrevendo cada referencia;
- extrair padroes visuais (cores, layout, componentes, interacoes).

> Apos coletar respostas da Fase 4, prossiga para a Fase 5.

---

## Fase 5 — Estado da Tecnica e Riscos

16. O que ja foi tentado antes? O que nao funcionou?
17. Qual o maior risco? O que poderia acabar com este projeto?
18. Qual a parte mais dificil — tecnicamente ou de qualquer outra forma?
19. Tem algum prazo? Data fixa ou "quando estiver pronto"?

> Apos coletar respostas da Fase 5, prossiga para a Fase 6.

---

## Fase 6 — Marcos Importantes

20. Como voce dividiria isso em etapas?
21. A primeira coisa que voce quer que funcione?
22. Recurso "uau" para o lancamento?

**Fim da descoberta.**

---

## Output: `.specs/project/PROJECT.md`

```markdown
# [Project Name]

**Vision:** [1-2 sentence description]
**For:** [target users]
**Solves:** [core problem being addressed]

## Goals
- [Primary goal with measurable success metric]
- [Secondary goal with measurable success metric]

## Problem Validation
- Evidence: [data / feedback / market signals / founder insight]
- Current alternative: [how users solve this today]
- Why current alternative fails: [main pain points]
- Cost of not building: [impact if project is not built]

## Success Criteria
- [Metric 1 + target]
- [Metric 2 + target]

## MVP Scope
**v1 includes:**
- [Core capability 1]
- [Core capability 2]
- [Core capability 3]

**Explicitly out of scope:**
- [What is NOT being built]
- [What is NOT being built]

## Target User
- [Persona summary]
- [Main jobs-to-be-done]

## Non-Functional Requirements
- Performance: [if applicable]
- Security: [if applicable]
- Scalability: [if applicable]
- Compliance: [if applicable]

## Tech Stack
**Core:**
- Framework: [name + version]
- Language: [name + version]
- Database: [name]

**Key dependencies:** [3-5 critical libraries/frameworks]

## Constraints
- Timeline: [if applicable]
- Technical: [if applicable]
- Resources: [if applicable]
- Budget/hosting/APIs: [if applicable]

## Risks & Unknowns
- Major risk: [description]
- Hardest part: [description]
- Previous failed attempts: [summary]

## Milestones
- Phase 1: [name]
- Phase 2: [name]
- Phase 3: [name]

## Launch Priorities
- First thing to work: [description]
- "Wow" feature: [description]
```

**Validation Checklist:**
- Visao clara em 1-2 frases
- Problema e evidencia estao explicitos
- Limites de escopo estao explicitos
- Metricas de sucesso sao mensuraveis
- Risco maior e parte mais dificil estao documentadas
- Primeira fatia funcional + recurso uau estao definidos