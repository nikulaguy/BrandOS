# List

---

## component: List layer: molecule implementation: astro files: \[List.astro, List.scss\] last_synced: 2026-05-11

# List

## Rôle

Liste sémantique stylisée — supporte une liste simple de strings, ou une liste de `{ title, content }`.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `items` | `Array<string> \| Array<{ title, content }>` | —       | Items (obligatoire) |
| `title` | `string` | —       | Titre du groupe |
| `titleTag` | `"p" \| "h3" \| "h4" \| "h5" \| "h6"` | `"p"`   | Tag du titre |
| `class` | `string` | —       | Classes additionnelles |
| + attrs natifs | `HTMLAttributes<"ul">` | —       | aria-\*, role, etc. |

## Rendu

* Tag racine : `<ul>` (par défaut) avec Stack interne
* Si chaque item est `{title, content}` → rendu deux niveaux (titre + description)
* Si chaque item est `string` → rendu simple `<li>`

## a11y

* `<ul>` sémantique
* Titre optionnel posé en tête avec `titleTag` choisi (cohérence hiérarchique)

## Exemple

```astro
<List title="Ce que vous apprendrez" titleTag="h3" items={[
  "Décrypter le RGAA 4.1",
  "Mesurer la conformité",
  "Générer vos livrables"
]} />

<List items={[
  { title: "Modules", content: "10 sessions de 2h" },
  { title: "Format", content: "Présentiel ou distanciel" }
]} />
```

## Voir aussi

* **Stack** — pour listes purement visuelles sans sémantique liste
* Source : `references/accessibility-website/src/components/List/List.astro`