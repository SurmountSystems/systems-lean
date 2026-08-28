# Report: Package-env for ProgramSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **116**. TERM dual-ok **62**.
Seed **206** unchanged.

Package-env fixture twins landed for ProgramSubsetRebuild now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE67
TypesSubsetRebuild. This unit is rebuild / self-apply, not emit. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE68 | ProgramSubsetRebuild residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS22Text` = S21 good ++ ProgramSubsetRebuild |
| Multi-line | E-good ProgramSubsetRebuild body uses `hostModuleCheckGoodProgramSubsetRebuildReadyMultilineText` (already on the TERM companion) |
| Soft J2 | ProgramSubsetRebuild import CompilePathProgram only (`packageBodyImportsCompilePathProgram`; no emit-module farm) |
| Soft J5 | unit `checkProgramSubsetRebuildTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS22` after S21 TypesSubsetRebuild succeeds |
| Dialect body | living `programSubsetRebuildSelfApplyOk` + wrote-expected, not `emitProgramReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **116** unchanged (no new TERM companion) |
| TERM dual-ok | **62** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (432)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (990)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (791)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (291)

FixturesS5 stayed **990** (S22 not appended). All under Sub-1-KLOC.
Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE68 in the later companion. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
Did not rewrite the ProgramSubsetRebuild TERM companion (import / cite only;
TERM file still 305). The living multiline ready helper already existed
there; package env cites it.

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0 (335 required paths). Did not flip FullHost
to do it.

Soft J2 does not add an emit-module section. PE-specific good/bad bodies
import CompilePathProgram only. Package env has no emit-module section for
this unit. Did not invent EmitRebuild.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckProgramSubsetRebuildTermSurfaceOk`.
S21 tail chains to S22. `hostModuleCheckPackageEnvDialectOk` checks S22 good text.

Harness inventory string in `HostResidualShrink` was left at the living 116-name
list. This slice is not a new TERM companion. Adding later-evidence tokens to
that string without raising the count would make the count lie. Raising the
count would violate Done when (harness stays 116). Presence of PE68 tokens is
in `host-specs-compile-path-4.nix` on the existing EvidenceLater and
FixturesLater files.

This unit is rebuild / self-apply, not emit. Did not copy `emitProgramReady`.
Did not invent EmitRebuild. Did not flip FullHost. Did not grow Evidence with
PE68 case defs.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE68 fold + ProgramSubsetRebuild in packageEnvTermSurfaceOk + dialectOk on S22 good, before `checkPackageEnvDialectS22` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE68 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. |
| Green | same command after `checkPackageEnvDialectS22` + `packageBodyImportsCompilePathProgram` + S21 chain to S22 | **exit 0** (85 jobs) |

Contract: package-env dialect must reject an ill-typed ProgramSubsetRebuild TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good ProgramSubsetRebuild section uses the multi-line `programSubsetRebuildReady`
shape so collapse is same-line or first next non-empty body line. Ready chain
includes `!programSubsetRebuildWithoutLakeFinishedClaimed` (Program/Types/Linear
shape). Dialect checks living self-apply + wrote-expected, not emitProgramReady.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (green, after S22 dialect) | **0** (85 jobs) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (85 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1492 files; 811 markdown, including this report).

`just systems-host`: **exit 0** (335 required paths). No new required file;
PE68 tokens added to the existing EvidenceLater and FixturesLater
compile-path-4 specs.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 116 / TERM 62 unchanged.
ProgramSubsetRebuild residual-free and complete claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 432 |
| HostModuleCheckPackageEnv.lean | 990 |
| HostModuleCheckPackageEnvEvidence.lean | 791 |
| HostModuleCheckPackageEnvEvidenceLater.lean | 291 |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckAccepts.lean | 990 (untouched) |
| HostModuleCheckProgramSubsetRebuildTerm.lean | 305 (cite only) |

## Evidence long-file

Evidence stays PE1..PE44 plus combined Ok folds and theorems (791; two fold
lines for PE68 only). Later-fold covers PE45..PE68 in
`HostModuleCheckPackageEnvEvidenceLater.lean` (291). Did not add PE68 case
defs to Evidence.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathProgram` requires
  `import SystemsLean.CompilePathProgram`. No EmitProgram farm. No EmitRebuild farm.
  Package env has no emit-module section for ProgramSubsetRebuild.
- Soft J5: `checkProgramSubsetRebuildTermDialect` at package scope via
  `checkPackageEnvDialectS22`.
- This is ProgramSubsetRebuild, not ProgramSubsetEmit, not KernelProgram, not
  CompilePathProgram TERM rewrite.
- Dialect is living `programSubsetRebuildSelfApplyOk` + wrote-expected, not
  `emitProgramReady`.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckProgramSubsetRebuildTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S22 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- ProgramSubsetRebuild residual-free or complete claimed (stay false)
- just recipes (no just essay)
- HostResidualShrink harness inventory (stays 116)
- Cold compose init unroll
- Seed-wide 206
- GraphSubsetRebuild TERM

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckProgramSubsetRebuildTerm
- Re-queue PE67 / TypesSubsetRebuild TERM
- Flipping ProgramSubsetRebuild residual-free or complete claimed
- New harness module / scope-string rename
- Invented EmitRebuild farm
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
- Growing Evidence case defs (used EvidenceLater)
- Growing FixturesS5
