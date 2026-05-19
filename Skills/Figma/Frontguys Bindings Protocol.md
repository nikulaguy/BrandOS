# Frontguys Bindings Protocol

# Frontguys Bindings Protocol


---

## type: frontguys-bindings-protocol purpose: Protocole OBLIGATOIRE de binding des variables DS Frontguys — à exécuter AVANT toute production Figma status: critical applies_to: tout asset Figma produit dans un fichier Frontguys last_synced: 2026-05-13

# Protocole de bindings Frontguys — RÈGLE ABSOLUE


:::warning
**AUCUNE valeur ne doit jamais être en dur dans un asset Figma Frontguys.** Couleurs, paddings, gaps (itemSpacing), corner radius, stroke weights, fontSize, fontFamily — tout doit être bindé sur une variable du DS ou utiliser un text style du DS. Si une valeur en dur subsiste, c'est un **bug** à corriger avant livraison.

:::

Cette règle est **non-négociable**. L'utilisateur ne doit pas avoir à repasser derrière la production pour vérifier qu'aucune valeur n'est en dur.

## Contexte d'exécution

Ce protocole est rédigé pour un **plugin Figma** ou pour l'outil MCP `Figma:use_figma` qui exécute du JS via la Plugin API. Toutes les fonctions `figma.*` référencées ici font partie de la Plugin API.

**Si vous opérez via MCP** (`Figma:use_figma`) : le code passé en `code` est exécuté côté Figma, **dans le fichier dont l'URL a été fournie par l'utilisateur**. L'utilisateur indique systématiquement le fichier cible (URL Figma) au début de sa demande. Pensez à `return JSON.stringify(...)` à la fin pour récupérer les résultats. L'état (variables importées, IDs créés) ne persiste pas entre deux appels MCP — utilisez `setSharedPluginData` / `getSharedPluginData` sur un node stable (la page, par exemple) pour cascader des informations entre phases.

## Architecture du DS Frontguys — les librairies canoniques

Le DS Frontguys est publié sous forme de **plusieurs librairies Figma**, chacune dédiée à une catégorie d'assets. **Toutes ces librairies sont normalement importées dans les fichiers Figma de l'organisation Frontguys** — donc leurs composants, variables et styles sont importables par key depuis n'importe quel fichier de l'org.

| Librairie | fileKey | Contenu |
|-----------|---------|---------|
| **Foundation - Web Components** | `CxcxtE8sbs8ugVSkfZs1Wp` | Composants UI racine (header, footer, Button, card, profileBanner, link, logotype) |
| **Foundation - Icons & Illustrations** | `DgrQtY2Ua2ULm1xyqcKAd0` | 140+ illustrations standalone (target, idea, rocket, planning, etc.) et icônes |
| **Foundation - Tokens** (couleurs, spacing, radius) | (à indexer) | Variables : `background/*`, `foreground/*`, `brand/*`, `spacing/base-N`, `radius/lg`, sizing icons |
| **Foundation - Typography Web** | (à indexer) | Text styles Web : Surtitle, Heading 2/3, Subtitle, Body 1/2, Caption 1/2 |
| **Foundation - Typography Slides** | (à indexer) | Text styles dédiés aux présentations |

### Si un import par key échoue

C'est probablement parce que la librairie correspondante n'est pas activée dans le fichier de l'utilisateur. **Demander à l'utilisateur** d'importer la librairie dans son fichier :

> *"L'import de \[variable / style / composant\] a échoué — probablement parce que la librairie \[Foundation - X\] n'est pas activée dans ton fichier. Tu peux l'activer via Figma > panneau gauche > Libraries > rechercher \[Foundation - X\] > activer. Une fois fait, relance la demande."*

Ne JAMAIS contourner en hardcodant. Ne JAMAIS cloner depuis un autre fichier comme palliatif — c'est la librairie qui doit être activée.

## Pourquoi cette règle


1. **Cohérence DS** : si le DS change un token, l'asset suit automatiquement
2. **Mode switching** : light/dark dépend du binding
3. **Maintenance** : pas de divergence entre asset et DS
4. **Reproductibilité** : une spec basée tokens produit toujours le même rendu

## Variables DS Frontguys — inventaire des keys

### Couleurs — background

