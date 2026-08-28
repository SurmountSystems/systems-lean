# Report: Term-surface for MultSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **112 -> 113**. TERM dual-ok **58 -> 59**.

Unit TERM accept + reject twins landed for MultSubsetRebuild, the next real host
seed module after MultSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as MultSubsetEmit TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `multSubsetRebuildSelfApplyOk`
fold, not `emitMultReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckMultSubsetRebuildTerm.lean` (303). Dialect on Mult rebuild self-apply path, wrote-expected, residual-free, product-complete, and multSubsetRebuildReady. |
| E-good dialect / self-apply | `multSubsetRebuildSelfApplyOk` body is the living product fold (`multSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `multSubsetRebuildSelfApplyOk && multSubsetEmitWroteExpected`. |
| E-good residual | `multSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `multSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `multSubsetRebuildReady` matches the real MultSubsetRebuild chain (`multSubsetRebuildReadyTermBody`). |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckMultSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through MultSubsetRebuild. |
| RealModule | `refineMultSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good MultSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 987 (under 1000). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope MultSubsetRebuild-only. |
| Harness | **112 -> 113** (`seed=206+Main=59+harness=113`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **58 -> 59**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice.

## Living MultSubsetRebuild claims twinned (from disk)

| Claim | Living body on `MultSubsetRebuild.lean` | TERM E-good / ILL |
|-------|------------------------------------------|-------------------|
| residual | `multSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `multSubsetRebuildSelfApplyOk` (and wrote-expected `multSubsetRebuildWroteExpected := multSubsetRebuildSelfApplyOk && multSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `multSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `multSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `multSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitMultReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckMultSubsetRebuildTerm` with `hostModuleCheckMultSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckMultSubsetRebuildTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed MultSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckMultSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckMultSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckMultSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (102 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1452 files; 775 md).

## systems-host

`just systems-host`: **exit 0** (331 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. MultSubsetRebuild residual-free and complete claimed
stay **false**.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckMultSubsetRebuildTerm.lean` (new, 303)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (129)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (612)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (987)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (778)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (268)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (MultSubsetRebuild TERM spec; compile-path-1 stays 994 / under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 113)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for MultSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of MultSubsetEmit TERM
- Re-queue PE64
- Flipping residual-free or complete claimed on MultSubsetRebuild
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
