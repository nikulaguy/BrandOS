# Positioning AI

---

## type: positioning-ai status: validated citable_as_is: true last_synced: 2026-05-12 source: knowtion + RAO BPI DD 2026 (référence canonique d'usage IA Frontguys)

# Positionnement Frontguys sur l'IA

> Document de référence sur la façon dont Frontguys aborde, mobilise et parle de l'IA. À mobiliser dans **toute production qui touche à l'IA** — RAO, landing, slide, post, article, formation.

## Conviction fondatrice

> **L'intelligence artificielle est un moyen, un accélérateur, une opportunité de transformer. Pour être toujours pertinente et efficace, elle doit être cadrée et gouvernée stratégiquement.**

Voir **Convictions** — conviction 5, citable telle quelle.

## Les 3 principes canoniques

Trois principes structurent l'usage de l'IA chez Frontguys et avec ses clients.

### Cadrée — Human-in-the-loop systématique

L'IA est utilisée selon le principe du **Human-in-the-loop** :

* Frontguys définit le **périmètre d'intervention de l'IA** et celui de l'humain
* À chaque étape, **qui fait quoi est clarifié**
* **L'IA assiste, analyse, propose** — l'humain reste **décisionnaire**, responsable des choix et en contrôle permanent des résultats

### Pertinente — IA quand elle apporte une vraie valeur

L'IA est mobilisée **uniquement lorsqu'elle apporte une réelle valeur** :

* Accélérer certains processus
* Automatiser des tâches ciblées
* Soutenir l'efficacité opérationnelle

Frontguys est conscient du **caractère non déterministe de l'IA** et **ne la considère jamais comme une solution universelle**. Son usage est choisi **avec discernement**, uniquement lorsque le contexte, les enjeux et les bénéfices attendus le justifient, **en complément de l'expertise humaine**.

### Raisonné — Modèles légers, souverains, économes

Frontguys privilégie une **approche responsable** de l'IA :

* **Modèles adaptés aux besoins réels** (pas le plus gros disponible)
* **Solutions légères, économes en ressources** et financièrement maîtrisées
* **Limitation des dépendances technologiques fortes** (éviter le vendor lock-in)
* **Souveraineté quand possible** — solutions on-premise, open-source, cloud européen (Scaleway, OVH, HuggingFace, Mistral)

Cette approche conserve **agilité, maîtrise des coûts et liberté de choix**, garantissant une intégration durable de l'IA dans les usages.

## Les 4 axes opérationnels — Maîtriser les usages IA

Quand Frontguys conseille au-delà de l'opérationnel, **4 axes** structurent l'accompagnement :

### Gouvernance

* Étude et benchmark de **plusieurs dizaines de gateways IA** (contrôle des accès, usages et coûts liés aux LLM)
* Déploiement maîtrisé des nouveaux outils
* Visibilité et reporting sur les usages

### Coûts

* Éviter la dépendance à un fournisseur unique
* Tester les **LLM alternatifs (open-weight)**
* Privilégier des **fournisseurs d'API serverless** rapides, souples et économiques

### Adoption

* Solutions **adaptées aux besoins des profils utilisateurs**
* Faciles à prendre en main chez les clients et en interne
* Exemple : **agent personnalisé** destination des consultants pour simplifier la production dans un contexte mouvant

### Sécurisation

* Éviter la **multiplication des installations et des clés d'API** sur chaque poste utilisateur
* Expertise sur la **sécurisation des serveurs MCP**
* Frontguys a déployé un **MCP de sa base de connaissance couplé au SSO Azure Microsoft**

## Le pattern universel — "Ce que l'IA fait / Ce que l'humain garde"

C'est le **pattern narratif central** du positionnement IA Frontguys. À utiliser **systématiquement** dans toute description d'un cas d'usage IA.

### Structure canonique

```
Ce que l'IA fait                          Ce que l'humain garde
─────────────────                         ───────────────────
- Action automatisable                    - Décision et arbitrage
- Analyse, structuration                  - Sens, nuance, interprétation
- Génération, proposition                 - Responsabilité, validation
- Accélération mécanique                  - Vision, stratégie, qualité finale
```

### Exemples observés

