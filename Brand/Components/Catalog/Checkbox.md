# Checkbox

---

## component: Checkbox layer: molecule implementation: astro files: \[Checkbox.astro, Checkbox.scss\] last_synced: 2026-05-11

# Checkbox

## Rôle

Case à cocher stylisée. Composant volontairement minimal — accepte tous les attributs natifs `<input type="checkbox">` via spread.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `...attrs` | `HTMLInputAttributes` | —       | Tous les attributs natifs (name, value, checked, required, aria-\*, etc.) |

## Rendu

```html
<input type="checkbox" class="m-checkbox" {...attrs} />
```

## a11y

* Élément `<input type="checkbox">` natif → comportement clavier et SR built-in
* Décision 27-11-2025 : **état hover supprimé** (cohérence avec Input/Textarea)
* Toujours associer un `<label>` (typiquement via `FormElement`)

## Usage recommandé

**Ne jamais utiliser Checkbox seul.** Toujours via `FormElement` qui gère label, hint, error, association ARIA.

## Voir aussi

* **FormElement** — wrapper a11y complet
* **Input**, **Select** — autres contrôles de formulaire
* Source : `references/accessibility-website/src/components/Checkbox/Checkbox.astro`