# Report: Term-surface for LinearSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **104 -> 105**. TERM dual-ok **50 -> 51**.

Unit TERM accept + reject twins landed for LinearSubsetEmit, the next real host
seed module after FirstSurface. Same E-good + ILL-TYPED-TERM residual / emit /
ready / complete twins as FirstSurface. L0 still accepts the bad texts. Dialect
rejects residual-free / emit / ready / complete ill-typed bodies. SurfaceOk
fold, not bare dualOk. Seed 206 unchanged. H2 still partial vs seed 206. H5
unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckLinearSubsetEmitTerm.lean` (267). Dialect on Linear emit path, residual-free, product-complete, and linearSubsetEmitReady. |
| E-good emit | `linearSubsetEmitLinearDialectOk` body is `emitLinearReady`. |
| E-good residual | `linearSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `linearSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `linearSubsetEmitReady` matches the real LinearSubsetEmit chain (`linearSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckLinearSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). |
| RealModule | `refineLinearSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good LinearSubsetEmit text is Term text, not the L0 FixtureTextsProduct stub. |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope LinearSubsetEmit-only. |
| Harness | **104 -> 105** (`seed=206+Main=59+harness=105`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **50 -> 51**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`. Package-env twins are
out of scope for this slice.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckLinearSubsetEmitTerm` with `hostModuleCheckLinearSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckLinearSubsetEmitTermSurfaceOk = true` is false |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed LinearSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckLinearSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckLinearSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckLinearSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (93 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1363 files; 695 md).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckLinearSubsetEmitTerm.lean` (new, 267)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean`
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean`
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean`
- `src/systems/SystemsLean/HostModuleCheck.lean`
- `src/systems/SystemsLean.lean`
- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean`
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean`

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-1.nix` (LinearSubsetEmit L0 home plus TERM spec)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 105)

## Residual lockstep

- This Name **done** (implementer). Parent owns WATCHER / residual ledger lockstep after review.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for LinearSubsetEmit
- Inventing a C fail-closed residual
- Cold compose init unroll
- Updating WATCHER.md

## Next Name

Parent lockstep after review. Still a pilot. Still not FullHost. Do not flip
the pin without H1-H8 + lake on a named flip residual.
