# Report: Package-env for ComposeSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **109** (no new module). TERM dual-ok **55**.
Seed **206** unchanged.

Package-env fixture twins landed for ComposeSubsetEmit now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE53..PE60. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE61 | ComposeSubsetEmit residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS15Text` = S14 good ++ ComposeSubsetEmit |
| Soft J2 | ComposeSubsetEmit import CompilePathCompose only (`packageBodyImportsCompilePathCompose`; no EmitCompose farm) |
| Soft J5 | unit `checkComposeSubsetEmitTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS15` after S14 GraphSubsetEmit succeeds |
| Multi-line | E-good ComposeSubsetEmit body uses `hostModuleCheckGoodComposeSubsetEmitReadyMultilineText` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **109** unchanged (no new module) |
| TERM dual-ok | **55** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean` (925)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (889)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (996)

All under Sub-1-KLOC. Evidence was 981 and the twin landed at 996, so a split
was not required. No new harness module. Did not rewrite the ComposeSubsetEmit
TERM companion (import / cite only).

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0. Did not flip FullHost to do it.

Soft J2 does not add an EmitCompose module section. The TERM companion skeleton
imports EmitCompose, but package env already resolves CompilePathCompose from
S8. PE-specific good/bad bodies import CompilePathCompose only. Package env has
no emit-module section for this unit.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckComposeSubsetEmitTermSurfaceOk`.
S14 tail chains to S15. `hostModuleCheckPackageEnvDialectOk` checks S15 good text.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE61 fold + ComposeSubsetEmit in packageEnvTermSurfaceOk + dialectOk on S15 good, before `checkPackageEnvDialectS15` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE61 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. |
| Green | same command after `checkPackageEnvDialectS15` + `packageBodyImportsCompilePathCompose` + S14 chain to S15 | **exit 0** |

Contract: package-env dialect must reject an ill-typed ComposeSubsetEmit TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good ComposeSubsetEmit section uses the multi-line `composeSubsetEmitReady`
shape so collapse is same-line or first next non-empty body line. Did not
rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5` (green) | **0** |

## Hygiene

`just hygiene`: **exit 0** (1412 files; 740 markdown).

`just systems-host`: **exit 0** (326 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 109 / TERM 55 unchanged.

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
- Rewrite of HostModuleCheckComposeSubsetEmitTerm
- Re-queue ComposeSubsetEmit TERM
- Next TERM unit (ErasureSubsetEmit)
- Term-surface for ErasureSubsetEmit
- New harness module / scope-string rename
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
