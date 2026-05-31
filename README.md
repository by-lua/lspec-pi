# L-Spec PI

SDD (Spec-Driven Development) para PI.dev, mantendo o fluxo completo de especificação antes da execução.

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
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash
```

## Upgrade

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/update.sh | bash
```

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/uninstall.sh | bash
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
