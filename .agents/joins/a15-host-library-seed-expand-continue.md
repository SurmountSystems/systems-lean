# Join: Host library seed expand continue (A15 / plan L4+)

**Status:** GREEN (lake + without-lake modules=31 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..Kernel + Kernel *Theorems +
JoinMap/SelfHost modules=29 to **Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems**
(modules=**31**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites SurfaceMatrix seed and
corpus counts. DualResidual host residual remains true / free claimed false
**unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..SelfHostTheorems (prior 29) | Mult..Compose + Erasure/Extract + CompilePath/Kernel foundation + Kernel *Theorems + JoinMap/SelfHost |
| `SystemsLean.SurfaceMatrix` | Host surface matrix inventory (imports Mult+Types+IrProgram+Erasure+HostCompose+CompilePath+JoinMap+SelfHost) |
| `SystemsLean.SurfaceMatrixTheorems` | SurfaceMatrix theorem companion (ns SurfaceMatrix; imports SurfaceMatrix + seed units) |

**How the band was picked:** inventory of package-local imports from the modules=29
seed showed seed is closed. Next importers of seed: SurfaceMatrix depends only on
already-seeded units (including SelfHost + JoinMap). Preferred coherent band after
SelfHost: SurfaceMatrix (+Theorems). Seed-closed with no extra non-seed deps. Did
not jump to Emit scaffold (large fan-out) or full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per role.
SurfaceMatrix: six required defs; *Theorems: eight required theorems.
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 31 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named SurfaceMatrix seed | +2 modules; seed units label ends +SurfaceMatrix+SurfaceMatrixTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=31 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + corpus counts + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=31; L5+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +SurfaceMatrix band; RealMod edges; acceptCount 31; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; SurfaceMatrix surface checks; loadOk modules=31 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | SurfaceMatrix required decls + good fixtures; corpus dual-pin |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | SurfaceMatrix good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + corpus counts + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed + corpus greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L4 + Open L5+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 31) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=31 + next Name |
| `doc/goals.md` | Living tip modules=31 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A15 modules=31; L4 done / L5+ open |
| `.agents/joins/a15-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=31 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=31 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## Open next

**Host library seed expand continue** (L5+) -- next real library band beyond
modules=31 (inventory remaining vs ~271; prefer Emit scaffold or imports of
current seed as evidence picks). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
