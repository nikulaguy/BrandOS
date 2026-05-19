# Cadrage Research Template

---

## type: template purpose: Template Markdown de la page Cadrage Recherche Frontguys — à instancier puis créer dans Knowtion via create_document source: knowtion/cadrage-dune-recherche last_synced: 2026-05-12

# Template — Cadrage Recherche

> Ce template suit strictement la structure du doc canonique Knowtion. Le skill `scope-research` le remplit conversationnellement avec le commanditaire (et idéalement les parties prenantes) puis crée la page Knowtion via MCP.


---

```markdown
# [Recherche] {objet de la recherche}

| Étude demandée | Projet associé | Date de la demande | UX researcher | Commanditaire |
|---|---|---|---|---|
| {objet précis} | [{Nom du projet interne}] | {jj/mm/aaaa} | @{consultant} | @{commanditaire} |

---

## 1. Problème & objectifs

### Quel problème cherchons-nous à résoudre ?

> Décrivez ici le problème observé ou supposé. Pas la solution, le problème.

{description du problème}

### Quel est le résultat souhaité à l'issue de cette recherche ?

> Décrivez ici les décisions à prendre ou les enseignements attendus.

{décisions / enseignements}

### Quelles sont les questions de recherche principales ?

| # | Question |
|---|---|
| Question 1 | {question de recherche précise — pas une question à poser aux users} |
| Question 2 | {...} |
| Question 3 | {...} |

---

## 2. Contexte & connaissances existantes

### Que savons-nous déjà ?

> Études passées, données analytics, retours support, NPS, interviews informelles… Listez toute la connaissance disponible.

| Connaissance | Type de donnée | Date | Source | Lien |
|---|---|---|---|---|
| {connaissance 1} | {qualitatif / quantitatif / mixte} | {jj/mm/aaaa} | {source} | {lien} |
| {connaissance 2} | | | | |

### Quelles sont les hypothèses ?

| # | Hypothèse à valider/invalider |
|---|---|
| Hypothèse 1 | {croyance/intuition/conviction sur le problème} |
| Hypothèse 2 | {...} |
| Hypothèse 3 | {...} |

### Quelles sont les dépendances connues ?

| # | Dépendance |
|---|---|
| Dépendance 1 | {projet dépendant / recrutement / roadmap…} |
| Dépendance 2 | {...} |

---

## 3. Parties prenantes

### Qui demande cette étude ?

| Nom | Rôle | Équipe | Motivation principale |
|---|---|---|---|
| {nom} | {PM / décideur / métier…} | {équipe} | {motivation} |

### Qui sont les décideurs finaux ?

> Qui utilisera les résultats pour prendre des décisions ? Qui a le pouvoir de bloquer ou d'approuver ?

{liste des décideurs nominativement}

### Y a-t-il d'autres parties prenantes à impliquer ou informer ?

| Partie prenante | Niveau d'implication (RACI) | Attentes |
|---|---|---|
| {nom} | {Responsable / Approuvateur / Consulté / Informé} | {attentes} |

### Pour qui cherchons-nous à résoudre ce problème ? (utilisateurs cibles)

| Persona | JTBD | Macro caractéristiques |
|---|---|---|
| {Persona 1} | {Job To Be Done} | {caractéristiques} |
| {Persona 2} | {...} | {...} |

---

## 4. Risques & obstacles

### Quels sont les risques si la recherche n'aboutit pas ?

{ce qui se passe si on ne fait pas cette étude, ou si elle "échoue"}

### Quels obstacles pourraient entraver la recherche ?

| # | Description de l'obstacle |
|---|---|
| Obstacle 1 | {accès aux utilisateurs, dispo équipe, données manquantes, sensibilité du sujet…} |
| Obstacle 2 | {...} |

### Quels sont les biais ou angles morts à surveiller ?

{biais de confirmation, périmètre trop large/étroit, échantillon non représentatif, etc.}

---

## 5. Périmètre & contraintes

### S'agit-il d'un projet court terme ou long terme ?

- [ ] Court terme (moins de 2 semaines)
- [ ] Moyen terme (2 à 6 semaines)
- [ ] Long terme (plus de 6 semaines)
- [ ] À définir

### Quelles sont les contraintes identifiées ?

| Type | Description | Flexibilité |
|---|---|---|
| Budget | {description} | {Fixe / Négociable} |
| Calendrier / Roadmap | {description} | {Fixe / Négociable} |
| Ressources humaines | {description} | {Fixe / Négociable} |
| Accès aux utilisateurs | {description} | {Fixe / Négociable} |
| Technique / Légal | {description} | {Fixe / Négociable} |

### Quelle est la deadline pour les livrables ?

{Date de restitution souhaitée : jj/mm/aaaa}

---

## 6. Approche envisagée

### Méthode(s) de recherche pressentie(s)

> Exploratoire, évaluative, quantitative, qualitative…

- [ ] Entretiens utilisateurs
- [ ] Tests utilisateurs (usability testing)
- [ ] Survey / Questionnaire
- [ ] Observation / Shadowing
- [ ] Card sorting / Tree testing
- [ ] Analyse de données existantes
- [ ] Autre : {préciser}

### Critères de recrutement

| Personas cible | Nombre | Canal de recrutement | Critères de recrutement | Commentaires |
|---|---|---|---|---|
| {persona 1} | {n} | {canal} | {critères précis} | {note} |
| {persona 2} | {n} | {canal} | {...} | |

### Livrables attendus

| # | Type |
|---|---|
| Livrable 1 | {rapport, synthèse, repository insights, recommandations, personas, journey map…} |
| Livrable 2 | {...} |

---

## 7. Validation du cadrage

| Étape | Statut |
|---|---|
| 1. Problème & objectifs | `À faire` |
| 2. Contexte & connaissances existantes | `À faire` |
| 3. Parties prenantes identifiées | `À faire` |
| 4. Risques & obstacles | `À faire` |
| 5. Périmètre et contraintes | `À faire` |
| 6. Approche envisagée | `À faire` |

---

## Historique du cadrage

| Date | Évolution | Auteur |
|---|---|---|
| {jj/mm/aaaa} | Cadrage initial via {Intake interview / Atelier collaboratif} | @{ux-researcher} |
```


---

## Notes pour le LLM

* **Toujours** créer ce document avec `publish: false` dans Knowtion (draft du collaborateur)
* Lier au projet parent (`parent_document_id`) si le projet est déjà cadré via `scope-project`
* Collection cible typique : "Refonte > UXR & Discovery" — mais le commanditaire peut préférer une autre collection (collection du projet associé par ex.)
* Après création, suggérer la prochaine action :
  * Si **intake** : envoyer le doc au commanditaire pour relecture avant validation
  * Si **atelier** : planifier la session de 2h avec toutes les parties prenantes