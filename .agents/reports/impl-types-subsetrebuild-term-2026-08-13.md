# Report: Term-surface for TypesSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **114 -> 115**. TERM dual-ok **60 -> 61**.

Unit TERM accept + reject twins landed for TypesSubsetRebuild, the next real host
seed module after LinearSubsetRebuild. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as LinearSubsetRebuild TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `typesSubsetRebuildSelfApplyOk`
fold, not `emitTypesReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckTypesSubsetRebuildTerm.lean` (304). Dialect on Types rebuild self-apply path, wrote-expected, residual-free, product-complete, and typesSubsetRebuildReady. |
| E-good dialect / self-apply | `typesSubsetRebuildSelfApplyOk` body is the living product fold (`typesSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `typesSubsetRebuildSelfApplyOk && typesSubsetEmitWroteExpected`. |
| E-good residual | `typesSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `typesSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `typesSubsetRebuildReady` matches the real TypesSubsetRebuild chain (`typesSubsetRebuildReadyTermBody`), including `!typesSubsetRebuildWithoutLakeFinishedClaimed`. |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckTypesSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through TypesSubsetRebuild. |
| RealModule | `refineTypesSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good TypesSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 989 (under 1000). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope TypesSubsetRebuild-only. |
| Harness | **114 -> 115** (`seed=206+Main=59+harness=115`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **60 -> 61**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice. Soft J2: this slice has no package-env
edit (CompilePath-only honesty if anyone mentions package-env).

## Living TypesSubsetRebuild claims twinned (from disk)

| Claim | Living body on `TypesSubsetRebuild.lean` | TERM E-good / ILL |
|-------|------------------------------------------|-------------------|
| residual | `typesSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `typesSubsetRebuildSelfApplyOk` (and wrote-expected `typesSubsetRebuildWroteExpected := typesSubsetRebuildSelfApplyOk && typesSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `typesSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims including without-Lake-finished + stage/host/surface/input/exe/recipe pins) | collapsed chain `typesSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `typesSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitTypesReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckTypesSubsetRebuildTerm` with `hostModuleCheckTypesSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckTypesSubsetRebuildTermSurfaceOk = true` is false (2 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed TypesSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckTypesSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckTypesSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckTypesSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (105 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1475 files; 795 md).

## systems-host

`just systems-host`: **exit 0** (334 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. TypesSubsetRebuild residual-free and complete claimed
stay **false**.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckTypesSubsetRebuildTerm.lean` (new, 304)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (133)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (618)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (989)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (784)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (274)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (TypesSubsetRebuild TERM spec; compile-path-1 stays 994 / under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 115)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for TypesSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- PE67 (do not implement)
- Re-queue LinearSubsetRebuild TERM or PE66
- Inventing a C fail-closed residual
- Cold compose init unroll
- Flipping residual-free or complete claimed on TypesSubsetRebuild
- Using `emitTypesReady` as the dialect clone
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
