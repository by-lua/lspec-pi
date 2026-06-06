# L-Spec PI

**SDD (Spec-Driven Development) para PI.dev** — projetos novos E existentes.

Não sabe por onde começar? O L-Spec mapeia o código existente, constrói a documentação e só então implementa. Tudo começa com spec, nunca com código.

> **Spec-Driven Development** — nunca edite sem spec. O pipeline sequencial com gates bloqueantes verifica spec, contexto, blast radius e estado **antes** de qualquer mudança. Funciona em **projetos novos** (forward) e **código existente** (map). Research obrigatório — o agente pergunta, nunca inventa. Nada pula fase.

## Instalação, Atualizar, Desinstalar

```bash
# Instalar
pi install npm:@by-lua/lspec-pi

# Atualizar
pi update npm:@by-lua/lspec-pi

# Desinstalar
pi uninstall npm:@by-lua/lspec-pi
```

> Alternativa (Git): `curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash`

## Subagentes

[`by-lua/lspec-subagents`](https://github.com/by-lua/lspec-subagents) — **9 agentes especializados** para o fluxo L-Spec (orchestrator, explorer, fixer, oracle, designer, librarian, observer, council, councillor). Cada um com modelo otimizado (Claude Opus, Sonnet, GPT-4o-mini). Executam em paralelo via CodeX, Gemini ou qualquer provedor. Usa as mesmas tools nativas do L-Spec PI (cymbal_\*, lsp_\*). Ideais para research profundo, debugging paralelo, code review sênior, ou análise visual de imagens/PDFs.

### Dependências Opcionais (Recomendadas)

| Ferramenta | Uso | Agentes |
|---|---|---|
| `pi install npm:pi-cymbal` | Code navigation | explorer, oracle, fixer, orchestrator |
| `pi install npm:@davehardy20/pi-lsp-tools` | LSP-powered code tools | explorer, fixer, oracle |
| `pi install npm:pi-mermaid` | Mermaid diagrams | orchestrator, designer |

Cada agente usa as ferramentas disponíveis com fallback para grep/read se o pacote não estiver instalado.

## Modo de Uso

Basta dizer o que você quer:

```
/lspec preciso criar o módulo de auth
/lspec tem um bug no login que não valida o token
/lspec adicionar validação de email no form de cadastro
/lspec refatorar o service de payments
```

O L-Spec detecta automaticamente o contexto:

- **Código existente, sem spec** → Map: mapeia o código, entende a estrutura, cria a spec e te ajuda a prosseguir. Use `/lspec map` para acionar.
- **Código existente, com spec** → executa o fluxo normal: verifica estado, propõe mudanças, aplica com gates
- **Projeto novo** → Discovery abrangente: faz perguntas estratégicas para descobrir features, define escopo e estrutura

Não precisa configurar nada. Não precisa criar arquivos antes. Só falar o que quer ou o que está bugado — o fluxo se ajusta sozinho.


---


## O que é SDD?

SDD é desenvolver por especificação primeiro e código depois.
No L-Spec PI isso significa: discovery adaptativo, requisitos claros, tarefas atômicas e execução verificável.

## Por que SDD existe (e o que você perde sem ele)?

A maioria das sessões com IA perde 40–60% dos tokens com retrabalho: ambiguidade, reescrita e "achei que era isso".
O SDD reduz esse desperdício definindo o que será feito **antes** da implementação.

### Sem SDD você perde

- Clareza de escopo (o projeto vai crescendo no improviso)
- Rastreabilidade (fica difícil provar o que foi validado)
- Continuidade entre sessões (cada conversa recomeça do zero)
- Qualidade de entrega (mais bug, mais retrabalho, commits confusos)

### Com L-Spec PI você ganha

- Discovery adaptativo + requisitos claros antes de codar
- Execução por tarefas atômicas e verificáveis
- Menos reescrita, menos bugs e commits mais limpos
- **Contexto vivendo no projeto (`.specs/`) e não só na memória do agente**

> No L-Spec PI, o conhecimento do projeto fica versionado no repositório.  
> Qualquer agente pode continuar de onde parou, sem depender da memória de uma sessão específica.

---

## Fluxo Completo com Gates

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                        L-SPEC PI PIPELINE COM GATES                           │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐    │
│  │DISCOVERY │───▶│ RESEARCH │───▶│ SPECIFY  │───▶│ TASKS   │───▶│ EXECUTE  │    │
│  └──────────┘    └──────────┘    └──────────┘    └──────────┘    └──────────┘    │
│       │              │              │                           │              │
│       ▼              ▼              ▼                           ▼              │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐              ┌──────────┐ │
│  │ DISCUSS* │    │ DISCUSS* │    │ CLARIFY* │              │  GATE    │         │
│  └──────────┘    └──────────┘    └──────────┘ │ CHECK │         │
│ │              │              │                      └──────────┘         │
│       ▼              ▼              ▼                           │ │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐                  ▼              │
│  │  STATE │    │  STATE   │    │  STATE   │              ┌──────────┐       │
│  │ GATE    │    │  GATE    │    │  GATE    │              │  COMMIT  │       │
│  └──────────┘    └──────────┘    └──────────┘              └──────────┘       │
│                                                                                 │
│  (*) OPCIONAL — só se área cinzenta/ambígua ou necessidade arquitetural        │
└─────────────────────────────────────────────────────────────────────────────────┘
```

### Tabela de Fases

```
┌────────────┬──────────────────────────────────────────────────────────┐
│ FASE       │ QUANDO RODA                                             │
├────────────┼──────────────────────────────────────────────────────────┤
│ Discovery  │ SEMPRE                                                  │
│ Research   │ SEMPRE (OBRIGATÓRIO antes de Specify)                   │
│ Discuss*   │ OPCIONAL — só se área cinzenta/ambígua                  │
│ Specify │ SEMPRE (OBRIGATÓRIO)                                    │
│ Clarify*   │ OPCIONAL — só se ambiguidade nos requisitos             │
│ Design*    │ OPCIONAL — só se necessidade arquitetural              │
│ Tasks      │ SEMPRE                                                  │
│ Execute    │ SEMPRE                                                  │
└────────────┴──────────────────────────────────────────────────────────┘
```

### Auto-detecção

- `BUG` → Discovery curto (3 perguntas) → Research → Tasks → Execute
- `FEATURE` → Discovery focado → Research → Specify → Tasks → Execute
- `NOVO` → 6 fases completas + Research

---

Não sabe por onde começar? O L-Spec mapeia o código existente, constrói a documentação e só então implementa. Tudo começa com spec, nunca com código.
## Como Funciona

```
Você: /lspec [request]

→ Discovery (pergunta o que você quer)
→ SALVA estado
→ Research (analisa o código)
→ SALVA estado
→ [Discuss?] (se há ambiguidade)
→ SALVA estado
→ Specify (especifica requisitos)
→ SALVA estado
→ [Clarify?] (se há ambiguidade)
→ SALVA estado
→ [Design?] (se há decisão arquitetural)
→ SALVA estado
→ Tasks (quebra em tarefas)
→ SALVA estado
→ Execute (implementa)
→ SALVA estado
→ Pronto
```

**ÚNICO comando:** `/lspec [o que você quer]`

O sistema executa TODO o pipeline em ordem, salvando após cada fase. Nunca pergunta qual fase executar. Nunca pula. Nunca vai direto para código.

---
## Artifact Enforcement

Cada fase produz um artifact que a próxima usa:

```
Discovery  → STATE.md       → Research
Research   → research.md     → Discuss?
Discuss    → discuss.md      → Specify
Specify    → spec.md        → Clarify?
Clarify    → clarify.md      → Design?
Design     → design.md       → Tasks
Tasks      → tasks.md       → Execute
```

**Sem artifact = bloqueia.** A fase não começa sem o artifact da anterior.

---



## Gates e Travamentos (Enforcement)

O L-Spec PI usa **gates bloqueantes** para garantir qualidade. Cada gate deve passar antes de avançar.

### 1. Compliance Gate (Bloqueante)

**Antes de QUALQUER edit no código**, execute o checklist:

```
┌────────────────────────────────────────────────────────────────┐
│ COMPLIANCE GATE CHECKLIST │
├────────────────────────────────────────────────────────────────┤
│ [ ] 1. Discovery completo — contexto coletado                  │
│ [ ] 2. Requirements claros — spec.md existente                  │
│ [ ] 3. Design verificado — design.md existe (se aplicável)     │
│ [ ] 4. Tasks aprovadas — tasks.md com artefatos definidas │
│ [ ] 5. State atualizado — STATE.md reflete estado atual        │
└────────────────────────────────────────────────────────────────┘
```

**Se qualquer item ❌ → BLOQUEIA. Resolva antes de editar.**

### 2. State Saved Gate (Bloqueante)

**Entre cada fase**, verifique:

```
┌────────────────────────────────────────────────────────────────┐
│ STATE SAVED GATE                                               │
├────────────────────────────────────────────────────────────────┤
│ [ ] STATE.md existe para esta feature                          │
│ [ ] Última fase completada está marcada │
│ [ ] Progresso atualizado (ROADMAP.md)                          │
│ [ ] Decisões documentadas (AD-NNN)                             │
│ [ ] Blockers identificados (B-NNN)                              │
└────────────────────────────────────────────────────────────────┘
```

###3. Design Reference Enforcement

**Antes de implementar (Execute)**, se Design foi executado:

```
┌────────────────────────────────────────────────────────────────┐
│ DESIGN REFERENCE ENFORCEMENT                                   │
├────────────────────────────────────────────────────────────────┤
│ [ ] design.md existe em features/[name]/                         │
│ [ ] Design foi aprovado pelo usuário                           │
│ [ ] Componentes definidos no design │
│ [ ] Interfaces documentadas                                    │
│ [ ] Code reuse identificado │
└────────────────────────────────────────────────────────────────┘
```

### 4. Artifact Enforcement

Cada fase produz **artefatos** que a próxima fase precisa. Sem artefato = bloqueia.

```
┌────────────┬────────────────────────┬─────────────────────────────┐
│ FASE       │ PRODUZ │ PRÓXIMA FASE PRECISA        │
├────────────┼────────────────────────┼─────────────────────────────┤
│ Discovery  │ PROJECT.md, ROADMAP.md  │ Research, Specify │
│ Research   │ findings documentados  │ Design, Specify              │
│ Specify    │ spec.md                │ Tasks, Design                │
│ Design     │ design.md              │ Tasks │
│ Tasks │ tasks.md               │ Execute                      │
│ Execute    │ código + commits │ validação final              │
└────────────┴────────────────────────┴─────────────────────────────┘
```

**Sem artefato da fase anterior → Execute bloqueado.**

### 5. Gate Check (Verify)

Durante Execute, cada tarefa tem um **gate level**:

```
┌────────────────────────────────────────────────────────────────┐
│ TIERED GATE CHECKS                                             │
├────────────────────────────────────────────────────────────────┤
│ Task com unit tests          │ Gate: QUICK  (unit only)        │
│ Task com e2e/integration     │ Gate: FULL (unit + e2e)       │
│ Última task da fase │ Gate: BUILD (build + lint + all)│
│ Task sem testes │ Gate: BUILD (build + lint only) │
└────────────────────────────────────────────────────────────────┘
```

**Regra: Nunca prossiga com gate vermelho.**

---

## Enforcement Pattern

O padrão de enforcement combina **Compliance Gate + State Saved Gate**:

```
┌─────────────────────────────────────────────────────────────────┐
│ ENFORCEMENT PATTERN (OBRIGATÓRIO) │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ANTES DE CADA FASE: │
│  ┌──────────────────┐    ┌──────────────────┐                   │
│  │ Compliance Gate  │ AND │ State Saved Gate │                   │
│  │ (5 itens)        │     │ (verificação)    │                   │
│  └────────┬─────────┘    └────────┬─────────┘                   │
│           │                       │                              │
│           └───────────┬───────────┘                              │
│                       ▼                                          │
│              ┌──────────────┐                                    │
│              │ AVANÇAR?    │                                    │
│              └──────────────┘                                    │
│                                                                  │
│  AMBOS gates devem passar para prosseguir.                      │
│  Se um falhar → BLOQUEIA e resolve antes. │
└─────────────────────────────────────────────────────────────────┘
```

---
## Regras Absolutas

**NUNCA:**
- ❌ Pular fase obrigatória (Discovery, Research, Specify, Tasks, Execute)
- ❌ Ir direto para código
- ❌ Implementar sem spec
- ❌ Editar sem passar pelo pipeline
- ❌ Criar spec duplicada — verificar se já existe em `.specs/features/[name]/`
- ❌ Ignorar design reference — se design.md existir, LER e SEGUIR

**SEMPRE:**
- ✓ Salvar estado após cada fase
- ✓ Próxima fase usa artifact da anterior
- ✓ Fases opcionais ativadas quando necessário
- ✓ Mudanças estruturais → atualizar `.specs/project/{PROJECT.md, ROADMAP.md}`
- ✓ SPEC Enforcement: mudança ocorre → verificar se spec existe. Se sim → atualizar. Se não → criar.

---



## NUNCA Rules (Completas)

**NUNCA:**
- Quick mode
- Auto-sizing
- Pular fases obrigatórias
- Parar no meio do fluxo
- Editar código fora do spec/design
- Pular Autosave de estado
- Prosseguir com gate vermelho
- Criar estrutura `fixes/` (tudo é feature)
- Fabricar informação (se não sabe, diga "não sei")
- Modificar testes escritos no RED
- Enfraquecer asserções para passar
- "While I'm here" durante implementação

**SEMPRE:**
- Pipeline completo (mesmo em BUG flow)
- Autosave de estado em cada fase
- Confirmar antes de avançar
- Atualizar STATE.md
- Verificar design.md antes de implementar
- Testes primeiro (RED phase)
- Gate check após cada tarefa
- Commit atômico por tarefa
- Reuse de código existente

---
## Modos de Operação

### Modo: Forward (padrão)
```
/lspec [request] → Discovery → Research → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute
```
Para: projeto novo, feature, bug, melhoria

**Discovery adaptativo:**
- Bug: perguntas curtas (1-3)
- Feature: perguntas médias (5-8)
- Projeto novo: perguntas completas (10-15)

### Modo: Map
```
/lspec map → Mapear código existente → SPEC.md
```
Para: analisar código existente e gerar spec

**Quando usar:**
- Projeto sem documentação
- Código legado para entender
- "Como esse projeto funciona?"

### Modo: Map (brownfield)
```
/lspec map → Analisar codebase → 7 docs de arquitetura
```
Para: projetos existentes precisam de mapa

---



## Qual Comando Usar

### Single Entry Point — `/lspec`

O comando `/lspec` é o **único ponto de entrada**. Ele auto-detecta o tipo de projeto e executa o pipeline completo.

**Não precisa escolher comando por fase.** O sistema avança automaticamente.

| Cenário | Comando | O que acontece |
|---------|---------|----------------|
| Projeto novo | `/lspec criar um sistema de...` | Discovery completo (17 perguntas) → Research → Specify → ... |
| Feature em projeto existente | `/lspec adicionar login com...` | Discovery focado → Research → Specify → ... |
| Bug em projeto existente | `/lspec corrigir erro de...` | Discovery curto (3 perguntas) → Research → Tasks → Execute |
| Projeto existente sem specs | `/lspec mapear o código atual` | **Map mode** — survey do código → spec gerada automaticamente |

### Map — Quando Usar

Use `/lspec map` (ou `/lspec mapear`) quando:

- Projeto existe mas **não tem `.specs/`**
- Precisa entender estrutura antes de mexer
- Vai接手 projeto de outra pessoa

O map escaneia o código, gera `.specs/project/` e `.specs/features/[name]/` automaticamente.

### Fluxo por Tipo

**PROJETO NOVO:**
```
Discovery (completo) → Research → Discuss? → Specify → Clarify? → Design? → Tasks → Execute
```

**BUG:**
```
Discovery (curto) → Research → Specify → Tasks → Execute
```

**FEATURE:**
```
Discovery (focado) → Research → Specify → Clarify? → Tasks → Execute
```

**PROJETO EXISTENTE (sem .specs/):**
```
Discovery (curto) → Research → Specify → Clarify? → Design? → Tasks → Execute
```

---
## Fluxo Forward Completo

**Você diz:** `/lspec quero adicionar autenticação por JWT`

**Sistema faz:**

```
1. Discovery
   → "Que tipo de autenticação?"
   → Salva .specs/project/STATE.md

2. Research
   → Analisa: existe auth no projeto?
   → Analisa: qual stack de auth?
   → Analisa: onde integrar?
   → Salva features/jwt-auth/research.md

3. Discuss? (se há ambiguidade)
   → Captura área cinzenta
   → Salva features/jwt-auth/discuss.md

4. Specify
   → Usa Discovery + Research
   → Escreve spec.md com requisitos
   → Salva features/jwt-auth/spec.md

5. Clarify? (se há ambiguidade)
   → Resolve ambiguidade
   → Salva features/jwt-auth/clarify.md

6. Design? (se há decisão arquitetural)
   → Decisões de arquitetura
   → Salva features/jwt-auth/design.md

7. Tasks
   → Usa spec.md
   → Quebra em tarefas
   → Salva features/jwt-auth/tasks.md

8. Execute
   → Usa tasks.md
   → Implementa código
   → Salva mudanças

→ Pronto!
```

**Você não precisa chamar cada fase manualmente. O sistema avança sozinho.**

---



## Pesquisa (Research)

Fase **OBRIGATÓRIA** entre Discovery e Specify.

**Quando executar:**
- Feature envolve tecnologia unfamiliar
- Integrações com sistemas novos
- Padrões não usados anteriormente neste codebase

**Knowledge Verification Chain (ordem estrita):**
```
Codebase → Project docs → Context7 MCP → Web search → Flag as uncertain
```

**CRITICAL: NUNCA assuma ou fabrication informação.** Se não conseguir encontrar resposta, diga "Eu não sei" ou "Não consegui encontrar documentação para isso". Informação inventada propaga através de design → tasks → implementação e causa falhas em cascata.

---

## Estrutura de Projeto

```
.specs/
├── project/
│   ├── PROJECT.md       # Visão, objetivos, stack
│   ├── ROADMAP.md       # Features e milestones
│   └── STATE.md         # Decisões, blockers, estado atual
└── features/
    └── [feature]/
        ├── spec.md      # Requisitos testáveis
        ├── context.md   # Decisões de áreas cinzentas (opcional)
        ├── design.md    # Decisões arquiteturais (opcional)
        └── tasks.md     # Tarefas atômicas
```

**Nota:** Bugs são registrados como features em `features/` — prefixo `fix-` ou `bug-` no nome.

---

## Autosave de Estado

**Em cada fase, AO FINALIZAR:**
1. Salvar decisões em STATE.md
2. Atualizar progresso em ROADMAP.md
3. Persistir contexto para próxima sessão

**STATE.md atualizado:**
- AD-NNN: decisões
- B-NNN: blockers
- L-NNN: aprendizados
- Todos pendentes
- Deferred ideas

---

## Git Workflow

**Onde editar:**
1. Clone o repositório git do projeto
2. Edite no clone local
3. Commit atômico por tarefa
4. Push quando gate passar

**NUNCA edite skills localmente.** Skills vivem no repositório git, não no filesystem local do agente.

**Formato de commit (Conventional Commits 1.0.0):**
```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

**Types permitidos:**
- `feat` — New feature
- `fix` — Bug fix
- `refactor` — Code change (no bug fix, no feature)
- `docs` — Documentation
- `test` — Tests
- `style` — Formatting
- `perf` — Performance
- `build` — Build system
- `ci` — CI config
- `chore` — Maintenance

**Regras:**
- One task = one commit
- Description = o que foi FEITO, não planejado
- Include only files in task definition
- Tests no mesmo commit se parte da tarefa

---

## Ferramentas Recomendadas

### Hermes (agent-lsp)

**Hermes usa `agent-lsp` para navegação de código.** Não `pi-cymbal`.

```
┌────────────────────────────────────────────────────────────────┐
│ agent-lsp Skills (66 tools + 23 workflow skills)              │
├────────────────────────────────────────────────────────────────┤
│ Antes de editar:     blast_radius — blast-radius analysis    │
│ Antes de aplicar: preview_edit — preview diagnostic delta │
│ Depois de mudar:      get_diagnostics, run_build, run_tests  │
└────────────────────────────────────────────────────────────────┘
```

**Task-to-tool mapping:**

| Task | Use this | Not this |
|------|----------|----------|
| See file structure | `list_symbols` | Read + manual scanning |
| Find a symbol by name | `find_symbol` | Grep across files |
| Find all usages | `find_references` | Grep for the name |
| Understand a symbol | `inspect_symbol` | Read the file |
| What calls this function | `find_callers` | Grep for the name |
| Replace a function body | `replace_symbol_body` | Edit with text matching |
| Delete unused symbol | `safe_delete_symbol` | Edit to remove lines |

**Skills disponíveis via `/lsp-*`:**
- `/lsp-architecture` — Structural overview
- `/lsp-concurrency-audit` — Concurrency safety
- `/lsp-cross-repo` — Cross-repository analysis
- `/lsp-dead-code` — Dead code detection
- `/lsp-edit-export` — Safe workflow for public APIs
- `/lsp-refactor` — End-to-end safe refactor
- `/lsp-rename` — Two-phase safe rename
- `/lsp-safe-edit` — Wrap edits with preview
- `/lsp-verify` — Three-layer verification (LSP + build + tests)

### PI Packages (built-in no PI.dev)

PI.dev fornece tools nativas de navegação — nenhuma instalação necessária:

**cymbal_* — navegação estrutural:**
- `cymbal_map`, `cymbal_search`, `cymbal_outline`, `cymbal_show`, `cymbal_refs`, `cymbal_impact`, `cymbal_importers`, `cymbal_impls`

**lsp_* — precisão técnica:**
- `lsp_goto_definition`, `lsp_find_references`, `lsp_diagnostics`, `lsp_symbols`, `lsp_rename`

Use diretamente — são parte do runtime PI.dev.

---

## Pitfalls Críticos

###1. Fabricação de Informação
```
❌ "Provavelmente funciona assim..."
✅ "Não sei, vou pesquisar"
```

### 2. Pular Gates
```
❌ "Vou pular o gate check, parece ok"
✅ "Gate vermelho = para e resolve"
```

### 3. Scope Creep
```
❌ "Enquanto estou aqui, já vou fazer X"
✅ "Is this in my task definition? If no, don't touch it"
```

### 4. Silenciar Testes
```
❌ "Vou desabilitar esse teste temporariamente"
✅ "Teste falhando = problema real, resolve"
```

### 5. Auto-sizing
```
❌ "Parece que é só isso, vou ajustar"
✅ "Verificar blast radius manualmente"
```

### 6. Saltar Autosave
```
❌ "Vou lembrar do estado mentalmente"
✅ "STATE.md atualizado após cada fase"
```

### 7. Testes Fracos
```
❌ "Teste passa sem implementação = ok"
✅ "Teste deve falhar no RED, passar no GREEN"
```

### 8. SPEC_DEVIATION Silenciosa
```
❌ "Implementation divergiu, mas tudo bem"
✅ "// SPEC_DEVIATION: [what diverged] // Reason: [why]"
```

---

## Regras de Ouro

1. **SEMPRE Pipeline Completo** — nenhuma exceção
2. **Autosave** — estado salvo em cada fase
3. **Confirmar** — antes de avançar para próxima fase
4. **Nunca Fabricar** — se não sabe, diga "não sei"
5. **Spec é Verdade** — código desvia = SPEC_DEVIATION marker
6. **Gate é Determinístico** — o test runner decide, não o agente
7. **Reuse é Rei** — copiar padrões existentes, não reinventar
8. **Commit Atômico** — um task = um commit

---

---

## Referências internas

- `skills/lspec/README.md`
- `skills/lspec/SKILL.md`
- `skills/lspec-discovery/SKILL.md`
- `skills/lspec-specify/SKILL.md`
- `skills/lspec-design/SKILL.md`
- `skills/lspec-tasks/SKILL.md`
- `skills/lspec-execute/SKILL.md`
- `skills/lspec-auto/SKILL.md`
- `skills/lspec-next/SKILL.md`
- `skills/lspec-validate/SKILL.md`
- `skills/lspec-resume/SKILL.md`
- `skills/lspec-pause/SKILL.md`
- `references/pi-version-setup.md`
- `references/pi-packages-guide.md`
- `references/pi-v2-architecture.md`
- `references/subagent-context-budget.md`

---

## Créditos

Base conceitual inspirada no TLC Spec-Driven (Tech Lead's Club), com evolução prática para o ecossistema PI por **by-lua**.
