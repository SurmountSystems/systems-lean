# StepContractFull long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**STEP-CONTRACT-FULL-THEOREM + STEP-CONTRACT-FULL-SMOKE** split into
`SystemsLean.StepContractFullTheorems` (same namespace
`SystemsLean.StepContractFull`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `ProductPathOwnershipRegenerateTheorems` /
`ParityProgramTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease (theorem
move alone was small; greppable honesty tokens stay on parent for host-presence).

## Before / after

| Path | Lines |
|------|------:|
| `StepContractFull.lean` before | 382 |
| `StepContractFull.lean` after | 365 |
| `StepContractFullTheorems.lean` new | 235 |
| Delta parent | -17 |

## Why this seam

StepContractFull is Full step-contract surface (claim-path home after B40), not
emit product text. A Scaffold copy would mis-name the role. Theorems + smoke are
a coherent block that does not own Ok / PartialReady / print API.

## Wiring

- SelfApplyFs: `import SystemsLean.StepContractFullTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; unit-walk sees UNIT_SURFACE + RUNTIME-FS on Theorems

## Gates

- `lake build SystemsLean.StepContractFull SystemsLean.StepContractFullTheorems SystemsLean.StepContractFullMain` green
- `lake build SystemsLean.SelfApplyFs` green
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** (SelfHostComplete / SelfApplyFs / StepContractFull dual-pin)
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1890**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including StepContractFull **365**

**Next:** ParityMult.lean **382** (largest never-split cold primary;
ProbeWire **379**, EmitExtract **370**, OwnershipClaimed **367** follow).

## Join

`/tmp/grok-1000/grok-impl-step-contract-full-split-8e71f9b2.md`
