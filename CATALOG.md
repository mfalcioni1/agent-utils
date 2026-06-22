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

### Frontend

| Package | Paradigm | Tags |
|---------|----------|------|
| [frontend-react-vite](packages/frontend-react-vite/PACKAGE.md) | React + TypeScript + Vite conventions | `react`, `vite`, `typescript` |
| [frontend-pwa-vite-plugin](packages/frontend-pwa-vite-plugin/PACKAGE.md) | PWA via `vite-plugin-pwa` | `pwa`, `vite`, `service-worker` |
| [frontend-mobile-first](packages/frontend-mobile-first/PACKAGE.md) | Touch-first layout, safe areas, Capacitor-safe UI | `mobile`, `responsive`, `touch` |
| [frontend-pixel-art](packages/frontend-pixel-art/PACKAGE.md) | Pixel-art visual style + component skill | `pixel-art`, `retro`, `game-ui` |
| [frontend-capacitor-native-port](packages/frontend-capacitor-native-port/PACKAGE.md) | Capacitor wrap audit + app-store port workflow | `capacitor`, `ios`, `android`, `native` |

### Backend

| Package | Paradigm | Tags |
|---------|----------|------|
| [backend-fastapi-python](packages/backend-fastapi-python/PACKAGE.md) | FastAPI structure, OpenAPI, async | `fastapi`, `python`, `api` |

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
