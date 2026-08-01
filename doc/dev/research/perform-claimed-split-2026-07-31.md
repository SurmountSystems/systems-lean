# PerformClaimed long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**PERFORM-CLAIMED-THEOREM + PERFORM-CLAIMED-SMOKE** split into
`SystemsLean.PerformClaimedTheorems` (same namespace
`SystemsLean.PerformClaimed`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `OwnershipClaimedTheorems` /
`DualEqWriteCapableGapTheorems` / `DualEqWriteClosePathTheorems` /
`SelfHostCompleteTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease
(theorem move alone was small; greppable honesty tokens stay on parent for
host-presence). Expanded theorem + smoke surface in the child covers stage /
Ok / PartialReady / land-time claim pins / recipe/exe cites.

## Before / after

| Path | Lines |
|------|------:|
| `PerformClaimed.lean` before | 345 |
| `PerformClaimed.lean` after | 331 |
| `PerformClaimedTheorems.lean` new | 294 |
| Delta parent | -14 |
| SelfApplyFs tip (import only) | 1894 -> 1895 |

## Why this seam

PerformClaimed is B39 PERFORM-CLAIMED surface (land-time home before B40
ownership), not emit product text. A Scaffold copy would mis-name the role.
Theorems + smoke are a coherent block that does not own Ok / PartialReady /
print API.

Land-time honesty preserved on home:
`productPathFreestandingPerformClaimed := true`,
`productPathFreestandingOwnershipClaimed := false`,
`freestandingProductSelfHostComplete := false`,
`productPathFreestandingCapableStepContractFullSatisfied := false`,
`productPathOfficialPathStillUsesFreestandingEmit := false`,
`productPathOfficialPathStillUsesLake := true`,
`productPathPerformDependsOnLake := true`. Living tip / OwnershipClaimed /
SelfHostComplete / StepContractFull keep later-cliff dual-pins. free / llvm /
PROVABLY stay false. Complete true stays on tip dual-pin, not forged here.

## Wiring

- SelfApplyFs: `import SystemsLean.PerformClaimedTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; PERFORM-CLAIMED module path tokens stay on home
- Inventory: `host-partial-inventory.md` Theorems row

## Gates

- `lake build SystemsLean.PerformClaimed SystemsLean.PerformClaimedTheorems SystemsLean.PerformClaimedMain` green
- `lake build SystemsLean.SelfApplyFs` green (import-only tip touch)
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- perform claimed **true** land-time on PerformClaimed home (unchanged honesty)
- ownership claimed **false** land-time on this home (unchanged honesty; tip true after B40)
- Full long-name **false** land-time on this home
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1895**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including PerformClaimed **331**
- next: **KernelTypes 345** (never split; no KernelTypesTheorems)
- then Extract **344** / KernelLinear **343** / SelfHost **342**
