---
name: lspec-tasks
description: Quebra a feature em tarefas atômicas com dependências, ferramentas certas e plano de execução paralelo.
---

# lspec-tasks

Quebra em tarefas **GRANULARES E ATÔMICAS**. Dependências claras. Ferramentas certas. Plano de execução paralelo.

## Quando pular

≤3 passos óbvios → listar inline no Execute, não criar tasks.md formal.

## Granularidade

| Tarefa vaga (ruim) | Tarefas granulares (bom) |
|---|---|
| "Criar formulário" | T1: Criar input de email |
| | T2: Adicionar validação de email |
| | T3: Criar botão de submit |
| | T4: Adicionar estado do formulário |
| | T5: Conectar formulário à API |
| "Implementar auth" | T1: Criar formulário de login |
| | T2: Criar formulário de registro |
| | T3: Adicionar utilitário de token |
| | T4: Criar serviço de auth |
| | T5: Adicionar proteção de rota |

**Regra:** Uma tarefa = UM componente / UMA função / UM endpoint / UMA mudança de arquivo.

## Como usar

```
/lspec tasks [feature]
```

## Processo

1. **Revisar** design.md
2. **Carregar** TESTING.md (matriz de cobertura de testes)
3. **Quebrar** em tarefas atômicas
4. **Definir** dependências
5. **Criar** plano de execução com fases (sequencial + paralelo `[P]`)
6. **Validar** granularidade, consistência, co-localização de testes

## Estrutura do tasks.md

```markdown
# [Feature] Tasks

**Design**: .specs/[feature]/design.md

---

## Execução Plan

### Fase 1 (sequencial)
1. T1: [descrição]
   - Onde: [arquivo]
   - Depende de: —
   - Reutiliza: [se aplicável]
   - Done when: [critério verificável]
   - Tests: [tipo — unit/e2e/integration/none]
   - Gate: [comando de verificação]

### Fase 2 (paralelo)
[P] T2: [descrição] → ...
[P] T3: [descrição] → ...

### Fase 3 (sequencial)
4. T4: [descrição]
   - Depende de: T2, T3
   - ...
```

## Output

`.specs/features/[feature]/tasks.md`