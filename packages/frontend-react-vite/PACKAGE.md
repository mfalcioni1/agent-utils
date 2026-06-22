# frontend-react-vite

## Summary

React + TypeScript conventions for **Vite** projects: API client layer, hooks, CSS modules, platform abstraction.

## Tags

`react`, `vite`, `typescript`, `frontend`

## Includes

- **Rule:** `rules/react-vite.mdc`

## When to use

- Any React frontend built with Vite
- Monorepos with `frontend/` or similar directory

## When NOT to use

- Next.js App Router → needs different rule (future package)
- Vue/Svelte → different frontend packages

## Pairs with

- [frontend-pwa-vite-plugin](../frontend-pwa-vite-plugin/PACKAGE.md) (if PWA)
- [frontend-mobile-first](../frontend-mobile-first/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\frontend-react-vite\rules\* my-app\.cursor\rules\
```

Adjust `globs` in frontmatter if frontend dir is not `frontend/`.
