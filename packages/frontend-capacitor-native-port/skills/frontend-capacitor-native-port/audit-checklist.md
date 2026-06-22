# Native Port Audit Checklist

Copy into PR description or task notes when a feature touches UI, storage, push, or device APIs.

## Platform abstraction

- [ ] No direct `localStorage` / `sessionStorage` in components or hooks
- [ ] No direct `window.*` access outside `frontend/src/platform/`
- [ ] No direct `navigator.*` access outside `frontend/src/platform/`
- [ ] No direct `Notification` API usage outside `frontend/src/platform/`

## Mobile layout

- [ ] Screen wrapped in safe-area shell component
- [ ] Touch targets ≥ 44×44px
- [ ] No hover-only interactions
- [ ] Legible at 375px without horizontal scroll
- [ ] Uses `100dvh` or safe-area padding (not raw `100vh`)

## Routing and config

- [ ] New screens have deep-linkable URL paths
- [ ] API URL from `import.meta.env.VITE_API_URL`, not hardcoded hosting URL
- [ ] No hosting-provider-specific assumptions in app logic

## PWA / offline

- [ ] Core user flow works if service worker is disabled
- [ ] Offline behavior is graceful (queue or clear error message)

## Performance

- [ ] New assets use integer dimensions (if pixel-art project)
- [ ] No large unoptimized images added without compression
- [ ] Animations use stepped keyframes where pixel-art applies

## Domain (project-specific)

Add app-specific acceptance criteria from the project's domain rules or skills.
