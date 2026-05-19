# README projet

# Frontguys Brand OS

> **Le repo source de vérité pour produire des assets Frontguys avec Claude** — pages web, présentations, articles, posts — qui respectent à 100% l'identité, la voix, le visuel et les composants Frontguys.

Ce repo est destiné à **tous les collaborateurs Frontguys** : designers, PMs, sales, devs. Pas besoin d'être expert en design system. Tu ouvres Cowork (ou Claude Code), tu pointes sur ce dossier, tu demandes ce que tu veux faire — Claude trouve ce qu'il faut et produit un asset aligné.

## Comment l'utiliser

### 1. Ouvre Cowork ou Claude Code

* **Cowork** (recommandé pour les non-devs) : ouvre l'app, sélectionne ce dossier
* **Claude Code** (pour les devs) : `cd` dans ce dossier et lance `claude`

### 2. Demande ce dont tu as besoin

Exemples :

* *"Fais-moi une slide d'introduction pour un pitch comex"*
* *"Écris-moi le hero d'une landing page sur la formation accessibilité"*
* *"Audite ce texte que je veux poster sur LinkedIn"*
* *"Génère-moi une section 'Différenciateurs' pour la page Approche"*

### 3. Claude consulte les bonnes sources

L'agent principal (page **Agent principal**) **route automatiquement** vers les bonnes parties du repo :

* Voix Frontguys → `brand/voice/`
* Identité, personas, positionnement → `brand/identity/`
* Couleurs, typo, tokens → `brand/visual/`
* Composants techniques → `brand/components/`

### 4. Claude produit l'asset

Avec les bons skills (`skills/`), les bons templates (`templates/`), et les bonnes valeurs (snapshot tokens + JSON Gitlab).

## Structure du repo

```
.
├── README.md              ← Ce fichier (point d'entrée humain)
├── CLAUDE.md              ← Agent principal — Claude le charge en premier
├── AGENTS.md              ← Définitions de sous-agents (optionnel)
│
├── brand/                 ← La vérité Frontguys (rarement modifiée)
│   ├── identity/          ← Vision, mission, valeurs, positionnement, personas
│   ├── voice/             ← Tonalité, règles d'écriture, vocabulaire, exemples
│   ├── visual/            ← Tokens, typo, états, modes light/dark, illustrations
│   └── components/        ← 33 composants Astro/React documentés
│
├── skills/                ← Workflows automatisés
│   ├── sync-tokens/       ← Rafraîchir le snapshot tokens depuis Gitlab
│   ├── create-slide-deck/ ← Produire une présentation Frontguys
│   ├── create-landing-page/ ← Produire une landing Astro
│   ├── create-web-section/ ← Produire une section web réutilisable
│   ├── write-copy/        ← Produire du copy aligné voix
│   └── audit-brand-compliance/ ← Auditer un asset existant
│
├── templates/             ← Bouts de code et de structure prêts à composer
│   ├── astro/
│   └── slides/
│
├── examples/              ← Few-shots pour calibrer Claude (good/bad)
│
└── references/            ← Sources d'inspection (PAS commit) — exclus du repo via .gitignore
    └── accessibility-website/  ← Clone local du repo Frontguys
```

## Principes architecturaux

### 1. Zéro valeur en dur

* ❌ Pas de couleur, font-size, spacing codés en dur dans un asset
* ✅ Toutes les valeurs viennent de `src/tokens/*.json` (repo Gitlab Frontguys, synchronisé depuis Figma via TokensBrücke)
* Le repo Brand OS encode **les règles d'usage**, pas les valeurs

### 2. Sources externes restent canoniques

* **Knowtion** = source de vérité éditoriale (identité, voix, copy)
* **Figma** = source de vérité visuelle (tokens, composants, illustrations)
* **Gitlab Frontguys** = source de vérité technique (composants Astro)
* Le repo Brand OS est une **projection optimisée pour Claude** — pas une duplication

### 3. Économie de tokens IA

Chaque fichier est découpé pour qu'on ne charge que ce qui est nécessaire à une tâche. Les skills indiquent **quels fichiers charger** selon la demande. Pas de mégafichier monolithique.

### 4. Retro-spec avant production

Avant de produire un asset, Claude **explique ce qu'il a compris** de la demande et des sources qu'il va mobiliser. L'utilisateur valide, puis Claude produit. Pas de surprise, pas d'invention.

### 5. Hypothèses marquées

Certains contenus sont marqués 🔵 (hypothèse non validée terrain) ou 🟡 (en cours d'harmonisation). Claude n'en fait jamais des certitudes commerciales dans des assets externes.

## Pour mettre à jour le repo

### Quand les sources canoniques changent

| Source qui change | Action |
|-------------------|--------|
| Identité Frontguys (vision, mission, persona) dans Knowtion | Re-syncer `brand/identity/` manuellement (rare — quelques fois par an) |
| Voix / règles d'écriture dans Knowtion | Re-syncer `brand/voice/` manuellement |
| Tokens Figma (couleurs, typo) | L'équipe DS Frontguys re-pousse via TokensBrücke → `src/tokens/*.json` met à jour automatiquement |
| Composants Astro Gitlab | Lancer le skill `sync-components` (à venir) ou mise à jour manuelle de `brand/components/catalog/` |
| Tokens snapshot Brand OS | Lancer le skill `sync-tokens` |

### Conventions

* Toute modification dans `brand/` doit citer sa source canonique dans le frontmatter
* Le champ `last_synced` est mis à jour à chaque sync
* Les hypothèses (🔵 / 🟡) ne sont jamais "promues" en faits sans validation terrain

## Pour les contributeurs Frontguys

* **Designers** : maintenez les sources Figma (tokens, composants) et Knowtion (identité, voix). Ce repo se met à jour en aval.
* **Devs** : maintenez le repo Gitlab `accessibility-website`. Ce repo se met à jour en aval.
* **PMs / sales** : utilisez le repo. Demandez à Claude vos assets, validez, partagez.
* **Tous** : si une règle vous semble fausse ou incomplète, ouvrez une issue ou modifiez directement.

## Crédits

Maintenu par l'équipe Frontguys avec Claude (Anthropic). Architecture initiale conçue par Maxime Guy (Product Designer & Design System).