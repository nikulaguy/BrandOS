# Interaction States

---

## type: interaction-states last_synced: 2026-05-11 source: knowtion/design-system-frontguys/historique-decisions status: stable

# États d'interaction Frontguys

Pattern canonique pour les composants interactifs (Button, Link, et tout élément cliquable).

## Décision fondatrice (02-11-2025)

> Les éléments d'interaction (Button et Link) partagent la **même couleur de base**. Cette couleur change selon l'interaction de l'utilisateur. La logique de ces changements doit rester la même d'un composant à un autre.

**C'est la règle la plus importante** : tous les composants interactifs Frontguys suivent **le même pattern**. Un nouveau composant interactif doit s'aligner sur ce pattern, pas en inventer un.

## Pattern des quatre états

À chaque interaction, on **fait varier la teinte de 10** (du plus foncé au plus clair, ou inversement selon le sens).

| État | Comportement | Exemple sur Watery Green |
|------|--------------|--------------------------|
| **Default** | État au repos | `Watery green 90`        |
| **Hover** | Survol curseur | `Watery green 80`        |
| **Active** (= Pressed) | Pendant le clic | `Watery green 70`        |
| **Disabled** | Non interactif | `Watery green 60`        |

> Les valeurs ci-dessus sont **illustratives** — la teinte de référence et le sens (foncé → clair ou inverse) peuvent évoluer selon la décision DS. Toujours requêter Figma MCP.

## Logique universelle

Le pattern doit être **simple à comprendre et à utiliser** (décision 02-11-2025) :


1. **Une seule teinte par composant interactif** — pas de saut de teinte entre states
2. **Variation de ±10** sur l'échelle Core entre chaque state
3. **Sens cohérent** — si on s'éclaircit au hover, on continue à s'éclaircir à l'active

⚠ Le système peut sembler contraignant si la teinte de référence rend mal en default. La solution est de **changer la teinte de référence**, pas de casser le pattern.

## Composants concernés

### Bouton — toutes variantes

| Variante | Comportement |
|----------|--------------|
| **Primary** | Background suit le pattern, texte = `foreground.on-primary` (ou `text.default-invert`) |
| **Secondary** | Background transparent → tokens transparents dérivés au hover (alpha sur Watery Green 90, décision 05-11-2025) |
| **Ghost** | Identique secondary mais sans bordure |

Avant 02-11-2025, des tokens dédiés `button.*` existaient. **Ils ont été supprimés** (02-11-2025). Le bouton consomme les tokens d'interaction génériques.

### Lien

Décision 02-11-2025 :

> Les liens dans le footer, le header, dans une card ou au sein d'un paragraphe de texte auront sûrement des comportements différents (certains soulignés de base et d'autres non). Leur couleur de base et celles associées aux états devront suivre **la même logique que celle des boutons**.

| Type de lien | Souligné par défaut ? | Couleur |
|--------------|-----------------------|---------|
| Lien inline (dans un paragraphe) | Oui (typique)         | Pattern Watery Green |
| Lien header / nav | Non                   | Pattern Watery Green |
| Lien footer  | Non                   | Pattern Watery Green |
| Lien dans une card | Variable              | Pattern Watery Green |

Le **highlight du lien "Contact"** dans le header est un cas particulier (décision 12-12-2025) — utiliser l'`accent` plutôt que le pattern par défaut.

## États supplémentaires

### Focus

Discussion en cours sur le **focus ring** qui remplacerait le style de focus natif (décision 27-11-2025). Tant qu'il n'est pas figé, **conserver l'outline natif du navigateur** pour ne pas casser l'accessibilité.

### Loading

Pas de pattern Frontguys consolidé — référer à Figma au cas par cas.

### Selected / Active (état persistant, ex: onglet courant)

Distinct d'`Active` (= pressed transitoire). Utiliser typiquement l'`accent` ou une bordure `border.selected` si défini dans Figma.

## Modes light & dark

Le pattern **s'inverse en sens** mais reste structurellement identique :

* En light mode, on part typiquement d'une teinte foncée et on s'éclaircit au hover
* En dark mode, on part d'une teinte claire et on s'assombrit au hover

Les tokens Semantic gèrent ce switch automatiquement. **Le code ne change pas** entre les deux modes — il consomme la même référence Semantic, Figma fait varier la valeur.

## Cas particuliers

### Composants Input et Textarea

Décision 27-11-2025 : **suppression de l'état hover** sur Input et Textarea. Seuls `default`, `focus`, `disabled`, `error` restent.

### Composant Card

Si la Card est cliquable, elle suit le pattern. Sinon, pas d'état hover.

### Badges

Pas interactifs par défaut → pas de pattern d'interaction.

## Anti-patterns

* ❌ Inventer un nouveau pattern d'interaction pour un composant — toujours réutiliser
* ❌ Sauter une teinte entre default et hover (-20 au lieu de -10)
* ❌ Mélanger des familles de couleur entre states (default Watery Green, hover Yellow)
* ❌ Utiliser un token de groupe `button.*` (supprimé)
* ❌ Définir un état sans son équivalent dark mode
* ❌ Mettre un focus ring custom tant que la décision DS n'est pas figée — utiliser l'outline natif