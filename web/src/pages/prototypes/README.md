# Prototypes

Toutes les pages générées depuis Figma vivent ici.

## Convention de nommage

`[contexte]-[sujet]-[version].astro`

Exemples :

- `pricing-v1.astro` (proposition de page pricing, version 1)
- `client-case-acme.astro` (page client Acme)
- `landing-a11y-audit.astro` (landing pour service d'audit a11y)

## Pour créer un prototype

Voir [`web/docs/workflow.md`](../../../docs/workflow.md).

## Structure attendue d'un prototype

```astro
---
import BaseLayout from "@layouts/BaseLayout.astro";
// import des composants nécessaires...
---

<BaseLayout title="..." description="...">
  <main>
    <!-- sections de la frame Figma -->
  </main>
</BaseLayout>
```

## Conventions

- Importer uniquement les composants présents dans `src/components/` — jamais inventer
- Utiliser uniquement les CSS vars exposées par Terrazzo — aucune valeur en dur
- Documenter en frontmatter l'URL Figma source dans un commentaire :

```astro
---
// Source Figma : https://www.figma.com/design/.../?node-id=...
// Généré le : YYYY-MM-DD
// Composants mobilisés : Header, Section, Card, Button
---
```
