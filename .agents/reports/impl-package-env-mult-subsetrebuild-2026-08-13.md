# Report: Package-env for MultSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **113**. TERM dual-ok **59**.
Seed **206** unchanged.

Package-env fixture twins landed for MultSubsetRebuild now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE64 MultSubsetEmit.
This unit is rebuild / self-apply, not emit. H2 still partial versus seed 206.
H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE65 | MultSubsetRebuild residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS19Text` = S18 good ++ MultSubsetRebuild |
| Multi-line | E-good MultSubsetRebuild body uses `hostModuleCheckGoodMultSubsetRebuildReadyMultilineText` |
| Soft J2 | MultSubsetRebuild import CompilePathMult only (`packageBodyImportsCompilePathMult`; no emit-module farm) |
| Soft J5 | unit `checkMultSubsetRebuildTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS19` after S18 MultSubsetEmit succeeds |
| Dialect body | living `multSubsetRebuildSelfApplyOk` + wrote-expected, not `emitMultReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **113** unchanged (no new TERM companion) |
| TERM dual-ok | **59** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (225)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (951)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (785)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (255, new)

FixturesS5 stayed **990** (S19 not appended). All under Sub-1-KLOC.
Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE65 in the new later companion. Did not rewrite the MultSubsetRebuild
TERM companion (import / cite only; TERM file still 303).

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0 (332 required paths). Did not flip FullHost
to do it.

Soft J2 does not add an emit-module section. The TERM companion skeleton
imports MultSubsetEmit, but package env already resolves CompilePathMult from
S8 / FirstSurface. PE-specific good/bad bodies import CompilePathMult only.
Package env has no emit-module section for this unit. Did not invent
EmitRebuild.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckMultSubsetRebuildTermSurfaceOk`.
S18 tail chains to S19. `hostModuleCheckPackageEnvDialectOk` checks S19 good text.

Harness inventory string in `HostResidualShrink` was left at the living 113-name
list. This slice is not a new TERM companion. Adding the later-evidence basename
to that string without raising the count would make the count lie. Raising the
count would violate Done when (harness stays 113). Presence of the new file is
in `host-leans.nix` / `required-files.nix` / compile-path-4 spec instead.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE65 fold + MultSubsetRebuild in packageEnvTermSurfaceOk + dialectOk on S19 good, before `checkPackageEnvDialectS19` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE65 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. |
| Green | same command after `checkPackageEnvDialectS19` + `packageBodyImportsCompilePathMult` + S18 chain to S19 | **exit 0** (82 jobs) |

Contract: package-env dialect must reject an ill-typed MultSubsetRebuild TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good MultSubsetRebuild section uses the multi-line `multSubsetRebuildReady`
shape so collapse is same-line or first next non-empty body line. Dialect
checks living self-apply + wrote-expected, not emitMultReady. Did not rewrite
the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (82 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1459 files; 781 markdown, including this report).

`just systems-host`: **exit 0** (332 required paths). One new required path
for the Evidence later companion.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 113 / TERM 59 unchanged.
MultSubsetRebuild residual-free and complete claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 225 |
| HostModuleCheckPackageEnv.lean | 951 |
| HostModuleCheckPackageEnvEvidence.lean | 785 |
| HostModuleCheckPackageEnvEvidenceLater.lean | 255 (new) |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckAccepts.lean | 987 (untouched) |
| HostModuleCheckMultSubsetRebuildTerm.lean | 303 (cite only) |

## Evidence long-file

Evidence **was split**. Adding PE65 to the old 988-line Evidence file in the
same later-fold style would have met or exceeded 1000. Later-fold helper
`packageEnvDialectRejectsIllTyped` plus PE45..PE65 dialect rejects and L0
accepts moved to `HostModuleCheckPackageEnvEvidenceLater.lean` (255).
Evidence keeps PE1..PE44 plus combined Ok folds and theorems (785). Later-fold
covers PE45..PE65.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathMult` requires
  `import SystemsLean.CompilePathMult`. No EmitMult farm. No EmitRebuild farm.
  Package env has no emit-module section for MultSubsetRebuild.
- Soft J5: `checkMultSubsetRebuildTermDialect` at package scope via
  `checkPackageEnvDialectS19`.
- This is MultSubsetRebuild, not MultSubsetEmit, not KernelMult, not
  CompilePathMult TERM rewrite.
- Dialect is living `multSubsetRebuildSelfApplyOk` + wrote-expected, not
  `emitMultReady`.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckMultSubsetRebuildTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S19 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- MultSubsetRebuild residual-free or complete claimed (stay false)
- just recipes (no just essay)
- HostResidualShrink harness inventory (stays 113)
- Cold compose init unroll
- Seed-wide 206

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckMultSubsetRebuildTerm
- Flipping MultSubsetRebuild residual-free or complete claimed
- New harness module / scope-string rename
- Invented EmitRebuild farm
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
