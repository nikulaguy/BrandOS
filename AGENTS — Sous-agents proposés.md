# AGENTS — Sous-agents proposés

# Sous-agents Frontguys Brand OS


:::info
**Statut** : structure proposée — à activer selon les besoins de l'équipe. L'agent principal couvre 95% des cas. Les sous-agents sont utiles pour des workflows complexes ou spécialisés.

:::

Les sous-agents ne sont pas obligatoires. L'agent principal peut tout faire, mais déléguer à un sous-agent **isolé** permet de :

* garder le contexte principal léger
* spécialiser un comportement (ton, format, vérifications)
* éviter qu'un workflow long pollue la session principale

## Sous-agents proposés

### `slide-architect`

**Rôle** : conçoit l'architecture d'un deck (séquence de slides, transitions, hiérarchie narrative) avant que l'agent principal ne produise les slides une à une.

**Quand l'invoquer** : decks de plus de 8 slides, présentations stratégiques (pitch comex, présentation client).

**Skills mobilisés** : `create-slide-deck`.


---

### `copy-auditor`

**Rôle** : audite un texte (page, post, slide) contre la voix Frontguys et les 4 règles canoniques.

**Quand l'invoquer** : avant publication d'un asset sensible (landing prod, pitch externe, contenu LinkedIn).

**Skills mobilisés** : `audit-brand-compliance` (sous-section voix).


---

### `tokens-syncer`

**Rôle** : exécute le workflow de re-synchronisation des tokens depuis le repo Gitlab vers le snapshot Brand OS.

**Quand l'invoquer** : début de projet majeur ou tous les 3 mois.

**Skills mobilisés** : `sync-tokens`.


---

### `landing-builder`

**Rôle** : compose une page Astro complète à partir d'un brief, en utilisant les composants Frontguys existants.

**Quand l'invoquer** : production d'une nouvelle page web complète.

**Skills mobilisés** : `create-landing-page` + `create-web-section`.


---

## Pattern d'activation

Pour déléguer à un sous-agent dans Claude Code ou Cowork, utiliser :

```
Task tool avec subagent_type="..."
```

L'agent principal **n'est pas obligé** de déléguer. C'est une option d'optimisation pour des workflows longs.

## Roadmap

* **v1 (actuelle)** : agent principal seul + skills
* **v1.5** : activation `tokens-syncer` (le plus mécanique, facile à isoler)
* **v2** : `copy-auditor` + `slide-architect`
* **v3** : `landing-builder`