# DualEqWriteClosePath long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**CLOSE-PATH-THEOREM + CLOSE-PATH-SMOKE** split into
`SystemsLean.DualEqWriteClosePathTheorems` (same namespace
`SystemsLean.DualEqWriteClosePath`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `DualEqWriteCapableGapTheorems` /
`OwnershipClaimedTheorems` / `SelfHostCompleteTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease
(theorem move alone was small; greppable honesty tokens stay on parent for
host-presence). Expanded theorem + smoke surface in the child covers stage /
Ok / PartialReady / land-time claim pins / recipe/exe cites.

## Before / after

| Path | Lines |
|------|------:|
| `DualEqWriteClosePath.lean` before | 354 |
| `DualEqWriteClosePath.lean` after | 344 |
| `DualEqWriteClosePathTheorems.lean` new | 314 |
| Delta parent | -10 |
| SelfApplyFs tip (import only) | 1893 -> 1894 |

## Why this seam

DualEqWriteClosePath is B35 close-path surface (land-time home before B36 API /
B37 CAPABLE-GAP), not emit product text. A Scaffold copy would mis-name the
role. Theorems + smoke are a coherent block that does not own Ok / PartialReady
/ print API.

Land-time honesty preserved on home:
`productPathFreestandingPerformClaimed := false`,
`productPathOfficialPathStillUsesFreestandingEmit := true`,
`productPathDualEqualityWriteParityGapOpen := true`,
`productPathCapableWriteStructuralNotDualEquality := true`,
`productPathDualEqualityWriteClosePathNotGapClosed := true`,
Full long-name false. Living tip / PerformClaimed / SelfHostComplete /
StepContractFull keep later-cliff dual-pins. free / llvm / PROVABLY stay false.
Complete true stays on tip dual-pin, not forged here.

## Wiring

- SelfApplyFs: `import SystemsLean.DualEqWriteClosePathTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; CLOSE-PATH module path tokens stay on home
- Inventory: `host-partial-inventory.md` Theorems row

## Gates

- `lake build SystemsLean.DualEqWriteClosePath SystemsLean.DualEqWriteClosePathTheorems SystemsLean.DualEqWriteClosePathMain` green
- `lake build SystemsLean.SelfApplyFs` green (import-only tip touch)
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- perform claimed **false** land-time on DualEqWriteClosePath home (unchanged honesty)
- StillUses FreestandingEmit **true** land-time on this home (unchanged honesty)
- gap open **true** land-time on this home (unchanged honesty; tip closed after B37)
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1894**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including DualEqWriteClosePath **344**

**Next:** PerformClaimed.lean **345** (largest never-split cold primary;
KernelTypes **345** / Extract **344** / SelfHost **342** follow).

## Join

`/tmp/grok-1000/grok-impl-dual-eq-write-close-path-split.md`
