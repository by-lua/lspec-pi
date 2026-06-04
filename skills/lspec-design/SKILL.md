---
name: lspec-design
description: Define a arquitetura e componentes da feature — como vai funcionar internamente, o que reutilizar, como as peças se conectam.
---

# lspec-design

Define **COMO** construir a feature. Arquitetura, componentes, o que reutilizar.

## Quando usar (ou pular)

**Pular design** quando: mudança simples, sem decisão arquitetural, sem padrão novo, sem interação de componentes.

**Fazer design** quando: nova arquitetura, integração complexa, decisão não-trivial, componente novo.

## Como usar

```
/lspec design [feature]
```

## Processo

1. **Carregar** spec.md + context.md (se existir)
2. **Pesquisar** tecnologias não familiares (seguir cadeia de verificação)
3. **Definir arquitetura** — overview + diagramas mermaid se útil
4. **Identificar reutilização** — código existente que economiza tempo
5. **Definir componentes** — propósito, localização, interfaces, deps
6. **Definir modelos de dados** (se aplicável)

## Cadeia de Verificação de Conhecimento

```
Código existente → Docs do projeto → Context7 MCP → Web search → Flag como incerto
```

⚠️ **NUNCA assuma ou invente.** Se não encontrar resposta, diga "não sei" explicitamente.

## Estrutura do design.md

```markdown
# [Feature] Design

**Spec**: .specs/[feature]/spec.md
**Status**: Rascunho | Aprovado

---

## Arquitetura

[Como componentes interagem]

## Componentes

### [Nome]
- Propósito: ...
- Localização: ...
- Interfaces: ...
- Dependências: ...
- Reutiliza: ...

## Modelos de Dados

[Se aplicável]

## Decisões Técnicas

[Apenas não-óbvias, com rationale]
```

## Output

`.specs/features/[feature]/design.md`