---
name: lspec-ask
description: "Faz pergunta sobre o projeto, decisão ou contexto técnico. Determina qual fase do pipeline ativar."
---

# ask

Faz pergunta para entender contexto, determinar tipo de trabalho e ativar a fase correta do pipeline.

**Aviso CRÍTICO:**
- Responda APENAS com perguntas da fase atual
- NUNCA pule fases ou despeje todas perguntas de uma vez
- CONFIRME antes de continuar para próxima fase
- NUNCA pule para implementação durante Discovery

**Pipeline:** Discovery → Discuss (OPCIONAL) → Specify → Clarify (OPCIONAL) → Design (OPCIONAL) → Tasks → Execute

---

## AUTO-DETECÇÃO (rode primeiro)

```bash
# Verificar tipo de projeto
if [ -f ".specs/project/PROJECT.md" ]; then
  echo "EXISTING"
elif [ -d ".specs/features" ]; then
  echo "EXISTING"
elif [ -d "$(find . -name '*.py' -o -name '*.js' -o -name '*.ts' 2>/dev/null | head -1)" ]; then
  echo "CODE_ONLY"
else
  echo "NEW"
fi
```

**Matriz de decisões:**

| Contexto | Ação |
|----------|------|
| EXISTING + bug na msg | Bug Flow — descubra o bug |
| EXISTING + feature na msg | Feature Flow — descubra a feature |
| EXISTING + sem contexto | "Ouvindo..." — escute o usuário |
| CODE_ONLY | Sugira `/lspec reverse` primeiro |
| NEW | 6 fases completas |

---

## Fluxo Adaptativo

**PROJETO NOVO:** 6 fases completas

**BUG:** 3 fases curtas (foco no problema)

**FEATURE:** 4 fases focadas

---

## Bug Flow (curto)

1. O que não está funcionando?
2. Qual o comportamento esperado vs atual?
3. Como reproduzir o bug?

→ Gera `features/bug-[nome]/spec.md`

---

## Feature Flow (focado)

1. O que a feature deve fazer?
2. Quem vai usar?
3. Como você sabe que está pronto?

→ Gera `features/[feature]/spec.md`

---

## Projeto Novo — 6 Fases

### Fase 1: Contexto e Problema

1. Qual o objetivo do projeto?
2. Que problema resolve? Quem tem esse problema?
3. Como sabe que é problema real?
4. O que acontece se não construir?

> CONFIRME antes de continuar

### Fase 2: Visão e Escopo

5. Como define sucesso?
6. O que é o MVP?
7. O que está fora do escopo?
8. Quem é o usuário-alvo?

> CONFIRME antes de continuar

### Fase 3: Stack Técnica

9. Qual linguagem/framework?
10. Código existente para integrar?
11. Restrições (orçamento, equipe, prazo)?

> CONFIRME antes de continuar

### Fase 4: Referências

12. Alguma referência de design?

Se houver: criar `.specs/design-references/`

> CONFIRME antes de continuar

### Fase 5: Riscos

13. O que já foi tentado antes?
14. Qual o maior risco?
15. Parte mais difícil?

> CONFIRME antes de continuar

### Fase 6: Marcos

16. Como dividir em etapas?
17. Primeira coisa que funciona?

→ Gera `PROJECT.md`

---

## Discuss (OPCIONAL)

Fase de discussão colaborativa para explorar problemas complexos, trade-offs de design ou ambiguidades. Ativada **apenas quando há incerteza** que requer deliberação antes de Specification.

### Quando Ativar

- Decisões de design com múltiplas abordagens válidas
- Trade-offs entre simplicidade, performance, manutenibilidade
- Requisitos vagos ou conflitantes
- Necessidade de alinhar expectativas entre stakeholders
- Ambiguidades que podem afetar o escopo

**NÃO usar quando:** o caminho está claro e não há ambiguidade real.

### Critérios para Ativar Discuss

Responder: "Podemos especificar isso claramente?"

| Resposta | Ação |
|----------|------|
| Sim, sem ambiguidade | Pular Discuss, ir direto para Specify |
| Sim, mas múltiplas abordagens | Ativar Discuss |
| Não, contexto insuficiente | Voltar para Discovery |

---

## Clarify (OPCIONAL)

Revisão e esclarecimento do spec.

**Checklist:**
- [ ] Todos os termos definidos?
- [ ] TODOS os critérios de aceite são testáveis?
- [ ] Out of scope claro?
- [ ] IDs de requisito únicos?

**Corrigir vagueza:**
- Substituir "deve ser rápido" → "SHALL responder em <200ms"
- Substituir "boa UX" → critérios específicos
- Substituir "seguro" → controles específicos

---

## Design (OPCIONAL)

Decisões de design técnicas (API, schema, fluxo).

**Se necessário:**
- Diagrama de fluxo
- API endpoints
- Data model
- Dependencies

**Quando PULAR esta fase:**
- Mudança direta — sem decisões arquiteturais, sem novos padrões
- Feature simples que pode ser implementada inline durante Execute
- Apenas ajustes em código existente sem mudanças estruturais

---

## Output

```
features/
└── [feature]/
    └── spec.md
```

---

## Regras

**NUNCA:**
- quick mode
- auto-sizing
- pular fases obrigatórias

**SEMPRE:**
- autosave em cada transição de fase
- confirmar antes de avançar

**Estrutura:** tudo em `features/`, sem `fixes/`

---

## Referência

Carregar referência: `../lspec/references/discuss.md`
