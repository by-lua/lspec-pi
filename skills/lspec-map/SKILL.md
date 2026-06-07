---
name: lspec-map
description: "Mapeia codebase existente e documenta estrutura/análise. Gera 7 arquivos de documentação em .specs/codebase/."
---

# map — Mapeamento de Codebase Brownfield

**Aviso CRÍTICO:**
- MAP é 100% AUTOMÁTICO — analisa o código e gera os7 arquivos
- NUNCA faça perguntas ao usuário durante o mapeamento
- Se o projeto tem `.specs/` → analisa área específica
- Se o projeto NÃO tem `.specs/` → mapeia toda a base e gera `.specs/codebase/`

**Pipeline:**
```
Discovery → [Discuss (OPCIONAL)] → Specify → [Clarify (OPCIONAL)] → [Design (OPCIONAL)] → Tasks → Execute
```

**Proibidos:**
- ❌ quick mode
- ❌ auto-sizing
- ❌ estrutura fixes/

**Estrutura:** `features/` apenas — todo mapeamento vai em `features/[name]/`

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
| EXISTING + mapeamento | Map Flow — descubra o projeto |
| CODE_ONLY | Reverse Engineering Flow — documente o que encontrar |
| NEW | Complete Mapping — 7 fases |

---

## Map Flow (projeto existente — análise automática)

Quando o projeto JÁ tem `.specs/` mas você quer mapear uma área específica:

1. Explorar estrutura de diretórios
2. Identificar stack técnica
3. Mapear arquitetura e padrões
4. Documentar convenções
5. Catalogar integrações

→ Gera `features/[name]/codebase/STACK.md`, `ARCHITECTURE.md`, etc.

**Sem perguntas.** Analisa o código automaticamente.

---

## CODE_ONLY — Reverse Engineering Flow

Quando não há `.specs/` mas existe código:

1. Explorar estrutura de diretórios
2. Identificar stack técnica
3. Mapear arquitetura e padrões
4. Documentar convenções
5. Catalogar integrações

→ Gera `.specs/codebase/STACK.md`, `ARCHITECTURE.md`, `CONVENTIONS.md`, `STRUCTURE.md`, `TESTING.md`, `INTEGRATIONS.md`, `CONCERNS.md`

---

## Process: Brownfield Mapping

**Trigger:** "Map codebase", "Analyze existing code", "Document current architecture"

**Purpose:** Understand existing project structure before adding features.

**High-level approach:**

1. Explore directory structure systematically
2. Identify technology stack from dependency manifests
3. Extract patterns from representative code samples
4. Document observed conventions and architectures
5. Catalog external integrations
6. Identify concerns: tech debt, known bugs, security risks, performance bottlenecks, fragile areas

**Analysis depth:**

- Sample 5-10 representative files per category
- Focus on consistency and patterns, not exhaustive coverage
- Extract actual examples, not assumptions

---

## Output: 7 Files

### 1. STACK.md

**Purpose:** Document technology stack and dependencies.

**Size limit:** 2,000 tokens (~1,200 words)

**Extract from:**

- Dependency manifest files
- Build configuration
- Runtime configuration

**Document:**

```markdown
# Tech Stack

**Analyzed:** [date]

## Core

- Framework: [detected name + version]
- Language: [detected name + version]
- Runtime: [detected name + version]
- Package manager: [detected manager]

## Frontend (if applicable)

- UI Framework: [name + version]
- Styling: [approach + tools]
- State Management: [library/pattern]
- Form Handling: [library if present]

## Backend (if applicable)

- API Style: [REST/GraphQL/gRPC + framework]
- Database: [ORM/query builder + database system]
- Authentication: [library/approach]

## Testing

- Unit: [framework]
- Integration: [framework]
- E2E: [framework if present]

## External Services

- [Category]: [Service name]
- [Category]: [Service name]

## Development Tools

- [Tool category]: [Tool name]
```

**Instructions:**

- Extract from actual dependency files
- Include versions for major dependencies
- Categorize by purpose
- Note testing frameworks explicitly

---

### 2. ARCHITECTURE.md

**Purpose:** Document architectural patterns and data flow.

**Size limit:** 4,000 tokens (~2,400 words)

**Extract from:**

- Directory organization
- Code structure analysis
- Repeated patterns across files

**Document:**

