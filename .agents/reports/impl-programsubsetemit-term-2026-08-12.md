# Report: Term-surface for ProgramSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **106 -> 107**. TERM dual-ok **52 -> 53**.

Unit TERM accept + reject twins landed for ProgramSubsetEmit, the next real host
seed module after TypesSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
emit / ready / complete twins as TypesSubsetEmit. L0 still accepts the bad
texts. Dialect rejects residual-free / emit / ready / complete ill-typed
bodies. SurfaceOk fold, not bare dualOk. Seed 206 unchanged. H2 still partial
vs seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckProgramSubsetEmitTerm.lean` (269). Dialect on Program emit path, residual-free, product-complete, and programSubsetEmitReady. |
| E-good emit | `programSubsetEmitProgramDialectOk` body is `emitProgramReady`. |
| E-good residual | `programSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `programSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `programSubsetEmitReady` matches the real ProgramSubsetEmit chain (`programSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckProgramSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). |
| RealModule | `refineProgramSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good ProgramSubsetEmit text is Term text, not the L0 FixtureTextsLater stub. |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ProgramSubsetEmit-only. |
| Harness | **106 -> 107** (`seed=206+Main=59+harness=107`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **52 -> 53**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`. Package-env twins are
out of scope for this slice.

## Living ProgramSubsetEmit claims twinned (from disk)

| Claim | Living body on `ProgramSubsetEmit.lean` | TERM E-good / ILL |
|-------|----------------------------------------|-------------------|
| emit | `programSubsetEmitProgramDialectOk := emitProgramReady` | good `emitProgramReady`; ILL body `true` |
| residual | `programSubsetEmitResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| complete | `programSubsetEmitProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |
| ready | multi-line `programSubsetEmitReady` (input + Program dialect + package + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `programSubsetEmitReadyTermBody`; ILL body `true` |

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckProgramSubsetEmitTerm` with `hostModuleCheckProgramSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckProgramSubsetEmitTermSurfaceOk = true` is false |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed ProgramSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckProgramSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckProgramSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckProgramSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (95 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1385 files; 715 md).

## systems-host

`just systems-host`: **exit 0** (324 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckProgramSubsetEmitTerm.lean` (new, 269)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (114)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (594)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (981)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (760)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (250)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-1.nix` (ProgramSubsetEmit L0 home plus TERM spec)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 107)

## Residual lockstep

- This Name **done** (implementer). Parent owns WATCHER / residual ledger lockstep after review.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ProgramSubsetEmit
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of TypesSubsetEmit TERM
- Updating WATCHER.md / residual / handoff

## Next Name

Parent lockstep after review. Still a pilot. Still not FullHost. Do not flip
the pin without H1-H8 + lake on a named flip residual.
