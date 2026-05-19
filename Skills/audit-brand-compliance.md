# audit-brand-compliance

---

name: audit-brand-compliance description: Auditer un asset existant (texte, page, slide, post, visuel) contre la charte Frontguys complète triggers: \["audite", "vérifie", "check", "review", "est-ce que c'est OK", "respecte la charte"\] files_to_load_always:

* brand/voice/writing-rules
* brand/voice/vocabulary files_to_load_conditional:
* brand/voice/tone-of-voice (audit éditorial complet)
* brand/identity/personas/{persona} (si cible précisée)
* brand/identity/convictions (audit positionnement)
* brand/visual/tokens-usage-rules (audit visuel)
* brand/components/conventions (audit code) (Phase 2) last_synced: 2026-05-11


---

# Skill — audit-brand-compliance

## Quand utiliser

Pour auditer un asset déjà produit avant publication / livraison. Couvre :

* Audit éditorial (voix, vocabulaire, FALC)
* Audit identité (cohérence personas, convictions, positionnement)
* Audit visuel (tokens, typo, états)
* Audit composants (utilisation correcte des composants Astro)
* Audit a11y (WCAG 2.1 AA, hiérarchie titres)

**Ne PAS utiliser** pour produire — utiliser les skills de création.

## Étapes

### Étape 1 — Identifier la nature de l'asset

Type d'asset détermine la sévérité et la portée de l'audit :

| Type d'asset | Sévérité | Sections d'audit |
|--------------|----------|------------------|
| Texte court (titre, CTA, post) | Standard | Voix + persona   |
| Texte long (article, landing) | Élevée   | Voix + persona + conviction + cohérence positionnement |
| Slide isolée | Standard | Voix + persona + visuel (si maquette fournie) |
| Deck complet | Élevée   | Tout — + structure narrative |
| Page web (code) | Élevée   | Tout — + composants + a11y |
| Visuel seul (sans copy) | Standard | Visuel + a11y    |

### Étape 2 — Demander les contraintes (si pas claires)

* Persona cible visé ?
* Conviction(s) à ancrer ?
* Format final (web / slide / print / social) ?

### Étape 3 — Charger les sources d'audit

Toujours : **Writing Rules** + **Vocabulary** (le minimum pour tout audit textuel).

Selon le type :

* Audit voix complet → + **Tone of Voice**
* Audit identité → + persona ciblé + **Convictions**
* Audit positionnement → + **Positioning**
* Audit visuel → + **Tokens Usage Rules** + éventuellement **Typography Rules**, **Interaction States**
* Audit code → + **Components > Conventions** + fiches composants concernés *(Phase 2)*

### Étape 4 — Auditer par dimensions

Pour chaque dimension applicable, produire une **note** (✅ / 🟠 / 🔴) et des **constats précis avec citations**.

#### Dimension 1 — Voix (les 4 règles)

| Règle | Constat |
|-------|---------|
| 1. Nous actif sur les titres | ✅ / 🟠 / 🔴 + exemples |
| 2. Pragmatique avant abstrait | ...     |
| 3. Alternance Nous ↔ Vous | ...     |
| 4. Impératif de politesse (CTA) | ...     |

#### Dimension 2 — FALC

* Phrases ≤ 20 mots : ratio
* Anglicismes évitables détectés
* Termes à bannir détectés (cf **Vocabulary**)

#### Dimension 3 — Persona

* Vocabulaire cohérent avec le persona ciblé ?
* Pas de mélange de registres (Marc-Antoine vs Alexis vs Claire) ?

#### Dimension 4 — Identité

* Convictions ancrées (si format long) ?
* Hypothèses 🔵 (positionnement, sections IA) traitées comme hypothèses ?
* Frontguys orthographié correctement ?

#### Dimension 5 — Visuel (si maquette / code fourni)

* Valeurs en dur détectées (couleur hex, font-size px) ?
* Tokens Semantic utilisés (jamais Core directement) ?
* Modes light + dark prévus ?
* États d'interaction respectés (pattern −10) ?

#### Dimension 6 — Composants (si code Astro) *(Phase 2 — fiches composants à publier)*

* Composants `brand/components/` utilisés ?
* `<p>` / `<h2>` brut détecté (devrait être `<Text>`) ?
* `display: flex` ad-hoc détecté (devrait être `<Stack>`) ?
* `PageHeader` présent (1 H1 par page) ?
* `SkipLinks` présent en début de page ?

#### Dimension 7 — Accessibilité

* Hiérarchie titres h1 → h6 respectée (pas de saut) ?
* Alt texts présents sur images non décoratives ?
* Contrastes (si maquette fournie) ?
* `prefers-reduced-motion` respecté pour animations ?
* Liens externes avec `title` ?

### Étape 5 — Synthèse

Produire un rapport structuré :

```markdown
# Audit — <nom asset> — <date>

## Score global
✅ Conforme · 🟠 Améliorations recommandées · 🔴 Non conforme

## Dimensions auditées
[Tableau récapitulatif par dimension]

## Constats détaillés
[Par dimension : ce qui marche / ce qui pose problème + citations]

## Corrections recommandées (par priorité)
1. 🔴 [Critique — bloquant pour publication]
2. 🟠 [Recommandé — à corriger avant livraison]
3. 💡 [Suggestion — amélioration optionnelle]

## Asset corrigé (optionnel)
[Si l'utilisateur demande, produire la version corrigée]
```

### Étape 6 — Propositions

Pour chaque 🔴 et 🟠 :

* Citer le passage problématique
* Expliquer la règle non respectée
* Proposer une correction concrète (texte / token / composant alternatif)

### Étape 7 — Asset corrigé (sur demande)

Si l'utilisateur le demande, produire la **version corrigée complète**. Sinon, s'arrêter au rapport — l'utilisateur applique lui-même.

## Sortie attendue

* Un rapport d'audit structuré (Markdown)
* Note globale + notes par dimension
* Constats avec citations précises
* Corrections proposées (par priorité)
* Optionnel : asset corrigé complet

## Anti-patterns

* ❌ Audit binaire "ok / pas ok" sans citations précises
* ❌ Proposer des corrections sans expliquer la règle violée
* ❌ Critiquer un détail mineur sans pondération de gravité
* ❌ Inventer une règle non documentée dans **Brand**
* ❌ Auditer le visuel sans avoir vu la maquette / le code