# Badge

---

## component: Badge layer: molecule implementation: astro polymorphic: true files: \[Badge.astro, Badge.scss\] last_synced: 2026-05-11

# Badge

## Rôle

Petite étiquette de marquage / tag (offre, formation, enjeu, statut).

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `HTMLTag` (polymorphique) | `"span"` | Tag rendu   |
| `variant` | `"default"` | `"default"` | 🟡 Variants invert/primary/alternative en cours (commentés dans le source) |
| `title` | `string` | `""`    | Préfixe SR-only (ex: "Statut :") |
| `label` | `string` | —       | Texte du badge (obligatoire) |
| `class` | `string` | —       | Classes additionnelles |

## Comportement

* Si `title` fourni, rend un `<VisuallyHidden>` avec `"${title} :"` pour le contexte SR
* Texte interne via `<Text as="span" variant="caption-1">`

## Variants à venir (décision 12-12-2025)

Les variants `invert`, `primary`, `alternative` sont **commentés dans le code source** — encore en gestation. Pour l'instant, **uniquement** `**default**` **est actif**.

Décision 12-12-2025 : les badges sont associés à des contextes (enjeu / offre / formation) avec palettes dédiées — implémentation en cours.

## a11y

* Pattern `VisuallyHidden` pour le contexte SR-only
* Texte visible via `Text`

## Exemple

```astro
<Badge label="Nouveau" />
<Badge title="Statut" label="Disponible" />
```

## Voir aussi

* **BadgeList** — liste de badges avec label de groupe
* **Brand > Visual > Modes Light Dark** — règle "badge passe de blanc à coloré en dark"
* Source : `references/accessibility-website/src/components/Badge/Badge.astro`