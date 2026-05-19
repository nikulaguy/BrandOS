# figma-use

---

## name: figma-use description: "**MANDATORY prerequisite** — you MUST invoke this skill BEFORE every `use_figma` tool call. NEVER call `use_figma` directly without loading this skill first. Skipping it causes common, hard-to-debug failures. Trigger whenever the user wants to perform a write action or a unique read action that requires JavaScript execution in the Figma file context." disable-model-invocation: false

# use_figma — Figma Plugin API Skill

Use the `use_figma` tool to execute JavaScript in Figma files via the Plugin API.

**Always pass** `**skillNames: "figma-use"**` **when calling** `**use_figma**`**.**

**If Figma MCP tools appear as deferred tools, batch-load all their schemas in a single** `**ToolSearch**` **call** using the `select:` syntax — e.g. `ToolSearch query="select:use_figma,get_screenshot,get_metadata,create_new_file"`. One round trip beats six.

**If the task involves building or updating a full page, screen, or multi-section layout in Figma from code**, also load **figma-generate-design**.

## 1. Critical Rules


 1. **Use** `**return**` **to send data back.** The return value is JSON-serialized automatically. Do NOT call `figma.closePlugin()` or wrap code in an async IIFE.
 2. **Write plain JavaScript with top-level** `**await**` **and** `**return**`**.** Code is automatically wrapped in an async context.
 3. `figma.notify()` **throws "not implemented"** — never use it. 3a. `getPluginData()` / `setPluginData()` are **not supported** in `use_figma` — use `getSharedPluginData()` / `setSharedPluginData()` instead.
 4. `console.log()` is NOT returned — use `return` for output.
 5. **Work incrementally in small steps.** Break large operations into multiple `use_figma` calls. Validate after each step.
 6. Colors are **0–1 range** (not 0–255): `{r: 1, g: 0, b: 0}` = red.
 7. Fills/strokes are **read-only arrays** — clone, modify, reassign.
 8. **Font loading is required before ANY operation on nodes that contain unloaded fonts** — not just text-setting operations. Use `await figma.listAvailableFontsAsync()` to discover fonts, then `await figma.loadFontAsync({family, style})` to load each one.
 9. **Pages load incrementally** — use `await figma.setCurrentPageAsync(page)` to switch pages and load their content. The sync setter `figma.currentPage = page` does **NOT** work and will throw.
10. `setBoundVariableForPaint` returns a **NEW** paint — must capture and reassign.
11. `createVariable` accepts collection **object or ID string** (object preferred).
12. `**layoutSizingHorizontal/Vertical = 'FILL'**` **MUST be set AFTER** `**parent.appendChild(child)**`.
13. **Position new top-level nodes away from (0,0).** Nodes appended directly to the page default to (0,0). Scan `figma.currentPage.children` to find a clear position.
14. **On** `**use_figma**` **error, STOP. Do NOT immediately retry.** Failed scripts are **atomic** — no changes are made to the file. Read the error, fix the script, then retry.
15. **MUST** `**return**` **ALL created/mutated node IDs.** Collect every affected node ID and return them in a structured object (e.g. `return { createdNodeIds: [...], mutatedNodeIds: [...] }`).
16. **Always set** `**variable.scopes**` **explicitly when creating variables.** The default `ALL_SCOPES` pollutes every property picker. Use specific scopes.
17. `**await**` **every Promise.** Unawaited async calls will fire-and-forget, causing silent failures.

## 2. Page Rules (Critical)

**Page context resets between** `**use_figma**` **calls** — `figma.currentPage` starts on the first page each time.

### Switching pages

Use `await figma.setCurrentPageAsync(page)` to switch pages and load their content. The sync setter `figma.currentPage = page` does **NOT work** — it throws.

```js
const targetPage = figma.root.children.find((p) => p.name === "My Page");
await figma.setCurrentPageAsync(targetPage);
// targetPage.children is now populated

for (const page of figma.root.children) {
  await figma.setCurrentPageAsync(page);
}
```

## 3. `return` Is Your Output Channel

The agent sees **ONLY** the value you `return`. Everything else is invisible.

* **Returning IDs (CRITICAL)**: Every script that creates or mutates canvas nodes **MUST** return all affected node IDs.
* **Progress reporting**: `return { createdNodeIds: [...], count: 5, errors: [] }`
* **Error info**: Thrown errors are automatically captured and returned.
* `console.log()` output is **never** returned.

## 4. Editor Mode

`use_figma` works in **design mode** (editorType `"figma"`, the default). FigJam has a different set of available node types — most design nodes are blocked there.

**Available in design mode**: Rectangle, Frame, Component, Text, Ellipse, Star, Line, Vector, Polygon, BooleanOperation, Slice, Page, Section, TextPath.

**Blocked in design mode**: Sticky, Connector, ShapeWithText, CodeBlock, Slide, SlideRow, Webpage.

## 5. Efficient APIs

### `node.query(selector)` — CSS-like node search

```js
// Find all text nodes named "Title" in a frame
const texts = frame.query('TEXT[name=Title]')

// Recolor all text inside cards
figma.currentPage.query('FRAME[name^=Card] TEXT').set({
  fills: [{type: 'SOLID', color: {r: 0.2, g: 0.2, b: 0.8}}]
})
```

