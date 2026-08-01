# OfficialPathAlternate long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**OFFICIAL-PATH-ALTERNATE-THEOREM + OFFICIAL-PATH-ALTERNATE-SMOKE** split into
`SystemsLean.OfficialPathAlternateTheorems` (same namespace
`SystemsLean.OfficialPathAlternate`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `DualEqWriteParityTheorems` /
`OfficialRetireTheorems` / `DualEqWriteClosePathTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease
(theorem move alone was small; greppable honesty tokens stay on parent for
host-presence). Expanded theorem + smoke surface in the child covers stage /
Ok / PartialReady / land-time claim pins / recipe/exe cites.

## Before / after

| Path | Lines |
|------|------:|
| `OfficialPathAlternate.lean` before | 310 |
| `OfficialPathAlternate.lean` after | 295 |
| `OfficialPathAlternateTheorems.lean` new | 328 |
| Delta parent | -15 |
| SelfApplyFs tip (import only) | 1898 -> 1899 |

## Why this seam

OfficialPathAlternate is B33 official-path alternate surface (land-time home
before later dual-eq / retire / perform cliffs), not emit product text.
A Scaffold copy would mis-name the role. Theorems + smoke are a coherent block
that does not own Ok / PartialReady / print API.

Land-time honesty preserved on home:
`productPathOfficialPathAlternateNotOfficial := true`,
`productPathOfficialPathDualEqualityBlocksRetirement := true`,
`productPathFreestandingPerformClaimed := false`,
`productPathOfficialPathStillUsesFreestandingEmit := true`,
`productPathPerformDependsOnLake := true`,
`productPathFreestandingCapableStepContractFullSatisfied := false`. Living tip /
PerformClaimed / OfficialRetire / SelfHostComplete / StepContractFull keep
later-cliff dual-pins. free / llvm / PROVABLY stay false. Complete true stays
on tip dual-pin, not forged here.

## Wiring

- SelfApplyFs: `import SystemsLean.OfficialPathAlternateTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; official-path alternate module path tokens stay on home
- Inventory: `host-partial-inventory.md` Theorems row

## Gates

- `lake build SystemsLean.OfficialPathAlternate SystemsLean.OfficialPathAlternateTheorems SystemsLean.OfficialPathAlternateMain` green
- `lake build SystemsLean.SelfApplyFs` green (import-only tip touch)
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- perform claimed **false** land-time on OfficialPathAlternate home (unchanged honesty)
- AlternateNotOfficial **true** land-time on this home (living tip false after B38)
- Full long-name **false** land-time on this home
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1899**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath* (not re-open)
- skip already-split-once (OfficialPathAlternate **295**, DualEqWriteParity **302**,
  DualEqWriteApi via DualEqWriteLoad **500**, ...)

Next: **CapableRead.lean** (**297**).
