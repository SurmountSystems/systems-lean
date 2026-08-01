# DualEqWriteCapableGap long-file split (2026-07-31)

Kind: analysis only. Not residual.

## Seam

**CAPABLE-GAP-THEOREM + CAPABLE-GAP-SMOKE** split into
`SystemsLean.DualEqWriteCapableGapTheorems` (same namespace
`SystemsLean.DualEqWriteCapableGap`).

Parent keeps stage ids, claim bool pins, recipe/exe names, Ok / PartialReady
folds, and diagnostic print/main. Theorems and behavioral `example` smokes live
in the child module. Pattern matches `OwnershipClaimedTheorems` /
`SelfHostCompleteTheorems`.

Also: header/doc compaction on the parent so split is a net line decrease
(theorem move alone was small; greppable honesty tokens stay on parent for
host-presence). Expanded theorem + smoke surface in the child covers stage /
Ok / PartialReady / land-time claim pins / recipe/exe cites.

## Before / after

| Path | Lines |
|------|------:|
| `DualEqWriteCapableGap.lean` before | 354 |
| `DualEqWriteCapableGap.lean` after | 340 |
| `DualEqWriteCapableGapTheorems.lean` new | 309 |
| Delta parent | -14 |

## Why this seam

DualEqWriteCapableGap is B37 CAPABLE-GAP surface (land-time home after B36 API),
not emit product text. A Scaffold copy would mis-name the role. Theorems + smoke
are a coherent block that does not own Ok / PartialReady / print API.

Land-time honesty preserved on home:
`productPathFreestandingPerformClaimed := false`,
`productPathOfficialPathStillUsesFreestandingEmit := true`,
dual-equality blocks true, Full long-name false. Living tip / PerformClaimed /
SelfHostComplete / StepContractFull keep later-cliff dual-pins. free / llvm /
PROVABLY stay false. Complete true stays on tip dual-pin, not forged here.

## Wiring

- SelfApplyFs: `import SystemsLean.DualEqWriteCapableGapTheorems` (tip import only)
- Host presence: `specs.nix` parent split cite + new Theorems entry
- Emit-wire: unchanged product wire; CAPABLE-GAP module path tokens stay on home

## Gates

- `lake build SystemsLean.DualEqWriteCapableGap SystemsLean.DualEqWriteCapableGapTheorems SystemsLean.DualEqWriteCapableGapMain` green
- `lake build SystemsLean.SelfApplyFs` green
- `just systems-host` green
- `just systems-emit-wire` green
- `just hygiene` green
- Tip SelfApplyFs not primary (import line only); freestanding-self-host-complete not required

## Claims

- complete **true** on tip / SelfHostComplete / StepContractFull dual-pin
- perform claimed **false** land-time on DualEqWriteCapableGap home (unchanged honesty)
- StillUses FreestandingEmit **true** land-time on this home (unchanged honesty)
- residual free **false**
- llvm / PROVABLY **false**

## Next cold primary (Open)

`wc -l` largest still-cold never-split primary under SystemsLean:

- skip tip SelfApplyFs **1893**
- skip *Scaffold/*Theorems/*Load/*Bars/*Main role scaffolds
- skip CompilePath **458** seams done; skip CompilePath*
- skip already-split-once including DualEqWriteCapableGap **340**

**Next:** DualEqWriteClosePath.lean **354** (largest never-split cold primary;
PerformClaimed **345** / KernelTypes **345** / Extract **344** follow).

## Join

`/tmp/grok-1000/grok-impl-dual-eq-write-capable-gap-split-e0554c3d.md`
