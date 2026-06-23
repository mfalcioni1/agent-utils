# frontend-pixel-art

## Summary

**Pixel-art** visual conventions and a component-building skill: integer scaling, stepped animation, design tokens.

## Tags

`pixel-art`, `retro`, `game-ui`, `sprites`, `css-animation`

## Includes

- **Rule:** `rules/pixel-art-design.mdc`
- **Skill:** `skills/frontend-pixel-art-component/`

## When to use

- Retro / game-style UI
- Sprite-based interfaces with crisp pixel rendering

## When NOT to use

- Standard SaaS or Material Design UI
- Photo-realistic or heavily gradient interfaces

## Pairs with

- [frontend-mobile-first](../frontend-mobile-first/PACKAGE.md)
- [frontend-react-vite](../frontend-react-vite/PACKAGE.md)

## Adoption

```powershell
Copy-Item packages\frontend-pixel-art\rules\* my-app\.agents\rules\
Copy-Item -Recurse packages\frontend-pixel-art\skills\* my-app\.agents\skills\
```

Define color/spacing tokens in app repo (`docs/design/tokens.md`).
