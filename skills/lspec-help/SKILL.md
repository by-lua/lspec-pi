---
name: lspec-help
description: "Mostra ajuda sobre comandos LSpec disponíveis."
---

# help

Este comando **apenas mostra informações** — não executa operações, não modifica arquivos, não altera código.

**O que fazer:**
- Liste todos os comandos LSpec disponíveis
- Para cada comando, mostre: nome, descrição breve, quando usar

**Comandos disponíveis:**

| Comando | Descrição | Gatilho |
|---------|-----------|---------|
| `discovery` | Identifica o tipo de tarefa e carrega o contexto certo | novo projeto, bug, feature, teste |
| `specify` | Captura requisitos e gera .specs/[feature]/spec.md | depois do discovery |
| `clarify` | Faz perguntas para entender requisitos | quando algo está ambíguo |
| `design` | Projeta arquitetura se necessário | quando precisa decidir estrutura |
| `tasks` | Quebra em tarefas atômicas | depois de specify/design |
| `execute` | Executa uma tarefa específica | quando receber tarefa |
| `ask` | Faz pergunta durante o processo | quando tiver dúvida |
| `pause` | Salva checkpoint para continuar depois | antes de sair |
| `resume` | Retoma de onde parou | ao voltar |
| `next` | Mostra próxima tarefa | quando precisar saber o próximo passo |
| `auto` | Autoavana se contexto estiver completo | quando quiser automação |

**Regra:** Não executar nada — apenas mostrar esta tabela de ajuda.