| Variable | Key | Valeur résolue | Usage |
|----------|-----|----------------|-------|
| `background/default` | `875d5c10feec64bb35c888f613c92408b04e5cec` | #FFFFFF        | Sections "claires" (Enjeux, Expertises, Cas clients, conv01/03) |
| `background/subtle` | `d5940ec1ed5c97a47a8d10d63a5fd5ba055b4614` | #E9F9F9        | Hero, CTA Banner, _cta (mint accent) |
| `background/default-alt` | `5571f04917cf5f4fbf4998dbf2af358f82848a56` | #F9FAFB        | Stats, Expert, Parcours, conv02/04 (alt subtil) |

**Alternance Frontguys canonique** (à respecter sur toute page longue) :

```
default → subtle → default-alt → default → default-alt → default → default-alt → subtle → footer
```

Pas de dark/light brutal. Subtil et toujours light-based.

### Couleurs — foreground

| Variable | Key | Usage |
|----------|-----|-------|
| `foreground/default` | `52de607a23b80d81727ac7720c87894f5bac30b7` | Texte principal (H1, H2, body principal) |
| `foreground/subtle` | `a1f446fbc7d4a54dc1142d5b8f007d0d36dfd21a` | Texte secondaire, body sur fond clair, captions |
| `foreground/interactive` | `a0063e900becf176c6c40a73b15379f0329f780c` | Liens, éléments interactifs |
| `foreground/alternative` | `26182d88ca3bea92dc89365ecbc182adad2544d7` | Numéros, accents visuels |
| `foreground/default-invert` | `3136f5f2ba0acf9b5a2b8cd02cf5dfb178e86b18` | Texte sur fond sombre |
| `brand/primary` | `07ddcef942e241195e7e29b5561305d4366f41e7` | Eyebrows, badges, Surtitle |

### Spacing (échelle base-N en multiples de 4)

| Variable | Key | Valeur | Cas d'usage typiques |
|----------|-----|--------|----------------------|
| `spacing/base-1` | `03e3e56e0bd2e627c899d009007c3e77465b437e` | 4px    | Tiny gap (icon + text) |
| `spacing/base-2` | `dfbc5a7e5aa47a69f116c88db98258c6a09592dc` | 8px    | Stat value → caption gap |
| `spacing/base-3` | `245b81c861484531df8d4230a35f0db721835b44` | 12px   | Padding bouton       |
| `spacing/base-4` | `78e47e0c4e8bf09fafdf458c32f9f1e3824be33b` | 16px   | Gap entre titre et sous-titre, gap entre CTAs |
| `spacing/base-6` | `08dc7a6096ed004598e6ccbf63430a7334b05b27` | 24px   | Gap dans une colonne (header → body) |
| `spacing/base-8` | `0d77cdd1980adcdcedb5990f71606617f4ecbb1a` | 32px   | Gap entre cards d'une grille |
| `spacing/base-10` | `cef07181342c851e9530d0cb32f4ccdef20c6416` | 40px   | —                    |
| `spacing/base-12` | `4621dc65836c8f7c31d7c36e74b74734177ce161` | 48px   | Gap entre header et grille d'une section |
| `spacing/base-14` | `08a259d9c786e0d5f5f03724d0e4824d85bd52e1` | 56px   | —                    |
| `spacing/base-20` | `bb31cf8d18ffd5fdbbed401ea1eb02de59993d4d` | 80px   | **section padding vertical standard** |
| `spacing/base-24` | `0761cd56f7b8071a2320414efe95692e0899cada` | 96px   | **section padding horizontal standard** |

> ⚠ `spacing/none` (0) existe dans le DS mais **n'est pas importable par clé**. Pour une valeur 0, laisser le `0` natif (Figma considère 0 comme neutre).

### Radius

| Variable | Key | Valeur | Usage |
|----------|-----|--------|-------|
| `radius/lg` | `4e95e610fb3a025d80429d61a40c8a63d7e5f7c5` | 8px    | Tous les corner radius custom |

### Sizing icons

| Variable | Key | Valeur | Usage |
|----------|-----|--------|-------|
| `small`  | `22c5f7f29a8b8dfb7499cd2d10d77fdd071163fd` | —      | Petits icônes |
| `medium` | `01cee75092b6c3b62bad169e1f105653ff758ad5` | —      | Icônes moyens (default) |

## Text Styles — keys (typographie Web)

