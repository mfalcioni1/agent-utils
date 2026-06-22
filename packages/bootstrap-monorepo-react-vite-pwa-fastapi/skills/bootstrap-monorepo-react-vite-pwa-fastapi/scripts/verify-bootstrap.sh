#!/usr/bin/env bash
# Verify PWA monorepo bootstrap. Override paths via env vars.
set -euo pipefail

FRONTEND_DIR="${FRONTEND_DIR:-frontend}"
BACKEND_DIR="${BACKEND_DIR:-backend}"
INFRA_DIR="${INFRA_DIR:-infra}"

ROOT="$(cd "$(dirname "$0")/../../../.." && pwd)"
cd "$ROOT"

MISSING=0

check() {
  if [ ! -e "$1" ]; then
    echo "MISSING: $1"
    MISSING=1
  else
    echo "OK: $1"
  fi
}

echo "=== Monorepo structure (FRONTEND_DIR=$FRONTEND_DIR, BACKEND_DIR=$BACKEND_DIR) ==="
check "AGENTS.md"
check "${FRONTEND_DIR}/package.json"
check "${FRONTEND_DIR}/vite.config.ts"
check "${FRONTEND_DIR}/src/platform/storage.ts"
check "${FRONTEND_DIR}/src/platform/notifications.ts"
check "${FRONTEND_DIR}/src/platform/device.ts"
check "${FRONTEND_DIR}/src/platform/index.ts"
check "${FRONTEND_DIR}/src/components/MobileShell/MobileShell.tsx"
check "${FRONTEND_DIR}/src/styles/tokens.css"
check "${FRONTEND_DIR}/src/styles/global.css"
check "${BACKEND_DIR}/pyproject.toml"
check "${BACKEND_DIR}/Dockerfile"
check "${BACKEND_DIR}/app/main.py"
check "docker-compose.yml"
check "${INFRA_DIR}/firebase.json"
check "${INFRA_DIR}/cloudbuild.yaml"

echo ""
if [ "$MISSING" -eq 0 ]; then
  echo "Bootstrap verification passed."
  exit 0
else
  echo "Bootstrap verification failed."
  exit 1
fi
