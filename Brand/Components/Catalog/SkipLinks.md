# SkipLinks

---

## component: SkipLinks layer: layout implementation: astro files: \[SkipLinks.astro, SkipLinks.scss\] a11y_critical: true last_synced: 2026-05-11

# SkipLinks

## Rôle

**Liens d'accès rapide.** Permettent aux utilisateurs clavier et lecteurs d'écran de sauter directement aux landmarks (main, footer, etc.). Premier élément focusable de la page.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `pageSkipLinks` | `MenuLink[]` | `[]`    | Skip links additionnels spécifiques à la page |

## Comportement

* Liens globaux issus de `src/site.config.ts` (`skipLinks`)
* Fusionnés avec les `pageSkipLinks` passés en props
* **Visuellement masqués** par défaut (`u-visually-hidden-focusable`) — **deviennent visibles au focus**

## Landmarks

```html
<nav class="l-skip-links u-visually-hidden-focusable" role="navigation" aria-label="Accès rapides">
```

## a11y — critique

* **Premier élément focusable de toute page** — obligatoire WCAG 2.1
* `<nav>` avec `aria-label="Accès rapides"` — distinct des autres `<nav>`
* Liste sémantique `<ul>` avec `Stack as="ul"`
* Apparaît seulement au focus → ne pollue pas le rendu visuel

## Placement obligatoire

À placer **avant le** `**<header>**` dans le layout (typiquement dans `Layout.astro`). C'est le tout premier élément focus de la page.

## Exemple

```astro
<!-- Dans Layout.astro -->
<SkipLinks pageSkipLinks={[
  { path: "#article-content", label: "Aller au contenu de l'article" }
]} />
<Header />
<main id="main-content">...</main>
<Footer />
```

## Voir aussi

* **Header** — landmark `banner` qui suit
* **Link** — composant utilisé pour les skip links
* Source : `references/accessibility-website/src/components/SkipLinks/SkipLinks.astro`