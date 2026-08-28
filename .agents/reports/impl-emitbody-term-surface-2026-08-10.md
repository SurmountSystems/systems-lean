# Implement report: Package 2c EmitBody TERM-SURFACE

Date: 2026-08-10. Workspace: `/home/hunter/Projects/ai/iso`.

## Status

**GREEN** -- Package 2c Done when met.

## What landed

1. **Sub-1-KLOC long-file split:** `checkRealModule` + `surfaceFromContent` moved from
   `HostModuleCheckCheckersLater.lean` (**999->541**) into new
   `HostModuleCheckRealModule.lean` (**484**).
2. **Companion** `HostModuleCheckEmitBodyTerm.lean` (**496**):
   - dualOk + bar/scope **EmitBody-only** / **TERM-SURFACE**
   - dialect: Body.failClosed, bodyCap 256, bodyFromCompose, bodyIsValid, bodyOk
   - EB1..EB4 twins; L0Accept; SurfaceOk; `native_decide` theorems
   - failClosed prefix match (product `private def` tail after failClosed)
3. **Refine** on EmitBody `checkRealModule` path via
   `refineEmitBodyWithTermSurface`.
4. **Fixture** `hostModuleCheckGoodEmitBodyText` upgraded to L2-shaped bodies.
5. **Wire:** AcceptsGoods smoke; LoadOk fold SurfaceOk; Driver banner/smoke;
   HostResidualShrink dualOk + harness **42->44** (EmitBodyTerm + RealModule);
   just host + host-without-lake; pure Nix host-leans / required-files /
   host-specs-compile-path-3.
6. Residual + handoff + WATCHER + plan living tip lockstep.

## Pins unchanged

| Pin | Value |
|-----|-------|
| free / complete / PROVABLY | true |
| FullHostElaborateRemains | false |
| fixture tip fullBackend | true |
| EmitPlan TERM dual-ok EmitPlan-only | true |
| EmitApply TERM dual-ok EmitApply-only | true |
| Mult..Extract TERM dual-ok | true |
| Mult/Linear/Types PROOF dual-ok | true |
| seed | 206 |
| harness | **44** |

## Gates (exit 0)

```
lake build SystemsLean.HostModuleCheckEmitBodyTerm
lake build SystemsLean.HostModuleCheckRealModule
lake build SystemsLean.HostModuleCheck (+ family + HostResidualShrink)
lake build slake-host-module-check
just host-module-check-without-lake
just systems-host
just hygiene
```

## Sub-1-KLOC (touched)

| File | Lines |
|------|------:|
| HostModuleCheckCheckersLater | 541 |
| HostModuleCheckRealModule | 484 |
| HostModuleCheckEmitBodyTerm | 496 |
| HostModuleCheckDriver | 998 |
| HostModuleCheckAcceptsGoods | 785 |
| HostModuleCheckFixtureTextsProduct | 958 |
| HostResidualShrink | 993 |

## Next

Open **empty done-for-now**. Package 3 optional held (mathlib day-one;
AffineDrop; without-classic-FFI end announce) -- operator promote only.
Standing: Sub-1-KLOC; `just hygiene`.
