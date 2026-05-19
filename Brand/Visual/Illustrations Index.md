# Illustrations Index

---

## type: illustrations-index last_synced: 2026-05-11 source: figma/foundation-icons-illustrations status: icons-mapped / illustrations-todo

# Catalogue Icons & Illustrations

Source : **Foundation — Icons & Illustrations** dans Figma (`fileKey: DgrQtY2Ua2ULm1xyqcKAd0`).

## Icons — cartographie complète (page Icons, node `405:35`)

Convention de nommage Figma : `icon/{category}/{name}` — `category` en lower, `name` en camelCase si composé.

### Catégorie `action`

Actions et manipulations dans une interface.

| Icon | Token Figma |
|------|-------------|
| Close | `icon/action/close` |
| Up   | `icon/action/up` |
| Down | `icon/action/down` |
| Edit | `icon/action/edit` |
| Plus | `icon/action/plus` |
| Minus | `icon/action/minus` |
| Copy | `icon/action/copy` |
| Delete | `icon/action/delete` |
| Arrow Left | `icon/action/arrowLeft` |
| Arrow Right | `icon/action/arrowRight` |
| Arrow Oblique | `icon/action/arrowOblique` |
| Upload | `icon/action/upload` |
| Download | `icon/action/download` |

### Catégorie `status`

États et feedbacks.

| Icon | Token Figma |
|------|-------------|
| Success | `icon/status/success` |
| Error | `icon/status/error` |

### Catégorie `navigation`

Navigation et wayfinding.

| Icon | Token Figma |
|------|-------------|
| Search | `icon/navigation/search` |

### Catégorie `social`

Réseaux sociaux Frontguys.

| Icon | Token Figma |
|------|-------------|
| LinkedIn | `icon/social/linkedin` |
| Youtube | `icon/social/youtube` |

### Catégorie `utilities`

Utilitaires métier et symboliques.

| Icon | Token Figma |
|------|-------------|
| Calendar | `icon/utilities/calendar` |
| Antenna | `icon/utilities/antenna` |
| Justice | `icon/utilities/justice` |
| Scale | `icon/utilities/scale` |
| Graduate | `icon/utilities/graduate` |
| Tree | `icon/utilities/tree` |
| Shield | `icon/utilities/shield` |
| Star | `icon/utilities/star` |
| People | `icon/utilities/people` |
| Bulb | `icon/utilities/bulb` |
| Higher | `icon/utilities/higher` |
| Map Pin | `icon/utilities/mapPin` |
| Code XML | `icon/utilities/codeXml` |
| Figma | `icon/utilities/figma` |
| Braces | `icon/utilities/braces` |
| Component | `icon/utilities/component` |

## Règles d'usage des icons

### Format

* Tous les icons sont au format **24×24px** dans Figma
* Ils héritent de `currentColor` → couleur transmise par le contexte parent (typiquement `foreground.text.default`)
* Pas de couleur en dur dans l'icon Figma — toujours via parent

### Quand utiliser quoi

| Cas | Catégorie d'icon prioritaire |
|-----|------------------------------|
| Bouton CTA, action utilisateur | `action`                     |
| Feedback de formulaire, message d'état | `status`                     |
| Menu, recherche, navigation principale | `navigation`                 |
| Footer réseaux sociaux | `social`                     |
| Pictogramme métier, illustration de section | `utilities`                  |

### Anti-patterns icons

* ❌ Mettre une couleur en dur sur un icon (`fill="#000"`)
* ❌ Utiliser un icon d'une autre catégorie pour un mauvais usage (ex: `icon/utilities/shield` comme bouton de fermeture)
* ❌ Mélanger des icons d'une autre bibliothèque (Heroicons, Phosphor…) **sans validation DS**
* ❌ Inventer un nouvel icon sans le créer dans le fichier Figma source

## Illustrations — à enrichir 🔵

> **Cette section est incomplète.** Le sondage Figma initial a cartographié uniquement la page Icons (node `405:35`). Les illustrations Frontguys sont **dans le même fichier** (`DgrQtY2Ua2ULm1xyqcKAd0`) mais sur d'autres pages.

### Ce qu'on sait au 11-05-2026

* Les illustrations sont travaillées par **Julien Bourcet** (cf. historique décisions DS)
* Elles doivent **fonctionner en light + dark** (incohérences identifiées et en cours de correction au 04-12-2025)
* Le **ratio des images** (carré vs autre) est en cours d'arbitrage (décision 06-01-2026, repasse design par Laurent Pierre)
* Logo **Qualiopi** à harmoniser sur la page formation (décision 06-01-2026)

### Tâche ouverte

📌 **À planifier** : sondage Figma plus approfondi du fichier `DgrQtY2Ua2ULm1xyqcKAd0` pour cartographier exhaustivement les illustrations + alignement avec l'équipe DS pour figer les règles d'usage.