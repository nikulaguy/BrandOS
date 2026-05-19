# create-landing-page

# create-landing-page


---

name: create-landing-page description: Composer une landing page Frontguys (Astro production-ready OU frame Figma) en utilisant les composants existants. triggers: \["fais-moi une landing page", "page web", "landing", "page d'accueil", "page formation", "construis une page dans figma", "build figma page"\] files_to_load_always:

* brand/voice/writing-rules
* brand/voice/vocabulary
* brand/components/README
* brand/components/conventions
* brand/visual/tokens-snapshot
* frontguys-bindings-protocol (si sortie Figma) files_to_load_conditional:
* brand/identity/personas/{persona}
* brand/identity/convictions
* brand/identity/positioning
* brand/components/catalog/\* (par composant utilisé)
* templates/astro/page.astro.template (Phase 3+) last_synced: 2026-05-13


---

# Skill — create-landing-page

## Quand utiliser

* Construction d'une **page Astro complète** pour le site Frontguys (homepage, expertise, formations, cas clients, contact, etc.) → **Sortie A :** `**.astro**`
* Construction d'une **frame Figma complète** dans un fichier Frontguys fourni par l'utilisateur → **Sortie B : frame Figma assemblée à partir des composants DS publiés**

Le contenu éditorial (sections, copy, CTAs) est le même dans les deux cas. Seule la cible de livrable change.

**Ne pas utiliser** pour : une section isolée (→ `create-web-section`), un texte sans structure (→ `write-copy`), une présentation (→ `create-slide-deck`).

## Choisir la sortie

| Indice dans la demande | Sortie attendue |
|------------------------|-----------------|
| "Construis dans Figma", "page Figma", "frame Figma", URL Figma fournie | **Sortie B — Figma** |
| "Fichier `.astro`", "page Astro", "à coller dans `src/pages/`", pas de mention Figma | **Sortie A — Astro** |
| Ambigu                 | **Demander** à l'utilisateur explicitement |

Les deux sorties partagent les **étapes 1 à 3** (cadrage, architecture, sources). Les étapes 4+ divergent.

## Étape 1 — Cadrage (commun)

Demander à l'utilisateur :

