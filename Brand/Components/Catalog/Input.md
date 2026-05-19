# Input

---

## component: Input layer: molecule implementation: astro files: \[Input.astro, Input.scss\] last_synced: 2026-05-11

# Input

## Rôle

Champ texte. Wrapper minimal autour d'un slot — pour insertion d'un `<input>` natif via le slot. Décoré optionnellement par une icône.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `icon` | `string` | —       | Nom d'icône (préfixe visuel) |

## Rendu

```html
<div class="m-input">
  {icon && <Icon name={icon} />}
  <slot />
</div>
```

## Usage recommandé

**Ne jamais utiliser Input seul.** Toujours via `FormElement` qui gère label, hint, error, et association ARIA.

## Décision 27-11-2025

État **hover supprimé** sur Input et Textarea (cohérence). Seuls `default`, `focus`, `disabled`, `error` restent.

## Voir aussi

* **FormElement** — wrapper a11y complet
* **Select**, **Checkbox** — autres contrôles
* Source : `references/accessibility-website/src/components/Input/Input.astro`