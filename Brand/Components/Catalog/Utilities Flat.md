# Utilities Flat

---

## type: components-catalog group: utilities-flat last_synced: 2026-05-11 source: gitlab/frontguys/accessibility-website/src/components/\*.astro (racine)

# Composants utilitaires (flat, racine de `src/components/`)

Cinq composants utilitaires qui vivent à la racine de `src/components/` (pas dans un sous-dossier, pas de SCSS dédié — styles via classes utilitaires globales).

## VisuallyHidden

**Rôle** : texte/label réservé aux lecteurs d'écran (SR-only). Pattern central, utilisé dans Badge, Button, Footer, Header, Link, ProfileBanner, etc.

**Props** :

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `HTMLTag` (polymorphique) | `"span"` | Tag rendu   |
| `label` | `string` | `""`    | Texte SR-only (obligatoire sauf cas `newWindow`) |
| `newWindow` | `boolean` | `false` | Si true, ajoute `externalLinkLabel` (label peut être omis) |
| `class` | `string` | —       | Classes additionnelles |

**Rendu** : `<Tag class="u-visually-hidden" ...>{label}{newWindow ? externalLinkLabel : ""}</Tag>`

**Exemple** :

```astro
<VisuallyHidden label="Menu de navigation principale" />
<VisuallyHidden as="strong" label="Important :" />
<a href="https://..." target="_blank">
  Voir l'exemple
  <VisuallyHidden newWindow />
</a>
```


---

## Logo

**Rôle** : logo SVG Frontguys (rendu vectoriel). Pas de prop publique — composant statique.

**Source** : `src/components/Logo.astro`


---

## LogoLink

**Rôle** : logo cliquable qui pointe vers la page d'accueil. À utiliser dans Header et Footer.

**Comportement** :

* Tag `<a href={pages.home.path}>`
* `aria-current="page"` si on est déjà sur l'accueil
* `title` composé : `${siteName} ${homePageLabel}`
* `<Logo>` + `<VisuallyHidden label={homePageLabel}>` (label SR-only)

**Pas de prop publique** — nourri par `src/site.config.ts`.


---

## MainHead

**Rôle** : `<head>` du document. Centralise les meta tags, title, description, Open Graph, favicons, font preload, etc.

**À utiliser systématiquement dans tout** `**Layout.astro**`.


---

## PageHeader

**Rôle** : **Bloc titre principal de chaque page.** Source de l'unique `<h1>` de la page.


:::warning
**Règle a11y critique** : il doit y avoir **exactement un** `**<h1>**` par page, et il provient de `PageHeader`. Ne jamais coder un `<h1>` brut ailleurs.

:::

**Usage** : à placer en début de `<main>`, avant les sections.


---

## Règles d'usage globales

| Composant | Quand l'utiliser |
|-----------|------------------|
| `VisuallyHidden` | Tout label SR-only — pattern systématique |
| `Logo`    | Rendu pur du logo (rare en standalone) |
| `LogoLink` | Header + Footer (logo qui retourne à l'accueil) |
| `MainHead` | Une fois par Layout |
| `PageHeader` | Une fois par page (le H1) |

## Voir aussi

* **Header**, **Footer** — utilisent LogoLink et VisuallyHidden
* `Layout.astro` (dans `src/layouts/`) — orchestrateur global qui appelle MainHead, SkipLinks, Header, Footer