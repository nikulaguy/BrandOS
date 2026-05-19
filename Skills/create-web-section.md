# create-web-section

---

name: create-web-section description: Produire une section web Astro isolée (un bloc d'une page), réutilisable, prête à coller triggers: \["fais-moi une section", "génère le hero", "génère le bloc", "section enjeux", "section convictions"\] files_to_load_always:

* brand/voice/writing-rules
* brand/voice/vocabulary
* brand/components/conventions
* brand/visual/tokens-snapshot files_to_load_conditional:
* brand/identity/personas/{persona}
* brand/components/catalog/Section
* brand/components/catalog/{Component} (par composant utilisé) last_synced: 2026-05-11


---

# Skill — create-web-section

## Quand utiliser

* Production d'**une section web isolée** (bloc d'une page, pas la page entière)
* Format de sortie : fragment `.astro` à insérer dans une page existante
* Cas typiques : hero · bloc convictions · grille de cards · CTA final · bloc chiffres

**Ne PAS utiliser** pour : page complète (→ `create-landing-page`), texte sans structure (→ `write-copy`).

## Étapes

### Étape 1 — Cadrage

Demander à l'utilisateur (1-2 questions) :

* **Type de section** : hero · contenu · cas clients · convictions · CTA · chiffres ?
* **Persona dominant** ?
* **Tonalité** : Professionnel · Empathique · Pédagogique ?

### Étape 2 — Choisir le pattern

Quelques patterns canoniques :

#### Pattern Hero

```astro
<Section as="section" color="semantic-background-default">
  <PageHeader title="..." />
  <Stack gap={4}>
    <Text variant="surtitle">Surtitre</Text>
    <Text as="h1" variant="heading-1">Nous {verbe} votre {objet}.</Text>
    <Text variant="body-1">{Impératif Vous}. {Bénéfice concret}.</Text>
    <Stack axis="x" gap={3}>
      <Button>CTA principal</Button>
      <Button variant="secondary">CTA secondaire</Button>
    </Stack>
  </Stack>
</Section>
```

#### Pattern Différenciateurs (4 items)

```astro
<Section as="section" color="semantic-background-subtle">
  <SectionHeader title="Notre modèle n'est pas classique" titleTag="h2">
    <Text slot="subtitle">Voyez ce qui nous distingue. Concrètement.</Text>
  </SectionHeader>
  <Stack as="ul" gap={5} class="u-list-reset">
    <li>
      <Stack gap={2}>
        <Text variant="heading-4">Pas seulement du design</Text>
        <Text>Nous réunissons design et développement sur chaque mission.</Text>
      </Stack>
    </li>
    {/* 3 autres items */}
  </Stack>
</Section>
```

#### Pattern Cards (grille de cas clients)

```astro
<Section as="section" color="semantic-background-default">
  <SectionHeader title="Cas clients" />
  <Stack as="ul" gap={4} class="u-list-reset">
    <Card as="li" variant="photo" title="..." imgPath="..." url="..." />
    {/* autres cards */}
  </Stack>
</Section>
```

#### Pattern Convictions (ancrage)

```astro
<Section as="section" color="semantic-background-subtle" condensed>
  <SectionHeader title="Nous avons des convictions profondes" titleTag="h2">
    <Text slot="subtitle">Quatre principes qui changent votre façon de travailler.</Text>
  </SectionHeader>
  <Stack as="ol" gap={5}>
    {/* 4 convictions (cf Brand > Identity > Convictions) */}
  </Stack>
</Section>
```

#### Pattern CTA final

```astro
<Section as="section" color="semantic-background-default">
  <Stack gap={4} align="center">
    <Text as="h2" variant="heading-2">Parlons de vos enjeux</Text>
    <Text>Racontez-nous votre projet. Sans engagement.</Text>
    <Button as="a" href="/contact">Parlez de votre projet</Button>
  </Stack>
</Section>
```

### Étape 3 — Charger les composants spécifiques

Pour chaque composant utilisé dans le pattern → charger sa fiche **Brand > Components > Catalog > {Component}**. Vérifier les props nécessaires.

### Étape 4 — Produire la section

Suivre le pattern choisi, adapter le contenu :

* Voix : 4 règles + FALC + vocabulaire persona
* Visuel : tokens via CSS variables, jamais en dur
* Composants : uniquement ceux documentés

### Étape 5 — Auto-audit

Mêmes checks que `create-landing-page` mais à l'échelle d'une section :

- [ ] Hiérarchie titres cohérente avec la page d'accueil de la section (h2 typiquement, h1 seulement si hero)
- [ ] Section wrappée par `<Section>`
- [ ] Stack utilisé pour le rythme interne
- [ ] Tous les composants existent
- [ ] Voix conforme
- [ ] Persona cohérent

### Étape 6 — Livrer

Le fragment `.astro` + imports à ajouter en tête de la page hôte + une note sur le persona ciblé.

## Anti-patterns

* ❌ Section sans `<Section>` wrapper (perte de l'alternance bg + max-width)
* ❌ Section avec H1 si pas en haut de page (le H1 doit venir de `PageHeader`)
* ❌ Mélange de paddings ad-hoc (laisser `Section` gérer)
* ❌ Réécrire un composant qui existe (ex: réinventer Card)
* ❌ Imbriquer `<Section>` dans `<Section>` (utiliser Stack)

## Lien avec `create-landing-page`

Si plusieurs sections sont demandées en séquence pour la même page, **bascule sur** `**create-landing-page**` plutôt que d'enchaîner. Plus cohérent et plus efficace.