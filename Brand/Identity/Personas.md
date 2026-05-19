# Personas

---

## type: personas-index status: proto-personas ai_sections_status: hypothesis last_synced: 2026-05-11 source: knowtion/proto-personas

# Personas Frontguys

Trois proto-personas représentent les trois voix décisives du cycle d'achat Frontguys. **La décision d'achat est collégiale** dans les grands comptes : un asset peut s'adresser à un persona dominant, mais doit anticiper les questions des deux autres.

## Carte synthétique

| Persona | Rôle | Registre de langage | Rôle décisionnel | Tags clés |
|---------|------|---------------------|------------------|-----------|
| **Claire** | Head of Product & Design | Design + produit    | Prescriptrice    | Design System, Handoff, Accélération |
| **Marc-Antoine** | Directeur Digital / DSI | ROI + risque + business | Décideur, justifie en COMEX | DesignOps, Qualiopi, ROI, Accélération |
| **Alexis** | CTO  | Composants, tests, architecture | Acheteur technique | React, TypeScript, Storybook, Accessibilité |

## Règle de sélection — quel persona charger ?

Pour économiser les tokens, le LLM ne charge **qu'un seul persona à la fois** sauf nécessité explicite.

### Heuristiques de routage

| Demande du collaborateur | Persona à charger en priorité |
|--------------------------|-------------------------------|
| "Slide deck pour COMEX / présentation à un dirigeant" | **Marc-Antoine**              |
| "Présentation pour un Head of Product / Design / UX" | **Claire**                    |
| "Présentation technique / dev / CTO" | **Alexis**                    |
| "Pitch commercial générique" | **Marc-Antoine** (décideur business par défaut) |
| "Landing page expertise Design System" | **Claire** + **Alexis**       |
| "Landing page expertise formation" | **Marc-Antoine**              |
| "Article expert (blog)"  | dépend du sujet (voir tags)   |

### Charger plusieurs personas

Charger plusieurs personas est justifié dans deux cas seulement :


1. L'asset est une **page de positionnement transversale** (Accueil, page Méthode)
2. L'asset doit **explicitement adresser plusieurs profils** (ex. "présentation qui doit convaincre à la fois la DSI et le Head of Product")

Dans ce cas, l'asset doit prévoir une **double lecture** : un niveau de surface accessible à tous, et un niveau de détail pour chaque profil.

## Trois langues, un même cycle d'achat

* **Claire** scanne le site en 20 secondes et décide de rester — ou pas. Elle parle **design et produit**.
* **Marc-Antoine** ne parle pas le langage du design, mais il comprend les enjeux de vélocité, cohérence et dette technique. Il parle **ROI et risque**.
* **Alexis** ne cherche pas du conseil — il cherche des gens qui livrent du code propre, accessible, maintenable, dans son repo. Il parle **composants, tests et architecture**.

Ces trois profils ne visitent pas les mêmes pages, ne réagissent pas aux mêmes preuves, et ne convertissent pas sur les mêmes CTAs.

## Dimension IA — Statut

Chaque persona contient une section "Rapport à l'IA" en v2. **Toutes les sections IA sont marquées 🔵 (hypothèse non validée terrain.)**

Le LLM utilise ces sections pour :

* Calibrer la profondeur du discours IA selon le persona
* Choisir les cas clients IA à mobiliser (France TV, Lefebvre Dalloz, LFP, BPI, UX Research accélérée)
* Anticiper les objections IA propres à chaque profil

Le LLM n'utilise **pas** ces sections pour formuler des certitudes commerciales sur le rapport des clients à l'IA dans des assets externes.

## Anti-patterns

* **Mélanger les registres** : ne pas écrire pour Alexis avec le vocabulaire de Marc-Antoine, ni l'inverse. Le registre est constitutif du persona.
* **Tout dire à tout le monde** : un asset qui essaie de plaire aux trois finit par ne parler à personne. Trancher.
* **Inventer un 4ᵉ persona** : si une demande ne colle à aucun des trois, demander à l'utilisateur de préciser plutôt que d'extrapoler.