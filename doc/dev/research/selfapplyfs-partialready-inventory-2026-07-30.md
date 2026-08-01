# SelfApplyFs PartialReady inventory (split batch 1)

Kind: analysis + split prep. Survives compaction.
Date: 2026-07-30.
Live tip before batch 1 move: `src/systems/SystemsLean/SelfApplyFs.lean` **6498** lines, **33** `def ...PartialReady`.

Plan: `.agents/plans/plan-selfapplyfs-rca-prevention.md` Track 4.
RCA: `doc/dev/research/selfapplyfs-rebuild-failure-2026-07-30.md`.

## Hard constraints for any move

- Never full-rebuild SelfApplyFs from `/tmp` stitch.
- `nix/systems-host-presence/specs.nix` pins **many** PartialReady / theorem / `def ... := true|false` tokens on path `src/systems/SystemsLean/SelfApplyFs.lean` specifically (several `rel` blocks).
- `just freestanding-self-host-complete` greps exact forms on SelfApplyFs, including:
  - `def freestandingProductSelfHostCompleteMeasured : Bool := true`
  - `def freestandingProductSelfHostComplete : Bool := true`
  - name `freestandingProductSelfHostCompletePartialReady`
- Living claim SSoT stays in SelfApplyFs: complete / Full / ownership / perform true; StillUsesFreestandingEmit false; free/llvm/PROVABLY false.
- Move pattern: short module owns bulk; SelfApplyFs keeps greppable thin re-exports / chain folds.

## All 33 PartialReady defs (line at inventory time)

| # | Def | Closed step role | Natural short home |
|---|-----|------------------|--------------------|
| 1 | productKernelSelfApplyPartialReady | B2 kernel self-apply | **KernelSelfApply** |
| 2 | productOutKernelEvidencePartialReady | B3 product Out | **ProductOutKernel** |
| 3 | productPathHostLakeBootstrapPartialReady | B4 Lake bootstrap honesty | **BootstrapHonesty** |
| 4 | productWriterSurfacePartialReady | B5 writer surface | **ProductPathWriterSurface** |
| 5 | productWriterPathPlanPartialReady | B6 writer path plan | **ProductPathWriterPathPlan** |
| 6 | productWriterPathExecutionPartialReady | B7 writer path exec | **ProductPathWriterPathExec** |
| 7 | productPathOwnershipInputsPartialReady | B8 ownership inputs | **ProductPathOwnershipInputs** |
| 8 | productPathPerformPartialReady | B9 perform gap | **ProductPathPerform** |
| 9 | productPathPerformStepPartialReady | B10 install step | **ProductPathPerformStep** |
| 10 | productPathPerformReadPartialReady | B11 READ | ProductPathReadSsot |
| 11 | productPathPerformComposePartialReady | B12 COMPOSE | ProductPathComposePlan |
| 12 | productPathPerformWriteHcPartialReady | B13 WRITE-HC | ProductPathWriteHc |
| 13 | productPathFreestandingCapablePartialReady | B14 capable gap | ProductPathFreestandingCapable |
| 14 | productPathFreestandingCapableStepContractPartialReady | B15 step contract | ProductPathFreestandingCapableStepContract |
| 15 | productPathFreestandingCapableReadPartialReady | B16 capable READ | CapableRead (was ProductPathFreestandingCapableRead; short-name batch 8) |
| 16 | productPathFreestandingCapableComposePartialReady | B17 capable COMPOSE | ProductPathFreestandingCapableCompose |
| 17 | productPathFreestandingCapableWriteHcPartialReady | B18 capable WRITE | ProductPathFreestandingCapableWriteHc |
| 18 | productPathFreestandingCapableRegeneratePartialReady | B19 regenerate | ProductPathFreestandingCapableRegenerate |
| 19 | productPathFreestandingCapableInstallOutPartialReady | B20 install out | ProductPathFreestandingCapableInstallOut |
| 20 | productPathFreestandingCapableFullBarPartialReady | B21 full bar | ProductPathFreestandingCapableFullBar |
| 21 | productPathOwnershipRegeneratePartialReady | B22.. ownership regen | ProductPathOwnershipRegenerate |
| 22 | productPathFreestandingPerformEvidencePartialReady | B31 perform evidence | ProductPathFreestandingPerformEvidence |
| 23 | productPathFreestandingPerformOfficialPathPartialReady | B32 official path | ProductPathFreestandingPerformOfficialPath |
| 24 | productPathFreestandingPerformOfficialPathAlternatePartialReady | B33 alternate | ProductPathFreestandingPerformOfficialPathAlternate |
| 25 | productPathFreestandingPerformDualEqualityWriteParityPartialReady | B34 parity | ...Parity |
| 26 | productPathFreestandingPerformDualEqualityWriteClosePathPartialReady | B35 close path | ...ClosePath |
| 27 | productPathFreestandingPerformDualEqualityWriteApiPartialReady | B36 dual-eq API | ...Api |
| 28 | productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady | B37 capable gap | ...CapableGap |
| 29 | productPathOfficialPathRetireOfficialPartialReady | B38 retire official | **OfficialRetire** |
| 30 | productPathFreestandingPerformClaimedPartialReady | B39 perform claimed | **PerformClaimed** |
| 31 | productPathFreestandingOwnershipClaimedPartialReady | B40 ownership claimed | **OwnershipClaimed** |
| 32 | stepContractFullPartialReady | Full step-contract | **StepContractFull** |
| 33 | freestandingProductSelfHostCompletePartialReady | claim B complete | **SelfHostComplete** |

Chain dependency: each later PartialReady folds the previous PartialReady (plus Ok/Measured/claim bools). Early families also feed theorems/examples at file end.

## Path tokens that hardcode SelfApplyFs.lean (complete family)

| Gate surface | What requires SelfApplyFs path |
|--------------|--------------------------------|
| `nix/systems-host-presence/specs.nix` hostSpecs block "SelfApplyFs living tip complete dual-pin" | `freestandingProductSelfHostCompletePartialReady`, Ok, Measured `:= true`, StepAdvanced `:= true`, complete `:= true`, theorems, stage strings, SelfHostComplete cite |
| `nix/systems-host-presence/specs.nix` main SelfApplyFs block | complete claim bool `:= true`, complete theorems, early PartialReady names |
| `nix/systems-emit-wire/default.nix` | many `hostPin = readRel "src/systems/SystemsLean/SelfApplyFs.lean"` scans (claim bools, not always PartialReady body) |
| `just freestanding-self-host-complete` | Measured `:= true`, complete `:= true`, PartialReady **name**, SelfHostComplete module greps |

SelfHostComplete.lean already dual-pins Measured/Ok/claim bools (separate `rel` block). It did **not** own PartialReady def before batch 1.

## Batch 1 choice

**Family moved:** claim B complete PartialReady / Ok bulk -> **SelfHostComplete** (short role module already dual-pinned).

Why this family:

1. Fully closed (claim tip already true; short module already green).
2. Natural home exists (`SelfHostComplete.lean`); no new ProductPathFreestanding* name.
3. No import cycle: SelfHostComplete does not import SelfApplyFs; SelfApplyFs can import SelfHostComplete.
4. just/nix keep greppable thin re-exports on SelfApplyFs path (`Measured := true` literal required).

## Remaining after batch 1

32 PartialReady families still bulk-defined in SelfApplyFs. Next batches: Full -> StepContractFull, B40 -> OwnershipClaimed, B39 -> PerformClaimed, B38 -> OfficialRetire, then older ProductPath* modules. Prefer short role names for any **new** archive modules.

Tip still multi-thousand lines after batch 1: Open **SelfApplyFs split batch 2** before bulk ProductPathFreestanding rename.

## Batch 2 choice (landed 2026-07-30)

**Family moved:** Full step-contract PartialReady / Ok bulk -> **StepContractFull**.

