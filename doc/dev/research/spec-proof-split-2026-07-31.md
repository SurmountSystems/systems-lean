# SpecProof long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Lines |
|------|------:|
| `SpecProof.lean` before | 527 |
| `SpecProof.lean` after | 432 |
| `SpecProofTheorems.lean` (new) | 161 |
| Delta parent | -95 |

## Seam

Coherent **SPEC-PROOF-THEOREM + SPEC-PROOF-SMOKE** split into
`SystemsLean.SpecProofTheorems` (same namespace `SystemsLean.SpecProof`),
matching HostComposeTheorems / ProductPathTheorems pattern.

Parent keeps:
- stage / host / path cite String defs
- claim Bools (`proofCompleteClaimed` false, `residualFreeClaimed` false,
  `productSelfHostCompleteClaimed` true, surface/ready bars)
- `specProofReady` / honesty fold

Child owns:
- real theorems (`stageId_eq` .. `specProofDoesNotMeanResidualFree_true`)
- SPEC-PROOF-SMOKE / HOST-SPEC-PROOF-SMOKE examples

## Host presence

- `host-leans.nix` + `required-files.nix`: add SpecProofTheorems.lean
- `host-specs-hold-close.nix`: parent claim defs + compose pins; theorems
  entry holds `example` / `theorem` forms
- Package root `SystemsLean.lean` imports SpecProofTheorems

## Claims held

- complete true (SelfApplyFs / productSelfHostCompleteClaimed)
- free / llvm / PROVABLY false
- proofCompleteClaimed false (proved false on SpecProofTheorems)

## Next cold primary

JoinMap.lean **519** (skip tip SelfApplyFs **1888**; skip role scaffolds
EmitComposeScaffold **590** as primary Open).
