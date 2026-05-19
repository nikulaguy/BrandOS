# Tokens Usage Rules

---

## type: tokens-usage-rules last_synced: 2026-05-11 source: knowtion/design-system-frontguys/historique-decisions status: stable

# Règles d'usage des tokens couleur

Ce fichier dit **quel token utiliser dans quel cas**. Les valeurs sont résolues via le MCP Figma (voir **Figma MCP Cheatsheet**).

## Principe directeur

**Le code consomme Semantic, jamais Core.**

Si tu as besoin d'une couleur, demande-toi :


1. Quel est son **rôle** (fond / contenu / bordure / accent) ?
2. Quel est son **niveau hiérarchique** (principal / secondaire / discret) ?
3. Sur **quel fond** apparaît-elle (clair / sombre / nommé) ?

Tu obtiens alors le chemin Semantic à requêter.

## Choisir le rôle

| Tu as besoin de… | Groupe Semantic |
|------------------|-----------------|
| Fond de page, de section, de card, de surface | `background`    |
| Couleur de texte, d'icône, de symbole | `foreground`    |
| Trait de séparation, bordure de composant | `border`        |
| Highlight ponctuel, badge, élément de rappel | `accent`        |

## Choisir le niveau hiérarchique

### Pour le `foreground` (texte / icônes)

| Hiérarchie | Token canonique | Quand l'utiliser |
|------------|-----------------|------------------|
| Principal  | `foreground.text.default` | Texte courant, titres, contenu lisible |
| Secondaire | `foreground.text.subtle` | Métadonnées, légendes, contenu discret |
| Sur fond sombre | `foreground.text.default-invert` | Texte clair sur fond Watery Green sombre |
| Sur fond nommé | `foreground.on-{nom}` (ex: `on-primary`) | Contenu sur un fond explicitement coloré |

**Anti-pattern** : ne **jamais** mettre un texte de body en `accent` ou en couleur de marque. Le texte de lecture reste neutre.

### Pour le `background`

| Hiérarchie | Quand l'utiliser |
|------------|------------------|
| Background de page (1) | Fond de la `<html>` / `<body>` |
| Background de section (2) | Fond de section ou de bloc de contenu |
| Background de card / surface (3) | Cards, modales, panels élevés |

Les valeurs exactes des 3 niveaux sont à requêter dans Figma — ne pas réinventer.

### Pour `accent`

L'`accent` (héritier d'`alternative-2`) sert à **attirer le regard sur un élément ponctuel** : un badge, un highlight de lien dans le header (ex: lien "Contact"), un élément de rappel.

**Règle d'arbitrage** : si tu te poses la question "primary ou accent ?", c'est probablement primary. L'accent est rare par définition.

## Choisir selon le fond cible

C'est la règle la plus importante. **La couleur de contenu dépend du fond.**

| Fond | Texte / icône | Bordure |
|------|---------------|---------|
| Background light (par défaut) | `foreground.text.default` (sombre) | `border.default` |
| Background dark / Watery Green 90 / brand sombre | `foreground.text.default-invert` (clair) | `border.invert` ou `border.subtle-invert` |
| Background nommé (primary, info, warning…) | `foreground.on-{nom}` | `border.on-{nom}` si défini |

**Vérifie toujours** que le contraste résultant respecte WCAG AA (4.5:1) au minimum, AAA (7:1) idéalement.

## Cas Frontguys courants

### Bouton primary

* Background : Watery Green (primary, mode-dépendant)
* Texte : `foreground.on-primary` ou `text.default-invert`
* Hover / active / disabled : voir **Interaction States**

### Bouton secondary / ghost

* Background : transparent (ou `transparent` Semantic dérivé pour le hover)
* Texte : `foreground.text.default`
* Bordure (secondary uniquement) : `border.default`
* Hover : background transparent dérivé de Watery Green 90 (alpha)

### Lien dans un paragraphe

* Couleur de base = même que Button primary (Watery Green family) — règle 02-11-2025
* Souligné ou non : varie selon l'emplacement (header / footer / inline)
* États : suivent le **même pattern** que les boutons (**Interaction States**)

### Badge contextuel

Décision 12-12-2025 : les badges sont associés à des contextes (enjeu / offre / formation).

* Badge `enjeu` → palette dédiée
* Badge `offre` → palette dédiée
* Badge `formation` → palette dédiée

Les correspondances exactes sont à requêter dans Figma. **Ne pas inventer** une couleur de badge.

### Couleurs de statut

| Statut | Tokens d'usage |
|--------|----------------|
| Success | `background.success`, `foreground.on-success`, `border.success` |
| Error  | `background.error`, `foreground.on-error`, `border.error` |
| Warning | `background.warning`, `foreground.on-warning`, `border.warning` |
| Info   | `background.info`, `foreground.on-info`, `border.on-info` |

Les **noms exacts varient** dans Figma — vérifier via MCP.

## Anti-patterns récurrents

* ❌ Utiliser un token Core (`Watery Green 80`) dans du code applicatif — **toujours passer par Semantic**
* ❌ Mettre une valeur en dur "parce que c'est plus simple" — **toujours requêter Figma MCP**
* ❌ Réutiliser un token de groupe `error` comme accent — les groupes ne se croisent pas
* ❌ Mélanger les niveaux d'élévation (background, surface) sans logique d'empilement
* ❌ Définir une règle visuelle qui ne fonctionne qu'en light mode — **toujours vérifier en dark**
* ❌ Référencer un token Figma supprimé (`base`, `page`, `content`, `alternative-2`, `color-text-white`)