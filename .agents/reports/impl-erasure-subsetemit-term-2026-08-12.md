# Report: Term-surface for ErasureSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **109 -> 110**. TERM dual-ok **55 -> 56**.

Unit TERM accept + reject twins landed for ErasureSubsetEmit, the next real host
seed module after ComposeSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
emit / ready / complete twins as ComposeSubsetEmit. L0 still accepts the bad
texts. Dialect rejects residual-free / emit / ready / complete ill-typed
bodies. SurfaceOk fold, not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. H2 still partial
vs seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckErasureSubsetEmitTerm.lean` (272). Dialect on Erasure emit path, residual-free, product-complete, and erasureSubsetEmitReady. |
| E-good emit | `erasureSubsetEmitErasureDialectOk` body is `emitErasureReady`. |
| E-good residual | `erasureSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `erasureSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `erasureSubsetEmitReady` matches the real ErasureSubsetEmit chain (`erasureSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckErasureSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through ErasureSubsetEmit. |
| RealModule | `refineErasureSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good ErasureSubsetEmit text is Term text, not the L0 FixtureTextsLater stub. Accepts 984 (under 1000). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ErasureSubsetEmit-only. |
| Harness | **109 -> 110** (`seed=206+Main=59+harness=110`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **55 -> 56**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice.

## Living ErasureSubsetEmit claims twinned (from disk)

| Claim | Living body on `ErasureSubsetEmit.lean` | TERM E-good / ILL |
|-------|----------------------------------------|-------------------|
| emit | `erasureSubsetEmitErasureDialectOk := emitErasureReady` | good `emitErasureReady`; ILL body `true` |
| residual | `erasureSubsetEmitResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| complete | `erasureSubsetEmitProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |
| ready | multi-line `erasureSubsetEmitReady` (input + Erasure dialect + package + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `erasureSubsetEmitReadyTermBody`; ILL body `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckErasureSubsetEmitTerm` with `hostModuleCheckErasureSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckErasureSubsetEmitTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed ErasureSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckErasureSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckErasureSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckErasureSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (98 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1418 files; 745 md).

## systems-host

`just systems-host`: **exit 0** (327 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. ErasureSubsetEmit residual-free and complete claimed
stay **false**.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckErasureSubsetEmitTerm.lean` (new, 272)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (121)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (603)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (984)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (769)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (259)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-1.nix` (ErasureSubsetEmit TERM spec; 994)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 110)

## Residual lockstep

- This Name **done** (implementer). Parent owns WATCHER / residual ledger lockstep after review.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ErasureSubsetEmit (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of ComposeSubsetEmit TERM
- Flipping residual-free or complete claimed on ErasureSubsetEmit
- Updating WATCHER.md / residual / handoff

## Next Name

Package-env for ErasureSubsetEmit (do not open it). Evidence may need a
long-file split first (near 1000). Parent lockstep after review. Still a
pilot. Still not FullHost. Do not flip the pin without H1-H8 + lake on a
named flip residual.