| Change | Detail |
|--------|--------|
| StepContractFull.lean | Added `stepContractFullPartialReady` fold + theorem + example (Ok bulk already lived here) |
| StepContractFullMain.lean | Thin Lake exe main (InstallOutMain pattern) so SelfApplyFs can import StepContractFull without top-level `main` clash vs SelfHostComplete |
| SelfApplyFs.lean | `import SystemsLean.StepContractFull`; Ok aliases StepContractFull.Ok; PartialReady is chain fold `ownershipPartialReady && StepContractFull.PartialReady && claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path |
| nix hostSpecs | StepContractFull block dual-pins PartialReady def + theorem; SelfApplyFs Full block still dual-pins living tip |
| emit-wire | StepContractFull module tokens include PartialReady; lakefile root `SystemsLean.StepContractFullMain` |

| File | Before batch 2 | After batch 2 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6438 | 6376 |
| StepContractFull.lean | 349 | 381 |

31 PartialReady families still bulk in SelfApplyFs after batch 2.

## Batch 3 choice (landed 2026-07-30)

**Family moved:** ownership claimed PartialReady / Ok bulk -> **OwnershipClaimed**.

| Change | Detail |
|--------|--------|
| OwnershipClaimed.lean | Added `productPathFreestandingOwnershipClaimedPartialReady` fold + theorem + example (Ok bulk already lived here; land-time complete false / Full long-name false kept) |
| OwnershipClaimedMain.lean | Thin Lake exe main (StepContractFullMain pattern) so SelfApplyFs can import OwnershipClaimed without top-level `main` clash vs SelfHostComplete |
| SelfApplyFs.lean | `import SystemsLean.OwnershipClaimed`; Ok aliases OwnershipClaimed.Ok; PartialReady is chain fold `performPartialReady && OwnershipClaimed.PartialReady && claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path |
| nix hostSpecs | OwnershipClaimed block dual-pins PartialReady def + theorem; SelfApplyFs ownership living-tip block retained |
| emit-wire | OwnershipClaimed module tokens include PartialReady; lakefile root `SystemsLean.OwnershipClaimedMain` |

| File | Before batch 3 | After batch 3 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6376 | 6315 |
| OwnershipClaimed.lean | 331 | 365 |
| OwnershipClaimedMain.lean | (new) | 17 |

30 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 4** (prefer perform claimed -> PerformClaimed). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 4 choice (landed 2026-07-30)

**Family moved:** perform claimed PartialReady / Ok bulk -> **PerformClaimed**.

| Change | Detail |
|--------|--------|
| PerformClaimed.lean | Added `productPathFreestandingPerformClaimedPartialReady` fold + theorem + example (Ok bulk already lived here; land-time ownership false / Full long-name false / complete false kept for just/emit-wire honesty) |
| PerformClaimedMain.lean | **New** thin Lake exe main (OwnershipClaimedMain / StepContractFullMain pattern). Needed so SelfApplyFs can co-import PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.PerformClaimed`; Ok aliases `PerformClaimed.productPathFreestandingPerformClaimedOk`; PartialReady is chain fold `retireOfficialPartialReady && PerformClaimed.PartialReady && claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-claimed` root -> `SystemsLean.PerformClaimedMain` |
| nix hostSpecs | PerformClaimed block dual-pins PartialReady def + theorem; SelfApplyFs perform living-tip block retained with batch-4 note |
| emit-wire | PerformClaimed module tokens include PartialReady; lakefile token `SystemsLean.PerformClaimedMain` |
| residual / WATCHER / handoff | batch 4 done; Open batch 5 prefer OfficialRetire (or inventory next largest closed family) |

| File | Before batch 4 | After batch 4 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6315 | 6262 |
| PerformClaimed.lean | 309 | 343 |
| PerformClaimedMain.lean | (new) | 18 |

29 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 5** (prefer OfficialRetire if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 5 choice (landed 2026-07-30)

**Family moved:** retire official PartialReady / Ok bulk -> **OfficialRetire**.

| Change | Detail |
|--------|--------|
| OfficialRetire.lean | Added `productPathOfficialPathRetireOfficialPartialReady` fold + theorem + example (Ok bulk already lived here; land-time perform claimed false / Full long-name false kept for just/emit-wire honesty) |
| OfficialRetireMain.lean | **New** thin Lake exe main (PerformClaimedMain / OwnershipClaimedMain pattern). Needed so SelfApplyFs can co-import OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.OfficialRetire`; Ok aliases `OfficialRetire.productPathOfficialPathRetireOfficialOk`; PartialReady is chain fold `capableGapPartialReady && OfficialRetire.PartialReady && claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-retire-official` root -> `SystemsLean.OfficialRetireMain` |
| nix hostSpecs | OfficialRetire block dual-pins PartialReady def + theorem; SelfApplyFs retire living-tip block retained with batch-5 note |
| emit-wire | OfficialRetire module tokens include PartialReady; lakefile token `SystemsLean.OfficialRetireMain` |
| residual / WATCHER / handoff | batch 5 done; Open batch 6 prefer B37 capable gap (`ProductPathFreestandingPerformDualEqualityWriteCapableGap`) or inventory next largest closed family still bulk in tip |

| File | Before batch 5 | After batch 5 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6262 | 6214 |
| OfficialRetire.lean | 289 | 320 |
| OfficialRetireMain.lean | (new) | 18 |