| Style | Key | Font family | Font style | Font size | Cas d'usage |
|-------|-----|-------------|------------|-----------|-------------|
| `Surtitle` | `3108baef9393e1b2654f1bc37fe18ec5cbe9803b` | Reddit Sans | Regular    | 16        | Eyebrows en MAJUSCULES |
| `Heading 2` | `5339b4ee105e95efb1a5f7e0ba45d4a585c8cdac` | Reddit Sans | Medium     | 40        | H1 hero, H2 sections |
| `Heading 3` | `b2488260f9b94725bbaa8e1d0d84e80a81392880` | Reddit Sans | Medium     | 32        | Numéros 01-04, titres internes |
| `Subtitle` | `e14816f4b50251ce15e2b7835a77017d3fe5e238` | Reddit Sans | Regular    | 20        | "Notre lecture", "Ce que cela implique" |
| `Body 1` | `d2d29d67769ccca103e6d01691e3bf4a0924497c` | Reddit Sans | Regular    | 18        | Nav, sous-titres section |
| `Body 2` | `e151362051bdb467351d624e2ef56ff168e37a5a` | Reddit Sans | Regular    | 16        | Corps éditorial, implications |
| `Caption 1` | `9ef38e0a60d423b0333c70eb9780b75158da0921` | Reddit Sans | Medium     | 14        | Badges expertise, métadonnées |
| `Caption 2` | `ccda440d10c95a96d7a3c77b32edde1b088e7e6e` | Reddit Sans | Regular    | 12        | Mentions légales, sources |

## Fonts à charger AVANT toute manipulation de texte

> **Ne pas oublier Inter Regular** : c'est la font par défaut affectée par Figma à tout nouveau `TextNode` au moment de sa création. Avant que vous appliquiez un text style, le node tente d'écrire ses `characters` ET les changements d'alignement avec Inter Regular. Sans ce chargement, vous obtenez `Cannot write to node with unloaded font "Inter Regular"`.

```js
// À placer EN PREMIER dans tout script qui crée du texte
await figma.loadFontAsync({ family: 'Inter', style: 'Regular' });           // défaut Figma
await figma.loadFontAsync({ family: 'Reddit Sans', style: 'Regular' });     // body
await figma.loadFontAsync({ family: 'Reddit Sans', style: 'Medium' });      // headings, captions
```

Si vous oubliez l'une de ces lignes, `t.characters = "..."`, `t.textAlignHorizontal = ...`, ou `await t.setTextStyleIdAsync(...)` lèvera une exception.

## Composants DS — keys vérifiées (mai 2026)

Tous les composants ci-dessous sont **importables par key directement** via `importComponentByKeyAsync` ou `importComponentSetByKeyAsync`, depuis n'importe quel fichier Figma qui consomme les librairies Foundation.

### Composants UI (librairie Foundation - Web Components)

| Composant DS | Key (variant ou set) | Type Figma | Property pattern |
|--------------|----------------------|------------|------------------|
| `header` (set) | `acd1461008e80aae31f30c1e6706467afbf41ef1` | COMPONENT_SET | `device`, `State` |
| `header / device=desktop, State=default` | `aed1fa53594ae22bd0c4cfe77275342c64bc3888` | COMPONENT (variant) | —                |
| `footer` (set) | `f7c5672fbf3bb0c19ec79c543564f1e4ab12ac29` | COMPONENT_SET | `device`         |
| `footer / device=desktop` | `11685218c229bf367fd4fa4c2634054768b66e3f` | COMPONENT (variant) | —                |
| `footer / device=mobile` | `c6b697dafa8f425b785a0a32c3be98b8c19bff02` | COMPONENT (variant) | —                |
| `Button / primary` | `99a50e7d4f2caa3b132ae04e3ba317f4a0a51698` | COMPONENT (variant) | `CTA#2209:0`, `Pictogram#2306:0`, `Type`, `Size`, `State`, `Icon`, `Label` |
| `Button / secondary` | `93b3a4d9ee2c7e2b6edecd0c995de566689446f7` | COMPONENT (variant) | idem             |
| `card / type=simple, state=default` | `53179c715dcb1d5b829023730966d8c2f080f6b4` | COMPONENT (variant) | `Title#2524:14`, `Text#2524:19`, `subTitle#2995:3`, `Show badge 1/2/3#2995:*`, `Icon#2524:29`, `Illustration#3452:0`, `bulletList#2995:11` |
| `card / type=photo, state=default` | `67f0838a158d42a14b55bde141bd3975ff083e51` | COMPONENT (variant) | idem             |
| `profileBanner / State=contact, Viewport=desktop` | `dddf62e8ccde55b774e31f85635fc21b60a01ecf` | COMPONENT (variant) | `Title#3509:0`, `Name#3509:3`, `jobTitle#3509:6`, `Show Button#3509:9`, `Show Button 2#3509:12` |
| `logotype / type=default, Viewport=Desktop` | `fdcb4fe8a2dd8514542b802c4953e1b6dd8e7560` | COMPONENT (variant) | —                |
| `link / standalone` | `dfc86271583c7664d84e536d4e0cdc2b08715be7` | COMPONENT (variant) | `Inline Text#2764:0`, `Standalone Text#2764:7`, `Icon#2519:7`, `state`, `type`, `Indicator` |

