# agent-utils

A **toolbox** of reusable Cursor rules and skills. Each package is self-contained and explicitly named for its stack and paradigm — grab only what a project needs.

Project-specific values (GCP project ID, app name, domains) live in the **target repo** (`AGENTS.md`, `.env.example`, or the user's request), not in these packages.

## How the toolbox is organized

```
agent-utils/
├── CATALOG.md              ← start here: pick packages for your project
├── README.md               ← adoption instructions (this file)
├── meta/
│   └── agent-workflow/     ← cross-cutting agent conventions
└── packages/
    ├── deploy-gcp-firebase-hosting-cloud-run-pwa/
    ├── bootstrap-monorepo-react-vite-pwa-fastapi/
    ├── frontend-react-vite/
    ├── frontend-pwa-vite-plugin/
    ├── frontend-mobile-first/
    ├── frontend-pixel-art/
    ├── frontend-capacitor-native-port/
    ├── frontend-expo-react-native/
    ├── bootstrap-monorepo-expo-react-native-fastapi/
    ├── backend-fastapi-python/
    ├── backend-postgresql-pgvector/
    ├── backend-celery-redis/
    └── backend-ai-orchestration/
```

### Naming convention

```
{kind}-{stack}-{paradigm}[-{detail}]
```

| Segment | Examples | Meaning |
|---------|----------|---------|
| **kind** | `deploy`, `bootstrap`, `frontend`, `backend` | What the package does |
| **stack** | `gcp`, `react-vite`, `fastapi-python`, `capacitor` | Primary technology |
| **paradigm** | `firebase-hosting-cloud-run-pwa`, `monorepo`, `pixel-art` | Specific pattern or use case |

Rule-only packages live under `packages/frontend-*` or `packages/backend-*`. Deploy and bootstrap packages bundle rules + skills when they belong together.

Each package includes a **`PACKAGE.md`**: scope, tags, when to use / not use, related packages, and copy instructions.

## Quick start for a new project

1. Open **[CATALOG.md](CATALOG.md)** and select packages matching your stack.
2. Read each chosen package's **`PACKAGE.md`**.
3. Copy into the target repo:

```powershell
# Example: React Vite PWA + FastAPI on Firebase Hosting + Cloud Run
$DEST = "..\my-app\.agents"

# Deploy package (rule + skill)
Copy-Item -Recurse packages\deploy-gcp-firebase-hosting-cloud-run-pwa\rules\* $DEST\rules\
Copy-Item -Recurse packages\deploy-gcp-firebase-hosting-cloud-run-pwa\skills\* $DEST\skills\

# Bootstrap skill
Copy-Item -Recurse packages\bootstrap-monorepo-react-vite-pwa-fastapi\skills\* $DEST\skills\

# Frontend rules (pick what you need)
Copy-Item packages\frontend-react-vite\rules\* $DEST\rules\
Copy-Item packages\frontend-pwa-vite-plugin\rules\* $DEST\rules\
Copy-Item packages\frontend-mobile-first\rules\* $DEST\rules\

# Backend rule
Copy-Item packages\backend-fastapi-python\rules\* $DEST\rules\

# Meta
Copy-Item meta\agent-workflow\rules\* $DEST\rules\
```

Example: **aery Note** (Expo + FastAPI + PostgreSQL) — see [CATALOG.md](CATALOG.md#aery-note-expo--fastapi--postgresql):

```powershell
$DEST = "..\aery-note\.agents"

Copy-Item -Recurse packages\bootstrap-monorepo-expo-react-native-fastapi\skills\* $DEST\skills\
Copy-Item packages\frontend-expo-react-native\rules\* $DEST\rules\
Copy-Item packages\backend-fastapi-python\rules\* $DEST\rules\
Copy-Item packages\backend-postgresql-pgvector\rules\* $DEST\rules\
Copy-Item packages\backend-celery-redis\rules\* $DEST\rules\
Copy-Item packages\backend-ai-orchestration\rules\* $DEST\rules\
Copy-Item -Recurse packages\backend-ai-orchestration\skills\* $DEST\skills\
Copy-Item meta\agent-workflow\rules\* $DEST\rules\
```

4. Add deploy or stack context to the app's `AGENTS.md` (see [CATALOG.md](CATALOG.md)).
5. Add project-specific rules/skills (identity, domain logic) in the app repo.

## Multi-root workspace

Add `agent-utils` and your app repo to one Cursor workspace. Agents read packages from `agent-utils/` and resolve `{GCP_PROJECT}` etc. from the app's `AGENTS.md`.

## Adding new packages

Use **`packages/_template/PACKAGE.md`** as a starting point. Name packages specifically — e.g. `deploy-gcp-cloud-run-api-only` not `deploy-gcp`. Register the package in **CATALOG.md**.

## Not in this toolbox

- Product identity, domain models, business terminology
- Project-specific secrets, URLs, or GCP project IDs
- Auth provider choice (add packages when patterns stabilize)
- Product identity and domain terminology (e.g. Aery Note PRD lives in the app repo)
