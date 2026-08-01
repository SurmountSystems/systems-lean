# EmitCompose long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| EmitCompose.lean before | 596 |
| EmitCompose.lean after | 75 |
| EmitComposeScaffold.lean (new) | 590 |
| Delta parent | -521 |

## Seam

HOST-EMIT-COMPOSE product-text scaffolding (same pattern as EmitPlanScaffold /
EmitApplyScaffold / EmitBodyScaffold):

- stage/map ids + path cites
- composeOwnershipComment / composeHeaderOpen / composeApiDecls /
  composeHeaderFragment
- composeBodyOpen / composeBodies / composeBodyFragment
- ownershipHonestyOk / headerHonestyOk / bodyHonestyOk
- emitComposeSurfaceOk / emitComposeReady / emitComposeOk
- EMIT-COMPOSE-SMOKE examples + theorem emitComposeReady_true

Moved to `SystemsLean/EmitComposeScaffold.lean` under the same namespace
`SystemsLean.EmitCompose`. Parent keeps module docs, import, and greppable split
cite block so host-presence tokens still match EmitCompose.lean.

## Gates

- lake build SystemsLean.EmitCompose + EmitComposeScaffold: exit 0
- lake build SystemsLean.FreestandingEmit: exit 0
- just hygiene: OK
- just systems-host: OK
- just systems-emit-wire: OK
- tip SelfApplyFs not touched; freestanding-self-host-complete not re-run

## Claims held

- freestandingProductSelfHostComplete true (unchanged tip)
- residual free / llvm / PROVABLY false (unchanged)

## Next cold (skip tip 1888)

SpecProof.lean **527** (then JoinMap 519, KernelProgram 508).
