# Report: Term-surface for ComposeSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **117 -> 118**. TERM dual-ok **63 -> 64**.

Unit TERM accept + reject twins landed for ComposeSubsetRebuild, the next real host
seed module after GraphSubsetRebuild. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as GraphSubsetRebuild TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `composeSubsetRebuildSelfApplyOk`
fold, not `emitComposeReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

Did **not** copy `emitComposeReady`.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckComposeSubsetRebuildTerm.lean` (307). Dialect on Compose rebuild self-apply path, wrote-expected, residual-free, product-complete, and composeSubsetRebuildReady. |
| E-good dialect / self-apply | `composeSubsetRebuildSelfApplyOk` body is the living product fold (`composeSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `composeSubsetRebuildSelfApplyOk && composeSubsetEmitWroteExpected`. |
| E-good residual | `composeSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `composeSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `composeSubsetRebuildReady` matches the real ComposeSubsetRebuild chain (`composeSubsetRebuildReadyTermBody`), including `!composeSubsetRebuildWithoutLakeFinishedClaimed`. |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckComposeSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through ComposeSubsetRebuild. |
| RealModule | `refineComposeSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good ComposeSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 992 (under 1000; no long-file split). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ComposeSubsetRebuild-only. |
| Harness | **117 -> 118** (`seed=206+Main=59+harness=118`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **63 -> 64**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice. Soft J2: this slice has no package-env
edit. ShrinkTermOk scope is ComposeSubsetRebuild-only.

## Living ComposeSubsetRebuild claims twinned (from disk)

| Claim | Living body on `ComposeSubsetRebuild.lean` | TERM E-good / ILL |
|-------|--------------------------------------------|-------------------|
| residual | `composeSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `composeSubsetRebuildSelfApplyOk` (and wrote-expected `composeSubsetRebuildWroteExpected := composeSubsetRebuildSelfApplyOk && composeSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `composeSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims including without-Lake-finished + stage/host/surface/input/exe/recipe pins) | collapsed chain `composeSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `composeSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitComposeReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckComposeSubsetRebuildTerm` with `hostModuleCheckComposeSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckComposeSubsetRebuildTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed ComposeSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckComposeSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckComposeSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckComposeSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (108 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1508 files; 825 md).

## systems-host

`just systems-host`: **exit 0** (337 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. ComposeSubsetRebuild residual-free and complete claimed
stay **false**. Host free claimed stays true. Product complete / PROVABLY
living tips were not touched.

## Line counts

| File | Lines |
|------|------:|
| HostModuleCheckComposeSubsetRebuildTerm.lean | 307 |
| HostModuleCheckLoadOkLaterTerm.lean | 140 |
| HostModuleCheckLoadOk.lean | 914 |
| HostModuleCheckRealModule.lean | 627 |
| HostModuleCheckAccepts.lean | 992 |
| HostModuleCheck.lean | 197 |
| SystemsLean.lean | 284 |
| HostResidualShrink.lean | 839 |
| HostResidualShrinkTheorems.lean | 793 |
| HostResidualShrinkTermOk.lean | 283 |
| ComposeSubsetRebuild.lean (untouched) | 355 |

No novel file >= 1000. Accepts was 991; adding the Compose Term import made 992.
Did **not** long-file split Accepts (would not pass 1000).

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckComposeSubsetRebuildTerm.lean` (new, 307)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (140)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (627)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (992)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (793)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (283)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (ComposeSubsetRebuild TERM spec; compile-path-1 stays under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 118)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ComposeSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Re-queue PE69 / GraphSubsetRebuild TERM / PE68
- Inventing a C fail-closed residual
- Cold compose init unroll
- Flipping residual-free or complete claimed on ComposeSubsetRebuild
- Using `emitComposeReady` as the dialect clone
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
