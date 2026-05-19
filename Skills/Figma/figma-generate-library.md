# figma-generate-library

---

## name: figma-generate-library description: "Build or update a professional-grade design system in Figma from a codebase. Use when the user wants to create variables/tokens, build component libraries, set up theming (light/dark modes), document foundations, or reconcile gaps between code and Figma. This skill teaches WHAT to build and in WHAT ORDER — it complements the `figma-use` skill which teaches HOW to call the Plugin API. Both skills should be loaded together." disable-model-invocation: false

# Design System Builder — Figma MCP Skill

Build professional-grade design systems in Figma that match code. This skill orchestrates multi-phase workflows across 20–100+ `use_figma` calls, enforcing quality patterns from real-world design systems (Material 3, Polaris, Figma UI3, Simple DS).

**Prerequisites**: The `figma-use` skill MUST also be loaded for every `use_figma` call.

**Always pass** `**skillNames: "figma-generate-library"**` **when calling** `**use_figma**` **as part of this skill.**

## 1. The One Rule That Matters Most

**This is NEVER a one-shot task.** Building a design system requires 20–100+ `use_figma` calls across multiple phases, with mandatory user checkpoints between them. Break every operation to the smallest useful unit, validate, get feedback, proceed.

## 2. Mandatory Workflow

Every design system build follows this phase order. Skipping or reordering phases causes structural failures.

```
Phase 0: DISCOVERY (always first — no use_figma writes yet)
  0a. Analyze codebase → extract tokens, components, naming conventions
  0b. Inspect Figma file → pages, variables, components, styles, existing conventions
  0c. Search subscribed libraries → use search_design_system for reusable assets
  0d. Lock v1 scope → agree on exact token set + component list before any creation
  0e. Map code → Figma → resolve conflicts (code and Figma disagree = ask user)
  ✋ USER CHECKPOINT: present full plan, await explicit approval

Phase 1: FOUNDATIONS (tokens first — always before components)
  1a. Create variable collections and modes
  1b. Create primitive variables (raw values, 1 mode)
  1c. Create semantic variables (aliased to primitives, mode-aware)
  1d. Set scopes on ALL variables
  1e. Set code syntax on ALL variables
  1f. Create effect styles (shadows) and text styles (typography)
  ✋ USER CHECKPOINT: show variable summary, await approval

Phase 2: FILE STRUCTURE (before components)
  2a. Create page skeleton: Cover → Getting Started → Foundations → --- → Components → --- → Utilities
  2b. Create foundations documentation pages
  ✋ USER CHECKPOINT: show page list + screenshot, await approval

Phase 3: COMPONENTS (one at a time — never batch)
  For EACH component (atoms before molecules):
    3a. Create dedicated page
    3b. Build base component with auto-layout + full variable bindings
    3c. Create all variant combinations (combineAsVariants + grid layout)
    3d. Add component properties (TEXT, BOOLEAN, INSTANCE_SWAP)
    3e. Link properties to child nodes
    3f. Add page documentation (title, description, usage notes)
    3g. Validate: get_metadata + get_screenshot
    3h. Optional: lightweight Code Connect mapping
    ✋ USER CHECKPOINT per component: show screenshot, await approval

Phase 4: INTEGRATION + QA (final pass)
  4a. Finalize all Code Connect mappings
  4b. Accessibility audit (contrast, min touch targets, focus visibility)
  4c. Naming audit (no duplicates, no unnamed nodes, consistent casing)
  4d. Unresolved bindings audit (no hardcoded fills/strokes remaining)
  4e. Final review screenshots of every page
  ✋ USER CHECKPOINT: complete sign-off
```

## 3. Critical Rules

**Plugin API basics** (from `figma-use` skill):

* Use `return` to send data back. Do NOT wrap in IIFE or call `closePlugin`.
* Return ALL created/mutated node IDs in every return value
* Page context resets each call — always `await figma.setCurrentPageAsync(page)` at start
* `figma.notify()` throws — never use it
* Colors are 0–1 range, not 0–255
* Font MUST be loaded before any text write: `await figma.loadFontAsync({family, style})`

