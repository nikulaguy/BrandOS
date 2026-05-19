# Agentique — Brand OS Frontguys

# Agentique — Brand OS Frontguys

> **Source de vérité unique pour produire des assets Frontguys avec n'importe quel LLM connecté à Knowtion.** Pages web, présentations, articles, posts, audits — toute production passe par ce hub.

## À qui ça s'adresse

À **tous les collaborateurs Frontguys** : designers, PMs, sales, devs, RH. Pas besoin d'être expert en design system. Tu poses ta demande à ton LLM, il lit les pages nécessaires ici, il produit un asset aligné.

## Point d'entrée pour LLM

> **Pour tout LLM qui démarre** : la première action est de charger l'**Agent principal** via `Knowtion:read_document` avec le slug `agent-principal-RgZJeid7Lp`. Ce document contient la table de routage complète et tous les slugs des skills à utiliser ensuite.

## Comment l'utiliser

### Mode 1 — LLM-agnostique via MCP Knowtion (recommandé)

Tout LLM (Claude, ChatGPT, Gemini, Mistral…) connecté à Knowtion via MCP peut :


1. Lire la page **Agent principal** (slug `agent-principal-RgZJeid7Lp`) pour comprendre son rôle et ses règles
2. Charger uniquement les pages dont il a besoin selon ta demande (slugs listés dans la table de routage de l'agent)
3. Produire l'asset en respectant l'identité, la voix et le visuel Frontguys

### Mode 2 — Cowork ou Claude Code sur le repo local

Pour les profils techniques (design system, dev), une copie locale du repo Brand OS existe. Le contenu local est un **mirror** : la source canonique reste Knowtion.

## Architecture

Cette page Agentique est le **hub**. Les sous-pages sont organisées en miroir du repo :

* **Agent principal** (`agent-principal-RgZJeid7Lp`) — règles d'or, routage par type de demande, workflow type. À charger en premier par tout LLM.
* **README projet** — vue d'ensemble pour humains
* **AGENTS** — sous-agents proposés (slide-architect, copy-auditor, etc.)
* **Brand** — identity / voice / visual / components
* **Skills** — workflows de production (slugs ci-dessous)
* **Templates** — bouts de code et de slides prêts à composer *(Phase 2)*
* **Examples** — few-shots pour calibrer les LLM *(Phase 2)*

> Le découpage est volontairement fin pour **minimiser l'usage de tokens**. Chaque page est faite pour être chargée à la demande, pas en bloc.

## Index des skills (slugs Knowtion vérifiés)

| Skill | Slug | Rôle |
|-------|------|------|
| `agent-principal` | `agent-principal-RgZJeid7Lp` | Routeur principal — à charger en premier |
| `frontguys-bindings-protocol` | `frontguys-bindings-protocol-KJ0gCGFho0` | Règles absolues pour toute production Figma |
| `create-landing-page` | `create-landing-page-tu8tCDXAHK` | Page Astro ou frame Figma complète |
| `create-slide-deck` | `create-slide-deck-0WdzhBfKhu` | Présentation Figma Slides ou .pptx |
| `create-web-section` | `create-web-section-caMA5rbZfT` | Bloc isolé d'une page web |
| `write-copy` | `write-copy-kagviVOjC4` | Texte voix agence Frontguys |
| `write-linkedin-post` | `write-linkedin-post-vcylq3Qar5` | Post LinkedIn voix Maxime |
| `audit-brand-compliance` | `audit-brand-compliance-fZAlBqgDma` | Audit d'un asset existant |
| `sync-tokens` | `sync-tokens-g14B37l3vE` | Rafraîchir le snapshot tokens depuis Gitlab |
| `generate-project-plan` | `generate-project-plan-N4ZSkgMAH1` | Plan de projet FigJam depuis PRD |
| `scope-project` | `scope-project-Pu18jSWjCh` | Cadrage léger d'un projet interne |
| `scope-research` | `scope-research-7uorMqvGbr` | Cadrage d'une recherche utilisateur |

## Règles d'or (rappel synthétique)


1. **Jamais d'invention** — aucune valeur, aucun token, aucune règle ne doit être inventée. Tout vient d'une source documentée ici ou dans une source canonique (Knowtion, Figma, Gitlab).
2. **Retro-spec avant production** — le LLM doit présenter brièvement ce qu'il a compris avant de produire.
3. **Économie de tokens** — ne charger que les pages nécessaires (voir tables "Quand charger quoi" dans chaque section).
4. **Statuts à respecter** — 🔵 hypothèse non validée / 🟡 en cours d'harmonisation / ✅ stable.

Détail complet dans la sous-page **Agent principal**.

## Sources canoniques externes

| Sujet | Source canonique |
|-------|------------------|
| Identité, voix, copy éditorial | **Knowtion** (cette base de connaissance) |
| Tokens visuels, illustrations, composants Figma | **Figma** (librairies Foundation — listées dans `frontguys-bindings-protocol`) |
| Composants Astro de prod | **Gitlab** `frontguys/accessibility-website` |

Ce hub Agentique encode les **règles d'usage**, pas les valeurs. Les valeurs vivent dans les sources canoniques et se synchronisent ici.

## Statut

* **Version** : Phase 1 — essentiel (Agent principal + Brand + skills indexés)
* **Phase 2 prévue** : composants Frontguys (26 fiches), templates de slides (12), examples
* **Maintenance** : à re-synchroniser quand les sources canoniques évoluent (vision/positioning dans Knowtion, tokens dans Figma, composants dans Gitlab)

## Crédits

Maintenu par l'équipe Frontguys. Architecture initiale conçue par Maxime Guy (Product Designer & Design System).