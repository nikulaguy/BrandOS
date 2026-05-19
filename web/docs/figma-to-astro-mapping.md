# Mapping Figma ↔ Astro

> **Source de vérité pour Claude.** À chaque fois qu'un composant Figma doit être transformé en code, Claude consulte cette table avant d'écrire la moindre ligne.

## Comment lire

| Colonne | Sens |
|---------|------|
| **Composant Figma** | Nom exact tel qu'il apparaît dans la librairie Figma |
| **Figma key** | Identifiant unique du composant Figma (récupérable via `Figma:get_metadata` ou via le `frontguys-bindings-protocol`). `?` = à compléter à la prochaine utilisation. |
| **Astro path** | Chemin du composant Astro local correspondant (relatif à `web/`) |
| **Type** | `.astro` (statique) ou `.tsx` (React, interactif) |
| **Props clés** | Props essentielles que Claude doit fournir quand il instancie le composant |
| **Variants** | Liste des variants supportées (correspondant aux variants Figma) |
| **Fiche** | Lien vers la fiche détaillée dans `docs/components/` |
| **Statut** | ✅ mappé, 🟡 partiellement mappé (variants manquants ou props), 🔵 hypothèse non vérifiée terrain |

## Composants atomiques

| Composant Figma | Figma key | Astro path | Type | Props clés | Variants | Fiche | Statut |
|-----------------|-----------|------------|------|-----------|----------|-------|--------|
| _Aucun mapping pour l'instant — la table se remplit au fur et à mesure des copies depuis SiteA11Y._ | | | | | | | |

## Composants molécules

| Composant Figma | Figma key | Astro path | Type | Props clés | Variants | Fiche | Statut |
|-----------------|-----------|------------|------|-----------|----------|-------|--------|
| _Aucun mapping pour l'instant._ | | | | | | | |

## Composants organismes

| Composant Figma | Figma key | Astro path | Type | Props clés | Variants | Fiche | Statut |
|-----------------|-----------|------------|------|-----------|----------|-------|--------|
| _Aucun mapping pour l'instant._ | | | | | | | |

## Composants spécifiques Frontguys

| Composant Figma | Figma key | Astro path | Type | Props clés | Variants | Fiche | Statut |
|-----------------|-----------|------------|------|-----------|----------|-------|--------|
| _Aucun mapping pour l'instant._ | | | | | | | |

## Illustrations & icônes

| Nom Figma | Figma key | Asset local | Usage sémantique | Statut |
|-----------|-----------|-------------|------------------|--------|
| _Pour les illustrations Frontguys, Claude consulte d'abord le `frontguys-bindings-protocol` (Knowtion) qui contient les keys principales. Si un export local est nécessaire, il vient ici._ | | | | |

## Référentiel composants disponibles dans SiteA11Y

Liste exhaustive des composants présents dans `SiteA11Y/src/components/`, à utiliser comme **source de copie** quand un mapping est demandé. À chaque copie, on déplace l'entrée dans la table appropriée ci-dessus.

| Nom | Type | Fichier source SiteA11Y |
|-----|------|-------------------------|
| Accordion | `.astro` | `Accordion/Accordion.astro` |
| Alert | `.astro` | `Alert/Alert.astro` |
| Avatar | `.astro` | `Avatar/Avatar.astro` |
| Badge | `.astro` | `Badge/Badge.astro` |
| BadgeList | `.astro` | `BadgeList/BadgeList.astro` |
| Banner | `.astro` | `Banner/Banner.astro` |
| BusinessCases | `.astro` | `BusinessCases.astro` |
| Button | `.tsx` (React + CVA) | `Button/Button.tsx` + `Button.module.css` |
| Card | `.astro` | `Card/Card.astro` + `Card.scss` |
| Checkbox | `.astro` | `Checkbox/Checkbox.astro` |
| ContactExpertBanner | `.astro` | `ContactExpertBanner.astro` |
| CreateOpportunity | `.astro` | `CreateOpportunity.astro` |
| Footer | `.astro` | `Footer/Footer.astro` |
| FormElement | `.astro` | `FormElement/FormElement.astro` |
| Header | `.astro` | `Header/Header.astro` |
| Input | `.astro` | `Input/Input.astro` |
| KeyFigures | `.astro` | `KeyFigures.astro` |
| Link | `.astro` | `Link/Link.astro` |
| List | `.astro` | `List/List.astro` |
| Logo | `.astro` | `Logo.astro` |
| LogoLink | `.astro` | `LogoLink.astro` |
| MainHead | `.astro` | `MainHead.astro` |
| MediaObject | `.astro` | `MediaObject/MediaObject.astro` |
| PageHeader | `.astro` | `PageHeader.astro` |
| ProfileBanner | `.astro` | `ProfileBanner/ProfileBanner.astro` |
| Section | `.astro` | `Section/Section.astro` |
| SectionHeader | `.astro` | `SectionHeader/SectionHeader.astro` |
| Select | `.astro` | `Select/Select.astro` |
| SkipLinks | `.astro` | `SkipLinks/SkipLinks.astro` |
| Stack | `.astro` | `Stack/Stack.astro` |
| Text | `.astro` | `Text/Text.astro` |
| VisuallyHidden | `.astro` | `VisuallyHidden.astro` |

> Cette liste est figée au snapshot du 2026-05-19. Si SiteA11Y évolue, lancer `pnpm sync-from-prod` puis remettre à jour cette liste.