28 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 6** (prefer B37 capable gap -> `ProductPathFreestandingPerformDualEqualityWriteCapableGap` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 6 choice (landed 2026-07-30)

**Family moved:** B37 dual-equality WRITE CAPABLE-GAP PartialReady / Ok bulk -> **ProductPathFreestandingPerformDualEqualityWriteCapableGap**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingPerformDualEqualityWriteCapableGap.lean | Added `productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady` fold + theorem + example (Ok bulk already lived here; land-time perform claimed false / StillUses true / dual-equality blocks true / Full long-name false kept for just/emit-wire honesty) |
| ProductPathFreestandingPerformDualEqualityWriteCapableGapMain.lean | **New** thin Lake exe main (OfficialRetireMain / PerformClaimedMain pattern). Needed so SelfApplyFs can co-import CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingPerformDualEqualityWriteCapableGap`; Ok aliases home Ok; PartialReady is chain fold `apiPartialReady && CapableGap.PartialReady && claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-dual-equality-write-capable-gap` root -> `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteCapableGapMain` |
| nix hostSpecs | CapableGap block dual-pins PartialReady def + theorem; SelfApplyFs capable-gap living-tip block retained with batch-6 note |
| emit-wire | CapableGap module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteCapableGapMain` |
| residual / WATCHER / handoff | batch 6 done; Open batch 7 prefer B36 dual-eq WRITE API (`ProductPathFreestandingPerformDualEqualityWriteApi`) |

| File | Before batch 6 | After batch 6 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6214 | 6162 |
| ProductPathFreestandingPerformDualEqualityWriteCapableGap.lean | 315 | 351 |
| ProductPathFreestandingPerformDualEqualityWriteCapableGapMain.lean | (new) | 22 |

27 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 7** (prefer B36 dual-eq WRITE API -> `ProductPathFreestandingPerformDualEqualityWriteApi` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 7 choice (landed 2026-07-30)

**Family moved:** B36 dual-equality WRITE API PartialReady / Ok bulk -> **ProductPathFreestandingPerformDualEqualityWriteApi**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingPerformDualEqualityWriteApi.lean | Added `productPathFreestandingPerformDualEqualityWriteApiPartialReady` fold + theorem + example (Ok bulk already lived here; land-time gap open true / perform claimed false / StillUses true / dual-equality blocks true / Full long-name false kept for just/emit-wire honesty) |
| ProductPathFreestandingPerformDualEqualityWriteApiMain.lean | **New** thin Lake exe main (CapableGapMain / OfficialRetireMain pattern). Needed so SelfApplyFs can co-import DualEqualityWriteApi + CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingPerformDualEqualityWriteApi`; Ok aliases home Ok; PartialReady is chain fold `closePathPartialReady && DualEqualityWriteApi.PartialReady && living tip claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-dual-equality-write-api` root -> `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteApiMain` |
| nix hostSpecs | DualEqualityWriteApi block dual-pins PartialReady def + theorem; SelfApplyFs dual-eq WRITE API living-tip block retained with batch-7 note |
| emit-wire | DualEqualityWriteApi module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteApiMain` |
| residual / WATCHER / handoff | batch 7 done; Open batch 8 prefer B35 dual-eq WRITE close path (`ProductPathFreestandingPerformDualEqualityWriteClosePath`) |

| File | Before batch 7 | After batch 7 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6162 | 6111 |
| ProductPathFreestandingPerformDualEqualityWriteApi.lean | 836 | 873 |
| ProductPathFreestandingPerformDualEqualityWriteApiMain.lean | (new) | 23 |

26 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 8** (prefer B35 dual-eq WRITE close path -> `ProductPathFreestandingPerformDualEqualityWriteClosePath` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 8 choice (landed 2026-07-30)

**Family moved:** B35 dual-equality WRITE close path PartialReady / Ok bulk -> **ProductPathFreestandingPerformDualEqualityWriteClosePath**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingPerformDualEqualityWriteClosePath.lean | Added `productPathFreestandingPerformDualEqualityWriteClosePathPartialReady` fold + theorem + example (Ok bulk already lived here; land-time gap open true / not-gap-closed true / perform claimed false / StillUses true / dual-equality blocks true / Full long-name false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathFreestandingPerformDualEqualityWriteClosePathMain.lean | **New** thin Lake exe main (DualEqualityWriteApiMain / CapableGapMain pattern). Needed so SelfApplyFs can co-import DualEqualityWriteClosePath + DualEqualityWriteApi + CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingPerformDualEqualityWriteClosePath`; Ok aliases home Ok; PartialReady is chain fold `parityPartialReady && DualEqualityWriteClosePath.PartialReady && living tip claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-dual-equality-write-close-path` root -> `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteClosePathMain` |
| nix hostSpecs | DualEqualityWriteClosePath block dual-pins PartialReady def + theorem; SelfApplyFs dual-eq WRITE close path living-tip block retained with batch-8 note |
| emit-wire | DualEqualityWriteClosePath module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteClosePathMain` |
| residual / WATCHER / handoff | batch 8 done; Open batch 9 prefer B34 dual-eq WRITE parity (`ProductPathFreestandingPerformDualEqualityWriteParity`) |

| File | Before batch 8 | After batch 8 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6111 | 6059 |
| ProductPathFreestandingPerformDualEqualityWriteClosePath.lean | 314 | 350 |
| ProductPathFreestandingPerformDualEqualityWriteClosePathMain.lean | (new) | 24 |

25 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 9** (prefer B34 dual-eq WRITE parity -> `ProductPathFreestandingPerformDualEqualityWriteParity` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 9 choice (landed 2026-07-30)

**Family moved:** B34 dual-equality WRITE parity PartialReady / Ok bulk -> **ProductPathFreestandingPerformDualEqualityWriteParity**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingPerformDualEqualityWriteParity.lean | Added `productPathFreestandingPerformDualEqualityWriteParityPartialReady` fold + theorem + example (Ok bulk already lived here; land-time gap open true / Capable structural true / perform claimed false / StillUses true / dual-equality blocks true / Full long-name false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathFreestandingPerformDualEqualityWriteParityMain.lean | **New** thin Lake exe main (DualEqualityWriteClosePathMain / DualEqualityWriteApiMain pattern). Needed so SelfApplyFs can co-import DualEqualityWriteParity + DualEqualityWriteClosePath + DualEqualityWriteApi + CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingPerformDualEqualityWriteParity`; Ok aliases home Ok; PartialReady is chain fold `alternatePartialReady && DualEqualityWriteParity.PartialReady && living tip claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-dual-equality-write-parity` root -> `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteParityMain` |
| nix hostSpecs | New DualEqualityWriteParity module block dual-pins PartialReady def + theorem; SelfApplyFs dual-eq WRITE parity living-tip block retained with batch-9 note |
| emit-wire | DualEqualityWriteParity module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingPerformDualEqualityWriteParityMain` |
| residual / WATCHER / handoff | batch 9 done; Open batch 10 prefer B33 official-path alternate (or inventory next largest closed family still bulk in tip) |

| File | Before batch 9 | After batch 9 |
|------|---------------:|--------------:|
| SelfApplyFs.lean | 6059 | 6016 |
| ProductPathFreestandingPerformDualEqualityWriteParity.lean | 280 | 314 |
| ProductPathFreestandingPerformDualEqualityWriteParityMain.lean | (new) | 25 |

24 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 10** (prefer B33 official-path alternate -> `ProductPathFreestandingPerformOfficialPathAlternate` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 10 choice (landed 2026-07-30)

**Family moved:** B33 official-path alternate PartialReady / Ok bulk -> **ProductPathFreestandingPerformOfficialPathAlternate**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingPerformOfficialPathAlternate.lean | Added `productPathFreestandingPerformOfficialPathAlternatePartialReady` fold + theorem + example (Ok bulk already lived here; land-time AlternateNotOfficial true / dual-equality blocks true / StillUses true / perform claimed false / Full long-name false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathFreestandingPerformOfficialPathAlternateMain.lean | **New** thin Lake exe main (DualEqualityWriteParityMain / DualEqualityWriteClosePathMain pattern). Needed so SelfApplyFs can co-import OfficialPathAlternate + DualEqualityWriteParity + DualEqualityWriteClosePath + DualEqualityWriteApi + CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingPerformOfficialPathAlternate`; Ok aliases home Ok; PartialReady is chain fold `officialPathPartialReady && OfficialPathAlternate.PartialReady && living tip claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-official-path-alternate` root -> `SystemsLean.ProductPathFreestandingPerformOfficialPathAlternateMain` |
| nix hostSpecs | New OfficialPathAlternate module block dual-pins PartialReady def + theorem; SelfApplyFs official-path alternate living-tip block retained with batch-10 note |
| emit-wire | OfficialPathAlternate module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingPerformOfficialPathAlternateMain` |
| residual / WATCHER / handoff | batch 10 done; Open batch 11 prefer B32 official path (or inventory next largest closed family still bulk in tip) |

| File | Before batch 10 | After batch 10 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 6016 | 5979 |
| ProductPathFreestandingPerformOfficialPathAlternate.lean | 271 | 305 |
| ProductPathFreestandingPerformOfficialPathAlternateMain.lean | (new) | 26 |

23 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 11** (prefer B32 official path -> `ProductPathFreestandingPerformOfficialPath` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 11 choice (landed 2026-07-30)

**Family moved:** B32 official-path gap PartialReady / Ok bulk -> **ProductPathFreestandingPerformOfficialPath**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingPerformOfficialPath.lean | Added `productPathFreestandingPerformOfficialPathPartialReady` fold + theorem + example (Ok bulk already lived here; land-time StillUses true / retire required true / perform claimed false / Full long-name false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathFreestandingPerformOfficialPathMain.lean | **New** thin Lake exe main (OfficialPathAlternateMain / DualEqualityWriteParityMain pattern). Needed so SelfApplyFs can co-import OfficialPath + OfficialPathAlternate + DualEqualityWriteParity + DualEqualityWriteClosePath + DualEqualityWriteApi + CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingPerformOfficialPath`; Ok aliases home Ok; PartialReady is chain fold `evidencePartialReady && OfficialPath.PartialReady && living tip claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-official-path` root -> `SystemsLean.ProductPathFreestandingPerformOfficialPathMain` |
| nix hostSpecs | New OfficialPath module block dual-pins PartialReady def + theorem; SelfApplyFs official-path living-tip block retained with batch-11 note |
| emit-wire | OfficialPath module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingPerformOfficialPathMain` |
| residual / WATCHER / handoff | batch 11 done; Open batch 12 prefer B31 perform evidence (or inventory next largest closed family still bulk in tip) |

| File | Before batch 11 | After batch 11 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5979 | 5949 |
| ProductPathFreestandingPerformOfficialPath.lean | 221 | 252 |
| ProductPathFreestandingPerformOfficialPathMain.lean | (new) | 27 |

22 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 12** (prefer B31 perform evidence -> `ProductPathFreestandingPerformEvidence` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 12 choice (landed 2026-07-30)

**Family moved:** B31 perform evidence PartialReady / Ok bulk -> **ProductPathFreestandingPerformEvidence**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingPerformEvidence.lean | Added `productPathFreestandingPerformEvidencePartialReady` fold + theorem + example (Ok bulk already lived here; land-time perform claimed false / DependsOnLake true / Full long-name false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathFreestandingPerformEvidenceMain.lean | **New** thin Lake exe main (OfficialPathMain / OfficialPathAlternateMain pattern). Needed so SelfApplyFs can co-import Evidence + OfficialPath + OfficialPathAlternate + DualEqualityWriteParity + DualEqualityWriteClosePath + DualEqualityWriteApi + CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingPerformEvidence`; Ok aliases home Ok; PartialReady is chain fold `ownershipRegeneratePartialReady && Evidence.PartialReady && living tip claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-perform-evidence` root -> `SystemsLean.ProductPathFreestandingPerformEvidenceMain` |
| nix hostSpecs | New Evidence module block dual-pins PartialReady def + theorem; SelfApplyFs perform-evidence living-tip block retained with batch-12 note |
| emit-wire | Evidence module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingPerformEvidenceMain` |
| residual / WATCHER / handoff | batch 12 done; Open batch 13 prefer B22..B30 ownership regenerate (or inventory next largest closed family still bulk in tip) |

| File | Before batch 12 | After batch 12 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5949 | 5917 |
| ProductPathFreestandingPerformEvidence.lean | 224 | 252 |
| ProductPathFreestandingPerformEvidenceMain.lean | (new) | 28 |

21 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 13** (prefer B22..B30 ownership regenerate -> `ProductPathOwnershipRegenerate` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 13 choice (landed 2026-07-30)

**Family moved:** B22..B30 ownership regenerate PartialReady / Ok bulk -> **ProductPathOwnershipRegenerate**.

| Change | Detail |
|--------|--------|
| ProductPathOwnershipRegenerate.lean | Added `productPathOwnershipRegeneratePartialReady` fold + theorem + example (Ok bulk already lived here; land-time WithoutLake true / DependsOnLake true / Full long-name false / perform claimed false / ownership claimed false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathOwnershipRegenerateMain.lean | **New** thin Lake exe main (EvidenceMain / OfficialPathMain pattern). Needed so SelfApplyFs can co-import OwnershipRegenerate + Evidence + OfficialPath + ... without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathOwnershipRegenerate`; Ok aliases home Ok; PartialReady is chain fold `FullBarPartialReady && OwnershipRegenerate.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-ownership-regenerate` root -> `SystemsLean.ProductPathOwnershipRegenerateMain` |
| nix hostSpecs | New OwnershipRegenerate module block dual-pins PartialReady def + theorem; SelfApplyFs ownership-regenerate living-tip block retained with batch-13 note |
| emit-wire | OwnershipRegenerate module tokens include PartialReady; lakefile token `SystemsLean.ProductPathOwnershipRegenerateMain` |
| residual / WATCHER / handoff | batch 13 done; Open batch 14 prefer B21 FullBar (`ProductPathFreestandingCapableFullBar`); WATCHER fenced block kept |

| File | Before batch 13 | After batch 13 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5917 | 5866 |
| ProductPathOwnershipRegenerate.lean | 351 | 387 |
| ProductPathOwnershipRegenerateMain.lean | (new) | 29 |

20 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 14** (prefer B21 FullBar -> `ProductPathFreestandingCapableFullBar` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 14 choice (landed 2026-07-30)

**Family moved:** B21 FullBar PartialReady / Ok bulk -> **ProductPathFreestandingCapableFullBar**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapableFullBar.lean | Added `productPathFreestandingCapableFullBarPartialReady` fold + theorem + example (Ok bulk already lived here; land-time closed substrate true / DependsOnLake true / Full long-name false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathFreestandingCapableFullBarMain.lean | **New** thin Lake exe main (OwnershipRegenerateMain / EvidenceMain pattern). Needed so SelfApplyFs can co-import FullBar + OwnershipRegenerate + Evidence + OfficialPath + OfficialPathAlternate + DualEqualityWriteParity + DualEqualityWriteClosePath + DualEqualityWriteApi + CapableGap + OfficialRetire + PerformClaimed + OwnershipClaimed + SelfHostComplete without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapableFullBar`; Ok aliases home Ok; PartialReady is chain fold `InstallOutPartialReady && FullBar.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-capable-full-bar` root -> `SystemsLean.ProductPathFreestandingCapableFullBarMain` |
| nix hostSpecs | New FullBar module block dual-pins PartialReady def + theorem; SelfApplyFs FullBar living-tip block retained with batch-14 note |
| emit-wire | FullBar module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableFullBarMain` |
| residual / WATCHER / handoff | batch 14 done; Open batch 15 prefer B20 InstallOut (`ProductPathFreestandingCapableInstallOut`); WATCHER fenced block kept |

| File | Before batch 14 | After batch 14 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5866 | 5845 |
| ProductPathFreestandingCapableFullBar.lean | 199 | 228 |
| ProductPathFreestandingCapableFullBarMain.lean | (new) | 30 |

19 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 15** (prefer B20 InstallOut -> `ProductPathFreestandingCapableInstallOut` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 15 choice (landed 2026-07-30)

**Family moved:** B20 InstallOut PartialReady / Ok bulk -> **ProductPathFreestandingCapableInstallOut**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapableInstallOut.lean | Added `productPathFreestandingCapableInstallOutPartialReady` fold + theorem + example (Ok bulk already lived here; land-time AuthorityNotEmit true / DependsOnLake true / InstallOutOpen false / Full long-name false kept for just/emit-wire honesty); Main already split (InstallOutMain) |
| ProductPathFreestandingCapableInstallOutMain.lean | Already existed (SKELETON thin Lake exe). No new Main this batch. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapableInstallOut`; Ok aliases home Ok; PartialReady is chain fold `RegeneratePartialReady && InstallOut.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root already `SystemsLean.ProductPathFreestandingCapableInstallOutMain` |
| nix hostSpecs | New InstallOut module block dual-pins PartialReady def + theorem; SelfApplyFs InstallOut living-tip block retained with batch-15 note |
| emit-wire | InstallOut module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableInstallOutMain` |
| residual / WATCHER / handoff | batch 15 done; Open batch 16 prefer B19 Regenerate (`ProductPathFreestandingCapableRegenerate`); WATCHER fenced block kept |

| File | Before batch 15 | After batch 15 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5845 | 5830 |
| ProductPathFreestandingCapableInstallOut.lean | 248 | 276 |
| ProductPathFreestandingCapableInstallOutMain.lean | (existing) | 19 |

18 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 16** (prefer B19 Regenerate -> `ProductPathFreestandingCapableRegenerate` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 16 choice (landed 2026-07-30)

**Family moved:** B19 Regenerate PartialReady / Ok bulk -> **ProductPathFreestandingCapableRegenerate**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapableRegenerate.lean | Added `productPathFreestandingCapableRegeneratePartialReady` fold + theorem + example (Ok bulk already lived here; land-time AuthorityNotEmit true / DependsOnLake true / InstallOutOpen false / Full long-name false kept for just/emit-wire honesty); removed top-level `main` |
| ProductPathFreestandingCapableRegenerateMain.lean | **New** thin Lake exe main (FullBarMain / InstallOutMain pattern). Needed so SelfApplyFs can co-import Regenerate + InstallOut + FullBar + ... without top-level `main` clash. Header uses SKELETON (not UNIT_SURFACE) so unit walk stays honest |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapableRegenerate`; Ok aliases home Ok; PartialReady is chain fold `WriteHcPartialReady && Regenerate.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | `slake-freestanding-capable-regenerate` root -> `SystemsLean.ProductPathFreestandingCapableRegenerateMain` |
| nix hostSpecs | New Regenerate module block dual-pins PartialReady def + theorem; SelfApplyFs Regenerate living-tip block retained with batch-16 note |
| emit-wire | Regenerate module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableRegenerateMain` |
| residual / WATCHER / handoff | batch 16 done; Open batch 17 prefer B18 WriteHc (`ProductPathFreestandingCapableWriteHc`); WATCHER fenced block kept |

| File | Before batch 16 | After batch 16 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5830 | 5815 |
| ProductPathFreestandingCapableRegenerate.lean | 189 | 215 |
| ProductPathFreestandingCapableRegenerateMain.lean | (new) | 32 |

17 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 17** (prefer B18 WriteHc -> `ProductPathFreestandingCapableWriteHc` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 17 choice (landed 2026-07-30)

**Family moved:** B18 WriteHc PartialReady / Ok bulk -> **ProductPathFreestandingCapableWriteHc**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapableWriteHc.lean | Added `productPathFreestandingCapableWriteHcPartialReady` fold + theorem + example (Ok bulk already lived here; land-time AuthorityNotEmit true / DependsOnLake true / Full long-name false kept for just/emit-wire honesty) |
| ProductPathFreestandingCapableWriteHcMain.lean | **Already existed** (SKELETON thin Lake exe). No new Main this batch. SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapableWriteHc`; Ok aliases home Ok; PartialReady is chain fold `ComposePartialReady && WriteHc.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root already `SystemsLean.ProductPathFreestandingCapableWriteHcMain` (unchanged) |
| nix hostSpecs | New WriteHc module block dual-pins PartialReady def + theorem; SelfApplyFs WriteHc living-tip block retained with batch-17 note |
| emit-wire | WriteHc module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableWriteHcMain` |
| residual / WATCHER / handoff | batch 17 done; Open batch 18 prefer B17 Compose (`ProductPathFreestandingCapableCompose`); WATCHER fenced block kept |

| File | Before batch 17 | After batch 17 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5815 | 5802 |
| ProductPathFreestandingCapableWriteHc.lean | 509 | 540 |
| ProductPathFreestandingCapableWriteHcMain.lean | (existing) | 18 |

16 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 18** (prefer B17 Compose -> `ProductPathFreestandingCapableCompose` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 18 choice (landed 2026-07-30)

**Family moved:** B17 freestanding-capable COMPOSE PartialReady / Ok bulk -> **ProductPathFreestandingCapableCompose**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapableCompose.lean | Added Full long-name land-time pin false + `productPathFreestandingCapableComposePartialReady` fold + theorem + example (Ok bulk already lived here; land-time AuthorityNotEmit true / DependsOnLake true / Full long-name false kept for just/emit-wire honesty); contiguous Not residual free honesty string |
| ProductPathFreestandingCapableComposeMain.lean | **Already existed** (SKELETON thin Lake exe). No new Main this batch. SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapableCompose`; Ok aliases home Ok; PartialReady is chain fold `ReadPartialReady && Compose.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root already `SystemsLean.ProductPathFreestandingCapableComposeMain` (unchanged) |
| nix hostSpecs | New Compose module block dual-pins PartialReady def + theorem + Full long-name false; SelfApplyFs Compose living-tip block retained with batch-18 note |
| emit-wire | Compose module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableComposeMain` |
| inventory | Batch 18 row in this file |
| residual / WATCHER / handoff | batch 18 done; Open batch 19 prefer B16 Read (`ProductPathFreestandingCapableRead`); WATCHER fenced block kept |

| File | Before batch 18 | After batch 18 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5802 | 5790 |
| ProductPathFreestandingCapableCompose.lean | 303 | 334 |
| ProductPathFreestandingCapableComposeMain.lean | (existing) | 18 |

15 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 19** (prefer B16 Read -> `ProductPathFreestandingCapableRead` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 19 choice (landed 2026-07-30)

**Family moved:** B16 freestanding-capable READ PartialReady / Ok bulk -> **ProductPathFreestandingCapableRead**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapableRead.lean | Added lake-free recipe pin + Full long-name land-time pin false + `productPathFreestandingCapableReadPartialReady` fold + theorem + example (Ok bulk already lived here; extended Ok with lake-free recipe; land-time AuthorityNotEmit true / DependsOnLake true / Full long-name false kept for just/emit-wire honesty); contiguous Not residual free honesty string |
| ProductPathFreestandingCapableReadMain.lean | **Already existed** (SKELETON thin Lake exe). No new Main this batch. SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapableRead`; Ok aliases home Ok; PartialReady is chain fold `StepContractPartialReady && Read.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root already `SystemsLean.ProductPathFreestandingCapableReadMain` (unchanged) |
| nix hostSpecs | New Read module block dual-pins PartialReady def + theorem + Full long-name false; SelfApplyFs Read living-tip block retained with batch-19 note |
| emit-wire | Read module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableReadMain` |
| inventory | Batch 19 row in this file |
| residual / WATCHER / handoff | batch 19 done; Open batch 20 prefer B15 StepContract (`ProductPathFreestandingCapableStepContract`); WATCHER fenced block kept |

| File | Before batch 19 | After batch 19 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5790 | 5778 |
| ProductPathFreestandingCapableRead.lean | 251 | 293 |
| ProductPathFreestandingCapableReadMain.lean | (existing) | 16 |

14 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 20** (prefer B15 StepContract -> `ProductPathFreestandingCapableStepContract` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 20 choice (landed 2026-07-30)

**Family moved:** B15 freestanding-capable step contract PartialReady / Ok bulk -> **ProductPathFreestandingCapableStepContract**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapableStepContract.lean | Added `productPathFreestandingCapableStepContractPartialReady` fold + theorem + example (Ok bulk already lived here; land-time AuthorityNotEmit true / Read+Compose+WriteHc satisfied true / Full long-name false kept for just/emit-wire honesty); contiguous Not residual free honesty string; top-level main split |
| ProductPathFreestandingCapableStepContractMain.lean | **New** (SKELETON thin Lake exe). SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapableStepContract`; Ok aliases home Ok; PartialReady is chain fold `CapablePartialReady && StepContract.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root `SystemsLean.ProductPathFreestandingCapableStepContractMain` |
| nix hostSpecs | New StepContract module block dual-pins PartialReady def + theorem + Full long-name false; SelfApplyFs StepContract living-tip block retained with batch-20 note |
| emit-wire | StepContract module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableStepContractMain` |
| inventory | Batch 20 row in this file |
| residual / WATCHER / handoff | batch 20 done; Open batch 21 prefer B14 Capable gap; WATCHER fenced block kept |

| File | Before batch 20 | After batch 20 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5778 | 5743 |
| ProductPathFreestandingCapableStepContract.lean | 253 | 282 |
| ProductPathFreestandingCapableStepContractMain.lean | (new) | 17 |

13 PartialReady families still bulk in SelfApplyFs. Next Open: **SelfApplyFs split batch 21** (prefer B14 Capable gap -> `ProductPathFreestandingCapable` if present / ranked; else next largest closed family). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 21 choice (landed 2026-07-30)

**Family moved:** B14 freestanding-capable gap PartialReady / Ok bulk -> **ProductPathFreestandingCapable**.

| Change | Detail |
|--------|--------|
| ProductPathFreestandingCapable.lean | Added `productPathFreestandingCapablePartialReady` fold + theorem + example (Ok bulk already lived here; land-time InstallOnly + CapableRead/Compose/WriteHc true / FullPerform false kept for just/emit-wire honesty); contiguous Not residual free honesty string; top-level main split |
| ProductPathFreestandingCapableMain.lean | **New** (SKELETON thin Lake exe). SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathFreestandingCapable`; Ok aliases home Ok; PartialReady is chain fold `WriteHcPartialReady && Capable.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root `SystemsLean.ProductPathFreestandingCapableMain` |
| nix hostSpecs | New Capable module block dual-pins PartialReady def + theorem + FullPerform false; SelfApplyFs Capable living-tip block retained with batch-21 note |
| emit-wire | Capable module tokens include PartialReady; lakefile token `SystemsLean.ProductPathFreestandingCapableMain` |
| inventory | Batch 21 row in this file |
| residual / WATCHER / handoff | batch 21 done; Open batch 22 prefer B13 WRITE-HC perform; WATCHER fenced block kept |

| File | Before batch 21 | After batch 21 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5743 | 5712 |
| ProductPathFreestandingCapable.lean | 227 | 256 |
| ProductPathFreestandingCapableMain.lean | (new) | 17 |

12 PartialReady families still bulk in SelfApplyFs (B2..B13 perform/writer path). Next Open: **SelfApplyFs split batch 22** (prefer B13 WRITE-HC perform -> `ProductPathWriteHc` if present / ranked; else next largest closed family among B2..B12). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 22 choice (landed 2026-07-30)

**Family moved:** B13 WRITE-HC perform PartialReady / Ok bulk -> **ProductPathWriteHc**.

| Change | Detail |
|--------|--------|
| ProductPathWriteHc.lean | Added `productPathPerformWriteHcOk` + `productPathPerformWriteHcPartialReady` fold + theorem + example (land-time DependsOnLake true / EntrypointClaimed true; no living-tip perform/ownership/complete true defs -- emit-wire forbidden); contiguous Not residual free honesty string; top-level main split |
| ProductPathWriteHcMain.lean | **New** (SKELETON thin Lake exe). SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathWriteHc`; Ok aliases home Ok; PartialReady is chain fold `ComposePartialReady && WriteHc.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root `SystemsLean.ProductPathWriteHcMain` |
| nix hostSpecs | New WriteHc module block dual-pins PartialReady def + theorem + DependsOnLake/EntrypointClaimed true; SelfApplyFs WriteHc living-tip block retained with batch-22 note |
| emit-wire | WriteHc module tokens include PartialReady; lakefile token `SystemsLean.ProductPathWriteHcMain` |
| inventory | Batch 22 row in this file |
| residual / WATCHER / handoff | batch 22 done; Open batch 23 prefer B12 COMPOSE perform; WATCHER fenced block kept |

| File | Before batch 22 | After batch 22 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5712 | 5706 |
| ProductPathWriteHc.lean | 120 | 190 |
| ProductPathWriteHcMain.lean | (new) | 17 |

11 PartialReady families still bulk in SelfApplyFs (B2..B12 perform/writer path). Next Open: **SelfApplyFs split batch 23** (prefer B12 COMPOSE perform -> `ProductPathComposePlan` if present / ranked; else next largest closed family among B2..B11). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 23 choice (landed 2026-07-30)

**Family moved:** B12 COMPOSE perform PartialReady / Ok bulk -> **ProductPathComposePlan**.

| Change | Detail |
|--------|--------|
| ProductPathComposePlan.lean | Added `productPathPerformComposeOk` + `productPathPerformComposePartialReady` fold + theorem + example (land-time DependsOnLake true / EntrypointClaimed true; no living-tip perform/ownership/complete true defs -- emit-wire forbidden); contiguous Not residual free honesty string; top-level main split |
| ProductPathComposePlanMain.lean | **New** (SKELETON thin Lake exe). SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathComposePlan`; Ok aliases home Ok; PartialReady is chain fold `ReadPartialReady && ComposePlan.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root `SystemsLean.ProductPathComposePlanMain` |
| nix hostSpecs | New ComposePlan module block dual-pins PartialReady def + theorem + DependsOnLake/EntrypointClaimed true; SelfApplyFs Compose living-tip block retained with batch-23 note |
| emit-wire | Compose module tokens include PartialReady; lakefile token `SystemsLean.ProductPathComposePlanMain` |
| inventory | Batch 23 row in this file |
| residual / WATCHER / handoff | batch 23 done; Open batch 24 prefer B11 READ perform; WATCHER fenced block kept |

| File | Before batch 23 | After batch 23 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5706 | 5700 |
| ProductPathComposePlan.lean | 181 | 247 |
| ProductPathComposePlanMain.lean | (new) | 17 |

10 PartialReady families still bulk in SelfApplyFs (B2..B11 perform/writer path). Next Open: **SelfApplyFs split batch 24** (prefer B11 READ perform -> `ProductPathReadSsot` if present / ranked; else next largest closed family among B2..B10). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 24 choice (landed 2026-07-30)

**Family moved:** B11 READ perform PartialReady / Ok bulk -> **ProductPathReadSsot**.

| Change | Detail |
|--------|--------|
| ProductPathReadSsot.lean | Added `productPathPerformReadOk` + `productPathPerformReadPartialReady` fold + theorem + example (land-time DependsOnLake true / EntrypointClaimed true; no living-tip perform/ownership/complete true defs -- emit-wire forbidden); contiguous Not residual free honesty string; top-level main split |
| ProductPathReadSsotMain.lean | **New** (SKELETON thin Lake exe). SelfApplyFs co-import does not clash on top-level `main`. |
| SelfApplyFs.lean | `import SystemsLean.ProductPathReadSsot`; Ok aliases home Ok; PartialReady is chain fold `StepPartialReady && ReadSsot.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe string literals kept on SelfApplyFs path for presence/just |
| lakefile.toml | root `SystemsLean.ProductPathReadSsotMain` |
| nix hostSpecs | New ReadSsot module block dual-pins PartialReady def + theorem + DependsOnLake/EntrypointClaimed true; SelfApplyFs Read living-tip block retained with batch-24 note |
| emit-wire | Read module tokens include PartialReady; lakefile token `SystemsLean.ProductPathReadSsotMain`; forbidden living-tip claim true defs on Read module |
| inventory | Batch 24 row in this file |
| residual / WATCHER / handoff | batch 24 done; Open batch 25 prefer B10 STEP perform; WATCHER fenced block kept |

| File | Before batch 24 | After batch 24 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5700 | 5695 |
| ProductPathReadSsot.lean | 139 | 204 |
| ProductPathReadSsotMain.lean | (new) | 17 |

9 PartialReady families still bulk in SelfApplyFs (B2..B10 perform/writer path). Next Open: **SelfApplyFs split batch 25** (prefer B10 STEP perform or inventory next largest closed family among B2..B9). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 25 choice (landed 2026-07-30)

**Family moved:** B10 STEP perform PartialReady / Ok bulk -> **ProductPathPerformStep**.

| Change | Detail |
|--------|--------|
| ProductPathPerformStep.lean | **New** short home: `productPathPerformStepOk` + `productPathPerformStepPartialReady` fold + theorem + example (land-time entrypoint claimed true / InstallStepLakeFreeCapable true / DependsOnLake true; no living-tip perform/ownership/complete true defs -- emit-wire forbidden); contiguous Not residual free honesty string; no Lake exe / no *Main (process-glue just install-freestanding-c-out only) |
| SelfApplyFs.lean | `import SystemsLean.ProductPathPerformStep`; Ok aliases home Ok; PartialReady is chain fold `PerformPartialReady && PerformStep.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe/entrypoint literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean home rejected | ProductPath imports SelfApplyFs (cycle); short ProductPathPerformStep used instead of inventory "ProductPath" label |
| nix hostSpecs | New PerformStep module block dual-pins PartialReady def + theorem + entrypoint/InstallStep/DependsOnLake true; SelfApplyFs STEP living-tip block retained with batch-25 note |
| emit-wire | STEP module tokens include PartialReady; forbidden living-tip claim true defs on STEP module |
| inventory | Batch 25 row in this file; home column updated to ProductPathPerformStep |
| residual / WATCHER / handoff | batch 25 done; Open batch 26 prefer B9 perform gap; WATCHER fenced block kept |

| File | Before batch 25 | After batch 25 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5695 | 5698 |
| ProductPathPerformStep.lean | (new) | 148 |

8 PartialReady families still bulk in SelfApplyFs (B2..B9 perform/writer path). Next Open: **SelfApplyFs split batch 26** (prefer B9 perform gap or inventory next largest closed family among B2..B8). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 26 choice (landed 2026-07-30)

**Family moved:** B9 perform gap PartialReady / Ok bulk -> **ProductPathPerform**.

| Change | Detail |
|--------|--------|
| ProductPathPerform.lean | **New** short home: `productPathPerformOk` + `productPathPerformPartialReady` fold + theorem + example (land-time DependsOnLake true / InstallStepLakeFreeCapable true; no living-tip perform/ownership/complete true defs -- emit-wire forbidden); contiguous Not residual free honesty string; no Lake exe / no *Main (gap naming + honesty pins only) |
| SelfApplyFs.lean | `import SystemsLean.ProductPathPerform`; Ok aliases home Ok; PartialReady is chain fold `OwnershipInputsPartialReady && Perform.PartialReady && greppable living tip path pins + claim pins`; greppable stage/recipe/cite/gap literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean home rejected | ProductPath imports SelfApplyFs (cycle); short ProductPathPerform used instead of inventory "ProductPath" label |
| nix hostSpecs | New Perform module block dual-pins PartialReady def + theorem + DependsOnLake/InstallStep true; SelfApplyFs PERFORM living-tip block retained with batch-26 note |
| emit-wire | PERFORM module tokens include PartialReady; forbidden living-tip claim true defs on Perform module |
| inventory | Batch 26 row in this file; home column updated to ProductPathPerform |
| residual / WATCHER / handoff | batch 26 done; Open batch 27 prefer B8 ownership inputs; WATCHER fenced block kept |

| File | Before batch 26 | After batch 26 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5698 | 5703 |
| ProductPathPerform.lean | (new) | 135 |

7 PartialReady families still bulk in SelfApplyFs (B2..B8 perform/writer path). Next Open: **SelfApplyFs split batch 27** (prefer B8 ownership inputs or inventory next largest closed family among B2..B7). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 27 choice (landed 2026-07-30)

**Family moved:** B8 ownership inputs PartialReady / Ok bulk -> **ProductPathOwnershipInputs**.

| Change | Detail |
|--------|--------|
| ProductPathOwnershipInputs.lean | **New** short home: `productPathOwnershipInputsOk` + `productPathOwnershipInputsPartialReady` fold + theorem + example (land-time Mult..Out SSOT/emit/Out/dual-SSOT cites; no living-tip perform/ownership/complete true defs -- emit-wire forbidden); contiguous Not residual free honesty string; no Lake exe / no *Main (inputs bar + honesty pins only) |
| SelfApplyFs.lean | `import SystemsLean.ProductPathOwnershipInputs`; Ok aliases home Ok; PartialReady is chain fold `WriterPathExecutionPartialReady && OwnershipInputs.PartialReady && greppable living tip path pins + claim pins`; greppable stage/SSOT/emit/dual-SSOT literals kept on SelfApplyFs path for presence/just; living tip `productPathFreestandingOwnershipClaimed` SSoT stays true here |
| ProductPath.lean home rejected | ProductPath imports SelfApplyFs (cycle); short ProductPathOwnershipInputs used instead of inventory "ProductPath" label |
| nix hostSpecs | New OwnershipInputs module block dual-pins PartialReady def + theorem + Mult..Out cites; SelfApplyFs OWNERSHIP living-tip block retained with batch-27 note |
| emit-wire | OWNERSHIP module tokens include PartialReady; forbidden living-tip claim true defs on OwnershipInputs module |
| inventory | Batch 27 row in this file; home column updated to ProductPathOwnershipInputs |
| residual / WATCHER / handoff | batch 27 done; Open batch 28 prefer B7 writer path exec; WATCHER fenced block kept |

| File | Before batch 27 | After batch 27 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5703 | 5700 |
| ProductPathOwnershipInputs.lean | (new) | 139 |

6 PartialReady families still bulk in SelfApplyFs (B2..B7 writer/kernel path). Next Open: **SelfApplyFs split batch 28** (prefer B7 writer path exec or inventory next largest closed family among B2..B6). Tip still multi-thousand; short ProductPathFreestanding rename after more split.

## Batch 28 (2026-07-30) -- B7 writer path exec

**Family moved:** B7 writer path exec PartialReady / Ok bulk ->
**ProductPathWriterPathExec** (**new** short home)

| Change | Detail |
|--------|--------|
| ProductPathWriterPathExec.lean | **New**: `productWriterPathExecutionOk` + `productWriterPathExecutionPartialReady` fold + theorem + example (land-time host execution cites load/render/write/install + Lake emit path; no living-tip perform/ownership/complete true defs -- emit-wire forbids those on this module); contiguous Not residual free honesty string; **no *Main** (execution cites + honesty pins only, not a Lake exe) |
| SelfApplyFs.lean | `import SystemsLean.ProductPathWriterPathExec`; Ok aliases home Ok; PartialReady is chain fold `WriterPathPlanPartialReady && WriterPathExec.PartialReady && bootstrap remains`; greppable stage/fn/recipe/module-cite literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean rejected as home | ProductPath imports SelfApplyFs (would cycle); short ProductPathWriterPathExec used instead of inventory "WriterPathExec" bare label |
| nix hostSpecs | New WriterPathExec module block dual-pins PartialReady def + theorem + exec cites; SelfApplyFs WRITER-PATH-EXEC living-tip block retained with batch-28 note + module cite |
| emit-wire | WRITER-PATH-EXEC module path/tokens/forbidden living-tip claim true defs on WriterPathExec module; host pin still requires tip dual-pins |
| inventory | Batch 28 row; home column -> ProductPathWriterPathExec; host-partial-inventory WriterPathExec row |
| residual / WATCHER / handoff | batch 28 done; Open batch 29 prefer B6 writer path plan; WATCHER fenced block kept |

| File | Before batch 28 | After batch 28 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5700 | 5708 |
| ProductPathWriterPathExec.lean | (new) | 167 |

Net tip ~flat dual-pin. **5** PartialReady families still bulk in SelfApplyFs (B2..B6). Structural win is bulk authority off the tip path.

Next Open: **SelfApplyFs split batch 29** -- prefer B6 writer path plan PartialReady
family (`productWriterPathPlanPartialReady`) or inventory next largest closed
family still bulk in tip among B2..B5.

## Batch 29 (2026-07-30) -- B6 writer path plan

**Family moved:** B6 writer path plan PartialReady / Ok bulk ->
**ProductPathWriterPathPlan** (**new** short home)

| Change | Detail |
|--------|--------|
| ProductPathWriterPathPlan.lean | **New**: `productWriterPathPlanOk` + `productWriterPathPlanPartialReady` fold + theorem + example (land-time ordered WRITER-PATH-STEP-* plan cites + Out/Lake emit path; no living-tip perform/ownership/complete true defs -- emit-wire forbids those on this module); contiguous Not residual free honesty string; **no *Main** (plan ids + honesty pins only, not a Lake exe) |
| SelfApplyFs.lean | `import SystemsLean.ProductPathWriterPathPlan`; Ok aliases home Ok; PartialReady is chain fold `WriterSurfacePartialReady && WriterPathPlan.PartialReady && bootstrap remains`; greppable stage/step/module-cite literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean rejected as home | ProductPath imports SelfApplyFs (would cycle); short ProductPathWriterPathPlan used instead of inventory bare "WriterPathPlan" label |
| nix hostSpecs | New WriterPathPlan module block dual-pins PartialReady def + theorem + plan step cites; SelfApplyFs WRITER-PATH-PLAN living-tip block retained with batch-29 note + module cite |
| emit-wire | WRITER-PATH-PLAN module path/tokens/forbidden living-tip claim true defs on WriterPathPlan module; host pin still requires tip dual-pins |
| inventory | Batch 29 row; home column -> ProductPathWriterPathPlan; host-partial-inventory WriterPathPlan row |
| residual / WATCHER / handoff | batch 29 done; Open batch 30 prefer B5 writer surface; WATCHER fenced block kept |

| File | Before batch 29 | After batch 29 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5708 | 5717 |
| ProductPathWriterPathPlan.lean | (new) | 140 |

Net tip ~flat dual-pin. **4** PartialReady families still bulk in SelfApplyFs (B2..B5). Structural win is bulk authority off the tip path.

Next Open: **SelfApplyFs split batch 30** -- prefer B5 writer surface PartialReady
family (`productWriterSurfacePartialReady`) or inventory next largest closed
family still bulk in tip among B2..B4.

## Batch 30 (2026-07-30) -- B5 writer surface

**Family moved:** B5 writer surface PartialReady / Ok bulk ->
**ProductPathWriterSurface** (**new** short home)

| Change | Detail |
|--------|--------|
| ProductPathWriterSurface.lean | **New**: `productWriterSurfaceOk` + `productWriterSurfacePartialReady` fold + theorem + example (land-time plan/apply/body + ownership + B-bar Out API cites; no living-tip perform/ownership/complete true defs -- emit-wire forbids those on this module); contiguous Not residual free honesty string; **no *Main** (surface cites + honesty pins only, not a Lake exe) |
| SelfApplyFs.lean | `import SystemsLean.ProductPathWriterSurface`; Ok aliases home Ok; PartialReady is chain fold `BootstrapPartialReady && WriterSurface.PartialReady`; greppable stage/api/ownership/module-cite literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean rejected as home | ProductPath imports SelfApplyFs (would cycle); short ProductPathWriterSurface used instead of inventory bare "WriterSurface" label |
| nix hostSpecs | New WriterSurface module block dual-pins PartialReady def + theorem + API cites; SelfApplyFs WRITER-SURFACE living-tip block retained with batch-30 note + module cite |
| emit-wire | WRITER-SURFACE module path/tokens/forbidden living-tip claim true defs on WriterSurface module; host pin still requires tip dual-pins |
| inventory | Batch 30 row; home column -> ProductPathWriterSurface; host-partial-inventory WriterSurface row |
| residual / WATCHER / handoff | batch 30 done; Open batch 31 prefer B4 Lake bootstrap honesty; WATCHER fenced block kept |

| File | Before batch 30 | After batch 30 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5717 | 5722 |
| ProductPathWriterSurface.lean | (new) | 144 |

Net tip ~flat dual-pin. **3** PartialReady families still bulk in SelfApplyFs (B2..B4). Structural win is bulk authority off the tip path.

Next Open: **SelfApplyFs split batch 31** -- prefer B4 Lake bootstrap honesty PartialReady
family (`productPathHostLakeBootstrapPartialReady`) or inventory next largest closed
family still bulk in tip among B2..B3.

## Batch 31 (2026-07-30) -- B4 Lake bootstrap honesty

**Family moved:** B4 Lake bootstrap honesty PartialReady / Ok bulk ->
**BootstrapHonesty** (**new** short home; inventory name)

| Change | Detail |
|--------|--------|
| BootstrapHonesty.lean | **New**: `productPathBootstrapSurfaceOk` + `productPathHostLakeBootstrapRemains` + `productPathHostLakeBootstrapPartialReady` fold + theorems + examples (land-time remains + Lake writer path cites; no living-tip perform/ownership/complete true defs -- emit-wire forbids those on this module); contiguous Not residual free honesty string; **no *Main** (honesty cites + remains pin only, not a Lake exe); no FreestandingEmit import (path cite strings only) |
| SelfApplyFs.lean | `import SystemsLean.BootstrapHonesty`; surface Ok aliases home Ok; PartialReady is chain fold `productOutKernelEvidencePartialReady && BootstrapHonesty.PartialReady`; **remains `:= true` literal kept on tip** (emit-wire/host pin require exact form on SelfApplyFs path); greppable stage/writer-path/module-cite literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean rejected as home | ProductPath imports SelfApplyFs (would cycle); short BootstrapHonesty used (inventory name) |
| nix hostSpecs | New BootstrapHonesty module block dual-pins PartialReady def + theorem + remains + writer path cites; SelfApplyFs BOOTSTRAP living-tip block retained with batch-31 note + module cite |
| emit-wire | BOOTSTRAP module path/tokens/forbidden living-tip claim true defs on BootstrapHonesty module (via emit-product + specs.nix inherit join + default.nix scan); host pin still requires tip dual-pins including remains := true |
| inventory | Batch 31 row; home column -> BootstrapHonesty; host-partial-inventory BootstrapHonesty row |
| residual / WATCHER / handoff | batch 31 done; Open batch 32 prefer B3 product Out kernel evidence; WATCHER fenced block kept |

| File | Before batch 31 | After batch 31 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5722 | 5735 |
| BootstrapHonesty.lean | (new) | 139 |

Net tip ~flat dual-pin (+13 greppable literals). **2** PartialReady families still bulk in SelfApplyFs (B2..B3). Structural win is bulk authority off the tip path.

Next Open: **SelfApplyFs split batch 32** -- prefer B3 product Out kernel evidence PartialReady
family (`productOutKernelEvidencePartialReady`) or inventory next largest closed
family still bulk in tip (B2 kernel self-apply).

## Batch 32 (2026-07-30) -- B3 product Out kernel evidence

**Family moved:** B3 product Out kernel evidence PartialReady / Ok bulk ->
**ProductOutKernel** (**new** short home; inventory name)

| Change | Detail |
|--------|--------|
| ProductOutKernel.lean | **New**: `productOutKernelBarSurfaceOk` + `productOutKernelEvidencePartialReady` fold + theorem + examples (land-time Out path + B-bar Mult..IR API cites; no living-tip perform/ownership/complete true defs -- emit-wire forbids those on this module); contiguous Not residual free honesty string; **no *Main** (Out-first B-bar consumer evidence cites only, not a Lake exe); no FreestandingEmit import (path cite strings only) |
| SelfApplyFs.lean | `import SystemsLean.ProductOutKernel`; surface Ok aliases home Ok; PartialReady is chain fold `productKernelSelfApplyPartialReady && ProductOutKernel.PartialReady`; greppable stage/Out-path/API/module-cite literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean rejected as home | ProductPath imports SelfApplyFs (would cycle); short ProductOutKernel used (inventory name) |
| nix hostSpecs | New ProductOutKernel module block dual-pins PartialReady def + theorem + Out path + B-bar API cites; SelfApplyFs PRODUCT-OUT living-tip block retained with batch-32 note + module cite |
| emit-wire | PRODUCT-OUT module path/tokens/forbidden living-tip claim true defs on ProductOutKernel module (via emit-product + specs.nix inherit join + default.nix scan); host pin still requires tip dual-pins |
| inventory | Batch 32 row; home column -> ProductOutKernel; host-partial-inventory ProductOutKernel row |
| residual / WATCHER / handoff | batch 32 done; Open batch 33 prefer B2 kernel self-apply; WATCHER fenced block kept |

| File | Before batch 32 | After batch 32 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5735 | 5745 |
| ProductOutKernel.lean | (new) | 129 |

Net tip ~flat dual-pin (+10 greppable literals). **1** PartialReady family still bulk in SelfApplyFs (B2). Structural win is bulk authority off the tip path.

Next Open: **SelfApplyFs split batch 33** -- prefer B2 kernel self-apply PartialReady
family (`productKernelSelfApplyPartialReady`) or done-for-now if no more PartialReady bulk.

## Batch 33 (2026-07-30) -- B2 product kernel self-application (last PartialReady bulk)

**Family moved:** B2 product kernel self-application PartialReady / Ok bulk ->
**KernelSelfApply** (**new** short home; inventory name; not SelfApply)

| Change | Detail |
|--------|--------|
| KernelSelfApply.lean | **New**: `productKernelBarSurfaceOk` + `productKernelSelfApplyPartialReady` fold + theorem + examples (land-time B-bar HOST-EMIT Mult..Program cites; no living-tip perform/ownership/complete true defs -- emit-wire forbids those on this module); contiguous Not residual free honesty string; **no *Main** (B-bar input cites only, not a Lake exe); no FreestandingEmit import (path cite strings only); name avoids SelfApply.lean collision |
| SelfApplyFs.lean | `import SystemsLean.KernelSelfApply`; surface Ok aliases home Ok; PartialReady is chain fold `freestandingSelfApplyReady && KernelSelfApply.PartialReady`; greppable stage/B-bar/module-cite literals kept on SelfApplyFs path for presence/just |
| ProductPath.lean rejected as home | ProductPath imports SelfApplyFs (would cycle); short KernelSelfApply used (inventory name) |
| nix hostSpecs | New KernelSelfApply module block dual-pins PartialReady def + theorem + B-bar HOST-EMIT cites; SelfApplyFs KERNEL-SELF-APPLY living-tip block retained with batch-33 note + module cite |
| emit-wire | KERNEL-SELF-APPLY module path/tokens/forbidden living-tip claim true defs on KernelSelfApply module (via emit-product + specs.nix inherit join + default.nix scan); emit/out byte match unchanged; host pin still requires tip dual-pins |
| inventory | Batch 33 row; home column -> KernelSelfApply; host-partial-inventory KernelSelfApply row |
| residual / WATCHER / handoff | batch 33 done; PartialReady bulk families remaining = 0; Open **Short product-path module names** (plan/residual already names with checkable Done when) |

| File | Before batch 33 | After batch 33 |
|------|----------------:|---------------:|
| SelfApplyFs.lean | 5745 | 5755 |
| KernelSelfApply.lean | (new) | 121 |

Net tip ~flat dual-pin (+10 greppable literals/module cite). **PartialReady bulk families remaining in SelfApplyFs = 0.** Structural split of closed PartialReady bulk complete. Tip still multi-thousand lines (greppable dual-pin chain); short ProductPathFreestanding rename is next open residual.
