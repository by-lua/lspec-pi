# lspec-clarify Skill

## Propósito

Clarificar requisitos ambíguos antes da especificação formal. Este skill é **OPCIONAL** — use apenas quando houver ambiguidade real nos requisitos que impede avanço para Specify.

---

## Fluxo de Fases

```
Discovery → Discuss (OPCIONAL) → Specify → Clarify (OPCIONAL) → Design (OPCIONAL) → Tasks → Execute
```

**Fases obrigatórias:** Discovery → Specify → Tasks → Execute
**Fases opcionais:** Discuss, Clarify, Design

---

## Autosave de Estado

Após cada fase, salve o estado em `features/[name]/.state.json`:

```json
{
  "feature": "[name]",
  "current_phase": "specify",
  "completed_phases": ["discovery", "specify"],
  "artifacts": {
    "discovery": "features/[name]/discovery.md",
    "specify": "features/[name]/context.md"
  },
  "pending_issues": [],
  "timestamp": "2026-06-04T21:22:00Z"
}
```

---

## Fases do Pipeline

### 1. Discovery (OBRIGATÓRIO)

**Entrada:** Tema ou ideia inicial do usuário
**Saída:** `features/[name]/discovery.md`

Reunir informações sobre o problema, contexto e necessidades.

```
1. Identificar escopo e nome da feature
2. Documentar problema atual e dor
3. Listar stakeholders/usuários afetados
4. Coletar requisitos implícitos
5. Autosave: completed_phases = ["discovery"]
```

**Template:**
```markdown
# Discovery: [name]

## Problema
[Descrição do problema atual]

## Contexto
[Contexto relevante]

## Stakeholders
- [Lista de stakeholders]

## Requisitos Implícitos
- [Requisitos identificados]

## Perguntas em Aberto
- [Perguntas para clarificação]
```

---

### 2. Discuss (OPCIONAL)

**Entrada:** Perguntas do Discovery
**Saída:** `features/[name]/discuss.md`

Usar APENAS quando há necessidade de validação de requisitos com stakeholders ou alinhamento de entendimento.

```
1. Apresentar perguntas em aberto
2. Coletar feedback/validação
3. Documentar decisões
4. Autosave: completed_phases += ["discuss"]
```

**Template:**
```markdown
# Discuss: [name]

## Perguntas Apresentadas
[Perguntas enviadas para alinhamento]

## Respostas e Decisões
[Respostas coletadas]

## Validações
[Validações obtidas]
```

---

### 3. Specify (OBRIGATÓRIO)

**Entrada:** Discovery (e Discuss se aplicável)
**Saída:** `features/[name]/context.md`

Formalizar os requisitos em uma especificação estruturada.

```
1. Consolidar requisitos validados
2. Definir escopo preciso da feature
3. Especificar comportamento esperado
4. Identificar critérios de aceitação
5. Autosave: completed_phases += ["specify"]
```

**Template:**
```markdown
# Context: [name]

## Feature
[Nome da feature]

## Problema
[Problema que resolve]

## Solução Proposta
[Descrição da solução]

## Escopo
### Dentro
- [Itens incluídos]

### Fora
- [Itens excluídos]

## Comportamento Esperado
[Descrição detalhada do comportamento]

## Critérios de Aceitação
- [ ] [Critério 1]
- [ ] [Critério 2]

## Dependências
[Dependências identificadas]

## Riscos
[Riscos potenciais]
```

---

### 4. Clarify (OPCIONAL)

**Entrada:** context.md com ambiguidades identificadas
**Saída:** `features/[name]/clarify.md`

Usar APENAS quando houver ambiguidade nos requisitos que impede avanço para Design/Tasks.

```
1. Identificar ambiguidades específicas
2. Listar ambiguidades encontradas
3. Propor resoluções ou confirmar com usuário
4. Documentar esclarecimentos obtidos
5. Autosave: completed_phases += ["clarify"]
```

**Template:**
```markdown
# Clarify: [name]

## Ambiguidades Identificadas
[Lista de ambiguidades]

## Esclarecimentos
[Esclarecimentos obtidos]

## Decisões Tomadas
[Decisões para resolver ambiguidades]

## Impacto na Especificação
[Atualizações necessárias em context.md]
```

---

### 5. Design (OPCIONAL)

**Entrada:** context.md (e clarify.md se aplicável)
**Saída:** `features/[name]/design.md`

Definir arquitetura e abordagem técnica.

```
1. Definir componentes/estrutura
2. Desenhar interações
3. Especificar interfaces
4. Documentar decisões de design
5. Autosave: completed_phases += ["design"]
```

---

### 6. Tasks (OBRIGATÓRIO)

**Entrada:** context.md (e clarify.md, design.md se aplicável)
**Saída:** `features/[name]/tasks.md`

Decompor em tarefas executáveis.

```
1. Listar todas as tarefas necessárias
2. Priorizar tarefas
3. Estimar esforço se aplicável
4. Identificar blockers
5. Autosave: completed_phases += ["tasks"]
```

**Template:**
```markdown
# Tasks: [name]

## Backlog
| ID | Tarefa | Prioridade | Status |
|----|--------|------------|--------|
| 001 | [Tarefa] | alta | pendente |

## Blocker
[Blokers identificados]
```

---

### 7. Execute (OBRIGATÓRIO)

**Entrada:** tasks.md
**Saída:** Feature implementada + testes

```
1. Executar tarefas na ordem de prioridade
2. Manter contexto atualizado
3. Validar cada tarefa concluída
4. Autosave: completed_phases += ["execute"]
```

---

## Estrutura de Diretórios

```
features/
└── [name]/
    ├── .state.json      # Autosave de estado
    ├── discovery.md     # Resultado Discovery
    ├── discuss.md       # Resultado Discuss (se aplicável)
    ├── context.md       # Resultado Specify
    ├── clarify.md       # Resultado Clarify (se aplicável)
    ├── design.md        # Resultado Design (se aplicável)
    └── tasks.md         # Resultado Tasks

# NUNCA usar:
# - fixes/
# - quick mode
# - auto-sizing
```

---

## Regras de Execução

1. **Nunca use:** quick mode, auto-sizing
2. **Nunca crie:** diretórios `fixes/`
3. **Sempre:** autosave após cada fase em `.state.json`
4. **Context output:** SEMPRE em `features/[name]/context.md`
5. **Clarify é opcional:** Use apenas quando há ambiguidade real
6. **Discuss é opcional:** Use apenas quando há necessidade de validação externa

---

## Fluxo de Continuação

**Clarify completo.** Requisitos ambíguos resolvidos e salvos em `features/[name]/clarify.md`.

→ Deseja avançar para **Design** (opcional — decisões arquiteturais)?

Se **não precisa** de design: → salve estado e avance direto para **Tasks** (obrigatório).

Se **não avançar**: salve estado em `STATE.md` e aguarde novas instruções.

---

## Integração com lspec

Este skill trabalha em conjunto com:
- `lspec-discovery`: Para fase de descoberta
- `lspec-tasks`: Para decomposição em tarefas
- `lspec-execute`: Para execução das tarefas