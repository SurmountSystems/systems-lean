# Report: Term-surface for ProgramSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **115 -> 116**. TERM dual-ok **61 -> 62**.

Unit TERM accept + reject twins landed for ProgramSubsetRebuild, the next real host
seed module after TypesSubsetRebuild. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as TypesSubsetRebuild TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `programSubsetRebuildSelfApplyOk`
fold, not `emitProgramReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckProgramSubsetRebuildTerm.lean` (305). Dialect on Program rebuild self-apply path, wrote-expected, residual-free, product-complete, and programSubsetRebuildReady. |
| E-good dialect / self-apply | `programSubsetRebuildSelfApplyOk` body is the living product fold (`programSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `programSubsetRebuildSelfApplyOk && programSubsetEmitWroteExpected`. |
| E-good residual | `programSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `programSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `programSubsetRebuildReady` matches the real ProgramSubsetRebuild chain (`programSubsetRebuildReadyTermBody`), including `!programSubsetRebuildWithoutLakeFinishedClaimed`. |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckProgramSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through ProgramSubsetRebuild. |
| RealModule | `refineProgramSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good ProgramSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 990 (under 1000). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ProgramSubsetRebuild-only. |
| Harness | **115 -> 116** (`seed=206+Main=59+harness=116`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **61 -> 62**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice. Soft J2: this slice has no package-env
edit (CompilePath-only honesty if anyone mentions package-env).

## Living ProgramSubsetRebuild claims twinned (from disk)

| Claim | Living body on `ProgramSubsetRebuild.lean` | TERM E-good / ILL |
|-------|--------------------------------------------|-------------------|
| residual | `programSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `programSubsetRebuildSelfApplyOk` (and wrote-expected `programSubsetRebuildWroteExpected := programSubsetRebuildSelfApplyOk && programSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `programSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims including without-Lake-finished + stage/host/surface/input/exe/recipe pins) | collapsed chain `programSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `programSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitProgramReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckProgramSubsetRebuildTerm` with `hostModuleCheckProgramSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckProgramSubsetRebuildTermSurfaceOk = true` is false (2 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed ProgramSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckProgramSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckProgramSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckProgramSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (106 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1486 files; 805 md).

## systems-host

`just systems-host`: **exit 0** (335 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. ProgramSubsetRebuild residual-free and complete claimed
stay **false**.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckProgramSubsetRebuildTerm.lean` (new, 305)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (136)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (621)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (990)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (787)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (277)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (ProgramSubsetRebuild TERM spec; compile-path-1 stays under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 116)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ProgramSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- PE67 (do not implement / re-queue)
- Re-queue TypesSubsetRebuild TERM or PE66 or LinearSubsetRebuild TERM
- Inventing a C fail-closed residual
- Cold compose init unroll
- Flipping residual-free or complete claimed on ProgramSubsetRebuild
- Using `emitProgramReady` as the dialect clone
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
