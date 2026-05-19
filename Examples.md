# Examples

# Examples — Few-shots Frontguys

> **Hub Examples.** Collection de **few-shots concrets** pour calibrer la production des LLM. Chaque exemple montre un asset Frontguys réussi avec le décodage des choix : voix, persona, conviction ancrée, anti-patterns évités.

## Quand charger un exemple

| Skill | Examples utiles à charger |
|-------|---------------------------|
| `write-copy` | **Good vs Bad Copy** (calibrage voix par règle) + **Hero Section Marc-Antoine** (pattern hero) |
| `audit-brand-compliance` | **Audit Report Example** (format de sortie attendu) |
| `create-slide-deck` | **Slide Pitch Comex** (slide unique réussie) |
| `create-landing-page` | **Hero Section Marc-Antoine** + **Slide Pitch Comex** (vocabulaire Marc-Antoine) |


:::warning
**Charger uniquement les exemples pertinents** pour la tâche en cours. Économie de tokens prioritaire. Ne jamais charger les 4 exemples en bloc.

:::

## Les 4 exemples publiés

### Audit Report Example

* **Type** : few-shot rapport d'audit
* **Asset audité** : post LinkedIn d'un consultant Frontguys
* **À mobiliser pour** : `audit-brand-compliance` — montre le format de sortie attendu (notes ✅/🟠/🔴 par dimension, citations, corrections par priorité, version corrigée proposée)

### Good vs Bad Copy

* **Type** : calibrage voix par règle
* **Contenu** : pour chaque règle (1 à 4), exemples ❌ Bad vs ✅ Good avec explication
* **À mobiliser pour** : `write-copy` (calibrage), `audit-brand-compliance` (référentiel)

### Hero Section Marc-Antoine

* **Type** : pattern hero web — landing formation
* **Persona** : Marc-Antoine (DSI / décideur business)
* **À mobiliser pour** : `create-web-section`, `create-landing-page` quand la cible est Marc-Antoine

### Slide Pitch Comex

* **Type** : slide unique de positionnement
* **Persona** : Marc-Antoine
* **À mobiliser pour** : `create-slide-deck` pour les pitches comex / décideurs

## Pourquoi des few-shots

Les LLM produisent mieux quand ils ont un exemple concret du résultat attendu. Les exemples Frontguys :


1. **Montrent l'application combinée des règles** (4 règles voix + FALC + vocabulaire persona + tokens + composants)
2. **Démontrent les arbitrages** (vocabulaire, alternance, choix de composants)
3. **Servent de référence visuelle** pour la structure attendue (audit, hero, slide)

## Ce qu'un example doit toujours contenir

* **Contexte** : pour quel persona, quel asset, quel objectif
* **Sources mobilisées** : quelles pages Brand ont été chargées
* **Asset produit** (intégral)
* **Décodage** : pour chaque règle, application concrète
* **Vocabulaire** mobilisé / évité (par persona)
* **Conviction ancrée** (si format long)
* **Anti-patterns évités** (ce qu'on ne voit pas dans l'asset, et pourquoi)