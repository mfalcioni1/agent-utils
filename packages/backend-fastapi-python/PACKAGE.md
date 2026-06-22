# backend-fastapi-python

## Summary

**FastAPI** (Python) backend structure: routers, services, Pydantic v2 schemas, OpenAPI, async, CORS from env.

## Tags

`fastapi`, `python`, `api`, `openapi`, `pydantic`

## Includes

- **Rule:** `rules/fastapi-backend.mdc`

## When to use

- Python API backend with FastAPI
- Containerized API for Cloud Run (pairs with GCP deploy package)

## When NOT to use

- Django, Flask, Node/Express → different backend packages
- Serverless function handlers only

## Pairs with

- [bootstrap-monorepo-react-vite-pwa-fastapi](../bootstrap-monorepo-react-vite-pwa-fastapi/PACKAGE.md)
- [deploy-gcp-firebase-hosting-cloud-run-pwa](../deploy-gcp-firebase-hosting-cloud-run-pwa/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\backend-fastapi-python\rules\* my-app\.cursor\rules\
```

Adjust `globs` if backend dir is not `backend/`. Domain logic stays in app-specific rules.
