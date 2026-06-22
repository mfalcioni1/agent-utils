# GCP Deploy Reference

Replace placeholders with values from the target project's `AGENTS.md` or user request.

## IAM roles (minimum)

| Principal | Role | Purpose |
|-----------|------|---------|
| Cloud Build SA | `roles/run.admin` | Deploy Cloud Run |
| Cloud Build SA | `roles/artifactregistry.writer` | Push images |
| Cloud Build SA | `roles/secretmanager.secretAccessor` | Read secrets at deploy |
| Firebase deploy user | `roles/firebasehosting.admin` | Deploy hosting |

## Artifact Registry setup

```bash
gcloud config set project {GCP_PROJECT}
gcloud artifacts repositories create {ARTIFACT_REPO} \
  --repository-format=docker \
  --location={REGION}
```

## cloudbuild.yaml skeleton

```yaml
steps:
  - name: 'node:20'
    dir: '{FRONTEND_DIR}'
    entrypoint: npm
    args: ['ci']
    env:
      - 'VITE_API_URL=${_API_URL}'

  - name: 'node:20'
    dir: '{FRONTEND_DIR}'
    entrypoint: npm
    args: ['run', 'build']

  - name: 'gcr.io/$PROJECT_ID/firebase'
    args: ['deploy', '--only', 'hosting', '--project', '$PROJECT_ID']

  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', '${_IMAGE}', './{BACKEND_DIR}']

  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', '${_IMAGE}']

  - name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
    entrypoint: gcloud
    args:
      - 'run'
      - 'deploy'
      - '{CLOUD_RUN_SERVICE}'
      - '--image=${_IMAGE}'
      - '--region={REGION}'
      - '--platform=managed'

substitutions:
  _API_URL: 'https://{CLOUD_RUN_SERVICE}-XXXX-{REGION}.a.run.app'
  _IMAGE: '{REGION}-docker.pkg.dev/{GCP_PROJECT}/{ARTIFACT_REPO}/api:latest'
```

## CORS

Backend `CORS_ORIGINS` must include:

- `https://{GCP_PROJECT}.web.app`
- `https://{GCP_PROJECT}.firebaseapp.com`
- Custom domain(s) if configured
- `capacitor://localhost` (when native Capacitor builds ship)

## Secret Manager pattern

```bash
echo -n "postgresql://..." | gcloud secrets create database-url --data-file=-
gcloud run services update {CLOUD_RUN_SERVICE} \
  --set-secrets "DATABASE_URL=database-url:latest"
```

Never bake secrets into Docker images or frontend bundles.

## Firebase hosting config

If `firebase.json` lives outside repo root:

```bash
firebase deploy --only hosting --config {FIREBASE_CONFIG} --project {GCP_PROJECT}
```

Ensure `public` in firebase.json points at the frontend build output relative to the config file.
