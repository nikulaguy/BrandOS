# Accordion

---

## component: Accordion layer: organism implementation: astro files: \[Accordion.astro, Accordion.scss\] last_synced: 2026-05-11

# Accordion

## Rôle

Liste d'éléments dépliables (FAQ, contenu progressif). Chaque section a un titre et un contenu.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `sections` | `AccordionEl[]` | —       | Tableau `{ title, content }` (obligatoire) |
| `name` | `string` | —       | Nom du groupe (radio comportement si plusieurs) |
| `class` | `string` | —       | Classes additionnelles |

`AccordionEl` = `{ title: string | null | undefined; content: string | null | undefined }`

## Comportement

* **Validation** : si une section a `content === ""`, le composant **throw** (`Accordion element with the title "..." doesn't have any content`)
* Compose `Stack` + `Text` + icône via `astro-icon`

## a11y

* Pattern HTML natif `<details>`/`<summary>` ou ARIA disclosure (vérifier le rendu source)

## Exemple

```astro
<Accordion sections={[
  { title: "Quelle est la durée de la formation ?", content: "5 jours en présentiel." },
  { title: "Est-ce éligible CPF ?", content: "Oui, Qualiopi." }
]} />
```

## Voir aussi

* Source : `references/accessibility-website/src/components/Accordion/Accordion.astro`