### Illustrations (librairie Foundation - Icons & Illustrations)

La librairie contient **140+ illustrations standalone** (pas de ComponentSet, chaque illustration = un COMPONENT racine). Sélection des plus utilisées dans les contextes Frontguys :

| Illustration | Key | Cas d'usage typique |
|--------------|-----|---------------------|
| `target`     | `949b830257738613000392a93944cacfa07536d2` | Objectifs, focalisation |
| `idea`       | `30ebb69b4565329791c4a07e570177c90d976c88` | Insights, propositions de valeur |
| `planning`   | `056d6a9c706052a8a1c8241919420fc31b9334d8` | Cadrage, roadmap    |
| `desktop-chart` | `84b40592375b0695dcc7d668ee632311a0f054b1` | Stats, mesure, performance |
| `thumb-up`   | `02fea49e7b26524270fe85bcdb47e151323e41ff` | Validation, satisfaction |
| `megaphone`  | `d52cb7853b7ba390469344a7fc3476c3c39ee1aa` | Communication, marketing |
| `rocket`     | `56c7bb7e5d3f6b290859bcf116b1523731203d45` | Lancement, accélération |
| `flash`      | `f1ffcb0ac65edd25a20e487ed41abdfff6eb5974` | Rapidité, impact    |
| `puzzle`     | `9477581de7d280013b962dd0097b78733a886ebe` | Modularité, assemblage |
| `chart`      | `094fbc7b5ef23df2d65917f83377100068caed53` | Données, croissance |
| `medal`      | `54115adfb5d163dc75d22f2e91c45eac3e87d10c` | Excellence, distinction |
| `trophy`     | `930efab017dd1f233a9a8d7fe1d50b8cd117770b` | Réussite, performance |
| `Calendar`   | `4529a7eb06b008b78d8a9fc55871649d7a1523f0` | Planification, événement |
| `search`     | `c4e8e6ce9b6ab7da3ccc0bcfb3d7f8d48c901ded` | Audit, diagnostic   |
| `Arborescence` | `2847e43461116b5277d840f3749ca22a6223b95b` | Structure, design system |
| `dev`        | `5c26d390db84bccb768468d624c13b298e011ef3` | Développement, code |
| `draw`       | `373990d68c115f0a61cb1f4b86930eb3fb9034f8` | Design, création    |
| `book`       | `0ad66c9ed87d7bad7faa80685315e8a4f738e7bf` | Formation, ressource |
| `wheelchair` | `1b2b643439c7b1926e5750d27670a918a15598c5` | Accessibilité       |
| `globe-heart` | `8ee1ba5652dee34a346c7e0e1995ffd1d1d94718` | Inclusion, web pour tous |

> Pour une illustration absente de cette table : passer par `Figma:use_figma` sur la librairie `DgrQtY2Ua2ULm1xyqcKAd0` (page Illustrations, id `0:1`) pour récupérer la liste complète et la key correspondante, puis l'ajouter à cette table.

### Workflow d'identification des composants

L'ordre de priorité **avant production** :


1. **Pour chaque composant nécessaire**, consulter la table ci-dessus pour récupérer la key
2. **Tenter l'import direct** :

   ```js
   try {
     const c = await figma.importComponentByKeyAsync('xxxxxxxx');
   } catch (e) {
     // Cas 1 : la librairie correspondante n'est pas activée dans le fichier
     // Cas 2 : la key est obsolète (republication du DS)
   }
   ```
3. **Si l'import échoue** → demander à l'utilisateur d'activer la librairie correspondante dans son fichier (Figma > Libraries > rechercher la librairie Foundation pertinente > activer)
4. **Si un composant utile manque** dans les tables → demander à l'utilisateur de pointer vers une instance, inspecter `mainComponent.key`, **mettre à jour ce skill** pour les prochaines demandes.

> **Anti-pattern** : inventer une key ou la deviner. Si la table ne contient pas le composant nécessaire et qu'aucune instance de référence n'est fournie, demander à l'utilisateur.

## Protocole obligatoire — production from scratch

**À exécuter dans cet ordre exact**, AVANT toute création de frame custom :

### Étape 0 — Récupérer l'URL Figma cible et identifier les composants à mobiliser

