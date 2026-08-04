# Join: Host library seed expand continue (A26 / plan L15)

**Status:** GREEN (lake + without-lake modules=61 + residual-shrink + hygiene)
**Date:** 2026-08-03
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**IMPL_ID:** a26seed061

## Goal met

Grow the real-module seed set beyond Mult..ParityProgramTheorems modules=59 to
Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems
(modules=**61**) on both import graph and PARTIAL-STRUCTURAL module check **without
Lake on the measured hot path**. HostResidualShrink cites ParityEmit seed.
DualResidual host residual remains true / free claimed false **unchanged**.
free/complete/PROVABLY and product Lake pins **unchanged**. proofCompleteClaimed
**unchanged**.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ParityProgramTheorems (prior 59) | Mult..Compose + Erasure/Extract + CompilePath/Kernel + Kernel *Theorems + JoinMap/SelfHost + SurfaceMatrix + Emit scaffolds + KernelSelfApply + Emit product Mult/Plan/Apply/Body + KernelEmit + ParityMult + ParityLinear + ParityTypes + ParityProgram bands |
| `SystemsLean.ParityEmit` | Emit freestanding path parity; imports KernelEmit+ParityProgram+EmitMult (all seed) |
| `SystemsLean.ParityEmitTheorems` | Same deps + ParityEmit; namespace SystemsLean.ParityEmit; hostParityEmitId_eq / selfHostParityEmitId_eq (+ stage ids) |

**How the band was picked:** inventory after A25 (ParityProgram seeded). ParityEmit
deps fully seedable (KernelEmit + ParityProgram + EmitMult already in seed); honest
multi-import edges (not a false leaf). Coherent +2 ParityEmit band on the parity
path. Not full ~271. SelfApply still needs more ladder when seedable.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + key decls from
on-disk ParityEmit (stageId, hostParityEmitId, selfHostParityEmitId, and related
ready/parity surface decls) and ParityEmitTheorems (stageId_eq, hostParityEmitId_eq,
selfHostParityEmitId_eq, theorem corpus).
**Not** full Lean 4 elaborator typecheck. Remaining library ~271 - 61 still open.

## Done when checklist

| Item | Evidence |
|------|----------|
| Named ParityEmit+ParityEmitTheorems seed | +2 modules; seed units label ends +ParityEmit+ParityEmitTheorems |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=61 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=61; L16+) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +ParityEmit+ParityEmitTheorems; RealMod multi-import edges; acceptCount 61; order edge checks + driver order.any fail-closed |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; ParityEmit surface checks; loadOk modules=61; length dual-pins for required decls |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | ParityEmit/Theorems required decls + good fixtures (on-disk decl names) |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | ParityEmit good accept smokes; seed label |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps + error string tip |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L15 + Open L16+ Host library seed expand continue |
| `RESIDUAL.md` | Systems Open table |
| `WATCHER.md` | next `/implement` Host library seed expand continue (beyond 61); join a27 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Decisions Open residual lockstep (L16+ beyond modules=61; L15 A26 done) |
| `src/systems/self-host.md` | Living tip modules=61 + next Name |
| `doc/goals.md` | Living tip modules=61 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A26 modules=61; Phase L L15 done / L16+ open; section 5 / Step 3+ / defaults item 4 floors |
| `.agents/joins/a26-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=61 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=61 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # after residual/markdown lockstep
```

## Open next

**Host library seed expand continue** (L16+) -- next real library band beyond
modules=61 (inventory remaining vs ~271; next coherent seed importers or
ParityEmit dependents when seedable, e.g. SelfApply). Do not flip free. Do not
empty Open.

## Watcher next

See `WATCHER.md` fenced block: `/implement --effort 1 Host library seed expand continue`.
