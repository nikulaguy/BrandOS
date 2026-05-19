# SectionHeader

---

## component: SectionHeader layer: layout implementation: astro files: \[SectionHeader.astro, SectionHeader.scss\] last_synced: 2026-05-11

# SectionHeader

## Rôle

Bloc titre de section — titre principal + slots optionnels (surtitre, sous-titre). À utiliser en tête de chaque `Section` (sauf cas spécial).

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `title` | `string` | —       | Titre principal (obligatoire) |
| `titleTag` | `"h1" \| "h2" \| "h3"` | `"h2"`  | Niveau du titre |
| `titleVariant` | `"heading-2" \| "heading-3" \| "heading-6"` | `"heading-3"` | Variant `Text` appliqué |
| `class` | `string` | —       | Classes additionnelles |

## Slots

| Slot | Usage |
|------|-------|
| `surtitle` | Surtitre / eyebrow / catégorie au-dessus du titre |
| `subtitle` | Sous-titre / introduction sous le titre |

## a11y

* ID unique via `crypto.randomUUID()` (pour `aria-labelledby` éventuel par la `Section` parente)
* `titleTag` dissocié du `titleVariant` → respecte la hiérarchie sémantique tout en gardant le visuel souhaité

## Exemple

```astro
<SectionHeader title="Nos expertises" titleTag="h2" titleVariant="heading-3">
  <span slot="surtitle">Expertise</span>
  <Text slot="subtitle">Voyez ce qui nous distingue. Concrètement.</Text>
</SectionHeader>
```

## Voir aussi

* **Section** — wrapper de section parent
* **Text** — pour les variants typographiques
* Source : `references/accessibility-website/src/components/SectionHeader/SectionHeader.astro`