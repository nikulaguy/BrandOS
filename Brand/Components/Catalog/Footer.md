# Footer

---

## component: Footer layer: layout implementation: astro files: \[Footer.astro, Footer.scss\] a11y_critical: true last_synced: 2026-05-11

# Footer

## Rôle

**Pied de page du site.** Landmark `contentinfo`. Compose logo, navigation footer, liens légaux, liens sociaux, et liste auto-générée des articles.

## Props

Aucune prop publique — le composant se nourrit de `src/site.config.ts` (footerLinks, footerLegalLinks, pages, socialLinks) et lit les articles via `getCollectionSortedByOrder("articles")`.

## Landmarks et structure

```html
<footer class="l-footer" role="contentinfo" aria-label="Pied de page">
```

## Composants utilisés

* `LogoLink`, `Link`, `Button` (CTA contact), `Stack`, `Text`, `VisuallyHidden`

## Contenu dynamique

* **Articles** : récupérés via Astro Content Collections, triés par ordre
* **Année** : `new Date().getFullYear()` pour le copyright

## a11y

* `role="contentinfo"` (landmark obligatoire)
* `aria-label="Pied de page"` pour distinguer si plusieurs `<footer>` sur la page
* `aria-current="page"` géré sur les liens via `getAriaCurrentValue`

## Voir aussi

* **Header** — équivalent landmark `banner`
* **SkipLinks** — accès rapide en début de page (skip vers main, vers footer)
* Source : `references/accessibility-website/src/components/Footer/Footer.astro`