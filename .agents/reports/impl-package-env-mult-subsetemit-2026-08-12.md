# Report: Package-env for MultSubsetEmit (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **112**. TERM dual-ok **58**.
Seed **206** unchanged.

Package-env fixture twins landed for MultSubsetEmit now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE63 ExtractSubsetEmit.
H2 still partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE64 | MultSubsetEmit residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS18Text` = S17 good ++ MultSubsetEmit |
| Multi-line | E-good MultSubsetEmit body uses `hostModuleCheckGoodMultSubsetEmitReadyMultilineText` |
| Soft J2 | MultSubsetEmit import CompilePathMult only (`packageBodyImportsCompilePathMult`; no EmitMult farm) |
| Soft J5 | unit `checkMultSubsetEmitTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS18` after S17 ExtractSubsetEmit succeeds |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **112** unchanged (no new TERM companion) |
| TERM dual-ok | **58** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (155)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (938)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (988)

FixturesS5 stayed **990** (S18 not appended). All under Sub-1-KLOC.
Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE64, so Evidence stayed in the same file at **988**. Did not rewrite
the MultSubsetEmit TERM companion (import / cite only; TERM file still 274).

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0. Did not flip FullHost to do it.

Soft J2 does not add an EmitMult module section. The TERM companion skeleton
imports FirstSurface + EmitMult, but package env already resolves
CompilePathMult from S8 / FirstSurface. PE-specific good/bad bodies import
CompilePathMult only. Package env has no emit-module section for this unit.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckMultSubsetEmitTermSurfaceOk`.
S17 tail chains to S18. `hostModuleCheckPackageEnvDialectOk` checks S18 good text.

Harness inventory string in `HostResidualShrink` was left at the living 112-name
list. This slice is not a new TERM companion.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE64 fold + MultSubsetEmit in packageEnvTermSurfaceOk + dialectOk on S18 good, before `checkPackageEnvDialectS18` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE64 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. |
| Green | same command after `checkPackageEnvDialectS18` + `packageBodyImportsCompilePathMult` + S17 chain to S18 | **exit 0** (80 jobs) |

Contract: package-env dialect must reject an ill-typed MultSubsetEmit TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good MultSubsetEmit section uses the multi-line `multSubsetEmitReady`
shape so collapse is same-line or first next non-empty body line. Did not
rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (green, after dialect) | **0** (80 jobs) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater` (family) | **0** (80 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1447 files; 771 markdown, including this report).

`just systems-host`: **exit 0** (330 required paths). No new required path;
FixturesLater already existed from PE63.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 112 / TERM 58 unchanged.
MultSubsetEmit residual-free and complete claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 155 |
| HostModuleCheckPackageEnv.lean | 938 |
| HostModuleCheckPackageEnvEvidence.lean | 988 |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckMultSubsetEmitTerm.lean | 274 (cite only) |

## Evidence long-file

Evidence was **not** split. Final line count **988** (under 1000). Later-fold
helper `packageEnvDialectRejectsIllTyped` covers PE45..PE64 dialect rejects
in the same Evidence file.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathMult` requires
  `import SystemsLean.CompilePathMult`. No EmitMult farm. Package env has
  no emit-module section for MultSubsetEmit.
- Soft J5: `checkMultSubsetEmitTermDialect` at package scope via
  `checkPackageEnvDialectS18`.
- This is MultSubsetEmit, not KernelMult, not CompilePathMult TERM rewrite,
  not the earlier Mult TERM unit.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckMultSubsetEmitTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S18 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- MultSubsetEmit residual-free or complete claimed (stay false)
- Nix / just (no new file)
- Cold compose init unroll
- Seed-wide 206

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckMultSubsetEmitTerm
- Flipping MultSubsetEmit residual-free or complete claimed
- New harness module / scope-string rename
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
