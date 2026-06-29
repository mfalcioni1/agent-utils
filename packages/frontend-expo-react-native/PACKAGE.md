# frontend-expo-react-native

## Summary

**Expo + React Native + React Native Web** client conventions: shared TypeScript UI, API client layer, and rich-text editor integration (Lexical or TipTap).

## Tags

`expo`, `react-native`, `react-native-web`, `typescript`, `lexical`, `tiptap`, `mobile`

## Includes

- **Rule:** `rules/expo-react-native.mdc`

## When to use

- Cross-platform app targeting iOS, Android, and web from one codebase
- Expo-managed React Native project (not bare RN CLI greenfield)
- Rich-text notes with `@mention` nodes and Markdown sync

## When NOT to use

- React + Vite SPA/PWA → [frontend-react-vite](../frontend-react-vite/PACKAGE.md)
- Capacitor-wrapped web app → [frontend-capacitor-native-port](../frontend-capacitor-native-port/PACKAGE.md)
- Next.js or Remix

## Pairs with

- [bootstrap-monorepo-expo-react-native-fastapi](../bootstrap-monorepo-expo-react-native-fastapi/PACKAGE.md)
- [backend-fastapi-python](../backend-fastapi-python/PACKAGE.md)
- [backend-ai-orchestration](../backend-ai-orchestration/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\frontend-expo-react-native\rules\* my-app\.agents\rules\
```

Adjust `globs` in the rule if the client directory differs from `frontend/`.
