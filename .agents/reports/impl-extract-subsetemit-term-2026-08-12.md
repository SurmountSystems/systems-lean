# Report: Term-surface for ExtractSubsetEmit (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **110 -> 111**. TERM dual-ok **56 -> 57**.

Unit TERM accept + reject twins landed for ExtractSubsetEmit, the next real host
seed module after ErasureSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
emit / ready / complete twins as ErasureSubsetEmit. L0 still accepts the bad
texts. Dialect rejects residual-free / emit / ready / complete ill-typed
bodies. SurfaceOk fold, not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckExtractSubsetEmitTerm.lean` (273). Dialect on Extract emit path, residual-free, product-complete, and extractSubsetEmitReady. |
| E-good emit | `extractSubsetEmitExtractDialectOk` body is `emitExtractReady`. |
| E-good residual | `extractSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `extractSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `extractSubsetEmitReady` matches the real ExtractSubsetEmit chain (`extractSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckExtractSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through ExtractSubsetEmit. |
| RealModule | `refineExtractSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good ExtractSubsetEmit text is Term text, not the L0 FixtureTextsLater stub. Accepts 985 (under 1000). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ExtractSubsetEmit-only. |
| Harness | **110 -> 111** (`seed=206+Main=59+harness=111`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **56 -> 57**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice.

## Living ExtractSubsetEmit claims twinned (from disk)

| Claim | Living body on `ExtractSubsetEmit.lean` | TERM E-good / ILL |
|-------|----------------------------------------|-------------------|
| emit | `extractSubsetEmitExtractDialectOk := emitExtractReady` | good `emitExtractReady`; ILL body `true` |
| residual | `extractSubsetEmitResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| complete | `extractSubsetEmitProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |
| ready | multi-line `extractSubsetEmitReady` (input + Extract dialect + package + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `extractSubsetEmitReadyTermBody`; ILL body `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckExtractSubsetEmitTerm` with `hostModuleCheckExtractSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckExtractSubsetEmitTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed ExtractSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckExtractSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckExtractSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckExtractSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (99 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1429 files; 755 md).

## systems-host

`just systems-host`: **exit 0** (328 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. ExtractSubsetEmit residual-free and complete claimed
stay **false**.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckExtractSubsetEmitTerm.lean` (new, 273)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (123)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (603)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (985)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (772)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (262)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (ExtractSubsetEmit TERM spec; compile-path-1 stays 994 / under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 111)

## Residual lockstep

- This Name was already opened. Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ExtractSubsetEmit (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of ErasureSubsetEmit TERM
- Re-queue PE62
- Flipping residual-free or complete claimed on ExtractSubsetEmit
- Updating WATCHER.md / residual / handoff
