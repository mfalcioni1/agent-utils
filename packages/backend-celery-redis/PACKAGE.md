# backend-celery-redis

## Summary

**Celery** task queue with **Redis** transport for background AI processing, todo extraction, and third-party sync — keeping the API loop responsive.

## Tags

`celery`, `redis`, `async`, `background-jobs`, `fastapi`

## Includes

- **Rule:** `rules/celery-redis.mdc`

## When to use

- Offload NLP, entity resolution, embedding generation, or integration sync from HTTP handlers
- Fire-and-forget work triggered by note session completion or webhooks
- FastAPI + Redis already in the stack

## When NOT to use

- Simple CRUD API with no background work → omit worker service
- Cloud Tasks / Pub/Sub-only GCP pattern → different package (future)
- Synchronous LLM calls in request handlers for production workloads

## Pairs with

- [bootstrap-monorepo-expo-react-native-fastapi](../bootstrap-monorepo-expo-react-native-fastapi/PACKAGE.md)
- [backend-ai-orchestration](../backend-ai-orchestration/PACKAGE.md)
- [backend-fastapi-python](../backend-fastapi-python/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\backend-celery-redis\rules\* my-app\.agents\rules\
```