| Cas | Ce que l'IA fait | Ce que l'humain garde |
|-----|------------------|-----------------------|
| **France TV — DS Assistant** | Suggère composants, reformule guidelines, répond aux questions techniques, assiste les nouveaux | Choix UX (native/custom), choix d'implémentation, autonomie de développer l'expertise |
| **Lefebvre Dalloz — DS IA native** | Échafaude composants React, assemble vues, branche API | Conception, code review, conventions, qualité finale, edge cases |
| **LFP — Refactoring agents IA** | Documente code legacy, détecte règles métier altérées, automatise tâches répétitives, crée batteries de tests | Choix patterns, contrôle qualité, attention UX, connaissance règles métier |
| **Lefebvre Dalloz — Vibe coding** | Accélère création protocoles tests, produit prototypes réalistes, accélère analyse résultats | Vision/stratégie produit, priorisation sur données réelles, cohérence DS, alignement équipes |
| **BPI SVI — IA sparring partner** | Se projette dans usages investisseurs, challenge parcours, met en évidence axes d'amélioration | Cadre/objectifs/contexte, conception solutions adaptées, décisions et arbitrages UX |
| **UXR — Analyse entretiens** | Structuration verbatims, premiers codages, synthèses intermédiaires traçables | Interprétation/nuance, validation insights, recommandations et décisions produit |
| **Content System** | Analyse et réécrit, aligne sur la charte, automatise production textuelle, accélère l'exécution | Contrôle des hallucinations, sens de la nuance, responsabilité de la décision design |

## Les 9 cas IA Frontguys mobilisables

