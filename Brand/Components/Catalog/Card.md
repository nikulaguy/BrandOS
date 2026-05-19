# Card

---

## component: Card layer: organism implementation: astro polymorphic: true files: \[Card.astro, Card.scss\] last_synced: 2026-05-11

# Card

## Rôle

**Bloc de contenu autonome** dans une liste ou une grille. Utilisé pour : offres, cas clients, articles, formations, expertises. Peut être cliquable (block link).

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `HTMLTag` (polymorphique) | `"article"` | Tag sémantique |
| `variant` | `"photo" \| "simple" \| "freeform" \| "illustration"` | —       | Style et contenu |
| `title` | `string` | —       | Titre de la card (obligatoire) |
| `titleTag` | `"h2" \| "h3" \| "h4" \| "h5" \| "h6"` | `"h3"`  | Niveau de titre |
| `subtitle` | `string` | —       | Sous-titre optionnel |
| `subtitleTag` | `"p" \| "h2..h6"` | `"p"`   | Tag du sous-titre |
| `imgPath` | `string` | —       | Chemin image (obligatoire si `variant="photo"`) |
| `imgAlt` | `string` | `""`    | Alt text de l'image |
| `illustration` | `string` | —       | Nom d'illustration (obligatoire si `variant="illustration"`) |
| `url` | `string` | —       | Si fourni → card cliquable (block link) |

## Variants

| Variant | Usage |
|---------|-------|
| `photo` | Card avec photo (imgPath obligatoire) — cas clients, ProfileBanner-like |
| `simple` | Card sans média, titre + texte simple |
| `freeform` | Card avec contenu libre via slot |
| `illustration` | Card avec illustration vectorielle (illustration obligatoire) |

> Note : le variant `simple` s'appelait précédemment `link` (renommé selon décision 27-11-2025).

## Comportements

* **Validation à la compilation** : `photo` exige `imgPath`, `illustration` exige `illustration`
* **Block link** : si `url` fourni, toute la card devient cliquable — pattern `Card.astro` respecte la sélection texte
* **Images dynamiques** : import via `import.meta.glob` sur `src/assets/img/**`

## a11y — block link

Pattern observé (décision 27-11-2025) : lien principal dans le titre, click delegation sur la card, sélection texte préservée. Référer au code source pour la mécanique exacte.

## Exemple

```astro
<Card variant="photo" title="Lefebvre Dalloz" subtitle="Refonte DS" imgPath="lefebvre-dalloz.jpg" url="/cas-clients/lefebvre-dalloz" />

<Card variant="illustration" title="Audit RGAA" illustration="checklist" url="/offre/audits" />
```

## Anti-patterns

* ❌ Card sans `variant` — toujours en choisir un
* ❌ Card cliquable sans `url` (utiliser `url`, pas wrapper `<a>` autour)
* ❌ Sauter de h2 à h4 via `titleTag` sans logique
* ❌ Inventer un 5ᵉ variant — étendre demande accord Design

## Voir aussi

* **Stack** — utilisé en interne pour le rythme
* **Text** — pour le titre et le sous-titre
* Source : `references/accessibility-website/src/components/Card/Card.astro`