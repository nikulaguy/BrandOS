# Typography Rules

---

## type: typography-rules last_synced: 2026-05-11 source: knowtion/design-system-frontguys/historique-decisions + figma/foundation-typography status: rules-stable / token-names-harmonizing

# Règles typographiques Frontguys

🟡 **Le nommage Heading / Title est en cours d'harmonisation dans Figma** (décisions 21-10-2025, 31-10-2025, 07-11-2025). Ce fichier encode les **règles par rôle sémantique** — elles restent valides après tout renommage.

## Système typographique — vue d'ensemble

Le système doit afficher du contenu textuel sur Frontguys.fr (marketing + blog). Décision 12-11-2025 : il doit être **suffisamment flexible pour les deux usages**.

### Inventaire par rôle (décision 06-11-2025)

| Famille de rôle | Nombre de styles | Caractéristiques |
|-----------------|------------------|------------------|
| **Titres**      | **6 styles** (du plus grand au plus petit) | Au moins les 3 plus grands sont **responsive** |
| **Body**        | **3 styles**     | On joue sur la taille et la graisse |
| **Caption** (texte secondaire) | **1 ou 2 styles** | Texte moins important |

## Référence par rôle sémantique (stable)

Plutôt que de citer des noms de tokens potentiellement instables, référence-toi par **rôle sémantique** :

| Rôle | Usage | Responsive ? |
|------|-------|--------------|
| `title.hero` | Titre principal de page (H1 d'une landing, hero d'un cas client) | ✅ Oui        |
| `title.page` | Titre de page courante (H1 d'une page secondaire) | ✅ Oui        |
| `title.section` | Titre de grande section (H2 d'une landing) | ✅ Oui        |
| `title.subsection` | Titre de sous-section (H3) | ⚪ Possible   |
| `title.card` | Titre de card / bloc / module | ⚪ Possible   |
| `title.eyebrow` | Surtitre / catégorie / overline | ❌ Non        |
| `body.lead` | Paragraphe d'introduction, plus grand que le body courant | ❌ Non        |
| `body.default` | Texte courant | ❌ Non        |
| `body.small` | Texte secondaire en flux | ❌ Non        |
| `caption` | Métadonnée, légende, date, mention | ❌ Non        |

> Les noms canoniques Figma seront stabilisés par l'équipe Design. **Demande la résolution via Figma MCP** plutôt que de figer un nom ici.

## Variables typographiques disponibles

Décision 24-11-2025 : les variables suivantes existent (sans impacter les styles eux-mêmes) :

* `weight` (graisse)
* `font-size` (avec une déclinaison `large`)
* `family` (famille de police)

Ces variables servent à composer des styles ad-hoc si un rôle pré-défini ne convient pas. À **n'utiliser qu'en dernier recours** — préférer un rôle sémantique pré-défini.

## Responsive — règles canoniques

Décision 06-11-2025 :


1. **Chaque style responsive a une taille minimale et une taille maximale**
2. **L'évolution entre min et max est linéaire** (technique CSS : `clamp(min, fluid, max)`)
3. **Le rendu reste fluide** quelle que soit la largeur de viewport
4. Les **3 plus grands styles titres** sont au minimum responsive ; les plus petits peuvent l'être aussi

**Exemple de pattern** :

```
title.hero       → clamp(48px, fluid, 96px)   /* à confirmer via Figma */
title.page       → clamp(36px, fluid, 64px)
title.section    → clamp(28px, fluid, 48px)
title.subsection → clamp(24px, fluid, 32px)
```

**Les valeurs exactes ne sont pas figées ici** — résolution Figma à la volée.

## Largeur max de contenu

Décision 21-10-2025 : **largeur max de contenu = 1200px**.

Au-delà, le contenu textuel n'est pas confortable à lire. Cette contrainte s'applique au container principal d'une page, pas aux éléments full-bleed (hero image, fond de section).

## Règles d'usage

### Hiérarchie typographique sur une page

Sur une landing Frontguys typique :

```
title.hero      (H1)
  title.section   (H2 — multiples)
    title.subsection (H3)
      title.card     (H4 si applicable)
```

**Ne pas sauter de niveaux** pour des raisons SEO + accessibilité (RGAA).

### Body

* `body.lead` — introduction d'une page ou d'une section, un seul par bloc
* `body.default` — paragraphes courants
* `body.small` — précisions, mentions inline, texte de support

### Caption / mention

Pour les dates, métadonnées d'article, mentions légales courtes, légendes d'image.

### Couleur du texte

Le rôle typographique détermine la **taille / graisse / line-height**, pas la couleur.

**La couleur du texte vient de Tokens Usage Rules** :

* `foreground.text.default` — par défaut
* `foreground.text.subtle` — pour caption / mentions
* `foreground.text.default-invert` — sur fond sombre

## Anti-patterns

* ❌ Coder une taille de police en dur (`font-size: 32px`)
* ❌ Mélanger les rôles : utiliser `title.hero` au milieu d'un article
* ❌ Sauter des niveaux de titre (H1 → H4)
* ❌ Étirer du texte au-delà de 1200px
* ❌ Mettre du body en couleur de marque (texte courant = neutre)
* ❌ Appliquer le responsive sur `caption` (inutile, gain visuel nul)

## Familles de police

Les familles de police sont définies dans Figma (variable `family`). **Ne pas coder de fallback en dur** — la stack typographique vient de la définition Figma.

Pour récupérer les valeurs au moment du build / render, voir **Figma MCP Cheatsheet**.