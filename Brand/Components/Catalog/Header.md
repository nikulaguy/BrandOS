# Header

---

## component: Header layer: layout implementation: astro files: \[Header.astro, Header.scss\] a11y_critical: true last_synced: 2026-05-11

# Header

## Rôle

**Entête du site.** Landmark `banner`. Compose logo + navigation principale + CTA contact. Inclut le menu mobile (burger).

## Props

Aucune prop publique — nourri par `src/site.config.ts` (headerLinks, pages).

## Landmarks et structure

```html
<header class="l-header" role="banner" aria-label="Entête de page">
```

## Composants utilisés

* `LogoLink`, `Button`, `VisuallyHidden`
* Icons SVG : `align-justify` (burger), `x` (close)

## Comportements clavier (mobile menu)

D'après `guidelines.md` :

* **Tab/Shift+Tab** : navigation dans le menu
* **Enter/Space** : activation
* **Escape** : ferme le menu mobile

## Décisions en cours

Décision 06-01-2026 : finalisation du menu mobile (CTA contactez-nous full hauteur ? détails à arbitrer par Laurent Pierre).

Décision 12-12-2025 : highlight du lien "Contact" via couleur `accent`.

## a11y

* `role="banner"` (landmark obligatoire)
* Skip links AVANT le header pour permettre de sauter au main
* `aria-current="page"` sur le lien actif
* `aria-expanded` géré pour le menu mobile

## Voir aussi

* **Footer** — landmark `contentinfo`
* **SkipLinks** — accès rapide
* **LogoLink** — composant logo cliquable
* Source : `references/accessibility-website/src/components/Header/Header.astro`