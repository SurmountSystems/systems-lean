# Implement report: Package env EmitBody expand

Date: 2026-08-10
Repo: Systems Lean (`/home/hunter/Projects/ai/iso`)
Name: Package env EmitBody expand
Status: **GREEN** + **DONE-FOR-NOW**

## Goal

Advance FullHost meet **H2**: package-scope real judgments beyond Mult+Linear+Types+
IrProgram+IrGraph+HostCompose+Erasure+Extract+EmitPlan+EmitApply multi-module env by
adding EmitBody body dialect + import chain with fail-closed E-bad.
FullHostElaborateRemains stays **false**. No free/complete/PROVABLY flip.

## What landed

### MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv package environment dialect (H2)

Superseded MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEnv-only with
**MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only** dual-pin
reseed in `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (**847** lines).

| Piece | Detail |
|-------|--------|
| Scope | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only` |
| packageBand | `MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBody-env` |
| Depth bar | `PACKAGE-ELABORATE` |
| Dual-ok pin | `hostModuleCheckPackageElaborateEnvDualOk` |
| Gate | `hostModuleCheckPackageElaborateEnvOk` (not bare dualOk) |
| Dialect | `checkPackageEnvDialect` |

**Why this advances H2 (not inventory re-list):**

1. Multi-module fixture sections: Mult + Linear + Types + IrProgram + IrGraph +
   HostCompose + Erasure + Extract + EmitPlanScaffold + EmitPlan +
   EmitApplyScaffold + EmitApply + **EmitBodyScaffold** (import resolve only) +
   **EmitBody** (`===module SystemsLean.EmitBody===` ... `===end===`)
2. Soft **J5**: Mult / Linear / Types / IrProgram / IrGraph / HostCompose /
   Erasure / Extract / EmitPlan / EmitApply / **EmitBody** bodies run unit term
   dialects (`checkMultTermDialect` ... `checkEmitBodyTermDialect`)
3. Soft **J2**: prior import chain + EmitApply import HostCompose; EmitBody must
   `import SystemsLean.HostCompose` (also Mult/Types/EmitPlan/EmitApply/Scaffold
   present); every import resolves to a present `===module Name===` section
4. E-bad twins: L0 package tokens alone still accept

| Twin | Mutation | L0 | Env dialect |
|------|----------|----|-------------|
| E-good | Mult..Extract+EmitPlan+EmitApply+EmitBody good + Mult/Types/IrProgram/IrGraph/Erasure/HostCompose imports | accept | accept |
| PE1 | Mult `name : Mult -> Nat` | accept | reject `ILL-TYPED-TERM` |
| PE4 | Types wrong `NodeKind.name` arm | accept | reject `ILL-TYPED-TERM` |
| PE5 | IrProgram wrong `programCap` (0 not 8) | accept | reject `ILL-TYPED-TERM` |
| PE6 | IrGraph wrong `edgeMax` (0 not 16) | accept | reject `ILL-TYPED-TERM` |
| PE7 | HostCompose empty drops graph/erased fields | accept | reject `ILL-TYPED-TERM` |
| PE8 | Erasure `checkFailClosed` always true | accept | reject `ILL-TYPED-TERM` |
| PE9 | Extract `checkFailClosed` always true | accept | reject `ILL-TYPED-TERM` |
| PE10 | EmitPlan `Plan.failClosed` ready true | accept | reject `ILL-TYPED-TERM` |
| PE11 | EmitApply `Apply.failClosed` valid true | accept | reject `ILL-TYPED-TERM` |
| PE12 | EmitBody `Body.failClosed` valid true | accept | reject `ILL-TYPED-TERM` |
| PE2 | Linear imports `SystemsLean.MissingMod` | accept | reject `PACKAGE-ENV-INCOMPLETE` |
| PE3 | `packageEnvReady: false` | accept | reject `PACKAGE-ENV-INCOMPLETE` |

### Sub-1-KLOC (same-slice compression, no new harness module)

