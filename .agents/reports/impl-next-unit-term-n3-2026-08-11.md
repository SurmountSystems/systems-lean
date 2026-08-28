# Implement report: N3 Next named unit TERM-SURFACE (ParityTypes)

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Next named unit TERM-SURFACE (N3)
Choice: **A** (real product unit)
Status: **GREEN**

## Decision (inventory)

| Candidate | Product unit exists? | TERM companion? | Notes |
|-----------|----------------------|-----------------|-------|
| Mult..Extract + Emit* + Kernel* | yes | yes | already TERM |
| ParityMult | yes | yes | harness 57 |
| ParityLinear | yes | yes | harness 58 |
| **ParityTypes** | **yes** (UNIT_SURFACE; kind band; RealModule L0) | **no** | third post-Kernel Parity* |
| ParityProgram | yes | no | next optional only under a new Name |
| ParityEmit | yes | no | same |

**Path A chosen:** `SystemsLean.ParityTypes` is a real freestanding-path parity unit
(stage ids, contract/ready fail-closed compose, product API canaries, theorems module).
It already had L0 structural surface but no L2 TERM dialect. Not invent theater.

**Path B rejected:** inventing a fake unit, or skipping while ParityTypes lacks TERM.

## What landed

### Companion HostModuleCheckParityTypesTerm

| Piece | Detail |
|-------|--------|
| Module | `SystemsLean/HostModuleCheckParityTypesTerm.lean` (**382** lines) |
| Scope | `ParityTypes-only` |
| Depth bar | `TERM-SURFACE` |
| Dual-ok pin | `hostModuleCheckParityTypesTermSurfaceDualOk` |
| Gate | `hostModuleCheckParityTypesTermSurfaceOk` (not bare dualOk) |
| Dialect | `checkParityTypesTermDialect` |

**Dialect subset (soft J5 def-shape):**

1. `stageId` body `"SLAKE_SELF_HOST_PARITY_TYPES_V0"`
2. `hostParityTypesId` body `"HOST-PARITY-TYPES"`
3. `selfHostParityTypesId` body `"SELF-HOST-PARITY-TYPES"`
4. `typesContractParityOk` fail-closed compose
   `KernelTypes.typesKernelReady && KernelTypes.typesProgramPathReady && KernelTypes.kindMultMismatchRejected && ParityLinear.linearParityReady && productApiSurfaceOk`
5. `typesParityReady` fail-closed compose
   `typesContractParityOk && paritySurfaceOk`
6. `typesParityOk` definitional alias `typesParityReady`

| Twin | Mutation | L0 | Term dialect |
|------|----------|----|--------------|
| E-good | ParityTypes good bodies | accept | accept |
| PT1 | wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PT2 | typesParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PT3 | typesParityOk always true | accept | reject `ILL-TYPED-TERM` |
| PT4 | typesContractParityOk always true | accept | reject `ILL-TYPED-TERM` |

### Wire-up

| Surface | Change |
|---------|--------|
| RealModule | `refineParityTypesWithTermSurface` on ParityTypes path |
| LoadOk | SurfaceOk + full-path smoke (`hostModuleCheckParityTypesTermSmokeOk`) |
| Driver | explicit ParityTypes smoke unless |
| L0 good fixture | `hostModuleCheckGoodParityTypesText` bodies match dialect |
| HostResidualShrink | dualOk mirror + harness **58 -> 59** + ParityTypesTerm in out-of-scope list |
| HostResidualShrinkTheorems | harness string + partition example |
| hub / SystemsLean.lean | import ParityTypesTerm |
| just/host.just | harness=59 + ParityTypes dualOk greps |
| just/host-without-lake.just | family mod + greppable tokens |
| nix host-leans / required-files | ParityTypesTerm path |
| nix host-specs-compile-path-3 | companion spec + harness + dualOk tokens |

Smoke lives in **LoadOk** (not AcceptsGoods) so AcceptsGoods is not grown further.

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| DominanceClaimed | **false** |
| band FullBackend | **false** |
| Mult..EmitBody + Kernel Mult..Emit + ParityMult + ParityLinear TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **59** |
| package-env ParityLinear scope | **unchanged** (out of scope N1) |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckParityTypesTerm` | exit 0 |
| `lake build` HostModuleCheck family + RealModule + LoadOk + Driver + HostResidualShrink + Theorems | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206 |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (272 paths) |
| `just hygiene` | GREEN |

## Sub-1-KLOC

| Module | Lines |
|--------|-------|
| HostModuleCheckParityTypesTerm | **382** |
| HostModuleCheckLoadOk | **997** |
| HostModuleCheckRealModule | **~515** |
| HostResidualShrink | **940** |
| HostModuleCheckDriver | **1020** (pre-existing over bar; few lines smoke) |
| HostModuleCheckFixtureTextsLater | **1022** (pre-existing over bar; good body expand) |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not package-env re-expand
- Not DominanceClaimed forge
- Not ParityProgram / ParityEmit TERM this slice (real units remain without TERM until a new Name)

## Residual lockstep

- RESIDUAL-systems.md: N3 **done**; Open empty done-for-now; Done archive row
- RESIDUAL.md: Systems Open join N3 done; harness 59
- SESSION-HANDOFF.md: living tip N1-N4 done
- WATCHER.md: DONE-FOR-NOW (no checkable next)

## GREEN summary

**A complete:** real ParityTypes TERM-SURFACE dual-ok; harness **59**; FullHost **false**;
free/complete/PROVABLY **true**; DominanceClaimed **false**.
