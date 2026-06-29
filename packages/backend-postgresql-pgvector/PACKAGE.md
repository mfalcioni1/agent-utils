# backend-postgresql-pgvector

## Summary

**PostgreSQL** with **pgvector** for relational data and note embeddings, plus **Row-Level Security (RLS)** for multi-tenant isolation.

## Tags

`postgresql`, `pgvector`, `rls`, `sqlalchemy`, `embeddings`, `multi-tenant`

## Includes

- **Rule:** `rules/postgresql-pgvector.mdc`

## When to use

- Primary database with semantic search or RAG over note text
- Multi-tenant apps requiring tenant isolation at the persistence tier
- FastAPI backend using async SQLAlchemy

## When NOT to use

- SQLite-only prototypes without migration path → adapt or use simpler rule
- MongoDB, DynamoDB, or Firebase-only persistence
- Vector DB as primary store (Pinecone-only) without Postgres relational data

## Pairs with

- [bootstrap-monorepo-expo-react-native-fastapi](../bootstrap-monorepo-expo-react-native-fastapi/PACKAGE.md)
- [backend-fastapi-python](../backend-fastapi-python/PACKAGE.md)
- [backend-ai-orchestration](../backend-ai-orchestration/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\backend-postgresql-pgvector\rules\* my-app\.agents\rules\
```

Adjust `globs` if migrations or models live outside `backend/`.
