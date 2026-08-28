# Join: Host library seed expand continue (A40 / plan L29)

**Status:** GREEN (lake + without-lake modules=135 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..LlvmHoldTheorems modules=133 to
Mult..LlvmHoldTheorems+CapableRegenerate+CapableRegenerateTheorems
(modules=**135**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..LlvmHoldTheorems (prior 133) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product + KernelEmit + Parity* + SelfApply + EmitLinear..Banner + ProductOutKernel + BootstrapHonesty + ProductPathWriter* + ProductPathOwnership*/Perform* + ReadSsot/ComposePlan + Capable bands + CapableStepContract/InstallOut/OfficialPath/PerformEvidence + CapableRead/Compose/FullBar + DualEqWrite* pure + OfficialRetire/OwnershipClaimed/PerformClaimed/StepContractFull + SelfHostComplete/OfficialPathAlternate/ProductPathOwnershipRegenerate + CapableWriteHcLoad/DualEqWriteLoad/CapableWriteHc/DualEqWriteApi + LlvmHold |
| `SystemsLean.CapableRegenerate` | multi-import: CapableRead + CapableCompose + CapableWriteHc + InstallOut (full on-disk package imports) |
| `SystemsLean.CapableRegenerateTheorems` | CapableRegenerate parent only |

**How the band was picked:** after A39, CapableRegenerate deps
(CapableRead / CapableCompose / CapableWriteHc / InstallOut) were all seeded.
Inventory of on-disk `import SystemsLean.*` matched RealMod edges. Theorems
companion is seed-closed after parent. ProductPathWriteHc still needs
FreestandingEmit (not started this slice). HostImportGraph / HostModuleCheck /
HostResidualShrink were **not** seeded as product targets (tools only).

**RealMod import honesty:** CapableRegenerate lists four package imports matching
disk; CapableRegenerateTheorems lists parent only. Verified with
`rg '^import SystemsLean'` on each band file before wiring.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 135
still open. `set_option maxRecDepth 16384` already in place for dispatch ladder
(no raise this slice).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named CapableRegenerate[+Theorems] seed | +2 modules; seed units label ends +CapableRegenerateTheorems; modules=**135** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=135 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=135; L30+; inventory next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +CapableRegenerate+CapableRegenerateTheorems; RealMod multi-import edges honest; acceptCount 135; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=135; length dual-pins; `runModuleCheck` good fixtures |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures from on-disk decl names |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L29 + Open L30+ Host library seed expand continue; Done when >135; trailer L30+/modules=135/A1-A40 aligned |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=135 |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 135); join a41 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep |
| `src/systems/self-host.md` | Living tip modules=135 + next Name |
| `doc/goals.md` | Living tip modules=135 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A40 modules=135; Phase L L29 done / L30+ open; section 5 floors >135; join a41 next |
| `.agents/joins/a40-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=135 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=135 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=133;
  CapableRegenerate multi-import and theorems not in seed.
- **After:** modules=135; same expandSliceName; without-Lake measured green;
  RealMod multi-import edges list honest CapableRead/Compose/WriteHc/InstallOut
  (not empty).
- Host free / DualResidual free **not** flipped.

## Next

**Open:** Host library seed expand continue (L30+ beyond modules=135).
Prefer next coherent seed-closed band (inventory remaining vs ~270).
ProductPathWriteHc still needs FreestandingEmit. Join next:
`.agents/joins/a41-host-library-seed-expand-continue.md`.
