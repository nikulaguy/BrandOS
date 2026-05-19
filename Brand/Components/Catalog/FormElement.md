# FormElement

---

## component: FormElement layer: organism implementation: astro files: \[FormElement.astro, FormElement.scss\] a11y_critical: true last_synced: 2026-05-11

# FormElement

## Rôle

**Wrapper a11y complet pour un champ de formulaire.** Associe label, hint, erreur, et le contrôle (Input/Select/Checkbox/Textarea). À utiliser **systématiquement** pour tout champ de formulaire — jamais d'`<input>` brut.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `name` | `string` | —       | Nom du champ (obligatoire) — kebabifié pour l'id |
| `labelText` | `string` | —       | Label visible (obligatoire) |
| `isOptional` | `boolean` | `false` | Ajoute mention "optionnel" si true |
| `element` | `"input" \| "textarea" \| "select" \| "search"` | `"input"` | Type de contrôle |
| `inputType` | `"text" \| "number" \| "tel" \| "email" \| "password" \| "radio" \| "checkbox" \| "search"` | `"text"` | Type d'input |
| `hint` | `string` | —       | Aide contextuelle (lie via `aria-describedby`) |
| `error` | `string \| null` | —       | Message d'erreur (lie via `aria-describedby`) |
| `defaultValue` | `number \| string \| string[]` | —       | Valeur par défaut |
| `icon` | `string` | —       | Nom d'icône (préfixe visuel) |
| `inputFileLabelText`, `inputFileIcon`, `inputFileAccept` | —    | —       | Spécifique input type file |
| `options` | `string[]` | —       | Pour `element="select"` |
| `link` | `{ href, label, newWindow? }` | —       | Lien complémentaire (mot de passe oublié, etc.) |
| + attrs natifs | `InputHTMLAttributes` | —       | placeholder, value, required, etc. |

## a11y — comportements built-in

* **IDs liés** : `hintId = hint-{name}`, `errorId = error-{name}`
* **aria-describedby** auto-construit à partir de `errorId` + `hintId`
* **Label inline** pour radio/checkbox (`labelIsInline`)
* **Mention "optionnel"** explicite (cf `isOptional`)
* **Validation erreur** : classe `o-form-element--error` si `error` présent

## Composants utilisés

* `Input`, `Select`, `Checkbox` (selon `element`/`inputType`)
* `Stack`, `Text`, `Link`, `VisuallyHidden`
* `Icon` (via `astro-icon`)

## Exemple

```astro
<FormElement
  name="email"
  labelText="Email professionnel"
  element="input"
  inputType="email"
  hint="Nous utilisons votre email uniquement pour vous contacter."
  required
/>

<FormElement
  name="profil"
  labelText="Votre profil"
  element="select"
  options={["Designer", "Développeur", "Manager"]}
/>

<FormElement
  name="rgpd"
  labelText="J'accepte la politique de confidentialité"
  inputType="checkbox"
  link={{ href: "/mentions-legales", label: "Lire la politique" }}
/>
```

## Anti-patterns

* ❌ Coder un `<input>` ou `<select>` brut sans `FormElement`
* ❌ Omettre `hint` quand le champ n'est pas évident
* ❌ Mettre l'erreur en couleur seule (le composant gère le pattern triple : icon + texte + role)

## Voir aussi

* **Input**, **Select**, **Checkbox** — contrôles bas niveau
* Source : `references/accessibility-website/src/components/FormElement/FormElement.astro`