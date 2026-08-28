# Report: Package-env for GraphSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **108** (no new module). TERM dual-ok **54**.
Seed **206** unchanged.

Package-env fixture twins landed for GraphSubsetEmit now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE53..PE59. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE60 | GraphSubsetEmit residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS14Text` = S13 good ++ GraphSubsetEmit |
| Soft J2 | GraphSubsetEmit import CompilePathGraph only (`packageBodyImportsCompilePathGraph`; no EmitGraph farm) |
| Soft J5 | unit `checkGraphSubsetEmitTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS14` after S13 ProgramSubsetEmit succeeds |
| Multi-line | E-good GraphSubsetEmit body uses `hostModuleCheckGoodGraphSubsetEmitReadyMultilineText` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **108** unchanged (no new module) |
| TERM dual-ok | **54** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean` (862)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (871)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (981)

All under Sub-1-KLOC. No new harness module. Did not rewrite the GraphSubsetEmit
TERM companion (import / cite only).

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0. Did not flip FullHost to do it.

Soft J2 does not add an EmitGraph module section. The TERM companion skeleton
imports EmitGraph, but package env already resolves CompilePathGraph from
S8. PE-specific good/bad bodies import CompilePathGraph only.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckGraphSubsetEmitTermSurfaceOk`.
S13 tail chains to S14. `hostModuleCheckPackageEnvDialectOk` checks S14 good text.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE60 fold + GraphSubsetEmit in packageEnvTermSurfaceOk + dialectOk on S14 good, before `checkPackageEnvDialectS14` | **exit 1** -- Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE60 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. |
| Green | same command after `checkPackageEnvDialectS14` + `packageBodyImportsCompilePathGraph` + S13 chain to S14 | **exit 0** |

Contract: package-env dialect must reject an ill-typed GraphSubsetEmit TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good GraphSubsetEmit section uses the multi-line `graphSubsetEmitReady`
shape so collapse is same-line or first next non-empty body line. Did not
rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5` (green) | **0** |

## Hygiene

`just hygiene`: **exit 0** (1401 files; 730 markdown).

`just systems-host`: **exit 0** (325 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 108 / TERM 54 unchanged.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckGraphSubsetEmitTerm
- Re-queue GraphSubsetEmit TERM
- Term-surface for ComposeSubsetEmit
- New harness module / scope-string rename
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
