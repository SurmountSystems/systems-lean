# Implement summary: Package 2a EmitPlan TERM-SURFACE

Date: 2026-08-10
Workspace: /home/hunter/Projects/ai/iso
Status: GREEN

## What landed

L2 TERM-SURFACE pilot for `SystemsLean.EmitPlan` only (progressive after Mult..Extract).

### Companion
- `src/systems/SystemsLean/HostModuleCheckEmitPlanTerm.lean`
- Pins: `checkDepthEmitPlanTermSurfaceBar` = TERM-SURFACE; scope EmitPlan-only;
  `hostModuleCheckEmitPlanTermSurfaceDualOk` = true
- Dialect `checkEmitPlanTermDialect`:
  - Plan.failClosed zeros + ready/valid false
  - isRuntimeMult arms: mult0 false; mult1 true; multOmega true
  - planFromCompose fail-closed inventory body
  - isReady = p.valid && p.ready
  - planOk = isReady (planFromCompose hc)
- Gate `hostModuleCheckEmitPlanTermSurfaceOk` (not bare dualOk)
- E-good text + EP1..EP4 bad twins; L0Accept on all bad twins
- `refineEmitPlanWithTermSurface` on EmitPlan `checkRealModule` path

### Wire-up
- HostModuleCheck hub import; CheckersLater refine branch
- LoadOk fold SurfaceOk; Driver smoke via `hostModuleCheckEmitPlanTermSmokeOk`
- AcceptsGoods: full checkRealModule good/bad + smoke Bool
- Fixture good EmitPlan text upgraded to L2-shaped (under refine)
- HostResidualShrink dualOk mirror; harness **40 -> 41**
- just/host.just dualOk greps; host-without-lake family + tokens
- pure Nix host-leans / required-files / host-specs-compile-path-3

### Residual lockstep
- Package 2a Done (EmitPlan term-surface pilot)
- Open Package 2b Next unit TERM-SURFACE (EmitApply)
- WATCHER + SESSION-HANDOFF + plan-full-readiness living tip
- Report: `.agents/reports/impl-emitplan-term-surface-2026-08-10.md`

## Gates (observed)

| Command | Exit |
|---------|------|
| lake build SystemsLean.HostModuleCheckEmitPlanTerm | 0 |
| lake build SystemsLean.HostModuleCheck HostResidualShrink HostResidualShrinkTheorems slake-host-module-check | 0 |
| just host-module-check-without-lake | 0 (GREEN; modules=206) |
| just host-residual-shrink | 0 |
| just systems-host | 0 (254 required paths) |
| just hygiene | 0 |

## Pins unchanged

- FullHostElaborateRemains **false**
- free / complete / PROVABLY **true**
- fixture tip fullBackend **true** (Package 1 A-light)
- Mult..Extract TERM dual-ok **true**
- Mult/Linear/Types PROOF dual-ok **true**

## Sub-1-KLOC

HostModuleCheckEmitPlanTerm ~538; Driver ~992; HostResidualShrink ~995;
FixtureTextsProduct ~976; AcceptsGoods ~693. All under 1000.

## Next

Package 2b EmitApply TERM-SURFACE (WATCHER `/implement` ready).
