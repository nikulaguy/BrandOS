# Modes Light Dark

---

## type: modes-light-dark last_synced: 2026-05-11 source: knowtion/design-system-frontguys/historique-decisions status: actively-iterating

# Modes Light & Dark

🟡 **Le dark mode est activement supporté et en itération continue** (décisions 26-11-2025 → 12-12-2025). Les règles ci-dessous sont stables, les valeurs Figma peuvent évoluer.

## Principe directeur

Frontguys supporte **light mode et dark mode** comme deux modes équivalents. Tout composant qui n'a pas son équivalent dark **n'est pas terminé** (décision 26-11-2025).

## Mécanisme

* Les **tokens Semantic** sont définis dans les deux modes (Figma)
* Le code applicatif consomme **toujours le même nom Semantic** — pas de logique conditionnelle dans le code
* Figma fait varier la valeur résolue selon le mode actif (toggle utilisateur ou préférence système)

**Conséquence** : tu n'écris **jamais** `if (dark) color = X else color = Y`. Tu écris `color = var(--color-foreground-text-default)` et Figma fait son travail.

## Notion `invert` vs `on-X`

C'est le mécanisme central pour gérer les contenus posés sur fond contrasté.

### `invert`

Pour un contenu placé sur un fond qui **inverse la luminosité du mode courant** :

* En **light mode**, le fond par défaut est clair. Un fond Watery Green 90 (sombre) est l'inverse → contenu en `*-invert` (clair)
* En **dark mode**, le fond par défaut est sombre. Un fond Watery Green 10 (clair) est l'inverse → contenu en `*-invert` (sombre)

Le mot `invert` signifie "à l'opposé du mode courant", pas "toujours clair".

### `on-X`

Pour un contenu placé sur un fond **explicitement nommé** (primary, info, warning…) : `on-primary`, `on-info`.

**Quand utiliser quoi ?**

* `invert` → fond générique sombre/clair, pas de sémantique attachée
* `on-X` → fond nommé, le contenu adopte la couleur prévue pour ce fond

## Validation de la logique "on alternative"

Décision 04-12-2025 :

> Validation de l'utilisation de la logique "On alternative" qui fonctionne correctement pour le mode Dark.

Le pattern `on-{nom}` (alternative inclus) est confirmé comme valide pour le dark.

## Problématique des badges (décision 04-12-2025)

> Constat d'incohérences de couleurs sur les illustrations (dark vs. light) Problématique spécifique des badges qui passent de blanc (en Light) à coloré (en Dark)

Les badges ne se contentent pas de "switch de couleur" : leur **rôle visuel** change entre modes. Ne pas appliquer naïvement le même token Semantic pour fond et bordure de badge dans les deux modes.

**Règle d'usage** : pour un badge dans un nouveau composant, **vérifier visuellement dans Figma** que le rendu dark est cohérent. Si non, demander à l'équipe DS plutôt que d'improviser.

## Couleurs et thématique

Décisions 05-12 et 02-12-2025 :

* **De base, Frontguys ne souhaite pas lier une couleur à une thématique** (ex: jaune = formation, vert = enjeu)
* Avec le dark mode, cette règle a été partiellement reconsidérée mais **on peut s'en affranchir**
* Les **badges contextuels** (enjeu, offre, formation) sont l'exception : ils sont associés à des contextes spécifiques

## Illustrations en dark mode

Les illustrations Frontguys doivent **fonctionner dans les deux modes**. Décision 04-12-2025 : incohérences identifiées sur les illustrations entre light et dark — itérations en cours par Julien Bourcet.

**Règle d'usage actuelle** : si tu utilises une illustration dans une page susceptible d'être affichée en dark, **vérifier le rendu** et alerter si problème.

## Anti-patterns

* ❌ Hardcoder une couleur de mode (`if dark…`) dans le code applicatif
* ❌ Définir un composant uniquement en light — **toujours penser dark**
* ❌ Réutiliser un token light tel quel en dark sans vérifier visuellement
* ❌ Inventer une couleur "dark équivalente" d'une couleur Core light en dehors de Figma
* ❌ Supposer qu'un badge fonctionne dans les deux modes sans vérification
* ❌ Confondre `invert` (inversion par rapport au mode courant) et "clair" (statique)