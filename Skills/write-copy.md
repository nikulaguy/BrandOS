# write-copy

---

name: write-copy description: Produire un texte (titre, body, CTA, post, paragraphe) qui respecte intégralement la voix Frontguys triggers: \["écris un titre", "rédige un CTA", "fais-moi un post", "écris-moi", "rédige", "génère le hero", "génère le copy"\] files_to_load_always:

* brand/voice/writing-rules
* brand/voice/tone-of-voice
* brand/voice/vocabulary files_to_load_conditional:
* brand/identity/personas/{persona} (selon cible)
* brand/identity/convictions (pour copy long ou positionnement)
* brand/identity/positioning (pour landing ou pitch)
* brand/voice/examples-gallery (pour copy long ou si besoin de calibrer) last_synced: 2026-05-11


---

# Skill — write-copy

## Quand utiliser

Toute demande de production textuelle Frontguys :

* Titre, sous-titre, CTA
* Hero d'une page
* Section body
* Post LinkedIn
* Email commercial
* Texte de slide
* Description courte

**Ne PAS utiliser** pour : audit (→ `audit-brand-compliance`), construction d'une page complète (→ `create-landing-page`), construction d'un deck (→ `create-slide-deck`).

## Étapes

### Étape 1 — Comprendre la cible

Si non précisé, **demander à l'utilisateur** (1 question) :

* **Persona dominant** : Claire (Head of P&D) · Marc-Antoine (DSI) · Alexis (CTO) ?
* **Format** : titre seul · paragraphe court · post long · slide ?
* **Emplacement** : hero · body · CTA · footer ?

### Étape 2 — Charger les sources

Toujours :

* **Brand > Voice > Writing Rules** (4 règles canoniques)
* **Brand > Voice > Tone of Voice** (Simple / Humble / Authentique + calibrage)
* **Brand > Voice > Vocabulary** (verbes CTA, bascules FALC, termes à bannir)

Selon le contexte :

* **Persona identifié** → charger la fiche du persona (juste celle-là)
* **Copy long** ou positionnement → charger **Convictions**
* **Landing / pitch** → charger **Positioning**
* **Si besoin de calibrer** → charger **Examples Gallery**

### Étape 3 — Retro-spec

Présenter à l'utilisateur :

* Persona ciblé
* Calibrage tonal retenu (Professionnel / Empathique / Pédagogique)
* Approche structurelle (ex: H1 Nous actif + sous-titre Vous + CTA impératif)
* Conviction ancrée si le format le permet (1 par asset long)

**Demander validation** avant de produire.

### Étape 4 — Produire

Respecter dans cet ordre de priorité :


1. **Règle 1** — Affirmation du "Nous" actif (jamais passif sur les titres)
2. **Règle 2** — Pragmatique avant abstrait (verbes concrets, livrables nommés)
3. **Règle 3** — Alternance rythmique Nous (titre) ↔ Vous (sous-titre)
4. **Règle 4** — Impératif de politesse sur les CTA (jamais d'infinitif)
5. **FALC** — Max 20 mots/phrase, max 3 phrases/paragraphe, vocabulaire courant
6. **Persona** — Vocabulaire signature du persona ciblé
7. **Conviction** — Si format long, ancrer explicitement au moins une conviction

### Étape 5 — Auto-audit avant livraison

Vérifier sur le texte produit :

- [ ] Toutes les phrases ≤ 20 mots ?
- [ ] Voix active sur tous les titres ?
- [ ] Alternance Nous / Vous respectée ?
- [ ] CTA conjugués à l'impératif ? (Découvrez · Profitez · Sécurisez · Contactez-nous · Téléchargez · Planifiez · Échangez · Demandez · Visualisez · Initiez-vous)
- [ ] Aucun anglicisme avec équivalent FALC évident (vélocité → rapidité, etc.) ?
- [ ] Aucune auto-valorisation gratuite (*nos experts*, *notre excellence*) ?
- [ ] Vocabulaire cohérent avec le persona (pas de jargon design pour Marc-Antoine, pas de jargon ROI pour Alexis) ?
- [ ] Hypothèses 🔵 non formulées comme certitudes commerciales ?
- [ ] Frontguys orthographié correctement (jamais "FrontGuys" ni "Front Guys") ?

Si une case échoue → corriger avant livraison.

### Étape 6 — Livrer

Présenter le texte. Mentionner :

* Persona ciblé (pour transparence)
* Conviction ancrée si applicable
* Variations alternatives si pertinent (max 2)

## Patterns canoniques à mobiliser

### Titre + sous-titre (hero)

```
H1 :  "Nous {verbe} votre {objet client}."
Sub : "{Impératif Vous}. {Bénéfice concret}."
CTA : "{Découvrez/Demandez/Planifiez} {complément}"
```

### Différenciation humble

```
Titre :   "Voyez ce qui nous distingue. Concrètement."
Items :   "Pas X. {Affirmation positive}."
```

### CTA final avec humilité

```
Titre : "Parlons de vos enjeux."
Body  : "{Impératif Vous}. Sans engagement."
CTA   : "Parlez de votre projet"
```

## Anti-patterns

* ❌ Coller à un mauvais vocabulaire persona (ex: parler "tokens" à Marc-Antoine)
* ❌ Inventer un chiffre, un cas client, une promesse
* ❌ Faire un copy long sans ancrer une conviction
* ❌ Mettre 2 CTAs primary dans la même section
* ❌ Reformuler la vision ou la mission Frontguys — citables telles quelles uniquement
* ❌ Hypothèse 🔵 transformée en certitude ("Nos clients pensent que…")

## Sortie attendue

* Le texte produit, formaté pour son contexte (markdown si page, structure listée si slide)
* Mention du persona ciblé
* Mention de la conviction ancrée (si applicable)
* 0 à 2 variations alternatives sur demande