---
name: lspec
description: "LSpec PI — Spec-Driven Development adaptativo. Pipeline: Discovery → Discuss → Specify → Clarify → Design → Tasks → Execute. Sem quick mode, sem auto-sizing. Autosave de estado, Pause/Resume."
license: CC-BY-4.0
metadata:
  author: Lua - github.com/by-lua
  version: 3.0.0
---

# LSpec PI — Hub

## Pipeline Adaptativo

```
DISCOVERY → DISCUSS* → SPECIFY → CLARIFY* → DESIGN* → TASKS → EXECUTE
```

```
┌────────────┬──────────────────────────────────────────────────────────┐
│ FASE       │ QUANDO RODA                                             │
├────────────┼──────────────────────────────────────────────────────────┤
│ Discovery  │ SEMPRE                                                  │
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
- Pular fases
- Parar no meio do fluxo

**SEMPRE:**
- Autosave de estado em cada fase
- Confirmar antes de avançar
- Atualizar STATE.md

---

## Comandos

| Comando | Descrição |
|---------|-----------|
| `/lspec discovery` | Iniciar/finalizar Discovery (adaptativo) |
| `/lspec discuss` | Capturar contexto em áreas cinzentas |
| `/lspec specify` | Especificar requisitos (OBRIGATÓRIO) |
| `/lspec clarify` | Resolver ambiguidades |
| `/lspec design` | Decisões arquiteturais |
| `/lspec tasks` | Decompor em tarefas |
| `/lspec execute` | Implementar |
| `/lspec ask` | Fazer perguntas durante o processo |
| `/lspec pause` | Salvar estado |
| `/lspec resume` | Continuar de onde parou |
| `/lspec reverse` | Mapear projeto existente (brownfield) |

---

## Fluxo por Tipo

**PROJETO NOVO:**
```
Discovery (completo) → Discuss? → Specify → Clarify? → Design? → Tasks → Execute
```

**BUG:**
```
Discovery (curto) → Discuss? → Specify → Clarify? → Design? → Tasks → Execute
```

**FEATURE:**
```
Discovery (focado) → Discuss? → Specify → Clarify? → Design? → Tasks → Execute
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

## PI Packages

Quando precisar de navegação de código, verificar:

```bash
pi list | grep -E 'cymbal|lsp-tools|mermaid'
```

| Package | Uso |
|---------|-----|
| `pi-cymbal` | Mapear código existente, refs, go-to-definition |
| `@davehardy20/pi-lsp-tools` | LSP precision (rename, find callers) |
| `pi-mermaid` | Diagramas de arquitetura |

Fallback: ferramentas nativas se não instalados.

---

## Regras de Ouro

1. **SEMPRE Pipeline Completo** — nenhuma exceção
2. **Autosave** — estado salvo em cada fase
3. **Confirmar** — antes de avançar para próxima fase
4. **Nunca Fabricar** — se não sabe, diga "não sei"
5. **Spec é Verdade** — código desvia = SPEC_DEVIATION
