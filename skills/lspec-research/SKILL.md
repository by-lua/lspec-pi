---
name: lspec-research
description: "Pesquisa obrigatória do codebase antes de Specify. Analisa código existente, integrações e patterns. OBRIGATÓRIO — não pode ser pulado."
metadata:
  version: 1.0.0
  pipeline: Discovery → Research → Specify → Design → Tasks → Execute
  artifact: features/[name]/research.md
  tools: cymbal_*, mcp_agent_lsp_*
warning: |
  ⚠️ REGRAS ABSOLUTAS:
  - Research É OBRIGATÓRIO — nunca pule esta fase
  - NUNCA use quick mode ou auto-sizing
  - Output vai para `features/[name]/research.md`
  - Autosave de estado em cada transição de fase
  - Specify NÃO pode rodar sem research.md

# Research — Análise do Codebase

**Goal:** Entender como o codebase funciona ANTES de especificar requisitos.

**Pipeline completo:**
```
Discovery → Research → Specify → [Clarify?] → [Design?] → Tasks → Execute
```

**Research é OBRIGATÓRIO.** Specify não começa sem pesquisa aprovada.

---

## ⚠️ ARTIFACT ENFORCEMENT — Research precisa de contexto

**"The artifact one writes is the next one's input."**

Specify **NÃO PODE rodar** se o artifact de Research não existir.

```
╔══════════════════════════════════════════════════════════════════════╗
║  GATE: ARTIFACT CHECK — antes de iniciar Specify                   ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  Specify depende de: features/[name]/research.md (de Research)     ║
║                                                                      ║
║  □  research.md existe em features/[name]/                         ║
║  □  research.md foi lido e compreendido                             ║
║  □  Findings respondem às questões de pesquisa                      ║
║                                                                      ║
╠══════════════════════════════════════════════════════════════════════╣
║  ⚠️  Se research.md NÃO EXISTE → BLOQUEIA.                           ║
║  ⚠️  Mensagem: "Specify requer research.md. Execute /lspec research." ║
╚══════════════════════════════════════════════════════════════════════╝
```

---

## Por que Research é obrigatório?

| SEM Research | COM Research |
|--------------|--------------|
| "Invventa" soluções que não existem | Vê como código similar foi feito |
| Spec pede algo impossível no codebase | Spec sabe o que é possível |
| Ignora patterns e convenções | Respeita arquitetura existente |
| Código conflita com código antigo | Integra corretamente |

**Exemplo do problema que resolve:**

```
Usuário: "Quero adicionar autenticação JWT"

SEM RESEARCH:
→ Escreve spec inventando como JWT funciona
→ Implementa código que não existe no codebase
→ Não sabe que já tem auth implementado

COM RESEARCH:
→ Descobre que já existe auth module
→ Encontra o pattern usado (OAuth2, não JWT)
→ Spec sabe que é extensão de auth existente
→ Design sabe onde integrar
```

---

## Processo — 4 Etapas

### Etapa 1: Codebase Questions

Formule questões sobre o codebase relacionadas à feature:

**Questões obrigatórias:**

1. **Feature existente?**
   - Onde está implementada?
   - Quais arquivos?

2. **Integrações**
   - Quem chama essa função?
   - Quem é chamado por ela?
   - Pontos de entrada/saída?

3. **Patterns**
   - Como código similar foi implementado?
   - Quais convenções o repo usa?

4. **Restrições**
   - O que existe que NÃO pode ser mudado?
   - Quais arquivos são críticos?

5. **Arquitetura**
   - Como o sistema é estruturado?
   - Quais módulos existem?

### Etapa 2: Análise Paralela

Use ferramentas de navegação para coletar informações:

**Para encontrar arquivos:**
```bash
cymbal_ls <dir>
cymbal_grep <pattern>
cymbal_read <file>
```

**Para entender estrutura:**
```bash
cymbal_find_def <symbol>
cymbal_find_refs <symbol>
cymbal_list_symbols <file>
```

