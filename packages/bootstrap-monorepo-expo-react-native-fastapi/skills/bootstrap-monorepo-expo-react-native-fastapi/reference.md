# Expo + FastAPI Monorepo Bootstrap Reference

Replace `{APP_NAME}`, `{FRONTEND_DIR}`, `{BACKEND_DIR}` with project values.

## Frontend dependencies (baseline)

```json
{
  "dependencies": {
    "expo": "~52.0.0",
    "expo-router": "~4.0.0",
    "react": "18.3.1",
    "react-native": "0.76.0",
    "react-native-web": "~0.19.13",
    "react-dom": "18.3.1"
  }
}
```

Add Lexical (`@lexical/react`) or TipTap (`@tiptap/react`) when implementing the note editor.

## Backend pyproject.toml essentials

```toml
[project]
name = "{APP_NAME}-backend"
version = "0.1.0"
requires-python = ">=3.12"
dependencies = [
    "fastapi>=0.115.0",
    "uvicorn[standard]>=0.32.0",
    "pydantic-settings>=2.0.0",
    "sqlalchemy[asyncio]>=2.0.0",
    "asyncpg>=0.30.0",
    "celery[redis]>=5.4.0",
    "pgvector>=0.3.0",
    "langchain>=0.3.0",
    "langchain-anthropic>=0.3.0",
    "langchain-openai>=0.2.0",
]

[project.optional-dependencies]
dev = ["httpx>=0.28.0", "pytest>=8.0.0", "pytest-asyncio>=0.24.0"]
```

Use latest stable at scaffold time.

## docker-compose.yml skeleton

```yaml
services:
  db:
    image: pgvector/pgvector:pg16
    environment:
      POSTGRES_USER: app
      POSTGRES_PASSWORD: app
      POSTGRES_DB: app
    ports: ["5432:5432"]
    volumes: ["pgdata:/var/lib/postgresql/data"]

  redis:
    image: redis:7-alpine
    ports: ["6379:6379"]

  api:
    build: {BACKEND_DIR}
    command: uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
    env_file: .env
    ports: ["8000:8000"]
    depends_on: [db, redis]

  worker:
    build: {BACKEND_DIR}
    command: celery -A app.worker.celery_app worker --loglevel=info
    env_file: .env
    depends_on: [db, redis]

volumes:
  pgdata:
```

## Dockerfile (backend)

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY pyproject.toml .
RUN pip install --no-cache-dir .
COPY app ./app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
```

## pgvector bootstrap SQL

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

## AGENTS.md context block

```markdown
## Stack context

| Variable | Value |
|----------|-------|
| Frontend dir | `frontend/` |
| Backend dir | `backend/` |
| Database | PostgreSQL 16 + pgvector |
| Task queue | Celery + Redis |
| LLM (nuance) | Claude 3.5 Sonnet |
| LLM (utility JSON) | GPT-4o-mini |
```

## Verify checklist

- [ ] `{FRONTEND_DIR}/app.json` with web platform enabled
- [ ] `{FRONTEND_DIR}/src/api/` and `src/platform/` stubs
- [ ] `{BACKEND_DIR}/app/main.py` with `/health`
- [ ] `{BACKEND_DIR}/app/worker/celery_app.py`
- [ ] `{INFRA_DIR}/db/migrations/` with pgvector extension
- [ ] `docker-compose.yml` with api, worker, db, redis
- [ ] `.env.example` with all required keys
- [ ] `AGENTS.md` with stack context
