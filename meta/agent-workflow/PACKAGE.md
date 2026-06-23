# agent-workflow

## Summary

Cross-cutting **agent working agreements**: read AGENTS.md, minimize scope, use skills for multi-step work, commit only when asked.

## Tags

`meta`, `workflow`, `agent`

## Includes

- **Rule:** `rules/agent-workflow.mdc` (`alwaysApply: true`)

## When to use

- Every project using agent-utils (recommended baseline)

## When NOT to use

- Never — override with project-specific workflow rule if needed

## Pairs with

- Any package in the catalog

## Adoption

```powershell
Copy-Item meta\agent-workflow\rules\* my-app\.agents\rules\
```

Extend in the app repo with project-specific skill tables (see pidjun's `agent-workflow.mdc` for an example).
