# figma-generate-diagram

---

## name: figma-generate-diagram description: "MANDATORY prerequisite — load this skill BEFORE every `generate_diagram` tool call. Routes to type-specific guidance (generic flowchart, architecture flowchart) and tells you when to proceed directly, when to use a different diagram type, or when the tool isn't the right fit at all." disable-model-invocation: false

# generate-diagram

**You MUST load this skill before every** `**generate_diagram**` **tool call.** Skipping it causes preventable rendering failures and low-quality output.

`generate_diagram` takes Mermaid.js syntax and produces an editable FigJam diagram. This skill routes you to the right per-type guidance and sets universal constraints.

## Step 1: Is `generate_diagram` the right tool?

### Supported diagram types

`flowchart`, `sequenceDiagram`, `stateDiagram` / `stateDiagram-v2`, `gantt`, `erDiagram`.

### Unsupported — don't call the tool

If the user wants any of these, tell them directly that `generate_diagram` doesn't support it instead of calling the tool and failing:

* **Pie chart, mindmap, venn diagram, class diagram, journey, timeline, quadrant, C4, git graph, requirement diagram**

### When to push the user to edit in Figma

The tool cannot:

* Change fonts on an existing diagram
* Move individual shapes
* Edit a diagram node-by-node after generation

If the user asks for any of those on an existing diagram, recommend they open the diagram in Figma and edit there. For content-level changes, it's usually faster to regenerate.

## Step 2: Pick the diagram type

Lightweight routing — use the first match.

| User wants… | Type | Next step |
|-------------|------|-----------|
| Services + datastores + queues + integrations | **Architecture flowchart** | Read `references/architecture.md` |
| Decision tree, process flow, pipeline, dependency graph, user journey | **Flowchart** | Read `references/flowchart.md` |
| Interactions between parties over time (API calls, auth, messaging) | **Sequence diagram** | Read `references/sequence.md` |
| Data model, tables, keys, cardinality | **ER diagram** | Read `references/erd.md` |
| Named states with transitions between them | **State diagram** | Read `references/state.md` |
| Project schedule with dates, milestones | **Gantt chart** | Read `references/gantt.md` |

If a flowchart is requested and it describes software infrastructure (services, datastores, queues, external integrations), route to `architecture.md` — not `flowchart.md`. When in doubt, ask the user.

## Step 3: Universal constraints (apply to every diagram type)


1. **No emojis** in any part of the Mermaid source. The tool rejects them.
2. **No** `**\\n**` in labels. Use newlines only when absolutely required and only via actual line breaks (not the escape sequence).
3. **No HTML tags** in labels.
4. **Reserved words** — don't use `end`, `subgraph`, `graph` as node IDs.
5. **Node IDs**: camelCase (`userService`), no spaces. Underscores can break edge routing in some processors.
6. **Special characters in labels** must be wrapped in quotes: `A["Process (main)"]`, `-->|"O(1) lookup"|`.
7. **Sequence diagrams** — do not use notes.
8. **Gantt charts** — do not use color styling.

## Step 4: Garbage in, garbage out

The quality of the generated diagram is bounded by the quality of the Mermaid you produce, which is bounded by the context you have. Before writing Mermaid, make sure you have enough real information to describe the subject accurately.

Useful sources of context: source code, user-provided documents (PRD, spec, transcripts), existing Figma/FigJam files, other MCP servers/tools, and the user themselves.

Don't invent edges, labels, or entities to "round out" a diagram. Missing information is better than hallucinated information — leave a gap and flag it to the user.

## Step 5: Will the diagram need more than Mermaid can express?

Mermaid can't do everything. Sticky-note annotations tied to specific nodes, per-node domain coloring on ERDs, callouts with attached data — these all require composing `generate_diagram` with `use_figma` (via the **figma-use-figjam** skill). This is the **hybrid workflow**.

It's a judgment call, not a default. Deploy it when the user's ask clearly benefits.

## Step 6: Calling the tool

Required:

* `name`: a descriptive title (shown to the user)
* `mermaidSyntax`: the Mermaid source

Optional:

* `userIntent`: a short sentence describing what the user is trying to accomplish
* `useArchitectureLayoutCode`: **only for architecture diagrams**
* `fileKey`: if the user wants the diagram added to an existing FigJam file instead of a new one

Do **not** call `create_new_file` before `generate_diagram` — the tool creates its own file.

## Step 7: After generation

* The tool returns a link the user can click to open the diagram in FigJam.
* If extensions are warranted, compose with `use_figma` now.
* If the user is dissatisfied after 2 attempts at the same diagram, stop regenerating. Ask what specifically is wrong.

### Reuse the same file when iterating

Every call to `generate_diagram` without a `fileKey` creates a new FigJam file in the user's drafts. Pass `fileKey` on subsequent calls to add diagrams to the existing file rather than creating new ones.