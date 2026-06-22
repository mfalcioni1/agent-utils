# Pixel-Art Component Reference

## Base sprite CSS

```css
.sprite {
  image-rendering: pixelated;
  image-rendering: crisp-edges;
  width: 32px;
  height: 32px;
}
```

## Integer scale wrapper

```css
.spriteScale2x {
  width: 32px;
  height: 32px;
  transform: scale(2);
  transform-origin: top left;
  image-rendering: pixelated;
}
```

## Pixel panel (CSS-only)

```css
.panel {
  background: var(--color-surface);
  border: 4px solid var(--color-border);
  box-shadow:
    4px 0 0 0 var(--color-border),
    0 4px 0 0 var(--color-border),
    4px 4px 0 0 var(--color-border);
  padding: 16px;
}
```

Use project token variable names.

## Stepped animation template

```css
@keyframes sprite-walk {
  0%   { background-position: 0 0; }
  33%  { background-position: -32px 0; }
  66%  { background-position: -64px 0; }
  100% { background-position: -96px 0; }
}

.sprite {
  animation: sprite-walk 0.5s steps(4) infinite;
}
```

`steps(4)` at 0.5s ≈ 8 fps.

## Pixel button

```css
.button {
  min-width: 44px;
  min-height: 44px;
  padding: 8px 16px;
  font-family: var(--font-pixel);
  font-size: 12px;
  background: var(--color-accent);
  color: var(--color-text-on-accent);
  border: 3px solid var(--color-border);
  cursor: pointer;
}

.button:active {
  transform: translate(2px, 2px);
  box-shadow: none;
}

.button:focus-visible {
  outline: 3px solid var(--color-focus);
  outline-offset: 2px;
}
```

## File structure

```
frontend/src/components/MyComponent/
├── MyComponent.tsx
├── MyComponent.module.css
└── index.ts
```
