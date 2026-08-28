# Report: Term-surface for ExtractSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **119 -> 120**. TERM dual-ok **65 -> 66**.

Unit TERM accept + reject twins landed for ExtractSubsetRebuild, the next real host
seed module after ErasureSubsetRebuild. Same E-good + ILL-TYPED-TERM residual /
dialect / ready / complete twins as ErasureSubsetRebuild TERM. This unit is rebuild /
self-apply, not emit. Dialect body is the living `extractSubsetRebuildSelfApplyOk`
fold, not `emitExtractReady`. L0 still accepts the bad texts. Dialect rejects
residual-free / self-apply / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

Did **not** copy `emitExtractReady`. Did **not** clone ExtractSubsetEmit TERM.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckExtractSubsetRebuildTerm.lean` (309). Dialect on Extract rebuild self-apply path, wrote-expected, residual-free, product-complete, and extractSubsetRebuildReady. |
| E-good dialect / self-apply | `extractSubsetRebuildSelfApplyOk` body is the living product fold (`extractSubsetRebuildSelfApplyOkTermBody`). Wrote-expected body is `extractSubsetRebuildSelfApplyOk && extractSubsetEmitWroteExpected`. |
| E-good residual | `extractSubsetRebuildResidualFreeClaimed` body is `false`. |
| E-good complete | `extractSubsetRebuildProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `extractSubsetRebuildReady` matches the real ExtractSubsetRebuild chain (`extractSubsetRebuildReadyTermBody`), including `!extractSubsetRebuildWithoutLakeFinishedClaimed`. |
| ILL twins | residual-free claimed true; self-apply body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckExtractSubsetRebuildTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through ExtractSubsetRebuild. LoadOkLaterTerm 145. |
| RealModule | `refineExtractSubsetRebuildWithTermSurface` instead of bare L0 check. |
| Accepts | Good ExtractSubsetRebuild text is Term text, not the L0 FixtureTextsLater stub. Accepts 994 (under 1000; no long-file split). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ExtractSubsetRebuild-only. |
| Harness | **119 -> 120** (`seed=206+Main=59+harness=120`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **65 -> 66**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice. Soft J2: this slice has no package-env
edit. ShrinkTermOk scope is ExtractSubsetRebuild-only.

## Living ExtractSubsetRebuild claims twinned (from disk)

| Claim | Living body on `ExtractSubsetRebuild.lean` | TERM E-good / ILL |
|-------|--------------------------------------------|-------------------|
| residual | `extractSubsetRebuildResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| dialect / self-apply | `extractSubsetRebuildSelfApplyOk` (and wrote-expected `extractSubsetRebuildWroteExpected := extractSubsetRebuildSelfApplyOk && extractSubsetEmitWroteExpected`) | good = living product fold; ILL body `true` |
| ready | multi-line `extractSubsetRebuildReady` (input + package pin + self-apply + wrote-expected + Lake + local non-claims including without-Lake-finished + stage/host/surface/input/exe/recipe pins) | collapsed chain `extractSubsetRebuildReadyTermBody`; ILL body `true` |
| complete | `extractSubsetRebuildProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.
Did **not** copy `emitExtractReady` as the dialect body.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckExtractSubsetRebuildTerm` with `hostModuleCheckExtractSubsetRebuildTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckExtractSubsetRebuildTermSurfaceOk = true` is false (12 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / self-apply / ready /
complete ill-typed ExtractSubsetRebuild bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckExtractSubsetRebuildTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckExtractSubsetRebuildTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckExtractSubsetRebuildTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (110 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1531 files; 846 md).

First hygiene run failed on a pre-existing mop report
(trashed; see `.agents/reports/impl-residual-closeout-package-env-erasure-subsetrebuild-2026-08-13.md`)
that quoted a banned module-split slang token. Rephrased those two lines only.
Second hygiene: **exit 0**. This slice did not introduce the banned token.

## systems-host

`just systems-host`: **exit 0** (339 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. ExtractSubsetRebuild residual-free and complete claimed
stay **false**. Host free claimed stays true. Product complete / PROVABLY
living tips were not touched.

## Line counts

| File | Lines |
|------|------:|
| HostModuleCheckExtractSubsetRebuildTerm.lean | 309 |
| HostModuleCheckLoadOkLaterTerm.lean | 145 |
| HostModuleCheckLoadOk.lean | 914 |
| HostModuleCheckRealModule.lean | 633 |
| HostModuleCheckAccepts.lean | 994 |
| HostModuleCheck.lean | 201 |
| SystemsLean.lean | 286 |
| HostResidualShrink.lean | 839 |
| HostResidualShrinkTheorems.lean | 799 |
| HostResidualShrinkTermOk.lean | 289 |
| ExtractSubsetRebuild.lean (untouched) | living claims reconfirmed |

No novel file >= 1000. Accepts was 993; adding the Extract Term import made 994.
Did **not** long-file split Accepts (would not pass 1000).

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckExtractSubsetRebuildTerm.lean` (new, 309)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (145)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (633)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (994)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (799)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (289)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (ExtractSubsetRebuild TERM spec)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 120)

### Hygiene mop (pre-existing, not product)

- `.agents/reports/impl-residual-closeout-package-env-erasure-subsetrebuild-2026-08-13.md` (hygiene mop on lockstep closeout; two lines; banned slang quote; mop report trashed)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ExtractSubsetRebuild (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Re-queue PE71 / ESR TERM
- Inventing a C fail-closed residual
- Cold compose init unroll
- Flipping residual-free or complete claimed on ExtractSubsetRebuild
- Using `emitExtractReady` as the dialect clone
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
