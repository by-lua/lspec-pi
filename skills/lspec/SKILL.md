---
name: lspec
description: "LSpec PI — Spec-Driven Development adaptativo. Pipeline: Discovery → Research → Specify → Design → Tasks → Execute. Research obrigatório. Sem quick mode, sem auto-sizing. Autosave de estado, Pause/Resume."
license: CC-BY-4.0
metadata:
  author: Lua - github.com/by-lua
  version: 3.0.0
---

# LSpec PI — Hub

## Pipeline Adaptativo

```
DISCOVERY → RESEARCH → DISCUSS* → SPECIFY → CLARIFY* → DESIGN* → TASKS → EXECUTE
```

```
┌────────────┬──────────────────────────────────────────────────────────┐
│ FASE       │ QUANDO RODA                                             │
├────────────┼──────────────────────────────────────────────────────────┤
│ Discovery  │ SEMPRE                                                  │
│ Research   │ SEMPRE (OBRIGATÓRIO) — análise do codebase              │
│ Discuss    │ OPCIONAL — só se área cinzenta/ambígua                  │
│ Specify    │ SEMPRE (OBRIGATÓRIO)                                    │
│ Clarify    │ OPCIONAL — só se ambiguidade nos requisitos             │
│ Design     │ OPCIONAL — só se necessidade arquitetural              │
│ Tasks      │ SEMPRE                                                  │
│ Execute    │ SEMPRE                                                  │
└────────────┴──────────────────────────────────────────────────────────┘
```

**NUNCA:**
- Quick mode
- Auto-sizing
- Pular fases (especialmente Research!)
- Parar no meio do fluxo

**SEMPRE:**
- Autosave de estado em cada fase
- Confirmar antes de avançar
- Atualizar STATE.md
- Analyze codebase ANTES de especificar

---

## Comandos

| Comando | Descrição |
|---------|-----------|
| `/lspec discovery` | Iniciar/finalizar Discovery (adaptativo) |
| `/lspec research` | Analisar codebase antes de Specify |
| `/lspec discuss` | Capturar contexto em áreas cinzentas |
| `/lspec specify` | Especificar feature (OBRIGATÓRIO) |
| `/lspec clarify` | Resolver ambiguidades nos requisitos |
| `/lspec design` | Decisões arquiteturais |
| `/lspec tasks` | Quebrar em tarefas granulares |
| `/lspec execute` | Implementar código |
| `/lspec validate` | Validar implementação |
| `/lspec pause` | Pausar e salvar estado |
| `/lspec resume` | Retomar de onde parou |
| `/lspec map` | Mapear projeto existente (brownfield) |
| `/lspec auto` | Executar fluxo completo automático |
| `/lspec help` | Mostrar ajuda |

---

## Fluxo por Tipo

**PROJETO NOVO:**
```
Discovery (completo) → Research → Discuss? → Specify → Clarify? → Design? → Tasks → Execute
```

**BUG:**
```
Discovery (curto) → Research → Discuss? → Specify → Clarify? → Design? → Tasks → Execute
```

**FEATURE:**
```
Discovery → Research → Specify → Clarify? → Design? → Tasks → Execute
```

**PROJETO EXISTENTE (sem .specs/):**
```
Discovery (curto) → Specify → Clarify? → Design? → Tasks → Execute
```

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

## ⚠️ REGRA CRÍTICA — ARTIFACT ENFORCEMENT

**"The artifact one writes is the next one's input."**

Cada fase **PRODUZ um artifact** que a próxima **PRECISA**. Sem artifact, não avanza.

```
╔══════════════════════════════════════════════════════════════════════╗
║  GATE: ARTIFACT CHECK — antes de iniciar próxima fase               ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  Pipeline → Produz → Feeds → Próxima                               ║
║                                                                      ║
║  Discovery  → .specs/project/STATE.md  → Research                   ║
║  Research   → features/[name]/research.md → Specify                  ║
║  Specify    → features/[name]/spec.md  → Tasks                       ║
║  Tasks      → features/[name]/tasks.md → Execute                     ║
║  Execute    → working-tree changes     → Validate                   ║
║                                                                      ║
╠══════════════════════════════════════════════════════════════════════╣
║  ⚠️  Se artifact da fase anterior NÃO EXISTE → BLOQUEIA.            ║
║  ⚠️  Não pergunta. Não pula. Não implementa.                        ║
║  ⚠️  Cria o artifact primeiro, depois avanza.                       ║
╚══════════════════════════════════════════════════════════════════════╝
```

### Exemplo de Enforcement

**Situação:** Usuário pede para implementar direto sem fazer Discovery.

```
[ENFORCED] ✗ BLOQUEADO

Artifact necessário: .specs/project/STATE.md (de Discovery)
Artifact encontrado: ❌ NÃO EXISTE

Mensagem: "Discovery é obrigatório. artifact .specs/project/STATE.md não existe.
Execute /lspec discovery primeiro para criar o artifact."
```

**Situação:** Usuário pede para executar Tasks sem spec.

```
[ENFORCED] ✗ BLOQUEADO

Artifact necessário: features/[name]/spec.md (de Specify)
Artifact encontrado: ❌ NÃO EXISTE

Mensagem: "Specify é obrigatório. artifact features/[name]/spec.md não existe.
Execute /lspec specify primeiro para criar o artifact."
```

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

## PI Packages — Navegação de Código

**Code Navigation — NUNCA use bash grep/find**

Use SOMENTE tools cymbal_* nativas do pi-cymbal (quando instalado):
- `cymbal_map` → estrutura do repo (arquivos, diretórios, módulos)
- `cymbal_search` → buscar símbolos/texto em todo o código
- `cymbal_outline` → symbols de um arquivo (classes, funções, métodos)
- `cymbal_show` → ler por símbolo ou linha específica
- `cymbal_refs` → encontrar todas as referências a um símbolo
- `cymbal_impact` → impacto a montante (upstream callers)

Se `pi-lsp-tools` instalado → use LSP para go-to-definition, refs, rename.

**Se nenhum instalado → processo normal:**
- Use tools nativas (read_file, search_files, terminal com ls/cd)
- NÃO BLOQUEIA — continua o fluxo normalmente
- Recomende instalação apenas uma vez: `pi install npm:pi-cymbal && pi install npm:@davehardy20/pi-lsp-tools`

**Bash grep/find SOLO quando:**
- Precisa de output pipeado para outro comando shell
- Casos pontuais que cymbal_* não cobre

---

## Regras de Ouro

1. **SEMPRE Pipeline Completo** — nenhuma exceção
2. **Autosave** — estado salvo em cada fase
3. **Confirmar** — antes de avançar para próxima fase
4. **Nunca Fabricar** — se não sabe, diga "não sei"
5. **Spec é Verdade** — código desvia = SPEC_DEVIATION
