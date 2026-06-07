---
name: lspec-validate
description: "Validates implemented feature against specification."
---

# lspec-validate Skill

## Purpose

Validate the implemented feature against the specification. This skill verifies that all acceptance criteria are met.

---

## When to Use

Use Validate when:
- All tasks in Tasks phase are complete
- User requests validation
- Preparing for deployment
- Closing a feature

---

## Validation Process

### 1. Read Specification

Read `features/[name]/spec.md` to understand acceptance criteria.

### 2. Verify Each Criterion

For each acceptance criterion:

```
GIVEN [precondition]
WHEN [action/event]
THEN [expected outcome]

Verification:
- [ ] Automated test exists and passes
- [ ] Manual test performed
- [ ] Evidence documented
```

### 3. Check User Stories

For each user story:

```
User Story: As a [role], I want [capability] so that [benefit]

Verification:
- [ ] All acceptance criteria met
- [ ] Edge cases handled
- [ ] Error states handled
```

### 4. Document Results

Create validation report:

```markdown
# Validation Report: [name]

## Summary
[Pass/Fail with summary]

## Acceptance Criteria Verification

| ID | Criterion | Status | Evidence |
|----|-----------|--------|----------|
| AC-01 | [Criterion] | ✅ PASS | [Test name/log] |
| AC-02 | [Criterion] | ❌ FAIL | [Issue description] |

## User Story Verification

| ID | Story | Status | Notes |
|----|-------|--------|-------|
| US-01 | [Story] | ✅ PASS | [Notes] |
| US-02 | [Story] | ⚠️ PARTIAL | [Notes] |

## Issues Found

### Critical
- [Issue description]

### High
- [Issue description]

### Medium
- [Issue description]

### Low
- [Issue description]

## Recommendations

- [ ] Ready for deployment
- [ ] Needs fixes before deployment
- [ ] Requires re-specification
```

---

## Validation Checklist

- [ ] All P1 acceptance criteria verified
- [ ] All P2 acceptance criteria verified
- [ ] All P3 acceptance criteria verified
- [ ] Edge cases tested
- [ ] Error states tested
- [ ] Performance criteria met
- [ ] Security criteria met
- [ ] Documentation complete
- [ ] Validation report saved

---

## Integration with lspec

This skill works together with:
- `lspec-specify`: For specification context
- `lspec-tasks`: For task list
- `lspec-execute`: For implementation context
