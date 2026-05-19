# Skills

# Skills — Workflows de production Frontguys

> **Hub Skills.** Chaque skill est un **workflow d'orchestration** : il indique au LLM quelles sources Brand charger, dans quel ordre, et quelles règles appliquer pour produire un asset Frontguys cohérent.

## Skills Frontguys (Phase 1 — disponibles)

| Skill | Quand le mobiliser |
|-------|--------------------|
| **create-slide-deck** | *"Fais-moi une slide / présentation / deck"* |
| **write-copy** | *"Écris-moi un titre / CTA / texte de page Frontguys (voix agence)"* |
| **audit-brand-compliance** | *"Audite ce texte / cette page / ce visuel"* |

## Skills Frontguys (Phase 2 — à publier)

| Skill | Rôle |
|-------|------|
| `create-landing-page` | Produire une landing Astro complète |
| `create-web-section` | Produire une section web réutilisable |
| `write-linkedin-post` | Post LinkedIn (voix Maxime) |
| `sync-tokens` | Re-sync des tokens depuis le repo Gitlab |
| `generate-project-plan` | Plan de projet structuré |
| `scope-project` | Cadrage projet |
| `scope-research` | Cadrage recherche / interviews / tests |

## Skills Figma natifs (Phase 2 — à publier)

Neuf skills natifs pour les workflows Figma : `figma-implement-design`, `figma-generate-design`, `figma-code-connect`, `figma-create-new-file`, `figma-create-design-system-rules`, `figma-generate-library`, `figma-generate-diagram`, `figma-use-figjam`, `figma-use`. Tous nécessitent le `frontguys-bindings-protocol` en prérequis pour les fichiers Frontguys.

## Pattern commun à tous les skills

Chaque skill suit la même structure :


1. **Quand l'invoquer** — déclencheurs naturels
2. **Pré-requis** — sources Brand à charger en priorité
3. **Inputs attendus** — ce que le LLM doit demander à l'utilisateur
4. **Étapes de production** — workflow ordonné
5. **Auto-audit avant livraison** — checklist de conformité
6. **Anti-patterns** — ce qu'il ne faut jamais produire