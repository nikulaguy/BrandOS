# Button

---

## component: Button layer: react-polymorphic implementation: react polymorphic: true (button | a) files: \[Button.tsx, Button.module.css, Button.stories.tsx\] a11y_critical: true last_synced: 2026-05-11

# Button

## Rôle

**Seul composant React du repo.** CTA principal du site. Polymorphique — peut rendre soit un `<button>` natif (par défaut), soit un `<a>` (si `href` fourni).

> Pourquoi React et pas Astro : besoin du polymorphisme typé avec `class-variance-authority` (CVA) pour les variants, sans dégrader l'a11y native.

## Props (typage CVA)

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `"button" \| "a"` | `"button"` | Tag rendu   |
| `variant` | `"primary" \| "secondary" \| "ghost"` | `"primary"` | Style visuel |
| `size` | `"small"` | —       | Bouton compact |
| `isFullWidth` | `boolean` | `false` | Pleine largeur |
| `isSquared` | `boolean` | `false` | Forme carrée (icon-only typique) |
| `title` | `string` | —       | **Obligatoire si lien externe** |
| `className` | `string` | —       | Classes additionnelles |
| + props natives | `JSX.IntrinsicElements["button" \| "a"]` | —       | href, target, disabled, onClick, etc. |

## Variants visuels

| Variant | Quand l'utiliser |
|---------|------------------|
| `primary` | Action principale d'une page/section (1 par section max) |
| `secondary` | Action secondaire, bouton complémentaire |
| `ghost` | Action tertiaire, sans bordure, fond transparent — réservé aux fonds sombres |

## États d'interaction

**Suit le pattern canonique Frontguys** : default → hover (-10) → active (-20) → disabled. Voir **Brand > Visual > Interaction States**.

## a11y — comportements built-in

* **Liens externes** : si `href` matche `https://` ou `target !== "_self"`, le composant **exige** un `title` (sinon throws). Il ajoute aussi un span SR-only avec `externalLinkLabel` pour annoncer l'ouverture externe.
* `<button>` natif par défaut → tous les comportements clavier inclus
* Focus visible appliqué via `_base.scss`

## Exemples

```tsx
// Bouton primaire simple
<Button>Découvrez nos formations</Button>

// Lien externe (title obligatoire)
<Button as="a" href="https://example.com" title="Voir l'exemple">
  Voir l'exemple
</Button>

// Ghost squared (icon-only)
<Button variant="ghost" isSquared aria-label="Fermer">
  <Icon name="close" />
</Button>
```

## Anti-patterns

* ❌ Coder un `<button onClick={…}>` ad-hoc — passer par ce composant
* ❌ Utiliser Button comme conteneur sémantique (uniquement actions/liens)
* ❌ Omettre `title` sur un lien externe (le composant throw)
* ❌ Multi-CTAs primary dans une même section (1 max)
* ❌ `variant="ghost"` sur fond clair (réservé aux fonds sombres)

## Voir aussi

* **Brand > Voice > Vocabulary** — verbes CTA canoniques (*Découvrez*, *Profitez*, *Sécurisez*…)
* **Brand > Visual > Interaction States** — pattern des states
* Source : `references/accessibility-website/src/components/Button/Button.tsx`
* Storybook : https://inspiring-gecko-d9ada2.netlify.app/?path=/story/components-button