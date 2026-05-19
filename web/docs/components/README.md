# Fiches composants

Une fiche par composant Astro/React **présent dans `src/components/`**. C'est la source de vérité de Claude pour savoir comment instancier un composant.

## Template

Copier ce template dans un nouveau fichier `[Nom].md` chaque fois qu'un composant est ajouté localement :

````markdown
# [Nom du composant]

**Type** : `.astro` (statique) | `.tsx` (React + CVA)
**Source** : `web/src/components/[Nom]/[Nom].astro` (ou `.tsx`)
**Équivalent Figma** : `[Nom du composant Figma]` — key `[figmaKey ou ?]`
**Date d'ajout** : YYYY-MM-DD
**Synchronisé depuis SiteA11Y** : commit `[hash]` (`SiteA11Y/src/components/[Nom]/`)

## Description

Phrase courte expliquant à quoi sert le composant et quand l'utiliser.

## Props

| Prop | Type | Défaut | Description |
|------|------|--------|-------------|
| `variant` | `"primary" \| "secondary" \| "ghost"` | `"primary"` | Variant visuel |
| `size` | `"small" \| undefined` | `undefined` (= médium) | Taille |
| ... | | | |

## Variants

| Variant | Aperçu Figma | Usage recommandé |
|---------|--------------|------------------|
| `primary` | (lien Figma) | CTA principal d'une section |
| `secondary` | (lien Figma) | Action secondaire à côté d'un primary |
| ... | | |

## Exemples d'usage

### Usage basique

```astro
---
import [Nom] from "@components/[Nom]/[Nom].astro";
---

<[Nom] variant="primary">Texte</[Nom]>
```

### Usage avancé (variant + props)

```astro
<[Nom]
  variant="secondary"
  size="small"
  isFullWidth
>
  Mon CTA
</[Nom]>
```

## Tokens utilisés

Liste des CSS vars consommées par le composant — utile pour vérifier l'impact d'un changement de token.

- `--color-watery-green-50`
- `--base-space-4`
- `--interactive-element-border-radius`
- ...

## Dépendances internes

Liste des autres composants/utils/configs importés par ce composant.

- `src/site.config.ts` (pour `externalLinkLabel`)
- `src/utils/string.utils.ts` (pour `getExternalLinkLabel`)
- ...

> ⚠️ Si une dépendance externe n'a pas été copiée localement, elle bloque la copie du composant — la signaler et demander à l'humain.

## Accessibilité

Points d'attention a11y propres à ce composant (focus visible, ARIA, contraste, etc.).

## Changelog local

| Date | Changement |
|------|------------|
| YYYY-MM-DD | Copie initiale depuis SiteA11Y |

````

## Règles

- **Une fiche par composant local.** Pas de fiche pour les composants encore dans SiteA11Y non copiés.
- **Mettre à jour la fiche à chaque modif locale** (même si la modif vient d'un re-pull SiteA11Y).
- **Lien systématique vers la frame Figma de référence** quand connu, dans la table Variants.
