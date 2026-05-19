# Deck Structure

---

## type: deck-structure purpose: Gabarit narratif d'un deck Frontguys (pitch / présentation interne / talk) last_synced: 2026-05-11

# Gabarit — Structure d'un deck Frontguys

Trois variantes selon le contexte. **Adapter, ne pas appliquer aveuglément.**

## Variante 1 — Pitch commercial (8-12 slides)

Cible : Marc-Antoine (DSI / décideur) ou audience mixte décideurs.

| #   | Slide | Contenu type |
|-----|-------|--------------|
| 1   | **Couverture** | Logo Frontguys + titre du pitch + nom client/prospect + date |
| 2   | **Constat** | "Le problème que vous vivez actuellement" — accroche par le contexte du persona, langage business |
| 3   | **Vision Frontguys** | Une phrase forte sur ce qu'on apporte (citer la mission verbatim possible) |
| 4   | **Approche** | Méthode Frontguys — design ↔ dev intégré · séniorité · pragmatisme |
| 5   | **Preuve 1** | Cas client comparable (avec chiffres) |
| 6   | **Preuve 2** | Cas client comparable (autre secteur ou autre profil) |
| 7   | **Différenciateurs** | Humanité · Design/Dev intégré · Séniorité (les 3 piliers) |
| 8   | **Conviction ancrée** | Une des 4 convictions, démontrée par les preuves précédentes |
| 9   | **Chiffres clés Frontguys** | Métriques tangibles (cas clients dispensés, formations Qualiopi, etc.) |
| 10  | **Proposition concrète** | Format d'intervention (squad augmentée · audit · formation) + jalons |
| 11  | **Investissement** | Indication budget ou prochaine étape |
| 12  | **CTA** | Premier échange · diagnostic gratuit |

## Variante 2 — Présentation interne / formation (8-15 slides)

Cible : Claire (Head of P&D) ou équipes design/dev clients.

| #   | Slide | Contenu type |
|-----|-------|--------------|
| 1   | **Couverture** | Titre formation + intervenant + date |
| 2   | **Sommaire** | Plan du module |
| 3   | **Objectifs pédagogiques** | "À l'issue de cette session, vous serez capable de..." |
| 4-N | **Concepts** | Une notion par slide, exemple Frontguys ou cas concret |
| N+1 | **Atelier / exercice** | Mise en pratique |
| N+2 | **Synthèse** | Récap des points-clés |
| N+3 | **Ressources** | Pour aller plus loin (Knowtion, articles Frontguys, etc.) |
| N+4 | **CTA** | Prochaine étape, contact, feedback |

## Variante 3 — Talk public / meetup (10-20 slides)

Cible : audience large (designers, devs, PMs).

| #   | Slide | Contenu type |
|-----|-------|--------------|
| 1   | **Couverture** | Titre talk + nom intervenant + Frontguys + date/lieu |
| 2   | **Crochet** | Question ou chiffre fort — provoquer la réflexion |
| 3   | **Constat / problème** | Ce qu'on observe dans le métier (sans cibler de marque) |
| 4   | **Plan du talk** | 2-4 axes     |
| 5-N | **Axes** | Pour chaque axe : énoncé · illustration · exemple Frontguys · règle à retenir |
| N+1 | **Synthèse** | 3 takeaways concrets |
| N+2 | **Sources / ressources** | Articles, conférences, repos publics |
| N+3 | **À propos** | Frontguys en 2 lignes — mission, contact LinkedIn |

## Règles transversales

### Voix sur chaque slide

* **Titre** : Nous actif (Règle 1) → ex: "Nous structurons votre Design System"
* **Sous-titre / body** : Vous / impératif (Règle 3) → ex: "Découvrez la méthode."
* **Pas plus de 5 bullet points** par slide
* **Pas plus de 20 mots** par phrase (FALC)
* **1 CTA primary maximum** par slide

### Visuel sur chaque slide

* Couleurs via **tokens Semantic** uniquement (jamais en dur)
* Typo via les **rôles slide** du fichier Figma Slides (`zxUFGOje9V4PRX6SsPec6O`)
* Illustrations Frontguys (cf **Brand > Visual > Illustrations Index**)
* Cohérence light/dark dans le deck (pas de mix)

### Convictions

* **Toujours ancrer au moins 1 conviction explicitement** (cf **Brand > Identity > Convictions**)
* **La conviction doit être démontrée**, pas juste citée (anti-pattern : "la conviction décorative")

### Hypothèses 🔵

* Positionnement et sections IA des personas sont **hypothèses non validées terrain**
* Ne **jamais** les formuler comme certitudes commerciales dans un asset externe
* Préférer : "Frontguys s'adresse à…", "l'enjeu identifié est…"

## Anti-patterns

* ❌ Bullet points denses (> 5 par slide)
* ❌ 2 CTAs primary sur la même slide
* ❌ Cas client inventé ou non vérifié
* ❌ Mélange de registres (vocabulaire CTO + vocabulaire DSI sur deux slides consécutives sans transition)
* ❌ Slide finale "Merci" sans CTA actionnable
* ❌ Couleurs en dur ou typographies non-Frontguys
* ❌ Conviction citée sans démonstration