# figma-code-connect

---

## name: figma-code-connect description: Creates and maintains Figma Code Connect template files that map Figma components to code snippets. Use when the user mentions Code Connect, Figma component mapping, design-to-code translation, or asks to create/update .figma.ts or .figma.js files. disable-model-invocation: false

# Code Connect

## Overview

Create Code Connect template files (`.figma.ts`) that map Figma components to code snippets. Given a Figma URL, follow the steps below to create a template.

> **Note:** This skill covers **template files only** — `.figma.ts` files that use the MCP tools to fetch component context from Figma. Parser-based `.figma.tsx` files (using `figma.connect()`, published via CLI) are different.

## Prerequisites

* **Figma MCP server must be connected**
* **Components must be published** to a Figma team library
* **Organization or Enterprise plan required** — not available on Free or Professional
* **URL must include** `**node-id**`
* **TypeScript types** — add `@figma/code-connect/figma-types` to `types` in `tsconfig.json`

## Step 1: Parse the Figma URL

Extract `fileKey` and `nodeId`:

| URL Format | fileKey | nodeId |
|------------|---------|--------|
| `figma.com/design/:fileKey/:name?node-id=X-Y` | `:fileKey` | `X-Y` → `X:Y` |
| `figma.com/design/:fileKey/branch/:branchKey/:name` | use `:branchKey` | from `node-id` param |

Always convert `nodeId` hyphens to colons.

## Step 2: Discover Unmapped Components

Call `get_code_connect_suggestions` with `fileKey`, `nodeId`, `excludeMappingPrompt: true`.

**Handle the response:**

* **No published components found** — user must publish first, then stop.
* **All already connected** — inform user and stop.
* **Normal response** — extract `mainComponentNodeId` for each component. Repeat Steps 3–6 for each.

## Step 3: Fetch Component Properties

Call `get_context_for_code_connect` with `fileKey`, the resolved `nodeId`, `clientFrameworks`, `clientLanguages`.

Property types:

* **TEXT** — text content (labels, titles)
* **BOOLEAN** — toggles
* **VARIANT** — enum options (size, variant, state)
* **INSTANCE_SWAP** — swappable nested instance
* **SLOT** — freeform content region (use `getSlot()`)

## Step 4: Identify the Code Component


1. Check `figma.config.json` for `paths` and `importPaths`
2. Search the codebase for matching component
3. Compare props interface against Figma properties
4. Pick closest match, explain reasoning
5. If no match found, show 2 closest candidates, ask user

**Confirm with the user** before proceeding to Step 5.

## Step 5: Create the Template File (.figma.ts)

### File location

Place alongside existing Code Connect templates. Check `figma.config.json` `include` patterns.

### Template structure

```ts
// url=https://www.figma.com/file/{fileKey}/{fileName}?node-id={nodeId}
// source={path to code component}
// component={code component name}
import figma from 'figma'
const instance = figma.selectedInstance

// Extract properties from Figma
// ...

export default {
  example: figma.code`<Component ... />`,       // Required
  imports: ['import { Component } from "..."'], // Optional
  id: 'component-name',                         // Required
  metadata: {
    nestable: true,
    props: {}
  }
}
```

### Property mapping

| Figma Property Type | Template Method |
|---------------------|-----------------|
| TEXT                | `instance.getString('Name')` |
| BOOLEAN             | `instance.getBoolean('Name', { true: ..., false: ... })` |
| VARIANT             | `instance.getEnum('Name', { 'FigmaVal': 'codeVal' })` |
| INSTANCE_SWAP       | `instance.getInstanceSwap('Name')` (then `executeTemplate()`) |
| SLOT                | `instance.getSlot('Name')` |
| (child layer)       | `instance.findInstance('LayerName')` |
| (text layer)        | `instance.findText('LayerName')` → `.textContent` |

### Exhaustive variant handling

When a VARIANT property has multiple values, the `getEnum` mapping **must list every value**. Unmapped values silently return `undefined`.

```ts
// CORRECT — every value is mapped
const status = instance.getEnum('Status', {
  'Success': 'success',
  'Error': 'error',
  'Warning': 'warning',
  'Info': 'info',
})
```

When **two or more VARIANT properties combine** to produce different code output, generate exhaustive conditional branches (2x2 = 4 branches).

### Interpolation in tagged templates

