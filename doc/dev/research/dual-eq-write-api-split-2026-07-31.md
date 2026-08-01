# DualEqWriteApi long-file split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/DualEqWriteApi.lean` | 877 | **492** (-385) |
| `src/systems/SystemsLean/DualEqWriteLoad.lean` | (new) | **433** |

Parent under 500. Seam is load-helper split (not dual-pin, not tip).

## Stay / move

| Stay on DualEqWriteApi | Moved to DualEqWriteLoad |
|------------------------|--------------------------|
| Module header + greppable B36 honesty pins | `stageId`, `dualEqualityGateId` |
| hostId / selfHostId / recipe / exe string ids | String helpers (`containsStr`, `ssotGet`, ...) |
| Honesty bools (Measured, Present, AuthorityNotEmit, ...) | `dualSsotBlockEqual`, `requireDualSsotEqual` |
| `dualSsotEqualityLive` | `dualEqualityWriteSpecs` + load/assemble |
| `freestandingDualEqualityWriteFreestandingHc` | Body dialect load/apply |
| Ok / PartialReady / theorem / main / filterArgs | `validateDualEqualityWriteProduct` + honesty tokens |
| Import `DualEqWriteLoad` + Emit* | Same namespace `SystemsLean.DualEqWriteApi` |

## Coherence

- One seam: dual SSOT load + assemble + dialect + validate vs public write API / Ok / CLI.
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.
- Lake discovers Load via DualEqWriteApi import (no SystemsLean.lean root change).

## Gates touched

- `nix/systems-emit-wire/emit-product.nix` -- Load path + load tokens + writer DualEqWriteLoad cite
- `nix/systems-emit-wire/default.nix` / `specs.nix` -- load path scans
- `nix/systems-host-presence/{host-leans,required-files,specs}.nix` -- Load presence

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.
