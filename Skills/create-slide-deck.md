# create-slide-deck

---

name: create-slide-deck description: Produire une présentation Frontguys (Figma Slides ou .pptx) qui respecte intégralement la charte triggers: \["fais-moi une slide", "fais-moi un deck", "présentation", "pitch", "slides", "pptx"\] files_to_load_always:

* brand/voice/writing-rules
* brand/voice/vocabulary
* brand/visual/tokens-snapshot
* templates/slides/README (Phase 2) files_to_load_conditional:
* brand/identity/personas/{persona} (selon cible)
* brand/identity/convictions (pour pitch / deck stratégique)
* brand/identity/positioning (pour pitch commercial)
* brand/identity/positioning-ai (DÈS QUE LE DECK PARLE D'IA — obligatoire)
* templates/slides/T0X-{nom} (selon les types de slides utilisés) (Phase 2) last_synced: 2026-05-12


---

# Skill — create-slide-deck

## Quand utiliser

* Production d'un deck Frontguys (pitch comex, présentation client, slide de meetup, talk)
* Format de sortie : **Figma Slides** (préféré pour interne) ou **.pptx** (préféré pour client externe)

## Étapes

### Étape 1 — Cadrage

Demander à l'utilisateur (1-2 questions max) :

* **Cible / persona** : Claire, Marc-Antoine, Alexis, ou audience mixte ?
* **Objectif** : pitch commercial · présentation interne · talk public · formation ?
* **Format** : Figma Slides · .pptx · les deux ?
* **Durée / nombre de slides** approximatif ?

### Étape 2 — Architecture narrative + sélection des templates

Avant de produire les slides une à une, **proposer une architecture en associant chaque slide à un template** :

```
Slide 1  — Couverture                      → T01-cover
Slide 2  — Sommaire                        → T02-summary
Slide 3  — Section divider                 → T03-section-divider
Slide 4  — Constat / Problème              → T04-text-paragraph
Slide 5  — Vision / Approche Frontguys     → T05-three-columns (trilogie)
Slide 6  — Axes opérationnels              → T06-four-columns
Slide 7  — Cas client / REX                → T09-case-study
Slide 8  — Chiffres clés                   → T11-key-figures
Slide 9  — Engagement qualité              → T08-kpi-table
Slide N+1 — Appel à l'action               → T04-text-paragraph (CTA)
```

**Cartographie templates** : voir **Templates > Slides** *(Phase 2)* pour les 12 templates disponibles.

**Demander validation** de l'architecture (séquence + templates choisis) avant de produire les slides.

### Étape 3 — Charger les sources

Toujours :

* **Brand > Voice > Writing Rules** + **Vocabulary**
* **Brand > Visual > Tokens Snapshot** (pour les couleurs / typo si Figma Slides)
* **Templates > Slides > README** *(Phase 2)*

Selon le cadrage :

* Persona dominant → charger sa fiche (1 seule)
* Pitch / deck long → + **Convictions** + **Positioning**
* **Deck qui parle d'IA** → + **Positioning AI** (obligatoire — 3 principes, pattern Human-in-the-loop, 9 cas)
* Référence visuelle → fileKey Typography Slides : `zxUFGOje9V4PRX6SsPec6O` (Figma MCP)

### Étape 4 — Produire chaque slide

Pour chaque slide :

* **Titre H1 Slide** : Nous actif (Règle 1)
* **Sous-titre** : Vous / impératif (Règle 3)
* **Body** : pragmatique (Règle 2), max 20 mots/phrase (FALC)
* **CTA si applicable** : impératif (Règle 4)
* **Vocabulaire** : aligné persona dominant

**Pour le visuel** :

* Couleurs via tokens Semantic uniquement
* Typo via les rôles Slides (`slide.title`, `slide.subtitle`, `slide.body`…) du fichier Figma `zxUFGOje9V4PRX6SsPec6O`
* Illustrations Frontguys (cf **Illustrations Index**) — pas d'images génériques
* Modes light/dark cohérents au sein du deck

### Étape 5 — Format de sortie

#### Pour Figma Slides (préféré pour interne)

* Utiliser le **template Figma Slides** : `Template - Slides 2025` (lien dans la collection Knowtion DS)
* Référence canonique : `https://www.figma.com/slides/Nf0DToE9tvbrIm2JpOjugd/Template---Slides-2025`
* Composition directement dans Figma Slides via MCP

#### Pour .pptx (préféré pour externe)

* Utiliser la skill `pptx` Anthropic
* Encoder les rôles typographiques en se référant à `Foundation - Figma Slide Text Styles` (Figma fileKey `zxUFGOje9V4PRX6SsPec6O`)
* Couleurs : extraire depuis **Tokens Snapshot** → encoder en HEX dans le .pptx

### Étape 6 — Auto-audit avant livraison

Pour chaque slide :

- [ ] Template T0X identifié et respecté (structure visuelle conforme à la fiche)
- [ ] Titre Nous actif
- [ ] Sous-titre Vous / impératif
- [ ] Phrases ≤ 20 mots
- [ ] CTA impératif conjugué (1 max par slide)
- [ ] Pas d'auto-valorisation gratuite
- [ ] Vocabulaire persona cohérent
- [ ] Tokens visuels respectés (pas de couleur en dur)
- [ ] Une conviction ancrée dans le deck (au moins une — 5 disponibles, dont l'IA en cas de besoin)
- [ ] Hypothèses 🔵 traitées comme telles

**Si le deck parle d'IA** (audit supplémentaire) :

- [ ] Trilogie Cadrée / Pertinente / Raisonnée respectée (pas d'évangélisation universelle)
- [ ] Pour chaque cas IA : pattern "Ce que l'IA fait / Ce que l'humain garde" visible (T09)
- [ ] Pour chaque cas IA : section "Cadre de maîtrise" présente
- [ ] Vocabulaire de hype (révolutionnaire, magique, disruptif) absent
- [ ] Résultats chiffrés ou tangibles cités

### Étape 7 — Livrer

* Fichier .pptx (visible par computer:// link) si format .pptx
* Lien Figma Slides si format Figma
* Récap : persona ciblé · conviction ancrée · architecture narrative

## Anti-patterns

* ❌ Slide avec plus d'une conviction "décorative" sans démonstration
* ❌ Slide avec couleurs en dur (toujours via tokens)
* ❌ Bullet points denses (> 5 par slide)
* ❌ Phrases > 20 mots
* ❌ Mélange de registres dans le même deck (ex: vocabulaire Alexis sur slide 2, Marc-Antoine sur slide 3)
* ❌ Cas client inventé (vérifier les références)
* ❌ Multiplicité de CTAs sur une même slide (1 max)