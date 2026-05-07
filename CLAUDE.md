# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

OpenSCAD source for 3D-printable parts for a 2024 Winnebago Ekko (Ford Transit) motorhome. Each design is a parametric `.scad` file that compiles to STL files for printing. Tasks here are 3D modeling tasks ("round these corners," "add a screw hole," "make the wall thicker"), not application code — the deliverable is geometry that prints correctly and fits a real physical part.

## Repo structure

Each design lives in its own top-level directory (e.g. `shade-clips/`, `bathroom-fan-mount/`) containing:

- `<name>.scad` — the parametric design source. Tunable parameters at the top, modules below, a final dispatch block at the bottom keyed on a `TARGET` variable.
- `.toys.rb` — defines [Toys](https://dazuma.github.io/toys/) tool `toys build` that builds STL files for that design. Expands a template defined under `.toys/.extern/build-generator.rb` at the repo root.
- `README.md` — user-facing description of the part and how to print/use it.
- One `.stl` file per target — committed build outputs that end users print directly.

The `TARGET` convention is the dispatch mechanism for every design: the `.scad` file branches on `TARGET == "..."` to render either the full layout (for visualization) or one specific printable component (for STL export). Always keep `add_targets` in `.toys.rb` in sync with the `TARGET ==` branches in the `.scad` file when adding or renaming components.

## Common commands

Building STLs (run from the design directory, not the repo root):

```sh
cd shade-clips
toys build                    # rebuild every STL in this design
toys build clip-long pillar   # rebuild specific targets
toys build --text "Custom"    # override the engraved text via -D TEXT_STRING
```

After regenerating STL files, commit them — they are checked in as the printable artifacts users consume.

Repo-wide cleanup:

```sh
toys clean    # respects .gitignore; preserves .claude/plans and .claude/settings.local.json
```

## Visual verification — `toys render`

Geometry changes are not verified by tests; they are verified by looking at the rendered model. Before declaring a geometry change done, render it and check the result.

```sh
toys render shade-clips/shade-clips.scad                  # all detected TARGETs, all 4 angles
toys render shade-clips/shade-clips.scad -t clip-long     # one target, all angles
toys render shade-clips/shade-clips.scad -a iso           # all targets, one angle
toys render shade-clips/shade-clips.scad -t pillar -a top # one specific render
```

PNGs land in `tmp/render/` at the repo root (gitignored). The tool auto-detects `TARGET` values by parsing the `.scad` file, uses `--viewall --autocenter` so framing is automatic, and renders four standard angles (iso, top, front, side). Run `toys render --help` for the full flag list.

This tool is a development aid for Claude (and humans) doing visual review — it is not part of the build pipeline and STLs do not depend on it. **If you find yourself wanting capabilities `toys render` doesn't have (section views, side-by-side before/after diffing, per-module isolation, different camera presets, etc.), propose extending the tool (`.toys/render.rb`) rather than working around it with one-off `openscad` invocations.** The tool exists specifically so improvements accumulate in one place.

## Working effectively on geometry

- For non-trivial changes, render before and after and compare. Subtle bugs (a `difference()` that no longer subtracts what you think, a `translate()` that drifted by `EPSILON`, a corner that lost its fillet) are obvious in a render and invisible in a diff.
- Most designs use a small `EPSILON` constant to make union/difference overlaps robust against floating-point edge cases. Preserve this idiom when adding new boolean operations.
- `$fn` (or per-module `$fn=CIRCLE_SIDES`) controls curve smoothness. Designs typically expose this as a top-level parameter; respect it rather than hardcoding values inside modules.
- Fit-critical dimensions (screw radii, hole spacings, mating clearances) often have comments explaining the tolerance reasoning. Read those comments before adjusting — they encode physical-world constraints that aren't recoverable from the code alone.
- You cannot test print fit; only the user can. When a change affects fit, say so explicitly and flag what to verify on the next print.