```markdown
# Architecture

**Pattern:** [Identified pattern - monolith/microservices/modular/etc]

## High-Level Structure

[Create diagram/description based on actual organization]

## Identified Patterns

### [Pattern Name]

**Location:** [where this pattern lives]
**Purpose:** [what this achieves]
**Implementation:** [how it's structured]
**Example:** [reference to actual file/function]

### [Pattern Name]

[Same structure]

## Data Flow

### [Key Flow - e.g., Authentication/Payment/etc]

[Map actual flow from code analysis]

### [Key Flow]

[Map actual flow]

## Code Organization

**Approach:** [feature-based/layer-based/domain-driven/etc]

**Structure:**
[Document actual directory organization]

**Module boundaries:**
[How code is divided into modules/packages]
```

**Instructions:**

- Identify patterns from actual code, not assumptions
- Document observed architectural decisions
- Create flow diagrams for critical paths
- Reference concrete examples from codebase

---

### 3. CONVENTIONS.md

**Purpose:** Document code style and naming conventions.

**Size limit:** 3,000 tokens (~1,800 words)

**Extract from:**

- Analyzing 5-10 representative files
- Identifying consistent patterns
- Observing actual conventions in use

**Document:**

```markdown
# Code Conventions

## Naming Conventions

**Files:**
[Observed pattern - document actual approach]
Examples: [actual filenames from codebase]

**Functions/Methods:**
[Observed pattern]
Examples: [actual function names]

**Variables:**
[Observed pattern]
Examples: [actual variable names]

**Constants:**
[Observed pattern]
Examples: [actual constant names]

## Code Organization

**Import/Dependency Declaration:**
[Observed ordering pattern]
[Example from actual file]

**File Structure:**
[Observed organization within files]
[Example from actual file]

## Type Safety/Documentation

**Approach:** [Type system/documentation approach used]
[Example from actual code]

## Error Handling

**Pattern:** [Observed error handling approach]
[Example from actual code]

## Comments/Documentation

**Style:** [When/how comments are used]
[Example from actual code]
```

**Instructions:**

- Extract patterns from actual code samples
- Document observed conventions, not ideal conventions
- Include concrete examples from codebase
- Note exceptions or variations where found

---

### 4. STRUCTURE.md

**Purpose:** Document directory layout and file organization.

**Size limit:** 2,000 tokens (~1,200 words)

**Document:**

```markdown
# Project Structure

**Root:** [project root path]

## Directory Tree

[Visual tree representation - max 3 levels deep]

## Module Organization

### [Module/Area Name]

**Purpose:** [what this area handles]
**Location:** [where files live]
**Key files:** [important files in this area]

### [Module/Area Name]

[Same structure]

## Where Things Live

**[Capability/Feature]:**

- UI/Interface: [location]
- Business Logic: [location]
- Data Access: [location]
- Configuration: [location]

**[Capability/Feature]:**
[Same structure]

## Special Directories

**[Directory name]:**
**Purpose:** [what belongs here]
**Examples:** [key files in this directory]
```

**Instructions:**

- Create tree view of actual directory structure
- Limit depth to maintain readability
- Document purpose of key directories
- Map capabilities to physical locations

---

### 5. TESTING.md

**Purpose:** Document testing infrastructure and patterns.

**Size limit:** 4,000 tokens (~2,400 words)

**Document:**

```markdown
# Testing Infrastructure

## Test Frameworks

**Unit/Integration:** [framework name + version]
**E2E:** [framework name + version]
**Coverage:** [tool if used]

## Test Organization

**Location:** [where tests live]
**Naming:** [test file naming pattern]
**Structure:** [how tests are organized]

## Testing Patterns

### Unit Tests

**Approach:** [observed pattern]
**Location:** [where unit tests live]
[Description of actual pattern used]

### Integration Tests

**Approach:** [observed pattern]
**Location:** [where integration tests live]
[Description of actual pattern used]

### E2E Tests

**Approach:** [observed pattern if present]
**Location:** [where E2E tests live]
[Description of actual pattern used]

## Test Execution

**Commands:** [how to run tests]
**Configuration:** [test configuration approach]

## Coverage Targets

**Current:** [if measurable]
**Goals:** [if documented]
**Enforcement:** [if automated]

## Test Coverage Matrix

Analyze the codebase to determine which code layers require which test types.
For each layer, document the required test type, file location pattern, and run command.

| Code Layer | Required Test Type          | Location Pattern       | Run Command |
| ---------- | --------------------------- | ---------------------- | ----------- |
| [layer]    | [unit/integration/e2e/none] | [glob or path pattern] | [command]   |

## Parallelism Assessment

| Test Type | Parallel-Safe? | Isolation Model | Evidence                      |
| --------- | -------------- | --------------- | ----------------------------- |
| [type]    | [Yes/No]       | [description]   | [file/pattern that proves it] |

## Gate Check Commands

| Gate Level | When to Use                            | Command                     |
| ---------- | -------------------------------------- | --------------------------- |
| Quick      | After tasks with unit tests only       | [unit test command]         |
| Full       | After tasks with e2e/integration tests | [unit + e2e commands]       |
| Build      | After phase completion                 | [build + lint + unit + e2e] |
```

