# Report: Term-surface for LinearSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **113 -> 114**. TERM dual-ok **59 -> 60**.

Unit TERM accept + reject twins landed for LinearSubsetRebuild, the next real host
seed module after MultSubsetRebuild. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as MultSubsetRebuild TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `linearSubsetRebuildSelfApplyOk`
fold, not `emitLinearReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckLinearSubsetRebuildTerm.lean` (303). Dialect on Linear rebuild self-apply path, wrote-expected, residual-free, product-complete, and linearSubsetRebuildReady. |
| E-good dialect / self-apply | `linearSubsetRebuildSelfApplyOk` body is the living product fold (`linearSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `linearSubsetRebuildSelfApplyOk && linearSubsetEmitWroteExpected`. |
| E-good residual | `linearSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `linearSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `linearSubsetRebuildReady` matches the real LinearSubsetRebuild chain (`linearSubsetRebuildReadyTermBody`). |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckLinearSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through LinearSubsetRebuild. |
| RealModule | `refineLinearSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good LinearSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 988 (under 1000). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope LinearSubsetRebuild-only. |
| Harness | **113 -> 114** (`seed=206+Main=59+harness=114`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **59 -> 60**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice.

## Living LinearSubsetRebuild claims twinned (from disk)

| Claim | Living body on `LinearSubsetRebuild.lean` | TERM E-good / ILL |
|-------|------------------------------------------|-------------------|
| residual | `linearSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `linearSubsetRebuildSelfApplyOk` (and wrote-expected `linearSubsetRebuildWroteExpected := linearSubsetRebuildSelfApplyOk && linearSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `linearSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims including without-Lake-finished + stage/host/surface/input/exe/recipe pins) | collapsed chain `linearSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `linearSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitLinearReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckLinearSubsetRebuildTerm` with `hostModuleCheckLinearSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckLinearSubsetRebuildTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed LinearSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckLinearSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckLinearSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckLinearSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (104 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1464 files; 785 md).

## systems-host

`just systems-host`: **exit 0** (333 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. LinearSubsetRebuild residual-free and complete claimed
stay **false**.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckLinearSubsetRebuildTerm.lean` (new, 303)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (131)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (615)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (988)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (781)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (271)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (LinearSubsetRebuild TERM spec; compile-path-1 stays 994 / under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 114)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for LinearSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of MultSubsetRebuild TERM
- Re-queue PE65
- Flipping residual-free or complete claimed on LinearSubsetRebuild
- Using `emitLinearReady` as the dialect clone
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
