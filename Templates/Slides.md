# Slides

---

## type: slides-templates-index purpose: Catalogue des templates de slides Frontguys observés et utilisés en production last_synced: 2026-05-12 source: RAO BPI DD 2026 (référence canonique, 158 slides)

# Templates de slides Frontguys

Cette section catalogue les **12 templates de slides récurrents** utilisés dans les decks Frontguys. Chaque template est documenté avec sa structure, ses règles d'usage, ses anti-patterns.

## Source canonique

**RAO BPI DD 2026** (réponse à appel d'offre Bpifrance, 158 slides, 1920×1080) est la **référence d'usage la plus complète** des templates Frontguys à ce jour. Les visuels de référence proviennent de ce deck (conservés dans le repo local).

## Inventaire des 12 templates

| #   | Template | Quand l'utiliser |
|-----|----------|------------------|
| **T01** | Cover    | Couverture de deck (slide 1) |
| **T02** | Summary  | Sommaire numéroté (slide 2 typiquement) |
| **T03** | Section divider | Slide de transition entre grandes sections |
| **T04** | Text paragraph | Synthèse, intro, paragraphes denses |
| **T05** | Three columns | Trilogies, valeurs, calibrages tonals |
| **T06** | Four columns | Axes, étapes, dimensions |
| **T07** | Six pillars | Principes fondateurs, modèle global |
| **T08** | KPI table | SLA, engagements de qualité, tableaux de critères |
| **T09** | Case study | Cas client, REX, démonstration IA |
| **T10** | Process flow | Étapes temporelles, parcours, frise |
| **T11** | Key figures | Chiffres clés, métriques d'agence |
| **T12** | Expertise card | Offre, expertise, valeur ajoutée |

## Sous-pages

* **Deck Structure** — structure narrative type d'un deck Frontguys
* **T01 Cover** → **T12 Expertise Card** — 12 fiches templates

## Règles d'usage pour LLM

### Quand charger quoi

| Tâche | Pages à charger |
|-------|-----------------|
| Construire un deck complet | **Deck Structure** + templates utilisés |
| Slide unique d'un type donné | Uniquement le **T0X-{nom}** correspondant |
| Auditer un deck existant | **Deck Structure** + tous les templates concernés |


:::warning
**Ne jamais charger les 12 templates en bloc.** Économie de tokens prioritaire.

:::

### Hiérarchie de décision


1. **Choisir le template** selon le type de contenu
2. **Charger la fiche correspondante**
3. **Adapter le contenu** au persona ciblé (cf **Brand > Identity > Personas**)
4. **Vérifier la voix** (cf **Brand > Voice > Writing Rules**)
5. **Auto-audit** avant livraison

### Règles transversales à tous les templates

* **1 H1 par slide maximum** (titre principal)
* **Phrases ≤ 20 mots** (FALC)
* **1 CTA primary par slide maximum**
* **Tokens visuels uniquement** (couleurs et typo via tokens Frontguys, jamais en dur)
* **Voix Frontguys respectée** sur titres, sous-titres et corps (4 règles canoniques)
* **Format paysage 1920×1080** (Figma Slides natif)

## Anti-patterns globaux

* ❌ Mélanger 2 templates différents sur une seule slide
* ❌ Templates customs non documentés ici sans validation
* ❌ Plus de 5-6 items denses par slide
* ❌ Slide finale "Merci" sans CTA
* ❌ Couleurs hex ou tailles px en dur

## Lien avec les skills

* **Skills > create-slide-deck** route directement vers ces templates selon le type de slide demandé
* **Skills > Figma > figma-generate-design** peut être utilisé pour générer ces templates dans Figma Slides