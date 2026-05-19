# generate-project-plan

---

## name: generate-project-plan description: "Generate a FigJam project plan board from a PRD plus codebase context. Interactive flow: research → propose sections → per-section deep research → per-section content + block-shape proposal → create FigJam → skeleton → fill → diagrams → wrap." disable-model-invocation: false

# generate-project-plan

Turn a PRD (plus optional codebase grounding) into a FigJam project plan board. Section set is not fixed — the skill proposes candidates from the research and the user picks which to include. For each picked section, the skill proposes content + rendering shape (block) and the user confirms.

## Mandatory prerequisites

**Foundation skills** (load by name) :

* **figma-use** — **Load once per session.** Stays in context for all `use_figma` calls.
* **figma-use-figjam** — **Re-load before every** `**use_figma**` **call.**
* **figma-generate-diagram** — **Re-load before every** `**generate_diagram**` **call.**

**Foundation references** (upstream `references/foundation/` folder) :

* `palette.md` — section + sticky + text palette constants (`hex/255`)
* `layout.md` — canvas geometry, sizing rules, placeholder lifecycle
* `plugin-api-traps.md` — documented traps for FigJam `use_figma`
* `codebase-grounding.md` — Step 1 expansion rules

**Section catalog** : `section-catalog.md` — \~10 candidate sections with default blocks and palette.

**Block subskills** (one per content type — re-load before each `use_figma` fill call) :

| Block | File | When to load |
|-------|------|--------------|
| Top-level section | `blocks/section.md` | Skeleton pass (Step 6) and every fill call (Step 7) |
| Nested section | `blocks/nested-section.md` | Fills that group sub-content |
| Intro callout | `blocks/intro-callout.md` | Fills that open with a highlighted intro |
| Text primitives | `blocks/text-primitives.md` | Any fill that uses body paragraphs, H3 subheaders, or bulleted lists |
| Table | `blocks/table.md` | Fills with structured data (Resources, Goals, Dependencies, Rollout, Milestones) |
| Multi-column text | `blocks/multi-column-text.md` | Fills with 2–4 option columns |
| Sticky column | `blocks/sticky-column.md` | Fills with lists of stickies |
| Diagram section | `blocks/diagram-section.md` | Right-column diagram sections (Step 8) |
| Metadata strip | `blocks/metadata-strip.md` | Skeleton pass — one metadata strip at top of board |

**Also pass** `skillNames: "figma-use,figma-use-figjam,generate-project-plan"` on `use_figma` calls (logging only).

## Visual UI conventions — STRICT, do not deviate

### Colors (two-tone per section)

Every left-column section uses **two coordinated colors** of the same hue: a very-pale `ARCH_PALE` background, and a slightly-more-saturated FigJam-`SECTION` palette color for any table header. Right-column diagram sections are pure white.

| Section bg (`ARCH_PALE`) | Table header (`TABLE_HEADER.light`) | Hue |
|------------------------|-----------------------------------|-----|
| `#F8F5FF`              | `#DCCCFF`                         | violet |
| `#EBFFEE`              | `#CDF4D3`                         | green |
| `#DBF0FF`              | `#C2E5FF`                         | blue |
| `#F5FBFF`              | `#C2E5FF`                         | pale blue |
| `#FFF7F0`              | `#FFE0C2`                         | orange |
| `#F1FEFD`              | `#C6FAF6`                         | teal |
| `#FFFBF0`              | `#FFEC BD`                        | yellow |
| `#FFEEF8`              | `#FFC2EC`                         | pink |
| `#FFEEE8`              | `#FFCDC2`                         | red |

Never use the dark-saturated palette (`#874FFF`, `#3DADFF`, etc.) for table headers — that's for FigJam's standalone tables, not project-plan boards.

Architecture-diagram subgraph colors are auto-applied by `generate_diagram` and **must not be overridden**.

### Typography (font sizes)

