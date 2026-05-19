# Stack

---

## component: Stack layer: utility implementation: astro polymorphic: true files: \[Stack.astro, Stack.scss\] last_synced: 2026-05-11

# Stack

## Rôle

**Composant layout universel.** Gère l'espacement et l'alignement entre éléments enfants — vertical (par défaut) ou horizontal. À utiliser **à la place de tout** `**display: flex**` **ad-hoc**.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `HTMLTag` (polymorphique) | `"div"` | Balise HTML (ul, nav, section…) |
| `axis` | `"x" \| "y"` | `"y"`   | Direction de l'empilement |
| `gap` | `1..10, 12, 14, 15, 16, 18, 20` | `2`     | Espacement (échelle `--base-space-{n}`) |
| `align` | `"start" \| "center" \| "end" \| "baseline"` | `"start"` | Alignement transversal |
| `justify` | `"start" \| "center" \| "end" \| "space-between"` | —       | Alignement principal |
| `wrap` | `boolean` | `false` | Autoriser le wrap |
| `reversed` | `boolean` | `false` | Inverser l'ordre |

## Échelle de gap

L'échelle correspond aux variables CSS `--base-space-{1..20}` (à valeur définie dans `src/tokens/`).

## Exemples d'usage

```astro
<!-- Stack vertical par défaut (gap 2) -->
<Stack>
  <Text variant="heading-2">Titre</Text>
  <Text>Paragraphe.</Text>
</Stack>

<!-- Stack horizontal avec centrage vertical -->
<Stack axis="x" gap={3} align="center">
  <Icon name="info" />
  <Text>Message inline</Text>
</Stack>

<!-- Stack polymorphique en <ul> -->
<Stack as="ul" gap={2} class="u-list-reset">
  <li>...</li>
</Stack>
```

## Anti-patterns

* ❌ `<div style="display: flex; gap: 16px">` → utiliser Stack
* ❌ Coder un gap arbitraire (gap=11, gap=13…) → préférer une valeur de l'échelle
* ❌ Wrapper Stack autour d'un seul enfant — inutile

## Voir aussi

* **Conventions** — pourquoi Stack est obligatoire
* Source : `references/accessibility-website/src/components/Stack/Stack.astro`