# BrandOS · pilier code

Sandbox Astro pour prototyper des pages Frontguys **depuis Figma**, en utilisant les composants et les tokens du DS Frontguys.

> **Ce repo n'est pas la prod.** La prod est `frontguys/accessibility-website` (Gitlab). Ici on prototype, on teste, on itère sans risque.

## Setup

Pré-requis : Node ≥ 22, pnpm 10+.

```bash
pnpm install
pnpm build-tokens    # génère _tokens.scss depuis les JSON DTCG
pnpm dev             # http://localhost:4321
```

## Architecture

```
web/
├── CLAUDE.md                  ← sous-agent IA pour ce pilier (à lire si tu utilises Claude)
├── docs/
│   ├── components/            ← une fiche par composant copié (props, variants, exemples Figma)
│   ├── figma-to-astro-mapping.md   ← table de correspondance composants Figma ↔ Astro
│   ├── tokens.md              ← doc tokens (Figma ↔ JSON DTCG ↔ CSS vars)
│   └── workflow.md            ← workflow Figma → Astro étape par étape
├── scripts/
│   └── sync-from-prod.sh      ← re-pull manuel depuis SiteA11Y (composants/tokens)
├── src/
│   ├── tokens/                ← JSON DTCG (source des CSS vars)
│   ├── assets/styles/         ← styles globaux SCSS (utils, base, fonts)
│   ├── layouts/               ← layouts Astro racine
│   ├── components/            ← composants Astro/React (VIDE au départ, on copie à la demande)
│   ├── utils/                 ← helpers
│   └── pages/
│       ├── index.astro        ← accueil du sandbox
│       └── prototypes/        ← toutes les pages générées depuis Figma vivent ici
└── terrazzo.config.js         ← config tokens (génère _tokens.scss)
```

## Workflow Figma → Astro

Voir [`docs/workflow.md`](./docs/workflow.md) pour le détail. Vue d'ensemble :

1. **Tu fournis** une URL Figma + un nom de page
2. **Claude lit** la frame Figma (MCP Figma) et identifie les composants utilisés
3. **Claude croise** avec [`docs/figma-to-astro-mapping.md`](./docs/figma-to-astro-mapping.md) pour vérifier que chaque composant a son équivalent Astro local
4. **Pour les composants manquants** : Claude propose de les copier depuis SiteA11Y (validation humaine)
5. **Claude génère** la page dans `src/pages/prototypes/[nom].astro`
6. **Tu valides** visuellement : `pnpm dev` → `http://localhost:4321/prototypes/[nom]`

## Règles d'or

| Règle | Détail |
|-------|--------|
| **Jamais d'invention** | Aucun composant créé from scratch sans validation. Source canonique : SiteA11Y. |
| **Jamais de valeur en dur** | Toutes les couleurs, espacements, typos passent par les CSS vars Terrazzo. |
| **Mapping à jour** | Chaque composant copié = une entrée dans `figma-to-astro-mapping.md` + une fiche dans `docs/components/`. |
| **Audit avant livraison** | `pnpm lint` + `pnpm build` + check tokens passent avant chaque "c'est livré". |

Le détail complet est dans [`CLAUDE.md`](./CLAUDE.md).

## Scripts utiles

| Commande | Effet |
|----------|-------|
| `pnpm dev` | Dev server (port 4321) |
| `pnpm build` | Build statique dans `dist/` |
| `pnpm preview` | Preview du build |
| `pnpm build-tokens` | Régénère `_tokens.scss` depuis `src/tokens/*.json` |
| `pnpm format` | Format Biome |
| `pnpm lint` | Lint Biome |
| `pnpm sync-from-prod` | Re-copie tokens + composants depuis le clone local de SiteA11Y |

## Pour qui

- **Designers Frontguys** qui veulent voir leurs designs Figma en code rapidement
- **Devs Frontguys** qui veulent tester un composant ou une page sans toucher à la prod
- **Claude / agents IA** qui produisent du code Astro depuis des frames Figma

## Limites volontaires

- Pas de déploiement automatique (volontaire — c'est un sandbox)
- Pas de Storybook (volontaire — pour rester léger ; on ajoute si besoin)
- Pas de tests Vitest/Playwright (volontaire — la prod a déjà ce périmètre)
- Pas de MDX/i18n/CMS (volontaire — minimal pour prototyper)

Ces limites peuvent être levées par PR si un besoin concret émerge.
