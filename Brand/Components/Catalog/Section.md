# Section

---

## component: Section layer: layout implementation: astro polymorphic: true files: \[Section.astro, Section.scss\] last_synced: 2026-05-11

# Section

## Rôle

**Conteneur de section de page.** TOUTE section d'une page Frontguys passe par lui. Gère le fond, la largeur max, le centrage, et la couleur de fond sémantique.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `"section" \| "header" \| "aside"` | `"section"` | Tag sémantique |
| `color` | `"semantic-background-default" \| "semantic-background-default-alt" \| "semantic-background-subtle"` | `"semantic-background-default"` | Token CSS de fond |
| `verticallyCentered` | `boolean` | `false` | Centrage vertical du contenu |
| `gap` | `"static" \| "fluid"` | `"fluid"` | Espacement entre sections enfants |
| `condensed` | `boolean` | `false` | Largeur prose (vs 1200px) |
| `class` | `string` | —       | Classes additionnelles |
| `style` | `CSSProperties` | —       | Variables CSS additionnelles |

## Comportement spécial

* Si `as="header"`, la couleur de fond est **forcée** à `semantic-background-subtle` (rappel visuel d'entête)
* `condensed=true` → max-width = `--content-prose-max-width` (lecture confortable)
* `condensed=false` → max-width = `--content-max-width` (1200px, décision 21-10-2025)

## Tokens consommés

* `--semantic-background-default` / `-alt` / `-subtle`
* `--content-max-width` (1200px)
* `--content-prose-max-width`

## Exemple

```astro
<Section as="section" color="semantic-background-subtle" gap="fluid">
  <SectionHeader title="Nos enjeux" />
  <Stack gap={4}>
    <!-- contenu -->
  </Stack>
</Section>
```

## Anti-patterns

* ❌ Coder un `<section class="..."><div class="container">` à la main
* ❌ Mettre une couleur de fond en dur — toujours via `color` prop
* ❌ Utiliser Section pour un sous-bloc — c'est pour les sections **de premier niveau**

## Voir aussi

* **Stack** — pour gérer le rythme interne
* **SectionHeader** — pour le bloc titre de section
* **Brand > Visual > Tokens Usage Rules** — règles `background.*`
* Source : `references/accessibility-website/src/components/Section/Section.astro`