---
name: lspec-help
description: "Mostra ajuda sobre comandos LSpec disponíveis."
---

# help

Este comando **apenas mostra informações** — não executa operações, não modifica arquivos, não altera código.

## Pipeline LSpec

Discovery → Discuss (OPCIONAL) → Specify → Clarify (OPCIONAL) → Design (OPCIONAL) → Tasks → Execute

### Fases do Pipeline

| Fase | Descrição | Gatilho | Tipo |
|------|-----------|---------|------|
| `discovery` | Identifica o tipo de tarefa e carrega o contexto certo | novo projeto, bug, feature, teste | OBRIGATÓRIO |
| `discuss` | Discussão inicial para alinhar expectativas | quando precisar explorar ideias | OPCIONAL |
| `specify` | Captura requisitos e gera `features/[feature]/spec.md` | depois do discovery | OBRIGATÓRIO |
| `clarify` | Faz perguntas para entender requisitos | quando algo está ambíguo | OPCIONAL |
| `design` | Projeta arquitetura se necessário | quando precisa decidir estrutura | OPCIONAL |
| `tasks` | Quebra em tarefas atômicas | depois de specify/design | OBRIGATÓRIO |
| `execute` | Executa uma tarefa específica | quando receber tarefa | OBRIGATÓRIO |

### Comandos Auxiliares

| Comando | Descrição | Gatilho |
|---------|-----------|---------|
| `ask` | Faz pergunta durante o processo | quando tiver dúvida |
| `pause` | Salva checkpoint para continuar depois | antes de sair |
| `resume` | Retoma de onde parou | ao voltar |
| `next` | Mostra próxima tarefa | quando precisar saber o próximo passo |
| `auto` | Autoavana se contexto estiver completo | quando quiser automação |

## Estrutura de Diretórios

- `features/` — todas as specs e artefatos de feature
  - `features/[feature]/spec.md` — especificação da feature
  - `features/[feature]/design.md` — design da feature (se aplicável)
  - `features/[feature]/tasks.md` — tarefas da feature

## Regras

1. **NUNCA usar quick mode** — sempre seguir o pipeline completo
2. **NUNCA usar auto-sizing** — respeitar tamanhos explícitos
3. **features/ apenas** — não criar `fixes/`, usar `features/` para tudo
4. Não executar nada — apenas mostrar esta tabela de ajuda
