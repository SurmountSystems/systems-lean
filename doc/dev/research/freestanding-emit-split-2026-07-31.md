# FreestandingEmit long-file split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/FreestandingEmit.lean` | 1069 | **439** (-630) |
| `src/systems/SystemsLean/FreestandingEmitLoad.lean` | (new) | **622** |

Parent under 1000. Seam is load-helper split (not dual-pin, not tip).

## Stay / move

| Stay on FreestandingEmit | Moved to FreestandingEmitLoad |
|--------------------------|-------------------------------|
| Short module header + greppable HOST-EMIT / Dual SSOT pins | Full SSOT loaders (`loadBodySsot` .. `loadApplySsot`) |
| `renderHeader` / `renderSource` | `*Ssot` structures (Body..Apply) |
| `validateProduct` | String helpers (`containsStr`, `ssotGet`, `ssotBlock`, ...) |
| `emitAtRoot` / `filterArgs` / `main` | Dual SSOT defs (`dualSsotBlockEqual`, `requireDualSsotEqual`, `dualSsotEqualityLive`) |
| Emit* fragment equality cites in `emitAtRoot` | `stageId`, `red`, `requireFile`, `requireToken`, `embedPlaceholderLine` |
| Import `FreestandingEmitLoad` + Emit* | Same namespace `SystemsLean.FreestandingEmit` |

## Coherence

- One seam: SSOT load + shared helpers vs render/write CLI.
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.
- Lake discovers Load via FreestandingEmit import (no SystemsLean.lean root change).

## Gates touched

- `nix/systems-emit-wire/emit-product.nix` -- required path + contentSpecs + writer token split
- `nix/systems-emit-wire/default.nix` / `specs.nix` -- load path scans
- `nix/systems-host-presence/{host-leans,required-files,host-specs-core}.nix` -- Load presence

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.
