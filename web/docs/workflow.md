# Workflow Figma → Astro

> Procédure complète pour transformer une frame Figma en page Astro dans `src/pages/prototypes/`, sans inventer.

## Pré-requis

- Node ≥ 22, pnpm 10+
- `pnpm install` exécuté à la racine de `web/`
- `pnpm build-tokens` exécuté au moins une fois
- MCP Figma connecté à Claude (voir CLAUDE.md racine du repo BrandOS)

## Étapes détaillées

### 0. Cadrage utilisateur

L'utilisateur (toi ou un collaborateur Frontguys) fournit :

- **URL Figma** précise de la frame source (pas juste le fichier — la frame exacte)
- **Nom de fichier souhaité** pour la page : `pricing-v1.astro`, `client-case-acme.astro`, etc.
- **Contraintes spécifiques** : responsive ? langue ? mode dark ? variations ?

Sans URL Figma, l'agent doit **demander** — jamais supposer.

### 1. Lecture de la frame

Claude appelle :

- `Figma:get_metadata` pour récupérer la structure (nœuds, hiérarchie)
- `Figma:get_design_context` pour récupérer le code Astro suggéré + screenshot de référence
- `Figma:get_screenshot` pour avoir le visuel cible (utilisé en fin de boucle pour l'audit)

### 2. Inventaire des composants

À partir des métadonnées, Claude liste **tous les composants Figma** utilisés dans la frame (par leur `componentKey` ou leur nom de Main Component). Pour chacun :

- Cherche dans `docs/figma-to-astro-mapping.md`
- Si trouvé → composant Astro local connu, prêt à l'emploi
- Si pas trouvé → noter comme "à mapper"

Pour les composants "à mapper" :
- Vérifier qu'il existe dans SiteA11Y (`../SiteA11Y/src/components/`)
- Si oui → candidat à copie locale
- Si non → **stop**, demander à l'humain

### 3. Inventaire des tokens

Claude liste les **tokens utilisés** dans la frame (couleurs, typo, spacing) via les variables Figma. Pour chacun, vérifier qu'il existe une CSS var équivalente dans `src/assets/styles/01-utils/variables/_tokens.scss` (généré).

Si un token Figma n'a pas d'équivalent CSS var : demander à l'humain (probablement un token manquant dans `src/tokens/*.json`).

### 4. Retro-spec

Claude présente :

```
Page à produire : src/pages/prototypes/<nom>.astro

Composants Astro existants utilisés :
- Header (src/components/Header/Header.astro)
- Section (src/components/Section/Section.astro)
- ...

Composants à copier depuis SiteA11Y (validation demandée) :
- Card (SiteA11Y/src/components/Card/) → web/src/components/Card/
- Button (SiteA11Y/src/components/Button/) → web/src/components/Button/

Tokens mobilisés :
- --color-watery-green-50, --base-space-4, --text-heading-2-font-size

Structure de la page :
1. Hero (avec Header + KeyFigures)
2. ... 
3. Footer

Questions ouvertes :
- (s'il y en a)
```

L'utilisateur valide ou ajuste.

### 5. Copie des composants manquants

Pour chaque composant validé :

```bash
cp -R ../SiteA11Y/src/components/Card web/src/components/
```

Vérifier les imports internes du composant (ex : `import styles from "./Card.module.css"`) — ils doivent rester valides après copie. Si le composant importe `../../site.config` ou `../../utils/...`, **stop** et demander à l'humain (ces dépendances doivent être copiées aussi ou refactorées).

### 6. Création des fiches & mise à jour du mapping

Pour chaque composant nouvellement copié :

- Créer `docs/components/<Nom>.md` (voir [`docs/components/README.md`](./components/README.md) pour le template)
- Ajouter une ligne dans la bonne section de `docs/figma-to-astro-mapping.md`

### 7. Génération de la page

Écrire `src/pages/prototypes/<nom>.astro` en :

- Important `BaseLayout` depuis `src/layouts/BaseLayout.astro`
- Important les composants nécessaires depuis `@components/`
- Structurant en sections sémantiques (`<header>`, `<section>`, `<main>`, `<footer>`)
- Aucun style inline, aucune valeur en dur
- Respectant la hiérarchie de titres (`<h1>` unique, puis `<h2>`, `<h3>`)
- Ajoutant les `alt` texts sur toutes les images

### 8. Auto-audit

```bash
pnpm lint           # 0 erreur
pnpm build          # 0 erreur
pnpm dev            # vérification visuelle sur http://localhost:4321/prototypes/<nom>
```

Claude prend optionnellement un `Figma:get_screenshot` de la frame source pour comparaison.

Checklist :

- [ ] Lint passe
- [ ] Build passe
- [ ] Pas de valeur en dur (`grep -E "#[0-9a-f]{3,6}|[0-9]+px" src/pages/prototypes/<nom>.astro` — ne doit rien remonter dans le SCSS)
- [ ] Hiérarchie de titres correcte
- [ ] Tous les `alt` présents
- [ ] Tous les composants utilisés sont mappés
- [ ] Mapping et fiches à jour

### 9. Livraison

Claude annonce :

```
Page créée : web/src/pages/prototypes/<nom>.astro
URL locale : http://localhost:4321/prototypes/<nom>
Composants nouveaux copiés : Card, Button
Tokens mobilisés : --color-watery-green-50, --base-space-4, ...
Audit : ✅ lint OK, ✅ build OK, ✅ tokens conformes, ✅ a11y de base
```

## Cas particuliers

### Le composant Figma n'existe pas dans SiteA11Y

Claude **ne crée pas** un nouveau composant. Il demande à l'humain :

> "Le composant `[NomFigma]` n'a pas d'équivalent dans SiteA11Y. Tu veux :
> a) Mapper sur un composant existant proche (lequel ?)
> b) Skipper ce composant et utiliser un fallback (`<div>` + styles inline ? non — préférer composer avec ce qui existe)
> c) Créer un nouveau composant — auquel cas il faudra d'abord le construire dans SiteA11Y, le faire reviewer, puis le re-pull ici"

### Le composant existe mais avec une variant non utilisée localement

Claude documente la variant manquante dans `docs/components/<Nom>.md` et la propose à l'humain pour validation avant d'instancier.

### La frame Figma utilise un token Figma sans équivalent CSS var

Claude **stop**. Demande :

> "Le token Figma `[NomToken]` n'a pas d'équivalent dans `src/tokens/*.json`. Soit on l'ajoute (mais ça change le DS — décision humaine), soit on utilise le token existant le plus proche, soit on m'indique quelle CSS var utiliser."
