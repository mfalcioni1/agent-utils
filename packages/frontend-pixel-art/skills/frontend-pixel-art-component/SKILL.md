---
name: frontend-pixel-art-component
description: Creates pixel-art UI components and screens following design tokens and mobile-first layout. Use when building pixel-art UI, sprites, animations, or retro game-style screens. Not for flat Material Design or standard SaaS UI.
---

# Frontend — Pixel-Art Component

## When to use

New screens, buttons, panels, sprites, or animations in pixel-art style.

## Project context

| Item | Typical location |
|------|------------------|
| Design tokens | `docs/design/tokens.md`, `frontend/src/styles/tokens.css` |
| Mobile layout | `docs/design/mobile-layout.md`, `mobile-first` rule |
| Screen shell | Project layout component (e.g. `MobileShell`) |
| Assets | `frontend/src/assets/` |

## Workflow

```
Component Progress:
- [ ] Step 1: Design tokens
- [ ] Step 2: Mobile layout check
- [ ] Step 3: Asset approach
- [ ] Step 4: Implement
- [ ] Step 5: Accessibility
- [ ] Step 6: Visual QA
```

### Step 1: Design tokens

Read project token docs. Use CSS variables from `frontend/src/styles/tokens.css` — do not hardcode colors or invent new palette entries.

### Step 2: Mobile layout

Per `mobile-first` rule and project mobile layout docs:

- Wrap screens in the project's safe-area shell component
- 44×44px minimum touch targets
- Safe-area padding on full-bleed views
- Test at 375px width

### Step 3: Asset approach

| Approach | When |
|----------|------|
| Individual PNG/SVG in `frontend/src/assets/` | Few sprites, simple UI |
| CSS sprite sheet | Many small icons, repeated elements |
| CSS-only (borders, box-shadow) | Panels, buttons, frames |

Default: individual PNG assets with integer dimensions.

### Step 4: Implement

- CSS modules colocated with component
- Integer dimensions and scale factors only
- Stepped animation (8–12 fps) — see [reference.md](reference.md)

### Step 5: Accessibility

- `aria-label` on interactive sprites without visible text
- Visible `:focus-visible` outline (pixel-style border, not removed)
- Sufficient color contrast per project palette

### Step 6: Visual QA

- [ ] No blur or soft shadows
- [ ] Correct at 1x, 2x, 3x integer scale
- [ ] No horizontal scroll at 375px
- [ ] Animations use stepped keyframes

## Additional resources

- CSS patterns and animation templates: [reference.md](reference.md)
