# Hero Section Marc-Antoine

---

## type: example purpose: Few-shot hero section — landing ciblée Marc-Antoine (DSI / décideur business) persona: marc-antoine asset_type: web-section last_synced: 2026-05-11

# Exemple — Hero section pour Marc-Antoine

## Contexte

Landing page sur l'offre "Formation Design System pour équipes en transformation". Cible Marc-Antoine — DSI qui doit former une équipe design naissante sans la sortir du delivery.

## Sources mobilisées

* **Brand > Voice > Writing Rules** (4 règles)
* **Brand > Voice > Vocabulary** (verbes CTA + bascules FALC)
* **Brand > Identity > Personas > Marc-Antoine** (vocabulaire ROI / risque / COMEX)

## Hero produit

```astro
<Section as="section" color="semantic-background-default">
  <Stack gap={4}>
    <Text variant="surtitle">Formation Design System</Text>
    <Text as="h1" variant="heading-1">
      Nous accompagnons votre montée en compétence Design System.
    </Text>
    <Text variant="body-1">
      Accélérez sans sortir vos équipes du delivery. Avec un organisme certifié Qualiopi,
      bénéficiez d'un accompagnement sur-mesure, finçancable OPCO.
    </Text>
    <Stack axis="x" gap={3}>
      <Button as="a" href="/contact">Demandez un diagnostic gratuit</Button>
      <Button as="a" href="/guide-formation" variant="secondary">
        Téléchargez le guide
      </Button>
    </Stack>
  </Stack>
</Section>
```

## Décodage

### Voix

| Règle | Application |
|-------|-------------|
| Règle 1 — Nous actif | "Nous accompagnons votre montée en compétence" |
| Règle 2 — Pragmatique | "Qualiopi", "OPCO", "Design System" nommés concrètement |
| Règle 3 — Alternance | H1 "Nous" → Body "Accélérez" (Vous / impératif) |
| Règle 4 — Impératif CTA | "Demandez", "Téléchargez" |

### Vocabulaire Marc-Antoine

* ✅ Mobilisés : *montée en compétence*, *Qualiopi*, *OPCO*, *delivery*, *diagnostic*, *finçancable*
* ❌ Évités : *atomic design*, *tokens*, *React*, *handoff* (vocabulaire Claire / Alexis)

### Tokens visuels

* `color="semantic-background-default"` — fond neutre par défaut
* Pas de couleur en dur dans le code
* Typo via `Text variant="heading-1"` / `body-1` / `surtitle` (cf **Catalog > Text**)

### Composants utilisés

| Composant | Fiche |
|-----------|-------|
| `Section` | **Brand > Components > Catalog > Section** |
| `Stack`   | **Brand > Components > Catalog > Stack** |
| `Text`    | **Brand > Components > Catalog > Text** |
| `Button`  | **Brand > Components > Catalog > Button** |

### Conviction ancrée

Implicitement : conviction 1 ("le design/dev est un levier business, pas une simple couche esthétique") — la formation est positionnée comme un investissement avec ROI mesurable (OPCO, Qualiopi).

## Variantes alternatives

### Variante "réassurance forte"

```astro
<Text as="h1" variant="heading-1">
  Nous certifions vos équipes Design System.
</Text>
<Text variant="body-1">
  Soutenez votre équipe sans la sortir du delivery.
  Formation Qualiopi, finçancable, ROI mesurable en 3 mois.
</Text>
```

### Variante "pédagogique"

```astro
<Text as="h1" variant="heading-1">
  Nous formons vos experts au Design System.
</Text>
<Text variant="body-1">
  Découvrez nos parcours certifiés Qualiopi, conçus pour s'intégrer
  à votre delivery et vos contextes métiers.
</Text>
```