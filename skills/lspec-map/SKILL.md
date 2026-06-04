---
name: lspec-map
description: "Mapeia codebase existente e documenta estrutura/análise. Gera 7 arquivos de documentação em .specs/codebase/."
---

# map — Mapeamento de Codebase Brownfield

**Aviso CRÍTICO:**
- Responda APENAS com perguntas da fase atual
- NUNCA pule fases ou despeje todas perguntas de uma vez
- CONFIRME antes de continuar para próxima fase

**Pipeline:**
```
Discovery → [Discuss (OPCIONAL)] → Specify → [Clarify (OPCIONAL)] → [Design (OPCIONAL)] → Tasks → Execute
```

**Proibidos:**
- ❌ quick mode
- ❌ auto-sizing
- ❌ estrutura fixes/

**Estrutura:** `features/` apenas — todo mapeamento vai em `features/[name]/`

---

## Referência

**Carregar:** `../lspec/references/brownfield-mapping.md`

Este skill implementa o processo completo de mapeamento brownfield documentado na referência.

---

## AUTO-DETECÇÃO (rode primeiro)

```bash
# Verificar tipo de projeto
if [ -f ".specs/project/PROJECT.md" ]; then
  echo "EXISTING"
elif [ -d ".specs/features" ]; then
  echo "EXISTING"
elif [ -d "$(find . -name '*.py' -o -name '*.js' -o -name '*.ts' 2>/dev/null | head -1)" ]; then
  echo "CODE_ONLY"
else
  echo "NEW"
fi
```

**Matriz de decisões:**

| Contexto | Ação |
|----------|------|
| EXISTING + mapeamento | Map Flow — descubra o projeto |
| CODE_ONLY | Reverse Engineering Flow — documente o que encontrar |
| NEW | Complete Mapping — 7 fases |

---

## Map Flow (curto — projeto existente)

1. Qual área do código quer mapear?
2. Qual o objetivo do mapeamento?
3. Quais outputs são mais relevantes?

→ Gera `features/[name]/codebase/STACK.md`, `ARCHITECTURE.md`, etc.

---

## CODE_ONLY — Reverse Engineering Flow

Quando não há `.specs/` mas existe código:

1. Explorar estrutura de diretórios
2. Identificar stack técnica
3. Mapear arquitetura e padrões
4. Documentar convenções
5. Catalogar integrações

→ Gera `.specs/codebase/STACK.md`, `ARCHITECTURE.md`, `CONVENTIONS.md`, `STRUCTURE.md`, `TESTING.md`, `INTEGRATIONS.md`, `CONCERNS.md`

---

## Complete Mapping — 7 Fases

### Fase 1: Stack e Dependências

1. Onde estão os arquivos de configuração do projeto?
2. Qual package manager é usado?
3. Quais frameworks/main libraries?
4. Existem serviços externos integrados?

**Output:** Gera `features/[name]/codebase/STACK.md`

---

### Fase 2: Arquitetura

1. Como os diretórios estão organizados?
2. Quais padrões arquiteturais observa?
3. Qual o fluxo de dados principal?
4. Como módulos se comunicam?

**Output:** Gera `features/[name]/codebase/ARCHITECTURE.md`

---

### Fase 3: Convenções

1. Quais padrões de nomenclatura usa?
2. Como código é organizado dentro dos arquivos?
3. Como erros são tratados?
4. Há estilo de comentários consistente?

**Output:** Gera `features/[name]/codebase/CONVENTIONS.md`

---

### Fase 4: Estrutura

1. Mapeie o diretório raiz
2. Qual a divisão de módulos/áreas?
3. Onde estão localizadas cada capability?
4. Quais diretórios especiais existem?

**Output:** Gera `features/[name]/codebase/STRUCTURE.md`

---

### Fase 5: Testes

1. Quais frameworks de teste são usados?
2. Como testes estão organizados?
3. Qual o padrão de testes unitários?
4. Existem testes de integração ou E2E?

**Output:** Gera `features/[name]/codebase/TESTING.md`

---

### Fase 6: Integrações

1. Quais serviços externos são usados?
2. Como autenticação funciona?
3. Há webhooks ou background jobs?
4. Quais APIs externas são consumidas?

**Output:** Gera `features/[name]/codebase/INTEGRATIONS.md`

---

### Fase 7: Concerns

1. Identifique tech debt (código complexo, obsoleto)
2. Bugs conhecidos ou áreas frágeis
3. Riscos de segurança
4. Gargalos de performance
5. Lacunas de teste

**Output:** Gera `features/[name]/codebase/CONCERNS.md`

---

## Output Final

```
features/[name]/
├── codebase/
│   ├── STACK.md          # Technology stack e dependências
│   ├── ARCHITECTURE.md   # Padrões arquiteturais e fluxo
│   ├── CONVENTIONS.md    # Convenções de código
│   ├── STRUCTURE.md      # Estrutura de diretórios
│   ├── TESTING.md        # Infraestrutura de testes
│   ├── INTEGRATIONS.md   # Serviços externos
│   └── CONCERNS.md       # Tech debt, riscos, lacunas
└── state.md              # Estado do mapeamento
```

**NUNCA use `fixes/`** — toda documentação vai em `features/`

---

## Autosave de Estado

A cada transição de fase, salvar estado em `features/[name]/state.md`:

```markdown
# [Name] State

**Pipeline:** Discovery → [Discuss] → Specify → [Clarify] → [Design] → Tasks → Execute

**Current Phase:** Map
**Started:** YYYY-MM-DD HH:MM
**Last Updated:** YYYY-MM-DD HH:MM

## Phase Status

| Phase | Status | Timestamp |
|-------|--------|-----------|
| Map | 🔄 In Progress | ... |

## Decisions Made

- [Lista de decisões tomadas]

## Mapped Areas

- [ ] STACK.md
- [ ] ARCHITECTURE.md
- [ ] CONVENTIONS.md
- [ ] STRUCTURE.md
- [ ] TESTING.md
- [ ] INTEGRATIONS.md
- [ ] CONCERNS.md
```

---

## Validation Checklist

- [ ] STACK.md — extraído de dependency manifests reais
- [ ] ARCHITECTURE.md — padrões identificados no código, não assumidos
- [ ] CONVENTIONS.md — exemplos concretos de arquivos
- [ ] STRUCTURE.md — árvore de diretórios limitada a 3 níveis
- [ ] TESTING.md — Coverage Matrix com 5-10 samples
- [ ] INTEGRATIONS.md — autenticação e APIs documentadas
- [ ] CONCERNS.md — apenas findings com evidência

---

## Tips

- **Sample 5-10 arquivos por categoria** — foco em padrões, não exaustivo
- **Evidência concreta** — referências a arquivos reais, não suposições
- **NUNCA auto-sizing** — documentar completamente, sem atalhos
- **Consistência > Exaustão** — padrões uniformes mais valiosos que cobertura total
