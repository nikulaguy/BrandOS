# Visual

---

## domain: visual purpose: Source de vérité sur le visuel Frontguys (tokens, typographie, modes light/dark, responsive, illustrations) source_of_truth: Figma + repo Gitlab Frontguys (src/tokens/\*.json) last_synced: 2026-05-11

# Visual Frontguys

Cette section encode **comment Frontguys se voit** : tokens, typographie, modes, responsive, illustrations.

## Source de vérité

**Figma est la source de vérité visuelle.** Les valeurs réelles vivent dans `src/tokens/*.json` du repo Gitlab Frontguys, synchronisés depuis Figma via TokensBrücke. Ce hub encode les **règles d'usage**, pas les valeurs.

## Sous-pages

* **Tokens Architecture** — structure 3 couches (Primitives → Semantic → Component)
* **Tokens Usage Rules** — règles d'usage des tokens (zéro valeur en dur)
* **Tokens Snapshot** — photographie des tokens à date pour orientation rapide
* **Typography Rules** — hiérarchie typographique, choix de polices, règles d'usage
* **Responsive Rules** — breakpoints, fluid sizing, comportements responsive
* **Modes Light Dark** — règles d'usage des modes clair / sombre
* **Interaction States** — états hover, focus, active, disabled (a11y)
* **Illustrations Index** — catalogue des illustrations Frontguys, usages
* **Figma MCP Cheatsheet** — référence rapide pour les workflows Figma MCP

## Règle d'or absolue


:::warning
**Zéro valeur en dur.** Toute couleur, font-size, spacing, radius, etc. doit être référencé par son token. Jamais de hex code, jamais de px brut. C'est la règle la plus structurante de tout le Brand OS.

:::

## Quand charger quoi

| Tâche | Pages à charger |
|-------|-----------------|
| Asset visuel simple (slide, mock) | **Tokens Snapshot** + **Tokens Usage Rules** |
| Asset typographique (titre, body) | + **Typography Rules** |
| Asset web / landing | + **Responsive Rules** |
| Asset avec dark mode | + **Modes Light Dark** |
| Asset avec illustrations | + **Illustrations Index** |
| Production Figma | + **Figma MCP Cheatsheet** + `frontguys-bindings-protocol` |
| Comprendre l'architecture | **Tokens Architecture** (éducatif, pas pour production) |