# Figma MCP Cheatsheet

---

## type: figma-mcp-cheatsheet last_synced: 2026-05-11 source: frontguys-foundation-files + figma-mcp-docs status: stable

# Cheatsheet Figma MCP — requêtes prêtes à l'emploi

Ce fichier liste les **requêtes Figma MCP** pour les cas où le LLM doit aller chercher directement dans Figma : re-synchronisation périodique du snapshot, exceptions, validation visuelle.

## ⚠ Au quotidien : utiliser Tokens Snapshot, pas Figma MCP

> **Règle d'or** : pour produire un asset Frontguys, le LLM lit **Tokens Snapshot** en premier. Le MCP Figma n'est sollicité que dans 3 cas :
>
> 
> 1. **Re-sync périodique** du snapshot (skill `sync-tokens` — typiquement tous les 3 mois ou en début de projet majeur)
> 2. **Token absent** du snapshot (rare — un nouveau token vient d'arriver dans Figma)
> 3. **Validation visuelle** d'un composant (screenshot de comparaison avant livraison)
>
> **Pourquoi** : économie de tokens IA + respect des rate limits Figma + traçabilité (chaque sync est horodatée).

## File keys Frontguys

| Fichier | fileKey | Page d'entrée |
|---------|---------|---------------|
| Design System — Colors | `sudoHypKpnMktYVplKcTt2` | `4117:8`      |
| Design System — Typography Web | `DARJub5ezZ8Kr4hr24KGYm` | —             |
| Foundation — Figma Slide Text Styles | `zxUFGOje9V4PRX6SsPec6O` | —             |
| Foundation — Icons & Illustrations | `DgrQtY2Ua2ULm1xyqcKAd0` | `405:35` (Icons) |
| Foundation — Web Components | `CxcxtE8sbs8ugVSkfZs1Wp` | `2866:143`    |
| Library VID 2024 (héritage) | `yLHpzZbvG5jvLMXTZwRhkN` | —             |

## Outils MCP Figma utiles

| Outil | Quand l'utiliser |
|-------|------------------|
| `whoami` | Diagnostic — vérifier qu'on est bien sur l'org Frontguys |
| `get_libraries` | Lister les libs connectées à un fichier (utile pour cross-références) |
| `search_design_system` | **Trouver un token précis par nom** — entrée principale pour la résolution sémantique |
| `get_variable_defs` | Récupérer les valeurs concrètes d'un set de variables sur un node |
| `get_metadata` | Vue d'ensemble structurelle d'une page ou d'un node — **léger, à privilégier pour l'exploration** |
| `get_design_context` | Implémentation complète d'un composant Figma → code |
| `get_screenshot` | Apercevoir visuellement un node (vérification visuelle) |
| `get_code_connect_map` / `get_context_for_code_connect` | Mapping Figma ↔ code (composants Astro) |

## Patterns de requêtes courants

### Récupérer la valeur d'un token couleur

```
search_design_system(
  query: "foreground text default",
  fileKey: "sudoHypKpnMktYVplKcTt2",
  includeVariables: true,
  includeStyles: true,
  includeComponents: false
)
```

Filtrer par nom sémantique attendu : `foreground.text.default`, `background.surface`, `border.default`, `accent.primary`, etc.

### Récupérer un style typographique par rôle

```
search_design_system(
  query: "title section",
  fileKey: "DARJub5ezZ8Kr4hr24KGYm",
  includeStyles: true,
  includeVariables: true,
  includeComponents: false
)
```

⚠ Le nommage Heading/Title est en cours d'harmonisation — privilégier le rôle attendu (cf **Typography Rules**).

### Récupérer un icon

```
search_design_system(
  query: "icon action arrowRight",
  fileKey: "DgrQtY2Ua2ULm1xyqcKAd0",
  includeComponents: true,
  includeVariables: false,
  includeStyles: false
)
```

Voir **Illustrations Index** pour la liste complète des icons disponibles.

### Implémenter un design complet à partir d'un node

```
get_design_context(
  fileKey: "<fileKey du design source>",
  nodeId: "<id du node sélectionné>",
  clientFrameworks: "astro",
  clientLanguages: "typescript,css"
)
```

## Bonnes pratiques de requête

### 1. Toujours scoper par fileKey

Le MCP Figma sans `fileKey` est inutilisable — c'est le contexte minimum.

### 2. Préférer `search_design_system` à l'exploration brute

`get_metadata` sur une page de tokens peut renvoyer **plus de 300 000 caractères** (constaté sur Colors). Toujours filtrer en amont via `search_design_system`.

### 3. Cibler les flags `includeXXX`

Si tu cherches un token, désactive `includeComponents`. Si tu cherches un composant, désactive `includeVariables`. Tu économises des tokens.

### 4. Spécifier `clientFrameworks` et `clientLanguages`

Pour les composants Astro Frontguys : `astro` / `typescript,css`. Ça améliore les suggestions de code et le logging interne.

## Workflow type — coder une section de page


1. **Lire Tokens Snapshot en premier** — couvrir 90% des besoins en valeurs
2. **Récupérer la structure** du design source via `get_metadata` (léger)
3. **Identifier** les composants utilisés et les tokens nécessaires
4. `**get_design_context**` pour le node principal → squelette de code
5. `**search_design_system**` seulement pour les tokens **absents du snapshot**
6. `**get_screenshot**` pour validation visuelle finale

## Anti-patterns

* ❌ Faire un `get_metadata` sur la racine d'un fichier sans cibler une page → output énorme
* ❌ Hardcoder un nodeId en dur ailleurs que dans ce fichier — **préférer la résolution par** `**search_design_system**`
* ❌ Cumuler `includeVariables + includeComponents + includeStyles` quand on cherche une seule chose
* ❌ Re-fetch le même token N fois dans une session
* ❌ Ignorer les rate limits Figma — espacer les calls si on en fait beaucoup