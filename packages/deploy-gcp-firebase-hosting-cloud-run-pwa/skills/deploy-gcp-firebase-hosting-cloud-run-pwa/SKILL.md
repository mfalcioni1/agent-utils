---
name: deploy-gcp-firebase-hosting-cloud-run-pwa
description: Deploys a Vite/React SPA or PWA to Firebase Hosting and a containerized API to Cloud Run on GCP. Use when deploying this specific Firebase Hosting + Cloud Run pattern, configuring PWA hosting, Cloud Run API releases, or setting VITE_API_URL for production builds. Not for GKE, Cloud Functions-only, or App Engine deployments.
---

# Deploy — GCP Firebase Hosting + Cloud Run (PWA/SPA)

**Paradigm:** static SPA/PWA frontend on **Firebase Hosting** + containerized API on **Cloud Run**.

This skill does not cover other GCP deploy patterns (GKE, Cloud Functions, App Engine, Cloud Storage-only static sites).

## Project context

Resolve these from the target repo's `AGENTS.md`, `.env.example`, or the user's request before running commands:

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{GCP_PROJECT}` | GCP / Firebase project ID | `my-app-dev` |
| `{REGION}` | GCP region | `us-central1` |
| `{CLOUD_RUN_SERVICE}` | Cloud Run service name | `my-app-api` |
| `{ARTIFACT_REPO}` | Artifact Registry repo name | `my-app` |
| `{FIREBASE_CONFIG}` | Path to firebase.json | `infra/firebase.json` |
| `{BACKEND_DIR}` | Backend source directory | `backend` |
| `{FRONTEND_DIR}` | Frontend source directory | `frontend` |
| `{HEALTH_PATH}` | API health check path | `/health` |
| `{HOSTING_URL}` | Firebase Hosting URL | `https://{GCP_PROJECT}.web.app` |

Firebase default hosting URLs:

- `https://{GCP_PROJECT}.web.app`
- `https://{GCP_PROJECT}.firebaseapp.com`

See [environments-template.md](environments-template.md) for env var patterns.

## Architecture

- **Frontend:** Firebase Hosting ← `{FRONTEND_DIR}/dist`
- **API:** Cloud Run ← `{BACKEND_DIR}/Dockerfile` image in Artifact Registry
- **Secrets:** GCP Secret Manager

## Preconditions

```
Deploy Checklist:
- [ ] gcloud CLI installed and authenticated
- [ ] Firebase CLI installed (`firebase login`)
- [ ] GCP project set (`gcloud config set project {GCP_PROJECT}`)
- [ ] APIs enabled: Cloud Run, Artifact Registry, Secret Manager, Cloud Build
- [ ] `.firebaserc` default project matches `{GCP_PROJECT}`
- [ ] Project context variables resolved
```

```bash
gcloud config set project {GCP_PROJECT}
firebase use {GCP_PROJECT}
```

## Workflow

### 1. Set environment

Confirm target environment (`dev`, `staging`, `prod`) and resolve `VITE_API_URL` and `CORS_ORIGINS` per [environments-template.md](environments-template.md).

### 2. Build frontend

```bash
cd {FRONTEND_DIR}
# Cloud Run URL: gcloud run services describe {CLOUD_RUN_SERVICE} --region {REGION} --format='value(status.url)'
VITE_API_URL="https://{CLOUD_RUN_SERVICE}-XXXX-{REGION}.a.run.app" npm run build
```

`VITE_API_URL` is baked at build time — set it per environment.

### 3. Deploy frontend

```bash
firebase deploy --only hosting --config {FIREBASE_CONFIG} --project {GCP_PROJECT}
```

### 4. Build and push backend image

```bash
export PROJECT_ID={GCP_PROJECT}
export REGION={REGION}
export IMAGE="${REGION}-docker.pkg.dev/${PROJECT_ID}/{ARTIFACT_REPO}/api:latest"

gcloud builds submit {BACKEND_DIR} \
  --tag "${IMAGE}" \
  --region "${REGION}"
```

### 5. Deploy Cloud Run

```bash
gcloud run deploy {CLOUD_RUN_SERVICE} \
  --image "${IMAGE}" \
  --region "${REGION}" \
  --platform managed \
  --allow-unauthenticated \
  --port 8080 \
  --set-env-vars "ENVIRONMENT=dev,CORS_ORIGINS=https://{GCP_PROJECT}.web.app,https://{GCP_PROJECT}.firebaseapp.com" \
  --set-secrets "DATABASE_URL=database-url:latest"
```

Adjust secrets and env vars per environment. `CORS_ORIGINS` must include all Firebase Hosting origins.

### 6. Smoke test

```bash
curl "https://{API_URL}{HEALTH_PATH}"
curl -s "https://{GCP_PROJECT}.web.app/manifest.webmanifest" | head
```

Verify Lighthouse PWA installability on the hosting URL.

### 7. Rollback

- **Hosting:** `firebase hosting:clone SOURCE_SITE_ID:SOURCE_VERSION TARGET_SITE_ID`
- **Cloud Run:** redeploy previous image tag from Artifact Registry

## Additional resources

- IAM and Cloud Build: [reference.md](reference.md)
- Env var template: [environments-template.md](environments-template.md)
