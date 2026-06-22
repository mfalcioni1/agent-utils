# deploy-gcp-firebase-hosting-cloud-run-pwa

## Summary

Deploy a **Vite-built SPA/PWA** to **Firebase Hosting** and a **containerized API** to **Cloud Run**.

## Tags

`gcp`, `firebase-hosting`, `cloud-run`, `artifact-registry`, `pwa`, `spa`, `vite`, `secret-manager`

## Includes

- **Rule:** `rules/infra-gcp-firebase-hosting-cloud-run-pwa.mdc`
- **Skill:** `skills/deploy-gcp-firebase-hosting-cloud-run-pwa/`

## When to use

- Static frontend (React/Vite SPA or PWA) on Firebase Hosting
- Backend API in a Docker container on Cloud Run
- Monorepo with `frontend/dist` + `backend/Dockerfile`

## When NOT to use

| Instead you need… | Use / build… |
|-------------------|--------------|
| API only on Cloud Run (no Firebase) | Future: `deploy-gcp-cloud-run-api-only` |
| Kubernetes / GKE | Future: `deploy-gcp-gke` |
| Serverless functions only | Future: `deploy-gcp-cloud-functions` |
| SSR (Next.js on Cloud Run) | Different hosting skill |
| Non-GCP cloud | AWS/Azure packages (future) |

## Pairs with

- [bootstrap-monorepo-react-vite-pwa-fastapi](../bootstrap-monorepo-react-vite-pwa-fastapi/PACKAGE.md)
- [frontend-pwa-vite-plugin](../frontend-pwa-vite-plugin/PACKAGE.md)
- [backend-fastapi-python](../backend-fastapi-python/PACKAGE.md)

## Project context required

| Placeholder | Description |
|-------------|-------------|
| `{GCP_PROJECT}` | Firebase / GCP project ID |
| `{CLOUD_RUN_SERVICE}` | Cloud Run service name |
| `{ARTIFACT_REPO}` | Artifact Registry repository |
| `{REGION}` | e.g. `us-central1` |
| `{FIREBASE_CONFIG}` | Path to `firebase.json` |
| `{FRONTEND_DIR}` / `{BACKEND_DIR}` | Source directories |

## Adoption

```powershell
Copy-Item packages\deploy-gcp-firebase-hosting-cloud-run-pwa\rules\* my-app\.cursor\rules\
Copy-Item -Recurse packages\deploy-gcp-firebase-hosting-cloud-run-pwa\skills\* my-app\.cursor\skills\
```

Add deploy context table to app `AGENTS.md` (see [CATALOG.md](../../CATALOG.md)).
