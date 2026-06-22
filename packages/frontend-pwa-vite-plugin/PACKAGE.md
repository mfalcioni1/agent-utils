# frontend-pwa-vite-plugin

## Summary

PWA requirements using **`vite-plugin-pwa`**: manifest, service worker scope, installability, offline caching policy.

## Tags

`pwa`, `vite`, `vite-plugin-pwa`, `service-worker`, `manifest`

## Includes

- **Rule:** `rules/pwa-vite-plugin.mdc`

## When to use

- Installable PWA with Vite
- Offline shell caching, standalone display mode
- Projects planning Capacitor wrap later

## When NOT to use

- Plain SPA with no install/offline requirements
- Non-Vite bundlers
- Hand-rolled service workers (unless intentional)

## Pairs with

- [frontend-react-vite](../frontend-react-vite/PACKAGE.md)
- [deploy-gcp-firebase-hosting-cloud-run-pwa](../deploy-gcp-firebase-hosting-cloud-run-pwa/PACKAGE.md)
- [frontend-capacitor-native-port](../frontend-capacitor-native-port/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\frontend-pwa-vite-plugin\rules\* my-app\.cursor\rules\
```
