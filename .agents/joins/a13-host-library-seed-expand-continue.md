# Join: Host library seed expand continue (A13 / plan L2+)

**Status:** GREEN (lake + without-lake modules=25 + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..Compose+Erasure/Extract+CompilePath/Kernel
(modules=21) to **Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems**
(modules=**25**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Kernel *Theorems seed and
corpus counts. DualResidual host residual remains true / free claimed false
**unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..KernelProgram (prior 21) | Mult..Compose + Erasure/Extract + CompilePath/Kernel foundation |
| `SystemsLean.KernelMultTheorems` | Kernel Mult theorem companion (ns KernelMult; imports KernelMult) |
| `SystemsLean.KernelLinearTheorems` | Kernel Linear theorem companion (ns KernelLinear; imports KernelLinear) |
| `SystemsLean.KernelTypesTheorems` | Kernel Types theorem companion (ns KernelTypes; imports KernelTypes) |
| `SystemsLean.KernelProgramTheorems` | Kernel Program theorem companion (ns KernelProgram; imports KernelProgram) |

**How the band was picked:** inventory of package-local imports from the modules=21
seed showed Kernel *Theorems modules only import already-seeded units (Kernel parents
+ Mult/Types/IrProgram/CompilePath/HostCompose/IrGraph). Preferred coherent band from
A12 join list: Kernel *Theorems for the four Kernel units already in seed. Seed-closed
with no extra non-seed deps.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per role.
Kernel*Theorems: eight required theorems each (stage/id ready/ok lower/program
corpus). **Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 25 still
open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Kernel *Theorems seed | +4 modules; seed units label ends +KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=25 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + corpus counts + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=25; L3+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +Kernel *Theorems band; RealMod edges; acceptCount 25; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; Kernel *Theorems surface checks; loadOk modules=25 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Kernel *Theorems required decls + good fixtures |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Kernel *Theorems good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + corpus counts + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed + corpus greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L2 + Open L3+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 25) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=25 + next Name |
| `.agents/joins/a13-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=25 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=25 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
just systems-host                     # GREEN
```

## Open next

**Host library seed expand continue** (L3+) -- next real library band beyond
modules=25 (inventory remaining vs ~271; prefer JoinMap / SelfHost / Emit scaffold
as evidence picks). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
