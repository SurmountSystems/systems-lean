# ProductPath long-file split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/ProductPath.lean` | 864 | **667** (-197) |
| `src/systems/SystemsLean/ProductPathBars.lean` | (new) | **254** |

Parent under 700. Seam is path-bar split (not dual-pin, not tip).

## Stay / move

| Stay on ProductPath | Moved to ProductPathBars |
|---------------------|--------------------------|
| Module header + greppable stage / close ids | `freestandingUnitProductPathReady` |
| Surface string cites + `productPathSurfaceOk` | `freestandingProgramProductPathReady` |
| residualFreeClaimed / productSelfHostCompleteClaimed | `freestandingEmitProductPathReady` |
| `productPathReady` compose + does-not-* honesty | join / self-host / matrix path bars |
| Close ladder (closeSurface / ladderClosed / closeReady) | dual unit aliases |
| Theorems + PRODUCT-PATH-SMOKE / CLOSE-SMOKE | `freestandingProductPathReady` joint fold |
| Import `ProductPathBars` + prior deps | Same namespace `SystemsLean.ProductPath` |

## Coherence

- One seam: freestanding path-bar assembly vs surface / joint ready / ladder close / theorems / smoke.
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.
- Lake discovers Bars via ProductPath import (no SystemsLean.lean root change required).

## Gates touched

- `nix/systems-host-presence/host-leans.nix` -- ProductPathBars path
- `nix/systems-host-presence/required-files.nix` -- ProductPathBars path
- `nix/systems-host-presence/specs.nix` -- parent cites ProductPathBars; new Bars hostSpecs row

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.
