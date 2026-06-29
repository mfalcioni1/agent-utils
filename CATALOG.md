# Package Catalog

Pick packages for your project. Each row links to `PACKAGE.md` for scope and adoption.

## Recommended bundles

### React Vite PWA + FastAPI on GCP (Firebase Hosting + Cloud Run)

| Package | Required |
|---------|----------|
| [bootstrap-monorepo-react-vite-pwa-fastapi](packages/bootstrap-monorepo-react-vite-pwa-fastapi/PACKAGE.md) | Yes |
| [deploy-gcp-firebase-hosting-cloud-run-pwa](packages/deploy-gcp-firebase-hosting-cloud-run-pwa/PACKAGE.md) | Yes |
| [frontend-react-vite](packages/frontend-react-vite/PACKAGE.md) | Yes |
| [frontend-pwa-vite-plugin](packages/frontend-pwa-vite-plugin/PACKAGE.md) | Yes |
| [frontend-mobile-first](packages/frontend-mobile-first/PACKAGE.md) | Recommended |
| [backend-fastapi-python](packages/backend-fastapi-python/PACKAGE.md) | Yes |
| [meta/agent-workflow](meta/agent-workflow/PACKAGE.md) | Recommended |

Optional add-ons: [frontend-capacitor-native-port](packages/frontend-capacitor-native-port/PACKAGE.md), [frontend-pixel-art](packages/frontend-pixel-art/PACKAGE.md)

### Aery Note (Expo + FastAPI + PostgreSQL)

Stack defined in the app repo's `docs/PROJECT.md` (aery Note) — cross-platform note app with AI pipelines and multi-tenant Postgres.

| Package | Required |
|---------|----------|
| [bootstrap-monorepo-expo-react-native-fastapi](packages/bootstrap-monorepo-expo-react-native-fastapi/PACKAGE.md) | Yes |
| [frontend-expo-react-native](packages/frontend-expo-react-native/PACKAGE.md) | Yes |
| [backend-fastapi-python](packages/backend-fastapi-python/PACKAGE.md) | Yes |
| [backend-postgresql-pgvector](packages/backend-postgresql-pgvector/PACKAGE.md) | Yes |
| [backend-celery-redis](packages/backend-celery-redis/PACKAGE.md) | Yes |
| [backend-ai-orchestration](packages/backend-ai-orchestration/PACKAGE.md) | Yes |
| [meta/agent-workflow](meta/agent-workflow/PACKAGE.md) | Recommended |

Deploy package TBD when hosting target is chosen (GCP Cloud Run API + Expo EAS is a common pairing).

---

## All packages

### Deploy

| Package | Paradigm | Tags |
|---------|----------|------|
| [deploy-gcp-firebase-hosting-cloud-run-pwa](packages/deploy-gcp-firebase-hosting-cloud-run-pwa/PACKAGE.md) | Static SPA/PWA on Firebase Hosting + containerized API on Cloud Run | `gcp`, `firebase`, `cloud-run`, `pwa`, `spa`, `vite` |

**Future slots** (not yet implemented): `deploy-gcp-cloud-run-api-only`, `deploy-gcp-gke`, `deploy-gcp-cloud-functions`

### Bootstrap

| Package | Paradigm | Tags |
|---------|----------|------|
| [bootstrap-monorepo-react-vite-pwa-fastapi](packages/bootstrap-monorepo-react-vite-pwa-fastapi/PACKAGE.md) | Monorepo scaffold: React + Vite + PWA plugin + FastAPI + GCP infra skeleton | `bootstrap`, `monorepo`, `react`, `vite`, `pwa`, `fastapi` |
| [bootstrap-monorepo-expo-react-native-fastapi](packages/bootstrap-monorepo-expo-react-native-fastapi/PACKAGE.md) | Monorepo scaffold: Expo + RN Web + FastAPI + PostgreSQL + Celery/Redis | `bootstrap`, `monorepo`, `expo`, `react-native`, `fastapi`, `postgresql` |

### Frontend

| Package | Paradigm | Tags |
|---------|----------|------|
| [frontend-react-vite](packages/frontend-react-vite/PACKAGE.md) | React + TypeScript + Vite conventions | `react`, `vite`, `typescript` |
| [frontend-pwa-vite-plugin](packages/frontend-pwa-vite-plugin/PACKAGE.md) | PWA via `vite-plugin-pwa` | `pwa`, `vite`, `service-worker` |
| [frontend-mobile-first](packages/frontend-mobile-first/PACKAGE.md) | Touch-first layout, safe areas, Capacitor-safe UI | `mobile`, `responsive`, `touch` |
| [frontend-pixel-art](packages/frontend-pixel-art/PACKAGE.md) | Pixel-art visual style + component skill | `pixel-art`, `retro`, `game-ui` |
| [frontend-capacitor-native-port](packages/frontend-capacitor-native-port/PACKAGE.md) | Capacitor wrap audit + app-store port workflow | `capacitor`, `ios`, `android`, `native` |
| [frontend-expo-react-native](packages/frontend-expo-react-native/PACKAGE.md) | Expo + React Native Web + Lexical/TipTap editor conventions | `expo`, `react-native`, `typescript`, `lexical` |

### Backend

| Package | Paradigm | Tags |
|---------|----------|------|
| [backend-fastapi-python](packages/backend-fastapi-python/PACKAGE.md) | FastAPI structure, OpenAPI, async | `fastapi`, `python`, `api` |
| [backend-postgresql-pgvector](packages/backend-postgresql-pgvector/PACKAGE.md) | PostgreSQL + pgvector embeddings + RLS multi-tenant | `postgresql`, `pgvector`, `rls` |
| [backend-celery-redis](packages/backend-celery-redis/PACKAGE.md) | Celery background workers with Redis broker | `celery`, `redis`, `async` |
| [backend-ai-orchestration](packages/backend-ai-orchestration/PACKAGE.md) | LangChain LLM routing, ZDR, session review pipeline | `langchain`, `claude`, `openai`, `nlp` |

### Meta

| Package | Paradigm | Tags |
|---------|----------|------|
| [agent-workflow](meta/agent-workflow/PACKAGE.md) | Generic agent working agreements | `meta`, `workflow` |

---

## Project context template

Add to your app's `AGENTS.md` when using GCP deploy packages:

```markdown
## Deploy context

| Variable | Value |
|----------|-------|
| GCP project | `my-app-dev` |
| Cloud Run service | `my-app-api` |
| Artifact Registry repo | `my-app` |
| Region | `us-central1` |
| Firebase config | `infra/firebase.json` |
| Frontend dir | `frontend/` |
| Backend dir | `backend/` |
| Health endpoint | `/health` |
```

Skills resolve `{GCP_PROJECT}` and related placeholders from this table or the user's request.

### aery Note stack context

Add to `AGENTS.md` when using the Expo + FastAPI bundle:

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
| Product PRD | `docs/PROJECT.md` |
```
