# Voice

---

## domain: voice purpose: Voix éditoriale Frontguys — tonalité, règles d'écriture, vocabulaire, exemples source_of_truth: Knowtion (Refonte > Content System) last_synced: 2026-05-11

# Voix Frontguys

Cette section encode **comment Frontguys parle** : tonalité, règles d'écriture, vocabulaire et exemples avant/après.

## Source de vérité

**Knowtion** `**Refonte > Content System**` **est la source de vérité.** Les sous-pages ici sont une projection optimisée pour les LLM. En cas de divergence, Knowtion gagne.

Sources Knowtion utilisées :

* `0ace1b33-74a2-483d-9724-a2ee004092a0` — **Tone of Voice** (canon des 4 règles + calibrage tonal)
* `9000ac13-de5c-4b50-8de3-42ac1dfc943e` — **UX Writing — Page Approche** (exemples avant/après)
* `3512b607-1443-4970-955c-b16dde1aaa18` — UX Writing — Homepage (référence)
* `ab51c185-209a-4952-9ac2-85dc242b774f` — UX Writing — Page À propos (référence)
* `06b490bc-141f-4be4-b6bd-1a8fd33b8c62` — UX Writing — Page Expertises (référence)


:::info
**Note de cadrage** : le doc canonique "Tone of Voice" présente ses exemples dans un contexte historique d'accessibilité numérique. Seules les **règles transversales** (4 règles, FALC, alternance Nous/Vous, calibrage tonal) sont reprises ici. Les exemples sont rebâtis depuis les pages UX Writing Frontguys actuelles.

:::

## Sous-pages

* **Tone of Voice** — Trilogie Simple · Humble · Authentique + 3 calibrages
* **Writing Rules** — 4 règles canoniques + FALC + alternance Nous/Vous
* **Vocabulary** — Verbes CTA, bascules FALC, termes à bannir
* **Examples Gallery** — Avant/après tirés des pages UX Writing

## Règles d'usage pour LLM

### Quand charger quoi

| Tâche | Pages à charger |
|-------|-----------------|
| Tout asset Frontguys (texte) | **Tone of Voice** + **Writing Rules** |
| Rédaction de titres, CTA, sous-titres | + **Vocabulary** |
| Rédaction longue (article, landing) | + **Examples Gallery** |
| Audit/correction d'un texte existant | toutes les pages de cette section |


:::warning
**Ne jamais charger Examples Gallery pour une tâche courte** (CTA, titre seul). Économie de tokens prioritaire.

:::

### Hiérarchie des règles en cas de conflit


1. **Les 4 règles canoniques** (Writing Rules) priment sur tout
2. **L'alternance Nous/Vous** est non-négociable sur les titres ↔ sous-titres
3. **Le FALC** prime sur l'élégance stylistique : si un mot est plus simple, on le prend
4. **Le calibrage tonal** (Tone of Voice) ajuste l'intensité mais ne contredit jamais les 4 règles

### Ce qu'il ne faut jamais faire

* Utiliser la voix passive ou des phrases > 20 mots
* Mettre un infinitif sur un CTA (*Voir nos formations* ❌ → *Découvrez nos formations* ✅)
* Répéter "Nous" sur deux niveaux consécutifs (H1 + sous-titre)
* Utiliser un anglicisme quand un équivalent FALC existe
* S'auto-valoriser (*nos experts*, *notre excellence*) sans preuve concrète
* Inventer un quatrième pilier tonal au-delà de Simple · Humble · Authentique