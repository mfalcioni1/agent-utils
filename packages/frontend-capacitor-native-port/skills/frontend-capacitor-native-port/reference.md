# Native Port Reference

## Capacitor project layout

```
{FRONTEND_DIR}/
├── capacitor.config.ts
├── ios/                  # generated
├── android/              # generated
├── dist/                 # Vite build output (webDir)
└── src/platform/
    ├── storage.ts        # web impl
    ├── notifications.ts
    ├── device.ts
    └── index.ts
```

## capacitor.config.ts

```typescript
import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: '{APP_ID}',
  appName: '{APP_NAME}',
  webDir: 'dist',
  server: {
    androidScheme: 'https',
  },
};

export default config;
```

## Platform plugin mapping

| Capability | Web | Capacitor |
|------------|-----|-----------|
| Key-value storage | `localStorage` | `@capacitor/preferences` |
| Push notifications | Web Push / FCM | `@capacitor/push-notifications` |
| App state / URL | `window` events | `@capacitor/app` |
| Network status | `navigator.onLine` | `@capacitor/network` |
| Status bar | N/A | `@capacitor/status-bar` |

## CORS origins for native

```
capacitor://localhost
https://localhost
ionic://localhost
```

Add all to backend `CORS_ORIGINS` before native testing.

## Store submission checklist

### Both platforms

- [ ] App icons (1024×1024 source, all required sizes)
- [ ] Splash screen assets
- [ ] Privacy policy URL
- [ ] App description and screenshots (phone sizes)

### iOS

- [ ] Apple Developer account
- [ ] Privacy manifest (`PrivacyInfo.xcprivacy`)
- [ ] App Store Connect metadata

### Android

- [ ] Play Console account
- [ ] Signed AAB (`./gradlew bundleRelease`)
- [ ] Data safety form

## Performance targets for WebView

- Keep initial bundle lean; lazy-load heavy assets per screen
- No layout thrashing on 375px viewport
