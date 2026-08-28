# Implement summary: Package 2b EmitApply TERM-SURFACE

Date: 2026-08-10
Workspace: /home/hunter/Projects/ai/iso
Status: GREEN

## What landed

L2 TERM-SURFACE pilot for `SystemsLean.EmitApply` only (progressive after EmitPlan).

### Companion
- `src/systems/SystemsLean/HostModuleCheckEmitApplyTerm.lean`
- Pins: `checkDepthEmitApplyTermSurfaceBar` = TERM-SURFACE; scope EmitApply-only;
  `hostModuleCheckEmitApplyTermSurfaceDualOk` = true
- Dialect `checkEmitApplyTermDialect` (reuses EmitPlan collapse/arm helpers):
  - Apply.failClosed tags=[] count=0 valid=false
  - applyCap body 32
  - multCode arms: 0, 1, 2 (length 3)
  - applyFromCompose fail-closed + cap + packTag inventory
  - applyIsValid count/tags consistency
  - applyOk = applyIsValid (applyFromCompose hc)
- Gate `hostModuleCheckEmitApplyTermSurfaceOk` (not bare dualOk)
- E-good text + EA1..EA4 bad twins; L0Accept on all bad twins
- `refineEmitApplyWithTermSurface` on EmitApply `checkRealModule` path

### Wire-up
- HostModuleCheck hub import; CheckersLater refine branch (header shrink for Sub-1-KLOC)
- LoadOk fold SurfaceOk; Driver smoke via `hostModuleCheckEmitApplyTermSmokeOk`
- AcceptsGoods: full checkRealModule good/bad + smoke Bool
- Fixture good EmitApply text upgraded to L2-shaped (under refine)
- HostResidualShrink dualOk mirror; harness **41 -> 42**
- just/host.just dualOk greps; host-without-lake family + tokens
- pure Nix host-leans / required-files / host-specs-compile-path-3

### Residual lockstep
- Package 2b Done (EmitApply term-surface pilot)
- Open Package 2c Next unit TERM-SURFACE (EmitBody)
- WATCHER + SESSION-HANDOFF + plan-full-readiness living tip
- Report: `.agents/reports/impl-emitapply-term-surface-2026-08-10.md`

## Gates (observed)

| Command | Exit |
|---------|------|
| lake build SystemsLean.HostModuleCheckEmitApplyTerm | 0 |
| lake build SystemsLean.HostModuleCheck HostResidualShrink HostResidualShrinkTheorems slake-host-module-check | 0 |
| just host-module-check-without-lake | 0 (GREEN; modules=206; emitApplyTermSurface=EmitApply-only dualOk=true) |
| just host-residual-shrink | 0 |
| just systems-host | 0 (255 required paths) |
| just hygiene | 0 |

## Pins unchanged

- FullHostElaborateRemains **false**
- free / complete / PROVABLY **true**
- fixture tip fullBackend **true** (Package 1 A-light)
- EmitPlan TERM dual-ok EmitPlan-only **true**
- Mult..Extract TERM dual-ok **true**
- Mult/Linear/Types PROOF dual-ok **true**

## Sub-1-KLOC

HostModuleCheckEmitApplyTerm ~451; CheckersLater ~999; Driver ~998;
HostResidualShrink ~995; FixtureTextsProduct ~967; AcceptsGoods ~739. All under 1000.

## Next

Package 2c EmitBody TERM-SURFACE (WATCHER `/implement` ready).
