# Report: Package-env for SubsetPackageJoin (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. This PE does not add a TERM companion.
After this PE plus the already-landed SubsetPackageJoin TERM, both-lessons is
**74 of 206**. Next leftover this-package seed is LLVM Types text
(`llvmTypesTextReady`). Skip HostGraphTheorems (proof). Then MultFsDeepen.

Package-env fixture twins landed for the join of subset packages
(`SystemsLean.SubsetPackageJoin`: measured Mult..Compose subset-package
rebuild join plus without-Lake multi-unit join). Not HostFront-class. Not
MultFsWriteTool writer. Not LLVM IR text. Soft J2 stays
`packageBodyImportsMult`. H2 still partial versus seed 206. H5 unmet. Do
not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE80 | SubsetPackageJoin residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS34Text` = S33 good ++ SubsetPackageJoin |
| Multi-line | E-good body uses `hostModuleCheckGoodSubsetPackageJoinReadyMultilineText` (already on the TERM companion) |
| Soft J2 | Mult-only (`packageBodyImportsMult`; no CompilePathHostFront; no new join import helper) |
| Soft J5 | unit `checkSubsetPackageJoinTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS34` after S33 FrontMultPackage succeeds |
| Dialect body | living `subsetPackageJoinReady`, not `frontMultPackageReady`, not `hostFrontReady` |
| Chain | S32 -> S33 -> S34 |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesTail.lean` (422)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (964)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (815)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (516)

FixturesS5 stayed **990**. FixturesLater stayed **939**. Tail stayed under 800.
No fourth kitchen-sink. TERM companion cite / import only (331).

Evidence later-fold covers PE45..PE80. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
`packageEnvTermSurfaceOk` includes `hostModuleCheckSubsetPackageJoinTermSurfaceOk`.
`hostModuleCheckPackageEnvDialectOk` checks S34 good text.

Nix Tail presence now requires S34 / PE80 fixture tokens. No new companion file.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE80 fold + SubsetPackageJoin in packageEnvTermSurfaceOk + dialectOk on S34 good, before `checkPackageEnvDialectS34` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE80 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. 99 jobs; Evidence was the failing target. |
| Green | same command after `checkPackageEnvDialectS34` + existing `packageBodyImportsMult` + S33 chain to S34 | **exit 0** (99 jobs) |

Contract: package-env dialect must reject an ill-typed SubsetPackageJoin TERM
body (residual-free claimed true) while L0 package tokens still accept.
The E-good section uses the multi-line `subsetPackageJoinReady` shape.
Did not rewrite the red theorem.

## Lake / gates

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (green, after S34 dialect) | **0** |
| `lake build SystemsLean.HostModuleCheckPackageEnv` | **0** (97 jobs) |
| `just hygiene` | **0** |
| `just systems-host` | **0** (350 required paths) |

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesTail.lean | 422 |
| HostModuleCheckPackageEnvFixturesLater.lean | 939 (untouched) |
| HostModuleCheckPackageEnvFixturesS5.lean | 990 (untouched) |
| HostModuleCheckPackageEnv.lean | 964 |
| HostModuleCheckPackageEnvEvidence.lean | 815 (two PE80 fold lines) |
| HostModuleCheckPackageEnvEvidenceLater.lean | 516 |
| HostModuleCheckPackageEnvImports.lean | 174 (untouched) |
| HostModuleCheckSubsetPackageJoinTerm.lean | 331 (cite only) |

No long-file split. All stayed under 1000.

## Honesty

StillUsesLake / DependsOnLake remain. Not Lake gone. Seed walk is not a
Lean 4 elaborator. FullHostElaborateRemains stays false. No free /
complete / PROVABLY / Dominance / FullBackend flip.

This implementer did not edit residual / WATCHER / SESSION-HANDOFF.
Did not edit the TERM companion except import / cite from Tail and PackageEnv.

## Next leftover

LlvmTypesText (`SystemsLean.LlvmTypesText`, living `llvmTypesTextReady`).
Skip HostGraphTheorems (proof). Then MultFsDeepen.
