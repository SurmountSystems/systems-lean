# CapableWriteHc long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Summary

Cold long-file split of `SystemsLean.CapableWriteHc` along the dual SSOT
load/assemble/dialect seam (same pattern as DualEqWriteLoad / FreestandingEmitLoad).

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/CapableWriteHc.lean` | 668 | **316** (-352) |
| `src/systems/SystemsLean/CapableWriteHcLoad.lean` | (new) | **401** |

## Seam

- **CapableWriteHcLoad** (same namespace `SystemsLean.CapableWriteHc`):
  `stageId`, `dualEqualityGateId`, `WriteSsotSpec` / `dualSsotSpecs`, string /
  SSOT helpers, `requireDualSsotEqual`, load one + assemble header/source,
  `BodySsotDialect`, `loadBodySsotDialect` / `applyBodySsotDialect`,
  `productWireHonestyTokens` / `requireWrittenTokens`.
- **CapableWriteHc** keeps: host/selfHost ids, honesty bools, write API
  `freestandingCapableWriteFreestandingHc`, Ok / PartialReady / theorem / main.

## Gates

- `lake build SystemsLean.CapableWriteHc` exit 0
- `just hygiene` exit 0
- `just systems-host` exit 0
- `just systems-emit-wire` exit 0
- SelfApplyFs tip not touched; freestanding-self-host-complete not required

## Claims held

- complete true (tip; not re-proved this slice)
- free / llvm / PROVABLY false (not forged)
- CapableWriteHc authority-not-emit true; dual-eq live true; PartialReady true

## Next cold

`wc -l` top non-tip: ProductPath **667** (further split Open), FreestandingEmitLoad
**622**, EmitCompose **596**. Tip SelfApplyFs **1888** skipped.