**Instructions:**

- Identify test frameworks from dependencies and code
- Document actual testing patterns observed
- Note test organization approach
- Include execution instructions
- **Test Coverage Matrix:** Sample 5-10 existing test files to identify which layers are tested and how. Look at test file locations relative to source to determine patterns. Extract run commands from `package.json`, `project.json`, `Makefile`, CI config. Mark layers with no existing tests as "none" with a note in CONCERNS.md.
- **Parallelism Assessment:** NOT parallel-safe signals: shared DB connection (same URL from config), table-level cleanup in `beforeEach`/`afterAll` (`.del()`, `DELETE FROM`, `TRUNCATE`), shared mock state reset on globals. Parallel-safe signals: per-test DB creation (Testcontainers, dynamic schema, SQLite in-memory), data namespacing (all data keyed by unique test ID), no shared mutable state between test files, all deps mocked (`jest.fn()`, `vi.fn()`).
- **Gate Check Commands:** Extract from actual project commands — do not invent commands.

---

### 6. INTEGRATIONS.md

**Purpose:** Document external service integrations.

**Size limit:** 5,000 tokens (~3,000 words)

**Document:**

```markdown
# External Integrations

## [Service Category]

**Service:** [service name]
**Purpose:** [what this integration provides]
**Implementation:** [where integration lives in code]
**Configuration:** [how service is configured]
**Authentication:** [auth approach if applicable]

## [Service Category]

[Same structure]

## API Integrations

### [API Name]

**Purpose:** [what this API provides]
**Location:** [where API client/code lives]
**Authentication:** [auth method]
**Key endpoints:** [major endpoints used]

## Webhooks

### [Webhook Source]

**Purpose:** [what events are handled]
**Location:** [webhook handler location]
**Events:** [event types processed]

## Background Jobs

**Queue system:** [system if used]
**Location:** [where job definitions live]
**Jobs:** [key background jobs]
```

**Instructions:**

- Identify integrations from code and configuration
- Document authentication approaches
- Note webhook handlers if present
- Include background job infrastructure

---

### 7. CONCERNS.md

**Purpose:** Surface actionable warnings about the codebase — tech debt, known bugs, security gaps, performance bottlenecks, fragile areas, scaling limits, risky dependencies, missing features, and test coverage gaps.

**Size limit:** 5,000 tokens (~3,000 words)

**Document:**

```markdown
# Concerns

**Analyzed:** [date]

## Tech Debt

### [Issue Name]

**Severity:** [Critical/High/Medium/Low]
**Location:** [file/path]
**Description:** [what the issue is]
**Impact:** [why this matters]
**Fix Approach:** [potential solutions]

## Known Bugs

### [Bug Name]

**Severity:** [Critical/High/Medium/Low]
**Location:** [file/path]
**Description:** [what happens]
**Reproduction:** [how to reproduce]
**Fix Approach:** [potential solutions]

## Security Risks

### [Risk Name]

**Severity:** [Critical/High/Medium/Low]
**Location:** [file/path]
**Description:** [what the risk is]
**Impact:** [potential consequences]
**Mitigation:** [recommendations]

## Performance Bottlenecks

### [Bottleneck Name]

**Severity:** [Critical/High/Medium/Low]
**Location:** [file/path/operation]
**Description:** [what causes slowdown]
**Evidence:** [measurements/logs]
**Fix Approach:** [potential solutions]

## Fragile Areas

### [Area Name]

**Severity:** [Critical/High/Medium/Low]
**Location:** [file/path]
**Description:** [why this area is fragile]
**Risk:** [what could go wrong]
**Stabilization:** [recommendations]

## Missing Features

### [Feature Name]

**Severity:** [Critical/High/Medium/Low]
**Current State:** [what exists]
**Gap:** [what's missing]
**Impact:** [why this matters]
**Recommendation:** [suggested approach]

## Test Coverage Gaps

### [Gap Name]

**Severity:** [Critical/High/Medium/Low]
**Location:** [file/path/layer]
**Description:** [what isn't tested]
**Risk:** [what could go wrong]
**Recommendation:** [suggested test approach]
```

**Instructions:**

- Document only concerns backed by evidence (file paths, measurements, reproduction steps)
- Include fix approaches, not just problems
- Omit sections with no findings
- Prioritize by risk/impact
- Use professional, solution-oriented tone

