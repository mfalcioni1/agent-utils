# PWA Monorepo Bootstrap Reference

Replace `{APP_NAME}`, `{FRONTEND_DIR}`, `{BACKEND_DIR}` with project values.

## Frontend dependencies

```json
{
  "dependencies": {
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "react-router-dom": "^7.0.0"
  },
  "devDependencies": {
    "@types/react": "^19.0.0",
    "@types/react-dom": "^19.0.0",
    "@vitejs/plugin-react": "^4.0.0",
    "typescript": "^5.0.0",
    "vite": "^6.0.0",
    "vite-plugin-pwa": "^0.21.0"
  }
}
```

Use latest stable at scaffold time.

## vite.config.ts essentials

```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { VitePWA } from 'vite-plugin-pwa';
import path from 'path';

export default defineConfig({
  plugins: [
    react(),
    VitePWA({
      registerType: 'autoUpdate',
      manifest: {
        name: '{APP_NAME}',
        short_name: '{APP_NAME}',
        display: 'standalone',
        theme_color: '#ffffff',
        background_color: '#ffffff',
        icons: [
          { src: 'pwa-192x192.png', sizes: '192x192', type: 'image/png' },
          { src: 'pwa-512x512.png', sizes: '512x512', type: 'image/png', purpose: 'maskable' },
        ],
      },
    }),
  ],
  resolve: {
    alias: { '@': path.resolve(__dirname, 'src') },
  },
  server: {
    port: 5173,
    proxy: {
      '/api': { target: 'http://localhost:8000', changeOrigin: true },
    },
  },
});
```

## Backend pyproject.toml essentials

```toml
[project]
name = "{APP_NAME}-backend"
version = "0.1.0"
requires-python = ">=3.12"
dependencies = [
    "fastapi>=0.115.0",
    "uvicorn[standard]>=0.32.0",
    "pydantic-settings>=2.0.0",
]

[project.optional-dependencies]
dev = ["httpx>=0.28.0", "pytest>=8.0.0"]
```

## Environment variables

| Variable | Where | Purpose |
|----------|-------|---------|
| `VITE_API_URL` | frontend build | Backend base URL |
| `CORS_ORIGINS` | backend | Comma-separated allowed origins |
| `ENVIRONMENT` | backend | `dev`, `staging`, `prod` |
| `GCP_PROJECT` | deploy docs | Firebase + Cloud Run project |

## Dockerfile (backend)

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY pyproject.toml .
RUN pip install --no-cache-dir .
COPY app ./app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
```

Cloud Run expects port 8080.

## firebase.json template

```json
{
  "hosting": {
    "public": "../frontend/dist",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [{ "source": "**", "destination": "/index.html" }]
  }
}
```

Adjust `public` path relative to config file location.

## AGENTS.md deploy context block

```markdown
## Deploy context

| Variable | Value |
|----------|-------|
| GCP project | `{GCP_PROJECT}` |
| Cloud Run service | `{APP_NAME}-api` |
| Artifact Registry repo | `{APP_NAME}` |
| Region | `us-central1` |
```

## .gitignore essentials

```
node_modules/
dist/
__pycache__/
.env
.env.*
!.env.example
.venv/
```

## Verify checklist (manual)

- [ ] `{FRONTEND_DIR}/package.json` and `vite.config.ts`
- [ ] `{FRONTEND_DIR}/src/platform/` stubs
- [ ] `{FRONTEND_DIR}/src/components/MobileShell/`
- [ ] `{BACKEND_DIR}/app/main.py` with `/health`
- [ ] `docker-compose.yml`
- [ ] `{INFRA_DIR}/firebase.json`
- [ ] `AGENTS.md` with deploy context
