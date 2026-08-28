# Report: Term-surface for MultSubsetEmit (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **111 -> 112**. TERM dual-ok **57 -> 58**.

Unit TERM accept + reject twins landed for MultSubsetEmit, the next real host
seed module after ExtractSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
emit / ready / complete twins as ExtractSubsetEmit. L0 still accepts the bad
texts. Dialect rejects residual-free / emit / ready / complete ill-typed
bodies. SurfaceOk fold, not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckMultSubsetEmitTerm.lean` (274). Dialect on Mult emit path, residual-free, product-complete, and multSubsetEmitReady. |
| E-good emit | `multSubsetEmitMultDialectOk` body is `emitMultReady`. |
| E-good residual | `multSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `multSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `multSubsetEmitReady` matches the real MultSubsetEmit chain (`multSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckMultSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). Comments: EmitPlan through MultSubsetEmit. |
| RealModule | `refineMultSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good MultSubsetEmit text is Term text, not the L0 FixtureTextsLater stub. Accepts 986 (under 1000). |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope MultSubsetEmit-only. |
| Harness | **111 -> 112** (`seed=206+Main=59+harness=112`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **57 -> 58**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean` or Evidence. Package-env
twins are out of scope for this slice.

## Living MultSubsetEmit claims twinned (from disk)

| Claim | Living body on `MultSubsetEmit.lean` | TERM E-good / ILL |
|-------|--------------------------------------|-------------------|
| emit | `multSubsetEmitMultDialectOk := emitMultReady` | good `emitMultReady`; ILL body `true` |
| residual | `multSubsetEmitResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| complete | `multSubsetEmitProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |
| ready | multi-line `multSubsetEmitReady` (input + Mult dialect + package + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `multSubsetEmitReadyTermBody`; ILL body `true` |

Expected table matched disk. Did **not** flip residual-free or complete claimed.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckMultSubsetEmitTerm` with `hostModuleCheckMultSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckMultSubsetEmitTermSurfaceOk = true` is false (14 jobs attempted) |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed MultSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckMultSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckMultSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckMultSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (101 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1441 files; 765 md).

## systems-host

`just systems-host`: **exit 0** (330 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. MultSubsetEmit residual-free and complete claimed
stay **false**.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckMultSubsetEmitTerm.lean` (new, 274)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (126)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (609)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (986)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (775)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (265)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-4.nix` (MultSubsetEmit TERM spec; compile-path-1 stays 994 / under 1000)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 112)

## Residual lockstep

- Implementer did **not** edit residual / WATCHER / SESSION-HANDOFF.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for MultSubsetEmit (`HostModuleCheckPackageEnv*.lean` / Evidence untouched)
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of ExtractSubsetEmit TERM, KernelMult TERM, CompilePathMult TERM, or the earlier Mult TERM unit
- Flipping residual-free or complete claimed on MultSubsetEmit
- Updating WATCHER.md / residual / handoff
- Git add / commit
- New Python / shell mills
- `/tmp` full-file rebuild of product Lean
