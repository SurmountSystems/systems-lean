# ParityMult long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Summary

Split PARITY-MULT-THEOREM + PARITY-MULT-SMOKE from cold ParityMult.lean into
ParityMultTheorems.lean (same namespace SystemsLean.ParityMult).

| Path | Lines |
|------|------:|
| SystemsLean/ParityMult.lean (before) | 382 |
| SystemsLean/ParityMult.lean (after) | 183 |
| SystemsLean/ParityMultTheorems.lean (new) | 265 |

Delta parent: -199. Pattern: ParityEmit / ParityProgram theorem splits.

## What stayed on parent

- Stage / map ids (SLAKE_SELF_HOST_PARITY_MULT_V0, HOST-PARITY-MULT, ...)
- Product API name defs and path cites
- ofNatRoundTripOk / isValidTagParityOk / isValidParityOk / nameParityOk /
  enumTagParityOk / gradeParityOk / paritySurfaceOk
- multParityReady / multParityOk
- Greppable honesty tokens for unit-walk (PARITY-MULT-THEOREM names listed in
  header for discoverability; theorem bodies live on split module)

## What moved

- All theorem * _true / * _eq / content-equality theorems
- All PARITY-MULT-SMOKE / HOST-PARITY-MULT-SMOKE examples
- set_option maxRecDepth 4096 (needed for decide on readiness folds)

## Gates at land

- lake ParityMult + ParityMultTheorems green
- just hygiene + just systems-host green
- Claims: complete true; free/llvm/PROVABLY false (no tip touch)

## Next cold primary

ProbeWire.lean 379 (never split). Then EmitExtract 370 / OwnershipClaimed 367.
Skip CompilePath* / tip / already-split scaffolds.
