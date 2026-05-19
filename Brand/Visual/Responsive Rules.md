# Responsive Rules

---

## type: responsive-rules purpose: Règles de layout et d'adaptation responsive Frontguys — 4 breakpoints, 2 modes typo, transition desktop → mobile last_synced: 2026-05-12 source: Figma UI to Dev Website A11Y (fileKey `MxeRvqRBPDdeKcZyUJDRJh`) — page "Spec. Responsive" + analyse cross-référencée page "Final to Dev." (Accueil Desktop ↔ Mobile) status: stable

# Règles responsive Frontguys

Tout asset Frontguys (page web, écran de site) est produit en **deux versions séparées Desktop et Mobile**. Pas de magie auto-layout : on contrôle explicitement les deux. Les règles de transition sont documentées ici pour permettre de produire une version desktop puis sa déclinaison mobile en respectant la cohérence DS.

## Les 4 breakpoints canoniques

| Breakpoint | Viewport cible | Largeur contenu | Statut |
|------------|----------------|-----------------|--------|
| **1440 Max.** | ≥ 1440px       | 1440px (max-content) | Desktop large |
| **1024**   | 1024–1439px    | 1024px          | Desktop standard |
| **760**    | 760–1023px     | 760px           | Tablette / mobile large |
| **320 Min.** | ≤ 319px        | 320px (min-content) | Mobile portrait |

**Convention de production Frontguys** : on produit **systématiquement** un écran **Desktop (1440)** et un écran **Mobile (320)**. Les paliers intermédiaires (1024, 760) sont obtenus par interpolation responsive côté code (CSS `clamp()` + media queries) ; ils ne nécessitent pas de design Figma dédié dans le workflow standard.

> Si un écran nécessite une variante intermédiaire spécifique (ex: dashboard tablette), produire un 3ᵉ frame nommé `{Écran} 760` ou `{Écran} 1024`.

## Valeurs spacing par breakpoint

Toutes les valeurs sont en pixels. **À binder via les variables** `**spacing/base-\***` **du DS** (voir `skills/figma/frontguys-bindings-protocol.md`).

### Section générique (frame de section avec padding interne)

| Breakpoint | `paddingLeft/Right` | `paddingTop/Bottom` | `itemSpacing` (gap entre enfants) |
|------------|-------------------|-------------------|---------------------------------|
| **1440 Max.** | **96** → `spacing/base-24` | **72** → `spacing/base-?` ¹ | **56** → `spacing/base-14`      |
| **1024**   | **72** → `spacing/base-?` ¹ | **56** → `spacing/base-14` | **32** → `spacing/base-8`       |
| **760**    | **36** → `spacing/base-?` ¹ | **36** → `spacing/base-?` ¹ | **16** → `spacing/base-4`       |
| **320 Min.** | **16** → `spacing/base-4` | **36** → `spacing/base-?` ¹ | **32** → `spacing/base-8` ²     |

¹ Les valeurs `72` et `36` ne correspondent pas exactement à l'échelle `spacing/base-N` actuelle (qui contient 4, 8, 12, 16, 24, 32, 40, 48, 56, 80, 96). À snapper sur la plus proche **ou** créer des variables dédiées (`spacing/base-9` = 36, `spacing/base-18` = 72) si l'équipe DS les introduit.

² Note de pattern non-monotone : le gap interne **remonte de 16 (760) à 32 (320)**. Ce n'est pas une erreur — à 320, le contenu doit "respirer" davantage entre éléments pour rester lisible sur petit écran.

### Header & Footer (instances DS)

Les composants Header et Footer ont des **variants par device** dans le DS. À utiliser tels quels — leurs paddings sont gérés par le composant :

| Composant | Desktop variant | Mobile variant |
|-----------|-----------------|----------------|
| `header`  | `device=desktop, State=default` | `device=mobile, State=default` (ou `flyover` selon contexte menu) |
| `footer`  | `device=desktop` | `device=mobile` |

## Typographie responsive — 2 modes Small / Large

Les **text styles Frontguys ont 2 modes** dans leur collection de variables : **Small** et **Large**.

| Mode | Quand l'utiliser | Effet |
|------|------------------|-------|
| **Large** | Frame Desktop (largeur ≥ 1024px) | Tailles "large" : H1 \~48px, Body 1 \~18px, etc. |
| **Small** | Frame Mobile (largeur < 1024px) | Tailles "small" : H1 \~32px, Body 1 \~16px, etc. |

> Les valeurs exactes sont contrôlées par les variables `font/size/*` du DS — le LLM n'a pas besoin de les hardcoder.

