# T10 — Process Flow

---

## template_id: T10 template_name: Process flow when_to_use: Étapes temporelles, parcours d'intégration, frise chronologique visual_reference: — last_synced: 2026-05-12

# Template T10 — Process flow

## Rôle

Slide qui présente un **enchaînement chronologique d'étapes**. À utiliser pour les processus d'intégration, les délais contractuels, les frises de mission.

## Structure visuelle

```
┌─────────────────────────────────────────────┐
│   <Titre H2>                                │
│                                             │
│   ●─────●─────●─────●─────●                │
│   J     J+10  J+12  GO    J+20              │
│   Exp.  Org.  Valid. Décis. Démarr.         │
│   besoin entr. retours       intégr.        │
│                                             │
│   <Détails ou légende complémentaire>       │
└─────────────────────────────────────────────┘
```

## Contenu type — Intégration d'une ressource (RAO BPI, slide 23)

```
J             J+10              J+12              GO              J+20
●─────────────●─────────────────●─────────────────●───────────────●

Expression    Organisation      Validation        Décision         Démarrage
du besoin     d'entretiens      (retour à         go / no-go       intégration ou
                                organisation                       recouvrement
                                d'entretiens                       
                                si no-go)
```

Avec encart complémentaire :

* **Sortie d'une ressource en 20 jours ouvrés**
* **Backup / Remplacement** : 100% du coût pris en charge par Frontguys (10 jours gratuité)
* **Absence non planifiée** : back-up automatique sans recouvrement

## Variables / paramètres

* **Titre H2** : énonce le processus ("Intégration d'une ressource et gestion des backups")
* **Frise** : 3-6 nœuds maximum (au-delà, scinder)
* **Pour chaque nœud** :
  * **Repère temporel** (J, J+10, GO, etc.)
  * **Label court** (1-3 mots)
  * **Description** (1 ligne max)
* **Légende / précisions** : encart complémentaire sous la frise

## Règles de voix

* **Titre** : nominal, descriptif du processus
* **Labels d'étapes** : nominal court (Expression du besoin, Validation, Démarrage) ou verbe à l'infinitif
* **Descriptions** : phrases courtes, parallélisme syntaxique entre les étapes
* **Repères temporels** : convention claire (J, J+N, semaine N…)

## Anti-patterns

* ❌ Plus de 6 nœuds sur une seule frise (scinder)
* ❌ Étapes sans repère temporel (rend la frise inutile)
* ❌ Frise verticale quand horizontale serait plus claire (préférer l'horizontal pour la lecture)
* ❌ Mélange de granularités (jours + semaines + mois sur la même frise)
* ❌ Absence de point de départ et de point d'arrivée clairs

## Pattern Frontguys récurrent

Processus types Frontguys mobilisables :

* **Intégration d'un consultant** : J → J+20
* **Démarrage d'une mission** : Cadrage → Diagnostic → Plan → Action → Livraison
* **Réversibilité** : Annonce → Transition → Documentation → Handover → Sortie
* **Process IA** : Demande → Cadrage humain → Action IA → Validation humaine → Livraison

## Variantes

### Variante "Process avec rôles"

Ajouter une colonne "Qui fait quoi" sous chaque étape (Frontguys / Client / Mixte).

### Variante "Process avec livrables"

Ajouter sous chaque étape les livrables produits (document, validation, code, etc.).

### Variante "Process IA / humain"

Distinguer visuellement les étapes IA (icône / couleur) des étapes humaines pour matérialiser le Human-in-the-loop.

## Voir aussi

* **T08 KPI Table** — pour les engagements de délais sous forme tabulaire
* **T09 Case Study** — peut intégrer un mini-flow dans la section "Notre approche"