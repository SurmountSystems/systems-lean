# DualEqWriteParity long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**WRITE-PARITY-THEOREM + WRITE-PARITY-SMOKE** split into
`SystemsLean.DualEqWriteParityTheorems` (same namespace
`SystemsLean.DualEqWriteParity`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `OfficialRetireTheorems` /
`DualEqWriteClosePathTheorems` / `LlvmHoldTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease
(theorem move alone was small; greppable honesty tokens stay on parent for
host-presence). Expanded theorem + smoke surface in the child covers stage /
Ok / PartialReady / land-time claim pins / recipe/exe cites.

## Before / after

| Path | Lines |
|------|------:|
| `DualEqWriteParity.lean` before | 319 |
| `DualEqWriteParity.lean` after | 302 |
| `DualEqWriteParityTheorems.lean` new | 321 |
| Delta parent | -17 |
| SelfApplyFs tip (import only) | 1897 -> 1898 |

## Why this seam

DualEqWriteParity is B34 dual-equality WRITE parity surface (land-time home
before later close-path / CAPABLE-GAP / retire cliffs), not emit product text.
A Scaffold copy would mis-name the role. Theorems + smoke are a coherent block
that does not own Ok / PartialReady / print API.

Land-time honesty preserved on home:
`productPathDualEqualityWriteParityGapOpen := true`,
`productPathCapableWriteStructuralNotDualEquality := true`,
`productPathFreestandingPerformClaimed := false`,
`productPathOfficialPathStillUsesFreestandingEmit := true`,
`productPathOfficialPathDualEqualityBlocksRetirement := true`,
`productPathPerformDependsOnLake := true`,
`productPathFreestandingCapableStepContractFullSatisfied := false`. Living tip /
PerformClaimed / CapableGap / OfficialRetire / SelfHostComplete / StepContractFull
keep later-cliff dual-pins. free / llvm / PROVABLY stay false. Complete true stays
on tip dual-pin, not forged here.

## Wiring

- SelfApplyFs: `import SystemsLean.DualEqWriteParityTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; dual-equality WRITE parity module path tokens stay on home
- Inventory: `host-partial-inventory.md` Theorems row

## Gates

- `lake build SystemsLean.DualEqWriteParity SystemsLean.DualEqWriteParityTheorems SystemsLean.DualEqWriteParityMain` green
- `lake build SystemsLean.SelfApplyFs` green (import-only tip touch)
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- perform claimed **false** land-time on DualEqWriteParity home (unchanged honesty)
- gap open **true** land-time on this home (living tip closed after B37)
- Full long-name **false** land-time on this home
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1898**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including DualEqWriteParity **302**, OfficialRetire **316**, DualEqWriteApi via Load, LlvmHold **144**
- next: **OfficialPathAlternate 310** (never split; no OfficialPathAlternateTheorems)
- then CapableRead **297** / CapableStepContract **286** / InstallOut **279**
