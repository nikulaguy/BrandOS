# Link

---

## component: Link layer: atom implementation: astro files: \[Link.astro, Link.scss\] a11y_critical: true last_synced: 2026-05-11

# Link

## Rôle

Lien stylisé Frontguys. Trois variants visuels selon le contexte d'usage.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `href` | `string` | —       | URL de destination (obligatoire) |
| `label` | `string` | —       | Texte visible (obligatoire) |
| `complementaryLabel` | `string` | `""`    | Suffixe (concaténé à `label`) |
| `variant` | `"inline" \| "standalone" \| "back"` | `"inline"` | Style       |
| `textStyle` | `"body-1" \| "body-2" \| "subtitle" \| "caption-1" \| "caption-2"` | `"body-1"` | Variant `Text` appliqué |
| `class` | `string` | —       | Classes additionnelles |
| + attrs natifs | `HTMLAttributes<"a">` | —       | target, rel, aria-current, etc. |

## Variants

| Variant | Usage |
|---------|-------|
| `inline` | Lien au sein d'un paragraphe — souligné typique |
| `standalone` | Lien isolé (header, footer, card) — sans soulignement par défaut |
| `back`  | Lien retour avec icône flèche gauche (préfixe `arrow-left`) |

## Comportement liens externes

* **Détection auto** : `href.includes("https://")` ou `target === "_blank"`
* **Title auto** via `getExternalLinkLabel(label + complementaryLabel)` — annonce SR
* Doublé par un span `VisuallyHidden` avec `externalLinkLabel` (cf. Button)

## États d'interaction

**Suit le pattern canonique** : default → hover (-10) → active (-20) → disabled. **Mêmes couleurs que Button** (décision 02-11-2025). Voir **Brand > Visual > Interaction States**.

## a11y

* Tag `<a>` natif → comportement clavier complet
* Liens externes annoncés via `title` + span SR-only
* Focus visible (outline `_base.scss`)

## Exemple

```astro
<!-- Lien inline dans un paragraphe -->
<Text>Voir notre <Link href="/cas-clients" label="page cas clients" /> pour des exemples.</Text>

<!-- Lien standalone (header / footer / card) -->
<Link href="/contact" label="Contactez-nous" variant="standalone" textStyle="subtitle" />

<!-- Lien retour avec icône -->
<Link href="/articles" label="Retour aux articles" variant="back" />
```

## Voir aussi

* **Button** — pour les CTA d'action (vs Link pour navigation)
* **Brand > Voice > Vocabulary** — vocabulaire des verbes (préférer impératif sur les CTA)
* Source : `references/accessibility-website/src/components/Link/Link.astro`