* L'utilisateur fournit l'URL du fichier Figma où produire la frame (et idéalement le node-id de la page cible)
* Lister les composants nécessaires en fonction de la spec éditoriale ou de la demande
* Pour chaque composant, prendre la key depuis la table ci-dessus

### Étape 1 — Charger les fonts

```js
await figma.loadFontAsync({ family: 'Inter', style: 'Regular' });
await figma.loadFontAsync({ family: 'Reddit Sans', style: 'Regular' });
await figma.loadFontAsync({ family: 'Reddit Sans', style: 'Medium' });
```

### Étape 2 — Import (tout, en bloc)

Importer **toutes** les variables, styles et composants dont vous aurez besoin, en bloc :

```js
const VAR_KEYS = { /* table ci-dessus */ };
const STYLE_KEYS = { /* table ci-dessus */ };
const COMP_KEYS = { /* table ci-dessus */ };

const vars = {};
for (const [name, key] of Object.entries(VAR_KEYS)) {
  try {
    vars[name] = await figma.variables.importVariableByKeyAsync(key);
  } catch (e) {
    throw new Error(`Variable ${name} non importable. Demander à l'utilisateur d'activer la librairie Foundation - Tokens dans son fichier.`);
  }
}

const styles = {};
for (const [name, key] of Object.entries(STYLE_KEYS)) {
  try {
    styles[name] = await figma.importStyleByKeyAsync(key);
  } catch (e) {
    throw new Error(`Style ${name} non importable. Demander à l'utilisateur d'activer la librairie Foundation - Typography Web dans son fichier.`);
  }
}

const comps = {};
for (const [name, key] of Object.entries(COMP_KEYS)) {
  try {
    comps[name] = await figma.importComponentByKeyAsync(key);
  } catch (e) {
    throw new Error(`Composant ${name} non importable. Demander à l'utilisateur d'activer la librairie Foundation correspondante dans son fichier.`);
  }
}
```

Pour les ComponentSets : `figma.importComponentSetByKeyAsync(key)`.

### Étape 3 — Helpers obligatoires

**Utiliser systématiquement ces helpers** plutôt que les API natives directes :

```js
function bindFill(node, varName) {
  const v = vars[varName];
  if (!v) throw new Error(`Variable ${varName} non importée`);
  const paint = { type: 'SOLID', color: { r: 0, g: 0, b: 0 } };
  node.fills = [figma.variables.setBoundVariableForPaint(paint, 'color', v)];
}

function bindSpacing(node, prop, varName) {
  const v = vars[varName];
  if (!v) throw new Error(`Variable ${varName} non importée`);
  node.setBoundVariable(prop, v);
}

function bindRadius(node) {
  for (const p of ['topLeftRadius','topRightRadius','bottomLeftRadius','bottomRightRadius']) {
    node.setBoundVariable(p, vars['radius/lg']);
  }
}

async function createText(content, styleName, fillVarName, align) {
  const t = figma.createText();
  t.characters = content;                                       // safe : Inter Regular chargé
  if (styles[styleName]) await t.setTextStyleIdAsync(styles[styleName].id);
  bindFill(t, fillVarName);
  if (align) t.textAlignHorizontal = align;
  return t;
}
```

### Étape 4 — Création de frames avec bindings INTÉGRÉS

```js
// ❌ MAUVAIS
const section = figma.createFrame();
section.paddingTop = 96;
section.fills = [{ type: 'SOLID', color: { r: 1, g: 1, b: 1 } }];

// ✅ BON
const section = figma.createFrame();
section.layoutMode = 'VERTICAL';
bindSpacing(section, 'paddingTop', 'spacing/base-24');
bindSpacing(section, 'paddingBottom', 'spacing/base-24');
bindSpacing(section, 'paddingLeft', 'spacing/base-24');
bindSpacing(section, 'paddingRight', 'spacing/base-24');
bindSpacing(section, 'itemSpacing', 'spacing/base-12');
bindFill(section, 'background/default');
```

### Étape 5 — setProperties sur les instances de composant : règles

Quand vous configurez une instance via `inst.setProperties({...})` :


1. **Inspectez d'abord les** `**componentProperties**` **réelles** de l'instance fraîchement créée — les noms incluent un suffixe d'ID type `Title#2524:14`. **Ces suffixes peuvent changer entre versions du composant** : ne les hardcodez pas, listez-les dynamiquement via `Object.keys(inst.componentProperties)`.
2. **Ne passez QUE les props que vous modifiez réellement.** Passer une valeur vide pour une prop TEXT (`'subTitle#xxx': ''`) peut faire échouer tout le `setProperties` selon les versions du composant.
3. Pour les props BOOLEAN, passez explicitement `false` (sans guillemets) si vous voulez masquer un élément.
4. **Ne pas combiner inutilement** : un `setProperties` qui plante avec 10 props peut passer avec 3 props. En cas d'erreur `Property value is incompatible with component property type`, isoler les props une par une.

