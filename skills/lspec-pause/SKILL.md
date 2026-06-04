---
name: lspec-pause
description: "Pausa trabalho e cria checkpoint de handoff para continuidade."
---

warning: |
  ⚠️ REGRA ABSOLUTA:
  - Salve estado atual ANTES de qualquer outra ação
  - Documente TODO o contexto necessário para ressumir

# pause — Pausar Trabalho

**Trigger:** "Pause work", "End session", "Create handoff", "/lspec pause"

**Purpose:** Criar checkpoint de estado para ressumir posteriormente.

---

## Pipeline

### Discovery

Analisar estado atual do trabalho:

- Quais tarefas estão em progresso?
- Quais arquivos estão modificados?
- Quais decisões foram tomadas?
- Qual o branch git atual?
- Há changes não commitados?

### Specify (OBRIGATÓRIO)

Documentar o estado no arquivo `features/`:

```markdown
# Paused Feature

**Feature:** [nome da feature]
**Data:** [ISO timestamp]
**Branch:** [git branch]

## Estado Atual

### Completo ✓
- [item completo]

### Em Progresso
- [work em andamento] — [percentual ou status]
- Localização: [file:line]

### Pendente
- [próximo passo]
- [passo seguinte]

### Bloqueios
- [descrição do bloqueio] — [impacto]

## Contexto de Ressumição

- Arquivos modificados: [lista]
- Decisões: [referências a STATE.md]
- Notas importantes: [contexto adicional]
```

### Tasks (OBRIGATÓRIO)

1. Criar/atualizar `.specs/HANDOFF.md` com estado documentado
2. Confirmar que todos os arquivos estão salvos
3. Listar próximo passo claro para ressumição

### Execute

Realizar ações de pause:

```bash
# Verificar estado do git
git status

# Criar checkpoint se necessário
git add -A
git commit -m "WIP: [feature name] - checkpoint before pause"

# Confirmar HANDOFF.md existe
cat .specs/HANDOFF.md
```

---

## Estrutura de Arquivos

```
.specs/
└── features/
    └── [feature-name]/
        └── HANDOFF.md
```

**NUNCA usar:**
- `fixes/` — apenas `features/`
- quick mode
- auto-sizing

---

## Tips

- Foco em informação acionável para ressumição
- Incluir referências específicas de file:line
- Notar mudanças não commitadas explicitamente
- Referenciar entradas de STATE.md quando aplicável
- Manter HANDOFF.md conciso e preciso

**Próximo passo:** `/lspec resume` para continuar de onde parou.