**Selector syntax**: Type (`FRAME`, `TEXT`...), Attribute (`[name=Card]`, `[name*=art]`), Dot-path (`[fills.0.type=SOLID]`), Combinators (`FRAME > TEXT`, `FRAME TEXT`), Pseudo-classes (`:first-child`, `:not(TYPE)`), Wildcard (`*`).

### `node.set(props)` — batch property updates

```js
frame.set({ opacity: 0.5, cornerRadius: 8, name: "Card" })
```

### `figma.createAutoLayout(direction?, props?)` — auto-layout frames

```js
const frame = figma.createAutoLayout('VERTICAL')
figma.createAutoLayout('VERTICAL', { name: 'Column', itemSpacing: 8 })
```

### `node.placeholder` — shimmer overlay for AI-in-progress feedback

```js
frame.placeholder = true
// ... build content ...
frame.placeholder = false  // MUST remove when done
```

### `await node.screenshot(opts?)` — inline screenshots

```js
await frame.screenshot()
await frame.screenshot({ scale: 2 })
```

## 6. Incremental Workflow

**At most 10 logical operations per** `**use_figma**` **call.** Build top-down, starting with placeholders.

### The pattern


1. **Inspect first** — discover existing pages, components, variables, conventions.
2. **Build the skeleton** — create top-level structure with placeholder sections.
3. **Fill in sections incrementally** — populate one section per call.
4. **Return IDs from every call**.
5. **Validate after each step** — `get_metadata` for structure, `get_screenshot` for visual.
6. **Fix before moving on**.

## 7. Error Recovery & Self-Correction

`**use_figma**` **is atomic** — failed scripts do not execute, no partial changes.

### When `use_figma` returns an error


1. **STOP.** Do not immediately retry.
2. **Read the error message carefully**.
3. **If unclear**, call `get_metadata` or `get_screenshot`.
4. **Fix the script** based on the error.
5. **Retry** the corrected script.

### Common self-correction patterns

| Error message | Likely cause | How to fix |
|---------------|--------------|------------|
| `"not implemented"` | Used `figma.notify()` | Remove it — use `return` for output |
| `"node must be an auto-layout frame..."` | Set `FILL`/`HUG` before appending | Move `appendChild` before `layoutSizingX = 'FILL'` |
| `"Setting figma.currentPage is not supported"` | Used sync page setter | Use `await figma.setCurrentPageAsync(page)` |
| Color out of range | Used 0–255 instead of 0–1 | Divide by 255 |
| Script hangs  | Infinite loop or unresolved promise | Check for `while(true)` or missing `await` |

## 8. Pre-Flight Checklist

Before submitting ANY `use_figma` call, verify:

- [ ] Code uses `return` (NOT `figma.closePlugin()`)
- [ ] Code is NOT wrapped in an async IIFE
- [ ] `return` value includes structured data (IDs, counts)
- [ ] NO usage of `figma.notify()` or `console.log()` as output
- [ ] All colors use 0–1 range
- [ ] Fills/strokes are reassigned as new arrays
- [ ] Page switches use `await figma.setCurrentPageAsync(page)`
- [ ] `layoutSizingVertical/Horizontal = 'FILL'` is set AFTER `parent.appendChild(child)`
- [ ] `loadFontAsync()` called before any text property changes
- [ ] Style names verified via `listAvailableFontsAsync()` — NOT guessed
- [ ] `lineHeight`/`letterSpacing` use `{unit, value}` format
- [ ] `resize()` is called BEFORE setting sizing modes
- [ ] New top-level nodes positioned away from (0,0)
- [ ] ALL created/mutated node IDs returned
- [ ] Every async call is `await`ed

## 9. Discover Conventions Before Creating

**Always inspect the Figma file before creating anything.**

### Quick inspection scripts

```js
// List all pages and top-level nodes
const pages = figma.root.children.map(p => `${p.name} id=${p.id} children=${p.children.length}`);
return pages.join('\n');

// List existing components across all pages
const results = [];
for (const page of figma.root.children) {
  await figma.setCurrentPageAsync(page);
  page.findAll(n => {
    if (n.type === 'COMPONENT' || n.type === 'COMPONENT_SET')
      results.push(`[${page.name}] ${n.name} (${n.type}) id=${n.id}`);
    return false;
  });
}
return results.join('\n');

// List existing variable collections
const collections = await figma.variables.getLocalVariableCollectionsAsync();
return collections.map(c => ({
  name: c.name, id: c.id,
  varCount: c.variableIds.length,
  modes: c.modes.map(m => m.name)
}));
```

## 10. Reference Docs (upstream `references/` folder)

Load these as needed:

* **gotchas.md** — every known pitfall with WRONG/CORRECT examples
* **common-patterns.md** — working code examples (shapes, text, auto-layout, variables, components)
* **plugin-api-patterns.md** — fills, strokes, Auto Layout, effects, grouping, cloning, styles
* **api-reference.md** — exact API surface
* **validation-and-recovery.md** — multi-step writes or error recovery
* **component-patterns.md** — combineAsVariants, component properties, INSTANCE_SWAP
* **variable-patterns.md** — collections, modes, scopes, aliasing, binding patterns
* **text-style-patterns.md** — type ramps, font discovery, applying styles
* **effect-style-patterns.md** — drop shadows, applying styles
* **plugin-api-standalone.index.md** + **plugin-api-standalone.d.ts** — full API typings (grep, don't load all)
* **working-with-design-systems/wwds.md** — key concepts for design systems