# Implement report: ParityLinear TERM-SURFACE (R3)

Date: 2026-08-11
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: ParityLinear TERM-SURFACE
Status: **GREEN**

## Goal

Real accept/reject term dialect on `SystemsLean.ParityLinear` (second post-Kernel named
host unit after ParityMult). Pattern-match HostModuleCheckParityMultTerm. FullHostElaborateRemains
stays **false**. No free/complete/PROVABLY flip. No package-env rewrite. No DominanceClaimed forge.

## What landed

### Companion HostModuleCheckParityLinearTerm

| Piece | Detail |
|-------|--------|
| Module | `SystemsLean/HostModuleCheckParityLinearTerm.lean` (**~380** lines) |
| Scope | `ParityLinear-only` |
| Depth bar | `TERM-SURFACE` |
| Dual-ok pin | `hostModuleCheckParityLinearTermSurfaceDualOk` |
| Gate | `hostModuleCheckParityLinearTermSurfaceOk` (not bare dualOk) |
| Dialect | `checkParityLinearTermDialect` |

**Dialect subset (soft J5 def-shape):**

1. `stageId` body `"SLAKE_SELF_HOST_PARITY_LINEAR_V0"`
2. `hostParityLinearId` body `"HOST-PARITY-LINEAR"`
3. `selfHostParityLinearId` body `"SELF-HOST-PARITY-LINEAR"`
4. `linearContractParityOk` fail-closed compose
   `KernelLinear.linearKernelReady && KernelLinear.linearHostPathReady && ParityMult.multParityReady && productApiSurfaceOk`
5. `linearParityReady` fail-closed compose
   `linearContractParityOk && paritySurfaceOk`
6. `linearParityOk` definitional alias `linearParityReady`

| Twin | Mutation | L0 | Term dialect |
|------|----------|----|--------------|
| E-good | ParityLinear good bodies | accept | accept |
| PL1 | wrong stageId | accept | reject `ILL-TYPED-TERM` |
| PL2 | linearParityReady always true | accept | reject `ILL-TYPED-TERM` |
| PL3 | linearParityOk always true | accept | reject `ILL-TYPED-TERM` |
| PL4 | linearContractParityOk always true | accept | reject `ILL-TYPED-TERM` |

### Wire-up

| Surface | Change |
|---------|--------|
| RealModule | `refineParityLinearWithTermSurface` on ParityLinear path |
| LoadOk | SurfaceOk + full-path smoke (`hostModuleCheckParityLinearTermSmokeOk`) |
| Driver | explicit ParityLinear smoke unless |
| L0 good fixture | `hostModuleCheckGoodParityLinearText` bodies match dialect |
| HostResidualShrink | dualOk mirror + harness **57 -> 58** + ParityLinearTerm in out-of-scope list |
| HostResidualShrinkTheorems | harness string + partition example |
| hub / SystemsLean.lean | import ParityLinearTerm |
| just/host.just | harness=58 + ParityLinear dualOk greps |
| just/host-without-lake.just | family mod + greppable tokens |
| nix host-leans / required-files | ParityLinearTerm path |
| nix host-specs-compile-path-3 | companion spec + harness + dualOk tokens |

Smoke lives in **LoadOk** (not AcceptsGoods) so AcceptsGoods is not grown further over Sub-1-KLOC.

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult..EmitBody + Kernel Mult..Emit + ParityMult TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **58** |
| package-env Kernel/ParityMult scope | **unchanged** (out of scope) |
| DominanceClaimed | **false** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckParityLinearTerm` | exit 0 |
| `lake build` HostModuleCheck + RealModule + LoadOk + AcceptsGoods + Driver + HostResidualShrink + Theorems | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206 |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (271 paths) |
| `just hygiene` | GREEN |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not package-env re-expand (R1 left alone)
- Not DominanceClaimed forge
- Not llvm / dual examples

## Sub-1-KLOC

| Module | Lines (approx) |
|--------|----------------|
| HostModuleCheckParityLinearTerm | **~380** |
| HostModuleCheckRealModule | **~512** |
| HostModuleCheckLoadOk | **~970** |
| HostResidualShrink | **~940** |
| HostModuleCheckFixtureTextsLater | **~1015** (L0 good body expand; pre-existing over bar) |
| HostModuleCheckDriver | **~1015** (pre-existing over bar; few lines smoke) |

AcceptsGoods was already over 1000 before this slice; ParityLinear smoke placed in LoadOk.

## Residual

- R3 Done archive; Open empty done-for-now for named R1-R5 product Names
- R2 remains **done partial** (not re-opened; FULLHOST_FLIP=no)