* **Nom de la page** (homepage / expertise / formations / etc.)
* **Persona dominant** (Claire / Marc-Antoine / Alexis ou audience large)
* **Objectif** (réassurance / pédagogie / conversion / positionnement)
* **Sections attendues** (si l'utilisateur a une idée) ou laisser proposer
* **Cible Figma** si Sortie B : URL du fichier et node-id de la page où poser la frame

## Étape 2 — Architecture de page (commun)

Proposer la **séquence des sections** avant de produire :

Structure type d'une landing Frontguys :

```
1. Hero                    PageHeader (H1 Nous actif) + sous-titre + CTAs + illustration optionnelle
2. Différenciateurs / Approche
3. Cas clients / Preuves   BusinessCases ou Card list
4. Expertise / Offre       MediaObject ou Card grid
5. Convictions             Section avec ancrage d'au moins 1 conviction
6. Chiffres clés           KeyFigures (si applicable, + illustration optionnelle)
7. CTA final / Contact     ContactExpertBanner ou CTA simple
8. Footer                  Footer (instance composant DS, jamais reconstruite)
```

**Demander validation** de l'architecture.

## Étape 3 — Charger les sources (commun)

Toujours :

* **Brand > Voice > Writing Rules** + **Vocabulary**
* **Brand > Components** (hub) + **Conventions**
* **Brand > Visual > Tokens Snapshot**
* **Si Sortie B :** `**frontguys-bindings-protocol**` — règle absolue (contient la table des keys de composants importables, dont les illustrations)

Selon les sections :

* Persona dominant → sa fiche
* Cas clients section → **Positioning** (alternatives non frontales)
* Convictions section → **Convictions**
* Pour chaque composant utilisé → **Brand > Components > Catalog > {Component}**


---

## SORTIE A — Production Astro

### Étape 4A — Squelette technique Astro

Structure type :

```astro
---
import Layout from "../layouts/Layout.astro";
import Section from "../components/Section/Section.astro";
import SectionHeader from "../components/SectionHeader/SectionHeader.astro";
import Stack from "../components/Stack/Stack.astro";
import Text from "../components/Text/Text.astro";
import { Button } from "../components/Button/Button.tsx";
// + autres imports selon les sections
---

<Layout title="..." description="...">
  <PageHeader title="..." />
  <main>
    <Section as="section" color="semantic-background-default">
      <!-- Hero content -->
    </Section>
    <!-- Sections suivantes -->
  </main>
</Layout>
```

### Étape 5A — Pour chaque section


1. Choisir le `Section.color` approprié (alternance subtle / default pour rythmer)
2. Composer avec **uniquement les composants documentés** dans **Brand > Components**
3. Texte via `Text` avec le bon `variant` (jamais `<p>` brut)
4. Layout via `Stack` (jamais `flex` ad-hoc)
5. Respecter la voix : titre Nous actif, sous-titre Vous, CTA impératif

### Étape 6A — Auto-audit Astro avant livraison

- [ ] Exactement 1 `<h1>` (via `PageHeader`)
- [ ] Hiérarchie titres respectée (h1 → h6 sans saut)
- [ ] Tous les textes via `Text`
- [ ] Tous les layouts via `Stack`
- [ ] Toutes les sections via `Section`
- [ ] Aucune couleur / font-size / spacing en dur
- [ ] Tous les composants utilisés existent dans **Brand > Components > Catalog**
- [ ] Voix respectée (4 règles + FALC + vocabulaire)
- [ ] Persona respecté
- [ ] Au moins 1 conviction ancrée (asset long)
- [ ] SkipLinks présent dans le Layout (vérifier)
- [ ] Liens externes avec `title` (auto-géré par Button/Link)
- [ ] `prefers-reduced-motion` respecté si animations

### Étape 7A — Livrer (Astro)

* Le fichier `.astro` complet
* Liste des composants utilisés (référence aux fiches)
* Liste des tokens consommés (référence au snapshot)
* Mention du persona ciblé et de la conviction ancrée
* Notes d'intégration : où coller le fichier, quels imports vérifier


---

## SORTIE B — Production Figma

### Étape 4B — Pré-requis Figma

Vérifier :

* L'**URL du fichier Figma cible** est fournie par l'utilisateur (et idéalement le node-id de la page où poser la frame)
* Le `frontguys-bindings-protocol` est chargé — il contient la table canonique des keys de composants (UI + illustrations) importables
* L'outil MCP `Figma:use_figma` est accessible

Les librairies Foundation (Web Components, Icons & Illustrations, Tokens, Typography Web/Slides) sont **normalement activées par défaut dans tous les fichiers Figma de l'organisation Frontguys**. Si un import échoue → demander à l'utilisateur d'activer la librairie correspondante dans son fichier (Figma > panneau gauche > Libraries > rechercher la librairie Foundation pertinente > activer).

### Étape 5B — Identifier les composants nécessaires

À partir de la spec éditoriale ou de la demande, lister les composants DS à mobiliser :

* `header` (toujours, en haut)
* `footer` (toujours, en bas)
* `Button` primary + secondary (CTAs)
* `card` simple / `card` photo (grilles d'enjeux, expertises, cas clients, parcours)
* `profileBanner` (section contact expert)
* `link`, `logotype` (souvent encapsulés dans header/footer, mais utilisables seuls)
* **Illustrations** (depuis `Foundation - Icons & Illustrations`) : choisir 1 illustration sémantique par section qui en bénéficie (hero, stats, expertises, etc.) en fonction du contenu

Récupérer leurs keys depuis la **table de composants DS** du `frontguys-bindings-protocol` (sections "Composants UI" + "Illustrations").

### Étape 6B — Choisir une illustration sémantique

Pour chaque section du type "hero", "stats", ou autre qui appelle un visuel d'accompagnement, choisir **une illustration sémantique** parmi celles indexées dans le `frontguys-bindings-protocol` (table "Illustrations"). Quelques pistes :

| Section / contenu | Illustrations pertinentes |
|-------------------|---------------------------|
| Hero (page d'accueil, accroche métier) | `target`, `idea`, `rocket`, `flash` |
| Hero (page formation) | `book`, `graduation`, `draw` |
| Stats / mesure de performance | `desktop-chart`, `chart`, `medal`, `trophy` |
| Expertises (design system) | `Arborescence`, `puzzle`, `dev`, `draw` |
| Expertises (transformation) | `planning`, `direction`, `compass` |
| Section contact / RDV | `Calendar`, `paper plane`, `message` |
| Accessibilité     | `wheelchair`, `globe-heart`, `blind`, `deaf`, `mute` |

> Si une illustration nommée souhaitée n'est pas dans la table : inspecter la librairie `Foundation - Icons & Illustrations` (fileKey `DgrQtY2Ua2ULm1xyqcKAd0`, page `Illustrations` id `0:1`) pour récupérer la key, puis l'ajouter à la table du bindings-protocol pour les prochaines productions.

### Étape 7B — Setup (premier appel `Figma:use_figma`)

Dans un premier appel `Figma:use_figma` :


1. `figma.setCurrentPageAsync(pageCible)` (récupérée via `figma.root.children.find(p => p.id === '...')`)
2. Charger les fonts : Inter Regular, Reddit Sans Regular, Reddit Sans Medium
3. Importer toutes les variables via `figma.variables.importVariableByKeyAsync` (en try/catch — si échec, signaler à l'utilisateur que `Foundation - Tokens` doit être activée)
4. Importer tous les text styles via `figma.importStyleByKeyAsync` (en try/catch — si échec, signaler `Foundation - Typography Web`)
5. Importer **tous les composants** via `figma.importComponentByKeyAsync` (en try/catch — si échec, signaler la librairie Foundation correspondante)
6. Stocker les IDs dans `setSharedPluginData` de la page pour les phases suivantes
7. Créer la frame parent `<NomPage> — Frontguys` (1440px, VERTICAL, fill `background/default`, padding=0, itemSpacing=0)
8. **Header** : instancier le composant DS, `layoutAlign='STRETCH'`

### Étape 8B — Construction section par section

Pour chaque section, dans un appel `Figma:use_figma` séparé (limite 50000 caractères par appel) :


1. Récupérer vars/styles/comps depuis `getSharedPluginData`
2. Recharger les fonts (chaque appel MCP repart de zéro)
3. Créer la section avec `createSection(name, bgVar)` (helper du bindings-protocol)
4. Ajouter le header de section (`SectionHeader` centré ou left)
5. Ajouter le contenu (cards, profileBanner, stats, illustration, etc.) — **toutes les cards/buttons/illustrations/etc. sont des instances DS**
6. Configurer les `componentProperties` via `setProperties` (cf règles étape 5 du bindings-protocol)
7. Forcer le **stretching** (`layoutAlign='STRETCH'` ou `layoutGrow=1`) sur les rows/grids/cards (cf étape 6 du bindings-protocol)
8. `homepage.appendChild(section)`

### Étape 9B — Footer

Instancier le composant DS footer (key `11685218c229bf367fd4fa4c2634054768b66e3f` pour `device=desktop`) :

```js
const footerComp = await figma.importComponentByKeyAsync('11685218c229bf367fd4fa4c2634054768b66e3f');
const footer = footerComp.createInstance();
footer.name = '_footer';
footer.layoutAlign = 'STRETCH';
homepage.appendChild(footer);
```

**Jamais cloner ni reconstruire le footer.** Le composant DS contient déjà : logo + tagline + colonnes de liens + accessibilité + réseaux sociaux + mentions légales.

### Étape 10B — Pre-flight check obligatoire

Exécuter `preflightCheck(homepage)` du bindings-protocol. **Objectif : 0 issue.**

Si une issue persiste, c'est qu'une valeur est en dur dans une section custom — corriger immédiatement. Le check ne descend pas dans les INSTANCES, donc les dettes internes des composants DS ne remontent jamais.

### Étape 11B — Screenshot de contrôle

Prendre un screenshot via `Figma:get_screenshot` sur la frame produite pour validation visuelle. Vérifier en particulier :

* Pas de cards écrasées (signe que le stretching n'a pas fonctionné)
* Pas de texte vertical en colonne (signe d'un frame trop étroit qui force le wrap)
* Alternance des fonds visible
* Illustrations bien placées et dimensionnées

Si le rendu n'est pas correct, corriger via un appel `use_figma` ciblé (ex : `node.layoutAlign = 'STRETCH'` sur les rows concernées).

### Étape 12B — Auto-audit Figma avant livraison

- [ ] Étape 5B effectuée : composants nécessaires identifiés, keys récupérées depuis la table du bindings-protocol
- [ ] Étape 6B effectuée : illustration sémantique choisie pour chaque section qui en bénéficie
- [ ] Inter Regular + Reddit Sans Regular + Reddit Sans Medium chargés dans chaque appel `use_figma` qui crée du texte
- [ ] **Header** : instance propre du composant DS (jamais clonée ni reconstruite)
- [ ] **Footer** : instance propre du composant DS (jamais clonée ni reconstruite)
- [ ] **Illustrations** : instances de `Foundation - Icons & Illustrations` (jamais clonées d'un autre fichier, jamais hardcodées en SVG)
- [ ] Sections de contenu : assemblage from-scratch avec instances DS (cards, buttons, profileBanner, etc.)
- [ ] Tous les fills bindés sur variables couleur
- [ ] Tous les paddings/itemSpacing/radius bindés sur variables spacing/radius
- [ ] Tous les textes custom ont un `textStyleId` du DS
- [ ] **Pre-flight check passé : 0 issue**
- [ ] Alternance fonds respectée (default ↔ subtle ↔ default-alt)
- [ ] Boutons : pas de `ghost` sur fond light
- [ ] Stretching auto-layout correct (vérification visuelle au screenshot)
- [ ] Voix respectée (4 règles + FALC + vocabulaire) dans tous les textes
- [ ] Persona respecté
- [ ] Au moins 1 conviction ancrée (asset long)
- [ ] Screenshot de contrôle pris et validé

### Étape 13B — Livrer (Figma)

* L'URL Figma de la frame produite (`https://figma.com/design/{fileKey}/...?node-id={frameId}`)
* La liste des composants DS utilisés (avec keys et librairie source)
* La liste des illustrations utilisées (avec leur sémantique justifiée)
* La liste des tokens consommés
* Mention du persona ciblé et de la conviction ancrée


---

## Cas particuliers

### Page avec formulaire (Astro)

Toujours via `FormElement` (jamais d'`<input>` brut). Cf **Brand > Components > Catalog > FormElement**.

### Page article ou cas client

Pattern dynamique : `src/pages/{type}/[id].astro`. Récupérer le contenu via Astro Content Collections.

### Page avec sections page-specific

Réutiliser : `BusinessCases`, `KeyFigures`, `ContactExpertBanner`, `CreateOpportunity`. Ne pas réécrire leur contenu — cf **Catalog > Page Sections**.

### Page Figma à partir d'une spec éditoriale

Si l'utilisateur fournit une **spec éditoriale épurée** (contenu seul, sans design tokens) ET une **URL Figma cible**, c'est le scénario idéal pour Sortie B :


1. La spec liste les sections avec H2, body, CTAs, items — c'est l'input parfait
2. Vous chargez `frontguys-bindings-protocol` pour les keys et règles
3. Vous proposez 1 illustration sémantique pertinente par section visuelle (hero, stats, etc.) — l'utilisateur peut valider ou ajuster
4. Vous produisez la frame Figma section par section

C'est le workflow le plus rapide : l'utilisateur n'a rien à faire d'autre que fournir le contenu éditorial et le lien Figma.

### Composant nécessaire absent de la table

Si la spec exige un composant DS que la table du bindings-protocol ne référence pas :


1. Demander à l'utilisateur un **lien Figma vers une instance de référence** (n'importe où dans n'importe quel fichier accessible)
2. Inspecter `mainComponent.key` (et `mainComponent.parent.key` si ComponentSet)
3. Mettre à jour le `frontguys-bindings-protocol` avec la nouvelle key pour les prochaines demandes

### Import qui échoue malgré la table

Si une key listée échoue à l'import, c'est que **la librairie correspondante n'est pas activée dans le fichier de l'utilisateur** (cas normalement rare puisque les librairies Foundation sont activées par défaut dans l'org).

Demander à l'utilisateur :

> *"L'import de \[variable / style / composant\] a échoué. La librairie \[Foundation - X\] est probablement non activée dans ton fichier. Tu peux l'activer via Figma > panneau gauche > Libraries > rechercher \[Foundation - X\] > activer. Une fois fait, relance la demande."*

## Anti-patterns

### Communs aux deux sorties

* ❌ Multiplier les CTAs primary (1 max par section)
* ❌ Tout dire à tous les personas (trancher sur 1 dominant)

### Spécifiques Astro

* ❌ Coder un `<div class="container">` ad-hoc → utiliser `Section`
* ❌ Coder un `<h2>` brut → utiliser `Text as="h2" variant="heading-..."`
* ❌ Importer un composant qui n'existe pas dans **Brand > Components**
* ❌ Oublier `SkipLinks` ou `PageHeader`
* ❌ Hardcoder une couleur ou un spacing

### Spécifiques Figma

* ❌ **Cloner header ou footer** — ce sont des composants DS racine, toujours instanciés
* ❌ **Reconstruire le footer from-scratch** — il est livré clé en main par le DS
* ❌ **Cloner une illustration depuis un autre fichier comme palliatif à un import échoué** — demander à l'utilisateur d'activer `Foundation - Icons & Illustrations`
* ❌ **Hardcoder une illustration en SVG** — toujours utiliser les illustrations de la librairie DS
* ❌ Inventer ou deviner une key de composant — consulter la table du bindings-protocol, ou demander une instance de référence à l'utilisateur
* ❌ Oublier `loadFontAsync({family:'Inter', style:'Regular'})` → erreur sur le premier `t.characters = "..."`
* ❌ Passer une valeur vide pour une prop TEXT dans `setProperties` (ex `'subTitle': ''`) → fait planter tout le `setProperties`
* ❌ Hardcoder une valeur de couleur, spacing, radius → utiliser les helpers `bindFill`, `bindSpacing`, `bindRadius`
* ❌ Row HORIZONTAL en `primaryAxisSizingMode='AUTO'` qui devrait remplir la largeur → cards écrasées à gauche

## Changelog

| Date | Version | Changements |
|------|---------|-------------|
| 2026-05-11 | v1.0    | Version initiale (Astro uniquement) |
| 2026-05-13 | v1.1    | Ajout Sortie B (Figma) |
| 2026-05-13 | v1.2    | Correction footer composant racine |
| 2026-05-13 | v1.3    | Suppression des références au fichier de travail particulier |
| 2026-05-13 | v1.4    | **Illustrations DS** : étape 6B dédiée au choix sémantique d'illustration depuis `Foundation - Icons & Illustrations`. Table de correspondance section ↔ illustration. Pattern "demander l'activation de la librairie" si import échoue. Suppression de toute logique de clonage d'illustration. |