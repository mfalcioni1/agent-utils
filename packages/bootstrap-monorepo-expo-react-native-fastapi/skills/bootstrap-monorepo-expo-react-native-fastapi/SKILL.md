---
name: bootstrap-monorepo-expo-react-native-fastapi
description: Scaffolds or verifies an Expo React Native Web + FastAPI monorepo with PostgreSQL pgvector, Celery, and Redis. Use when bootstrapping the Aery Note stack or cross-platform note apps with async AI pipelines. Not for React Vite PWA, Django, or Capacitor-only projects.
---

# Bootstrap — Monorepo Expo + FastAPI + PostgreSQL

**Stack:** **Expo + React Native Web** client, **FastAPI** API, **PostgreSQL + pgvector**, **Celery + Redis** workers.

Pair with `backend-ai-orchestration` for session-review and entity-extraction pipelines.

## Project context

Resolve from user request or `AGENTS.md` before scaffolding:

| Placeholder | Default | Description |
|-------------|---------|-------------|
| `{APP_NAME}` | — | App display name |
| `{FRONTEND_DIR}` | `frontend` | Expo client root |
| `{BACKEND_DIR}` | `backend` | FastAPI root |
| `{INFRA_DIR}` | `infra` | Docker, SQL migrations |

## When to use

- New repo setup or "scaffold the project"
- Verifying expected files and folders exist
- After cloning before first local run

## Workflow

```
Bootstrap Progress:
- [ ] Step 1: Monorepo folders
- [ ] Step 2: Expo app (TypeScript, Expo Router, RN Web)
- [ ] Step 3: Platform abstraction + API client stubs
- [ ] Step 4: FastAPI backend + health endpoint
- [ ] Step 5: PostgreSQL migrations (pgvector extension)
- [ ] Step 6: Celery worker + Redis broker
- [ ] Step 7: docker-compose.yml (api, worker, db, redis)
- [ ] Step 8: Project docs (AGENTS.md, .env.example)
- [ ] Step 9: Verify services start
```

### Step 1: Monorepo folders

```
{FRONTEND_DIR}/
{BACKEND_DIR}/
shared/
{INFRA_DIR}/
docs/
.agents/rules/
.agents/skills/
```

Copy shared rules/skills from agent-utils packages listed in [CATALOG.md](../../CATALOG.md#aery-note-expo--fastapi--postgresql).

### Step 2: Expo scaffold

In `{FRONTEND_DIR}/`:

```bash
npx create-expo-app@latest . --template tabs
npx expo install react-native-web react-dom @expo/metro-runtime
```

Enable web in `app.json`. Set `@` path alias in `tsconfig.json` → `src/`.

### Step 3: Platform + API layer

Create `{FRONTEND_DIR}/src/platform/` (storage, notifications, device) and `{FRONTEND_DIR}/src/api/client.ts` with base URL from `EXPO_PUBLIC_API_URL`.

### Step 4: FastAPI backend

Follow `backend-fastapi-python` layout. Add `/health` returning `{"status": "ok"}`.

### Step 5: Database

Enable `pgvector` in Postgres. Place SQL migrations in `{INFRA_DIR}/db/migrations/`. See `backend-postgresql-pgvector` rule for RLS and embedding column patterns.

### Step 6: Celery worker

Add `backend/app/worker/` with Celery app bound to Redis. Register task modules for AI pipelines (entity extraction, todo parsing). See `backend-celery-redis` rule.

### Step 7: docker-compose.yml

Services: `api` (uvicorn), `worker` (celery), `db` (postgres:16 with pgvector image), `redis`.

Expose API on `8000`, Postgres on `5432`, Redis on `6379` for local dev.

### Step 8: Environment

`.env.example` at repo root:

| Variable | Purpose |
|----------|---------|
| `DATABASE_URL` | Async Postgres connection |
| `REDIS_URL` | Celery broker |
| `EXPO_PUBLIC_API_URL` | Client → API base URL |
| `CORS_ORIGINS` | Allowed client origins |
| `ANTHROPIC_API_KEY` | Claude (coaching, role-play) |
| `OPENAI_API_KEY` | GPT-4o-mini (structured JSON) |

### Step 9: Verify

```bash
docker compose up -d
curl http://localhost:8000/health
cd {FRONTEND_DIR} && npx expo start --web
```

## Additional resources

- Dependency versions and Dockerfile templates: [reference.md](reference.md)
