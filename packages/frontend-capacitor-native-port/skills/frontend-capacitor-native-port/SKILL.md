---
name: frontend-capacitor-native-port
description: Audits PWA features for Capacitor app-store portability and guides native wrapping. Use when porting a Vite/React PWA to iOS or Android via Capacitor, or auditing platform abstraction. Not for React Native or Flutter migrations.
---

# Frontend — Capacitor Native Port

## When to use

- Before merging features that touch storage, push, or device APIs
- When ready to wrap a PWA for iOS/Android app stores
- Auditing codebase for Capacitor compatibility

## Project context

| Placeholder | Description | Example |
|-------------|-------------|---------|
| `{APP_NAME}` | Display name | `My App` |
| `{APP_ID}` | Reverse-DNS app ID | `com.example.myapp` |
| `{FRONTEND_DIR}` | Frontend root | `frontend` |
| `{PLATFORM_DIR}` | Platform abstraction | `frontend/src/platform` |

## Audit workflow (per feature)

Copy [audit-checklist.md](audit-checklist.md) into your PR or task notes.

Quick checks:

1. No `window`, `localStorage`, `navigator`, or `Notification` in components
2. All platform access through `{PLATFORM_DIR}/`
3. Mobile-first layout with safe areas
4. Deep-linkable route URLs
5. Core flows work without service worker
6. API URL from env config (works outside Firebase Hosting origin)

## Port workflow (when ready)

```
Port Progress:
- [ ] Step 1: Run full audit on frontend/src/
- [ ] Step 2: Add Capacitor to project
- [ ] Step 3: Map platform modules to plugins
- [ ] Step 4: Configure iOS/Android projects
- [ ] Step 5: Update CORS for native origins
- [ ] Step 6: Store submission prep
```

### Step 1: Full audit

```bash
rg "localStorage|window\.|navigator\." {FRONTEND_DIR}/src --glob '!platform/**'
```

Fix any hits by routing through platform abstraction.

### Step 2: Add Capacitor

```bash
cd {FRONTEND_DIR}
npm install @capacitor/core @capacitor/cli
npx cap init {APP_NAME} {APP_ID} --web-dir dist
npm install @capacitor/ios @capacitor/android
```

Build web app first: `npm run build`, then `npx cap add ios && npx cap add android`.

### Step 3: Map platform modules

| `platform/` module | Capacitor plugin |
|--------------------|-----------------|
| `storage.ts` | `@capacitor/preferences` |
| `notifications.ts` | `@capacitor/push-notifications` |
| `device.ts` | `@capacitor/app`, `@capacitor/network` |

Create native implementations; swap at build time or use conditional exports.

### Step 4: Native project config

- Point Capacitor `webDir` at Vite `dist/`
- Set `server.androidScheme` to `https`
- Configure splash screen and app icons (store assets)

### Step 5: CORS

Add to backend `CORS_ORIGINS`:

- `capacitor://localhost`
- `https://localhost` (Capacitor iOS)

### Step 6: Store submission

See [reference.md](reference.md) for icons, privacy manifest, and checklist.

## Additional resources

- Plugin mapping and project layout: [reference.md](reference.md)
- PR audit checklist: [audit-checklist.md](audit-checklist.md)
