# Join: Host library seed expand continue (A37 / plan L26)

**Status:** GREEN (lake + without-lake modules=121 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..DualEqWriteParityTheorems modules=113 to
Mult..DualEqWriteParityTheorems+OfficialRetire+OfficialRetireTheorems+
OwnershipClaimed+OwnershipClaimedTheorems+PerformClaimed+PerformClaimedTheorems+
StepContractFull+StepContractFullTheorems (modules=**121**) on both import graph and
PARTIAL-STRUCTURAL module check **without Lake on the measured hot path**.
HostResidualShrink cites claim-tip pure leaves. DualResidual host residual
remains true / free claimed false **unchanged**. free/complete/PROVABLY and
product Lake pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..DualEqWriteParityTheorems (prior 113) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* + ReadSsot/ComposePlan + Capable bands + CapableStepContract/InstallOut/OfficialPath/PerformEvidence + CapableRead/Compose/FullBar + DualEqWriteCapableGap/ClosePath/Parity |
| `SystemsLean.OfficialRetire` | SelfApplyFs claim-tip pure leaf; no package-local imports |
| `SystemsLean.OfficialRetireTheorems` | imports OfficialRetire only |
| `SystemsLean.OwnershipClaimed` | SelfApplyFs claim-tip pure leaf; no package-local imports |
| `SystemsLean.OwnershipClaimedTheorems` | imports OwnershipClaimed only |
| `SystemsLean.PerformClaimed` | SelfApplyFs claim-tip pure leaf; no package-local imports |
| `SystemsLean.PerformClaimedTheorems` | imports PerformClaimed only |
| `SystemsLean.StepContractFull` | SelfApplyFs claim-tip pure leaf; no package-local imports |
| `SystemsLean.StepContractFullTheorems` | imports StepContractFull only |

**How the band was picked:** inventory after A36 (DualEqWrite pure leaves seeded).
Preferred +8 claim-tip band OfficialRetire + OwnershipClaimed + PerformClaimed +
StepContractFull (+ theorems). All four parents are pure leaves (package imports=0);
theorems import parents only. Coherent SelfApplyFs claim tip; not full ~270.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for claim-tip surfaces. **Not** full Lean 4 elaborator typecheck.
Remaining library ~270 - 121 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named OfficialRetire..StepContractFullTheorems seed | +8 modules; seed units label ends +StepContractFullTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=121 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=121; L27+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +OfficialRetire..StepContractFullTheorems; RealMod leaf/parent edges; acceptCount 121; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=121; length dual-pins; `runModuleCheck` unless ladder includes new goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L26 + Open L27+ Host library seed expand continue; trailer L27+/modules=121/A1-A37 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=121 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 121); join a38 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=121 + next Name |
| `doc/goals.md` | Living tip modules=121 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A37 modules=121; Phase L L26 done / L27+ open; section 5 floors |
| `.agents/joins/a37-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean this slice.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=121 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=121 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=113;
  acceptCount == 113; seed label ended DualEqWriteParityTheorems.
- **Contract red (observed before full wire-up):** raising acceptCount / seed
  length dual-pins to 121 without adding RealMod leaves, seed module lists, and
  module-check surfaces would fail loadOk / order length / seed label equality
  and without-lake greps. That is the intentional dual-pin red for this expand.
- **After (green):** full seed wire-up + lake build + without-lake both report
  modules=121; HostResidualShrink reseeded; expandSliceName unchanged
  `Host library seed expand continue`.

## Open next

**Host library seed expand continue** (L27+) -- next real library band beyond
modules=121 (inventory remaining vs ~270; remaining pure leaves if any).
Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
