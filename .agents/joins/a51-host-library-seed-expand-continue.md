# Join: Host library seed expand continue (A51 / plan L40)

**Status:** GREEN (lake + without-lake modules=192 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..LlvmComposeText modules=191
to Mult..LlvmComposeText+SelfApplyFs (modules=**192**) on both import graph
and PARTIAL-STRUCTURAL module check **without Lake on the measured hot path**.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..LlvmComposeText (prior 191) | prior living seed through LlvmComposeText |
| `SystemsLean.SelfApplyFs` | full honest 39-edge package import list (on-disk order): SelfApply, ParityEmit, KernelEmit, HostCompose, EmitBody, EmitMult, KernelSelfApply, ProductOutKernel, BootstrapHonesty, ProductPathWriterSurface, ProductPathWriterPathPlan, ProductPathWriterPathExec, ProductPathOwnershipInputs, ProductPathPerform, ProductPathPerformStep, ProductPathReadSsot, ProductPathComposePlan, ProductPathWriteHc, Capable, CapableStepContract, CapableRead, CapableCompose, CapableWriteHc, CapableRegenerate, InstallOut, CapableFullBar, ProductPathOwnershipRegenerate, PerformEvidence, OfficialPath, OfficialPathAlternate, DualEqWriteParity, DualEqWriteClosePath, DualEqWriteApi, DualEqWriteCapableGap, OfficialRetire, PerformClaimed, OwnershipClaimed, StepContractFull, SelfHostComplete |

**How the band was picked:** A50 left only SelfApplyFs as import seed-closed
product leaf (after skip *Main / HostImportGraph / HostModuleCheck* /
HostResidualShrink). Dedicated SelfApplyFs slice (L40 / A51). Stopped after
SelfApplyFs alone (no *Theorems / InventoryClose* in same slice) to keep
maxRecDepth / expand risk low. `set_option maxRecDepth 16384` unchanged
(no red evidence to raise).

**RealMod import honesty:** SelfApplyFs lists all 39 package-local imports
matching on-disk `import SystemsLean.*` order and set. Verified with live
without-lake order line:

- SelfApplyFs <- SelfApply, ParityEmit, KernelEmit, HostCompose, EmitBody,
  EmitMult, KernelSelfApply, ProductOutKernel, BootstrapHonesty,
  ProductPathWriterSurface, ProductPathWriterPathPlan, ProductPathWriterPathExec,
  ProductPathOwnershipInputs, ProductPathPerform, ProductPathPerformStep,
  ProductPathReadSsot, ProductPathComposePlan, ProductPathWriteHc, Capable,
  CapableStepContract, CapableRead, CapableCompose, CapableWriteHc,
  CapableRegenerate, InstallOut, CapableFullBar, ProductPathOwnershipRegenerate,
  PerformEvidence, OfficialPath, OfficialPathAlternate, DualEqWriteParity,
  DualEqWriteClosePath, DualEqWriteApi, DualEqWriteCapableGap, OfficialRetire,
  PerformClaimed, OwnershipClaimed, StepContractFull, SelfHostComplete

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls (stageId, hostSelfApplyFsId, selfHostSelfApplyFsId,
freestandingSelfApplyReady, freestandingProductSelfHostComplete). **Not** full
Lean 4 elaborator typecheck. Remaining product library ~206 - 192 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named preferred-band seed | +1 module SelfApplyFs; seed units label ends +SelfApplyFs; modules=**192** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=192 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=192; L41+; prefer SelfApplyFsTheorems / InventoryClose / ProductPathBars) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +SelfApplyFs; RealMod 39-edge honesty; acceptCount 192; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface check; loadOk modules=192; good fixture wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture text (full import list) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smoke; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L40 + Open L41+ Host library seed expand continue; Done when >192 |
| `RESIDUAL.md` | Systems Open table + L40 Done + living tip Open floor beyond modules=192 |
| `WATCHER.md` | next `/implement` beyond 192; join a52 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=192 + next Name |
| `doc/goals.md` | Living tip modules=192 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A51 modules=192; Phase L L40 done / L41+ open; Immediate next >192; join a52 |
| `.agents/joins/a51-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean this slice. **Do not flip free** even when DualResidual
becomes seedable after InventoryClose / ProductPath chains.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=192 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=192 expand=Host library seed expand continue
just host-residual-shrink             # GREEN residual remains; free false
just hygiene                          # GREEN (source-hygiene + professional-tone)
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=191;
  SelfApplyFs not in seed (deferred maxRecDepth / multi-import risk).
- **After:** modules=192; same expandSliceName; without-Lake measured green;
  RealMod edges honest full 39-import set. Floors lockstep >192 / a52.
- Host free / DualResidual free **not** flipped.
- maxRecDepth stayed 16384; no timeout/OOM/maxRecDepth failure.
- After this band, seed-closed not yet seeded: SelfApplyFsTheorems,
  InventoryClose, ProductPathBars (among remaining ~14 product modules).

## Next

**Open:** Host library seed expand continue (L41+ beyond modules=192).
Prefer next coherent seed-closed band: **SelfApplyFsTheorems** (parent-only),
**InventoryClose** (SelfApplyFs+LlvmHold), **ProductPathBars**. Skip *Main;
HostImportGraph / HostModuleCheck* / HostResidualShrink. **Do not flip DualResidual
free.** After InventoryClose/ProductPathBars, DualResidual may become seedable
structurally -- free claim stays false until A-last plan gate.
