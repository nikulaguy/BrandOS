# Conventions

---

## type: conventions last_synced: 2026-05-11 source: gitlab/frontguys/accessibility-website (README + guidelines.md + observation code)

# Conventions composants Frontguys

Ce fichier encode les patterns techniques et a11y observés dans le repo, à respecter pour toute production ou modification de composant.

## Stack technique

* **Framework** : Astro 5 (`output: "static"`, adapter Netlify)
* **Composants** : majoritairement `.astro` ; **un seul composant React** (`Button.tsx`) — polymorphique avec `class-variance-authority`
* **Styling** : SCSS modulaire (par composant) + CSS Modules (pour le composant React)
* **Tokens** : `src/tokens/*.json` (format DTCG) → Terrazzo CLI → CSS variables
* **Content** : Astro Content Collections (`src/content/`)
* **Tests** : Storybook + Vitest + Playwright (`pnpm exec vitest --project storybook`)
* **Lint/format** : Biome (`pnpm format-files`, `pnpm lint-files`)
* **Package manager** : `pnpm` (lockfile présent)

## Structure d'un composant

### Astro (cas par défaut — 23/24 composants)

```
src/components/{Name}/
├── {Name}.astro      Composant
└── {Name}.scss       Styles dédiés
```

Le `.scss` est **importé en tête du** `**.astro**` : `import "./{Name}.scss";`.

### React (cas unique — Button)

```
src/components/{Name}/
├── {Name}.tsx           Composant React polymorphique
├── {Name}.module.css    CSS Modules
└── {Name}.stories.tsx   Storybook
```

### Flat (utilitaires et sections page-specific)

```
src/components/
├── VisuallyHidden.astro
├── Logo.astro
├── LogoLink.astro
├── ...
```

Pas de sous-dossier, pas de SCSS dédié (styles utilitaires globaux).

## Convention de nommage CSS — BEM atomic

Les classes CSS suivent l'atomic design :

| Préfixe | Couche | Exemple |
|---------|--------|---------|
| `a-`    | Atom   | `a-avatar`, `a-link` |
| `m-`    | Molecule | `m-badge`, `m-input` |
| `o-`    | Organism | `o-accordion`, `o-card` |
| `l-`    | Layout | `l-section`, `l-header` |
| `u-`    | Utility | `u-visually-hidden`, `u-full-width`, `u-content-centered` |
| `text-` | Typo   | `text-heading-1`, `text-body-1` |

**Variants** : `{component}--{variant}`, ex: `o-card--photo`, `m-badge--primary`.

## Patterns Astro récurrents

### `Polymorphic<{}>` — composants polymorphiques

Les composants à tag variable utilisent `Polymorphic` :

```typescript
import type { HTMLTag, Polymorphic } from "astro/types";

type Props<Tag extends HTMLTag> = Polymorphic<{
  as: Tag;
  // ... autres props
}>;
```

Composants polymorphiques observés : Badge, Card, MediaObject, ProfileBanner, Section, Stack, Text.

### Import des styles

Toujours en tête : `import "./{Name}.scss";`.

### `class:list={[]}` pour composer les classes

```astro
class:list={["o-card", `o-card--${variant}`, { "o-card--interactive": isInteractive }, className]}
```

### `class?: string` dans les Props

Toujours accepter une prop `class` (capturée comme `class: className`) pour permettre l'override depuis le parent.

### Slots Astro

Les composants utilisent les slots nommés Astro :

* Slot par défaut pour le contenu principal
* Slots nommés pour les zones spécifiques (`<slot name="surtitle" />`, etc.)

### IDs uniques pour aria

Pour les composants ayant besoin d'un id unique (aria-labelledby) :

```typescript
const uniqueId = crypto.randomUUID();
```

## Accessibilité (WCAG 2.1 AA — exigé)

### Principes fondateurs


1. **Sémantique d'abord** — toujours préférer le HTML natif à ARIA
2. **CSS n'a jamais le monopole de l'information** — toujours doubler par du HTML
3. **Progressive enhancement** — tout doit marcher sans JS quand c'est possible
4. **Langue française** — `<html lang="fr">` + `lang` sur les exceptions

### Landmarks obligatoires

Tout layout de page doit fournir :

* `SkipLinks` (nav skip)
* `Header` (banner)
* `<main>`
* `Footer` (contentinfo)

### Hiérarchie de titres

* **Exactement un** `**<h1>**` **par page** via `PageHeader`
* Pas de saut de niveau (h1 → h2 → h3)
* `Text` avec `variant` pour le visuel, **sans** changer le tag sémantique

### Clavier

* Tous les éléments interactifs accessibles au clavier
* Focus visible : `outline-offset: .1875rem` (défini dans `_base.scss`)
* **Ne jamais retirer les outlines** — les customiser à WCAG 3:1 contrast minimum
* Pour les "block links" (Cards cliquables) : pattern observé dans `Card.astro`

### Couleur et contraste

* Contraste 4.5:1 mini pour texte normal, 3:1 pour texte large + UI essentielle
* **Aucune information transmise par couleur seule** (toujours doubler par icon + role ARIA)

### Mouvement

* Respecter `prefers-reduced-motion`
* Toute animation doit être wrappée dans `@media (prefers-reduced-motion: no-preference)`

### Liens externes

Pattern observé dans Link et Button :

* Titre `aria-label` dérivé via `getExternalLinkLabel(title)`
* `<span class="u-visually-hidden">{externalLinkLabel}</span>` après le texte du lien

### `VisuallyHidden` — pattern central

Utilisé partout pour les labels SR-only. Exemple :

```astro
<VisuallyHidden label="Menu de navigation principal" />
```

## Tokens et CSS variables

### Lecture des tokens

Le code consomme les **CSS variables générées par Terrazzo** depuis `src/tokens/*.json`. Exemples observés :

* `var(--semantic-background-default)`
* `var(--semantic-background-default-alt)`
* `var(--semantic-background-subtle)`
* `var(--base-space-{1..20})`
* `var(--content-max-width)` (1200px)
* `var(--content-prose-max-width)` (largeur prose)

### Composition de styles dynamique

Pattern observé dans `Section.astro` :

```typescript
const mergedStyle = {
  "--bg-color": `var(--${sectionColor})`,
  "--max-width": condensed ? "var(--content-prose-max-width)" : "var(--content-max-width)",
};
```

## Ce qu'il ne faut jamais faire

* ❌ Créer un composant qui duplique un existant (toujours vérifier Storybook avant)
* ❌ Coder du HTML brut quand un composant Atomic existe (`<p>` brut → `Text`, `flex` ad-hoc → `Stack`)
* ❌ Mettre une couleur ou un spacing en dur — toujours via CSS variable issue de `src/tokens/`
* ❌ Modifier un composant sans son équivalent Storybook (`pnpm storybook` doit toujours marcher)
* ❌ Retirer ou réduire les comportements a11y (focus visible, reduced-motion, aria, semantic HTML)
* ❌ Sauter un niveau de titre dans la hiérarchie h1 → h6
* ❌ Mélanger les couches BEM (`o-something m-other` incohérent)
* ❌ Utiliser ARIA quand HTML natif suffit