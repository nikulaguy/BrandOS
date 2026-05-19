# Components

---

## domain: components purpose: Mirror documentaire des composants Astro/React Frontguys + règles d'usage pour LLM source_of_truth: Gitlab frontguys/accessibility-website last_synced: 2026-05-11 component_count: 33

# Composants Frontguys

Cette section documente les **33 composants** du site Frontguys (repo Gitlab `frontguys/accessibility-website`). Elle n'est **pas une duplication du code** — c'est un **index sémantique** que le LLM consulte pour savoir quel composant utiliser et comment.

## Source de vérité

**Le code Gitlab est canonique.** En cas de divergence, le repo gagne et cette section doit être re-synchronisée.

* **Repo** : `gitlab.com/frontguys/accessibility-website`
* **Chemin composants** : `src/components/`
* **Storybook public** : https://inspiring-gecko-d9ada2.netlify.app/
* **Page styleguide** : `/styleguide` (généré par `src/pages/styleguide.astro`)

## Sous-pages

* **Conventions** — patterns architecturaux (Astro/React/SCSS/a11y/naming)
* **Catalog** (sous-hub) — 26 fiches : 24 composants atomic + page-sections + utilities-flat

## Classification des 33 composants

### Atomic — par préfixe CSS BEM (24 composants)

| Préfixe | Couche | Composants |
|---------|--------|------------|
| `a-`    | **Atoms** | Avatar, Link |
| `m-`    | **Molecules** | Badge, BadgeList, Checkbox, Input, List, Select |
| `o-`    | **Organisms** | Accordion, Alert, Banner, Card, FormElement, MediaObject, ProfileBanner |
| `l-`    | **Layouts** | Footer, Header, Section, SectionHeader, SkipLinks |
| —       | **Utilities Astro** | Stack, Text |
| —       | **React polymorphique** | Button     |

### Flat — racine de `src/components/` (9 composants)

| Catégorie | Composants |
|-----------|------------|
| **Utilitaires** | Logo, LogoLink, MainHead, PageHeader, VisuallyHidden |
| **Sections page-specific** | BusinessCases, KeyFigures, ContactExpertBanner, CreateOpportunity |

## Règles d'usage pour LLM

### Quand charger quoi

| Tâche | Pages à charger |
|-------|-----------------|
| Comprendre les conventions | **Conventions** (1× par session) |
| Utiliser un composant atomic | **Catalog > {ComponentName}** uniquement |
| Composer une page | **Section** + **Stack** + **Text** + composants utilisés |
| Construire un formulaire | **FormElement** + **Input** + **Select** + **Checkbox** |
| Ajouter une section page-specific | **Catalog > Page Sections** |
| Insérer du contenu masqué a11y | **Catalog > Utilities Flat** (VisuallyHidden) |


:::warning
**Ne jamais charger toutes les fiches** pour une tâche ciblée. Économie de tokens prioritaire.

:::

### Hiérarchie d'usage


1. **Composer avec les composants existants** — jamais ré-implémenter ce qui existe
2. **Préférer Astro à React** — Button est l'unique cas React, justifié par le polymorphisme
3. **Wrapper Stack pour tout layout vertical/horizontal** — pas de flex/grid ad-hoc
4. **Wrapper Text pour tout texte** — pas de `<p>` / `<h2>` brut, sauf via variant Text
5. **Wrapper Section pour toute section de page** — gère le centrage, la largeur max, le bg

### Composants centraux à connaître absolument

* `**Text**` — TOUT texte du site passe par lui. 13 variants couvrant la typographie complète.
* `**Stack**` — TOUT espacement vertical/horizontal passe par lui. Gap échelle `1..20`.
* `**Section**` — TOUTE section de page passe par lui. Gère bg + max-width + centrage.
* `**Button**` — TOUS les CTAs. Polymorphique (`<button>` ou `<a>`). 3 variants.
* `**Card**` — TOUS les blocs de contenu listés (offres, cas clients, articles). 4 variants.

### Ce qu'il ne faut jamais faire

* Coder un `<p>` ou `<h2>` brut → utiliser `Text` avec le bon `variant`
* Coder un `display: flex` ad-hoc → utiliser `Stack`
* Coder un container max-width ad-hoc → utiliser `Section`
* Créer un nouveau composant qui duplique un existant (cf. Storybook avant)
* Mettre une couleur en dur → consommer `src/tokens/colors.json` via CSS variables
* Casser l'a11y — chaque composant respecte WCAG 2.1 AA et le repo l'exige

## Liens vers les règles transversales

* **Voix** dans les composants → **Brand > Voice**
* **Tokens** consommés → **Brand > Visual > Tokens Snapshot** + `src/tokens/*.json`
* **États d'interaction** (Button, Link) → **Brand > Visual > Interaction States**
* **Light/Dark** → **Brand > Visual > Modes Light Dark**
* **Conventions techniques** → **Conventions** (sous-page)