# OfficialRetire long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**RETIRE-OFFICIAL-THEOREM + RETIRE-OFFICIAL-SMOKE** split into
`SystemsLean.OfficialRetireTheorems` (same namespace
`SystemsLean.OfficialRetire`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `PerformClaimedTheorems` /
`OwnershipClaimedTheorems` / `LlvmHoldTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease
(theorem move alone was small; greppable honesty tokens stay on parent for
host-presence). Expanded theorem + smoke surface in the child covers stage /
Ok / PartialReady / land-time claim pins / recipe/exe cites.

## Before / after

| Path | Lines |
|------|------:|
| `OfficialRetire.lean` before | 322 |
| `OfficialRetire.lean` after | 316 |
| `OfficialRetireTheorems.lean` new | 293 |
| Delta parent | -6 |
| SelfApplyFs tip (import only) | 1896 -> 1897 |

## Why this seam

OfficialRetire is B38 RETIRE-OFFICIAL surface (land-time home before B39
perform claimed), not emit product text. A Scaffold copy would mis-name the role.
Theorems + smoke are a coherent block that does not own Ok / PartialReady /
print API.

Land-time honesty preserved on home:
`productPathFreestandingPerformClaimed := false`,
`productPathOfficialPathStillUsesFreestandingEmit := false`,
`productPathOfficialPathStillUsesLake := true`,
`productPathPerformDependsOnLake := true`,
`productPathFreestandingCapableStepContractFullSatisfied := false`. Living tip /
PerformClaimed / OwnershipClaimed / SelfHostComplete / StepContractFull keep
later-cliff dual-pins. free / llvm / PROVABLY stay false. Complete true stays on
tip dual-pin, not forged here.

## Wiring

- SelfApplyFs: `import SystemsLean.OfficialRetireTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; RETIRE-OFFICIAL module path tokens stay on home
- Inventory: `host-partial-inventory.md` Theorems row

## Gates

- `lake build SystemsLean.OfficialRetire SystemsLean.OfficialRetireTheorems SystemsLean.OfficialRetireMain` green
- `lake build SystemsLean.SelfApplyFs` green (import-only tip touch)
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- perform claimed **false** land-time on OfficialRetire home (unchanged honesty)
- Full long-name **false** land-time on this home
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1897**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including OfficialRetire **316**, DualEqWriteApi via Load, LlvmHold **144**
- next: **DualEqWriteParity 319** (never split; no DualEqWriteParityTheorems)
- then OfficialPathAlternate **310** / CapableRead **297** / CapableStepContract **286**
