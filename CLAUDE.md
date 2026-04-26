# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Typst-based category theory diagram collection. Each subdirectory contains a `fig.typ` file that renders a category theory diagram (commutative diagrams, products, etc.) to PNG.

## Key Commands

```bash
# Scaffold a new diagram project
sh create.sh <project-name>

# Compile a diagram to PNG
sh compile.sh <project-name>
```

## Typst Packages Used

- `@preview/commute:0.3.0` — commutative diagram DSL (`commutative-diagram`, `node`, `arr`)
- `@preview/fletcher:0.5.7` — general diagram drawing (`diagram`, `edge`, `node`)

## Conventions

- Every `fig.typ` starts with `#set page(width: auto, height: auto, margin: 5pt)` so output is tightly cropped.
- The scaffolding script (`create.sh`) validates `root.txt` content to confirm it is run from the project root.
- Template for new diagrams lives in `.template/fig.typ`.
- PDFs are gitignored; PNGs are committed.