### Étape 6 — Pour les enfants d'auto-layout : règles de stretching

Quand vous créez un frame custom dans un parent auto-layout, **anticipez son comportement de taille** :

| Parent | Enfant | Réglages recommandés |
|--------|--------|----------------------|
| `layoutMode='VERTICAL'` | Frame qui doit prendre toute la largeur (grilles, rows internes) | `child.layoutAlign = 'STRETCH'` |
| `layoutMode='VERTICAL'` | Frame qui doit prendre toute la hauteur restante (rare) | `child.layoutGrow = 1` |
| `layoutMode='HORIZONTAL'` | Frame ou instance qui doit prendre la largeur restante | `child.layoutGrow = 1` (+ optionnel `layoutAlign='STRETCH'` pour la hauteur) |
| `layoutMode='HORIZONTAL'` | Card/instance qui doit faire 1/N de la largeur | `child.layoutGrow = 1` sur toutes les cards de la row |

**Erreur fréquente** : créer une row horizontale avec `primaryAxisSizingMode='AUTO'` → la row hug son contenu (cards collées à gauche). Corriger en mettant la row à `'FIXED'` + `layoutAlign='STRETCH'` (si parent VERTICAL) ou `layoutGrow=1` (si parent HORIZONTAL), puis chaque enfant card à `layoutGrow=1`.

### Étape 7 — Pre-flight check OBLIGATOIRE avant livraison

```js
function preflightCheck(rootNode) {
  const issues = [];
  function walk(node) {
    if (node.type === 'INSTANCE') return;
    if ('fills' in node && Array.isArray(node.fills)) {
      for (const f of node.fills) {
        if (f.type === 'SOLID' && (!f.boundVariables || !f.boundVariables.color)) {
          if (f.opacity === 0 || f.visible === false) continue;
          issues.push({ nodeId: node.id, name: node.name, issue: 'fill SOLID sans boundVariable' });
        }
      }
    }
    if (node.type === 'FRAME' || node.type === 'COMPONENT' || node.type === 'COMPONENT_SET') {
      const bv = node.boundVariables || {};
      for (const prop of ['paddingTop','paddingBottom','paddingLeft','paddingRight','itemSpacing','topLeftRadius','topRightRadius','bottomLeftRadius','bottomRightRadius']) {
        const val = node[prop];
        if (typeof val === 'number' && val !== 0 && !bv[prop]) {
          issues.push({ nodeId: node.id, name: node.name, issue: `${prop}=${val} en dur` });
        }
      }
    }
    if (node.type === 'TEXT') {
      if (!node.textStyleId || node.textStyleId === '' || typeof node.textStyleId === 'symbol') {
        issues.push({ nodeId: node.id, name: node.name, issue: 'TEXT sans textStyleId' });
      }
    }
    if ('children' in node) for (const c of node.children) walk(c);
  }
  walk(rootNode);
  return issues;
}

const issues = preflightCheck(wrapper);
if (issues.length > 0) {
  throw new Error(`Pre-flight check failed: ${issues.length} valeurs en dur détectées.`);
}
```

> Objectif : **0 issue**. Le check ne descend pas dans les INSTANCES, donc les dettes internes du DS publié ne remontent pas. Si la production utilise correctement les composants DS, 0 issue est atteignable.

## Mapping valeur → variable spacing (snap rules)

| Valeur cible | Variable à utiliser |
|--------------|---------------------|
| 4            | `spacing/base-1`    |
| 8            | `spacing/base-2`    |
| 12           | `spacing/base-3`    |
| 16           | `spacing/base-4`    |
| 20-24        | `spacing/base-6`    |
| 28-32        | `spacing/base-8`    |
| 36-40        | `spacing/base-10`   |
| 44-48        | `spacing/base-12`   |
| 52-56        | `spacing/base-14`   |
| 64-80        | `spacing/base-20`   |
| 88-120       | `spacing/base-24`   |

**Règle absolue** : si la spec mentionne une valeur sans variable correspondante (ex: 120px), **snapper** à la variable la plus proche (96px = `spacing/base-24`). Ne **jamais** hardcoder.

## Règle d'espacement — JAMAIS de padding sur les enfants pour gérer l'écart entre frères

