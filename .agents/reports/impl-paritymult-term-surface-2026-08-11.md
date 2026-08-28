# Implement report: ParityMult TERM-SURFACE

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: ParityMult TERM-SURFACE
Status: **GREEN**

## Goal

Real accept/reject term dialect on `SystemsLean.ParityMult` (first post-Kernel named
host unit). Pattern-match HostModuleCheck*Term companions (KernelMultTerm /
EmitBodyTerm). FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip.

## What landed

### Companion HostModuleCheckParityMultTerm

| Piece | Detail |
|-------|--------|
| Module | `SystemsLean/HostModuleCheckParityMultTerm.lean` (**404** lines) |
| Scope | `ParityMult-only` |
| Depth bar | `TERM-SURFACE` |
| Dual-ok pin | `hostModuleCheckParityMultTermSurfaceDualOk` |
| Gate | `hostModuleCheckParityMultTermSurfaceOk` (not bare dualOk) |
| Dialect | `checkParityMultTermDialect` |

**Dialect subset (soft J5 def-shape):**

1. `stageId` body `"SLAKE_SELF_HOST_PARITY_MULT_V0"`
2. `hostParityMultId` body `"HOST-PARITY-MULT"`
3. `selfHostParityMultId` body `"SELF-HOST-PARITY-MULT"`
4. `multParityReady` fail-closed compose
   `KernelMult.multKernelReady && EmitMult.emitMultReady && gradeParityOk && paritySurfaceOk`
5. `multParityOk` definitional alias `multParityReady`
6. `gradeParityOk` compose
   `ofNatRoundTripOk && isValidTagParityOk && isValidParityOk && nameParityOk && enumTagParityOk`

| Twin | Mutation | L0 | Term dialect |
|------|----------|----|--------------|
| E-good | ParityMult good bodies | accept | accept |
| PM1 | wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PM2 | multParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PM3 | multParityOk always true | accept | reject `ILL-TYPED-TERM` |
| PM4 | gradeParityOk always true | accept | reject `ILL-TYPED-TERM` |

### Wire-up

| Surface | Change |
|---------|--------|
| RealModule | `refineParityMultWithTermSurface` on ParityMult path |
| LoadOk | SurfaceOk + full-path smoke (`hostModuleCheckParityMultTermSmokeOk`) |
| Driver | explicit ParityMult smoke unless |
| L0 good fixture | `hostModuleCheckGoodParityMultText` bodies match dialect |
| HostResidualShrink | dualOk mirror + harness **56 -> 57** + ParityMultTerm in out-of-scope list |
| HostResidualShrinkTheorems | harness string + partition example |
| hub / SystemsLean.lean | import ParityMultTerm |
| just/host.just | harness=57 + ParityMult dualOk greps |
| just/host-without-lake.just | family mod + greppable tokens |
| nix host-leans / required-files | ParityMultTerm path |
| nix host-specs-compile-path-3 | companion spec + harness + dualOk tokens |

Smoke lives in **LoadOk** (not AcceptsGoods) so AcceptsGoods is not grown further over Sub-1-KLOC.

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult..EmitBody + Kernel Mult..Emit unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **57** |
| package-env Kernel scope | **unchanged** (out of scope) |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckParityMultTerm` | exit 0 |
| `lake build` HostModuleCheck + RealModule + LoadOk + AcceptsGoods + Driver + HostResidualShrink + Theorems | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206 |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (270 paths) |
| `just hygiene` | GREEN |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not ParityLinear TERM same slice
- Not package-env re-expand
- Not llvm / dual examples

## Sub-1-KLOC

| Module | Lines |
|--------|-------|
| HostModuleCheckParityMultTerm | **404** |
| HostModuleCheckRealModule | **511** |
| HostModuleCheckLoadOk | ~950 |
| HostResidualShrink | **932** |
| HostModuleCheckFixtureTextsLater | **1008** (L0 good body expand; near bar) |

AcceptsGoods was already over 1000 before this slice; ParityMult smoke placed in LoadOk to avoid further growth there.
