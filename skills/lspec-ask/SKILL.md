---
name: lspec-ask
description: Explica, resume ou navega código existente sem planejar ou implementar — leitura pura, sem mudança.
---

# lspec-ask

Lê, explica ou resume código existente **sem planejar ou implementar**. É leitura pura.

## Quando usar

- Explicar arquivo ou função específica
- Resumir módulo ou diretório
- Rastrear como dados fluem pelo código
- Sugerir melhorias ou apontar problemas
- Responder perguntas sobre o codebase

## Quando NÃO usar

- Quer planejar ou construir feature → use `/lspec specify`
- Quer corrigir bug → Discovery detecta como bug flow
- Quer fazer reverse engineering completo → use `/lspec reverse`

## Como usar

```
/lspec ask [pergunta]
/lspec ask como funciona auth?
/lspec ask me explica o fluxo de pagamento
```

## Capabilities

- Explicar arquivos, funções, módulos
- Rastrear fluxo de dados
- Identificar padrões e convenções
- Apontar problemas de código
- Sugerir melhorias

## Integração PI

Se `pi-cymbal` estiver instalado, usa para navegação nativa de código (references, go-to-definition, impact analysis).

Se `pi-lsp-tools` estiver instalado, adiciona precisão LSP para implementações técnicas.

Fallback: ferramentas nativas de análise de código.