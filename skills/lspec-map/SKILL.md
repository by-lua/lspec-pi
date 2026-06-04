---
name: lspec-map
description: Mapeia projeto existente (brownfield) gerando 7 documentos em .specs/codebase/ — stack, arquitetura, convenções, estrutura, testes, integrações, concerns.
---

# lspec-map

Entende estrutura de projeto existente antes de adicionar features. Gera documentação completa do codebase.

## Quando usar

Projeto com código já existente → mapear antes de qualquer work.

**Não usar** em projeto novo (vazio, sem código).

## Como usar

```
/lspec map
```

## Processo

1. **Explorar** estrutura de diretórios sistematicamente
2. **Identificar** stack tecnológico pelos manifestos de dependência
3. **Extrair** padrões de amostras representativas de código
4. **Documentar** convenções e arquiteturas observadas
5. **Catalogar** integrações externas
6. **Identificar** concerns: tech debt, bugs conhecidos, riscos de segurança, gargalos de performance, áreas frágeis

**Profundidade:** amostrar 5-10 arquivos por categoria. Foco em consistência e padrões, não cobertura exaustiva. Extrair exemplos reais, não suposições.

## Output: 7 arquivos em .specs/codebase/

1. **STACK.md** — tecnologias e dependências (~2k tokens)
2. **ARCHITECTURE.md** — visão geral da arquitetura
3. **CONVENTIONS.md** — padrões de código observados
4. **STRUCTURE.md** — organização de diretórios
5. **TESTING.md** — estratégia de testes
6. **INTEGRATIONS.md** — integrações externas
7. **CONCERNS.md** — tech debt, bugs, riscos, áreas frágeis

## Integração PI

Se `pi-cymbal` estiver instalado, usa para navegação nativa de código durante a análise.

Se `pi-lsp-tools` estiver instalado, adiciona precisão LSP para análise de dependências.

Fallback: ferramentas nativas de análise de código.