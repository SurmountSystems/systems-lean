# Join: Host library seed expand continue (A34 / plan L23)

**Status:** GREEN (lake + without-lake modules=101 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a34seed093

## Goal met

Grow the real-module seed set beyond Mult..CapableTheorems modules=93 to
Mult..CapableTheorems+CapableStepContract+CapableStepContractTheorems+InstallOut+
InstallOutTheorems+OfficialPath+OfficialPathTheorems+PerformEvidence+
PerformEvidenceTheorems (modules=**101**) on both import graph and
PARTIAL-STRUCTURAL module check **without Lake on the measured hot path**.
HostResidualShrink cites CapableStepContract/InstallOut/OfficialPath/PerformEvidence
pure leaves. DualResidual host residual remains true / free claimed false
**unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..CapableTheorems (prior 93) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* + ReadSsot/ComposePlan + Capable bands |
| `SystemsLean.CapableStepContract` | SelfApplyFs pure leaf; no package-local imports |
| `SystemsLean.CapableStepContractTheorems` | imports CapableStepContract only |
| `SystemsLean.InstallOut` | SelfApplyFs pure leaf; no package-local imports |
| `SystemsLean.InstallOutTheorems` | imports InstallOut only |
| `SystemsLean.OfficialPath` | SelfApplyFs pure leaf; no package-local imports |
| `SystemsLean.OfficialPathTheorems` | imports OfficialPath only |
| `SystemsLean.PerformEvidence` | SelfApplyFs pure leaf; no package-local imports |
| `SystemsLean.PerformEvidenceTheorems` | imports PerformEvidence only |

**How the band was picked:** inventory after A33 (Capable gap pure leaf seeded).
Preferred +8 pure-leaf band CapableStepContract + InstallOut + OfficialPath +
PerformEvidence (+ theorems). All four parents are pure leaves (package
imports=0); theorems import parents only. Coherent SelfApplyFs freestanding-capable
/ perform evidence foundation; not full ~270. SelfApplyFs still may block on other
deps.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for CapableStepContract/InstallOut/OfficialPath/PerformEvidence surfaces.
**Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 101 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named CapableStepContract..PerformEvidenceTheorems seed | +8 modules; seed units label ends +CapableStepContract+...+PerformEvidenceTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=101 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=101; L24+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +CapableStepContract..PerformEvidenceTheorems; RealMod leaf/parent edges; acceptCount 101; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=101; length dual-pins; `runModuleCheck` unless ladder includes new goods |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L23 + Open L24+ Host library seed expand continue; trailer L24+/modules=101/A1-A34 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=101 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 101); join a35 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=101 + next Name |
| `doc/goals.md` | Living tip modules=101 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A34 modules=101; Phase L L23 done / L24+ open; section 5 floors |
| `.agents/joins/a34-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=101 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=101 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=93;
  acceptCount == 93; seed label ended CapableTheorems.
- **Contract red (observed before full wire-up):** raising acceptCount / seed
  length dual-pins to 101 without adding RealMod leaves, seed module lists, and
  module-check surfaces would fail loadOk / order length / seed label equality
  and without-lake greps. That is the intentional dual-pin red for this expand.
- **After (green):** full seed wire-up + lake build + without-lake both report
  modules=101; HostResidualShrink reseeded; expandSliceName unchanged
  `Host library seed expand continue`.

## Open next

**Host library seed expand continue** (L24+) -- next real library band beyond
modules=101 (inventory remaining vs ~270; HostFront/Llvm candidates; remaining
ProductPath/Capable surface if any; pick next coherent seedable band). Do not
flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
