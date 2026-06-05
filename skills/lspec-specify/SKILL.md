---
name: lspec-specify
description: "Especificação de feature — OBRIGATÓRIO no pipeline."
---

# Specify — Especificação de Feature

**Aviso CRÍTICO:**
- Specify é **OBRIGATÓRIO** — não pode ser pulado
- NUNCA use "quick mode" ou auto-sizing
- CONFIRME cada fase antes de avançar
- NUNCA pule para implementação durante Specify

**Pipeline:** Discovery → Research → Specify → Clarify? → Design? → Tasks → Execute

---

## ⚠️ ARTIFACT ENFORCEMENT — Specify precisa de research.md

**"The artifact one writes is the next one's input."**

Specify **NÃO PODE rodar** se o artifact de Research não existir.

```
╔══════════════════════════════════════════════════════════════════════╗
║  GATE: ARTIFACT CHECK — antes de iniciar Specify                   ║
╠══════════════════════════════════════════════════════════════════════╣
║                                                                      ║
║  Specify depende de: features/[name]/research.md (de Research)     ║
║                                                                      ║
║  □  research.md existe em features/[name]/                          ║
║  □  research.md foi lido e compreendido                             ║
║  □  Findings respondem às questões de pesquisa                       ║
║                                                                      ║
╠══════════════════════════════════════════════════════════════════════╣
║  ⚠️  Se research.md NÃO EXISTE → BLOQUEIA.                           ║
║  ⚠️  Mensagem: "Specify requer research.md. Execute /lspec research."║
╚══════════════════════════════════════════════════════════════════════╝
```

---

## AUTO-DETECÇÃO

Primeiro, verifique se existe contexto prévio:

```bash
# Verificar estado atual
if [ -f ".specs/features/[name]/STATE.md" ]; then
  echo "HAS_STATE"
elif [ -f ".specs/features/[name]/spec.md" ]; then
  echo "HAS_SPEC"
else
  echo "FRESH"
fi
```

**Matriz de decisões:**

| Contexto | Ação |
|----------|------|
| FRESH + nome de feature | Criar spec do zero |
| HAS_STATE | Continuar da fase salva |
| HAS_SPEC | Oferecer revisão/evolução |
| Discuss? completo | Usar contexto do Discuss |

---

## Autosave de Estado

**OBRIGATÓRIO:** Salvar estado após cada fase.

Salvar em `features/[name]/STATE.md`:

```markdown
# State: [feature-name]

## Last Updated
[ISO timestamp]

## Current Phase
[Phase name]

## Phase Data
[Fase atual com respostas coletadas]

## Progress
- [x] Discovery
- [ ] Discuss
- [x] Specify (in progress)
- [ ] Clarify
- [ ] Design
- [ ] Tasks
- [ ] Execute

## Notes
[Observações da sessão]
```

---

## Fase 1: Define (OBRIGATÓRIO)

Coletar informação antes de escrever. Seja parceiro de pensamento.

**Perguntas-chave:**

1. Qual problema estamos resolvendo?
2. Quem é o usuário e qual a dor?
3. Como seria o sucesso?
4. O que está fora do escopo?

**Desafie vagueza:**
- "Bom" significa o que?
- "Usuários" são quem?
- "Simples" significa como?
- "Me walk through usando isso"
- "O que isso realmente parece?"

> **AUTOSAVE:** Salvar estado após completar Define

---

## Fase 2: Discuss (OPCIONAL)

Discussão em profundidade sobre detalhes técnicos ou escopo.

**Perguntas quando necessário:**

- Quais são as restrições (tempo, tech, recursos)?
- O que já foi tentado antes?
- Quais são os pontos de decisão?

**Pular se:** Contexto do Discovery ou Discuss já cobriu isso.

> **AUTOSAVE:** Salvar estado se passou por Discuss

---

## Fase 3: Specify (OBRIGATÓRIO)

Escrever spec completo com user stories e critérios de aceite.

### 3.1 User Stories com Prioridades

**P1 = MVP** (deve lançar), **P2** (deveria ter), **P3** (nice to have)

Cada story **DEVE** ser independente testável.

### 3.2 Critérios de Aceitação

Formato **QUANDO/ENTÃO/SHALL**:

- QUANDO [evento/ação] ENTÃO [sistema] SHALL [resposta/comportamento]

