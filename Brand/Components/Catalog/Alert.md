# Alert

---

## component: Alert layer: organism implementation: astro files: \[Alert.astro, Alert.scss\] a11y_critical: true last_synced: 2026-05-11

# Alert

## Rôle

Message d'état important — succès ou erreur. Affiche icône + texte + description optionnelle.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `variant` | `"success" \| "error"` | `"success"` | Type d'alerte (obligatoire dans Props) |
| `text` | `string` | —       | Texte principal (obligatoire) |
| `description` | `string` | `""`    | Description complémentaire |
| `aria-label` | `string` | —       | Override du label SR-only |
| `class` | `string` | —       | Classes additionnelles |

## a11y

* **Role automatique** : `status` pour `success`, `alert` pour `error` — annoncé par les lecteurs d'écran
* **Label SR-only** auto-généré : "Message de succès :" ou "Message d'erreur :" (ou `aria-label` custom)
* **ID unique** via `crypto.randomUUID()` pour `aria-labelledby`
* **Icône + texte + role** → triple redondance (jamais couleur seule, cf `Conventions`)

## Tokens

Couleurs définies par variant (success vert / error rouge) — voir `src/tokens/colors.json`.

## Exemple

```astro
<Alert variant="success" text="Formation réservée" description="Vous recevrez un email de confirmation." />
<Alert variant="error" text="Erreur de paiement" description="Réessayez ou contactez-nous." />
```

## Voir aussi

* **Banner** — équivalent pour bannière full-width persistante
* Source : `references/accessibility-website/src/components/Alert/Alert.astro`