| Element | Size | Font | Color |
|---------|------|------|-------|
| H1 (board title) | **40** | Inter Medium | `#1E1E1E` |
| H2 (section title — first child of every section) | 40   | Inter Medium | `#1E1E1E` |
| H3 — full-width subhead | **40** | Inter Medium | `#1E1E1E` |
| H3 — nested-section header | **32** | Inter Medium | `#1E1E1E` |
| H3 — column title in 2/3/4-col layouts | **24** | Inter Medium | `#1E1E1E` |
| Body text | 16   | Inter Medium | `#1E1E1E` |
| Table cells (header AND body) | 16   | **Inter Bold** | `#1E1E1E` |

The three H3 sizes are deliberate. Pick by **container width**, not by semantic depth.

Always load both `Inter Medium` AND `Inter Bold` at the top of any `use_figma` script that creates tables (Bold) plus any other text (Medium).

### Section properties

| Property | Value |
|----------|-------|
| `section.fills` | `[{ type: 'SOLID', color: ARCH_PALE.X }]` (left column) or `ARCH_PALE.white` (right column / diagrams) |
| `section.name` | `""` — empty string. **NO FigJam title-bar label**. The H2 inside is the only title |
| Inner padding (all 4 sides) | 32    |
| First child position | `(32, 32)` |
| Width (left column) | 800   |
| Width (right column / diagram) | `max(1200, diag.width + 64)` |
| Vertical gap between sections | **64** |
| Hug behavior | Manual: `section.resizeWithoutConstraints(w, maxChildBottom + 32)` |
| Placeholder during build | `placeholder = true` in skeleton; `placeholder = false` at fill end |

### Outer wrapper + column alignment

The board has **one outer wrapper** (unlabeled, white) plus the diagram column :


1. **Column wrapper** — unlabeled white SECTION. Contains H1 project title + metadata row + 6 left-column sections stacked with 64px gutter.
2. **Diagram column** at `(columnWrapperRight + 64, 0)`. Each diagram is its own un-wrapped white SECTION. Diagrams stack with 64px gutter.

**Constants:**

* Wrapper inner padding (all 4 sides): **64**
* Vertical gap between sections inside the wrapper: **64**
* Horizontal gap between wrapper right edge and diagram-column left edge: **64**

### Vertical spacing (STRICT)

| Between | Gap |
|---------|-----|
| Section top edge → H2 (first child) | 32 (= padding) |
| H2 → next child | **24** |
| Body paragraph → H3 | **24** |
| H3 → next child | **24** |
| Body → body | **24** |
| List → next block | **24** |
| Last child bottom → section bottom edge | 32 (= padding) |

**Always position children using** `**prevChild.y + prevChild.height + 24**` — never use a fixed offset.

### Tables

* **Both header AND body cells** use `Inter Bold` 16px (NOT Medium).
* Header text is `#1E1E1E` charcoal on a light fill.
* Body cells leave fill at default white; text is charcoal.
* Headers do NOT use white-on-dark.

### Diagrams (right column)

`generate_diagram` with `useArchitectureLayoutCode: "FIGMA_DIAGRAM_2026"` produces **multiple page-level nodes** (1–2 subgraph SECTIONs + bare SHAPE_WITH_TEXTs + CONNECTORs), NOT a single container. To wrap them :


1. Collect all new page-level nodes
2. Compute the bbox
3. Create a new SECTION sized to `bboxW + 64 × bboxH + 64 + 64`, fill `ARCH_PALE.white`
4. Reparent each diagram node, translating local coords
5. **CRITICAL — delete and recreate every connector after reparent.** The `c.connectorStart = c.connectorStart` trick is NOT reliable
6. **Connector labels** — explicit `fontName` + `fontSize` + `fills` ALL required

Diagram-section convention: `section.name = ""`, H2 text node inside as the title.

## Step template

Every step uses this shape :

```
## Step N — <Name>  [Type: Research | Confirm | Write]
Inputs required: …
Ask if missing: …
Tools / refs loaded: …
Do: (3–6 action bullets)
Checkpoint: (Research → self-check; Confirm → AskUserQuestion; Write → screenshot + AskUserQuestion)
```

Three step types :

* **Research** — read-only ; checkpoint = self-check list
* **Confirm** — no board writes, user decision gate ; checkpoint = `AskUserQuestion`
* **Write** — creates/mutates FigJam ; checkpoint = screenshot + `AskUserQuestion`

