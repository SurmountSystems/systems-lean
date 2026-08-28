# Report: Term-surface for GraphSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **107 -> 108**. TERM dual-ok **53 -> 54**.

Unit TERM accept + reject twins landed for GraphSubsetEmit, the next real host
seed module after ProgramSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
emit / ready / complete twins as ProgramSubsetEmit. L0 still accepts the bad
texts. Dialect rejects residual-free / emit / ready / complete ill-typed
bodies. SurfaceOk fold, not bare dualOk. Seed 206 unchanged. H2 still partial
vs seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckGraphSubsetEmitTerm.lean` (270). Dialect on Graph emit path, residual-free, product-complete, and graphSubsetEmitReady. |
| E-good emit | `graphSubsetEmitGraphDialectOk` body is `emitGraphReady`. |
| E-good residual | `graphSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `graphSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `graphSubsetEmitReady` matches the real GraphSubsetEmit chain (`graphSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckGraphSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). |
| RealModule | `refineGraphSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good GraphSubsetEmit text is Term text, not the L0 FixtureTextsLater stub. |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope GraphSubsetEmit-only. |
| Harness | **107 -> 108** (`seed=206+Main=59+harness=108`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **53 -> 54**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`. Package-env twins are
out of scope for this slice.

## Living GraphSubsetEmit claims twinned (from disk)

| Claim | Living body on `GraphSubsetEmit.lean` | TERM E-good / ILL |
|-------|----------------------------------------|-------------------|
| emit | `graphSubsetEmitGraphDialectOk := emitGraphReady` | good `emitGraphReady`; ILL body `true` |
| residual | `graphSubsetEmitResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| complete | `graphSubsetEmitProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |
| ready | multi-line `graphSubsetEmitReady` (input + Graph dialect + package + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `graphSubsetEmitReadyTermBody`; ILL body `true` |

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckGraphSubsetEmitTerm` with `hostModuleCheckGraphSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckGraphSubsetEmitTermSurfaceOk = true` is false |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed GraphSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckGraphSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckGraphSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckGraphSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (96 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1396 files; 725 md).

## systems-host

`just systems-host`: **exit 0** (325 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckGraphSubsetEmitTerm.lean` (new, 270)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (116)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (597)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (982)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (763)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (253)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-1.nix` (GraphSubsetEmit TERM spec; L0 home remains compile-path-2)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 108)

## Residual lockstep

- This Name **done** (implementer). Parent owns WATCHER / residual ledger lockstep after review.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for GraphSubsetEmit
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of ProgramSubsetEmit TERM
- Updating WATCHER.md / residual / handoff

## Next Name

Parent lockstep after review. Still a pilot. Still not FullHost. Do not flip
the pin without H1-H8 + lake on a named flip residual.
