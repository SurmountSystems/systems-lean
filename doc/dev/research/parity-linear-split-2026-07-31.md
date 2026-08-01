# ParityLinear long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Summary

Split PARITY-LINEAR-THEOREM + PARITY-LINEAR-SMOKE from cold ParityLinear.lean into
ParityLinearTheorems.lean (same namespace SystemsLean.ParityLinear).

| Path | Lines |
|------|------:|
| SystemsLean/ParityLinear.lean (before) | 304 |
| SystemsLean/ParityLinear.lean (after) | 176 |
| SystemsLean/ParityLinearTheorems.lean (new) | 189 |

Delta parent: -128. Pattern: ParityMult / ParityEmit / ParityProgram theorem splits.

## What stayed on parent

- Stage / map ids (SLAKE_SELF_HOST_PARITY_LINEAR_V0, HOST-PARITY-LINEAR, ...)
- Product API name defs and path cites
- productApiSurfaceOk / linearContractParityOk / paritySurfaceOk
- linearParityReady / multLinearParityReady / linearParityOk
- Greppable honesty tokens for unit-walk (PARITY-LINEAR-THEOREM names listed in
  header for discoverability; theorem bodies live on split module)

## What moved

- All theorem * _true / * _eq / product API content-equality theorems
- All PARITY-LINEAR-SMOKE / HOST-PARITY-LINEAR-SMOKE examples
- set_option maxRecDepth 4096 (needed for decide on readiness folds)

## Gates at land

- lake ParityLinear + ParityLinearTheorems green
- just hygiene + just systems-host green
- Claims: complete true; free/llvm/PROVABLY false (no tip touch)

## Next cold primary

Types.lean 302 (never split). Then ParityTypes 279 / EmitMult 277.
Skip CompilePath* / tip / already-split scaffolds.
