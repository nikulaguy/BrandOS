# MediaObject

---

## component: MediaObject layer: organism implementation: astro polymorphic: true files: \[MediaObject.astro, MediaObject.scss\] last_synced: 2026-05-11

# MediaObject

## Rôle

Bloc média + texte côte à côte (pattern Media Object classique). Image ou illustration à gauche, contenu textuel à droite — réversible.

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `HTMLTag` (polymorphique) | `"div"` | Tag rendu   |
| `img` | `ImageMetadata` | —       | Image (utilise `<Picture>` Astro) |
| `imgAlt` | `string` | `""`    | Alt text    |
| `imgBordered` | `boolean` | `false` | Ajoute une bordure visuelle à l'image |
| `illustration` | `string` | —       | Nom d'illustration (alternative à `img`) |
| `reversed` | `boolean` | `false` | Inverse l'ordre image / contenu |

## Slots

Le contenu textuel est fourni via le **slot par défaut** (généralement composé avec `Stack` + `Text`).

## Rendu

* Utilise `<Picture>` Astro pour l'image (responsive natif)
* Stack interne pour les éléments
* Classe `o-media-object--reversed` si `reversed=true`

## Exemple

```astro
<MediaObject img={maPhoto} imgAlt="Photo équipe" reversed>
  <Stack gap={3}>
    <Text as="h3" variant="heading-3">Notre approche</Text>
    <Text>Description longue de l'approche...</Text>
    <Button as="a" href="/approche">En savoir plus</Button>
  </Stack>
</MediaObject>
```

## Voir aussi

* **ProfileBanner** — pattern similaire mais spécifique au profil
* **Card** variant `photo` — pour les cards en liste
* Source : `references/accessibility-website/src/components/MediaObject/MediaObject.astro`