* **String values** (`getString`, `getEnum`): wrap in quotes → `variant="${variant}"`
* **Instance/section values** (`executeTemplate().example`): wrap in braces → `icon={${iconCode}}`
* **Slot sections** (`getSlot()`): interpolate directly inside `` figma.code`...` ``
* **Boolean bare props**: use conditional → `${disabled ? 'disabled' : ''}`

### Nested configurable instances

A component may contain child instances that are not exposed as component properties but are still configurable.


1. **Check whether the child already has a Code Connect template**
2. **If no template exists, create one** for the child
3. **Reference the child** using `findInstance()` or `findConnectedInstance()`, then call `executeTemplate()`

```ts
const badge = instance.findInstance('Status Badge')
let badgeCode
if (badge && badge.type === 'INSTANCE') {
  badgeCode = badge.executeTemplate().example
}
```

## Step 6: Validate

Read back the `.figma.ts` file and verify:

* **Property coverage** — every Figma property accounted for
* **Valid, correctly typed code** — against the code component's `Props` interface
* **No hardcoded children** — every nested instance uses dynamic APIs
* **Rules and Pitfalls** respected
* **Interpolation wrapping** correct

## Rules and Pitfalls


1. **Never string-concatenate template results.** `executeTemplate().example` is a `ResultSection[]`, not a string. Always interpolate: `` figma.code`${snippet1}${snippet2}` ``
2. **Do not use** `**hasCodeConnect()**` **guards.** Call `executeTemplate()` directly after a `type === 'INSTANCE'` check.
3. **Check** `**type === 'INSTANCE'**` **before** `**executeTemplate()**`**.** Finders return `ErrorHandle` on failure (truthy but not real).
4. **Prefer** `**getInstanceSwap()**` **over** `**findInstance()**` when a component property exists.
5. **Use** `**getSlot()**` **only when the Figma property type is** `**SLOT**`**.** Not for INSTANCE_SWAP.
6. **Property names are case-sensitive.**
7. **Handle multiple template arrays correctly.** Use separate variables, not `.map().join()`.
8. **Never hardcode slot or children content.** Always resolve dynamically.
9. **Attempt to represent every Figma property via a code prop.** Omit if no code prop fits — never invent.

## Quick Reference: `instance.*` Methods

| Method | Returns |
|--------|---------|
| `getString(propName)` | `string` |
| `getBoolean(propName, mapping?)` | `boolean \| any` |
| `getEnum(propName, mapping)` | `any`   |
| `getInstanceSwap(propName)` | `InstanceHandle \| null` |
| `getSlot(propName)` | `ResultSection[] \| undefined` |
| `findInstance(layerName, opts?)` | `InstanceHandle \| ErrorHandle` |
| `findText(layerName, opts?)` | `TextHandle \| ErrorHandle` |
| `findConnectedInstance(id, opts?)` | `InstanceHandle \| ErrorHandle` |
| `findLayers(selector, opts?)` | `(InstanceHandle \| TextHandle)[]` |

## Complete Worked Example

Given URL: `https://figma.com/design/abc123/MyFile?node-id=42-100`

**Step 5 result —** `**src/figma/primitives/Button.figma.ts**`**:**

```ts
// url=https://figma.com/design/abc123/MyFile?node-id=42-100
// source=src/components/Button.tsx
// component=Button
import figma from 'figma'
const instance = figma.selectedInstance

const label = instance.getString('Label')
const variant = instance.getEnum('Variant', {
  'Primary': 'primary',
  'Secondary': 'secondary',
})
const size = instance.getEnum('Size', {
  'Small': 'sm', 'Medium': 'md', 'Large': 'lg',
})
const disabled = instance.getBoolean('Disabled')
const hasIcon = instance.getBoolean('Has Icon')
const icon = hasIcon ? instance.getInstanceSwap('Icon') : null
let iconCode
if (icon && icon.type === 'INSTANCE') {
  iconCode = icon.executeTemplate().example
}

export default {
  example: figma.code`
    <Button
      variant="${variant}"
      size="${size}"
      ${disabled ? 'disabled' : ''}
      ${iconCode ? figma.code`icon={${iconCode}}` : ''}
    >
      ${label}
    </Button>
  `,
  imports: ['import { Button } from "primitives"'],
  id: 'button',
  metadata: { nestable: true }
}
```

## Additional Reference (upstream)

* **api.md** — Full Code Connect API reference
* **advanced-patterns.md** — Advanced nesting, metadata props, descendant patterns