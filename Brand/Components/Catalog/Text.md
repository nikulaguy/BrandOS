# Text

---

## component: Text layer: utility implementation: astro polymorphic: true files: \[Text.astro, Text.scss\] a11y_critical: true last_synced: 2026-05-11

# Text

## Rôle

**Composant typo universel.** TOUT texte du site passe par lui. Permet de dissocier la **balise sémantique** (`as`) du **style visuel** (`variant`) — clé pour l'a11y.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `HTMLTag` (polymorphique) | `"p"`   | Balise sémantique HTML |
| `variant` | voir liste ci-dessous | `"body-1"` | Style visuel appliqué (classe `text-{variant}`) |
| `color` | `string` | `undefined` | Token couleur (référence CSS variable) |
| `class` | `string` | —       | Classes additionnelles |

## Variants disponibles

| Variant | Usage |
|---------|-------|
| `heading-1` → `heading-6` | 6 styles de titres (responsive sur les plus grands) |
| `subtitle` | Sous-titre / texte d'introduction |
| `surtitle` | Surtitre / eyebrow / catégorie |
| `body-1` | Corps de texte principal |
| `body-2` | Corps de texte secondaire |
| `caption-1`, `caption-2` | Métadonnées, légendes |
| `code`  | Code inline ou bloc monospace |

## Règle d'or — dissocier sémantique et visuel

```astro
<!-- ✅ Titre H1 visuellement style heading-2 -->
<Text as="h1" variant="heading-2">…</Text>

<!-- ✅ Span visuellement caption -->
<Text as="span" variant="caption-1">…</Text>

<!-- ❌ Sauter la hiérarchie sémantique pour du style -->
<Text as="h4" variant="heading-1">…</Text>
```

## a11y

* Respect strict de la hiérarchie sémantique (h1 → h6 sans saut)
* Le `variant` change le **rendu**, jamais la sémantique

## Voir aussi

* **Brand > Visual > Typography Rules** — rôles sémantiques canoniques par usage
* **Stack** — pour gérer l'espacement entre éléments Text
* Source : `references/accessibility-website/src/components/Text/Text.astro`