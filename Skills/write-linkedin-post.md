# write-linkedin-post

---

name: write-linkedin-post description: Rédiger un post LinkedIn dans la voix personnelle de Maxime — humilité + convictions, phrases longues, zéro ton "IA" formaté triggers: \["écris-moi un post LinkedIn", "rédige un post", "post LinkedIn sur", "billet d'humeur", "rex linkedin"\] files_to_load_always:

* skills/write-linkedin-post/references/style-guide files_to_load_conditional:
* skills/write-linkedin-post/references/examples-good (pour calibrer si doute sur le ton)
* skills/write-linkedin-post/references/examples-bad (en cas d'audit ou de doute "est-ce trop IA ?")
* skills/write-linkedin-post/references/topic-pipeline (si Maxime cherche un sujet)
* brand/identity/positioning-ai (si le post parle d'IA)
* brand/identity/convictions (si le post mobilise une conviction Frontguys) author_voice: maxime target_platform: LinkedIn storage: knowtion_doc_id: 90ae39f6-151a-40a6-9629-b40dd7072faf knowtion_url: https://knowtion.frontguys.fr/doc/draft-YjoFFhLDml storage_mode: append (toujours) last_synced: 2026-05-12


---

# Skill — write-linkedin-post

## Quand utiliser

Ce skill se déclenche pour **rédiger un post LinkedIn en ton personnel de Maxime** (pas un post agence Frontguys). À utiliser pour :

* Post réaction à un événement vécu (afterwork, conférence, démo)
* Billet d'humeur sur une tendance (terme galvaudé, certitudes, hype)
* REX sur une exploration / un workflow / un outil
* Conviction personnelle sur l'évolution du métier
* Réflexion suite à une découverte ou un échange

**Ne PAS utiliser** pour :

* Posts officiels Frontguys (voix d'agence) → **write-copy**
* Articles longs (>2000 mots) → futur `write-linkedin-article` (à créer plus tard)
* Posts à signer par un autre consultant Frontguys (voix différente)

## Voix cible

**La voix de Maxime, pas la voix de l'agence Frontguys.** Concrètement :

* "Je", "on", "nous" (équipe, parfois Frontguys) — **jamais "vous" formel**
* Humilité authentique ("J'ai l'impression", "soyons honnêtes", "quelque chose me dérange")
* Convictions fortes assumées en clôture
* Phrases longues, conjonctives, rythme parlé
* Zéro tic "IA / marketing"

> Pour la **structure détaillée et les patterns**, charger **Style Guide** (sous-page).

## Étapes

### Étape 1 — Comprendre la demande

Demander à Maxime (1-2 questions max) :

* **Sujet / angle** : événement vécu, réaction à une tendance, REX, conviction, autre ?
* **Format** : post court (5-10 lignes) · post moyen (15-25 lignes — le défaut) · post long (30+ lignes, type "billet de fond") ?
* **Cibler une audience particulière** ? (designers, devs, décideurs, ou audience large LinkedIn par défaut)

Si la demande est vague ("écris-moi un post sur l'IA"), proposer 2-3 angles différents et laisser choisir.

### Étape 2 — Charger les sources

Toujours :

* **Style Guide** (patterns canoniques)

Selon le sujet :

* **Post sur l'IA** → + **Brand > Identity > Positioning AI**
* **Post mobilisant une conviction Frontguys** → + **Brand > Identity > Convictions**
* **Doute sur le ton** → + **Examples Good** (few-shots)
* **Doute "est-ce trop IA ?"** → + **Examples Bad**
* **Pas d'idée de sujet** → + **Topic Pipeline**

### Étape 3 — Retro-spec court (uniquement si format > 15 lignes)

Avant de produire un post moyen ou long, présenter à Maxime :

* **L'angle retenu** (en 1 phrase)
* **La structure prévue** (accroche → tempérance → argumentation → conviction → ouverture)
* **La conviction qui sera défendue** (en 1 phrase)
* **Mention Frontguys** : oui (en passant) / non — selon le sujet

**Demander validation.** Pas de retro-spec pour les posts courts (< 15 lignes).

### Étape 4 — Produire selon la structure canonique

```
ACCROCHE → TEMPÉRANCE / RESSENTI → ARGUMENTATION → CONVICTION → OUVERTURE → HASHTAGS (5-7 max)
```

* **ACCROCHE** : Observation vécue, terme qui circule, événement, ou chiffre frappant.
  * "Hier soir...", "Il y a un terme qui...", "On voit déjà passer..."
* **TEMPÉRANCE / RESSENTI** : Ouverture humble, doute, ressenti perso.
  * "quelque chose me dérange", "J'ai l'impression", "Ça me parle beaucoup parce que..."
* **ARGUMENTATION** : Phrases longues, conjonctives. Analyse en 2-4 paragraphes. Vocabulaire signature (raccourci, nuance, sens, valeur, rigueur, doute, stratégie). Critique des certitudes ambiantes.
* **CONVICTION** : Affirmation forte, souvent en rythme binaire opposé.
  * "Pas X. Mais Y."
  * "Ce qu'il faut protéger, ce n'est pas X, c'est Y."
* **OUVERTURE** : Question, projection, ou réflexion humaine.
  * "Et ça pose la question de...", "Bref..."
* **HASHTAGS** : 5-7 max, en fin, minuscules typiques. #ux #design #ia ...

### Étape 5 — Auto-audit avant livraison

#### Marqueurs de voix Maxime ✅

- [ ] Au moins 1 marqueur d'humilité ("J'ai l'impression", "quelque chose me", "soyons honnêtes")
- [ ] Au moins 1 conviction forte en clôture
- [ ] Pronom "je" ou "on" / "nous" — jamais "vous"
- [ ] Au moins une phrase de 25+ mots (pas tout haché)
- [ ] "Ça" en début de phrase OU "Bref" OU "..." présent quelque part
- [ ] Vocabulaire signature présent (au moins 2-3 mots : raccourci, nuance, sens, doute, valeur, rigueur, stratégie, essentiel)

#### Anti-patterns IA absents ❌

- [ ] **Pas** de bullet points avec ✔️ / 🚀 / 💡
- [ ] **Pas** d'accroche "On ne va pas se mentir"
- [ ] **Pas** de "Voici 5 conseils pour..."
- [ ] **Pas** de phrases hachées staccato ("Et boom.", "Game changer.", "Mind blown.")
- [ ] **Pas** de gras tous les 3 mots
- [ ] **Pas** de "Frontguys" en gras systématique
- [ ] **Pas** de question rhétorique formatée fin de post ("Et vous, c'est quoi votre... ?")
- [ ] **Pas** de "Thread 🧵" / numérotation 1/ 2/ 3/

#### Cohérence Frontguys (si applicable)

- [ ] Si le post parle d'IA → trilogie Cadrée/Pertinente/Raisonnée respectée (pas d'évangélisation universelle)
- [ ] Si mention Frontguys → en passant ("chez Frontguys", "ceux qui comme Frontguys"), pas le sujet principal
- [ ] Hypothèses 🔵 traitées comme telles (jamais comme certitudes)

#### Format LinkedIn

- [ ] Longueur cohérente avec le format demandé (court / moyen / long)
- [ ] Hashtags 5-7 max, en fin, minuscules
- [ ] Pas de mention @ inventée — toujours demander à Maxime les vraies
- [ ] Pas de URL inventée

### Étape 6 — Livrer

Présenter le post avec :

* Angle retenu
* Conviction défendue
* Mention Frontguys : oui (en passant) / non
* Format / Longueur / Hashtags proposés

Proposer **1 à 2 variantes** si pertinent.

### Étape 7 — Stocker dans Knowtion (systématique)

**Pour chaque post produit, l'ajouter dans la page "Draft" Knowtion** : `https://knowtion.frontguys.fr/doc/draft-YjoFFhLDml`

* **Document ID** : `90ae39f6-151a-40a6-9629-b40dd7072faf`
* **Tool** : `update_document` avec `append: true`

**Format d'entrée à respecter** :

```markdown


---

## Post LinkedIn — <Thématique courte> (YYYY-MM-DD)

<Contenu intégral du post, sans notes ni variantes — uniquement le texte à publier>
```

**Règles** :

* Toujours en **append** (ne jamais écraser les drafts existants)
* **Uniquement le post** (pas les notes méthodologiques, pas les variantes)
* **Séparateur** `**---**` entre les drafts pour lisibilité
* **Titre** = "Post LinkedIn — <thématique> (<date du jour>)"

## Patterns d'ouverture canoniques

| Type d'accroche | Exemple |
|-----------------|---------|
| **Observation vécue** | "Hier soir, j'ai eu la chance de participer à la soirée Figma x GitHub à Paris." |
| **Terme qui dérange** | "Il y a un terme qui circule beaucoup en ce moment : product builder. Et à chaque fois que je le lis, quelque chose me dérange..." |
| **Tendance critiquée** | "On voit déjà passer les 'tendances design 2026'. Toujours les mêmes promesses, toujours les mêmes mots qui ne résolvent rien aux maux." |
| **Phénomène quantifié** | "30 fois par jour en ce moment sur LinkedIn..." |
| **Affirmation forte tempérée** | "Le futur du design d'interface sera un design system universel. J'ai l'impression que, paradoxalement..." |

## Patterns de clôture canoniques

| Type de clôture | Exemple |
|-----------------|---------|
| **Affirmation morale forte** | "Ce qu'il faut protéger, ce n'est pas notre capacité à fabriquer. C'est notre capacité à penser." |
| **Conviction sur l'essentiel** | "Pas des tendances. Des leviers d'impact." |
| **Ouverture humaine** | "Ravi d'avoir recroisé X, échangé avec Y." |
| **Annonce d'une suite** | "Mais ça, on y reviendra plus tard..." |
| **Bref de conclusion** | "Bref, une très bonne soirée." |

## Anti-patterns critiques

* ❌ Ton agence enthousiaste avec ✔️ et listes formatées
* ❌ "On ne va pas se mentir" en accroche
* ❌ Conclusion en question rhétorique générique
* ❌ Frontguys en gras à chaque mention
* ❌ Phrases courtes hachées simulant l'impact
* ❌ Hashtags décoratifs en cours de texte
* ❌ "Voici X conseils" / "X choses à savoir sur..."

## Voir aussi

* **Style Guide** (sous-page) — patterns détaillés
* **Examples Good** (sous-page) — 5 posts modèles
* **Examples Bad** (sous-page) — ce qu'il NE FAUT PAS faire
* **Topic Pipeline** (sous-page) — pipeline de sujets si Maxime cherche une idée
* **Brand > Identity > Positioning AI** — pour les posts qui parlent d'IA
* **write-copy** — alternative pour la voix agence Frontguys