Prior tip PackageEnv was **944**. EmitBody growth would have pushed past 1000.
Same-slice PE fixture compression (shared module-section helpers + Linear/Program/
Graph/Compose-through-EmitBody suffixes) kept PackageEnv at **847** without a new
harness companion (harness stays **55**).

| Module | Role | Lines |
|--------|------|-------|
| `HostModuleCheckPackageElab.lean` | Inventory PACKAGE-ELABORATE bands | **608** |
| `HostModuleCheckPackageEnv.lean` | Multi-module env judgment dialect (H2 Mult..EmitBody) | **847** |

Harness stays **55** (no new module). Driver pre-existing headroom residual (no growth this slice).

### Dual-pin and wire-up

| Surface | Change |
|---------|--------|
| HostResidualShrink | `measuredHostCheckPackageEnvBandScope` = MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only |
| HostResidualShrinkTheorems | scope theorem MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only |
| HostModuleCheckDriver | error string MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBody-env |
| HostModuleCheck hub | greppable MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only |
| SurfaceMatrix | rowFullElaborator MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv prose |
| just/host.just | HostResidualShrink greps MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only |
| just/host-without-lake.just | family includes PE12 EmitBody fixture; EmitBodyEnv scope |
| nix host-specs-compile-path-3 | PackageEnv PE12 + EmitBodyEnv scope; Shrink scope token |

### Pins (unchanged)

| Pin | Value |
|-----|-------|
| FullHostElaborateRemains | **false** |
| free / complete / PROVABLY | **true** (unchanged) |
| Mult/Linear/Types/IrProgram/IrGraph/HostCompose/Erasure/Extract/EmitPlan/EmitApply/EmitBody unit TERM dual-ok | **unchanged** |
| Mult/Linear/Types PROOF dual-ok | **unchanged** |
| seed / harness | **206** / **55** |

## Gates (ran)

| Gate | Result |
|------|--------|
| `lake build SystemsLean.HostModuleCheckPackageEnv` | exit 0 |
| `lake build` HostModuleCheck + HostResidualShrink + Theorems + SurfaceMatrix + slake-host-module-check | exit 0 |
| `just host-module-check-without-lake` | GREEN; modules=206; packageEnv MultLinearTypesProgramGraphComposeErasureExtractEmitPlanEmitApplyEmitBodyEnv-only dualOk=true |
| `just host-residual-shrink` | GREEN (FullHost false) |
| `just systems-host` | GREEN (268 paths) |
| `just hygiene` | GREEN |

## Residual lockstep

| Artifact | Update |
|----------|--------|
| RESIDUAL-systems.md | EmitBody expand Done; Open empty **DONE-FOR-NOW** foundation plateau |
| RESIDUAL.md | Systems Open join DONE-FOR-NOW; EmitBody done |
| SESSION-HANDOFF.md | Active DONE-FOR-NOW plateau |
| WATCHER.md | DONE-FOR-NOW (no invent slash-command) |
| fullhost-meet-inventory | H2 partial improved (Mult..EmitBody ladder closed through EmitBody; plateau) |

## Non-claims

- Not package L4 complete / not seed-wide J1-J12
- Not FullHostElaborateRemains true
- Not free / complete / PROVABLY re-open
- Not mathlib / full Lean 4 core parity
- Mult..Extract+HostCompose path+EmitPlan/Apply/Body package env closed through EmitBody; H2 still partial vs seed=206

## DONE-FOR-NOW (honest plateau)

After close: Mult..EmitBody package env ladder is a natural foundation plateau.

- Package-env multi-module judgments cover Mult..Extract + HostCompose path + EmitPlan/Apply/Body
- H2 still **partial** vs seed=206 (most seed modules L0-only)
- FullHostElaborateRemains **false**; free/complete/PROVABLY true
- Kernel Mult..Emit TERM + PROOF dual-ok done; harness **55**
- Next promote-only: further package-env seed expansion, FullHost claim meet (H5), A-heavy LLVM held
- Do **not** forge FullHost true

No invent slash-command residual in WATCHER.
