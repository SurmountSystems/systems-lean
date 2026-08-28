# Report: Term-surface for GraphSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **116 -> 117**. TERM dual-ok **62 -> 63**.

Unit TERM accept + reject twins landed for GraphSubsetRebuild, the next real host
seed module after ProgramSubsetRebuild. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as ProgramSubsetRebuild TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `graphSubsetRebuildSelfApplyOk`
fold, not `emitGraphReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckGraphSubsetRebuildTerm.lean` (306). Dialect on Graph rebuild self-apply path, wrote-expected, residual-free, product-complete, and graphSubsetRebuildReady. |
| E-good dialect / self-apply | `graphSubsetRebuildSelfApplyOk` body is the living product fold (`graphSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `graphSubsetRebuildSelfApplyOk && graphSubsetEmitWroteExpected`. |
| E-good residual | `graphSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `graphSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `graphSubsetRebuildReady` matches the real GraphSubsetRebuild chain (`graphSubsetRebuildReadyTermBody`), including `!graphSubsetRebuildWithoutLakeFinishedClaimed`. |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckGraphSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through GraphSubsetRebuild. |
| RealModule | `refineGraphSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good GraphSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 991 (under 1000; no long-file split). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope GraphSubsetRebuild-only. |
| Harness | **116 -> 117** (`seed=206+Main=59+harness=117`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **62 -> 63**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice. Soft J2: this slice has no package-env
edit. ShrinkTermOk scope is GraphSubsetRebuild-only.

## Living GraphSubsetRebuild claims twinned (from disk)

| Claim | Living body on `GraphSubsetRebuild.lean` | TERM E-good / ILL |
|-------|------------------------------------------|-------------------|
| residual | `graphSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `graphSubsetRebuildSelfApplyOk` (and wrote-expected `graphSubsetRebuildWroteExpected := graphSubsetRebuildSelfApplyOk && graphSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `graphSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims including without-Lake-finished + stage/host/surface/input/exe/recipe pins) | collapsed chain `graphSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `graphSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitGraphReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckGraphSubsetRebuildTerm` with `hostModuleCheckGraphSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckGraphSubsetRebuildTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed GraphSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckGraphSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckGraphSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckGraphSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (107 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1497 files; 815 md).

## systems-host

`just systems-host`: **exit 0** (336 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. GraphSubsetRebuild residual-free and complete claimed
stay **false**.

## Line counts

| File | Lines |
|------|------:|
| HostModuleCheckGraphSubsetRebuildTerm.lean | 306 |
| HostModuleCheckLoadOkLaterTerm.lean | 138 |
| HostModuleCheckLoadOk.lean | 914 |
| HostModuleCheckRealModule.lean | 624 |
| HostModuleCheckAccepts.lean | 991 |
| HostModuleCheck.lean | 195 |
| SystemsLean.lean | 283 |
| HostResidualShrink.lean | 839 |
| HostResidualShrinkTheorems.lean | 790 |
| HostResidualShrinkTermOk.lean | 280 |
| GraphSubsetRebuild.lean (untouched) | 355 |

No novel file >= 1000.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckGraphSubsetRebuildTerm.lean` (new, 306)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (138)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (624)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (991)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (790)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (280)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (GraphSubsetRebuild TERM spec; compile-path-1 stays under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 117)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for GraphSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- PE68 / PE67 (do not implement / re-queue)
- Re-queue ProgramSubsetRebuild TERM or TypesSubsetRebuild TERM
- Inventing a C fail-closed residual
- Cold compose init unroll
- Flipping residual-free or complete claimed on GraphSubsetRebuild
- Using `emitGraphReady` as the dialect clone
- Inventing EmitRebuild
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
