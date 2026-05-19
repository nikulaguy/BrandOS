# Page Sections

---

## type: components-catalog group: page-sections last_synced: 2026-05-11 source: gitlab/frontguys/accessibility-website/src/components/\*.astro (racine) status: page-specific

# Sections page-specific

Quatre composants sont des **sections concrètes** spécifiques à des pages données. À la différence des atomic, ce ne sont **pas des blocs réutilisables** — ils embarquent du contenu Frontguys propre à un emplacement.


:::warning
🟡 Ces composants risquent d'évoluer fortement (contenu marketing). Les utiliser tels quels, **ne pas les réécrire** dans un autre asset.

:::

## BusinessCases

**Rôle** : section "cas clients" sur la page d'accueil ou expertise. Liste les cas clients phares de Frontguys avec teasers.

**Usage attendu** : 1 occurrence par page, typiquement homepage ou page Expertises.

**Compose** : très probablement `Section` + `SectionHeader` + grille de `Card variant="photo"` ou similaire (à vérifier dans le source).


---

## KeyFigures

**Rôle** : bloc "chiffres clés Frontguys" (X cas clients, Y formations dispensées, etc.) — typiquement avec animation au scroll.

**Usage attendu** : 1 occurrence sur la homepage et/ou la page À propos.


---

## ContactExpertBanner

**Rôle** : bannière CTA "Échangez avec un expert" / "Demandez un diagnostic gratuit". Placée typiquement en pied de plusieurs pages comme rappel commercial.

**Usage attendu** : 1 occurrence par page concernée. Reuse cross-pages OK.


---

## CreateOpportunity

**Rôle** : section qui invite à créer une opportunité commerciale (typiquement avant le CTA contact final). Variation de `ContactExpertBanner` ou contenu connexe.

**Usage attendu** : variable selon la page.


---

## Règles d'usage globales

* ❌ **Ne pas créer un nouveau composant qui duplique** une de ces sections
* ❌ **Ne pas inliner** leur contenu — utiliser le composant
* ✅ Si une page a besoin d'une section similaire mais différente, **demander à l'équipe** plutôt que d'en créer une variante

## Pourquoi ces composants sont à la racine de `src/components/`

Convention observée : les composants en sous-dossier sont des **building blocks réutilisables** (atomic design). Les composants à la racine sans SCSS dédié sont :

* soit utilitaires (Logo, VisuallyHidden, MainHead, PageHeader, LogoLink — voir **Utilities Flat**)
* soit des **sections-instances** page-specific (cette page)

Cette distinction informe le LLM : pour un asset générique, **utiliser les atomic** ; pour un emplacement Frontguys connu, **réutiliser le composant page-specific**.

## Voir aussi

* **Section** + **SectionHeader** — pour bâtir une nouvelle section générique
* **Card** — pour les listes type "cas clients"
* Sources : `references/accessibility-website/src/components/{BusinessCases, KeyFigures, ContactExpertBanner, CreateOpportunity}.astro`