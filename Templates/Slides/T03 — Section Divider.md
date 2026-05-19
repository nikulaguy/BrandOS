# T03 — Section Divider

---

## template_id: T03 template_name: Section divider when_to_use: Transition entre grandes sections du deck visual_reference: references/25-section-divider-ai.png last_synced: 2026-05-12

# Template T03 — Section divider

## Rôle

Slide de transition qui annonce le début d'une nouvelle grande section. Pose le titre de la section et son angle (sous-titre).

## Structure visuelle

```
┌─────────────────────────────────────────────┐
│   FRONTGUYS × Bpifrance       (sur-titre)  │
│                                             │
│   <Titre de la section>          (H1)      │
│   <Sous-titre / angle>          (subtitle) │
│                                             │
│   <Illustration ou visuel d'accroche>       │
└─────────────────────────────────────────────┘
```

## Contenu type

Exemple (RAO BPI, section IA) :

| Élément | Contenu |
|---------|---------|
| Sur-titre | "FRONTGUYS × Bpifrance" (rappel de la collaboration) |
| Titre H1 | "L'IA au cœur des lots Design et Engineering" |
| Sous-titre | (optionnel — sous-section ou contexte) |
| Visuel  | Illustration thématique en lien avec la section |

Autres exemples du même RAO :

* "Compréhension du contexte" + "Ce qui ressort de votre Appel d'offre"
* "Notre positionnement"
* "Dispositif cible proposé" + "Comment nous menons nos interventions"
* "Nos expertises"
* "Profils proposés"
* "Références et cas détaillés"

## Variables / paramètres

* **Sur-titre** : toujours "FRONTGUYS × {Client}" — sert d'ancrage récurrent
* **Titre H1** : reprend exactement l'entrée du sommaire (cohérence)
* **Sous-titre** : optionnel, max 1 ligne, donne l'angle de la section
* **Fond** : choix au cas par cas, mais souvent `semantic-background-subtle` pour démarquer du contenu

## Règles de voix

* **Sur-titre** : factuel, "Frontguys × {Client}" (le × reprend le pattern Cover)
* **Titre** : Nous actif quand possible ("Nous renforçons", "Nous accompagnons", "Notre positionnement"…) — sinon nominal pour les sections génériques
* **Sous-titre** : Vous ou impératif si verbal, sinon nominal

## Anti-patterns

* ❌ Slide section sans sur-titre (perte du repère "Frontguys × Client")
* ❌ Sous-titre qui répète le titre (ex: H1 "Nos expertises" + sous-titre "Nos expertises")
* ❌ Section divider qui contient déjà du contenu argumentatif (la section divider est un seuil, pas une argumentation)
* ❌ Section divider trop dense (visuel chargé qui distrait du seuil)

## Voir aussi

* **T01 Cover** — pattern similaire mais pour la couverture du deck
* **T04 Text Paragraph** — slide qui suit typiquement avec le contenu