> **L'espacement entre éléments d'un auto-layout est géré PAR LE PARENT via** `**itemSpacing**`**, jamais par des paddings/marges sur les enfants.**

### ❌ Anti-pattern fréquent : la "bumping margin"

Quand on veut "pousser" un élément vers le bas (ex: éloigner une rangée de boutons du body au-dessus), la tentation est de mettre un `paddingTop` sur l'élément. **C'est faux.**

### ✅ Correct : adapter l'itemSpacing du parent

Si l'espacement entre body et btn-row doit être plus grand que les autres gaps : laisser l'`itemSpacing` du parent uniforme (rythme régulier), ou créer un sous-frame intermédiaire avec son propre itemSpacing — jamais un padding sur l'enfant.

### Quand un padding sur un frame est légitime

Un padding sur un frame n'est légitime que pour **l'espace intérieur du frame lui-même** (entre le bord du frame et son contenu) — pas pour pousser le frame par rapport à ses frères.

| Cas | Légitime ? |
|-----|------------|
| `section.paddingTop = spacing/base-20` (espace intérieur de la section) | ✅ Oui      |
| `card.paddingLeft = spacing/base-4` (espace intérieur de la card) | ✅ Oui      |
| `btnRow.paddingTop = spacing/base-4` (pousser btn-row par rapport au body au-dessus) | ❌ Non — utiliser itemSpacing du parent |
| `secondColumn.paddingLeft = spacing/base-4` (éloigner la 2e col de la 1ère) | ❌ Non — utiliser itemSpacing du parent horizontal |

## Règles d'usage des boutons selon le fond

**Règle Frontguys** : la paire de boutons utilisée dans une section dépend du fond de la section. **Jamais de** `**ghost**` **sur un fond clair.**

