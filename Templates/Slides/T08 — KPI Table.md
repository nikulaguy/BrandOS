# T08 — KPI Table

---

## template_id: T08 template_name: KPI table when_to_use: SLA, engagements de qualité, tableaux de critères avec niveaux visual_reference: references/23-kpi-table.png last_synced: 2026-05-12

# Template T08 — KPI table

## Rôle

Slide qui présente un **engagement de qualité chiffré** sous forme de tableau. À utiliser pour les SLA, les engagements contractuels, les critères de scoring.

## Contenu type — Engagement de qualité Frontguys

| KPI | Définition | SLA atteint | SLA partiellement atteint | SLA non atteint |
|-----|------------|-------------|---------------------------|-----------------|
| Taux de refus des profils | Nb refus / Nb réponses | < 25%       | > 25% < 30%               | > 30%           |
| Réactivité moyenne de réponse | Nb jours ouvrés pour répondre — objectif 10 jours | <= 10       | > 10 <= 15                | > 15            |
| Taux de turnover | Durée de mission | > 20 mois   | Entre 15 et 20 mois       | < 15 mois       |
| Délai de remplacement consultant | Nb jours ouvrés | <= 20 jours | > 20 <= 25 jours          | > 25 jours      |

## Variables / paramètres

* **Titre H2** : énonce le sujet ("Engagement de qualité : proposition de KPI")
* **Colonnes type** :

  
  1. **KPI** (nom court)
  2. **Définition** (formulation chiffrée)
  3. **Niveau 1** — vert (atteint / OK)
  4. **Niveau 2** — orange (partiellement / à surveiller)
  5. **Niveau 3** — rouge (non atteint / critique)
* **Lignes** : 4-8 KPI max — au-delà, scinder en 2 slides

## Règles de voix

* **Noms de KPI** : nominal court (3-7 mots)
* **Définitions** : précises, chiffrées, sans jargon non expliqué
* **Seuils** : opérateurs mathématiques explicites (`<`, `<=`, `>`, `entre X et Y`)
* **Couleurs sémantiques** : vert/orange/rouge — utiliser tokens `success`, `warning`, `error` (jamais hex en dur)

## Anti-patterns

* ❌ Plus de 8 KPI sur une slide (scinder)
* ❌ Définitions floues ("rapide", "raisonnable") — toujours chiffrer
* ❌ Couleurs sémantiques inversées (vert pour non atteint, rouge pour atteint)
* ❌ Header de colonnes vagues ("Bon / Moyen / Mauvais") — préférer "SLA atteint / partiellement / non atteint"
* ❌ Tableau sans titre explicatif

## Pattern Frontguys récurrent

Engagements Frontguys typiques (à adapter par contrat) :

* **Taux de refus des profils**
* **Réactivité moyenne de réponse**
* **Taux de turnover** (durée moyenne en mission)
* **Délai de remplacement** d'un consultant à compétences identiques
* **Satisfaction client** (NPS, CSAT…)

## Variantes

### Variante "Tableau simple"

Pour les contenus non-SLA (tableau de comparaison, matrice de couverture…). Mêmes règles : titres explicites, contenu chiffré, max 8 lignes.

### Variante "Tableau avec ligne d'engagement"

Une dernière ligne "Engagement global" qui synthétise (ex: "100% des KPI doivent atteindre le niveau atteint sur la durée du contrat").

## Voir aussi

* **T11 Key Figures** — alternative pour mettre en avant des chiffres clés (non comparatifs)
* **T10 Process Flow** — pour les engagements de processus (vs résultats chiffrés)