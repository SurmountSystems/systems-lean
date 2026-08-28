# Join: Host library seed expand continue (A42 / plan L31)

**Status:** GREEN (lake + without-lake modules=142 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..HostPackageRoots modules=139
to Mult..HostPackageRoots+FreestandingEmit+ProductPathWriteHc+ProductPathWriteHcTheorems
(modules=**142**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

Also scrubbed lagging docs floors from A41 review REVISE: plan Immediate next
Done when `> 139` (was lagging `> 135`); SESSION-HANDOFF mid-body Active / Open
residual / Recommended next aligned to modules=139 / L31+ before this seed,
then reseeded to modules=142 / L32+ after.

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..HostPackageRoots (prior 139) | prior living seed through FreestandingEmitLoad ladder + pure inventory leaves |
| `SystemsLean.FreestandingEmit` | multi-import: FreestandingEmitLoad + FreestandingEmitLoadScaffold + EmitBanner + EmitMult + EmitLinear + EmitErasure + EmitExtract + EmitExtractScaffold + EmitTypes + EmitTypesScaffold + EmitProgram + EmitProgramScaffold + EmitGraph + EmitGraphScaffold + EmitCompose + EmitComposeScaffold + EmitPlan + EmitPlanScaffold + EmitApply + EmitApplyScaffold + EmitBody + EmitBodyScaffold |
| `SystemsLean.ProductPathWriteHc` | FreestandingEmit parent only |
| `SystemsLean.ProductPathWriteHcTheorems` | ProductPathWriteHc parent only |

**How the band was picked:** preferred FreestandingEmit (seed-closed after A41
Load+Scaffold + emit product stack) then ProductPathWriteHc (depends only on
FreestandingEmit) and ProductPathWriteHcTheorems companion. *Main skipped.
HostImportGraph / HostModuleCheck* / HostResidualShrink / *Main were **not**
seeded as product targets.

**RealMod import honesty:** FreestandingEmit lists full package-local emit stack
matching on-disk imports; ProductPathWriteHc lists FreestandingEmit only;
ProductPathWriteHcTheorems lists ProductPathWriteHc only. Verified with on-disk
`import SystemsLean` and live without-lake order line.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 142
still open. `set_option maxRecDepth 16384` already in place (no raise this slice).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named FreestandingEmit + ProductPathWriteHc band seed | +3 modules; seed units label ends +ProductPathWriteHcTheorems; modules=**142** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=142 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Docs floor scrub (Part A) | plan Immediate next >139; SESSION-HANDOFF mid-body beyond 139 / L31+ then post-seed 142 / L32+ |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=142; L32+; next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +3; RealMod edges honest; acceptCount 142; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=142; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixtures |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L31 + Open L32+ Host library seed expand continue; Done when >142 |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=142 |
| `WATCHER.md` | next `/implement` beyond 142; join a43 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep (incl. Part A floor scrub) |
| `src/systems/self-host.md` | Living tip modules=142 + next Name |
| `doc/goals.md` | Living tip modules=142 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A42 modules=142; Phase L L31 done / L32+ open; Immediate next >142; join a43 |
| `.agents/joins/a42-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=142 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=142 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=139;
  FreestandingEmit and ProductPathWriteHc path not in seed; plan Immediate next
  lagging >135; SESSION-HANDOFF mid-body lagging beyond modules=135.
- **After:** modules=142; same expandSliceName; without-Lake measured green;
  RealMod edges honest (FreestandingEmit full emit stack; WriteHc parent;
  theorems parent). Floors lockstep >142 / a43.
- Host free / DualResidual free **not** flipped.

## Next

**Open:** Host library seed expand continue (L32+ beyond modules=142).
Prefer next coherent seed-closed band. Candidates after inventory: CompilePath*
unit multi-import surfaces; ProductWireWriteTool (CapableWriteHc+InstallOut);
HostTerm (Mult); LlvmEmitPath (LlvmHold); SubsetFront (CompilePath+IrProgram+Types+Mult);
other pure/multi leaves already seed-closed. Join next:
`.agents/joins/a43-host-library-seed-expand-continue.md`.
