# Report: Term-surface for TypesSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **105 -> 106**. TERM dual-ok **51 -> 52**.

Unit TERM accept + reject twins landed for TypesSubsetEmit, the next real host
seed module after LinearSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
emit / ready / complete twins as LinearSubsetEmit. L0 still accepts the bad
texts. Dialect rejects residual-free / emit / ready / complete ill-typed
bodies. SurfaceOk fold, not bare dualOk. Seed 206 unchanged. H2 still partial
vs seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckTypesSubsetEmitTerm.lean` (268). Dialect on Types emit path, residual-free, product-complete, and typesSubsetEmitReady. |
| E-good emit | `typesSubsetEmitTypesDialectOk` body is `emitTypesReady`. |
| E-good residual | `typesSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `typesSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `typesSubsetEmitReady` matches the real TypesSubsetEmit chain (`typesSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckTypesSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). |
| RealModule | `refineTypesSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good TypesSubsetEmit text is Term text, not the L0 FixtureTextsProduct stub. |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope TypesSubsetEmit-only. |
| Harness | **105 -> 106** (`seed=206+Main=59+harness=106`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **51 -> 52**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`. Package-env twins are
out of scope for this slice.

## Living TypesSubsetEmit claims twinned (from disk)

| Claim | Living body on `TypesSubsetEmit.lean` | TERM E-good / ILL |
|-------|----------------------------------------|-------------------|
| emit | `typesSubsetEmitTypesDialectOk := emitTypesReady` | good `emitTypesReady`; ILL body `true` |
| residual | `typesSubsetEmitResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| complete | `typesSubsetEmitProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |
| ready | multi-line `typesSubsetEmitReady` (input + Types dialect + package + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `typesSubsetEmitReadyTermBody`; ILL body `true` |

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckTypesSubsetEmitTerm` with `hostModuleCheckTypesSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckTypesSubsetEmitTermSurfaceOk = true` is false |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed TypesSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckTypesSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckTypesSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckTypesSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (94 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1374 files; 705 md).

## systems-host

`just systems-host`: **exit 0** (323 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckTypesSubsetEmitTerm.lean` (new, 268)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (111)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (591)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (980)
- `src/systems/SystemsLean/HostModuleCheck.lean` (173)
- `src/systems/SystemsLean.lean` (272)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (757)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (247)

### Gates

- `just/host.just` (1471)
- `just/host-without-lake.just` (2525)
- `nix/systems-host-presence/host-leans.nix` (371)
- `nix/systems-host-presence/required-files.nix` (410)
- `nix/systems-host-presence/host-specs-compile-path-1.nix` (TypesSubsetEmit L0 home plus TERM spec)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 106)

## Residual lockstep

- This Name **done** (implementer). Parent owns WATCHER / residual ledger lockstep after review.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for TypesSubsetEmit
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of LinearSubsetEmit TERM
- Updating WATCHER.md / residual / handoff

## Next Name

Parent lockstep after review. Still a pilot. Still not FullHost. Do not flip
the pin without H1-H8 + lake on a named flip residual.
