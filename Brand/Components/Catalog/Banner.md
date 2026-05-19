# Banner

---

## component: Banner layer: organism implementation: astro files: \[Banner.astro, Banner.scss\] last_synced: 2026-05-11

# Banner

## Rôle

Bannière pleine largeur en haut de page ou de section. Message persistant (info, alerte, succès).

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `type` | `"alert" \| "info" \| "success"` | `"info"` | Type de bannière |
| `label` | `string` | —       | Texte affiché |
| + attributs natifs | `HTMLAttributes` | —       | Passés au `<section>` |

## Rendu

* Tag : `<section class="o-banner" data-type={type}>`
* Texte rendu via `<Text as="p">`
* Wrapper full-width centré : `u-full-width u-content-centered`

## Décision 06-01-2026

La banner change de place dans la mise en page (entre deux sections à déterminer). Le composant lui-même reste — son positionnement bouge.

## Exemple

```astro
<Banner type="info" label="Nouvelle formation disponible — découvrez le programme" />
```

## Voir aussi

* **Alert** — équivalent pour message ponctuel inline
* Source : `references/accessibility-website/src/components/Banner/Banner.astro`