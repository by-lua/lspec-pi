---
name: lspec-discuss
description: "Discussão colaborativa para explorar áreas cinzentas, trade-offs e ambiguidades antes de especificar."
---

# discuss

Fase de discussão colaborativa para explorar problemas complexos, trade-offs de design ou ambiguidades. Ativada **apenas quando há incerteza** que requer deliberação antes de Specification.

## Quando Ativar

- Decisões de design com múltiplas abordagens válidas
- Trade-offs entre simplicidade, performance, manutenibilidade
- Requisitos vagos ou conflitantes
- Necessidade de alinhar expectativas entre stakeholders
- Ambiguidades que podem afetar o escopo

**NÃO usar quando:** o caminho está claro e não há ambiguidade real.

## Pipeline Completo

```
Discovery → [Discuss?] → Specify → [Clarify?] → [Design?] → Tasks → Execute
                         ↑
                         └── OPCIONAL — só quando necessário
```

### Fases Obrigatórias
- **Discovery**: Sempre. Define o contexto e problema.
- **Specify**: Sempre. Produz a especificação formal.
- **Tasks**: Sempre. Gera itens executáveis.
- **Execute**: Sempre. Realiza o trabalho.

### Fases Opcionais
- **Discuss**: Apenas quando há áreas cinzentas, trade-offs não resolvidos ou ambiguidade.
- **Clarify**: Apenas quando a especificação precisa de refinamento após discussão.
- **Design**: Apenas quando decisões arquiteturais requerem documentação explícita.

## Workflow

### 1. Autosave de Estado

A cada transição de fase, salvar estado em `features/[name]/{phase}-state.md`:

```markdown
# {phase} — {timestamp}

## Contexto
Descrição do estado atual.

## Decisões Tomadas
- ...

## Artefatos Gerados
- ...

## Próximo Passo
Proxima fase ou ação.
```

### 2. Content-Type: discuss.md

Toda discussão produz `features/[name]/discuss.md`:

```markdown
# Discuss — {feature_name}

## Contexto
Problema ou decisão a ser deliberada.

## Opções Consideradas
### Opção A: ...
- Prós: ...
- Contras: ...

### Opção B: ...
- Prós: ...
- Contras: ...

## Trade-offs Identificados
- ...

## Decisão Final
Recomendação com justificativa.

## Riscos e Mitigações
- ...
```

### 3. Critérios para Ativar Discuss

Responder: "Podemos especificar isso claramente?"

| Resposta | Ação |
|----------|------|
| Sim, sem ambiguidade | Pular Discuss, ir direto para Specify |
| Sim, mas múltiplas abordagens | Ativar Discuss |
| Não, contexto insuficiente | Voltar para Discovery |

### 4. Transição para Specify

Discuss conclude com:
- Decisão documentada em `discuss.md`
- Estado salvo em `discuss-state.md`
- Critérios claros para Specification
- Forward-port de artefatos de Discovery relevantes

## Estrutura de Diretórios

```
features/[name]/
├── discovery-state.md    # Estado final do Discovery
├── discuss-state.md      # Estado após Discuss (se aplicável)
├── discuss.md            # Conteúdo da discussão
├── specify-state.md      # Estado após Specify
├── clarify-state.md      # Estado após Clarify (se aplicável)
├── design-state.md       # Estado após Design (se aplicável)
├── tasks-state.md        # Estado após Tasks
├── SPEC.md               # Especificação formal
└── tasks.md              # Lista de tarefas
```

## Regras

- **NUNCA**: quick mode, auto-sizing, pular fases obrigatórias
- **SEMPRE**: autosave em cada transição de fase
- **Content-type**: discuss.md em features/[name]/ para discussões
- **Estrutura**: tudo em features/, sem fixes/

## Referência

Carregar referência: `../lspec/references/discuss.md`