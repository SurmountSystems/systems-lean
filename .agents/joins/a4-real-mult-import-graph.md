# Join: A4 Real Mult import graph

**Status:** IMPLEMENT complete + residual lockstep; verify gates (lake + without-lake recipe + hygiene + systems-host) for full GREEN
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` A4 / design S2 Import graph

## Goal met

Beyond package roots list and HostGraph dialect goldens: resolve import
closure for a **real** Mult seed set (`SystemsLean/Mult.lean` + companion
`MultTheorems.lean`) **without calling Lake on the measured step**. Missing
import and cycle fail closed. HostResidualShrink cites coverage. DualResidual
host residual remains true / free claimed false **unchanged**. free/complete/
PROVABLY and product Lake pins **unchanged**.

## Done when checklist

| Item | Evidence |
|------|----------|
| Measured path without Lake on that step | `just host-import-graph-without-lake` (prebuilt `.lake/build/bin/slake-host-import-graph`; no lake build/exe/env on hot path) |
| Loads/walks Mult real import edges | Driver reads `src/systems/SystemsLean/Mult.lean` + `MultTheorems.lean`; `extractImports` package-local `import SystemsLean.*`; Mult leaf 0 edges; MultTheorems imports SystemsLean.Mult |
| Fail-closed missing / cycle | Structural `hostImportGraphBadMissing` -> MISSING-IMPORT; `hostImportGraphBadCycle` -> IMPORT-CYCLE; driver re-checks both before disk walk |
| Module list documented | `hostImportGraphSeedModules` / seed paths dual-pin; driver prints topo order |
| HostResidualShrink reseed | `measuredHostLakeFreeImportGraph = "host-import-graph-without-lake"`; `hostImportGraphMultSeedDualOk = true`; folded into `hostDevelopMeasuredPathsLakeFreeEvidence` / `hostResidualShrinkReady` |
| DualResidual unchanged | No edit to DualResidual; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| Residual lockstep | RESIDUAL-systems Done A4 + Open **First real host module check**; RESIDUAL.md; WATCHER; SESSION-HANDOFF; self-host living tip; design queue A4 done |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | **New** real Mult seed import graph: extractImports + resolveImportGraph; Mult+MultTheorems dual-pin; fail-closed missing/cycle; without-Lake pins; theorems/smoke; disk walk driver |
| `src/systems/SystemsLean/HostImportGraphMain.lean` | **New** thin lake exe main |
| `src/systems/SystemsLean.lean` | Import HostImportGraph |
| `src/systems/lakefile.lean` | `lean_exe "slake-host-import-graph"`; inventory 50 |
| `src/systems/SystemsLean/HostResidualShrink.lean` | A4 recipe + dual-ok pins in evidence inventory |
| `just/host-without-lake.just` | `host-import-graph` + `host-import-graph-without-lake` |
| `just/host.just` | `host-residual-shrink` greps A4 tokens + recipe presence |
| `nix/systems-host-presence/required-files.nix` | dual-pin new modules |
| `nix/systems-host-presence/host-leans.nix` | dual-pin new modules |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | HostImportGraph + Main + HostResidualShrink A4 tokens |
| `RESIDUAL-systems.md` | A4 Done; Open First real host module check |
| `RESIDUAL.md` | Systems Open table A4 done / A5 open |
| `WATCHER.md` | next `/implement` First real host module check |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual reseed; module count 266 |
| `src/systems/self-host.md` | Living tip A4 done + next Name |
| `doc/dev/research/full-host-elaborator-design-2026-08-03.md` | A4 queue row done cite |
| `.agents/plans/plan-slake-replaces-lake.md` | A4 done; A5+ next |

## Surface summary

- **Seed set (real host Lean, not dialect goldens):**
  - `SystemsLean.Mult` -> `src/systems/SystemsLean/Mult.lean` (no package-local imports)
  - `SystemsLean.MultTheorems` -> `src/systems/SystemsLean/MultTheorems.lean` (`import SystemsLean.Mult`)
- **Resolve:** Kahn topo; accept ordered modules; reject MISSING-IMPORT / IMPORT-CYCLE / EMPTY-GRAPH / DUP-MODULE
- **Bootstrap:** one-time `lake build slake-host-import-graph` still required after clean (same honesty as other foundation without-Lake bins)
- **Not claimed:** full ~256-module graph; module body elaborate (A5); host free; Lake gone

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean.

## Gates (operator / implementer verify)

```bash
cd /home/hunter/Projects/ai/iso
# Bootstrap once (not measured hot path):
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostImportGraphMain SystemsLean.HostResidualShrink slake-host-import-graph)
just host-import-graph-without-lake
just host-residual-shrink
just hygiene
just systems-host   # dual-pin presence (flake sees tracked files only until HITL stage)
```

Claim-bool DualResidual free was **not** flipped (lake claim-flip bar N/A for free).
HostResidualShrink structural pin edits still want lake elaborator proof on that package.

## Open next

**First real host module check** (A5 / design S3) -- checkable Done when on residual.

## Watcher next prompt

```
/implement --effort 1 First real host module check
```

(see `WATCHER.md` for full body)
