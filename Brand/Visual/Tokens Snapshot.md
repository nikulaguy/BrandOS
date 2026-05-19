# Tokens Snapshot

---

## type: tokens-snapshot purpose: Source opérationnelle quotidienne pour LLM — valeurs résolues des tokens DS Frontguys last_synced: 2026-05-11 next_sync_due: 2026-08-11 sync_status: deferred-to-gitlab-json operator: pipeline TokensBrücke + Terrazzo (côté repo Frontguys) canonical_sources: figma_colors: sudoHypKpnMktYVplKcTt2 figma_typography_web: DARJub5ezZ8Kr4hr24KGYm figma_typography_slides: zxUFGOje9V4PRX6SsPec6O gitlab_json_sources: colors: src/tokens/colors.json (DTCG format, sortie TokensBrücke) text_styles: src/tokens/text-styles.json primer_reference: src/tokens/github-primer-tokens.json

# Tokens snapshot — Frontguys

🟢 **Architecture révisée le 2026-05-11.** Frontguys dispose déjà d'un pipeline `Figma → TokensBrücke → src/tokens/*.json → Terrazzo → CSS` côté repo Gitlab. Ce snapshot **ne duplique pas** ces JSON — il **les référence** et encode les règles d'usage par-dessus.

## Rôle de ce fichier

Ce snapshot est la **carte des sources de valeurs** pour les LLM. Quand un asset Frontguys est produit, le LLM lit :


1. **D'abord** : les JSON `src/tokens/*.json` du repo Frontguys (source opérationnelle, déjà synchronisée par TokensBrücke)
2. **Ensuite** : ce fichier `tokens-snapshot` pour comprendre la sémantique et les règles d'usage des tokens
3. **En exception** : Figma MCP si un token n'est pas encore dans les JSON (rare)

**Chaîne de fraîcheur** :

```
Figma (canon)
   ↓ TokensBrücke (plugin Figma, manuel)
src/tokens/*.json (Gitlab, format DTCG)
   ↓ Terrazzo CLI (pnpm build-tokens)
CSS variables (build)
```

**Source canonique** : Figma. **Source opérationnelle Frontguys** : `src/tokens/*.json`. **Source opérationnelle Brand OS** : ce snapshot pour la sémantique.

## Sources de valeurs — où le LLM va chercher

### Couleurs

> **Source opérationnelle** : `src/tokens/colors.json` dans le repo `frontguys/accessibility-website` (1467 lignes, format DTCG)
>
> Le fichier est synchronisé depuis Figma `sudoHypKpnMktYVplKcTt2` via le plugin **TokensBrücke** (manuellement par l'équipe DS). C'est la sortie machine-friendly des tokens Figma.

**Lecture pour LLM** :

* Ouvrir `src/tokens/colors.json` (ou depuis Gitlab raw)
* Naviguer la structure DTCG : `{group}.{subgroup}.{name}.$value`
* Récupérer la valeur `$value` (couleur en hex/rgb, parfois référence `{...}` vers un autre token)

**Architecture sémantique attendue** (voir **Tokens Architecture** pour les règles) :

* `background.*` — fond de page, surface, card
* `foreground.*` — text, icon, sur fond clair/sombre
* `border.*` — bordures
* `accent.*` — highlight ponctuel
* Couleurs Core (Watery Green, Crayola Yellow 🟡, Rythm Grey, etc.) — pour référence uniquement

### Typographie — Web

> **Source opérationnelle** : `src/tokens/text-styles.json` (271 lignes)
>
> Synchronisé depuis Figma `DARJub5ezZ8Kr4hr24KGYm` (Design System — Typography Web).

**Lecture pour LLM** : ouvrir le JSON, récupérer les styles par rôle.

**Rôles canoniques observés dans le repo** (composant `Text.astro`, variants) :

* `heading-1` à `heading-6` (6 styles de titres)
* `subtitle`, `surtitle`
* `body-1`, `body-2` (2 styles body)
* `caption-1`, `caption-2` (2 styles caption)
* `code` (style code monospace)

> Le nommage canonique du repo (`heading-N`) **prend précédence** sur la nomenclature Heading/Title en cours d'harmonisation côté Figma. Pour les règles par rôle sémantique, voir **Typography Rules**.

### Typographie — Slides (Figma Slides)

> **Source canonique** : Figma fileKey `zxUFGOje9V4PRX6SsPec6O` (Foundation — Figma Slide Text Styles)
>
> **Pas encore exporté en JSON** côté Frontguys. Pour produire une slide Figma, requêter Figma MCP directement sur ce fileKey (ou demander à l'équipe DS d'exporter via TokensBrücke).

### Spacing

> **Source opérationnelle** : variables CSS générées par Terrazzo depuis `src/tokens/`
>
> Échelle observée dans le composant `Stack.astro` : valeurs gap `1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 18, 20` → CSS variables `--base-space-{n}`.

### Largeur max de contenu

* `--content-max-width` — `1200px` (décision 21-10-2025)
* `--content-prose-max-width` — utilisée par `Section` quand `condensed=true` (largeur prose)

### Composants — tokens spécifiques

* **Variants Card** : `photo`, `simple`, `freeform`, `illustration`
* **Variants Button (React)** : `primary`, `secondary`, `ghost` + flags `isFullWidth`, `isSquared`, `size: "small"`
* **Variants Alert** : `success`, `error`
* **Variants Banner** : `alert`, `info`, `success`
* **Variants Link** : `inline`, `standalone`, `back`
* **Variants Section.color** : `semantic-background-default`, `semantic-background-default-alt`, `semantic-background-subtle`

Détails complets : voir **Brand > Components > Catalog > {ComponentName}** *(Phase 2)*.