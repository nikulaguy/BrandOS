# BadgeList

---

## component: BadgeList layer: molecule implementation: astro files: \[BadgeList.astro, BadgeList.scss\] last_synced: 2026-05-11

# BadgeList

## Rôle

Liste sémantique de badges (`<ul>`) avec label optionnel pour le groupe.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `badges` | `Array<{ label, title?, variant? }>` | —       | Liste des badges (obligatoire) |
| `variant` | `"default"` | `"default"` | Variant par défaut appliqué à tous |
| `label` | `string` | —       | Label SR-only du `<ul>` (aria-label) |

## a11y

* Rend `<ul class="u-list-reset u-list-style:none">` — liste sémantique sans styles natifs
* `aria-label={label || null}` sur le `<ul>` pour annoncer le groupe

## Exemple

```astro
<BadgeList
  label="Technologies utilisées"
  badges={[
    { label: "React" },
    { label: "TypeScript" },
    { label: "Storybook" }
  ]}
/>
```

## Voir aussi

* **Badge** — composant individuel
* Source : `references/accessibility-website/src/components/BadgeList/BadgeList.astro`