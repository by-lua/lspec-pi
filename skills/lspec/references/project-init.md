# Project Initialization

**Trigger:** "Initialize project", "Setup project", "Start new project"

## Process (Discovery guiado por fases)

**CRUCIAL:** Pergunte **fase por fase**, nunca tudo de uma vez.

- Apresente **uma fase por vez**.
- Faça todas as perguntas da fase atual.
- Colete as respostas da fase.
- Só então avance para a próxima fase.
- **Nunca** despejar todas as perguntas de uma vez.

### Fase 1 — Contexto e Problema (perguntas 1 a 5)

1. Qual é o objetivo do projeto? Descreva em uma frase.
2. Que problema você está resolvendo? Quem tem esse problema?
3. Como você sabe que isso é um problema real? (dados, feedback, instinto?)
4. Qual é a situação atual/solução alternativa? O que há de ruim nisso?
5. O que acontece se você **não** construir isso?

> Depois de coletar as respostas da Fase 1, prossiga para a Fase 2.

### Fase 2 — Visão e Escopo (perguntas 6 a 10)

6. Como você define sucesso? E como você o medirá?
7. O que é o MVP? O mínimo absoluto necessário para lançar o produto?
8. O que está explicitamente **fora do escopo** por enquanto?
9. Quem é o usuário-alvo? Descreva-o.
10. Existem requisitos não funcionais? (desempenho, segurança, escalabilidade, conformidade)

> Depois de coletar as respostas da Fase 2, prossiga para a Fase 3.

### Fase 3 — Conjunto Técnico (perguntas 11 a 14)

11. Qual linguagem/framework/plataforma?
12. Existe algum código existente que possa ser integrado?
13. Há alguma restrição? (orçamento, tamanho da equipe, cronograma, hospedagem, APIs)
14. Preferência por backend / frontend / banco de dados?

> Depois de coletar as respostas da Fase 3, prossiga para a Fase 4.

### Fase 4 — Referências de Projeto (pergunta 15)

15. Alguma referência de design? (captura de tela, HTML, mockup, link do Figma)

Se houver referências:
- criar `.specs/design-references/` com os arquivos/links organizados;
- gerar `README.md` descrevendo cada referência;
- extrair padrões visuais (cores, layout, componentes, interações).

> Depois de coletar as respostas da Fase 4, prossiga para a Fase 5.

### Fase 5 — Estado da Técnica e Riscos (perguntas 16 a 19)

16. O que já foi tentado antes? O que não funcionou?
17. Qual o maior risco? O que poderia acabar com este projeto?
18. Qual a parte mais difícil — tecnicamente ou de qualquer outra forma?
19. Tem algum prazo? Data fixa ou "quando estiver pronto"?

> Depois de coletar as respostas da Fase 5, prossiga para a Fase 6.

### Fase 6 — Marcos Importantes (perguntas 20 a 22)

20. Como você dividiria isso em etapas?
21. A primeira coisa que você quer que funcione?
22. Recurso "uau" para o lançamento?

**Fim da descoberta.**

## Output: `.specs/project/PROJECT.md`

**Structure:**

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

- Vision clear in 1-2 sentences
- Problem and evidence are explicit
- Scope boundaries are explicit
- Success metrics are measurable
- Major risk and hardest part are documented
- First working slice + wow feature are defined