## Step 1 — Gather context \[Research\]

Read the PRD. Extract: title, problem, goals, non-goals, owner, audience, success metrics, rollout hints, risks. If entry points provided: follow `codebase-grounding.md` (bounded 20-file cap, depth-1 imports). Produce the **tech-context object**.

## Step 2 — Propose candidate sections \[Confirm\]

For each section in the catalog, decide if there is *real content*. For each qualifying candidate, produce a card (title, 1-line description, why suggested, default block shape). Fire `AskUserQuestion` (multiSelect per batch ≤4 candidates). Store as `approved_sections`.

## Step 3 — Per-section deep research \[Research\]

For each section in `approved_sections`, look up its catalog entry. Compare what the section needs vs. what the tech-context has. Produce a **gap list per section**.

## Step 4 — Per-section content + block proposal \[Confirm\]

Per section: fill the gap list, propose content + block shape (default from catalog ; offer alternatives where sensible). Show short preview. Fire `AskUserQuestion`: "Use this content + shape? \[Yes / Edit / Skip this section\]."

## Step 5 — Create FigJam file \[Write\]

Resolve `planKey` via `whoami`. Call `create_new_file` with `{ planKey, fileName: "<project title>", editorType: "figjam" }`. Run the first-run probe. Expect `editorType === "figjam"` and empty page.

## Step 6 — Skeleton pass \[Write\]

Create metadata strip (H1 + 4 body texts). For each approved section, create a top-level SECTION (colored bg from ARCH_PALE, `section.name = ""`, `placeholder = true`, resize). Position each left-column section, right-column at `(832, ...)`. Return all created node IDs. Take inline screenshot.

## Step 7 — Fill pass (one call per section) \[Write\]

Per section :


1. `await figma.getNodeByIdAsync(sectionId)` — confirm type is SECTION
2. Build content: H2 header first, then children per approved block shape. Append to section FIRST, then set x/y.
3. Two-pass measure for stickies
4. `section.resizeWithoutConstraints(LEFT_COL_W, computed_height)`
5. `section.placeholder = false`
6. `await section.screenshot()` inline
7. `return { mutatedNodeIds: [...], sectionHeight, screenshotIncluded: true }`

**After all left-column fills**: run re-stack pass + outer-wrapper pass.

## Step 8 — Diagrams \[Write\]

Per diagram :


1. `use_figma`: create right-column section (white fill, H2 header, `placeholder = true`)
2. `generate_diagram`: compose Mermaid from tech-context ; architecture diagrams use `useArchitectureLayoutCode: "FIGMA_DIAGRAM_2026"`
3. `use_figma`: locate generated diagram node, reparent into section, position below H2, resize to fit, `placeholder = false`
4. `await section.screenshot()`

If `generate_diagram` fails, leave a text placeholder.

## Step 9 — Final review + report \[Write, then Read\]

Full-page screenshot at `scale: 0.25`. Inspect: two-column structure, no overlaps, no `placeholder = true` remaining, metadata strip visible. Fix any issues with targeted scripts. Post completion message with `file_url`.

## Operational rules

* ≤10 logical operations per `use_figma` call
* Always return `createdNodeIds` / `mutatedNodeIds` from every write script
* Use `hex/255` notation for all palette colors
* **STRICT: section backgrounds use** `**ARCH_PALE**` **palette, NOT FigJam standard SECTION palette**
* **STRICT:** `**section.name = ""**` **on every project-plan section** — H2 inside is the title
* Read, edit, or cancel at every Confirm/Write checkpoint
* If a `use_figma` script errors: atomic, no changes made

## Trigger phrases

"/generate-project-plan", "interactive project plan", "project plan", "make a FigJam project plan", "PRD to FigJam".

## Reference docs (upstream `references/` folder)

Load on demand depending on the step :

* **foundation/** : palette, layout, plugin-api-traps, codebase-grounding
* **blocks/** : section, nested-section, intro-callout, text-primitives, table, multi-column-text, sticky-column, diagram-section, metadata-strip
* **section-catalog.md** : the \~10 candidate sections