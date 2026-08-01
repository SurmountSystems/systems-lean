# CompilePath Lean seams (2026-07-31)

Kind: analysis + implement inventory. Not residual free. Not product C.

## Problem

`src/systems/SystemsLean/CompilePath.lean` was ~3609 lines: core compile bars,
shared fixture helpers, and eleven unit e2e fixtures (Mult..Body) plus smokes.
Largest remaining Lean kitchen-sink under `src/systems/` after SelfApplyFs tip split.

## Region map (pre-seam line anchors)

| Region | Approx lines | Role | Stay / move |
|--------|--------------|------|-------------|
| Module header + imports | 1-321 | Greppable inventory | Stay (trim as splits land) |
| Core API (stageId, Verdict, compileReady, unit/program bars) | 322-538 | HOST-COMPILE-PATH core | **Stay** in CompilePath |
| Shared helpers (pushFixtureProg/Host, mintFixtureHost) | Mult block | Used by all fixtures | **Stay** in CompilePath until optional CompilePathFixture home |
| Mult fixture + thm | ~539-749 | COMPILE-PATH-MULT | Move later -> CompilePathMult |
| Linear fixture + thm | ~750-953 | COMPILE-PATH-LINEAR | -> CompilePathLinear |
| Types fixture + thm | ~954-1178 | COMPILE-PATH-TYPES | -> CompilePathTypes |
| Program fixture + thm | ~1179-1392 | COMPILE-PATH-PROGRAM | -> CompilePathProgram |
| Extract gate + thm | ~1393-1565 | COMPILE-PATH-EXTRACT (deps Mult+Program) | After Mult+Program splits, or with them |
| Graph fixture + thm | ~1566-1874 | COMPILE-PATH-GRAPH | -> CompilePathGraph |
| Compose fixture + thm | ~1875-2151 | COMPILE-PATH-COMPOSE | -> CompilePathCompose |
| Erasure fixture + thm | ~2152-2352 | COMPILE-PATH-ERASURE | **Moved** -> CompilePathErasure |
| Plan fixture + thm | ~2353-2586 | COMPILE-PATH-PLAN | **Moved** -> CompilePathPlan |
| Apply fixture + thm | ~2587-2824 | COMPILE-PATH-APPLY | **Moved** -> CompilePathApply |
| Body fixture + thm + smoke | ~2825-3072, 3557-3607 | COMPILE-PATH-BODY | **Moved** -> CompilePathBody |
| Core smoke + other smokes | ~3074-3556 | COMPILE-PATH-*-SMOKE | Smokes travel with their fixture |

## Import / cycle rules

- Kernel* modules import CompilePath only for `programCompileReady` / `gradeSurfaceOk`.
- Fixture homes import CompilePath (core + helpers) + matching Emit*.
- Do **not** make CompilePath import fixture homes (cycle).
- Same Lean namespace `SystemsLean.CompilePath` on fixture homes keeps def names
  stable for any `CompilePath.bodyFixture*` references after `import` of the home.
- Host presence: split tokens to the home file path in
  `nix/systems-host-presence/host-specs-compile-path.nix`.

## Batch 1 (landed)

- New: `src/systems/SystemsLean/CompilePathBody.lean`
- CompilePath.lean shrink: 3609 -> ~3309 (~300 lines)
- Root import: `SystemsLean.lean` + lakefile comment
- Host specs: Body tokens on CompilePathBody.lean

## Next splits (recommended order)

1. Apply (no other fixture depends on it; drops EmitApply from CompilePath)
2. Plan (drops EmitPlan)
3. Erasure, Compose, Graph (independent of Mult extract)
4. Mult + Program + Extract together (Extract binds Mult+Program)
5. Linear, Types
6. Optional: shared helpers -> CompilePathFixture

## Non-claims

Not residual free. Not freestanding complete forge. Not PROVABLY. Not llvm.
Not tip dual-pin re-open. Not half-file cut. Not shell/C product growth.


## Batch 2 (landed 2026-07-31)

- New: `CompilePathApply.lean`, `CompilePathPlan.lean`, `CompilePathErasure.lean`
- CompilePath.lean shrink: 3307 -> **2427** (-880); campaign from 3609 -> 2427 (-1182)
- Homes share namespace `SystemsLean.CompilePath`; import CompilePath + matching Emit*
- Host specs: three new entries; tokens moved off CompilePath wall
- Package: SystemsLean.lean imports Erasure/Plan/Apply homes
- Gates: hygiene, systems-host, systems-emit-wire, lake all five modules green
- Tip claims untouched (no freestanding-self-host-complete)

## Next splits

1. Compose -> CompilePathCompose
2. Graph -> CompilePathGraph
3. Mult + Program + Extract together
4. Linear, Types
5. Optional helpers home

Target: CompilePath under ~2k (now 2427; Compose+Graph should clear).

## Batch 3 (landed 2026-07-31)

- New: `CompilePathGraph.lean` (382), `CompilePathCompose.lean` (360)
- CompilePath.lean shrink: 2427 -> **1715** (-712); campaign from 3609 -> 1715 (-1894)
- Under ~2k stretch **met**
- Shared helper `addFixtureHostEdge` moved to CompilePath core (Graph+Compose)
- Homes share namespace `SystemsLean.CompilePath`; import CompilePath + EmitGraph/EmitCompose
- Host specs: two new entries; tokens moved off CompilePath wall
- Package: SystemsLean.lean imports Graph/Compose homes
- Gates: hygiene, systems-host, systems-emit-wire, lake CompilePath+Graph+Compose green
- Tip claims untouched

## Next splits

1. Mult + Program + Extract together (Extract binds Mult+Program)
2. Linear, Types
3. Optional helpers home

Target under 2k: **met** at 1715. Further splits continue kitchen-sink shrink.

## Batch 4 (landed 2026-07-31)

- New: CompilePathMult (254), CompilePathLinear (271), CompilePathTypes (290),
  CompilePathProgram (279), CompilePathExtract (249)
- CompilePath.lean shrink: 1715 -> **458** (-1257); campaign 3609 -> 458 (-3151)
- Shared helpers remain on CompilePath core
- Extract home imports Mult + Program splits (same namespace; no import cycle)
- Host specs: five new entries; Mult..Extract tokens off CompilePath wall
- Package imports five homes; maxRecDepth on theorem sections
- Gates: hygiene, systems-host, systems-emit-wire, lake splits, freestanding-self-host-complete GREEN
- Fixture splits **complete** (Body Apply Plan Erasure Graph Compose Mult Linear Types Program Extract)
- Optional helpers home: not needed (helpers already core)
- Next: no-sorry host inventory or cold long file; do not forge residual free

