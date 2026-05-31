# L-Spec PI

SDD (Spec-Driven Development) para PI.dev, mantendo o fluxo completo de especificação antes da execução.

## O que é SDD?

SDD é desenvolver por especificação primeiro e código depois.
No L-Spec PI isso significa: discovery adaptativo, requisitos claros, tarefas atômicas e execução verificável.

## Por que isso existe?

A maioria das sessões com IA perde 40–60% dos tokens com retrabalho e ambiguidades.
O L-Spec PI reduz isso com processo explícito antes de codar.

- Sem SDD: retrabalho, escopo escapa, contexto se perde.
- Com L-Spec PI: menos reescrita, menos bug, commits mais limpos, continuidade entre sessões via `.specs/`.

## Fluxo

`DISCOVERY → SPECIFY → (CLARIFY opcional) → (DESIGN opcional) → TASKS → EXECUTE`

- Sem quick mode
- Sem autosize
- Tudo passa por discovery adaptativo
- Autosave de estado
- Pause/Resume work
- Ask para perguntas durante o processo

## Instalação

```bash
lspec install
```

## Upgrade

```bash
lspec upgrade
```

## Uninstall

```bash
lspec uninstall
```

## Pacotes PI recomendados

```bash
pi install npm:pi-cymbal
pi install npm:@davehardy20/pi-lsp-tools
pi install npm:pi-mermaid
```

## Pacotes PI opcionais (recomendados)

- `pi install npm:@dreki-gg/pi-context7`
- `pi install npm:context-mode`
- `pi install npm:pi-mcp-adapter`
- `pi install npm:pi-web-access`
- `pi install npm:pi-ask-user`

## Recomendado: L-Spec Subagents (by-lua)

Extensão para delegação por especialidade:

- Opus como orquestrador
- Gemini como designer
- GPT como executor

Repo: https://github.com/by-lua/lspec-subagents

## Referências internas

- `skills/lspec/README.md`
- `skills/lspec/references/pi-version-setup.md`
- `skills/lspec/references/pi-packages-guide.md`
- `skills/lspec/references/pi-v2-architecture.md`
- `skills/lspec/references/subagent-context-budget.md`

## Créditos

Base conceitual inspirada no TLC Spec-Driven (Tech Lead's Club), com evolução prática para o ecossistema PI por **by-lua**.
