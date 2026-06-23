# {package-name}

## Summary

One sentence describing what this package provides.

## Tags

`tag1`, `tag2`, `tag3`

## Includes

- [ ] Rules: `rules/*.mdc`
- [ ] Skills: `skills/*/SKILL.md`

## When to use

- Bullet points

## When NOT to use

- Alternative paradigms → point to other packages or external tools

## Pairs with

- [other-package](../other-package/PACKAGE.md)

## Project context required

| Placeholder | Description |
|-------------|-------------|
| `{EXAMPLE}` | ... |

## Adoption

```bash
cp -r packages/{package-name}/rules/* my-app/.agents/rules/
cp -r packages/{package-name}/skills/* my-app/.agents/skills/
```

Adjust globs in rule frontmatter if directory names differ.
