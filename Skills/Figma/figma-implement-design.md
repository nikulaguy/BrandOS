# figma-implement-design

---

## name: figma-implement-design description: Translates Figma designs into production-ready application code with 1:1 visual fidelity. Use when implementing UI code from Figma files, when user mentions "implement design", "generate code", "implement component", provides Figma URLs, or asks to build components matching Figma specs. For Figma canvas writes via `use_figma`, use `figma-use`. disable-model-invocation: false

# Implement Design

## Overview

This skill provides a structured workflow for translating Figma designs into production-ready code with pixel-perfect accuracy. It ensures consistent integration with the Figma MCP server, proper use of design tokens, and 1:1 visual parity with designs.

## Skill Boundaries

* Use this skill when the deliverable is code in the user's repository.
* If the user asks to create/edit/delete nodes inside Figma itself, switch to **figma-use**.
* If the user asks to build or update a full-page screen in Figma from code or a description, switch to **figma-generate-design**.
* If the user asks only for Code Connect mappings, switch to **figma-code-connect**.
* If the user asks to author reusable agent rules (`CLAUDE.md`/`AGENTS.md`), switch to **figma-create-design-system-rules**.

## Prerequisites

* Figma MCP server must be connected and accessible
* User must provide a Figma URL in the format: `https://figma.com/design/:fileKey/:fileName?node-id=1-2`
* **OR** when using `figma-desktop` MCP: User can select a node directly in the Figma desktop app (no URL required)
* Project should have an established design system or component library (preferred)

## Required Workflow

**Follow these steps in order. Do not skip steps.**

### Step 1: Get Node ID

#### Option A: Parse from Figma URL

When the user provides a Figma URL, extract the file key and node ID to pass as arguments to MCP tools.

**URL format:** `https://figma.com/design/:fileKey/:fileName?node-id=1-2`

**Extract:**

* **File key:** `:fileKey` (the segment after `/design/`)
* **Node ID:** `1-2` (the value of the `node-id` query parameter)

#### Option B: Use Current Selection from Figma Desktop App (figma-desktop MCP only)

When using the `figma-desktop` MCP and the user has NOT provided a URL, the tools automatically use the currently selected node from the open Figma file in the desktop app.

### Step 2: Fetch Design Context

Run `get_design_context` with the extracted file key and node ID.

```
get_design_context(fileKey=":fileKey", nodeId="1-2")
```

This provides the structured data including layout properties, typography specifications, color values and design tokens, component structure and variants, spacing and padding values.

**If the response is too large or truncated:** Run `get_metadata` to get the high-level node map, then fetch individual child nodes with `get_design_context`.

### Step 3: Capture Visual Reference

Run `get_screenshot` with the same file key and node ID for a visual reference.

### Step 4: Download Required Assets

**IMPORTANT:** Follow these asset rules:

* If the Figma MCP server returns a `localhost` source for an image or SVG, use that source directly
* DO NOT import or add new icon packages — all assets should come from the Figma payload
* DO NOT use or create placeholders if a `localhost` source is provided

### Step 5: Translate to Project Conventions

**Key principles:**

* Treat the Figma MCP output (typically React + Tailwind) as a representation of design and behavior, not as final code style
* Replace Tailwind utility classes with the project's preferred utilities or design system tokens
* Reuse existing components instead of duplicating functionality
* Use the project's color system, typography scale, and spacing tokens consistently

### Step 6: Achieve 1:1 Visual Parity

**Guidelines:**

* Prioritize Figma fidelity to match designs exactly
* Avoid hardcoded values — use design tokens from Figma where available
* When conflicts arise between design system tokens and Figma specs, prefer design system tokens but adjust spacing or sizes minimally to match visuals
* Follow WCAG requirements for accessibility

### Step 7: Validate Against Figma

**Validation checklist:**

- [ ] Layout matches (spacing, alignment, sizing)
- [ ] Typography matches (font, size, weight, line height)
- [ ] Colors match exactly
- [ ] Interactive states work as designed (hover, active, disabled)
- [ ] Responsive behavior follows Figma constraints
- [ ] Assets render correctly
- [ ] Accessibility standards met

## Implementation Rules

### Component Organization

* Place UI components in the project's designated design system directory
* Follow the project's component naming conventions
* Avoid inline styles unless truly necessary for dynamic values

### Design System Integration

* ALWAYS use components from the project's design system when possible
* Map Figma design tokens to project design tokens
* When a matching component exists, extend it rather than creating a new one
* Document any new components added to the design system

### Code Quality

* Avoid hardcoded values — extract to constants or design tokens
* Keep components composable and reusable
* Add TypeScript types for component props
* Include JSDoc comments for exported components

## Best Practices

* **Always Start with Context** — Never implement based on assumptions. Always fetch `get_design_context` and `get_screenshot` first.
* **Incremental Validation** — Validate frequently during implementation, not just at the end.
* **Document Deviations** — If you must deviate from the Figma design (e.g., for accessibility or technical constraints), document why in code comments.
* **Reuse Over Recreation** — Always check for existing components before creating new ones.
* **Design System First** — When in doubt, prefer the project's design system patterns over literal Figma translation.

## Common Issues and Solutions

### Issue: Figma output is truncated

**Solution:** Use `get_metadata` to get the node structure, then fetch specific nodes individually with `get_design_context`.

### Issue: Design doesn't match after implementation

**Solution:** Compare side-by-side with the screenshot from Step 3. Check spacing, colors, and typography values in the design context data.

### Issue: Assets not loading

**Solution:** Verify the Figma MCP server's assets endpoint is accessible. Use `localhost` URLs directly without modification.

### Issue: Design token values differ from Figma

**Solution:** When project tokens differ from Figma values, prefer project tokens for consistency but adjust spacing/sizing to maintain visual fidelity.

## Additional Resources

* [Figma MCP Server Documentation](https://developers.figma.com/docs/figma-mcp-server/)
* [Figma MCP Server Tools and Prompts](https://developers.figma.com/docs/figma-mcp-server/tools-and-prompts/)
* [Figma Variables and Design Tokens](https://help.figma.com/hc/en-us/articles/15339657135383-Guide-to-variables-in-Figma)