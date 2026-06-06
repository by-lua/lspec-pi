<p align="center">
  <img src="https://img.shields.io/badge/Skill-L--Spec%20PI-blue?style=for-the-badge" alt="skill badge" />
  <img src="https://img.shields.io/badge/Mode-Discovery%20Adaptive-green?style=for-the-badge" alt="discovery adaptive" />
  <img src="https://img.shields.io/badge/Version-3.0.0-purple?style=for-the-badge" alt="version" />
</p>

<h1 align="center">🎯 L-Spec PI</h1>

<p align="center">
  <strong>Spec-Driven Development para PI: discovery adaptativo, execução orientada a tarefas e continuidade real de sessão.</strong>
</p>

<p align="center">
  <strong>Maintained by:</strong> <a href="https://github.com/by-lua">by-lua</a>
</p>

<p align="center">
  <sub>Base conceitual inspirada no TLC Spec-Driven (Tech Lead's Club), com evolução prática e upgrades no ecossistema PI.</sub>
</p>

## ✨ O que é SDD e o que é o L-Spec PI?

**SDD (Spec-Driven Development)** é desenvolver por especificação primeiro e código depois.
No L-Spec PI, isso vira um fluxo prático de trabalho para IA: descoberta, definição, quebra em tarefas e execução verificável.

**L-Spec PI** organiza o trabalho em fluxo consistente, mantendo rigor e sem pular etapas essenciais.

```
┌───────────┐   ┌──────────┐   ┌──────────┐   ┌─────────┐   ┌─────────┐
│ DISCOVERY │ → │ SPECIFY  │ → │ CLARIFY* │ → │ DESIGN* │ → │  TASKS  │ → │ EXECUTE │
└───────────┘   └──────────┘   └──────────┘   └─────────┘   └─────────┘
   required        required       optional      optional      required      required

* Opcional por contexto da tarefa
```

## ❓ Por que isso existe?

A maioria das sessões de programação com IA desperdiça **40–60% dos tokens** em reescritas, esclarecimentos e "achei que você quisesse dizer...".

O **L-Spec** resolve isso especificando o que deve ser feito **antes da codificação** — assim, cada token gera valor, e não palpite.

| Sem SDD | Com L-Spec |
|---|---|
| ❌ "Crie um login pra mim" → IA tenta → reescrever → reescrever | ✅ Primeiro discovery → a IA sabe exatamente o que você precisa |
| ❌ Sem prova até o fim (ou nunca) | ✅ VERMELHO/VERDE/PORTÃO — cada feature é verificada antes de avançar |
| ❌ Conhecimento se perde quando o contexto rola | ✅ `.specs/` fica no repositório — qualquer IA continua de onde parou |
| ❌ Escopo cresce silenciosamente ("só mais uma coisa") | ✅ Fora de escopo é definido antes — mudanças viram decisões conscientes |

**Resultado:** menos reescritas, menos bugs, commits mais limpos e projetos que sobrevivem entre sessões.

## 🚀 Instalação, upgrade e remoção

### Pré-requisitos (obrigatório)

- **PI.dev** instalado e funcional

### Instalar L-Spec

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/install.sh | bash
```

### Upgrade

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/update.sh | bash
```

### Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/by-lua/lspec-pi/main/uninstall.sh | bash
```

## 🧩 Ferramentas de Navegação (built-in no PI.dev)

PI.dev fornece tools nativas de navegação — nenhuma instalação necessária:

**cymbal_* — navegação estrutural:**
- `cymbal_map`, `cymbal_search`, `cymbal_outline`, `cymbal_show`, `cymbal_refs`, `cymbal_impact`, `cymbal_importers`, `cymbal_impls`

**lsp_* — precisão técnica:**
- `lsp_goto_definition`, `lsp_find_references`, `lsp_diagnostics`, `lsp_symbols`, `lsp_rename`

## ➕ Pacotes PI opcionais (fortemente recomendados)

|| Pacote | Instalar | Por quê |
|---|---|---|
| `pi-lens` | `pi install npm:pi-lens` | LSP, linters, formatters, type-checking, análise estrutural |
| `pi-hermes-memory` | `pi install npm:pi-hermes-memory` | Memória persistente + session search + secret scanning |
| `@gotgenes/pi-subagents` | `pi install npm:@gotgenes/pi-subagents` | Subagentes autônomos estilo Claude Code |

> **Diagramas Mermaid:** PI.dev não tem package nativo. Use blocos `mermaid` inline no markdown — renders em qualquer viewer que suporte Mermaid.

## 🤖 Recomendado: L-Spec Subagents (by-lua)

Se você quer extrair mais qualidade da execução, use também a extensão:

- **Repo:** https://github.com/by-lua/lspec-subagents

Com ela, você consegue delegar por especialidade, por exemplo:

- **Opus** como **orquestrador** (coordena estratégia e divisão de trabalho)
- **Gemini** como **designer** (UX, estrutura visual, direção de interface)
- **GPT** como **executor** (implementação e entrega técnica)

Esse modelo multiagente encaixa muito bem com o L-Spec PI porque mantém discovery/spec centralizados e distribui execução com papéis claros.

## 📚 Informações Adicionais

Para configuração do PI.dev e packages, consulte a documentação oficial do lspec-pi no GitHub.

### First Commands

| What You Want           | Say This                                      |
| ----------------------- | --------------------------------------------- |
| Start a new project     | `"Initialize project"` or `"Setup project"`   |
| Work with existing code | `"Map codebase"` or `"Analyze existing code"` |
| Plan a feature          | `"Specify feature [name]"`                    |
| Resume previous work    | `"Resume work"` or `"Continue"`               |

> 💬 **Natural Conversation, Not Commands**
>
> These are trigger phrases, not strict commands. The skill works through **natural conversation** — talk to your agent like you would to a colleague. Say things like _"I want to build an authentication system"_ or _"Fix the login button, it returns 401"_. The agent understands context and intent, not just keywords.
## 📁 Project Structure

The skill creates a `.specs/` directory to organize all project documentation:

```
.specs/
├── project/
│   ├── PROJECT.md      # Vision, goals, tech stack, constraints
│   ├── ROADMAP.md      # Milestones, features, status tracking
│   └── STATE.md        # Persistent memory: decisions, blockers, learnings, todos, deferred ideas
│
├── codebase/           # Brownfield analysis (existing projects only)
│   ├── STACK.md        # Technology stack and dependencies
│   ├── ARCHITECTURE.md # Patterns, data flow, code organization
│   ├── CONVENTIONS.md  # Naming, style, coding patterns
│   ├── STRUCTURE.md    # Directory layout and modules
│   ├── TESTING.md      # Test frameworks and patterns
│   ├── INTEGRATIONS.md # External services and APIs
│   └── CONCERNS.md     # Tech debt, risks, fragile areas
│
├── features/           # Feature specifications
│   └── [feature-name]/
│       ├── spec.md     # Requirements with traceable IDs (FEAT-01, AUTH-02...)
│       ├── context.md  # User decisions for gray areas (only when needed)
│       ├── design.md   # Architecture and components (when needed)
│       └── tasks.md    # Atomic tasks with dependencies (required)
│
```

## 🔄 Fluxo L-Spec PI

### Specify (always)

**Goal:** Capture WHAT to build with testable, traceable requirements.

The agent acts as a thinking partner — not an interviewer. It asks clarifying questions, challenges vagueness, and captures requirements with traceable IDs:

```markdown
### P1: User Login ⭐ MVP

**User Story:** As a user, I want to log in so that I can access my account.

| Requirement ID | Acceptance Criteria                                                            |
| -------------- | ------------------------------------------------------------------------------ |
| AUTH-01        | WHEN user enters valid credentials THEN system SHALL authenticate and redirect |
| AUTH-02        | WHEN user enters invalid credentials THEN system SHALL display error message   |
| AUTH-03        | WHEN user is already logged in THEN system SHALL redirect to dashboard         |
```

**Discuss gray areas (auto-triggered):** When the spec has ambiguous, user-facing decisions (layout preferences, interaction patterns, error handling style), the agent automatically asks the user about them — creating a `context.md` that locks those decisions before design. This is NOT a separate phase — it only happens within Specify when ambiguity is detected.

### Design (optional)

**Goal:** Define HOW to build it. Architecture, components, what to reuse.

**Skipped when:** The change is straightforward — no architectural decisions, no new patterns. For simple features, design happens inline during Execute.

**Includes research:** Before designing with unfamiliar tech, the agent follows the **Knowledge Verification Chain** (codebase → project docs → Context7 MCP → web search → flag uncertain). It **never assumes or fabricates** — if it can't find documentation, it says so.

**Output:** `design.md` with architecture diagrams, component definitions, and integration points.

### Tasks (required)

**Goal:** Break into GRANULAR, ATOMIC tasks with clear dependencies.

Tasks sempre existe como etapa formal antes de Execute.

| ❌ Vague Task | ✅ Atomic Tasks                   |
| ------------- | --------------------------------- |
| "Create form" | T1: Create email input component  |
|               | T2: Add email validation function |
|               | T3: Create submit button          |
|               | T4: Add form state management     |

Each task includes: What (deliverable), Where (file path), Depends on (prerequisites), Reuses (existing code), Requirement (traceable ID), Done when (verifiable criteria), Commit (message format).

### Execute (always)

**Goal:** Implement one task at a time. Verify. Commit. Repeat.

Every task follows the same cycle:

```
Plan → Implement → Verify → Commit → Next
```

**Key principles:**

- **Surgical changes** — Only touch required files
- **No scope creep** — If it's not in the task, don't touch it. Capture ideas in STATE.md as Deferred Ideas
- **Verify before commit** — Check all "Done when" criteria
- **Atomic git commits** — One task = one commit, following [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)

```
feat(auth): add email validation to login form

refactor(api): extract token refresh logic into service

fix(cart): prevent negative quantity on item decrement
```

**Feature-level validation** happens after all tasks complete — including acceptance criteria checks, code quality review, and optionally interactive UAT for complex user-facing features.

## 📋 Complete Command Reference

These trigger patterns help the agent recognize your intent, but you don't need to use them verbatim. Speak naturally — the agent understands variations and context.

### Project-Level

| Trigger Pattern                              | Description                                           |
| -------------------------------------------- | ----------------------------------------------------- |
| `Initialize project`, `Setup project`        | Create PROJECT.md with vision, goals, and constraints |
| `Create roadmap`, `Plan features`            | Create ROADMAP.md with milestones and features        |
| `Map codebase`, `Analyze existing code`      | Create 7 brownfield docs for existing projects        |
| `Document concerns`, `Find tech debt`        | Identify and document codebase risks                  |
| `Record decision`, `Log blocker`, `Add todo` | Add entries to STATE.md                               |
| `Pause work`, `End session`                  | Create handoff for session continuity                 |
| `Resume work`, `Continue`                    | Load previous state and continue                      |



| Trigger Pattern                           | Description                             |
| ----------------------------------------- | --------------------------------------- |
| `Discovery`, `Start discovery`           | Run adaptive discovery and capture context |
| `Specify feature`, `Define requirements`  | Create spec.md with requirement IDs        |
| `Discuss feature`, `How should this work` | Capture user decisions for gray areas   |
| `Design feature`, `Architecture`          | Create design.md with architecture         |
| `Break into tasks`, `Create tasks`        | Create tasks.md with atomic breakdown      |
| `Implement task`, `Build`, `Execute`      | Execute specific task with verification    |
| `Validate`, `Verify work`, `UAT`          | Feature-level validation and testing       |

## 🔁 Workflow Examples

### Starting a New Project

```
You: Initialize project

Agent: I'll help you set up your project. Let me ask a few questions:
       1. What are you building?
       2. Who is it for and what problem does it solve?
       ...

You: [Answer questions]

Agent: ✅ Created .specs/project/PROJECT.md
       Next: Would you like to create a roadmap? Say "Create roadmap"
```

### Working with an Existing Codebase

```
You: Discovery + Map codebase

Agent: I'll analyze your existing codebase and document:
       - Technology stack, Architecture patterns, Coding conventions
       - Project structure, Testing infrastructure, External integrations
       - Concerns (tech debt, risks, fragile areas)

       [Analyzes codebase...]

       ✅ Created 7 brownfield docs in .specs/codebase/
       Next: Initialize project to define goals and roadmap
```



```
You: Specify feature user-authentication

Agent: [Asks clarifying questions, creates spec.md with requirement IDs]
       I notice some gray areas in the UX — how should failed login attempts behave?
       [Discusses gray areas, creates context.md]

You: Design the feature

Agent: [Researches JWT best practices via Context7, creates design.md]

You: Break into tasks

Agent: [Creates tasks.md with 8 atomic tasks + parallel execution plan]

You: Implement T1

Agent: Implementing T1: Create auth service interface
       Files: src/services/auth.interface.ts
       Approach: Define interface based on design
       Verify: Interface compiles, exports correctly

       [Implements...]

       ✅ Committed: feat(auth): create auth service interface
       Next available: T2, T3 [P] (parallel)
```

### Session Continuity

```
You: Pause work

Agent: ✅ Created .specs/HANDOFF.md
       - Feature: user-authentication
       - Completed: T1, T2 (committed)
       - In progress: T3 (70%)
       - Next session: Continue T3, then T4

--- Later, new session ---

You: Resume work

Agent: Resuming user-authentication at T3
       - Completed: T1 (auth interface), T2 (token storage)
       - In progress: T3 - auth service at src/services/auth.service.ts:45
       - Next: Complete T3, then T4 (parallel with T5)

       Continue with T3?
```

## 🧠 Context Management

The skill is designed to work within context limits:

| Load Strategy          | Documents                                   | Tokens |
| ---------------------- | ------------------------------------------- | ------ |
| **Base load** (always) | PROJECT.md, ROADMAP.md, STATE.md            | ~15k   |
| **On-demand**          | Current spec, context, design, or tasks     | +5-10k |
| **Never simultaneous** | Multiple feature specs or architecture docs | —      |

**Target:** <40k tokens loaded (20% of context)
**Reserve:** 160k+ tokens for work, reasoning, outputs

## Skills Disponíveis

| Skill | Descrição |
|----------------------- | ---------------------------------------------------------------------- |
| `lspec-discovery`      | Discovery adaptativo (BUG/FEATURE/NOVO)                               |
| `lspec-discuss`        | Capturar contexto em áreas cinzentas                                  |
| `lspec-specify`        | Requisitos com IDs rastreáveis                                        |
| `lspec-clarify`        | Resolver ambiguidades antes de especificar                            |
| `lspec-design`         | Arquitetura e design de componentes                                   |
| `lspec-tasks`          | Decomposição em tarefas atômicas                                      |
| `lspec-execute`        | Implementação + verificação + commits atômicos                        |
| `lspec-auto`           | Ciclo completo automático (todas as fases)                           |
| `lspec-ask`            | Fazer perguntas durante o processo                                    |
| `lspec-pause`          | Salvar checkpoint para continuar depois                               |
| `lspec-resume`         | Retomar de onde parou                                                 |
| `lspec-map`            | Mapear codebase existente (brownfield)                                |
| `lspec-reverse`        | Engenharia reversa: código → .specs                                   |
| `lspec-validate`       | Validação de feature e UAT interativo                                 |

## Contentores Inline

Todo o conteúdo foi distribuído inline nas skills — sem referências externas.

## ⚡ Tips for Best Results

### Do's ✅

- **Start with project initialization** — Even for existing codebases
- **Be specific about scope** — Clear boundaries prevent creep
- **Use natural language** — No need to memorize commands
- **Say "pause work" before ending** — Enables seamless resumption
- **Challenge the agent** — If something looks wrong, say so

### Don'ts ❌

- **Don't work on multiple features at once** — One feature per cycle
- **Don't ignore verification** — Every task needs a verify step
- **Don't accept vague answers** — If the agent says something fuzzy, ask for specifics

## 💡 Model Recommendation

> **Best results with modern, reasoning-capable models:**
>
> - **Claude Opus 4.6 / Sonnet 4.5** — Excellent for all phases
> - **Gemini 3 Pro / GPT 5.2** — Strong reasoning and large context window
> - **Gemini 3 Flash / Claude Haiku 4.5** — Great general-purpose performance
>
> For cost optimization, the skill will suggest when lighter models are sufficient for simple tasks like validation or session handoff.

## 🤖 Compatibility

This skill works with **any AI coding agent** that supports skills or custom instructions.

**Tested and verified on:**

| Agent                | Status    |
| -------------------- | --------- |
| Antigravity (Gemini) | ✅ Tested |
| Claude Code          | ✅ Tested |
| GitHub Copilot       | ✅ Tested |
| Cursor               | ✅ Tested |
| Opencode             | ✅ Tested |

> **Note:** If your agent supports loading custom instructions or skills, this skill should work. The agents above are simply where it has been actively tested.

## ❓ FAQ

**Q: What if my project already has code?**
A: Use `"Map codebase"` first. This creates 7 documents analyzing your existing architecture, conventions, stack, and concerns before you start adding features.

**Q: How does requirement traceability work?**
A: Each requirement gets a unique ID (e.g., `AUTH-01`) in spec.md. Tasks reference these IDs, and validation checks which requirements are verified. You get a clear trail from spec → design → task → commit.

**Q: What are atomic git commits?**
A: Each task produces exactly one commit following [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/). This means clean git history, easy bisect for debugging, and simple rollbacks when needed.

**Q: What happens if I close my session mid-task?**
A: Say `"Pause work"` before ending your session. This creates a handoff document. Next session, say `"Resume work"` to continue exactly where you left off.

**Q: Does this work with any tech stack?**
A: Yes! The skill is completely stack-agnostic. It works with any language, framework, or architecture.

**Q: What if the agent invents an API or pattern that doesn't exist?**
A: The skill enforces a strict **Knowledge Verification Chain**: codebase → project docs → Context7 MCP → web search → flag as uncertain. It NEVER fabricates information. If the agent can't find documentation, it will say "I don't know" instead of guessing.

## 📄 License

CC-BY-4.0 © [Tech Lead's Club](https://github.com/tech-leads-club)

<p align="center">
  <sub>Built with ❤️ by the Tech Lead's Club community</sub>
</p>
