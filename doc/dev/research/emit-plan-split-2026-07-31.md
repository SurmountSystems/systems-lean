# EmitPlan long-file split inventory (2026-07-31)

Kind: analysis only. Not residual.

## Before / after

| Path | Before | After |
|------|--------|-------|
| `src/systems/SystemsLean/EmitPlan.lean` | 703 | **424** (-279) |
| `src/systems/SystemsLean/EmitPlanScaffold.lean` | (new) | **332** |

Parent under 500. Seam is HOST-EMIT-PLAN product scaffolding split (not dual-pin, not tip).

## Stay / move

| Stay on EmitPlan | Moved to EmitPlanScaffold |
|------------------|---------------------------|
| Module header + core dialect | `productStageId` / host/self-host map ids |
| `Plan`, `Plan.failClosed` | `planHeaderOpen` / `planApiDecls` / `planHeaderFragment` |
| `isRuntimeMult` / count helpers | `planBodyOpen` / `planBodies` / `planBodyFragment` |
| `planFromCompose`, `fromCompose`, `isReady`, `planOk` | ownership / surface / honesty Bools |
| EMIT-PLAN theorems + EMIT-PLAN-SMOKE fixtures | `emitPlanReady` / `emitPlanOk` |
| Import `EmitPlanScaffold` + split cites | EMIT-PLAN-PRODUCT-SMOKE + `emitPlanReady_true` |
| | Same namespace `SystemsLean.EmitPlan` |

## Coherence

- One seam: HOST-EMIT-PLAN freestanding product C scaffolding text + readiness
  vs core EMIT_PLAN_V0 plan inventory dialect / theorems / plan smoke.
- No half-file cut; no stitch markers; no `/tmp` full-file rewrite of a living tip.
- Lake discovers Scaffold via EmitPlan import (and client imports where
  planHeaderFragment / emitPlanReady are used directly).

## Gates touched

- `nix/systems-host-presence/host-leans.nix` -- EmitPlanScaffold path
- `nix/systems-host-presence/required-files.nix` -- EmitPlanScaffold path
- `nix/systems-host-presence/host-specs-core.nix` -- parent cites + Scaffold row
- `nix/systems-emit-wire/emit-product.nix` -- FreestandingEmit + DualEqWrite cites + Scaffold row
- Client imports: DualEqWriteLoad, DualEqWriteApi, CapableWriteHc, CompilePathPlan,
  FreestandingEmit, SelfHostBody, SystemsLean.lean root

## Non-claims

complete true; free/llvm/PROVABLY false; tip not edited.
