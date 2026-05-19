# Tokens Architecture

---

## type: tokens-architecture last_synced: 2026-05-11 source: knowtion/design-system-frontguys/historique-decisions + figma/foundation-colors status: stable

# Architecture des tokens couleur Frontguys

L'architecture des tokens couleur Frontguys repose sur **deux niveaux** (Core et Semantic) et **quatre groupes sémantiques**.

## Niveaux

### Core — couleurs de la marque, brutes

La couche **Core** contient toutes les couleurs de marque Frontguys, déclinées en teintes (10 = plus clair → 90 = plus sombre).

**Familles Core connues** :

* **Watery Green** — couleur primaire Frontguys
* **Crayola Yellow** 🟡 — accent / chaleur (teintes en cours d'harmonisation)
* **Rythm Grey** — neutre / texte par défaut (gris)
* Couleurs utilitaires (succès, erreur, info, warning) — voir Figma pour la liste exacte

**Règle d'usage Core** : le code applicatif ne consomme **pas** les tokens Core directement. Core est réservé au design dans Figma et à la composition de la couche Semantic.

### Semantic — couleurs appliquées par rôle

La couche **Semantic** mappe les Core sur des rôles d'usage. C'est ce que le code consomme.

## Quatre groupes Semantic

Après le refactor du 12-12-2025, les groupes sont :

### 1. `background`

Couleurs de fond. Fusion des anciens groupes `base` (sections) et `page` (page entière).

**Usage** : `background`, `surface`, `card`, fond de section, fond de page.

### 2. `foreground`

Couleurs de contenu **lisible sur un fond**. Fusion des anciens groupes `text` et `icon`.

**Tokens canoniques connus** :

* `text-default` — texte principal (gris, pas Watery Green — décision 24-11-2025)
* `text-subtle` — texte secondaire/discret (ajouté le 27-11-2025)
* `text-default-invert` — texte clair sur fond sombre (notion `invert`)

**Usage** : `color`, icônes héritant de `currentColor`, bordures de texte.

### 3. `border`

Couleurs de bordure / séparateur. Au même niveau que `background` et `foreground`.

### 4. `accent`

Couleur(s) d'accentuation. Ex-`alternative-2` (renommé le 12-12-2025).

**Usage** : highlight ponctuel, badge, élément de rappel visuel.

## Notions transversales

### `invert`

Quand un contenu (texte, icône) apparaît **sur un fond sombre** en light mode, on suffixe `-invert`. Symétrique en dark mode.

| Contexte | Token de contenu |
|----------|------------------|
| Texte sur fond clair (cas par défaut light mode) | `foreground.text.default` |
| Texte sur fond sombre (ex: bouton primary, fond Watery Green 90) | `foreground.text.default-invert` |

### `on-X`

Pattern alternatif observé pour le contenu **posé sur** un fond nommé : `on-primary`, `on-info`, `on-warning`, etc.

* `on-primary` — couleur de contenu sur un fond `primary` (typiquement le bouton primary)
* `on-info`, `on-warning`, `on-error`, `on-success` — pour les badges et messages d'état

**Décision 31-10-2025** : le pattern `on-X` cohabite avec `default-invert`. `on-X` est plus spécifique (contraint à un fond donné) ; `default-invert` est plus générique (n'importe quel fond sombre).

### Couches d'élévation (héritage avant 12-12-2025)

Le système comportait 3 niveaux d'élévation `page > base > content`. Depuis la fusion :

* `page` + `base` → `**background**`
* `content` (text + icon + border) éclaté en → `**foreground**` + `**border**`

Si un asset hérité utilise encore `page` / `base` / `content`, **considérer comme obsolète** et basculer vers les groupes actuels.

## Tokens supprimés / dépréciés

| Token | Statut | Remplacé par |
|-------|--------|--------------|
| `color-text-white` (et autres noms avec couleur en dur) | ❌ Interdit | Nom sémantique selon usage |
| `alternative-2` | ❌ Renommé | `accent`     |
| Groupe `base` | ❌ Fusionné | `background` |
| Groupe `page` | ❌ Fusionné | `background` |
| Groupe `content` | ❌ Éclaté | `foreground` + `border` |
| Groupe `button` (tokens dédiés bouton) | ❌ Supprimé (02-11-2025) | Tokens d'interaction génériques |
| Couleurs alternatives en Semantic | ❌ Retirées (12-12-2025) | Conservées dans Core seulement |

## Tokens transparents

Décision 05-11-2025 : tokens transparents créés dans Core et Semantic.

**Usage** : effets hover sur Button Secondary et Ghost (effet voilé sans fond opaque). Dérivés typiquement de `Watery Green 90` avec alpha.

## Règles de nommage

* **Pas de valeur en dur** dans le nom (`text-white` ❌, le nom doit rester valide light + dark)
* **Camel/kebab cohérent** dans Figma — observer le nom exact via MCP avant usage
* **Référence par rôle** dans le code : `foreground.text.default`, pas `Rythm Grey 80`

## Modes light & dark

Les deux modes sont **activement supportés**. Tout token Semantic est défini dans les deux modes. Voir **Modes Light Dark** pour les règles de cohabitation.