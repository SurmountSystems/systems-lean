# Join: Host library seed expand continue (A38 / plan L27)

**Status:** GREEN (lake + without-lake modules=127 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..StepContractFullTheorems modules=121 to
Mult..StepContractFullTheorems+SelfHostComplete+SelfHostCompleteTheorems+
OfficialPathAlternate+OfficialPathAlternateTheorems+
ProductPathOwnershipRegenerate+ProductPathOwnershipRegenerateTheorems
(modules=**127**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. HostResidualShrink cites remaining
SelfApplyFs pure leaves. DualResidual host residual remains true / free claimed
false **unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..StepContractFullTheorems (prior 121) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* + ReadSsot/ComposePlan + Capable bands + CapableStepContract/InstallOut/OfficialPath/PerformEvidence + CapableRead/Compose/FullBar + DualEqWrite* + OfficialRetire/OwnershipClaimed/PerformClaimed/StepContractFull |
| `SystemsLean.SelfHostComplete` | SelfApplyFs remaining pure leaf; no package-local imports |
| `SystemsLean.SelfHostCompleteTheorems` | imports SelfHostComplete only |
| `SystemsLean.OfficialPathAlternate` | SelfApplyFs remaining pure leaf; no package-local imports |
| `SystemsLean.OfficialPathAlternateTheorems` | imports OfficialPathAlternate only |
| `SystemsLean.ProductPathOwnershipRegenerate` | SelfApplyFs remaining pure leaf; no package-local imports |
| `SystemsLean.ProductPathOwnershipRegenerateTheorems` | imports ProductPathOwnershipRegenerate only |

**How the band was picked:** inventory after A37 (claim-tip pure leaves seeded).
Preferred +6 remaining SelfApplyFs pure leaves SelfHostComplete +
OfficialPathAlternate + ProductPathOwnershipRegenerate (+ theorems). All three
parents pure (package imports=0); theorems import parents only. Coherent
SelfApplyFs pure-leaf paydown; not full SelfApplyFs multi-import stack.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls for pure-leaf surfaces. **Not** full Lean 4 elaborator typecheck.
Remaining library ~270 - 127 still open. `checkRealModule` if-else ladder needed
`set_option maxRecDepth 16384` at this size.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named SelfHostComplete..ProductPathOwnershipRegenerateTheorems seed | +6 modules; seed units label ends +ProductPathOwnershipRegenerateTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=127 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=127; L28+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +SelfHostComplete..ProductPathOwnershipRegenerateTheorems; RealMod leaf/parent edges; acceptCount 127; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=127; length dual-pins; `set_option maxRecDepth 16384` for dispatch ladder; `runModuleCheck` good fixtures |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L27 + Open L28+ Host library seed expand continue; trailer L28+/modules=127/A1-A38 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=127 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 127); join a39 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=127 + next Name |
| `doc/goals.md` | Living tip modules=127 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A38 modules=127; Phase L L27 done / L28+ open; section 5 floors |
| `.agents/joins/a38-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=127 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=127 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=121;
  preferred SelfApplyFs pure leaves SelfHostComplete / OfficialPathAlternate /
  ProductPathOwnershipRegenerate not in seed.
- **After:** modules=127; same expandSliceName; without-Lake measured green.
- Host free / DualResidual free **not** flipped.
