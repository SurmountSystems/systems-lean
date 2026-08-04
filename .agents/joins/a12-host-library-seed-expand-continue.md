# Join: Host library seed expand continue (A12 / plan L1)

**Status:** GREEN (lake + without-lake modules=21 + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..Compose+Erasure/Extract (modules=16) to
**Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram**
(modules=**21**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites CompilePath/Kernel seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..ExtractTheorems (prior 16) | Mult..Compose + Erasure/Extract foundation |
| `SystemsLean.CompilePath` | Compile-path hub (imports Mult+Types+IrProgram+IrGraph+Erasure+HostCompose+Extract) |
| `SystemsLean.KernelMult` | Kernel Mult unit (imports Mult+Types+IrProgram+CompilePath) |
| `SystemsLean.KernelLinear` | Kernel Linear unit (imports Mult+Types+IrProgram+HostCompose+CompilePath) |
| `SystemsLean.KernelTypes` | Kernel Types unit (imports Mult+Types+IrProgram+CompilePath) |
| `SystemsLean.KernelProgram` | Kernel Program unit (imports Mult+Types+IrProgram+IrGraph+HostCompose+CompilePath) |

**How the band was picked:** inventory of package-local imports from the modules=16
seed showed the seed was already closed on itself. Next coherent band that **closes
imports for Kernel/self-host coverage** is CompilePath (seed-closed today) plus the
four Kernel unit modules that only need CompilePath + existing seed units.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per role.
CompilePath: stageId/hostCompilePathId/gradeSurfaceOk/checkHost/extractFsOk/compileReady;
Kernel*: stageId + unit id + lower/mk + Ready/Ok. **Not** full Lean 4 elaborator
typecheck. Remaining library ~271 - 21 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named CompilePath/Kernel seed | +5 modules; seed units label ends +CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=21 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=21; L2+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +CompilePath/Kernel band; RealMod edges; expandSliceName; acceptCount 21 |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; CompilePath/Kernel surface checks; expandSliceName; loadOk modules=21 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | CompilePath/Kernel required decls + good fixtures |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | CompilePath/Kernel good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed / expand Name greps |
| `just/host.just` | host-residual-shrink greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed / expand tokens |
| `RESIDUAL-systems.md` | Done L1 + Open L2+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 21) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=21 + next Name |
| `.agents/joins/a12-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean.

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=21 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=21 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
just systems-host                     # GREEN
```

## Open next

**Host library seed expand continue** (L2+) -- next real library band beyond
modules=21 (inventory remaining vs ~271; prefer Kernel theorems / JoinMap /
SelfHost / Emit scaffold as evidence picks). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
