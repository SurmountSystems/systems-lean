# Join: Host library seed expand continue (A14 / plan L3+)

**Status:** GREEN (lake + without-lake modules=29 + residual-shrink + hygiene + systems-host)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..Kernel + Kernel *Theorems
modules=25 to **Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems**
(modules=**29**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites JoinMap/SelfHost seed and
corpus counts. DualResidual host residual remains true / free claimed false
**unchanged**. free/complete/PROVABLY and product Lake pins **unchanged**.
proofCompleteClaimed **unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..KernelProgramTheorems (prior 25) | Mult..Compose + Erasure/Extract + CompilePath/Kernel foundation + Kernel *Theorems |
| `SystemsLean.JoinMap` | Dual JOIN-ALG map into compile-path readiness (imports Mult+Linear+IrProgram+Erasure+HostCompose+CompilePath) |
| `SystemsLean.JoinMapTheorems` | JoinMap theorem companion (ns JoinMap; imports JoinMap + seed units) |
| `SystemsLean.SelfHost` | Host self-host direction readiness (imports IrProgram+HostCompose+CompilePath+JoinMap) |
| `SystemsLean.SelfHostTheorems` | SelfHost theorem companion (ns SelfHost; imports SelfHost + JoinMap + seed units) |

**How the band was picked:** inventory of package-local imports from the modules=25
seed showed JoinMap only depends on already-seeded units; SelfHost depends on
JoinMap. Preferred coherent band from A13 join list: JoinMap / SelfHost scaffold
(+Theorems). Seed-closed with no extra non-seed deps. Did not jump to Emit scaffold
(large fan-out) or full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per role.
JoinMap/SelfHost: six required defs each; *Theorems: eight required theorems each.
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 29 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named JoinMap/SelfHost seed | +4 modules; seed units label ends +JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=29 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + corpus counts + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=29; L4+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +JoinMap/SelfHost band; RealMod edges; acceptCount 29; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; JoinMap/SelfHost surface checks; loadOk modules=29 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | JoinMap/SelfHost required decls + good fixtures; corpus dual-pin |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | JoinMap/SelfHost good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + corpus counts + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed + corpus greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L3 + Open L4+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 29) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=29 + next Name |
| `doc/goals.md` | Living tip modules=29 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A14 modules=29; L3 done / L4+ open |
| `.agents/joins/a14-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=29 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=29 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
just systems-host                     # GREEN
```

## Open next

**Host library seed expand continue** (L4+) -- next real library band beyond
modules=29 (inventory remaining vs ~271; prefer Emit scaffold or imports of
current seed as evidence picks). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
