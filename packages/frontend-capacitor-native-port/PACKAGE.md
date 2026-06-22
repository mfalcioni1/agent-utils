# frontend-capacitor-native-port

## Summary

Audit PWA code for **Capacitor** compatibility and guide iOS/Android app-store wrapping.

## Tags

`capacitor`, `ios`, `android`, `native`, `app-store`, `platform-abstraction`

## Includes

- **Skill:** `skills/frontend-capacitor-native-port/`

## When to use

- Before merging features using storage, push, or device APIs
- Ready to submit PWA wrap to App Store / Play Store
- Validating `frontend/src/platform/` abstraction

## When NOT to use

- React Native greenfield → different stack entirely
- PWA-only with no native port plans (optional; still useful for platform hygiene)
- TWA-only Android (no Capacitor)

## Pairs with

- [frontend-pwa-vite-plugin](../frontend-pwa-vite-plugin/PACKAGE.md)
- [frontend-mobile-first](../frontend-mobile-first/PACKAGE.md)

## Project context required

| Placeholder | Description |
|-------------|-------------|
| `{APP_NAME}` | Capacitor app display name |
| `{APP_ID}` | Reverse-DNS id e.g. `com.example.app` |
| `{FRONTEND_DIR}` | Frontend root |

## Adoption

```powershell
Copy-Item -Recurse packages\frontend-capacitor-native-port\skills\* my-app\.cursor\skills\
```
