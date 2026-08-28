# Report: Package-env for ComposeSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **118**. TERM dual-ok **64**.
Seed **206** unchanged.

Package-env fixture twins landed for ComposeSubsetRebuild now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE69
GraphSubsetRebuild. This unit is rebuild / self-apply, not emit. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE70 | ComposeSubsetRebuild residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS24Text` = S23 good ++ ComposeSubsetRebuild |
| Multi-line | E-good ComposeSubsetRebuild body uses `hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText` (already on the TERM companion) |
| Soft J2 | ComposeSubsetRebuild import CompilePathCompose only (`packageBodyImportsCompilePathCompose`; no emit-module farm) |
| Soft J5 | unit `checkComposeSubsetRebuildTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS24` after S23 GraphSubsetRebuild succeeds |
| Dialect body | living `composeSubsetRebuildSelfApplyOk` + wrote-expected, not `emitComposeReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **118** unchanged (no new TERM companion) |
| TERM dual-ok | **64** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (571)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (954)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (795)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (386)

FixturesS5 stayed **990** (S24 not appended). All under Sub-1-KLOC.
PackageEnv was **940** before this PE. Adding S24 dialect stayed under 1000
(954). No long-file split required this slice. Greppable cite
`packageEnvTermSurfaceOk` stays in PackageEnv so the presence scan of that
file stays honest.

Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE70 in the later companion. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
Did not rewrite the ComposeSubsetRebuild TERM companion (import / cite only;
TERM file still 307). The living multiline ready helper already existed
there; package env cites it. Ready chain includes
`!composeSubsetRebuildWithoutLakeFinishedClaimed`.

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0 (337 required paths). Did not flip FullHost
to do it.

Soft J2 does not add an emit-module section. PE-specific good/bad bodies
import CompilePathCompose only. Package env has no emit-module section for
this unit. Did not invent EmitRebuild.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckComposeSubsetRebuildTermSurfaceOk`.
S23 tail chains to S24. `hostModuleCheckPackageEnvDialectOk` checks S24 good text.

Harness inventory string in `HostResidualShrink` was left at the living 118-name
list. This slice is not a new TERM companion. Adding later-evidence tokens to
that string without raising the count would make the count lie. Raising the
count would violate Done when (harness stays 118). Presence of PE70 tokens is
in `host-specs-compile-path-4.nix` on the existing EvidenceLater and
FixturesLater files.

This unit is rebuild / self-apply, not emit. Did not copy `emitComposeReady`.
Did not invent EmitRebuild. Did not flip FullHost. Did not grow Evidence with
PE70 case defs.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE70 fold + ComposeSubsetRebuild in packageEnvTermSurfaceOk + dialectOk on S24 good, before `checkPackageEnvDialectS24` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE70 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. 87 jobs; Evidence was the failing target. |
| Green | same command after `checkPackageEnvDialectS24` + existing `packageBodyImportsCompilePathCompose` + S23 chain to S24 | **exit 0** (87 jobs) |

Contract: package-env dialect must reject an ill-typed ComposeSubsetRebuild TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good ComposeSubsetRebuild section uses the multi-line `composeSubsetRebuildReady`
shape so collapse is same-line or first next non-empty body line. Ready chain
includes `!composeSubsetRebuildWithoutLakeFinishedClaimed` (Compose/Graph/Program
shape). Dialect checks living self-apply + wrote-expected, not emitComposeReady.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** (87 jobs; native_decide false) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (green, after S24 dialect) | **0** (87 jobs) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (87 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1513 files; 830 markdown, including this report).

`just systems-host`: **exit 0** (337 required paths). No new required file;
PE70 tokens added to the existing EvidenceLater and FixturesLater
compile-path-4 specs.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 118 / TERM 64 unchanged.
ComposeSubsetRebuild residual-free and complete claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 571 |
| HostModuleCheckPackageEnv.lean | 954 |
| HostModuleCheckPackageEnvEvidence.lean | 795 |
| HostModuleCheckPackageEnvEvidenceLater.lean | 386 |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckAccepts.lean | 992 (untouched) |
| HostModuleCheckComposeSubsetRebuildTerm.lean | 307 (cite only) |

## Evidence long-file

Evidence stays PE1..PE44 plus combined Ok folds and theorems (795; two fold
lines for PE70 only). Later-fold covers PE45..PE70 in
`HostModuleCheckPackageEnvEvidenceLater.lean` (386), including the living
`packageEnvTermSurfaceOk` fold. Did not add PE70 case defs to Evidence.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathCompose` requires
  `import SystemsLean.CompilePathCompose`. No EmitCompose farm. No EmitRebuild farm.
  Package env has no emit-module section for ComposeSubsetRebuild.
- Soft J5: `checkComposeSubsetRebuildTermDialect` at package scope via
  `checkPackageEnvDialectS24`.
- This is ComposeSubsetRebuild, not ComposeSubsetEmit, not KernelCompose, not
  CompilePathCompose TERM rewrite.
- Dialect is living `composeSubsetRebuildSelfApplyOk` + wrote-expected, not
  `emitComposeReady`.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckComposeSubsetRebuildTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S24 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- ComposeSubsetRebuild residual-free or complete claimed (stay false)
- just recipes (no just essay)
- HostResidualShrink harness inventory (stays 118)
- Cold compose init unroll
- Seed-wide 206
- ErasureSubsetRebuild TERM

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckComposeSubsetRebuildTerm
- Re-queue PE69 / GraphSubsetRebuild TERM
- Flipping ComposeSubsetRebuild residual-free or complete claimed
- New harness module / scope-string rename
- Invented EmitRebuild farm
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
- Growing Evidence case defs (used EvidenceLater)
- Growing FixturesS5
- Opening ErasureSubsetRebuild TERM

## Confirmation

Rebuild / self-apply. Dialect living self-apply + wrote-expected. Not
emitComposeReady. Ready includes `!composeSubsetRebuildWithoutLakeFinishedClaimed`.
