# Page Projet Template

---

## type: template purpose: Template Markdown de la page Projet Frontguys — à instancier puis créer dans Knowtion via create_document source: knowtion/methode-dinitialisation-de-cadrage-et-gestion-de-projet V2 last_synced: 2026-05-12

# Template — Page Projet

> Ce template suit strictement la structure du doc canonique Knowtion. Le skill `scope-project` le remplit conversationnellement avec le collaborateur puis crée la page Knowtion via MCP.


---

```markdown
# [Projet] {nom-projet}

## 1. Résumé exécutif

> Lecture < 2 minutes. Cette section permet à n'importe quelle partie prenante de comprendre le sens et les enjeux du projet en quelques secondes.

**Nom du projet** : {nom}

**Gouvernance**
- **Responsable** : @{nom-prénom}
- **Équipe de réalisation** : @{...}, @{...}
- **Équipe étendue** : @{...}

**Statut** : {Idée/Opportunité | À cadrer | En cours | En pause | Terminé | Abandonné}

**Problème / opportunité adressé**
{2-3 phrases qui répondent à "pourquoi ce projet ?"}

**Valeur attendue** (en accord avec les objectifs Frontguys)
- [ ] Business — {précision si coché}
- [ ] Image — {précision si coché}
- [ ] Efficacité interne — {précision si coché}
- [ ] Apprentissage — {précision si coché}

---

## 2. Objectifs SMART

> Au moins 1 objectif SMART explicite est obligatoire. Format :
> *D'ici [date], nous aurons [résultat spécifique], mesuré par [indicateur], atteignable avec [ressources], pertinent car [valeur], validé lorsque [critère clair].*

### Court terme (2-4 semaines)

> D'ici le {date}, nous aurons {résultat}, mesuré par {indicateur}, atteignable avec {ressources}, pertinent car {valeur}, validé lorsque {critère}.

### Moyen terme (1-3 mois)

> D'ici le {date}, nous aurons {résultat}, mesuré par {indicateur}, atteignable avec {ressources}, pertinent car {valeur}, validé lorsque {critère}.

### Long terme (optionnel)

> D'ici le {date}, nous aurons {résultat}, mesuré par {indicateur}, atteignable avec {ressources}, pertinent car {valeur}, validé lorsque {critère}.

---

## 3. Indicateurs de valeur

> 1 à 3 indicateurs maximum par objectif. Doivent être observables/chiffrés.

| Objectif | Indicateur(s) |
|---|---|
| Court terme | • {indicateur 1}<br>• {indicateur 2} |
| Moyen terme | • {indicateur 1} |
| Long terme | • {indicateur 1} |

---

## 4. Périmètre

### Inclus

- {ce qui est explicitement pris en charge}
- {...}

### Exclus

- {ce qui ne sera **pas** traité, sauf décision formelle ultérieure}
- {...}

---

## 5. Jalons & deadlines

> Un jalon = un point de validation (pas un livrable technique). Chaque jalon a : une date, un critère de validation, une décision attendue.

| Jalon | Date | Critère de validation | Décision attendue |
|---|---|---|---|
| {nom jalon 1} | {jj/mm/aaaa} | {critère clair} | {go / no-go / pivot} |
| {nom jalon 2} | {jj/mm/aaaa} | {critère clair} | {go / no-go / pivot} |

---

## 6. Pilotage opérationnel

**Kanban Projet** : {lien Loop ou à créer}

**Cycles** : {1 semaine | 2 semaines}

**Revue de valeur** : à chaque fin de cycle, répondre aux 4 questions :
1. Qu'avons-nous livré ?
2. Quelle valeur réelle a été observée ?
3. Les objectifs SMART sont-ils atteints ou en bonne voie ?
4. Quels ajustements sont nécessaires ?

---

## 7. Décision de cadrage

**Date du cadrage** : {jj/mm/aaaa}

**Décision** : {Go | Pause | Stop}

**Date de démarrage** (si Go) : {jj/mm/aaaa}

**Justification** : {courte explication si Pause ou Stop, ou contexte de démarrage si Go}

---

## Historique du projet

| Date | Évolution | Auteur |
|---|---|---|
| {jj/mm/aaaa} | Cadrage initial | @{prénom-nom} |
```


---

## Notes pour le LLM

* **Toujours** créer ce document avec `publish: false` dans Knowtion (draft du collaborateur)
* Le parent est typiquement le **Kanban Projets Internes** (slug `projets-internes-YCxd90LkxB`)
* Après création, donner le **lien vers la page créée** au collaborateur pour qu'il puisse la finaliser
* Suggérer la prochaine action : **créer le Kanban Projet sur Loop**

## Variantes du template selon type de projet

### Projet de recherche

→ Utiliser plutôt `scope-research` et son template `cadrage-research-template`.

### POC technologique

* Section 1 : Valeur attendue = **Apprentissage** (par défaut)
* Section 2 : Objectif SMART formulé sous forme **"valider ou invalider X sur les critères Y"**
* Section 5 : Jalons = points de décision technique (faisabilité, performance, coût)

### Création d'asset (site, landing, deck)

* Section 4 : Périmètre exclus très important (éviter le scope creep)
* Section 5 : Jalons = points de validation visuelle ou éditoriale
* Croiser avec les skills `create-landing-page` ou `create-slide-deck`