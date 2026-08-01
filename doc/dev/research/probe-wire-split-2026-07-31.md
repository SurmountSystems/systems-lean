# ProbeWire long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Summary

Split PROBE-WIRE-THEOREM + PROBE-WIRE-SMOKE from cold ProbeWire.lean into
ProbeWireTheorems.lean (same namespace SystemsLean.ProbeWire).

| Path | Lines |
|------|------:|
| SystemsLean/ProbeWire.lean (before) | 379 |
| SystemsLean/ProbeWire.lean (after) | 288 |
| SystemsLean/ProbeWireTheorems.lean (new) | 163 |

Delta parent: -91. Pattern: DualResidual / ParityMult theorem splits.

## What stayed on parent

- Stage / map ids (SLAKE_SELF_HOST_PROBE_WIRE_V0, HOST-PROBE-WIRE, ...)
- Path cites (probe smoke path, emit/, out/freestanding-c/, ...)
- Claim Bools (smoke debt, not-wire, emit-path, residualFreeClaimed false,
  productSelfHostCompleteClaimed true)
- probeWireSurfaceOk / probeWireSurfacesDistinct / probeWireReady / probeWireOk
- Greppable honesty tokens for unit-walk (RUNTIME-FS, inventoryCloseReady,
  llvmHoldReady stay on parent header; theorem bodies live on split module)

## What moved

- All PROBE-WIRE-THEOREM / HOST-PROBE-WIRE-THEOREM bodies
- All PROBE-WIRE-SMOKE / HOST-PROBE-WIRE-SMOKE examples
- set_option maxRecDepth 16384 (needed for decide on readiness folds)

## Gates at land

- lake ProbeWire + ProbeWireTheorems green
- just hygiene + just systems-host + just systems-emit-wire green
- Claims: complete true; free/llvm/PROVABLY false (no tip touch)

## Next cold primary

EmitExtract.lean 370 (never split). Then OwnershipClaimed 367.
Skip CompilePath* / tip / already-split scaffolds.
