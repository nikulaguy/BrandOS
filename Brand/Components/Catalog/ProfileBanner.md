---

## component: ProfileBanner layer: organism implementation: astro polymorphic: true files: \[ProfileBanner.astro, ProfileBanner.scss\] last_synced: 2026-05-11

# ProfileBanner

## Rôle

Bannière de présentation d'une personne. Compose Avatar + nom + titre + description.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `HTMLTag` (polymorphique) | `"div"` | Tag rendu   |
| `avatarSrc` | `string` | —       | Chemin de l'avatar (obligatoire) |
| `title` | `string` | —       | Titre (rôle, fonction — obligatoire) |
| `titleTag` | `"h2" \| "h3" \| "h4"` | `"h3"`  | Niveau du titre |
| `name` | `string` | `""`    | Nom de la personne |
| `description` | `string` | `""`    | Description courte |

## a11y

* **ID unique** via `crypto.randomUUID()` pour `aria-labelledby`
* Le `<Tag>` racine est `aria-labelledby={uniqueId}` → annonce SR du titre

## Composants utilisés

* `Avatar` (avec `imgAlt=""` car l'avatar est décoratif, la sémantique passe par le titre)
* `Stack`, `Text`

## Exemple

```astro
<ProfileBanner
  avatarSrc="claire.jpg"
  title="Head of Product & Design"
  titleTag="h3"
  name="Claire"
  description="Pilote l'équipe design + product et structure le DS"
/>
```

## Voir aussi

* **Avatar** — composant image utilisé
* **MediaObject** — alternative générique
* Source : `references/accessibility-website/src/components/ProfileBanner/ProfileBanner.astro`
