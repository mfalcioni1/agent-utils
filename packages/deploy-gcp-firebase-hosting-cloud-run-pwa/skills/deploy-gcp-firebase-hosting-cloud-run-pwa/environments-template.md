# Environment Variables Template

Copy relevant sections into the target project's docs or `.env.example`. Replace placeholders with project-specific values.

## cloud (GCP project `{GCP_PROJECT}`)

| Variable | Example | Notes |
|----------|---------|-------|
| `GCP_PROJECT` | `{GCP_PROJECT}` | Firebase + Cloud Run project |
| `VITE_API_URL` | Cloud Run service URL | Set after first deploy |
| `ENVIRONMENT` | `dev`, `staging`, `prod` | Backend runtime |
| `CORS_ORIGINS` | `https://{GCP_PROJECT}.web.app,https://{GCP_PROJECT}.firebaseapp.com` | Comma-separated |

Firebase Hosting URLs:

- `https://{GCP_PROJECT}.web.app`
- `https://{GCP_PROJECT}.firebaseapp.com`

## staging

| Variable | Example | Notes |
|----------|---------|-------|
| `VITE_API_URL` | `https://{CLOUD_RUN_SERVICE}-staging-xxx.run.app` | Baked into frontend build |
| `ENVIRONMENT` | `staging` | Backend runtime |
| `CORS_ORIGINS` | Staging hosting origin(s) | Comma-separated |

## prod

| Variable | Example | Notes |
|----------|---------|-------|
| `VITE_API_URL` | Custom API domain | Recommended for production |
| `ENVIRONMENT` | `prod` | Backend runtime |
| `CORS_ORIGINS` | All production hosting origins | Comma-separated |

## local

| Variable | Example | Notes |
|----------|---------|-------|
| `VITE_API_URL` | `http://localhost:8000` | Vite dev server |
| `ENVIRONMENT` | `dev` | Backend runtime |
| `CORS_ORIGINS` | `http://localhost:5173` | Vite default port |

Local dev does not require a GCP project unless env vars point at deployed services.

## Build-time vs runtime

- `VITE_*` variables are **build-time** (frontend). Rebuild to change.
- Backend env vars are **runtime** on Cloud Run. Redeploy to change.
