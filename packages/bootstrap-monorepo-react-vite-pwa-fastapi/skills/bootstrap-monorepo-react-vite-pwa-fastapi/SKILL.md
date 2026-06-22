---
name: bootstrap-monorepo-react-vite-pwa-fastapi
description: Scaffolds or verifies a React Vite PWA + FastAPI monorepo with platform abstractions, mobile shell, and GCP Firebase/Cloud Run infra skeleton. Use when bootstrapping this specific stack combination. Not for Next.js, Django, or non-PWA frontends.
---

# Bootstrap — Monorepo React Vite PWA + FastAPI

**Stack:** **React + Vite + vite-plugin-pwa** frontend, **FastAPI** backend, optional **Firebase Hosting + Cloud Run** infra skeleton.

Pair with `deploy-gcp-firebase-hosting-cloud-run-pwa` when deploying to GCP.

## Project context

Resolve from user request or `AGENTS.md` before scaffolding:

| Placeholder | Default | Description |
|-------------|---------|-------------|
| `{APP_NAME}` | — | App display name (PWA manifest) |
| `{GCP_PROJECT}` | — | Firebase/GCP project ID for `.firebaserc` |
| `{FRONTEND_DIR}` | `frontend` | Frontend root |
| `{BACKEND_DIR}` | `backend` | Backend root |
| `{INFRA_DIR}` | `infra` | Firebase, cloudbuild configs |

## When to use

- New repo setup or "scaffold the project"
- Verifying expected files and folders exist
- After cloning before first local run

## Workflow

```
Bootstrap Progress:
- [ ] Step 1: Monorepo folders
- [ ] Step 2: Vite React TS + vite-plugin-pwa
- [ ] Step 3: Platform abstraction stubs
- [ ] Step 4: Mobile shell and global styles
- [ ] Step 5: FastAPI backend + Dockerfile
- [ ] Step 6: docker-compose.yml
- [ ] Step 7: Infra skeleton (firebase, cloudbuild)
- [ ] Step 8: Project docs (AGENTS.md, design stubs)
- [ ] Step 9: Verify with script
```

### Step 1: Monorepo folders

```
{FRONTEND_DIR}/
{BACKEND_DIR}/
shared/
{INFRA_DIR}/
docs/design/
.cursor/rules/
.cursor/skills/
```

Add project-specific rules/skills (domain, identity) alongside shared copies from agent-utils.

### Step 2: Frontend scaffold

In `{FRONTEND_DIR}/`:

```bash
npm create vite@latest . -- --template react-ts
npm install vite-plugin-pwa -D
```

Configure `vite-plugin-pwa` with `registerType: 'autoUpdate'`, manifest `display: 'standalone'`, and icons. Set `@` → `src/` path alias.

### Step 3: Platform abstraction

Create `{FRONTEND_DIR}/src/platform/`:

| File | Web implementation |
|------|-------------------|
| `storage.ts` | `localStorage` wrapper |
| `notifications.ts` | Web Push stub (no-op until configured) |
| `device.ts` | `navigator.userAgent`, online status |
| `index.ts` | Re-exports |

### Step 4: Mobile shell

- `index.html`: `viewport-fit=cover`, `apple-mobile-web-app-capable`
- `src/styles/tokens.css`: CSS variables from project design tokens
- `src/styles/global.css`: safe-area reset, `100dvh`
- `src/components/MobileShell/`: safe-area padding wrapper

### Step 5: Backend scaffold

```
{BACKEND_DIR}/
├── Dockerfile
├── pyproject.toml
└── app/
    ├── main.py
    ├── config.py
    ├── routers/health.py
    ├── services/
    ├── models/
    └── schemas/
```

Health endpoint: `GET /health` → `{"status": "ok"}`

### Step 6: docker-compose.yml

Root compose with frontend dev server and backend API. Wire `VITE_API_URL` to backend.

### Step 7: Infra skeleton

- `{INFRA_DIR}/firebase.json` — SPA rewrite, public dir → frontend dist
- `.firebaserc` — default project `{GCP_PROJECT}` (from project context)
- `{INFRA_DIR}/cloudbuild.yaml` — build frontend + backend image skeleton

Use `deploy-gcp-firebase-hosting-cloud-run-pwa` skill for deploy details.

### Step 8: Project docs

Create app-specific (not shared):

- `AGENTS.md` — repo map, stack, **deploy context table**
- `docs/design/tokens.md`, `mobile-layout.md` as needed
- Domain terminology doc if applicable

### Step 9: Verify

```bash
bash .cursor/skills/bootstrap-monorepo-react-vite-pwa-fastapi/scripts/verify-bootstrap.sh
```

Or run checks manually per [reference.md](reference.md).

## Additional resources

- Package versions and config templates: [reference.md](reference.md)
