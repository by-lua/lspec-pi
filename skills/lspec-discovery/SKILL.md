---
name: lspec-discovery
description: Inicializa projeto novo via Q&A iterativo ou mapeia projeto existente — ponto de partida obrigatório para todo trabalho.
---

# lspec-discovery

Captura contexto completo do projeto via perguntas iterativas. Ponto de partida obrigatório.

## Projeto NOVO (sem código existente)

```
/lspec discovery
```

Captura via Q&A (máx 3-5 perguntas por vez):

1. O que você está construindo?
2. Para quem é e qual problema resolve?
3. Qual stack tecnológico? (se已知)
4. O que está no scope da v1? O que está fora?
5. Restrições críticas? (timeline, técnica, recursos)

**Parar quando:** visão, metas e limites estiverem claros.

### Após discovery — próximo passo

```
/lspec specify [feature]   # definir requisitos da primeira feature
/lspec roadmap             # criar roadmap de features
```

## Projeto EXISTENTE (brownfield)

Se o projeto já tem código mas não tem `.specs/`:

```
/lspec map         # mapear codebase primeiro
/lspec discovery   # discovery reducido após map
```

Se já tem `.specs/`:

```
/lspec discovery   # discovery adaptado ao contexto existente
```

## Output

`.specs/project/PROJECT.md` com:

- **Vision:** 1-2 frases
- **For:** usuários alvo
- **Solves:** problema core
- **Goals:** metas com métricas
- **Tech Stack:** framework, linguagem, banco, deps-chave
- **Scope v1:** capabilities inclusas e excluídas
- **Constraints:** timeline, recursos

## também gera

`.specs/project/STATE.md` — memória persistente (decisões, blockers, aprendizados)