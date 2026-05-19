# Avatar

---

## component: Avatar layer: atom implementation: astro files: \[Avatar.astro, Avatar.scss\] last_synced: 2026-05-11

# Avatar

## Rôle

Image de profil ronde. Utilisé dans `ProfileBanner` et tout contexte d'identification d'une personne.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `src` | `string` | —       | Chemin de l'image (obligatoire, validé à la compilation) |
| `imgAlt` | `string` | `""`    | Alt text    |
| `class` | `string` | —       | Classes additionnelles |

## Comportement

* Import dynamique via `import.meta.glob("/src/assets/img/**/*.{jpeg,jpg,png,gif}")`
* **Throw à la compilation** si `src` n'existe pas dans le glob

## a11y

* `imgAlt` vide par défaut → si décoratif (souvent le cas pour un avatar à côté du nom), c'est correct
* Si l'avatar **est la seule identification** de la personne, fournir un `imgAlt` descriptif

## Exemple

```astro
<Avatar src="claire.jpg" imgAlt="Claire, Head of Product & Design" />
```

## Voir aussi

* **ProfileBanner** — composant qui compose Avatar + Text
* Source : `references/accessibility-website/src/components/Avatar/Avatar.astro`