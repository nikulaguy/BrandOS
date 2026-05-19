# Select

---

## component: Select layer: molecule implementation: astro files: \[Select.astro, Select.scss\] last_synced: 2026-05-11

# Select

## Rôle

Champ sélection (dropdown). Wrapper autour du `<select>` natif avec décoration icône.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `options` | `string[]` | —       | Liste des options affichées (obligatoire) |
| `name` | `string` | —       | Nom du champ (obligatoire — kebabifié pour l'id) |
| `placeholder` | `string \| null` | `"Sélectionnez une option"` | Texte placeholder |
| `defaultValue` | `number` | —       | Index de l'option pré-sélectionnée |
| + attrs natifs | `SelectHTMLAttributes` | —       | required, disabled, aria-\*, etc. |

## Rendu

* Tag racine `<div class="m-select">` + icône + `<select>` natif
* Id généré : `kebabify(name)` (ex: `name="email-pro"` → `id="email-pro"`)

## Usage recommandé

**Ne jamais utiliser Select seul.** Toujours via `FormElement` qui gère label, hint, error, et association ARIA.

## a11y

* Élément `<select>` natif → comportement clavier + SR built-in
* Placeholder rendu comme option désactivée typiquement

## Voir aussi

* **FormElement** — wrapper a11y complet
* **Input**, **Checkbox** — autres contrôles
* Source : `references/accessibility-website/src/components/Select/Select.astro`