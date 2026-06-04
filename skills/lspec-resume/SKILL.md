---
name: lspec-resume
description: "Resume sessão de trabalho carregando estado de HANDOFF.md, identificando posição no pipeline e propondo próxima ação estruturada."
---

# lspec-resume

Carrega `.specs/HANDOFF.md` e mostra posição atual no pipeline, propondo próxima ação.

**Referência:** `../lspec/references/session-handoff.md`

---

## Pipeline de Sessão

```
Discovery → Discuss (OPCIONAL) → Specify → Clarify (OPCIONAL) → Design (OPCIONAL) → Tasks → Execute
```

| Fase | Descrição |
|------|-----------|
| **Discovery** | Identificar objetivo e escopo da tarefa |
| **Discuss** | Discutir requisitos com usuário (opcional) |
| **Specify** | Especificar funcionalidades e estrutura |
| **Clarify** | Esclarecer ambiguidades (opcional) |
| **Design** | Criar design de código (opcional) |
| **Tasks** | Decompor em tarefas executáveis |
| **Execute** | Executar e entregar resultado |

---

## Estrutura de Saída

```
## Posição Atual
- Pipeline: [fase atual]
- Última ação: [resumo]
- Estado: [ativo/pausado/concluído]

## Próxima Ação Proposta
- Fase: [próxima fase]
- Ação: [descrição específica]
- Opções:
  1. [opção A]
  2. [opção B]
```

---

## Regras Obrigatórias

- **NUNCA** usar quick mode
- **NUNCA** usar auto-sizing
- Estrutura: apenas `features/`, sem `fixes/`
- Sempre ler HANDOFF.md antes de propor ação