| Fond de section | Bouton primaire | Bouton secondaire | Cas |
|-----------------|-----------------|-------------------|-----|
| `background/default` (#FFFFFF) | `Type=primary`  | `Type=secondary`  | Sections light standard (Enjeux, Expertises, Cas) |
| `background/subtle` (#E9F9F9) | `Type=primary`  | `**Type=secondary**` | Hero, CTA Banner (mint subtle) — **JAMAIS ghost** |
| `background/default-alt` (#F9FAFB) | `Type=primary`  | `Type=secondary`  | Sections alt subtil (Stats, Expert, Parcours) |
| Fond sombre (rare, ex: footer) | `Type=primary`  | `Type=ghost`      | Réservé au sombre — texte clair |

**Le** `**Type=ghost**` (bouton avec border seule, sans fond) est conçu pour **les fonds sombres uniquement** — il devient invisible/illisible sur fond clair.

## Anti-patterns identifiés

| ❌ Anti-pattern | ✅ Correct |
|----------------|-----------|
| `frame.fills = [{ type: 'SOLID', color: { r: 1, g: 1, b: 1 } }]` | `bindFill(frame, 'background/default')` |
| `frame.paddingTop = 96` | `bindSpacing(frame, 'paddingTop', 'spacing/base-24')` |
| `text.fontSize = 36; text.fontName = ...` | `text.textStyleId = styles['Heading 2'].id` (puis `bindFill` pour la couleur) |
| `frame.cornerRadius = 8` | `bindRadius(frame)` |
| Conclure "pas de variables" sur `getLocalVariableCollectionsAsync()` vide | Toutes les variables du DS sont remote — utiliser `importVariableByKeyAsync` |
| Hardcoder des valeurs hex venant de la spec | Privilégier les noms de tokens sémantiques de la spec, ignorer les valeurs hex |
| Utiliser `Type=ghost` sur fond `background/subtle` (light) | Utiliser `Type=secondary` — ghost réservé aux fonds sombres |
| `btnRow.paddingTop = spacing/base-4` pour pousser une rangée de boutons | Laisser l'`itemSpacing` du parent gérer l'écart (auto-layout = gap CSS) |
| Inventer ou deviner une key de composant | Consulter la table de ce skill. Si absent, demander une instance de référence à l'utilisateur. |
| Cloner header ou footer | Importer comme instances via `importComponentByKeyAsync` — ce sont des composants racine du DS |
| Cloner une illustration depuis un autre fichier comme fallback à un import échoué | Demander à l'utilisateur d'activer la librairie `Foundation - Icons & Illustrations` dans son fichier |
| Créer un text node sans avoir chargé Inter Regular | `await figma.loadFontAsync({ family: 'Inter', style: 'Regular' })` AVANT toute création de texte |
| Row horizontal en `primaryAxisSizingMode='AUTO'` qui devrait remplir la largeur | `'FIXED'` + `layoutAlign='STRETCH'` (parent VERTICAL) ou `layoutGrow=1` (parent HORIZONTAL) |

## Règle responsive — 4 breakpoints + 2 modes typo

> Toute production Figma Frontguys se fait en **2 versions séparées** : Desktop (1440px) et Mobile (320px). Voir **Brand > Visual > Responsive Rules** pour les valeurs et patterns d'adaptation complets.

### Valeurs spacing par breakpoint (résumé)

| Breakpoint | padL/R | padT/B | gap |
|------------|--------|--------|-----|
| 1440 Max.  | 96     | 72     | 56  |
| 1024       | 72     | 56     | 32  |
| 760        | 36     | 36     | 16  |
| 320 Min.   | 16     | 36     | 32  |

### Mode typo selon le frame

* Frame **Desktop** (≥ 1024px) → mode `Large` sur la collection font/size
* Frame **Mobile** (< 1024px) → mode `Small` (à activer explicitement)

## Récap : la check-list de livraison

Avant de retourner un asset Figma à l'utilisateur :

- [ ] **Étape 0 effectuée** : URL du fichier cible confirmée, composants nécessaires identifiés depuis la table de ce skill
- [ ] **Inter Regular + Reddit Sans Regular + Reddit Sans Medium** chargés AVANT toute manipulation de texte
- [ ] **Header** : instance du composant DS (key `aed1fa53594ae22bd0c4cfe77275342c64bc3888`)
- [ ] **Footer** : instance du composant DS (key `11685218c229bf367fd4fa4c2634054768b66e3f`)
- [ ] **Illustrations** : instances depuis `Foundation - Icons & Illustrations` (jamais clonées ni hardcodées en SVG)
- [ ] **Cards, buttons, profileBanner, link, logotype** : instances de leurs composants DS respectifs
- [ ] **Si un import a échoué** : l'utilisateur a été invité à activer la librairie Foundation correspondante dans son fichier
- [ ] **Tous les fills** (frames + textes custom) sont bindés sur une variable couleur
- [ ] **Tous les paddings** (paddingTop/Bottom/Left/Right) non-zéro sont bindés sur `spacing/base-*`
- [ ] **Tous les itemSpacing** non-zéro sont bindés sur `spacing/base-*`
- [ ] **Tous les corner radius** non-zéro sont bindés sur `radius/*`
- [ ] **Tous les textes custom** ont un `textStyleId` du DS
- [ ] **Pre-flight check** exécuté : **0 issue**
- [ ] **Alternance fonds** respectée (default ↔ subtle ↔ default-alt)
- [ ] **Boutons** : aucun `Type=ghost` sur fond light. Sur fond `subtle/default/default-alt` → primary + secondary uniquement
- [ ] **Pas de padding sur enfants d'auto-layout** pour gérer l'écart entre frères — toujours `itemSpacing` du parent
- [ ] **Stretching auto-layout** : grilles / rows / blocs internes correctement étirés (pas de cards écrasées sur un côté)
- [ ] **Responsive** : si Desktop ET Mobile produits, paddings du bon breakpoint sur chacun, mode `Small`/`Large` correctement set sur le frame Mobile, sections `HORIZONTAL` desktop transformées en `VERTICAL` mobile
- [ ] **Screenshot de contrôle visuel** pris et validé avant livraison

Si une case n'est pas cochée, **CORRIGER avant de livrer**. L'utilisateur ne doit jamais avoir à repasser derrière.

## Changelog

| Date | Version | Changements |
|------|---------|-------------|
| 2026-05-12 | v1.0    | Version initiale |
| 2026-05-13 | v1.1    | Inter Regular, table de keys, étapes de stretching |
| 2026-05-13 | v1.2    | Architecture multi-fichiers, footer composant racine |
| 2026-05-13 | v1.3    | Suppression des références au fichier de travail particulier |
| 2026-05-13 | v1.4    | **Architecture multi-librairies** : ajout des librairies `Foundation - Icons & Illustrations` (`DgrQtY2Ua2ULm1xyqcKAd0`) avec 140+ illustrations indexées (sélection des plus utilisées), `Foundation - Tokens`, `Foundation - Typography Web` et `Foundation - Typography Slides`. **Pattern "demander à l'utilisateur d'activer la librairie"** en cas d'échec d'import (au lieu de hardcoder ou cloner). Suppression de l'exception Hand (illustrations remplacées par les illustrations officielles de la librairie Icons & Illustrations). |