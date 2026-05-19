# figma-generate-design

---

## name: figma-generate-design description: "Use this skill alongside figma-use when the task involves translating an application page, view, or multi-section layout into Figma. Triggers: 'write to Figma', 'create in Figma from code', 'push page to Figma', 'take this app/page and build it in Figma', 'create a screen', 'build a landing page in Figma', 'update the Figma screen to match code', 'convert this modal/dialog/drawer/panel to Figma'. This is the preferred workflow skill whenever the user wants to build or update a full page, modal, dialog, drawer, sidebar, panel, or any composed multi-section view in Figma from code or a description." disable-model-invocation: false

# Build / Update Screens and Views from Design System

Use this skill to create or update **screens, views, and multi-section UI containers** in Figma by **reusing the published design system** — components, variables, and styles — rather than drawing primitives with hardcoded values.

**MANDATORY**: You MUST also load **figma-use** before any `use_figma` call.

**Always pass** `**skillNames: "figma-generate-design"**` **when calling** `**use_figma**`**.**

## Skill Boundaries

* Use this skill when the deliverable is a **composed Figma view** built from design system component instances.
* If the user wants to generate **code from a Figma design**, switch to **figma-implement-design**.
* If the user wants to create **new reusable components or variants**, use **figma-use** directly.
* If the user wants to write **Code Connect mappings**, switch to **figma-code-connect**.

## Prerequisites

* Figma MCP server must be connected
* The target Figma file must have a published design system
* Source code or description of the screen/view to build/update

## Parallel Workflow with generate_figma_design (Web Apps Only)

When building a screen from a **web app** that can be rendered in a browser:


1. **In parallel:**
   * Start building the screen using this skill's workflow
   * Run `generate_figma_design` to capture a pixel-perfect screenshot
2. **Once both complete:** Update use_figma output to match the pixel-perfect layout. Transfer images by copying `imageHash` values.
3. **Once confirmed:** Delete the `generate_figma_design` output.

**This parallel workflow is MANDATORY when the source contains images.** The `use_figma` Plugin API cannot fetch external image URLs.

## Required Workflow

> **Hard gates — forbidden shortcuts:**
>
> * **Forbidden:** `search_design_system` for component keys until 2a-i is complete and 2a-ii is attempted.
> * **Forbidden:** Any `use_figma` call that mutates the canvas until all Step 2 rows are filled in.

### Step 1: Understand the Deliverable


1. Read the source files to understand structure, sections, components used.
2. Identify the major sections (Header, Hero, Content, Footer / Title Bar, Form, Action Bar / Navigation, Content, Footer).
3. List the UI components per section.
4. **Check for images** — if present and this is a web app, run the parallel `generate_figma_design` capture.

### Step 2: Collect Component Keys, Variables, and Styles

Three things from the design system: **components**, **variables** (colors, spacing, radii), **styles** (text, effect).

#### 2a: Discover components

**2a-i — REQUIRED: Check Code Connect for needed components.** Search for Code Connect files: `*.figma.ts`, `*.figma.tsx`, `*.figma.js`, `.kt` with `@FigmaConnect`, `.swift` with `FigmaConnect`.

Extract Figma component URL, parse `fileKey` and `nodeId`. Resolve component keys via `use_figma` against the library file:

```js
const node = await figma.getNodeByIdAsync("609:35535");
const set = node?.parent?.type === "COMPONENT_SET" ? node.parent : node;
return { componentKey: set.key };
```

**2a-ii — REQUIRED if unresolved: Inspect existing screens.** Walk an existing frame's instances:

```js
const frame = figma.currentPage.findOne(n => n.name === "Existing Screen");
const uniqueSets = new Map();
frame.findAll(n => n.type === "INSTANCE").forEach(inst => {
  const mc = inst.mainComponent;
  const cs = mc?.parent?.type === "COMPONENT_SET" ? mc.parent : null;
  const key = cs ? cs.key : mc?.key;
  if (key && !uniqueSets.has(key)) {
    uniqueSets.set(key, { name: cs?.name || mc?.name, key, isSet: !!cs });
  }
});
return [...uniqueSets.values()];
```

**2a-iii — LAST RESORT:** `**search_design_system**`**.** Search broadly with multiple terms.

**Include component properties** in your map — read `componentProperties` on a temp instance, then remove it.

#### 2b: Discover variables (colors, spacing, radii)

> **WARNING: Two different variable discovery methods — do not confuse them.**
>
> * `use_figma` with `figma.variables.getLocalVariableCollectionsAsync()` — returns **only local variables**. If empty, doesn't mean no variables exist.
> * `search_design_system` with `includeVariables: true` — searches across **all linked libraries**. **Never conclude "no variables exist" based solely on** `**getLocalVariableCollectionsAsync()**` **returning empty.**

