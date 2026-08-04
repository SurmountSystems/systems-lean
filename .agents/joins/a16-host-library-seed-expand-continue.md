# Join: Host library seed expand continue (A16 / plan L5)

**Status:** GREEN (lake + without-lake modules=37 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage

## Goal met

Grow the real-module seed set beyond Mult..SurfaceMatrix modules=31 to
**Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold**
(modules=**37**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites Emit scaffold seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role |
|--------|------|
| Mult..SurfaceMatrixTheorems (prior 31) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix |
| `SystemsLean.EmitMultScaffold` | Mult emit scaffold (ns EmitMult; imports Mult) |
| `SystemsLean.EmitLinearScaffold` | Linear emit scaffold leaf (ns EmitLinear) |
| `SystemsLean.EmitTypesScaffold` | Types emit scaffold leaf (ns EmitTypes) |
| `SystemsLean.EmitProgramScaffold` | Program emit scaffold leaf (ns EmitProgram) |
| `SystemsLean.EmitGraphScaffold` | Graph emit scaffold leaf (ns EmitGraph) |
| `SystemsLean.EmitComposeScaffold` | Compose emit scaffold leaf (ns EmitCompose) |

**How the band was picked:** inventory after A15 (seed closed on SurfaceMatrix).
Preferred Emit Mult..Compose scaffold band: six modules, seed-closed
(EmitMultScaffold imports only Mult; five leaves). Coherent Mult..Compose
emit surface without jumping to Emit body/plan fan-out or full ~271.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls per
scaffold role (stageId / hostEmit*Id / selfHostEmit*Id / acceptancePath /
hostModulePath / ssotArtifactPath). **Not** full Lean 4 elaborator typecheck.
Remaining library ~271 - 37 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named Emit Mult..Compose scaffold seed | +6 modules; seed units label ends +EmitMultScaffold..+EmitComposeScaffold |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=37 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=37; L6+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +Emit Mult..Compose scaffolds; RealMod edges; acceptCount 37; order edge checks |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; Emit scaffold surface checks; loadOk modules=37 |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Emit scaffold required decls + good fixtures |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Emit scaffold good accept theorems/smoke; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L5 + Open L6+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 37) |
| `doc/SESSION-HANDOFF.md` | Active / Next lockstep |
| `src/systems/self-host.md` | Living tip modules=37 + next Name |
| `doc/goals.md` | Living tip modules=37 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A16 modules=37; L5 done / L6+ open |
| `.agents/joins/a16-host-library-seed-expand-continue.md` | this join |

## DualResidual unchanged (confirmed)

| Def | Value | File |
|-----|-------|------|
| `hostElaboratorResidualRemains` | `true` | `src/systems/SystemsLean/DualResidual.lean` |
| `hostElaboratorResidualFreeClaimed` | `false` | same |

No edit to DualResidual.lean (mtime unchanged this slice).

## Gates (ran)

```
(cd src/systems && lake build SystemsLean.HostImportGraph SystemsLean.HostModuleCheckFixtures
  SystemsLean.HostModuleCheck SystemsLean.HostModuleCheckTheorems
  SystemsLean.HostResidualShrink slake-host-import-graph slake-host-module-check)
just host-import-graph-without-lake   # GREEN modules=37 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=37 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN (after residual/markdown lockstep)
```

## Open next

**Host library seed expand continue** (L6+) -- next real library band beyond
modules=37 (inventory remaining vs ~271; prefer Emit body/plan scaffolds or
imports of current seed as evidence picks). Do not flip free. Do not empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
