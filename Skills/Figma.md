# Figma

---

## type: skills-index domain: figma-native source: https://github.com/figma/mcp-server-guide upstream_version: main (snapshot 2026-05-12) purpose: Index des 9 skills officiels Figma MCP, contextualisés pour Frontguys

# Skills Figma natifs — index Frontguys

Cette section contient les **9 skills officiels Figma** (repo `figma/mcp-server-guide`), copiés tels quels avec leurs références. Ils encodent les workflows natifs de l'écosystème Figma MCP. Ils **complètent** les skills Frontguys (`create-slide-deck`, `create-landing-page`, etc.) qui orchestrent l'identité, la voix, et les composants.

## Mapping skills Figma ↔ skills Frontguys

Pour chaque cas d'usage Frontguys, voici quel(s) skill(s) charger :

| Demande | Skill Frontguys (orchestrateur) | Skills Figma natifs à mobiliser |
|---------|---------------------------------|---------------------------------|
| "Fais-moi une slide Figma Slides" | `create-slide-deck`             | `figma-use` (toujours) + `figma-generate-design` (composition d'écrans) |
| "Fais-moi une landing Astro à partir d'un design Figma" | `create-landing-page`           | `figma-implement-design` (extraction context + screenshot) |
| "Implémente ce composant Astro depuis Figma" | — (direct)                      | `figma-implement-design`        |
| "Crée un nouveau fichier Figma pour un cas client" | — (direct)                      | `figma-create-new-file`         |
| "Mappe les composants Astro Frontguys aux composants Figma" | — (équipe DS)                   | `figma-code-connect`            |
| "Génère les règles design system pour notre repo" | — (équipe DS)                   | `figma-create-design-system-rules` |
| "Fais-moi un diagramme de flow client (FigJam)" | — (direct)                      | `figma-generate-diagram` + `figma-use-figjam` |
| "Construis un design system Figma depuis le repo Frontguys" | — (équipe DS, rare)             | `figma-generate-library`        |

## Sous-pages

### 🔴 Règle absolue

* **Frontguys Bindings Protocol** — protocole obligatoire avant TOUTE production Figma dans un fichier Frontguys

### 🏗 Fondamentaux (à charger en prérequis)

* **figma-use** — PRÉREQUIS de tout `use_figma`
* **figma-use-figjam** — prérequis pour FigJam (stickies, connectors, shapes)

### 🎨 Production design dans Figma

* **figma-create-new-file** — créer un nouveau fichier (design ou FigJam)
* **figma-generate-design** — construire/MAJ un écran depuis du code/description
* **figma-generate-library** — bâtir/MAJ une library complète depuis une codebase
* **figma-generate-diagram** — diagrammes FigJam depuis Mermaid

### 💻 Production code depuis Figma

* **figma-implement-design** — traduire un design Figma en code 1:1
* **figma-code-connect** — mapper composants Figma ↔ code (Org/Enterprise)
* **figma-create-design-system-rules** — générer règles DS tailored au repo

## Règles d'usage Frontguys-specific

### 0. 🔴 RÈGLE ABSOLUE — Bindings obligatoires (AUCUNE valeur en dur)

**Avant TOUTE production Figma dans un fichier Frontguys**, charger **Frontguys Bindings Protocol**.

Ce protocole encode la règle absolue : **aucune valeur (couleur, spacing, padding, itemSpacing, radius, fontSize) ne doit jamais être en dur**. Tout doit être bindé via :

* `bindFill(node, varName)` pour les couleurs
* `node.setBoundVariable(prop, variable)` pour spacings et radius
* `node.textStyleId = styles[name].id` pour les textes

Le protocole inclut : inventaire complet des variables et keys du DS, mapping valeur → variable, pre-flight check obligatoire, helpers à utiliser systématiquement.


:::warning
**L'utilisateur ne doit JAMAIS avoir à repasser derrière la production pour vérifier qu'aucune valeur n'est en dur.** Si c'est le cas, c'est un bug.

:::

### 1. Toujours `figma-use` en prérequis pour les écritures

Quand un skill Frontguys a besoin d'écrire dans Figma (slides, design system, etc.), il **doit charger** `**figma-use**` **AVANT** d'appeler `use_figma`. Les règles critiques (couleurs 0-1, font-loading, await, etc.) y sont documentées.

### 2. Mobiliser les sources Frontguys en amont

Avant d'exécuter un skill Figma (typiquement `figma-implement-design` ou `figma-generate-design`), **toujours charger d'abord** :

* **Brand > Voice > Writing Rules + Vocabulary** (pour le copy)
* **Brand > Visual > Tokens Snapshot** (pour les valeurs)
* **Brand > Components > Conventions** (pour les patterns Astro)
* Le persona ciblé (**Brand > Identity > Personas > {nom}**)

### 3. Adapter le rendu à la convention Frontguys

Les skills Figma natifs supposent par défaut **React + Tailwind**. Pour Frontguys :

* Cible **Astro 5** (composants `.astro`) + SCSS modulaire, sauf pour `Button` (React polymorphique avec CVA)
* Cible les **24 composants atomic** + 9 composants flat documentés dans **Brand > Components**
* Tokens : consommer `src/tokens/*.json` via CSS variables (cf **Brand > Visual > Tokens Snapshot**)

### 4. Fichiers Figma Frontguys de référence

Voir **Brand > Visual > Figma MCP Cheatsheet** pour la liste des fileKeys et les patterns de requête.

### 5. Économie de tokens IA

Les skills Figma natifs ont des `references/` (sous-fichiers de patterns détaillés). **Ne les charger qu'à la demande**, jamais en bloc. Notamment `figma-use/references/` contient 21 fichiers (gotchas, common-patterns, component-patterns, variable-patterns, text-style-patterns, etc.) — charger uniquement le pattern pertinent.

### 6. Statut beta et rate limits

Le repo Figma indique que ces skills sont **en beta**. Les écritures dans Figma seront éventuellement payantes. Pour l'instant, gratuit. Les lectures sont rate-limited (Tier 1 REST API pour les seats Dev/Full).

## Maintenance et mise à jour

* **Source canonique** : `github.com/figma/mcp-server-guide`
* **Re-sync** : copier le dossier `skills/` depuis un git clone récent du repo Figma
* **Adaptation Frontguys** : ce hub est le **seul fichier à maintenir** côté Brand OS — les SKILL.md individuels restent identiques à upstream pour faciliter la re-sync

> Si tu modifies un SKILL.md officiel, **commenter explicitement la divergence** en tête du fichier (`# Frontguys adaptation : ...`).

## Crédits

Skills produits par l'équipe Figma. Source : https://github.com/figma/mcp-server-guide Licence : voir le repo Figma (Figma Developer Terms)