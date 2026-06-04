---
name: lspec-execute
description: Implementa tarefa por tarefa seguindo ciclo RED→GREEN→GATE→COMMIT. Verificação integrada em cada tarefa.
---

# lspec-execute

Implementa **UMA tarefa por vez**. Mudanças cirúrgicas. Verifica. Commita. Repete.

## Como usar

```
/lspec execute [feature]
/lspec execute T3  (tarefa específica)
```

## Ciclo obrigatório por tarefa

```
PLAN → RED → GREEN → GATE → REVIEW → COMMIT → REPETE
```

### 1. PLAN — Definir antes de codar

**OBRIGATÓRIO.** Declarar explicitamente:

1. **Suposições** — o que estou assumindo? Alguma incerteza?
2. **Arquivos** — lista APENAS arquivos que esta tarefa requer
3. **Critério de sucesso** — como vou verificar que funciona?

⚠️ **Não prossiga sem declarar isso.**

### 2. RED — Escrever teste que falha

O teste falha porque a feature não existe ainda.

### 3. GREEN — Mínima implementação para passar

Código suficiente para o teste passar — não mais.

### 4. GATE — Verificação

Rodar TODOS os testes + lint + build.

- Exit code ≠ 0 → PARA. Corrigir antes de continuar.

### 5. REVIEW

- Contagem de testes
- Desvio de spec
- Complexidade

### 6. COMMIT

Commit atômico com teste + código juntos.

## Antes de começar

Se não existe `tasks.md`, listar passos atômicos antes de escrever código:

```
## Plano de Execução

1. [Passo] → arquivos: [lista] → verificar: [como] → commit: [mensagem]
2. [Passo] → arquivos: [lista] → verificar: [como] → commit: [mensagem]
```

Se revelar >5 passos ou deps complexas → PARAR e criar tasks.md formal.

## Contexto carregado

Para cada tarefa, o sistema carrega:
- `spec.md` da feature (requisitos testáveis)
- `design.md` da feature (arquitetura)
- `tasks.md` da feature (tarefas atômicas)
- `context.md` da feature (decisões do usuário, se existir)

## Output

`.specs/features/[feature]/SUMMARY.md` com:
- Tasks completadas
- Testes executados
- Decisões tomadas
- Blockers encontrados