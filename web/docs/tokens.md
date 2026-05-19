# Tokens Frontguys

> **Source de vérité** : `src/tokens/*.json` au format **DTCG** (Design Tokens Community Group, W3C). Compilation via **Terrazzo** en CSS vars dans `src/assets/styles/01-utils/variables/_tokens.scss` (généré, non commité).

## Chaîne de transformation

```
Figma Variables
   │
   │ (export manuel via plugin Figma — à automatiser plus tard)
   ▼
src/tokens/colors.json
src/tokens/text-styles.json
src/tokens/github-primer-tokens.json   (format DTCG)
   │
   │ pnpm build-tokens (Terrazzo CLI)
   ▼
src/assets/styles/01-utils/variables/_tokens.scss   (CSS vars OKLCH avec modes)
   │
   │ @use 'variables' dans tous les SCSS
   ▼
Composants Astro/React utilisent var(--token-name)
```

## Fichiers de tokens

| Fichier | Contenu | Notes |
|---------|---------|-------|
| `src/tokens/colors.json` | Palette `_Core` (Watery Green, etc.) + tokens sémantiques | Format DTCG strict, valeurs en sRGB convertis en OKLCH au build |
| `src/tokens/text-styles.json` | `fontStack` (system, sansSerif=Reddit Sans, monospace) + `text.Heading 1-4`, body, etc. | Tailles en px, converties en rem au build |
| `src/tokens/github-primer-tokens.json` | Tokens GitHub Primer importés | Référence externe, ne pas modifier directement |

## Modes générés par Terrazzo

`terrazzo.config.js` configure ces modes :

| Mode | Sélecteur | Usage |
|------|-----------|-------|
| `light` | `@media (prefers-color-scheme: light)` | Couleurs claires |
| `dark` | `@media (prefers-color-scheme: dark)` | Couleurs sombres |
| `small` | `@media (width < 600px)` | Mobile |
| `large` | `@media (width >= 600px)` | Desktop |

## Comment utiliser un token

### Dans un SCSS de composant

```scss
.my-component {
  color: var(--color-text-primary);
  padding: var(--base-space-4);
  border-radius: var(--interactive-element-border-radius);
  font-size: var(--text-body-1-font-size);
}
```

### Dans un CSS Module React

Idem — toutes les CSS vars sont disponibles globalement via le `_tokens.scss` injecté par `additionalData` dans `astro.config.mjs`.

## Comment ajouter un token

1. Modifier le JSON DTCG concerné dans `src/tokens/`
2. Lancer `pnpm build-tokens`
3. Vérifier le `_tokens.scss` généré (juste pour debug — ne pas commiter)
4. Utiliser la CSS var dans le composant
5. Documenter le token ici si c'est un ajout structurant (nouvelle famille de couleur, nouveau text style)

## Ce qu'il ne faut JAMAIS faire

- ❌ Modifier `_tokens.scss` à la main — c'est généré, ça sera écrasé
- ❌ Hardcoder une valeur dans un SCSS quand un token existe
- ❌ Créer un token "ad hoc" dans le SCSS d'un composant sans le déclarer dans `src/tokens/*.json`
- ❌ Synchroniser depuis Figma sans valider l'impact (un token renommé casse tous les composants qui le consomment)

## Référentiel rapide CSS vars (à compléter au fil des copies)

| Famille | Pattern attendu | Exemple |
|---------|-----------------|---------|
| Couleurs core | `--color-{name}-{shade}` | `--color-watery-green-50` |
| Couleurs sémantiques | `--color-{role}` | `--color-text-primary`, `--color-bg-default` |
| Espacement | `--base-space-{n}` | `--base-space-4` (= ~1rem) |
| Border radius | `--interactive-element-border-radius` | |
| Hauteur interactive | `--interactive-element-height` | |
| Typographie | `--text-{role}-{property}` | `--text-body-1-font-size`, `--text-heading-1-line-height` |

> Pour le référentiel exhaustif après chaque `pnpm build-tokens`, regarder `_tokens.scss` (généré).
