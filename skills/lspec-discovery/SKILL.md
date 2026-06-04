---
name: lspec-discovery
description: "Descobre e documenta contexto inicial do projeto. Discovery adaptativo — profundidade varia por tipo (novo, bug, feature)."
---

# Discovery — Contexto Inicial

**Aviso CRÍTICO:**
- Responda APENAS com perguntas da fase atual
- NUNCA pule fases ou despeje todas perguntas de uma vez
- CONFIRME antes de continuar para próxima fase
- NUNCA pule para implementação durante Discovery

**Pipeline:** Discovery → Discuss? → Specify → Clarify? → Design? → Tasks → Execute

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

## Output

```
.specs/
├── project/
│   ├── PROJECT.md
│   ├── ROADMAP.md
│   └── STATE.md
└── features/
    └── [feature]/
        └── spec.md
```

---

## Validation Checklist

- [ ] Visão em 1-2 frases
- [ ] Problema com evidência
- [ ] Escopo definido (in/out)
- [ ] Métricas de sucesso
- [ ] Primeiro marco definido