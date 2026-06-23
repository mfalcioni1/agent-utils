# bootstrap-monorepo-react-vite-pwa-fastapi

## Summary

Scaffold or verify a **monorepo** with **React + Vite + PWA plugin** frontend and **FastAPI** backend, plus optional GCP infra skeleton.

## Tags

`bootstrap`, `monorepo`, `react`, `vite`, `pwa`, `fastapi`, `docker-compose`, `platform-abstraction`

## Includes

- **Skill:** `skills/bootstrap-monorepo-react-vite-pwa-fastapi/`

## When to use

- New project with this exact frontend + backend stack
- Verifying expected folders/files exist after clone
- Setting up mobile shell, platform stubs, health endpoint

## When NOT to use

| Instead you need… | Use / build… |
|-------------------|--------------|
| Next.js or Remix | Different bootstrap package |
| Django/Flask backend | `backend-*` package + custom bootstrap |
| Single-package repo (no monorepo) | Adapt skill or lighter scaffold |
| No PWA (plain SPA) | Omit `frontend-pwa-vite-plugin` rule; adjust bootstrap step 2 |

## Pairs with

- [deploy-gcp-firebase-hosting-cloud-run-pwa](../deploy-gcp-firebase-hosting-cloud-run-pwa/PACKAGE.md)
- [frontend-react-vite](../frontend-react-vite/PACKAGE.md)
- [frontend-pwa-vite-plugin](../frontend-pwa-vite-plugin/PACKAGE.md)
- [frontend-mobile-first](../frontend-mobile-first/PACKAGE.md)
- [backend-fastapi-python](../backend-fastapi-python/PACKAGE.md)

## Project context required

| Placeholder | Default | Description |
|-------------|---------|-------------|
| `{APP_NAME}` | — | PWA manifest name |
| `{GCP_PROJECT}` | — | For `.firebaserc` |
| `{FRONTEND_DIR}` | `frontend` | Frontend root |
| `{BACKEND_DIR}` | `backend` | Backend root |

## Adoption

```powershell
Copy-Item -Recurse packages\bootstrap-monorepo-react-vite-pwa-fastapi\skills\* my-app\.agents\skills\
```

Add project-specific `AGENTS.md`, design docs, and domain rules in the app repo.