**Para mapear dependências:**
- Quem importa/exporta o módulo?
- Quais serviços são chamados?
- Quais banco de dados são usados?

### Etapa 3: Síntese de Findings

Documente os achados em `features/[name]/research.md`:

```markdown
# Research — <feature-name>

## Questões Respondidas

### Q1: Feature existente?
**Encontrado:** [sim/não]
**Onde:** [arquivos, linhas]
**Resumo:** [descrição]

### Q2: Integrações
**Chamadores:** [file:line]
**Chamados:** [file:line]
**Entrada/Saída:** [descrição]

### Q3: Patterns
**Pattern encontrado:** [nome]
**Exemplo:** [file:line]
**Como adaptar:** [descrição]

### Q4: Restrições
**Não pode mudar:** [lista]
**Arquivos críticos:** [lista]

### Q5: Arquitetura
**Estrutura:** [descrição]
**Módulos relacionados:** [lista]

## Findings para Specify

1. [Finding 1]
2. [Finding 2]
3. [Finding 3]

## Contexto para Design

- [Nota de arquitetura]
- [Nota de integração]
- [Nota de constraint]
```

### Etapa 4: Verificação

Antes de finalizar, verifique:

- [ ] Todas as 5 questões foram respondidas
- [ ] Findings têm citations (file:line)
- [ ] Research.md foi salvo em `features/[name]/`
- [ ] Próxima fase (Specify) recebeu contexto

---

## AUTOSAVE — Obrigatório após Research

Salvar em `features/[name]/STATE.md`:

```markdown
## Research Completo

- Data: [YYYY-MM-DD]
- Findings: [número]
- Citations: [número de file:line]

## Pendências
- [ ] Specify
- [ ] Design
- [ ] Tasks
- [ ] Execute

## Notas
- [Nota importante para próxima fase]
```

---

## ⚠️ PROIBIDOS

- ❌ NÃO pule Research
- ❌ NÃO especifique sem analisar codebase
- ❌ NÃO "invente" soluções sem verificar se existem
- ❌ NÃO ignore patterns existentes
- ❌ NÃOprossiga se houver dúvidas sobre o código

---

## Exemplo de Research

**Feature:** Adicionar busca de produtos por categoria

```markdown
# Research — busca-categoria

## Questões Respondidas

### Q1: Feature existente?
**Encontrado:** Parcialmente
**Onde:** `services/produto.py:45-67`
**Resumo:** Existe busca por nome, mas não por categoria

### Q2: Integrações
**Chamadores:** `handlers/busca.py:12` → `produto.buscar()`
**Chamados:** `services/produto.py` → `db.query()`
**Entrada/Saída:** string → lista de produtos

### Q3: Patterns
**Pattern encontrado:** Repository pattern
**Exemplo:** `models/produto.py` usa `find_by_*` methods
**Como adaptar:** Criar `find_by_categoria` similar a `find_by_nome`

### Q4: Restrições
**Não pode mudar:** `models/produto.py` (schema)
**Arquivos críticos:** `db/connection.py` (pool de conexões)

### Q5: Arquitetura
**Estrutura:** Handler → Service → Model → DB
**Módulos relacionados:** produto, categoria, busca

## Findings para Specify

1. Buscar por categoria é extensão de buscar existente
2. Pattern repository já definido em models/produto.py
3. Campo `categoria_id` existe na tabela produtos

## Contexto para Design

- Criar método `find_by_categoria(categoria_id)` no service
- Reusar estrutura de `find_by_nome`
- Adicionar índice em `categoria_id` se não existir
```

---

## GATE: STATE SAVED — antes de avançar

```
╔══════════════════════════════════════════════════════════════════════╗
║  GATE: STATE SAVED                                                   ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  □  research.md existe em features/[name]/                           ║
║  □  STATE.md atualizado                                              ║
║  □  Findings respondem às 5 questões                                 ║
║  □  Citations (file:line) presentes                                  ║
║                                                                      ║
║  → PRÓXIMO: /lspec specify                                           ║
╚══════════════════════════════════════════════════════════════════════╝
```