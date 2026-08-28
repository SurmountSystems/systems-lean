# Report: Package-env for ErasureSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **110** (no new module). TERM dual-ok **56**.
Seed **206** unchanged.

Package-env fixture twins landed for ErasureSubsetEmit now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE53..PE61. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE62 | ErasureSubsetEmit residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS16Text` = S15 good ++ ErasureSubsetEmit |
| Soft J2 | ErasureSubsetEmit import CompilePathErasure only (`packageBodyImportsCompilePathErasure`; no EmitErasure farm) |
| Soft J5 | unit `checkErasureSubsetEmitTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS16` after S15 ComposeSubsetEmit succeeds |
| Multi-line | E-good ErasureSubsetEmit body uses `hostModuleCheckGoodErasureSubsetEmitReadyMultilineText` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **110** unchanged (no new module) |
| TERM dual-ok | **56** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean` (989)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (907)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (964)

All under Sub-1-KLOC. Evidence started at 996. PE45..PE62 dialect rejects share
later-fold helper `packageEnvDialectRejectsIllTyped`, so the PE62 fold landed at
**964** and a separate Evidence companion was **not** required. No new harness
module. Did not rewrite the ErasureSubsetEmit TERM companion (import / cite only;
TERM file still 272).

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0. Did not flip FullHost to do it.

Soft J2 does not add an EmitErasure module section. The TERM companion skeleton
imports EmitErasure, but package env already resolves CompilePathErasure from
S8. PE-specific good/bad bodies import CompilePathErasure only. Package env has
no emit-module section for this unit.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckErasureSubsetEmitTermSurfaceOk`.
S15 tail chains to S16. `hostModuleCheckPackageEnvDialectOk` checks S16 good text.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE62 fold + ErasureSubsetEmit in packageEnvTermSurfaceOk + dialectOk on S16 good, before `checkPackageEnvDialectS16` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE62 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. |
| Green | same command after `checkPackageEnvDialectS16` + `packageBodyImportsCompilePathErasure` + S15 chain to S16 | **exit 0** |

Contract: package-env dialect must reject an ill-typed ErasureSubsetEmit TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good ErasureSubsetEmit section uses the multi-line `erasureSubsetEmitReady`
shape so collapse is same-line or first next non-empty body line. Did not
rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5` (green) | **0** |

## Hygiene

`just hygiene`: **exit 0** (1423 files; 750 markdown).

`just systems-host`: **exit 0** (327 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 110 / TERM 56 unchanged.
ErasureSubsetEmit residual-free and complete claimed stay **false**.

## Evidence long-file

Evidence was **not** split. Final line count **964** (under 1000). Later-fold
helper `packageEnvDialectRejectsIllTyped` covers PE45..PE62 dialect rejects
in the same Evidence file.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- Next expected Name: **Term-surface for ExtractSubsetEmit** (do not open here).
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckErasureSubsetEmitTerm
- Re-queue ErasureSubsetEmit TERM
- Term-surface for ExtractSubsetEmit (not opened)
- New harness module / scope-string rename
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
