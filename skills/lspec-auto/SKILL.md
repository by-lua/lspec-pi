---
name: lspec-auto
description: "Executa ciclo completo automatico: Discovery, Specify, Design, Tasks, Execute"
---

# lspec-auto

Executa ciclo completo de desenvolvimento de features: Discovery → Specify → Design (OPCIONAL) → Tasks → Execute.

## Regras de Uso

- **NUNCA** utilizar quick mode
- **NUNCA** utilizar auto-sizing
- **Estrutura**: apenas `features/`, **nunca** `fixes/`

## Pipeline

### 1. Discovery (OBRIGATÓRIO)
Analisar o contexto, requisitos e objetivos. Identificar o escopo e limites.

### 2. Discuss (OPCIONAL)
Se necessário, esclarecer dúvidas com o usuário antes de prosseguir.

### 3. Specify (OBRIGATÓRIO)
Especificar detalhadamente o que será implementado.

### 4. Clarify (OPCIONAL)
Refinar especificação baseada em feedback, se aplicável.

### 5. Design (OPCIONAL)
Criar design técnico quando necessário para soluções complexas.

### 6. Tasks (OBRIGATÓRIO)
Decompor em tarefas executáveis e ordenadas.

### 7. Execute (OBRIGATÓRIO)
Executar as tarefas sequencialmente.

**Carregar referencias:** `../lspec/references/specify.md + ../lspec/references/design.md + ../lspec/references/tasks.md + ../lspec/references/execute.md`
