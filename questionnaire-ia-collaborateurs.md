# Questionnaire IA — Collaborateurs Frontguys

**Objectif** : cartographier l'usage actuel de l'IA, les compétences perçues, les besoins de formation et les profils relais au sein de Frontguys, pour structurer un plan d'accompagnement adapté.

**Durée estimée** : 12 à 15 minutes.

**Légende des types de question** :
- `single` : choix unique
- `multi` : choix multiple
- `open` : champ texte libre
- `scale-5` : échelle 1 à 5 (voir libellés Section 3)
- `ranking` : classement de N choix max

---

## Section 1 — Profil

*Temps : 1-2 min · Toutes les questions sont obligatoires.*

### Q1. Nom et prénom
- **Type** : `open` (texte court)
- **Obligatoire** : oui

### Q2. Équipe / département
- **Type** : `single`
- **Options** :
  - Design (product)
  - Dev
  - Research
  - RH
  - Commerce
  - Autre
- **Obligatoire** : oui
- **Note form** : cette réponse pilote le branching de la Section 4.

### Q3. Ancienneté dans le poste actuel
- **Type** : `single`
- **Options** :
  - Moins de 1 an
  - 1 à 3 ans
  - 3 à 5 ans
  - 5 ans et plus
- **Obligatoire** : oui

### Q4. Manages-tu une équipe ?
- **Type** : `single`
- **Options** :
  - Oui
  - Non
- **Obligatoire** : oui

---

## Section 2 — Usage actuel & posture

*Temps : 5 min*

