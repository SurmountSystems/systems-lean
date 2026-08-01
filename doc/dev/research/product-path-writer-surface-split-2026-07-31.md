# ProductPathWriterSurface long-file split (2026-07-31)

**Kind: analysis only. Not residual.**

## Summary

Long-file module split of cold primary `ProductPathWriterSurface.lean` along the
same theorem/smoke seam used for `ProductPathPerformStep` and siblings.

| Path | Before | After |
|------|--------|-------|
| `ProductPathWriterSurface.lean` | 147 | **134** (-13) |
| `ProductPathWriterSurfaceTheorems.lean` | (new) | **186** |
| `SelfApplyFs.lean` tip | 1912 | **1914** (import +1 only; +2 lines with smoke comment) |

## Seam

| Module | Owns |
|--------|------|
| **Parent** `ProductPathWriterSurface` | Stage/host/self ids; plan/apply/body API + ownership cites; B-bar Out API cites; Ok / PartialReady folds; greppable theorem cite strings in header |
| **Theorems** `ProductPathWriterSurfaceTheorems` | WRITER-SURFACE-THEOREM / HOST-WRITER-SURFACE-THEOREM; WRITER-SURFACE-SMOKE / HOST-WRITER-SURFACE-SMOKE; `PartialReady_true`, `Ok_true`, stage/fn `_eq`, API/ownership pins, examples |

Same namespace `SystemsLean.ProductPathWriterSurface`. Parent does **not** import
Theorems (cycle). SelfApplyFs imports Theorems after parent for tip load order.

## Registration

- `nix/systems-host-presence/{required-files,host-leans,specs}.nix` -- Theorems path + hostSpec block
- `nix/systems-emit-wire/emit-product.nix` -- parent tokens keep greppable theorem cite + Theorems module name
- `src/systems/host-partial-inventory.md` -- row notes Theorems companion

## Gates (observed green)

- `lake build SystemsLean.ProductPathWriterSurface SystemsLean.ProductPathWriterSurfaceTheorems SystemsLean.SelfApplyFs`
- `just hygiene`
- `just systems-host`
- `just systems-emit-wire`

## Claims preserved

- complete true (tip / SelfHostComplete)
- free / llvm / PROVABLY false

## Next Open

Largest never-split cold primary by live `wc -l` after this slice:
**ProductPathWriterPathPlan.lean** (**143**). Skip tip, CompilePath*, role
scaffolds, already-split-once primaries. Then BootstrapHonesty **142**,
ProductPathOwnershipInputs **141**, ProductPathPerform **137**.

## Join

`/tmp/grok-1000/grok-impl-product-path-writer-surface-split.md`
