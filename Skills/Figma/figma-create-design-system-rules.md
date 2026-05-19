# figma-create-design-system-rules

---

## name: figma-create-design-system-rules description: Generates custom design system rules for the user's codebase. Use when user says "create design system rules", "generate rules for my project", "set up design rules", "customize design system guidelines", or wants to establish project-specific conventions for Figma-to-code workflows. Requires Figma MCP server connection. disable-model-invocation: false

# Create Design System Rules

## Overview

This skill helps generate custom design system rules tailored to a project's specific needs. These rules guide AI coding agents to produce consistent, high-quality code when implementing Figma designs.

### Supported Rule Files

| Agent | Rule File |
|-------|-----------|
| Claude Code | `CLAUDE.md` |
| Codex CLI | `AGENTS.md` |
| Cursor | `.cursor/rules/figma-design-system.mdc` |

## What Are Design System Rules?

Project-level instructions that encode the "unwritten knowledge" of your codebase:

* Which layout primitives and components to use
* Where component files should be located
* How components should be named and structured
* What should never be hardcoded
* How to handle design tokens and styling
* Project-specific architectural patterns

## Prerequisites

* Figma MCP server must be connected
* Access to the project codebase for analysis
* Understanding of your team's component conventions

## Required Workflow

### Step 1: Run the Create Design System Rules Tool

Call the Figma MCP server's `create_design_system_rules` tool.

**Parameters:**

* `clientLanguages`: e.g., `"typescript,javascript"`, `"python"`, `"javascript"`
* `clientFrameworks`: e.g., `"react"`, `"vue"`, `"svelte"`, `"angular"`, `"unknown"`

### Step 2: Analyze the Codebase

Before finalizing rules, analyze:

**Component Organization:**

* Where are UI components located?
* Is there a dedicated design system directory?
* How are components organized? (by feature, by type, flat)

**Styling Approach:**

* What CSS framework? (Tailwind, CSS Modules, styled-components)
* Where are design tokens defined?
* Are there existing color, typography, or spacing tokens?

**Component Patterns:**

* Naming conventions (PascalCase, kebab-case, prefixes)
* Props structure
* Common composition patterns

**Architecture Decisions:**

* State management
* Routing system
* Import patterns or path aliases

### Step 3: Generate Project-Specific Rules

#### General Component Rules

```markdown
- IMPORTANT: Always use components from `[YOUR_PATH]` when possible
- Place new UI components in `[COMPONENT_DIRECTORY]`
- Follow `[NAMING_CONVENTION]` for component names
- Components must export as `[EXPORT_PATTERN]`
```

#### Styling Rules

```markdown
- Use `[CSS_FRAMEWORK/APPROACH]` for styling
- Design tokens are defined in `[TOKEN_LOCATION]`
- IMPORTANT: Never hardcode colors — always use tokens from `[TOKEN_FILE]`
- Spacing values must use the `[SPACING_SYSTEM]` scale
- Typography follows the scale defined in `[TYPOGRAPHY_LOCATION]`
```

#### Figma MCP Integration Rules

```markdown
## Figma MCP Integration Rules

### Required Flow (do not skip)

1. Run get_design_context first
2. If response too large, run get_metadata then re-fetch specific nodes
3. Run get_screenshot for visual reference
4. Download any assets needed
5. Translate React + Tailwind output into project conventions
6. Validate against Figma for 1:1 look and behavior

### Implementation Rules

- Treat Figma MCP output as a representation of design and behavior, not final code style
- Replace Tailwind utility classes with `[YOUR_STYLING_APPROACH]`
- Reuse existing components from `[COMPONENT_PATH]`
- Use the project's color system, typography scale, and spacing tokens consistently
- Respect existing routing, state management, and data-fetch patterns
- Strive for 1:1 visual parity
- Validate the final UI against the Figma screenshot
```

#### Asset Handling Rules

```markdown
## Asset Handling

- IMPORTANT: If Figma MCP server returns a localhost source, use it directly
- IMPORTANT: DO NOT import/add new icon packages — all assets in the Figma payload
- IMPORTANT: DO NOT use or create placeholders if a localhost source is provided
- Store downloaded assets in `[ASSET_DIRECTORY]`
```

### Step 4: Save Rules to the Appropriate Rule File

| Agent | Rule File | Notes |
|-------|-----------|-------|
| Claude Code | `CLAUDE.md` in project root | Markdown format |
| Codex CLI | `AGENTS.md` in project root | Append as section if file exists. 32 KiB limit. |
| Cursor | `.cursor/rules/figma-design-system.mdc` | Markdown with YAML frontmatter |

For Cursor, wrap with YAML frontmatter:

```markdown
---
description: Rules for implementing Figma designs using the Figma MCP server.
globs: "src/components/**"
alwaysApply: false
---

[Generated rules here]
```

### Step 5: Validate and Iterate


1. Test with a simple Figma component implementation
2. Verify the agent follows the rules correctly
3. Refine rules that aren't working
4. Share with team members for feedback
5. Update rules as the project evolves

## Rule Categories

### Essential Rules (Always Include)

```markdown
# Component Discovery
- UI components are located in `src/components/ui/`
- Feature components are in `src/components/features/`

# Design Token Usage
- Colors are defined as CSS variables in `src/styles/tokens.css`
- Never hardcode hex colors — use `var(--color-*)` tokens
- Spacing uses the 4px base scale: `--space-1` (4px), `--space-2` (8px), etc.

# Styling Approach
- Use Tailwind utility classes for styling
- Custom styles go in component-level CSS modules
- Theme customization is in `tailwind.config.js`
```

### Recommended Rules

```markdown
# Component Patterns
- All components must accept a `className` prop for composition
- Variant props should use union types: `variant: 'primary' | 'secondary'`

# Import Conventions
- Use path aliases: `@/components`, `@/styles`, `@/utils`
- Group imports: React, third-party, internal, types
```

### Optional Rules

```markdown
# Accessibility
- All interactive elements must have aria-labels
- Color contrast must meet WCAG AA standards
- Keyboard navigation required for all interactions
```

## Best Practices

* **Start Simple, Iterate** — capture most important conventions first
* **Be Specific** — "Always use Button from `src/components/ui/Button.tsx` with variant prop" not "Use the design system"
* **Make Rules Actionable** — tell the agent what to do, not just what to avoid
* **Use IMPORTANT for Critical Rules** — prefix rules that must never be violated
* **Document the Why** — when rules seem arbitrary, explain reasoning

## Common Issues and Solutions

### Issue: The agent isn't following the rules

**Solution:** Make rules more specific, verify file location, restart agent, add IMPORTANT prefix.

### Issue: Rules conflict with each other

**Solution:** Review for conflicts, establish hierarchy, remove redundancy, consolidate.

### Issue: Too many rules increase latency

**Solution:** Focus on the 20% solving 80% of issues. Remove overly specific rules. Combine related rules.

### Issue: Rules become outdated

**Solution:** Schedule periodic reviews. Update with architectural changes. Version control rules.