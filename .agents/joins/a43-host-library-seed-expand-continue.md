# Join: Host library seed expand continue (A43 / plan L32)

**Status:** GREEN (lake + without-lake modules=153 + residual-shrink + hygiene)
**Date:** 2026-08-04
**Program:** `.agents/plans/plan-slake-replaces-lake.md` real-module library coverage
**expandSliceName:** Host library seed expand continue

## Goal met

Grow the real-module seed set beyond Mult..ProductPathWriteHcTheorems modules=142
to Mult..ProductPathWriteHcTheorems+CompilePathMult+CompilePathLinear+CompilePathTypes+CompilePathProgram+CompilePathGraph+CompilePathCompose+CompilePathPlan+CompilePathApply+CompilePathBody+CompilePathErasure+CompilePathExtract
(modules=**153**) on both import graph and PARTIAL-STRUCTURAL module check
**without Lake on the measured hot path**. DualResidual host residual remains
true / free claimed false **unchanged**. free/complete/PROVABLY and product Lake
pins **unchanged**. proofCompleteClaimed **unchanged**.

Also scrubbed A42 review REVISE floor lag on `RESIDUAL-systems.md` "Next residual
implement prompt" (was L30+ / modules=135 / A1-A40; now living tip L33+ /
modules=153 / A1-A43).

**Named next-band seed set (this slice):**

| Module | Role / honest imports |
|--------|------------------------|
| Mult..ProductPathWriteHcTheorems (prior 142) | prior living seed through FreestandingEmit + ProductPathWriteHc band |
| `SystemsLean.CompilePathMult` | CompilePath + EmitMult |
| `SystemsLean.CompilePathLinear` | CompilePath + EmitLinear |
| `SystemsLean.CompilePathTypes` | CompilePath + EmitTypes |
| `SystemsLean.CompilePathProgram` | CompilePath + EmitProgram |
| `SystemsLean.CompilePathGraph` | CompilePath + EmitGraph |
| `SystemsLean.CompilePathCompose` | CompilePath + EmitCompose |
| `SystemsLean.CompilePathPlan` | CompilePath + EmitPlan + EmitPlanScaffold |
| `SystemsLean.CompilePathApply` | CompilePath + EmitApply + EmitApplyScaffold |
| `SystemsLean.CompilePathBody` | CompilePath + EmitBody + EmitBodyScaffold |
| `SystemsLean.CompilePathErasure` | CompilePath + EmitErasure + Erasure |
| `SystemsLean.CompilePathExtract` | CompilePath + CompilePathMult + CompilePathProgram |

**How the band was picked:** preferred coherent CompilePath* multi-import unit
surfaces already seed-closed after prior emit product + CompilePath seed.
Inventory confirmed ProductWireWriteTool / HostTerm / LlvmEmitPath / SubsetFront
also seed-closed; held for next slices. *Main skipped. HostImportGraph /
HostModuleCheck* / HostResidualShrink / *Main were **not** seeded as product
targets.

**RealMod import honesty:** each unit lists package-local imports matching
on-disk `import SystemsLean.*` order and set. Verified with live without-lake
order lines.

**Honest depth (PARTIAL-STRUCTURAL):** package-local imports + on-disk required
decls. **Not** full Lean 4 elaborator typecheck. Remaining library ~270 - 153
still open. `set_option maxRecDepth 16384` already in place (no raise this slice).

## Done when checklist

| Item | Evidence |
|------|----------|
| Named CompilePath* unit band seed | +11 modules; seed units label ends +CompilePathExtract; modules=**153** |
| expandSliceName | `Host library seed expand continue` on HostImportGraph + HostModuleCheck |
| Measured without Lake | `just host-import-graph-without-lake` + `just host-module-check-without-lake` GREEN modules=153 |
| HostResidualShrink reseed | `measuredHostRealModuleSeedUnits` + expand Name reseeded |
| DualResidual unchanged | No edit; remains true / free false |
| free/complete/PROVABLY + product Lake pins | Unchanged (not touched) |
| proofCompleteClaimed | Unchanged |
| Docs floor scrub (Part A) | RESIDUAL-systems Next residual implement prompt L32+/142 then post-seed L33+/153 |
| Residual next Name | Open **Host library seed expand continue** (beyond modules=153; L33+; next seed-closed band) |
| Join | this file |

## Files changed

| Path | Change |
|------|--------|
| `src/systems/SystemsLean/HostImportGraph.lean` | Seed +11; RealMod edges honest; acceptCount 153; order edge checks; imports dual-pins |
| `src/systems/SystemsLean/HostModuleCheck.lean` | Seed expand; surface checks; loadOk modules=153; good fixtures wire-up |
| `src/systems/SystemsLean/HostModuleCheckFixtures.lean` | Required decls + good fixture texts |
| `src/systems/SystemsLean/HostModuleCheckTheorems.lean` | Good accept smokes; seed label tip |
| `src/systems/SystemsLean/HostResidualShrink.lean` | Seed units + expand Name inventory reseed |
| `just/host-without-lake.just` | seed greps |
| `just/host.just` | host-residual-shrink seed greps |
| `nix/systems-host-presence/host-specs-compile-path-3.nix` | dual-pin living seed tokens |
| `RESIDUAL-systems.md` | Done L32 + Open L33+ Host library seed expand continue; Done when >153; Part A footer scrub |
| `RESIDUAL.md` | Systems Open table + living tip Open floor beyond modules=153 |
| `WATCHER.md` | next `/implement` beyond 153; join a44 |
| `doc/SESSION-HANDOFF.md` | Active / Next / Open residual / Recommended next lockstep |
| `src/systems/self-host.md` | Living tip modules=153 + next Name |
| `doc/goals.md` | Living tip modules=153 |
| `.agents/plans/plan-slake-replaces-lake.md` | Living tip A43 modules=153; Phase L L32 done / L33+ open; Immediate next >153; join a44 |
| `.agents/joins/a43-host-library-seed-expand-continue.md` | this join |

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
just host-import-graph-without-lake   # GREEN modules=153 expand=Host library seed expand continue
just host-module-check-without-lake   # GREEN modules=153 expand=Host library seed expand continue
just host-residual-shrink             # GREEN
just hygiene                          # GREEN
```

## RED/GREEN notes (seed contract)

- **Before:** living dual-pins and measured without-lake reported modules=142;
  CompilePath* unit surfaces not in seed; residual footer lagging L30+/135.
- **After:** modules=153; same expandSliceName; without-Lake measured green;
  RealMod edges honest (CompilePath+Emit* units; Extract Mult+Program). Floors
  lockstep >153 / a44.
- Host free / DualResidual free **not** flipped.

## Next

**Open:** Host library seed expand continue (L33+ beyond modules=153).
Prefer next coherent seed-closed band. Candidates after inventory:
ProductWireWriteTool (CapableWriteHc+InstallOut); HostTerm (Mult);
LlvmEmitPath (LlvmHold); SubsetFront (CompilePath+IrProgram+Types+Mult);
other pure/multi leaves already seed-closed. Join next:
`.agents/joins/a44-host-library-seed-expand-continue.md`.