| Cas | Contexte | Résultat clé |
|-----|----------|--------------|
| **France TV — Design System Assistant** | UX multi-plateforme complexe (web/iOS/Android/SmartTV) | GPT custom expert des guidelines, disponible 24/7 |
| **Lefebvre Dalloz — DS IA Native** | DS vieillissant, peu compatible IA générative | Reboot DS en 5 jours (avant : 2 semaines), composants Open Source + Copilot |
| **LFP — Agents IA Refactoring** | Outil critique, dette technique bloquant DS interne | Migration Angular + adoption DS + réduction poids appli, refonte inenvisageable rendue possible |
| **Lefebvre Dalloz — Vibe Coding** | LegalTech à accélérer, conception centrée utilisateur impossible avant | Prototype en 2 jours (avant : 10) cohérent avec DS |
| **BPI SVI — IA Sparring Partner** | Outil financier complexe, investisseurs peu disponibles pour tester | Parcours mieux adaptés, compréhension métier vulgarisée |
| **UXR — Analyse entretiens UX** | 16h de traitement pour 20 interviews | 16h → 2h, scalabilité, qualité (plus d'itérations, détection associations) |
| **POC IA Lab — Agent DS semi-autonome** | Besoin solutions souveraines, on-premise | Agent IA on-premise (Scaleway/OVH/HuggingFace/Mistral), création composants déclenchée après publication Figma |
| **Content System accéléré** | Maintien voix unique à l'échelle, drafting manuel = frein | Drafting réduit drastiquement, gain estimé \~30% temps |
| **IA to Design to Dev to IA — Frontguys** | Production du lot 2 du site Frontguys | 10 pages basées sur 4 templates, qualité maintenue, temps Figma + dev divisés par 10 |

> Chaque cas suit le **même pattern de slide** (template T09) : Contexte → Notre approche → Ce que l'IA fait / Ce que l'humain garde → Résultat → Cadre de maîtrise

## Vocabulaire à mobiliser

* **Cadrée · Pertinente · Raisonnée** — la trilogie canonique
* **Human-in-the-loop** — le pattern d'encadrement central
* **Gouvernance IA · Gateway IA · MCP sécurisé · SSO Azure**
* **LLM open-weight · API serverless · cloud européen** (vs cloud propriétaire hors Europe)
* **POC** — Frontguys assume ses POC (5 POC IA en 2025) et les revendique
* **Cadre de maîtrise** — section systématique dans tout cas IA (les conditions du succès)
* **Skills, MCP, agents IA, vibe coding** — vocabulaire technique assumé quand l'audience le permet
* **Sparring partner** — métaphore IA challenge / aide la réflexion

## Vocabulaire à éviter

| ❌ À éviter | Pourquoi |
|------------|----------|
| "Révolutionnaire", "disruptif", "magique" | Vocabulaire de hype incompatible avec Cadrée/Raisonnée |
| "L'IA va remplacer..." | Discours anxiogène ; Frontguys positionne l'IA comme complément à l'expertise humaine |
| "Solution IA universelle" | Contredit le principe Pertinente |
| "L'IA gagne du temps tout court" | Trop générique ; toujours nommer **où** elle gagne du temps (16h→2h, 10j→2j…) |
| "Black box", "boîte noire" | Frontguys revendique le contrôle et la traçabilité |
| Anglicismes IA non traduits sans audience tech | "Sparring partner" OK pour Claire/Alexis ; pour Marc-Antoine, traduire par "challenger" |

## Anti-patterns

### 1. La conviction IA décorative

❌ Lister "IA cadrée et gouvernée" sans démontrer **comment** dans le même asset.

✅ Toujours accompagner d'au moins **un cas concret** + **un cadre de maîtrise** + **un Human-in-the-loop explicité**.

### 2. Le POC qui impressionne sans transformer

❌ Présenter une démo IA spectaculaire sans expliquer comment elle change le delivery réel.

✅ Toujours nommer **le résultat opérationnel** (cycles raccourcis, dette réduite, équipe autonomisée, etc.).

### 3. L'IA sans cadre de maîtrise

❌ Décrire un cas IA sans détailler les conditions du succès.

✅ **Toujours inclure une section "Cadre de maîtrise"** : pré-requis, documentation, garde-fous, conditions techniques.

### 4. L'IA universelle

❌ "L'IA peut faire X et Y et Z et A et B..."

✅ Frontguys mobilise l'IA **uniquement où elle a une valeur démontrable**, et le dit explicitement.

### 5. Vendor lock-in masqué

❌ Évangéliser une solution IA spécifique (OpenAI, Anthropic, Google) sans alternative.

✅ Frontguys teste **LLM alternatifs et open-weight**, et conseille selon le contexte client.

### 6. IA présentée comme menace ou anxiogène

❌ "L'IA va prendre le travail des designers/devs"

✅ Frontguys positionne l'IA comme **levier qui libère du temps pour des activités à plus haute valeur** (stratégie, recherche, créativité).

## Règles d'usage pour LLM

### Quand un asset touche à l'IA, charger en priorité


1. **Positioning AI** (cette page)
2. **Convictions** (au moins conviction 5)
3. Le persona ciblé (section "Rapport à l'IA" 🔵 hypothèse)

### Lors de la rédaction

* Toujours ancrer **explicitement** la conviction 5 (citation directe possible)
* Toujours appliquer le pattern "Ce que l'IA fait / Ce que l'humain garde" si un cas IA est décrit
* Toujours nommer un **résultat opérationnel chiffré ou tangible** (jamais un bénéfice vague)
* Toujours mentionner un **cadre de maîtrise** quand le format le permet (slide > 1 paragraphe)
* Sélectionner les **cas Frontguys mobilisables** selon le contexte (cf table des 9 cas)

### Lors de l'auto-audit

Vérifier sur tout asset IA :

- [ ] Conviction 5 ancrée (au moins implicitement)
- [ ] Trilogie Cadrée/Pertinente/Raisonnée respectée (jamais d'évangélisation universelle)
- [ ] Si cas IA présenté : pattern Human-in-the-loop visible
- [ ] Si cas IA présenté : cadre de maîtrise explicité
- [ ] Vocabulaire de hype (révolutionnaire, magique, disruptif) absent
- [ ] Résultats chiffrés ou tangibles (pas de bénéfice vague)
- [ ] Pas de promesse de solution universelle
- [ ] Adapté à l'audience (vocabulaire technique seulement si persona Alexis/Claire ; vulgarisé pour Marc-Antoine)

## Source canonique

Ce document est la **synthèse opérationnelle** du positionnement IA observé dans :

* **RAO BPI DD 2026** (réponse à appel d'offre Bpifrance — référence d'usage la plus complète à ce jour)
* Convictions Knowtion (`01-synthese-strategique`)
* Cas clients documentés dans les guildes IA Frontguys

À re-synchroniser si Knowtion ou les cas clients évoluent significativement.