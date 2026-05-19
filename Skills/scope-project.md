# scope-project

---

name: scope-project description: Accompagner un collaborateur Frontguys dans le cadrage léger (1-2h) d'un projet interne — page maître Knowtion + objectifs SMART + Kanban triggers: \["démarrer un projet", "lancer un projet", "cadre ce projet", "cadrer un projet", "initialiser un projet", "commencer le projet", "nouveau projet", "j'ai une idée de projet"\] files_to_load_always:

* skills/scope-project/references/page-projet-template files_to_load_conditional:
* brand/identity/convictions (rappel pilotage par la valeur)
* brand/identity/positioning-ai (si le projet touche à l'IA)
* skills/scope-research (si la nature du projet est une recherche → router) storage: knowtion_collection_id: TBD (à demander au collaborateur ou défaut "Projets internes") knowtion_parent_doc_slug: projets-internes-YCxd90LkxB default_publish: false (= draft du collaborateur) last_synced: 2026-05-12 source: knowtion/methode-dinitialisation-de-cadrage-et-gestion-de-projet (V2, doc_id 4d43fec7-681a-4c6a-bbc2-6a7de2db3592)


---

# Skill — scope-project

## Quand utiliser

Tout démarrage de projet interne Frontguys, quelle que soit sa taille ou son niveau d'incertitude. À déclencher dès qu'un collaborateur dit "je voudrais lancer / démarrer / cadrer / initier..." ou exprime une **idée** / **opportunité** à transformer en projet.

**Ne PAS utiliser** pour :

* Une **recherche utilisateur** spécifiquement → router vers **scope-research**
* Un projet **client** (méthode Frontguys ≠ méthode mission client) — sauf si le client demande cette méthode

## Principe fondateur

> **Aucun projet n'existe sans au moins un objectif SMART explicite + une gouvernance claire.**

Tout asset produit par ce skill doit aboutir à une page Projet Knowtion remplie au minimum jusqu'aux **objectifs SMART**, en moins de **1-2 heures de cadrage**.

## Workflow

### Étape 1 — Première écoute (5 min)

Avant toute structuration, laisser le collaborateur **raconter l'idée** dans ses mots. Capter :

* L'origine (déclencheur, problème observé, opportunité)
* Le niveau de maturité (idée vague → projet avancé)
* L'urgence ressentie


:::warning
**Ne pas plonger dans le template immédiatement.** Si le collaborateur est encore dans la phase "idée floue", l'accompagner d'abord à clarifier le sens avant de structurer.

:::

### Étape 2 — Vérifier si c'est en réalité une recherche

Si l'objet du projet est principalement de **comprendre quelque chose** (tests utilisateurs, interviews, survey, analyse de données, discovery exploratoire), **router vers** `**scope-research**` :

> "Tu décris une recherche utilisateur — j'ai un skill dédié pour ça (`scope-research`) qui suit la méthode UXR Frontguys. Je bascule dessus ?"

Sinon, continuer avec scope-project.

### Étape 3 — Charger les sources

Toujours :

* **Page Projet Template** (sous-page — template à instancier)

Selon le contexte :

* Si le projet mentionne IA / agents / LLM → **Brand > Identity > Positioning AI**
* Si le projet est éditorial / commercial → **Brand > Identity > Convictions**

### Étape 4 — Remplir la page Projet section par section

**Conversationnel, pas formulaire** : poser les questions une à une, reformuler, valider. Si la réponse manque, **ne pas inventer** — proposer des hypothèses à valider.

#### 4.1 Résumé exécutif

* **Nom du projet** — court, mémorable, sans jargon
* **Gouvernance** :
  * Responsable (1 seule personne)
  * Équipe de réalisation (2-5 personnes max)
  * Équipe étendue (parties prenantes informées)
* **Statut** initial (aligné Kanban macro) : `Idée/Opportunité` · `À cadrer` · `En cours` · `En pause` · `Terminé` · `Abandonné`
* **Problème / opportunité adressé** : 2-3 phrases qui répondent à "pourquoi ce projet ?"
* **Valeur attendue** — choisir 1-2 catégories parmi :
  * **Business** (chiffre d'affaires, leads, conversion, coûts)
  * **Image** (notoriété, marque, positionnement)
  * **Efficacité interne** (productivité équipe, temps gagné, dette réduite)
  * **Apprentissage** (validation hypothèse, montée en compétence, POC)

#### 4.2 Objectifs SMART (le coeur du cadrage)

**Règle absolue : 1 objectif SMART minimum**, formulé avec ce template :

> *D'ici \[date\], nous aurons \[résultat spécifique\], mesuré par \[indicateur\], atteignable avec \[ressources\], pertinent car \[valeur\], validé lorsque \[critère clair\].*

Décliner par horizon :

* **Court terme** (2-4 semaines) — toujours présent
* **Moyen terme** (1-3 mois) — fortement recommandé
* **Long terme** — uniquement si pertinent

**Vérifier les 5 dimensions** :

- [ ] **S**pécifique : résultat clair sans ambiguïté
- [ ] **M**esurable : indicateur observable ou chiffré
- [ ] **A**tteignable : réaliste avec les ressources actuelles
- [ ] **P**ertinent : aligné avec une valeur Frontguys
- [ ] **T**emporel : date précise


:::warning
Si l'utilisateur a du mal à formuler un objectif SMART, c'est un signal que le projet n'est pas mûr pour le cadrage. **Revenir à l'étape 1** (l'idée n'est pas claire).

:::

#### 4.3 Indicateurs de valeur

Pour chaque objectif SMART : **1 à 3 indicateurs maximum** (pas plus, sinon dilution).

Exemples canoniques : Taux d'adoption · Gain de temps · Qualité perçue · Apprentissage validé · Décision prise (go / no-go)

#### 4.4 Périmètre

* **Inclus** : ce qui est explicitement traité
* **Exclus** : ce qui ne sera **pas** traité, sauf décision formelle ultérieure

> L'`Exclus` est aussi important que l'`Inclus` — il évite les malentendus.

#### 4.5 Jalons & deadlines

Un jalon = un **point de validation**, PAS un livrable technique.

Pour chaque jalon :

* **Date**
* **Critère de validation clair**
* **Décision attendue** (go / no-go / pivot)

### Étape 5 — Décision Go / Pause / Stop

À la fin du cadrage (max 2h), proposer une décision :

* **Go** : démarrage immédiat, Kanban Projet créé, première action engagée
* **Pause** : projet pertinent mais pas prioritaire, à reprendre quand X
* **Stop** : projet écarté, raison documentée

### Étape 6 — Création automatique dans Knowtion

**Action automatique** :

```
create_document
  title: "[Projet] {nom}"
  collection_id: <à confirmer avec collaborateur ou défaut "Projets internes">
  parent_document_id: <id du Kanban Projets Internes : projets-internes-YCxd90LkxB>
  text: <contenu compilé selon le template>
  publish: false  # toujours en draft du collaborateur
```

**Demander confirmation avant création** :

> "Je vais créer la page Projet dans Knowtion en draft (visible uniquement par toi). Tu pourras l'éditer et la publier quand tu veux. OK ?"

Après création, retourner : lien vers le doc, récap des décisions structurantes, prochaine action.

### Étape 7 — Auto-audit avant livraison

Vérifier :

- [ ] Au moins **1 objectif SMART** formulé avec les 5 dimensions vérifiées
- [ ] Gouvernance identifiée (responsable + équipe)
- [ ] Valeur attendue catégorisée (business/image/efficacité/apprentissage)
- [ ] Périmètre Inclus + Exclus présents
- [ ] Au moins 1 jalon défini avec date + critère
- [ ] Décision Go/Pause/Stop prise
- [ ] **Aucune invention** : si une info manque, c'est explicité ("à compléter par Maxime")

## Anti-patterns

* ❌ Cadrer en 5 minutes pour "aller vite" → le cadrage est court (1-2h) mais pas bâclé
* ❌ Inventer des chiffres dans les objectifs SMART pour les faire paraître SMART
* ❌ Plus de 3 objectifs SMART → diluer les priorités
* ❌ Plus de 3 indicateurs par objectif → impossible à suivre
* ❌ Jalons = livrables techniques (mauvaise lecture) → un jalon est un point de décision
* ❌ Page publiée directement (sans draft) → toujours en draft pour relecture
* ❌ Skip Étape 2 (vérifier si recherche) → router vers scope-research si applicable
* ❌ Confondre "À cadrer" et "En cours" — un projet "En cours" a déjà passé le cadrage léger

## Maintenance

Si la méthode évolue dans Knowtion (doc V3+), re-syncer ce skill :

* Source : `knowtion/methode-dinitialisation-de-cadrage-et-gestion-de-projet` (doc_id `4d43fec7-681a-4c6a-bbc2-6a7de2db3592`)
* Mettre à jour **Page Projet Template** en miroir
* Mettre à jour `last_synced` du frontmatter

## Voir aussi

* **Page Projet Template** (sous-page)
* **scope-research** — pour les projets de recherche (sous-cas)
* **Brand > Identity > Convictions** — conviction 4 "L'impact se mesure, se partage, se pilote"
* Doc canonique Knowtion : <https://knowtion.frontguys.fr/doc/methode-dinitialisation-de-cadrage-et-gestion-de-projet-k9bSTYZcBt>