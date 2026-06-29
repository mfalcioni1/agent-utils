# backend-ai-orchestration

## Summary

**LangChain / LlamaIndex** LLM orchestration for structured extraction pipelines, model routing (Claude vs GPT-4o-mini), Zero-Data Retention constraints, and the **Diff & Accept** session-review pattern.

## Tags

`langchain`, `llamaindex`, `claude`, `openai`, `nlp`, `structured-output`, `zdr`, `rag`

## Includes

- **Rule:** `rules/ai-orchestration.mdc`
- **Skill:** `skills/ai-session-review-pipeline/`

## When to use

- Entity reconciliation, todo extraction, timeline routing from note text
- End-of-session review wizard (user approves AI suggestions before graph commits)
- Coaching, role-play, or briefing features requiring empathetic LLM responses
- Semantic search / RAG over note embeddings (pgvector)

## When NOT to use

- Simple static prompts with no structured output → lighter inline pattern
- LLM provider without ZDR when handling HR-sensitive note content
- Replacing user-authored note text without explicit approval UI

## Pairs with

- [backend-celery-redis](../backend-celery-redis/PACKAGE.md)
- [backend-postgresql-pgvector](../backend-postgresql-pgvector/PACKAGE.md)
- [frontend-expo-react-native](../frontend-expo-react-native/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\backend-ai-orchestration\rules\* my-app\.agents\rules\
Copy-Item -Recurse packages\backend-ai-orchestration\skills\* my-app\.agents\skills\
```

Domain terminology (direct reports, touchbases) stays in the app repo's project rules.