### 3.3 Edge Cases

- O que quebra? O que está vazio? O que é enorme?
- O que acontece com input inválido?
- O que acontece com timeout?

> **AUTOSAVE:** Salvar estado com spec draft

---

## Fase 4: Clarify (OPCIONAL)

Revisão e esclarecimento do spec.

**Checklist:**
- [ ] Todos os termos definidos?
- [ ] TODOS os critérios de aceite são testáveis?
- [ ] Out of scope claro?
- [ ] IDs de requisito únicos?

**Corrigir vagueza:**
- Substituir "deve ser rápido" → "SHALL responder em <200ms"
- Substituir "boa UX" → criteria específicos
- Substituir "seguro" →具体的な controles

> **AUTOSAVE:** Salvar estado com spec clarificado

---

## Fase 5: Design (OPCIONAL)

Decisões de design técnicas (API, schema, fluxo).

**Se necessário:**
- Diagrama de fluxo
- API endpoints
- Data model
- Dependencies

> **AUTOSAVE:** Salvar estado com design decisions

---

## Output Final

```
features/
└── [name]/
    ├── STATE.md      # Autosave em cada fase
    ├── spec.md       # Especificação final
    └── design/       # Opcional
        └── [files]
```

---

## Template: `features/[name]/spec.md`

```markdown
# [Feature Name] Specification

## Problem Statement

[Describe the problem in 2-3 sentences. What pain point? Why now?]

## Goals

- [ ] [Primary goal with measurable outcome]
- [ ] [Secondary goal with measurable outcome]

## Out of Scope

Explicitly excluded items.

| Feature | Reason |
|---------|--------|
| [X] | [Why excluded] |

---

## User Stories

### P1: [Story Title] ⭐ MVP

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P1**: [Critical for MVP]

**Acceptance Criteria**:

1. WHEN [user action/event] THEN system SHALL [expected behavior]
2. WHEN [user action/event] THEN system SHALL [expected behavior]
3. WHEN [edge case] THEN system SHALL [graceful handling]

**Independent Test**: [How to verify this story works alone]

---

### P2: [Story Title]

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P2**: [Not MVP but important]

**Acceptance Criteria**:

1. WHEN [event] THEN system SHALL [behavior]
2. WHEN [event] THEN system SHALL [behavior]

---

### P3: [Story Title]

**User Story**: As a [role], I want [capability] so that [benefit].

**Why P3**: [Nice-to-have]

**Acceptance Criteria**:

1. WHEN [event] THEN system SHALL [behavior]

---

## Edge Cases

- WHEN [boundary] THEN system SHALL [behavior]
- WHEN [error] THEN system SHALL [handling]
- WHEN [invalid input] THEN system SHALL [validation]

---

## Requirement Traceability

| ID | Story | Phase | Status |
|----|-------|-------|--------|
| [FEAT]-01 | P1: [Story] | Specify | Pending |
| [FEAT]-02 | P1: [Story] | Specify | Pending |
| [FEAT]-03 | P2: [Story] | Specify | Pending |

**Status:** Pending → In Design → In Tasks → Implementing → Verified

---

## Success Criteria

How we know this is successful:

- [ ] [Measurable outcome]
- [ ] [Measurable outcome]
```

---

## Validation Checklist

Antes de mover para Tasks:

- [ ] User stories com prioridades P1/P2/P3
- [ ] Todos os critérios de aceite em formato QUANDO/ENTÃO/SHALL
- [ ] TODOS os critérios são testáveis
- [ ] Edge cases documentados
- [ ] Out of scope definido
- [ ] IDs de requisito únicos
- [ ] Estado salvo em STATE.md
- [ ] **APROVAÇÃO do usuário obtida**

---

## Tips
- **P1 = Vertical Slice** — demo-able, não só backend ou frontend
- **Se não consegue testar, reescreva** — critérios não-testáveis = não-spec
- **IDs obrigatórios** — rastreabilidade é crítica
- **Autosave em cada fase** — nunca perca progresso
- **Confirme antes de avançar** — usuário aprova spec

---

## Fluxo de Continuação

**Specify completo.** Spec aprovado e salvo em `features/[name]/spec.md`.

→ Deseja avançar para **Tasks** (obrigatório)?

Se não: salve estado em `STATE.md` e aguarde novas instruções.

---