### Q5. À quelle fréquence utilises-tu l'IA dans ton travail ?
- **Type** : `single`
- **Options** :
  - Usage régulier (plusieurs fois par semaine)
  - Usage discontinu (plusieurs fois par mois)
  - Usage tout récent (j'ai commencé dans les 2 derniers mois)
  - Jamais, ou j'ai arrêté
- **Obligatoire** : oui

### Q6. Que fais-tu concrètement avec l'IA, et avec quels outils ?
- **Type** : `open` (texte long)
- **Consigne** : Décris en quelques phrases. Si tu n'utilises pas l'IA, explique pourquoi (jamais essayé, déçu·e, manque de besoin, etc.).
- **Obligatoire** : oui

### Q7. Qu'est-ce qui te freine aujourd'hui dans l'usage de l'IA ?
- **Type** : `multi` (+ champ "Autre" libre)
- **Options** :
  - Manque de temps pour apprendre
  - Je ne sais pas ce qui est autorisé ou non
  - Peur de mal faire / de produire du contenu de mauvaise qualité
  - Pas convaincu·e de la valeur ajoutée
  - Outils pas adaptés à mon métier
  - Manque de formation
  - Aucun frein
  - Autre (préciser) → champ texte conditionnel
- **Règle** : si "Aucun frein" est sélectionné, désactiver les autres choix.
- **Obligatoire** : oui

### Q8. Selon toi, dans quel cas il NE faut PAS utiliser l'IA ?
- **Type** : `open` (texte long)
- **Consigne** : Donne un exemple concret tiré de ton métier ou d'une situation observée.
- **Obligatoire** : oui

---

## Section 3 — Auto-évaluation des connaissances IA (tronc commun)

*Temps : 4 min · Toutes les questions sont obligatoires.*

**Échelle à 5 niveaux**, identique pour les questions Q9 à Q17 :
- **1** — Jamais entendu parler
- **2** — J'en ai entendu parler mais je ne saurais pas l'expliquer
- **3** — Je comprends le concept et je pourrais l'expliquer
- **4** — Je sais l'utiliser en pratique
- **5** — Je l'intègre régulièrement et je pourrais former quelqu'un dessus

> **Consigne d'introduction** : Évalue honnêtement ton niveau. L'objectif n'est pas de noter, mais de calibrer un accompagnement utile.

| # | Item | Type |
|---|---|---|
| Q9 | Différences entre les principaux LLM (GPT, Claude, Gemini, Mistral) | `scale-5` |
| Q10 | Notion de prompt et techniques de prompt engineering | `scale-5` |
| Q11 | Hallucinations, biais et limites des LLM | `scale-5` |
| Q12 | Fenêtre de contexte et gestion du contexte d'une conversation | `scale-5` |
| Q13 | RAG (Retrieval Augmented Generation) et bases de connaissances | `scale-5` |
| Q14 | Agents IA et automatisations multi-étapes | `scale-5` |
| Q15 | MCP (Model Context Protocol) et connexion d'outils à un LLM | `scale-5` |
| Q16 | Confidentialité des données et bonnes pratiques de sécurité | `scale-5` |
| Q17 | Cadre légal et éthique (AI Act, droits d'auteur, données personnelles) | `scale-5` |

---

## Section 4 — Compétences spécifiques par métier (branching)

*Temps : 3 min · Branching sur Q2 (Équipe / département).*

**Même échelle 1 à 5 que la Section 3.**

> **Règle de branching** : afficher uniquement le bloc correspondant à la réponse de Q2.
> Si Q2 = "Autre", afficher un message : *« Pas de questions spécifiques pour ton métier dans cette version, passe à la Section 5. »*

---

### Si Q2 = **Design (product)** → afficher Q18 à Q25

> **Note** : Frontguys considère le product designer comme couvrant design + research. Les deux volets sont posés.

**Volet Design**

| # | Item | Type |
|---|---|---|
| Q18 | Génération d'UI à partir d'un brief (v0, Lovable, Figma Make, Bolt) | `scale-5` |
| Q19 | Génération d'images et d'illustrations (Midjourney, DALL-E, etc.) | `scale-5` |
| Q20 | Workflow design-to-code assisté par IA (Cursor, Claude Code, GitHub) | `scale-5` |
| Q21 | Création et maintenance d'un design system "AI-ready" | `scale-5` |

**Volet Research**

| # | Item | Type |
|---|---|---|
| Q22 | Phase de cadrage : guides d'entretien, desk research augmentée | `scale-5` |
| Q23 | Phase de collecte : prise de notes en temps réel lors d'entretiens | `scale-5` |
| Q24 | Phase d'analyse : codage thématique et détection de patterns sur du quali | `scale-5` |
| Q25 | Phase de restitution : rédaction de synthèses, personas, JTBD, rapports | `scale-5` |

---

### Si Q2 = **Dev** → afficher Q18 à Q22

| # | Item | Type |
|---|---|---|
| Q18 | IDE assistés (Cursor, GitHub Copilot, Claude Code) | `scale-5` |
| Q19 | Génération de code à partir de specs | `scale-5` |
| Q20 | Debug et refactoring assistés par IA | `scale-5` |
| Q21 | Tests automatisés assistés par IA | `scale-5` |
| Q22 | MCP et intégrations d'outils dans le workflow dev | `scale-5` |

---

### Si Q2 = **Research** → afficher Q18 à Q21

| # | Item | Type |
|---|---|---|
| Q18 | Phase de cadrage : guides d'entretien, desk research augmentée | `scale-5` |
| Q19 | Phase de collecte : prise de notes en temps réel lors d'entretiens | `scale-5` |
| Q20 | Phase d'analyse : codage thématique et détection de patterns sur du quali | `scale-5` |
| Q21 | Phase de restitution : rédaction de synthèses, personas, JTBD, rapports | `scale-5` |

---

### Si Q2 = **RH** → afficher Q18 à Q22

| # | Item | Type |
|---|---|---|
| Q18 | Sourcing et screening de CV assistés par IA | `scale-5` |
| Q19 | Rédaction de fiches de poste, offres et communications internes | `scale-5` |
| Q20 | Préparation d'entretiens et grilles d'évaluation | `scale-5` |
| Q21 | Cadre légal RH spécifique (RGPD, AI Act sur le recrutement) | `scale-5` |
| Q22 | Outils de formation et d'onboarding assistés par IA | `scale-5` |

---

### Si Q2 = **Commerce** → afficher Q18 à Q22

| # | Item | Type |
|---|---|---|
| Q18 | Prospection et enrichissement de leads | `scale-5` |
| Q19 | Rédaction d'emails commerciaux et propositions | `scale-5` |
| Q20 | Préparation de RDV (synthèse compte, recherche prospect) | `scale-5` |
| Q21 | CRM augmentés par IA et automatisations de suivi | `scale-5` |
| Q22 | Analyse de conversations / appels (Modjo, Gong, etc.) | `scale-5` |

---

## Section 5 — Besoins, appétence & disponibilité

*Temps : 2 min · Toutes les questions sont obligatoires.*

### Q26. Sur quels sujets aimerais-tu te former en priorité ?
- **Type** : `ranking` (classer 3 choix maximum, du plus important au moins important)
- **Options** :
  - Bases et culture IA
  - Prompting et techniques d'interaction
  - Outils spécifiques à mon métier
  - Automatisations et agents
  - Sécurité, éthique et cadre légal
  - Cas d'usage avancés
  - Autre (préciser) → champ texte conditionnel
- **Règle** : exactement 3 choix à classer (sinon 1 à 3 si ton outil de form ne supporte pas un minimum strict).

### Q27. Format de formation préféré
- **Type** : `single` (+ champ "Autre" libre)
- **Options** :
  - Atelier collectif
  - Tuto vidéo en autonomie
  - Coaching individuel
  - Documentation écrite
  - Apprentissage par projet réel
  - Autre (préciser) → champ texte conditionnel

### Q28. Temps que tu peux consacrer à la formation par mois
- **Type** : `single`
- **Options** :
  - Moins de 2h
  - 2 à 5h
  - 5 à 10h
  - 10h et plus

### Q29. Rôle de "personne ressource"
- **Énoncé** : Si tu maîtrises bien certains sujets IA, serais-tu d'accord pour être identifié·e comme "personne ressource" auprès de tes collègues sur ces sujets ?
- **Type** : `single`
- **Options** :
  - Oui, j'aimerais bien partager ce que je sais
  - Oui, mais ponctuellement et sur des sujets précis
  - Non, je préfère continuer à apprendre sans rôle de relais
  - Je ne me sens pas légitime pour ça

### Q30. (Conditionnelle) Sur quels sujets précisément ?
- **Condition d'affichage** : si Q29 = "Oui, j'aimerais bien partager…" OU "Oui, mais ponctuellement…"
- **Type** : `open` (texte court)
- **Consigne** : Cite 1 à 3 sujets sur lesquels tu te sens légitime pour aider un collègue.

---

## Section 6 — Clôture (optionnelle)

### Q31. Une remarque, un sujet manquant, une idée pour le plan de formation ?
- **Type** : `open` (texte long, optionnel)
- **Obligatoire** : non

### Q32. Acceptes-tu d'être recontacté·e pour un échange de 20-30 min sur tes réponses ?
- **Type** : `single`
- **Options** :
  - Oui, volontiers
  - Oui, si nécessaire
  - Non
- **Obligatoire** : oui

---

## Annexe — Grille de lecture (interne, ne pas inclure dans le form)

> Cette annexe sert à analyser les réponses après collecte. Elle reprend la lecture par profils comportementaux énoncée dans le plan initial.

### Axe 1 — Profil comportemental (croise Q5 + Q6)

| Profil | Signal Q5 | Signal Q6 |
|---|---|---|
| **Réguliers** | Plusieurs fois par semaine | Cas d'usage concrets et variés |
| **Discontinus** | Plusieurs fois par mois | Cas d'usage limités ou flous |
| **Nouveaux entrants** | Récent (< 2 mois) | Appétence haute, à canaliser |
| **Non-utilisateurs** | Jamais / arrêté | Distinguer jamais essayé vs déçus |

### Axe 2 — Posture face à la formation (croise Q29 + Q26 + Q28)

| Posture | Signal |
|---|---|
| **Apprenants** | Veulent se former (Q26 priorisé), temps disponible (Q28 ≥ 2h) |
| **Relais potentiels** | Maîtrise haute (Section 3/4 niveaux 4-5) + Q29 "Oui" |
| **Maîtres discrets** | Maîtrise haute + Q29 "Non" (à respecter, consulter ponctuellement) |
| **Réservés** | Peu de temps (Q28 < 2h), peu d'appétence Q26 |

### Croisements de fiabilité

- **Régulier auto-noté 2 partout en Section 3** → pratique sans théoriser → besoin de structuration conceptuelle.
- **Nouveau entrant auto-noté 4-5 partout** → surestimation classique → besoin de mise en pratique et de feedback.
- **Cohérence Q5 ↔ Section 3** = meilleur indicateur de fiabilité globale des réponses.

---

## Notes d'implémentation form

- **Outil recommandé** : Typeform, Tally, ou Google Forms (les 3 supportent le branching sur Q2 et l'affichage conditionnel Q30).
- **Anonymat** : Q1 (nom) rend les réponses nominatives — précise dans l'intro qui aura accès aux réponses brutes et qui aura accès aux agrégats uniquement.
- **Sauvegarde en cours** : activer la sauvegarde automatique du formulaire pour permettre une pause (questionnaire long).
- **Estimation temps** : afficher en intro "12-15 min" pour cadrer l'attente.
- **Ordre des sections** : ne pas modifier — la Section 2 (posture) avant la Section 3 (auto-éval) évite la sur-correction sur l'auto-éval.
