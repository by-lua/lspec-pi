---
name: lspec-next
description: "Determina próxima tarefa/ação baseada no estado atual."
---

# next

Determina próxima tarefa/ação baseada no estado atual.

**Carregar referência:** `../lspec/references/state-management.md + ../lspec/references/roadmap.md`

## Pipeline de Execução

```
Discovery → [Discuss*] → Specify → [Clarify*] → [Design*] → Tasks → Execute
           (OPCIONAL)         (OPCIONAL)     (OPCIONAL)
```

### Fase: Discovery
- Analisar estado atual do projeto
- Identificar contexto disponível
- Mapear histórico de ações recentes
- Detectar blockers ou dependências pendentes

### Fase: Discuss (OPCIONAL)
- Explicar reasoning ao usuário quando necessário
- Apresentar opções de caminho
- Validar alinhamento com objetivo final

### Fase: Specify
- Definir tarefa específica a executar
- Identificar arquivos/recursos afetados
- Estabelecer critérios de sucesso

### Fase: Clarify (OPCIONAL)
- Confirmar escopo quando ambíguo
- Verificar dependências de outras tarefas
- Alinhar expectativas de output

### Fase: Design (OPCIONAL)
- Definir abordagem técnica se aplicável
- Mapear sequência de operações
- Identificar risks/revert points

### Fase: Tasks
- Listar tarefas concretas a executar
- Priorizar por dependência
- Atribuir ordem de execução

### Fase: Execute
- Executar tarefas em sequência
- Validar resultados parciais
- Iterar conforme necessário

## Regras de Conduta

### NUNCA utilizar
- **Quick mode** — sempre executar análise completa antes de propor ações
- **Auto-sizing** — sempre verificar manualmente scope e blast radius

### Sempre verificar
- Impacto em arquivos relacionados antes de editar
- Estado de dependências antes de adicionar features
- Histórico de mudanças similares

## Estrutura de Output

```
## Discovery
[Estado atual identificado]

## [Discuss] (se aplicável)
[Opções apresentadas]

## Specify
[Próxima tarefa definida]

## [Clarify] (se aplicável)
[Perguntas ou confirmações necessárias]

## [Design] (se aplicável)
[Abordagem técnica definida]

## Tasks
1. [Tarefa 1]
2. [Tarefa 2]
...

## Execute
[Resultado da execução]
```

## Localização de Features

Todas as implementações devem ser organizadas em:
```
features/
└── [feature-name]/
    ├── feature.md
    └── ...
```

**NUNCA** criar estrutura `fixes/` — issues são tratados como features.

---

*Use este skill para determinar o próximo passo quando o estado atual permite prosseguir para uma nova tarefa.*
