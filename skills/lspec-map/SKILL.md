---
name: lspec-map
description: "Maps skill capabilities to user intent."
---

# lspec-map Skill

## Purpose

Map user intent to the appropriate skill and determine the required pipeline phases.

---

## Intent Categories

### 1. Feature Development

**User says:** "I want to build...", "Create a feature...", "Implement..."

**Pipeline:** Discovery → Research → Specify → Clarify? → Design? → Tasks → Execute

**Entry skill:** `lspec-discovery`

### 2. Requirement Clarification

**User says:** "I need to clarify...", "Not sure about...", "Ambiguous..."

**Pipeline:** Specify → Clarify

**Entry skill:** `lspec-specify` (continue from specify)

### 3. Task Decomposition

**User says:** "Break down...", "Create tasks...", "Plan implementation..."

**Pipeline:** Tasks

**Entry skill:** `lspec-tasks`

### 4. Implementation

**User says:** "Implement...", "Build...", "Code..."

**Pipeline:** Execute

**Entry skill:** `lspec-execute`

### 5. Discussion

**User says:** "Discuss...", "Let's talk about...", "Validate..."

**Pipeline:** Discuss

**Entry skill:** `lspec-discuss`

### 6. Research

**User says:** "Research...", "Investigate...", "Gather information..."

**Pipeline:** Research

**Entry skill:** `lspec-research`

### 7. Help

**User says:** "Help...", "How do I...", "What is..."

**Entry skill:** `lspec-help`

---

## Skill Mapping Table

| User Intent | Primary Skill | Secondary Skills | Pipeline |
|-------------|---------------|------------------|----------|
| New feature | lspec-discovery | lspec-research, lspec-specify | Full |
| Clarify requirements | lspec-specify | lspec-clarify | Specify |
| Design architecture | lspec-design | lspec-specify | Design |
| Create tasks | lspec-tasks | lspec-specify, lspec-design | Tasks |
| Implement | lspec-execute | lspec-tasks | Execute |
| Validate | lspec-validate | lspec-specify, lspec-execute | Validate |
| Discuss | lspec-discuss | lspec-discovery | Discuss |
| Research | lspec-research | lspec-discovery | Research |
| Resume work | lspec-resume | (based on state) | Auto |
| Pause work | lspec-pause | - | Pause |
| Get help | lspec-help | - | Help |

---

## Decision Tree

```
User Input
    │
    ▼
┌─────────────────────┐
│ Identify Intent     │
└─────────────────────┘
    │
    ▼
┌─────────────────────┐
│ Check for existing │
│ state │
└─────────────────────┘
    │
    ├─► HAS STATE ──► Resume from state
    │
    └─► NO STATE ──► Map to skill
                    │
                    ▼
              ┌─────────────────────┐
              │ Determine pipeline  │
              └─────────────────────┘
                    │
                    ▼
              ┌─────────────────────┐
              │ Select entry skill  │
              └─────────────────────┘
```

---

## State-Based Navigation

If user has existing work:

```
1. Read STATE.md
2. Identify current phase
3. Offer to continue or restart
4. If continue: use appropriate skill
5. If restart: clear state and start fresh
```

---

## Intent Examples

### Example 1: New Feature

**User:** "I want to add user authentication"

**Mapping:**
- Intent: Feature Development
- Primary skill: lspec-discovery
- Pipeline: Full (Discovery → Research → Specify → Tasks → Execute)

### Example 2: Continue Work

**User:** "Continue with the auth feature"

**Mapping:**
- Intent: Resume
- Check state: Current phase is Tasks
- Primary skill: lspec-tasks (continue)
- Pipeline: Tasks → Execute

### Example 3: Clarification

**User:** "The email validation requirements are unclear"

**Mapping:**
- Intent: Requirement Clarification
- Primary skill: lspec-clarify
- Pipeline: Clarify → Design? → Tasks

### Example 4: Help

**User:** "How do I create a new feature?"

**Mapping:**
- Intent: Help
- Primary skill: lspec-help
- Response: Help documentation

---

## Mapping Output

When mapping is complete, provide:

```
Intent: [Category]
Primary Skill: [skill-name]
Pipeline: [phases]
State: [existing|new]

→ Proceed with [skill-name]?
```

---

## Integration with lspec

This skill is the entry point for all lspec operations:
- `lspec-discovery`: For new features
- `lspec-research`: For research phase
- `lspec-specify`: For specification
- `lspec-clarify`: For clarification
- `lspec-design`: For design
- `lspec-tasks`: For tasks
- `lspec-execute`: For execution
- `lspec-validate`: For validation
- `lspec-discuss`: For discussion
- `lspec-resume`: For resuming work
- `lspec-pause`: For pausing work
- `lspec-help`: For help