**Design system rules**:


 1. **Variables BEFORE components** — components bind to variables. No token = no component.
 2. **Inspect before creating** — run read-only `use_figma` to discover existing conventions. Match them.
 3. **One page per component** (default)
 4. **Bind visual properties to variables** (default) — fills, strokes, padding, radius, gap.
 5. **Scopes on every variable** — NEVER leave as `ALL_SCOPES`. Background: `FRAME_FILL, SHAPE_FILL`. Text: `TEXT_FILL`. Border: `STROKE_COLOR`. Spacing: `GAP`. Radii: `CORNER_RADIUS`. Primitives: `[]` (hidden).
 6. **Code syntax on every variable** — WEB syntax MUST use the `var()` wrapper: `var(--color-bg-primary)`.
 7. **Alias semantics to primitives** — never duplicate raw values in semantic layer.
 8. **Position variants after combineAsVariants** — they stack at (0,0).
 9. **INSTANCE_SWAP for icons** — never create a variant per icon. Cap variant matrices at 30 combinations.
10. **Deterministic naming** — use consistent, unique node names.
11. **No destructive cleanup** — cleanup scripts identify nodes by name convention or returned IDs.
12. **Validate before proceeding** — never build on unvalidated work.
13. **NEVER parallelize** `**use_figma**` **calls** — Figma state mutations must be strictly sequential.
14. **Never hallucinate Node IDs** — always read IDs from the state ledger.
15. **Use the helper scripts** — embed scripts from `scripts/` into your use_figma calls.
16. **Explicit phase approval** — "looks good" is not approval to proceed to Phase 3.

## 4. State Management (Required for Long Workflows)

> `**getPluginData()**` **/** `**setPluginData()**` **are NOT supported in** `**use_figma**`**.** Use `getSharedPluginData()` / `setSharedPluginData()` instead.

Tag every created scene node immediately after creation:

```javascript
node.setSharedPluginData('dsb', 'run_id', RUN_ID);
node.setSharedPluginData('dsb', 'phase', 'phase3');
node.setSharedPluginData('dsb', 'key', 'component/button');
```

**State persistence**: Do NOT rely solely on conversation context for the state ledger. Write it to disk: `/tmp/dsb-state-{RUN_ID}.json`

**Idempotency check** before every create: query by name + state ledger ID. If exists, skip or update — never duplicate.

## 5. search_design_system — Reuse Decision Matrix

Search FIRST in Phase 0, then again immediately before each component creation.

**Reuse if** all of these are true:

* Component property API matches your needs
* Token binding model is compatible
* Naming conventions match the target file
* Component is editable

**Rebuild if** any of these:

* API incompatibility
* Token model incompatible
* Ownership issue

**Wrap if** visual match but API incompatible.

**Three-way priority**: local existing → subscribed library import → create new.

## 6. User Checkpoints

| After | Required artifacts | Ask |
|-------|--------------------|-----|
| Discovery + scope lock | Token list, component list, gap analysis | "Here's my plan. Approve before I create anything?" |
| Foundations | Variable summary   | "All tokens created. Review before file structure?" |
| File structure | Page list + screenshot | "Pages set up. Review before components?" |
| Each component | get_screenshot of component page | "Here's \[Component\] with N variants. Correct?" |
| Each conflict | Show both versions | "Code says X, Figma has Y. Which wins?" |
| Final QA | Per-page screenshots + audit report | "Complete. Sign off?" |

**If user rejects**: fix before moving on. Never build on rejected work.

## 7. Token Architecture

| Complexity | Pattern |
|------------|---------|
| < 50 tokens | Single collection, 2 modes (Light/Dark) |
| 50–200 tokens | **Standard**: Primitives (1 mode) + Color semantic (Light/Dark) + Spacing (1 mode) + Typography (1 mode) |
| 200+ tokens | **Advanced**: Multiple semantic collections, 4–8 modes |

## 8. Reference Docs (upstream `references/` folder)

* **discovery-phase.md** — codebase analysis + Figma inspection
* **token-creation.md** — variables, collections, modes, styles
* **documentation-creation.md** — cover page, foundations docs, swatches
* **component-creation.md** — any component or variant
* **code-connect-setup.md** — Code Connect or variable code syntax
* **naming-conventions.md** — variables, pages, variants, styles
* **error-recovery.md** — script failures, multi-step workflow recovery

## 9. Scripts (upstream `scripts/` folder)

Reusable Plugin API helper functions — embed in `use_figma` calls:

* `inspectFileStructure.js`, `createVariableCollection.js`, `createSemanticTokens.js`
* `createComponentWithVariants.js`, `bindVariablesToComponent.js`, `createDocumentationPage.js`
* `validateCreation.js`, `cleanupOrphans.js`, `rehydrateState.js`