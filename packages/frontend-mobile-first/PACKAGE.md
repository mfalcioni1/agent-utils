# frontend-mobile-first

## Summary

**Mobile-first** touch UI: safe areas, 44px targets, `100dvh`, deep-linkable routes, Capacitor-safe patterns.

## Tags

`mobile`, `responsive`, `touch`, `safe-area`, `capacitor-ready`

## Includes

- **Rule:** `rules/mobile-first.mdc`

## When to use

- Phone-primary apps (PWA or native-bound)
- Any project targeting app-store port via Capacitor

## When NOT to use

- Desktop-only admin dashboards with no mobile requirement

## Pairs with

- [frontend-capacitor-native-port](../frontend-capacitor-native-port/PACKAGE.md)
- [frontend-react-vite](../frontend-react-vite/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\frontend-mobile-first\rules\* my-app\.cursor\rules\
```

Add project-specific layout docs (e.g. `docs/design/mobile-layout.md`) in the app repo.
