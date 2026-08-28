# Report: Term-surface for ErasureSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **118 -> 119**. TERM dual-ok **64 -> 65**.

Unit TERM accept + reject twins landed for ErasureSubsetRebuild, the next real host
seed module after ComposeSubsetRebuild. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as ComposeSubsetRebuild TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `erasureSubsetRebuildSelfApplyOk`
fold, not `emitErasureReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

Did **not** copy `emitErasureReady`.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckErasureSubsetRebuildTerm.lean` (308). Dialect on Erasure rebuild self-apply path, wrote-expected, residual-free, product-complete, and erasureSubsetRebuildReady. |
| E-good dialect / self-apply | `erasureSubsetRebuildSelfApplyOk` body is the living product fold (`erasureSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `erasureSubsetRebuildSelfApplyOk && erasureSubsetEmitWroteExpected`. |
| E-good residual | `erasureSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `erasureSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `erasureSubsetRebuildReady` matches the real ErasureSubsetRebuild chain (`erasureSubsetRebuildReadyTermBody`), including `!erasureSubsetRebuildWithoutLakeFinishedClaimed`. |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckErasureSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through ErasureSubsetRebuild. |
| RealModule | `refineErasureSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good ErasureSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 993 (under 1000; no long-file split). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ErasureSubsetRebuild-only. |
| Harness | **118 -> 119** (`seed=206+Main=59+harness=119`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **64 -> 65**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice. Soft J2: this slice has no package-env
edit. ShrinkTermOk scope is ErasureSubsetRebuild-only.

## Living ErasureSubsetRebuild claims twinned (from disk)

| Claim | Living body on `ErasureSubsetRebuild.lean` | TERM E-good / ILL |
|-------|--------------------------------------------|-------------------|
| residual | `erasureSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `erasureSubsetRebuildSelfApplyOk` (and wrote-expected `erasureSubsetRebuildWroteExpected := erasureSubsetRebuildSelfApplyOk && erasureSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `erasureSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims including without-Lake-finished + stage/host/surface/input/exe/recipe pins) | collapsed chain `erasureSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `erasureSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitErasureReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckErasureSubsetRebuildTerm` with `hostModuleCheckErasureSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckErasureSubsetRebuildTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed ErasureSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckErasureSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckErasureSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckErasureSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (109 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1519 files; 835 md).

## systems-host

`just systems-host`: **exit 0** (338 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. ErasureSubsetRebuild residual-free and complete claimed
stay **false**. Host free claimed stays true. Product complete / PROVABLY
living tips were not touched.

## Line counts

| File | Lines |
|------|------:|
| HostModuleCheckErasureSubsetRebuildTerm.lean | 308 |
| HostModuleCheckLoadOkLaterTerm.lean | 143 |
| HostModuleCheckLoadOk.lean | 914 |
| HostModuleCheckRealModule.lean | 630 |
| HostModuleCheckAccepts.lean | 993 |
| HostModuleCheck.lean | 199 |
| SystemsLean.lean | 285 |
| HostResidualShrink.lean | 839 |
| HostResidualShrinkTheorems.lean | 796 |
| HostResidualShrinkTermOk.lean | 286 |
| ErasureSubsetRebuild.lean (untouched) | living claims reconfirmed |

No novel file >= 1000. Accepts was 992; adding the Erasure Term import made 993.
Did **not** long-file split Accepts (would not pass 1000).

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckErasureSubsetRebuildTerm.lean` (new, 308)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (143)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (630)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (993)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (796)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (286)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (ErasureSubsetRebuild TERM spec)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 119)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ErasureSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Re-queue PE70 / PE69 / CSR TERM / GSR TERM
- Inventing a C fail-closed residual
- Cold compose init unroll
- Flipping residual-free or complete claimed on ErasureSubsetRebuild
- Using `emitErasureReady` as the dialect clone
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
