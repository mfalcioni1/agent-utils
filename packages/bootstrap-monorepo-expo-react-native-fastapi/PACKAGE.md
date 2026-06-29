# bootstrap-monorepo-expo-react-native-fastapi

## Summary

Scaffold or verify a **monorepo** with **Expo + React Native Web** client, **FastAPI** backend, **PostgreSQL (pgvector)**, and **Celery + Redis** for background AI pipelines.

## Tags

`bootstrap`, `monorepo`, `expo`, `react-native`, `fastapi`, `postgresql`, `pgvector`, `celery`, `redis`, `docker-compose`

## Includes

- **Skill:** `skills/bootstrap-monorepo-expo-react-native-fastapi/`

## When to use

- New project with the Aery Note / Expo + FastAPI stack (see [Aery Note bundle](../../CATALOG.md#aery-note-expo--fastapi--postgresql))
- Verifying expected folders and services exist after clone
- Setting up local dev with Postgres, Redis, API, and worker containers

## When NOT to use

| Instead you need… | Use / build… |
|-------------------|--------------|
| React + Vite PWA | [bootstrap-monorepo-react-vite-pwa-fastapi](../bootstrap-monorepo-react-vite-pwa-fastapi/PACKAGE.md) |
| Django/Flask backend | Custom bootstrap + `backend-*` packages |
| No background workers | Omit Celery/Redis from docker-compose; skip `backend-celery-redis` |

## Pairs with

- [frontend-expo-react-native](../frontend-expo-react-native/PACKAGE.md)
- [backend-fastapi-python](../backend-fastapi-python/PACKAGE.md)
- [backend-postgresql-pgvector](../backend-postgresql-pgvector/PACKAGE.md)
- [backend-celery-redis](../backend-celery-redis/PACKAGE.md)
- [backend-ai-orchestration](../backend-ai-orchestration/PACKAGE.md)

## Project context required

| Placeholder | Default | Description |
|-------------|---------|-------------|
| `{APP_NAME}` | — | App display name |
| `{FRONTEND_DIR}` | `frontend` | Expo client root |
| `{BACKEND_DIR}` | `backend` | FastAPI root |
| `{INFRA_DIR}` | `infra` | Docker, migrations, deploy configs |

## Adoption

```powershell
Copy-Item -Recurse packages\bootstrap-monorepo-expo-react-native-fastapi\skills\* my-app\.agents\skills\
```

Add project-specific `AGENTS.md`, design docs (`docs/PROJECT.md`), and domain rules in the app repo.