---

## Complete Mapping — 7 Fases

### Fase 1: Stack e Dependências

1. Onde estão os arquivos de configuração do projeto?
2. Qual package manager é usado?
3. Quais frameworks/main libraries?
4. Existem serviços externos integrados?

**Output:** Gera `features/[name]/codebase/STACK.md`

---

### Fase 2: Arquitetura

1. Como os diretórios estão organizados?
2. Quais padrões arquiteturais observa?
3. Qual o fluxo de dados principal?
4. Como módulos se comunicam?

**Output:** Gera `features/[name]/codebase/ARCHITECTURE.md`

---

### Fase 3: Convenções

1. Quais padrões de nomenclatura usa?
2. Como código é organizado dentro dos arquivos?
3. Como erros são tratados?
4. Há estilo de comentários consistente?

**Output:** Gera `features/[name]/codebase/CONVENTIONS.md`

---

### Fase 4: Estrutura

1. Mapeie o diretório raiz
2. Qual a divisão de módulos/áreas?
3. Onde estão localizadas cada capability?
4. Quais diretórios especiais existem?

**Output:** Gera `features/[name]/codebase/STRUCTURE.md`

---

### Fase 5: Testes

1. Quais frameworks de teste são usados?
2. Como testes estão organizados?
3. Qual o padrão de testes unitários?
4. Existem testes de integração ou E2E?

**Output:** Gera `features/[name]/codebase/TESTING.md`

---

### Fase 6: Integrações

1. Quais serviços externos são usados?
2. Como autenticação funciona?
3. Há webhooks ou background jobs?
4. Quais APIs externas são consumidas?

**Output:** Gera `features/[name]/codebase/INTEGRATIONS.md`

---

### Fase 7: Concerns

1. Identifique tech debt (código complexo, obsoleto)
2. Bugs conhecidos ou áreas frágeis
3. Riscos de segurança
4. Gargalos de performance
5. Lacunas de teste

**Output:** Gera `features/[name]/codebase/CONCERNS.md`

---

## Output Final

```
features/[name]/
├── codebase/
│   ├── STACK.md          # Technology stack e dependências
│   ├── ARCHITECTURE.md   # Padrões arquiteturais e fluxo
│   ├── CONVENTIONS.md    # Convenções de código
│   ├── STRUCTURE.md      # Estrutura de diretórios
│   ├── TESTING.md        # Infraestrutura de testes
│   ├── INTEGRATIONS.md   # Serviços externos
│   └── CONCERNS.md       # Tech debt, riscos, lacunas
└── state.md              # Estado do mapeamento
```

**NUNCA use `fixes/`** — toda documentação vai em `features/`

---

## Autosave de Estado

A cada transição de fase, salvar estado em `features/[name]/state.md`:

```markdown
# [Name] State

**Pipeline:** Discovery → [Discuss] → Specify → [Clarify] → [Design] → Tasks → Execute

**Current Phase:** Map
**Started:** YYYY-MM-DD HH:MM
**Last Updated:** YYYY-MM-DD HH:MM

## Phase Status

| Phase | Status | Timestamp |
|-------|--------|-----------|
| Map | 🔄 In Progress | ... |

## Decisions Made

- [Lista de decisões tomadas]

## Mapped Areas

- [ ] STACK.md
- [ ] ARCHITECTURE.md
- [ ] CONVENTIONS.md
- [ ] STRUCTURE.md
- [ ] TESTING.md
- [ ] INTEGRATIONS.md
- [ ] CONCERNS.md
```

---

## Validation Checklist

- [ ] STACK.md — extraído de dependency manifests reais
- [ ] ARCHITECTURE.md — padrões identificados no código, não assumidos
- [ ] CONVENTIONS.md — exemplos concretos de arquivos
- [ ] STRUCTURE.md — árvore de diretórios limitada a 3 níveis
- [ ] TESTING.md — Coverage Matrix com 5-10 samples
- [ ] INTEGRATIONS.md — autenticação e APIs documentadas
- [ ] CONCERNS.md — apenas findings com evidência

---

## Tips

- **Sample 5-10 arquivos por categoria** — foco em padrões, não exaustivo
- **Evidência concreta** — referências a arquivos reais, não suposições
- **NUNCA auto-sizing** — documentar completamente, sem atalhos
- **Consistência > Exaustão** — padrões uniformes mais valiosos que cobertura total

---

## Total Context Budget

**Combined:** ~19,000 tokens (10% of context window)
**Acceptable for:** Brownfield projects requiring codebase understanding
**Loading strategy:** Load relevant docs on-demand based on task