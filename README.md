# L-Spec — Spec-Driven Development para PI.dev

Pipeline completo de planejamento e execução: Discovery → Specify → Design → Tasks → Execute.

## Instalação rápida

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash
```

## Instalação manual

```bash
git clone https://github.com/by-lua/lspec-pi.git ~/.lspec-pi
cd ~/.lspec-pi && bash install.sh
```

## O que é instalado

| Arquivo | Destino | O que faz |
|---------|---------|-----------|
| `skills/l-spec/SKILL.md` | `~/.pi/agent/skills/l-spec/` | Skill principal L-Spec |
| `prompts/lspec-*.md` (13) | `~/.pi/agent/prompts/` | Comandos slash |

## Comandos disponíveis

- `/lspec discovery` — Inicialização profunda (22 perguntas, 6 fases)
- `/lspec map` — Mapear codebase existente
- `/lspec specify` — Definir requisitos com IDs rastreáveis
- `/lspec discuss` — Decidir áreas cinzentas
- `/lspec design` — Arquitetura e componentes
- `/lspec tasks` — Plano de tarefas atômicas
- `/lspec execute` — Implementar com TDD
- `/lspec bugfix` — Bug fix rápido ou ciclo completo
- `/lspec auto` — Rodar tudo automático com auto-sizing
- `/lspec next` — Avançar fase manualmente
- `/lspec pause` — Salvar contexto e pausar
- `/lspec resume` — Retomar de onde parou
- `/lspec feature-clarify` — 5 perguntas rápidas antes de especificar

## Auto-Sizing

| Escopo | Discovery/Specify | Design | Tasks | Execute |
|--------|-------------------|--------|-------|---------|
| Pequeno (≤3 arquivos) | Quick mode — pula pipeline | — | — | — |
| Médio | Discovery opcional, spec breve | Pula | Pula | Implementa + verifica |
| Grande | Discovery + spec completo | Arquitetura + componentes | Breakdown completo | Implementa + verifica por tarefa |
| Complexo | Discovery + spec + discuss | Pesquisa + arquitetura | Breakdown + paralelo | Implementa + verificação por tarefa |

## Diretório .specs/

```
.specs/
├── project/
│   ├── PROJECT.md        # Visão e objetivos
│   ├── ROADMAP.md        # Milestones
│   └── STATE.md          # Memória persistente
├── design-references/    # Prints, mockups, HTML
├── codebase/             # Mapeamento (7 docs)
├── features/
│   └── [feature]/
│       ├── spec.md       # Requisitos rastreáveis
│       ├── context.md    # Decisões do usuário
│       ├── design.md     # Arquitetura
│       └── tasks.md      # Tarefas atômicas
└── fixes/
    └── NNN-description/
```

## Subagentes

L-Spec define **quando** usar subagentes. **Quais** subagentes usar é definido pela skill separada [lspec-subagentes-slim](https://github.com/by-lua/lspec-subagents-slim).

## Desinstalar

```bash
bash ~/.lspec-pi/uninstall.sh
```

## Requisitos

- [PI.dev](https://github.com/nicepkg/pi) com `@tintinweb/pi-subagents`

## Licença

CC-BY-4.0 — Baseado no TLC Spec-Driven v2.0.0 por Felipe Rodrigues