> ⚠ **À mettre dans le protocole** : tout frame Mobile (largeur < 1024) doit avoir le mode `Small` explicitement défini sur la collection de tailles typo. Sans ça, le frame hérite du mode Large parent → tailles desktop sur un design mobile.

## Pattern d'adaptation Desktop → Mobile

### Règle 1 : Sections HORIZONTAL → VERTICAL

Toute section en `layoutMode: HORIZONTAL` sur desktop **devient** `**VERTICAL**` **sur mobile**, sauf cas spéciaux explicites (header, footer logo+nav, button row courte).

| Section type | Desktop | Mobile |
|--------------|---------|--------|
| Hero split 55/45 (texte + illustration) | `HORIZONTAL` | `VERTICAL` (illustration en haut OU masquée) |
| Section 2-col (texte + média) | `HORIZONTAL` | `VERTICAL` |
| Grille 4 cards 2×2 | `VERTICAL` contenant 2 rows `HORIZONTAL` | `VERTICAL` contenant 4 cards en colonne |
| Grille 3 cards | `HORIZONTAL` | `VERTICAL` |
| Stats 3 colonnes | `HORIZONTAL` | `VERTICAL` |

### Règle 2 : Padding/spacing — descente cohérente

Pour chaque section, appliquer les valeurs du breakpoint correspondant. Ne pas mélanger : une section Mobile a TOUS ses paddings/gaps en valeurs Mobile, pas un mix.

### Règle 3 : Largeur des enfants — toujours `FILL` sur mobile

Sur mobile, les sous-frames (titres, body, grilles) doivent avoir `layoutSizingHorizontal: 'FILL'` pour occuper toute la largeur dispo (320 - 16×2 = 288px).

### Règle 4 : Composants DS — variants par device

* `header` → variant `device=mobile`
* `footer` → variant `device=mobile`
* `card` (simple, photo) → pas de variant device dans le DS actuel — l'instance s'adapte naturellement à sa largeur parent
* `Button` → pas de variant device — taille `medium` partout, `small` si besoin de compacité
* `DifferentiatorItem`, `StepIndicator` → pas de variant device dans le DS — à vérifier visuellement le rendu mobile

### Règle 5 : Masquer ou simplifier les éléments décoratifs

Les illustrations outline plein bord (Hero, Stats) peuvent être **masquées** ou **réduites** sur mobile (320 trop étroit pour qu'elles aient un sens). À discuter au cas par cas.

## Workflow de production responsive

### Étape 1 — Produire la version Desktop d'abord

C'est la version "source" qui contient tout le contenu et la richesse visuelle. Largeur 1440px. Valeurs spacing du breakpoint **1440 Max.**.

### Étape 2 — Décliner en Mobile

Créer un **nouveau frame** (pas un clone) nommé `{Écran} Mobile`, 320px large, sans `Menu Mobile` séparé (variant header `device=mobile` inclut le burger).

Pour chaque section du desktop :

* Créer une section équivalente Mobile avec :
  * Même structure narrative (eyebrow / H / body / CTAs / etc.)
  * **Layout VERTICAL** systématique (sauf cas spéciaux)
  * **Paddings 320 Min.** : padL/R 16, padT/B 36, gap 32
  * **Variants composants mobile** (header, footer)
  * **Mode Small** sur la collection font/size
  * `**layoutSizingHorizontal: 'FILL'**` sur les enfants

### Étape 3 — Pre-flight check responsive

Vérifier :

- [ ] Largeur Desktop = 1440px, largeur Mobile = 320px
- [ ] Headers et Footers utilisent les bons variants device
- [ ] Aucune section Mobile en `HORIZONTAL` (sauf exception documentée)
- [ ] Tous les paddings/gaps Mobile sont aux valeurs du breakpoint 320 Min.
- [ ] Mode `Small` activé sur les collections font/size pour le frame Mobile
- [ ] Toujours les **bindings** activés (le check du protocole `frontguys-bindings-protocol` s'applique)

## Anti-patterns

| ❌ Anti-pattern | ✅ Correct |
|----------------|-----------|
| Clone du desktop puis resize manuel à 320 | Création d'un nouveau frame Mobile avec ses propres valeurs |
| Réutiliser les paddings 96 sur mobile | Appliquer 16 (variable `spacing/base-4`) |
| Section `HORIZONTAL` 3-col sur 320px | Bascule en `VERTICAL`, cards en colonne |
| Garder le mode `Large` sur les text styles mobile | Switcher explicitement vers mode `Small` |
| Header desktop `device=desktop` dans le frame Mobile | Header `device=mobile` |
| Hardcoder `width: 288px` sur les enfants Mobile | `layoutSizingHorizontal: 'FILL'` |
| Designer mobile sans le DS (à main levée) | Importer les mêmes composants DS, juste leurs variants mobile |