# sync-tokens

---

name: sync-tokens description: Rafraîchir le snapshot Brand OS des tokens visuels depuis les JSON Gitlab Frontguys triggers: \["sync tokens", "rafraîchir snapshot", "mettre à jour les valeurs", "tokens à jour", "re-sync visuel"\] files_to_load:

* brand/visual/tokens-snapshot
* brand/visual/tokens-architecture
* brand/visual/figma-mcp-cheatsheet last_synced: 2026-05-11


---

# Skill — sync-tokens

## Quand utiliser

Ce skill se déclenche dans 3 cas :


1. **Début de projet majeur** — vérifier que les tokens sont à jour avant de produire des assets
2. **Re-sync programmée** — toutes les 8 à 12 semaines (cf `next_sync_due` dans le snapshot)
3. **Token suspect** — un asset produit semble incohérent avec Figma → re-sync ponctuelle

## Source canonique

```
Figma (canon)
   ↓ TokensBrücke (plugin Figma, manuel — équipe DS Frontguys)
src/tokens/*.json (Gitlab repo frontguys/accessibility-website, format DTCG)
   ↓ Ce skill
brand/visual/tokens-snapshot (vue humaine pour LLM)
```

**Note** : le skill **ne sync pas Figma → JSON**. Cette étape est manuelle, gérée par l'équipe DS via le plugin TokensBrücke. Le skill sync uniquement **JSON → snapshot Brand OS**.

## Étapes

### Étape 1 — Vérifier la fraîcheur

Lire le frontmatter de **Brand > Visual > Tokens Snapshot** :

* `last_synced` : date dernière sync
* `next_sync_due` : date sync prévue

Si `**next_sync_due**` **< aujourd'hui** ou si l'utilisateur force, continuer. Sinon avertir et demander confirmation.

### Étape 2 — Accéder aux JSON Gitlab

Trois sources à lire dans `references/accessibility-website/src/tokens/` (ou via web_fetch sur Gitlab raw URL si pas en local) :

| Fichier | Contenu |
|---------|---------|
| `colors.json` | Tokens couleur DTCG (Core + Semantic) |
| `text-styles.json` | Styles typographiques |
| `github-primer-tokens.json` | Référence externe (Primer) — vérifier l'usage avant inclusion |

Si pas en local → demander l'accès au repo Gitlab à l'utilisateur (URL `https://gitlab.com/frontguys/accessibility-website`).

### Étape 3 — Parser le JSON DTCG

Format observé :

```json
{
  "semantic": {
    "background": {
      "default": {
        "$value": "{core.watery-green.10}",
        "$type": "color"
      }
    }
  }
}
```

Extraire pour chaque token :

* **Chemin sémantique** : `semantic.background.default`
* **Valeur** : `$value` (peut être une référence `{...}` ou une valeur littérale `#FFFFFF`)
* **Type** : `$type` (color, dimension, fontFamily…)
* **Mode** : light / dark (si tokens multi-mode dans le JSON)

### Étape 4 — Re-générer les sections du snapshot

Mettre à jour **Brand > Visual > Tokens Snapshot** :

* Pour chaque groupe Semantic (`background`, `foreground`, `border`, `accent`) → lister les tokens avec valeurs light + dark
* Pour la typographie → lister les rôles avec font-size / weight / line-height / family
* Pour le spacing → lister l'échelle `--base-space-{n}`

**Format de ligne canonique** :

```markdown
- `<token.path>` — light: `<valeur>` · dark: `<valeur>`
```

### Étape 5 — Mettre à jour le frontmatter

```yaml
last_synced: <date_du_jour>
next_sync_due: <date_du_jour + 90 jours>
sync_status: synced-from-gitlab-json
operator: <nom utilisateur>
canonical_sources:
  figma_colors: sudoHypKpnMktYVplKcTt2
  figma_typography_web: DARJub5ezZ8Kr4hr24KGYm
  figma_typography_slides: zxUFGOje9V4PRX6SsPec6O
gitlab_json_versions:
  colors: <git commit hash si dispo>
  text_styles: <git commit hash>
```

### Étape 6 — Notes de version

Ajouter une entrée dans la section "Notes de version" du snapshot :

```markdown
### YYYY-MM-DD — Re-sync

- Tokens couleur : N tokens mis à jour
- Tokens typo : N rôles mis à jour
- Changements notables : <liste courte>
- Operator : <nom>
```

### Étape 7 — Pour le typo slides (cas spécial)

Le fichier Figma Slides (`zxUFGOje9V4PRX6SsPec6O`) **n'a pas encore d'export JSON** côté Frontguys.

Deux options :

* A. **Demander à l'équipe DS** d'exporter via TokensBrücke (recommandé long terme)
* B. **Sonder Figma MCP** directement sur ce fileKey pour remplir la section "Typographie — Slides" du snapshot (exception, à faire seulement si A pas possible)

Si option B, utiliser `search_design_system` avec query ciblée (cf **Brand > Visual > Figma MCP Cheatsheet**).

## Sortie attendue

* **Brand > Visual > Tokens Snapshot** mis à jour avec :
  * Frontmatter rafraîchi (dates, status, sources)
  * Sections couleur / typo / spacing peuplées avec valeurs actuelles
  * Entrée de notes de version pour ce sync
* Récap utilisateur : nombre de tokens mis à jour, changements notables, date de prochaine sync recommandée

## Anti-patterns

* ❌ Re-générer le snapshot **sans** vérifier la fraîcheur de la source — perte de temps si rien n'a bougé
* ❌ Coder en dur des valeurs dans le snapshot sans référence claire au JSON source
* ❌ Sauter l'étape 7 — la typo slides est une vraie source utilisée pour les présentations
* ❌ Oublier de mettre à jour `last_synced` et `next_sync_due`
* ❌ Sync depuis Figma directement quand le JSON Gitlab existe (gaspille tokens IA + rate limits Figma)

## Fréquence recommandée

* **Sync complet** : tous les 3 mois (tous les 90 jours)
* **Sync ciblé** (sur un seul groupe / un seul rôle) : à la demande, pas de fréquence imposée