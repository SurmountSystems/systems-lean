# Join: Host library seed expand continue (A39 / plan L28)

**Status:** GREEN (lake + without-lake modules=133 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..ProductPathOwnershipRegenerateTheorems
modules=127 to Mult..ProductPathOwnershipRegenerateTheorems+CapableWriteHcLoad+
DualEqWriteLoad+CapableWriteHc+DualEqWriteApi+LlvmHold+LlvmHoldTheorems
(modules=**133**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. HostResidualShrink cites CapableRegenerate
as next multi-import candidate. DualResidual host residual remains true / free claimed
false **unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ProductPathOwnershipRegenerateTheorems (prior 127) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* + ReadSsot/ComposePlan + Capable bands + CapableStepContract/InstallOut/OfficialPath/PerformEvidence + CapableRead/Compose/FullBar + DualEqWrite* pure + OfficialRetire/OwnershipClaimed/PerformClaimed/StepContractFull + SelfHostComplete/OfficialPathAlternate/ProductPathOwnershipRegenerate |
| `SystemsLean.CapableWriteHcLoad` | multi-import full emit product stack (20 Emit* / scaffold names matching on-disk); ns CapableWriteHc |
| `SystemsLean.DualEqWriteLoad` | same emit stack as on disk; ns DualEqWriteApi |
| `SystemsLean.CapableWriteHc` | CapableWriteHcLoad + emit stack (as on disk) |
| `SystemsLean.DualEqWriteApi` | DualEqWriteLoad + emit stack (as on disk) |
| `SystemsLean.LlvmHold` | SelfApply only |
| `SystemsLean.LlvmHoldTheorems` | LlvmHold parent only |

**How the band was picked:** after A38 preferred SelfApplyFs pure leaves were seeded.
Multi-import CapableWriteHc/DualEqWriteApi stack had all package deps already in seed
(emit product stack). LlvmHold is SelfApply multi-import parent + theorems. Topo:
Load modules before WriteHc/Api; LlvmHold before LlvmHoldTheorems. Unblocks
CapableRegenerate next (deps CapableRead/Compose/WriteHc/InstallOut all seeded).
ProductPathWriteHc still needs FreestandingEmit.

**RealMod import honesty:** multi-import modules list **full on-disk package imports**
via `emitProductStackImports` (not empty import lists). Verified with
`rg '^import SystemsLean'` on each band file before wiring.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 133
still open. `set_option maxRecDepth 16384` already in place for dispatch ladder.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named CapableWriteHcLoad..LlvmHoldTheorems seed | +6 modules; seed units label ends +LlvmHoldTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=133 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=133; L29+; prefer CapableRegenerate) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +CapableWriteHcLoad..LlvmHoldTheorems; RealMod multi-import edges with emitProductStackImports; acceptCount 133; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=133; length dual-pins; `runModuleCheck` good fixtures |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names; multi-import fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L28 + Open L29+ Host library seed expand continue; trailer L29+/modules=133/A1-A39 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=133 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 133); join a40 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=133 + next Name |
| `doc/goals.md` | Living tip modules=133 |
| `.agents/plans/plan-slake-replaces-lake.md` | Still real four tracks; living tip A39 modules=133; Phase L L28 done / L29+ open; section 5 floors |
| `.agents/joins/a39-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=133 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=133 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=127;
  CapableWriteHc / DualEqWriteApi multi-import and LlvmHold not in seed.
- **After:** modules=133; same expandSliceName; without-Lake measured green;
  RealMod multi-import edges list honest emit product stack (not empty).
- Host free / DualResidual free **not** flipped.
