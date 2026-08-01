# ProductPathPerformStep long-file split (2026-07-31)

**Kind: analysis only. Not residual.**

## Summary

Long-file module split of cold primary `ProductPathPerformStep.lean` along the
same theorem/smoke seam used for `ProductPathWriterPathExec` and siblings.

| Path | Before | After |
|------|--------|-------|
| `ProductPathPerformStep.lean` | 152 | **147** (-5) |
| `ProductPathPerformStepTheorems.lean` | (new) | **165** |
| `SelfApplyFs.lean` tip | 1911 | **1912** (import +1 only) |

## Seam

| Module | Owns |
|--------|------|
| **Parent** `ProductPathPerformStep` | Stage/host/self ids; gap + recipe cites; Ok / PartialReady folds; greppable theorem cite strings in header |
| **Theorems** `ProductPathPerformStepTheorems` | PERFORM-STEP-THEOREM / HOST-PERFORM-STEP-THEOREM; PERFORM-STEP-SMOKE / HOST-PERFORM-STEP-SMOKE; `PartialReady_true`, `Ok_true`, stage/fn `_eq`, entrypoint pins, examples |

Same namespace `SystemsLean.ProductPathPerformStep`. Parent does **not** import
Theorems (cycle). SelfApplyFs imports Theorems after parent for tip load order.

## Registration

- `nix/systems-host-presence/{required-files,host-leans,specs}.nix` -- Theorems path + hostSpec block
- `nix/systems-emit-wire/emit-product.nix` -- parent tokens keep greppable theorem cite + Theorems module name
- `src/systems/host-partial-inventory.md` -- row notes Theorems companion

## Gates (observed green)

- `lake build SystemsLean.ProductPathPerformStep SystemsLean.ProductPathPerformStepTheorems SystemsLean.SelfApplyFs`
- `just hygiene`
- `just systems-host`
- `just systems-emit-wire`

## Claims preserved

- complete true (tip / SelfHostComplete)
- free / llvm / PROVABLY false

## Next Open

Largest never-split cold primary by live `wc -l` after this slice:
**ProductPathWriterSurface.lean** (**147**). Skip tip, CompilePath*, role
scaffolds, already-split-once primaries.

## Join

`/tmp/grok-1000/grok-impl-product-path-perform-step-split.md`
