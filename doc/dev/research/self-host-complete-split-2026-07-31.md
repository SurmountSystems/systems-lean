# SelfHostComplete long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**COMPLETE-THEOREM + COMPLETE-SMOKE** split into
`SystemsLean.SelfHostCompleteTheorems` (same namespace
`SystemsLean.SelfHostComplete`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `OwnershipClaimedTheorems` /
`StepContractFullTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease (theorem
move alone was small; greppable honesty tokens stay on parent for host-presence).

## Before / after

| Path | Lines |
|------|------:|
| `SelfHostComplete.lean` before | 363 |
| `SelfHostComplete.lean` after | 338 |
| `SelfHostCompleteTheorems.lean` new | 252 |
| Delta parent | -25 |

## Why this seam

SelfHostComplete is claim B freestanding product self-host complete surface (home
after Full), not emit product text. A Scaffold copy would mis-name the role.
Theorems + smoke are a coherent block that does not own Ok / PartialReady / print API.

Honesty preserved on home: `freestandingProductSelfHostComplete := true`,
`residualFreeClaimed` / `llvmUnlocked` / `provablyUnlocked` stay false. Living tip
import-only (+1 line for Theorems import).

## Wiring

- SelfApplyFs: `import SystemsLean.SelfHostCompleteTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; complete module path tokens stay on home

## Gates

- `lake build SystemsLean.SelfHostComplete SystemsLean.SelfHostCompleteTheorems` green
- `lake build SystemsLean.SelfApplyFs` green
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1892**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including SelfHostComplete **338**

**Next:** DualEqWriteCapableGap.lean **354** (largest never-split cold primary;
DualEqWriteClosePath **354** / PerformClaimed **345** / KernelTypes **345** /
Extract **344** follow).

## Join

`/tmp/grok-1000/grok-impl-self-host-complete-split-4464b7c7.md`
