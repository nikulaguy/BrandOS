# scope-research

---

name: scope-research description: Accompagner un collaborateur Frontguys dans le cadrage d'une recherche utilisateur — transformer une demande floue en problématique précise liée à un enjeu business triggers: \["faire une recherche", "recherche utilisateur", "cadrer une recherche", "test utilisateur", "interviews utilisateurs", "discovery", "survey", "questionnaire", "uxr", "user research", "atelier de cadrage recherche"\] files_to_load_always:

* skills/scope-research/references/cadrage-research-template files_to_load_conditional:
* skills/scope-research/references/intake-interview-guide (si l'utilisateur veut conduire une intake interview)
* brand/identity/personas/{persona} (si une cible persona est mentionnée)
* skills/scope-project (à charger en lecture car la recherche complète la méthode projet) storage: knowtion_collection_id: TBD (à demander au collaborateur — typiquement "Refonte > UXR & Discovery") default_publish: false (= draft du collaborateur) last_synced: 2026-05-12 source: knowtion/cadrage-dune-recherche (doc_id 898d869b-4d42-4023-b435-1eb1e4420308)


---

# Skill — scope-research

## Quand utiliser

Tout cadrage d'une recherche utilisateur Frontguys, à l'amont d'une étude UXR. À déclencher dès qu'un collaborateur exprime un besoin de **comprendre** quelque chose qui nécessite des données / observations utilisateurs.

**Ne PAS utiliser** pour :

* Un projet général qui n'est pas une recherche → **scope-project**
* Une recherche déjà cadrée → utiliser le template directement
* Une étude marché / benchmark concurrents (différent d'une recherche utilisateur)

## Principe fondateur

> **Transformer une demande de recherche floue → en une définition de problématique précise, liée à un enjeu business et à un périmètre précis.**

Une recherche cadrée par ce skill répond toujours à :

* **Pourquoi** on la fait (enjeu business + décisions à prendre)
* **Quoi** on cherche à savoir (questions de recherche précises)
* **Qui** on étudie (cible + critères de recrutement)
* **Comment** (méthode + livrables + contraintes)

## Workflow

### Étape 1 — Première écoute (5 min)

Avant tout, laisser le commanditaire **raconter sa demande** dans ses mots :

* Quelle est l'intuition / le doute / la question qui motive cette recherche ?
* Qu'est-ce qu'il aimerait pouvoir décider après ?
* Y a-t-il urgence ?

### Étape 2 — Choisir la méthode de cadrage

Selon la maturité de la demande et le nombre de parties prenantes :

| Méthode | Quand | Participant | Durée |
|---------|-------|-------------|-------|
| **Intake interview** | Demande venant d'**1 commanditaire** (PM, métier, décideur) | Le commanditaire seul | 1-2h  |
| **Atelier collaboratif** | Demande impliquant **plusieurs parties prenantes** (design + dev + métier + UXR) | Toutes les parties prenantes | 2h    |


:::warning
Si plusieurs commanditaires implicites avec des attentes potentiellement divergentes → **atelier collaboratif obligatoire**.

:::

### Étape 3 — Charger les sources

Toujours :

* **Cadrage Research Template** (sous-page — template canonique 7 sections)

Selon le contexte :

* Si intake interview retenue → **Intake Interview Guide** (sous-page)
* Si une cible persona est mentionnée → fiche persona Claire / Marc-Antoine / Alexis
* Lecture utile en complément : **scope-project** (une recherche est aussi un projet)

### Étape 4 — Remplir le template section par section

**Conversationnel, jamais formulaire** : poser les questions une à une, reformuler, valider.

#### Section 1 — Problème & objectifs

3 questions à creuser dans cet ordre :


1. **Quel problème cherchons-nous à résoudre ?** Décrire le problème observé ou supposé. Pas la solution, le problème.
2. **Quel est le résultat souhaité à l'issue de cette recherche ?** Décisions à prendre, enseignements attendus. Concret et actionnable.
3. **Quelles sont les questions de recherche principales ?** Reformuler le besoin en 2-5 **questions de recherche** précises (pas des questions à poser aux users).

> Exemple de bonne question : *"Comment les utilisateurs intermédiaires construisent-ils leur stratégie d'investissement quand ils découvrent un nouveau produit ?"*
>
> Exemple de mauvaise question : *"Est-ce que les utilisateurs aiment notre nouvelle interface ?"* (trop vague, biais de confirmation)

#### Section 2 — Contexte & connaissances existantes

**Ancrer dans ce qu'on sait déjà** pour éviter de réinventer la roue.

* **Que savons-nous déjà ?** Lister exhaustivement (études passées, analytics, NPS, retours support, interviews informelles…)
* **Quelles sont les hypothèses ?** Croyances/intuitions à valider ou invalider — 2-5 hypothèses
* **Dépendances connues** (projets liés, recrutement, roadmap…)

#### Section 3 — Parties prenantes

* **Qui demande l'étude** (commanditaire principal + motivation)
* **Décideurs finaux** (qui utilisera les résultats, qui peut bloquer/approuver)
* **Autres parties prenantes** avec niveau d'implication (RACI)
* **Personas utilisateurs cibles** (JTBD + macro caractéristiques)

#### Section 4 — Risques & obstacles

* Risques si la recherche n'aboutit pas
* Obstacles potentiels (accès users, dispo équipe, données manquantes, sensibilité sujet…)
* **Biais à surveiller** (confirmation, échantillon, périmètre)

#### Section 5 — Périmètre & contraintes

* Horizon temporel : court (< 2 semaines), moyen (2-6 sem), long (> 6 sem)
* Contraintes par type (budget, calendrier, RH, accès users, technique/légal) avec niveau de flexibilité (Fixe / Négociable)
* Deadline livrables

#### Section 6 — Approche envisagée

* **Méthode(s)** : entretiens / tests utilisateurs / survey / observation / card sorting / analyse données / autre
* **Critères de recrutement** : personas cibles, nombre, canal, critères précis
* **Livrables attendus** : rapport, synthèse, repository insights, recommandations, personas, journey map…

#### Section 7 — Validation du cadrage

Checklist des 6 sections précédentes — toutes marquées validées avant de lancer la recherche.

### Étape 5 — Création automatique dans Knowtion

```
create_document
  title: "[Recherche] {objet de la recherche}"
  collection_id: <à confirmer>
  parent_document_id: <id du projet parent si applicable>
  text: <contenu compilé>
  publish: false  # toujours en draft
```

**Demander confirmation avant création.**

Après création, retourner : lien vers le doc, récap des décisions, prochaine action recommandée :

* Si **intake** : envoyer le doc au commanditaire pour relecture
* Si **atelier** : planifier la session de 2h avec toutes les parties prenantes

### Étape 6 — Auto-audit avant livraison

Vérifier :

- [ ] **Problème** clairement formulé (pas la solution)
- [ ] **Résultat souhaité** = décisions à prendre (actionnable)
- [ ] **2-5 questions de recherche** précises (pas des questions à poser aux users)
- [ ] **Connaissances existantes** listées
- [ ] **2-5 hypothèses** explicites
- [ ] **Commanditaire + décideurs finaux** identifiés nominativement
- [ ] **Personas cibles** identifiés avec JTBD
- [ ] **Biais à surveiller** documentés
- [ ] **Horizon temporel** sélectionné + deadline
- [ ] **Méthode** sélectionnée et cohérente avec les questions de recherche
- [ ] **Aucune invention** : si une info manque, c'est explicité

## Lien avec scope-project

Une recherche **est** un projet interne au sens de la méthode Frontguys. Elle hérite donc des principes :

* Pilotage par la valeur (le **résultat souhaité** = la valeur attendue)
* Objectif SMART = la question de recherche principale formulée temporellement
* Gouvernance claire = commanditaire + UXR responsable + décideurs finaux
* Visibilité totale = page Knowtion + suivi opérationnel

**Si le projet de recherche n'est pas déjà rattaché à un projet plus large**, suggérer au collaborateur de créer aussi une page Projet via `scope-project` qui pointera vers cette page Cadrage Recherche.

## Anti-patterns

* ❌ Démarrer par "Quelle méthode utiliser ?" → on commence toujours par **Pourquoi**
* ❌ Question de recherche = question à poser aux users → ce sont 2 niveaux différents
* ❌ Sauter la section "Que savons-nous déjà ?" → risque de doublon de recherche
* ❌ Méthode quanti pour comprendre du qualitatif (et inversement)
* ❌ Recruter sans critères précis → biais d'échantillon garanti
* ❌ Page publiée directement (sans draft) → toujours en draft, à valider par les parties prenantes
* ❌ Hypothèses formulées comme certitudes → toujours "à valider/invalider"

## Voir aussi

* **Cadrage Research Template** (sous-page)
* **Intake Interview Guide** (sous-page)
* **scope-project** — pour le cadrage projet général (méthode mère)
* **Brand > Identity > Personas** — fiches Claire / Marc-Antoine / Alexis
* Doc canonique Knowtion : <https://knowtion.frontguys.fr/doc/cadrage-dune-recherche-898d869b-4d42-4023-b435-1eb1e4420308>