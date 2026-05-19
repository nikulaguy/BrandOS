# T09 — Case Study

---

## template_id: T09 template_name: Case study (IA ou projet) when_to_use: Présentation d'un cas client, REX, démonstration IA — TEMPLATE LE PLUS UTILISÉ visual_reference: references/30-case-study-france-tv.png last_synced: 2026-05-12

# Template T09 — Case study

## Rôle

**Template le plus utilisé** dans les RAO et pitches Frontguys. Présente un cas client ou un POC IA selon une structure narrative canonique : Contexte → Notre approche → Ce que l'IA fait / Ce que l'humain garde → Résultat → Cadre de maîtrise.

## Structure visuelle

```
┌─────────────────────────────────────────────┐
│ [Bandeau coloré : tag thématique]           │
│ <Titre du cas>                  (H1)        │
│ <Sous-titre / promesse>          (H3)       │
│                                             │
│ Contexte :                                  │
│ <Description du problème client>            │
│                                             │
│ Notre approche : <synthèse 1 phrase>        │
│                                             │
│ ┌─────────────────┬───────────────────┐   │
│ │ Ce que l'IA     │ Ce que l'humain     │   │
│ │ fait            │ garde               │   │
│ ├─────────────────┼───────────────────┤   │
│ │ • Action 1      │ • Décision 1        │   │
│ │ • Action 2      │ • Décision 2        │   │
│ │ • Action 3      │ • Décision 3        │   │
│ └─────────────────┴───────────────────┘   │
│ Résultat : <synthèse + métriques>           │
│ Cadre de maîtrise : <pré-requis>            │
└─────────────────────────────────────────────┘
```

## Contenu type — DS Assistant France TV

**Tag** : "Design System" **Titre H1** : Naviguer dans la complexité d'une UX multi-plateforme

**Contexte** : Les applications France Télévisions sont disponibles sur le web, iOS/Android et dans des Smart TV / box internet → bonnes pratiques & contraintes UX divergentes. Le DS FTV s'adapte à cette complexité qui exige une forte expertise partagée.

**Notre approche** : Création d'un GPT personnalisé avec base de connaissance qui agrège plusieurs dizaines de documentations.

**Ce que l'IA fait** :

* Suggère des composants par cas d'usage
* Reformule et complète les guides internes
* Répond aux questions techniques
* Assiste les nouveaux arrivants

**Ce que l'humain garde** :

* Le choix d'une UX native ou custom
* Les choix d'implémentation technique
* L'autonomie de développer une expertise sur une plateforme donnée

**Résultat** : Un assistant expert utilisé par les designers et les devs (conception → implémentation)

* Disponibilité : immédiate, 24/7
* Accessibilité : réponses précises et documentées
* Expertise partagée : la complexité des systèmes embarqués enfin à la portée de tous

**Cadre de maîtrise** :

* Fournir une documentation technique exhaustive et structurée (iOS/Android/embarqué/a11y)
* Documenter le Design System : guidelines d'usage des composants et patterns
* Définir les personas des utilisateurs du chat (Dev web/mobile, Designer, PO)

## Variables / paramètres

* **Bandeau / tag** : catégorisation thématique (`Design System`, `Workflow`, `Recherche utilisateur`, `Vibe coding`, `POC IA lab`…)
* **Titre H1** : le **problème** ou la **promesse** du cas en quelques mots
* **Sous-titre H3** : précision narrative
* **Contexte** : 2-3 phrases descriptives du contexte client
* **Notre approche** : **1 phrase claire** qui synthétise la solution
* **Ce que l'IA fait / Ce que l'humain garde** : **3-5 bullets parallèles** dans chaque colonne
* **Résultat** : 2-4 résultats concrets (chiffrés si possible)
* **Cadre de maîtrise** : 2-4 conditions du succès

## Règles de voix

* **Titre** : Nous actif quand possible ("Nous transformons") ou question ("Comment accélérer X ?")
* **Contexte** : neutre, descriptif — pose le problème sans dramatisation
* **Notre approche** : Nous actif obligatoire, verbe d'action concret
* **Ce que l'IA fait** : verbes actifs (Suggère, Reformule, Répond, Assiste, Génère, Analyse…)
* **Ce que l'humain garde** : substantifs ou verbes à l'infinitif évoquant la maîtrise (Le choix, La validation, L'autonomie, La conception)
* **Résultat** : chiffres concrets quand possible, métriques business
* **Cadre de maîtrise** : impératifs ou substantifs (Fournir, Documenter, Définir)

## Anti-patterns

* ❌ **Cas sans "Cadre de maîtrise"** — section systématique, jamais omise (signal d'humilité Frontguys)
* ❌ **"Ce que l'IA fait" déséquilibré avec "Ce que l'humain garde"** (l'humain doit toujours garder au moins autant que l'IA)
* ❌ **Pattern "Ce que l'IA fait / Ce que l'humain garde" omis** — c'est la **signature narrative** Frontguys
* ❌ **Résultat sans chiffre tangible** ("amélioration de la qualité" — préférer "16h → 2h", "5 jours au lieu de 2 semaines")
* ❌ **Contexte trop long** (> 3 phrases)
* ❌ **Notre approche en plusieurs phrases** — toujours synthétiser en 1 phrase, max 2

## Les 9 cas IA Frontguys mobilisables

Voir **Brand > Identity > Positioning AI** pour la table complète :

| Cas | Tag / Catégorie | Résultat clé |
|-----|-----------------|--------------|
| France TV — DS Assistant | Design System   | GPT custom, 24/7 |
| Lefebvre Dalloz — DS IA Native | Design System   | Reboot 5j (avant 2 semaines) |
| LFP — Agents IA Refactoring | Design System   | Migration + DS adopté |
| Lefebvre Dalloz — Vibe Coding | Vibe coding     | Prototype 2j (avant 10j) |
| BPI SVI — IA Sparring Partner | Workflow        | Parcours mieux adaptés |
| UXR — Analyse entretiens | Recherche utilisateur | 16h → 2h     |
| POC Agent DS semi-autonome | POC IA lab      | Souverain, on-premise |
| Content System accéléré | POC IA lab      | -30% temps drafting |
| IA to Design to Dev to IA | Projet interne  | 10 pages, ×10 plus rapide |

## Variantes du template

### Variante "Cas non-IA"

Même structure mais sans le bloc "Ce que l'IA fait / Ce que l'humain garde". Garder Contexte → Approche → Résultat → Cadre de maîtrise.

### Variante "Cas court" (1 slide)

Compacter en mode 4 sections (Contexte / Approche / Résultat / Cadre).

### Variante "Cas long" (2 slides)

Slide 1 : Contexte + Approche + Ce que l'IA fait/Ce que l'humain garde Slide 2 : Résultats détaillés + Cadre de maîtrise + Liens vers ressources

## Voir aussi

* **Brand > Identity > Positioning AI** — pattern Human-in-the-loop + 9 cas mobilisables
* **Deck Structure** — où placer ces cas dans la narration globale