**Query strategy:** Run multiple short, simple queries in parallel:

* Primitive colors: "gray", "red", "blue", "brand"
* Semantic colors: "background", "foreground", "border", "surface"
* Spacing: "space", "radius", "gap", "padding"

Inspect existing screens for authoritative bindings.

#### 2c: Discover styles (text styles, effect styles)

Search with `includeStyles: true` and terms like "heading", "body", "shadow", "elevation". Or inspect an existing screen's `textStyleId`/`effectStyleId`.

### Step 3: Create the Wrapper Frame First

**Do NOT build sections as top-level page children and reparent them later** — it silently fails.

```js
let maxX = 0;
for (const child of figma.currentPage.children) {
  maxX = Math.max(maxX, child.x + child.width);
}

const wrapper = figma.createAutoLayout("VERTICAL");
// Full page: wrapper.resize(1440, 100)
// Modal: wrapper.resize(640, 100)
// Drawer/sidebar: wrapper.resize(360, 100)
wrapper.name = "VIEW_NAME";
wrapper.primaryAxisAlignItems = "CENTER";
wrapper.counterAxisAlignItems = "CENTER";
wrapper.layoutSizingHorizontal = "FIXED";
wrapper.x = maxX + 200;

return { success: true, wrapperId: wrapper.id };
```

### Step 4: Build Each Section Inside the Wrapper

**Build one section at a time, each in its own** `**use_figma**` **call.** At the start of each script, fetch the wrapper by ID.

```js
const wrapper = await figma.getNodeByIdAsync("WRAPPER_ID");

const buttonSet = await figma.importComponentSetByKeyAsync("BUTTON_SET_KEY");
const primaryButton = buttonSet.children.find(c =>
  c.type === "COMPONENT" && c.name.includes("variant=primary")
) || buttonSet.defaultVariant;

const bgColorVar = await figma.variables.importVariableByKeyAsync("BG_COLOR_VAR_KEY");
const spacingVar = await figma.variables.importVariableByKeyAsync("SPACING_VAR_KEY");

const section = figma.createAutoLayout();
section.name = "Header";
section.setBoundVariable("paddingLeft", spacingVar);
const bgPaint = figma.variables.setBoundVariableForPaint(
  { type: 'SOLID', color: { r: 0, g: 0, b: 0 } }, 'color', bgColorVar
);
section.fills = [bgPaint];

const btnInstance = primaryButton.createInstance();
section.appendChild(btnInstance);
wrapper.appendChild(section);
section.layoutSizingHorizontal = "FILL"; // AFTER appending

return { success: true, createdNodeIds: [section.id, btnInstance.id] };
```

#### Override instance text with setProperties()

Component instances ship with placeholder text. Use `setProperties()` with the property keys discovered in Step 2:

```js
const nestedHeading = cardInstance.findOne(n => n.type === "INSTANCE" && n.name === "Text Heading");
if (nestedHeading) {
  nestedHeading.setProperties({ "Text#2104:5": "Actual heading" });
}
```

#### Read source code defaults carefully

Check the component's default prop values, not just what's explicitly passed.

#### What to build manually vs. import

| Build manually | Import from design system |
|----------------|---------------------------|
| Wrapper frame  | **Components**: buttons, cards, inputs |
| Section container frames | **Variables**: colors, spacing, radii |
| Layout grids   | **Text styles**: heading, body |
|                | **Effect styles**: shadows |

**Never hardcode hex colors or pixel spacing** when a design system variable exists.

### Step 5: Validate the Full View

Call `get_screenshot` on the wrapper and compare against source. **Screenshot individual sections, not just the full view** — catch cropped/clipped text, overlapping content, placeholder text, wrong variants, blank images.

#### Transfer images from generate_figma_design capture

If you ran the parallel capture, transfer images by reading `imageHash` from captured nodes and applying to your target frames.

### Step 6: Updating an Existing View


1. Use `get_metadata` to inspect existing structure.
2. Identify sections to update vs keep.
3. Locate existing nodes by ID/name.
4. Swap component instances, update text/variants/layout.
5. Validate with `get_screenshot` after each modification.

## Reference Docs (upstream)

From **figma-use** references folder: `component-patterns.md`, `variable-patterns.md`, `text-style-patterns.md`, `effect-style-patterns.md`, `gotchas.md`.

## Best Practices

* **Always search before building** — the design system likely has what you need.
* **Search broadly** — synonyms, partial terms.
* **Prefer design system tokens over hardcoded values.**
* **Prefer component instances over manual builds.**
* **Work section by section** — never more than one major section per `use_figma` call.
* **Return node IDs from every call.**
* **Validate visually after each section.**
* **Match existing conventions.**