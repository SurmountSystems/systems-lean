# Report: Package-env for ErasureSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **119**. TERM dual-ok **65**.
Seed **206** unchanged.

Package-env fixture twins landed for ErasureSubsetRebuild now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE70
ComposeSubsetRebuild. This unit is rebuild / self-apply, not emit. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE71 | ErasureSubsetRebuild residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS25Text` = S24 good ++ ErasureSubsetRebuild |
| Multi-line | E-good ErasureSubsetRebuild body uses `hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText` (already on the TERM companion) |
| Soft J2 | ErasureSubsetRebuild import CompilePathErasure only (`packageBodyImportsCompilePathErasure`; no emit-module farm) |
| Soft J5 | unit `checkErasureSubsetRebuildTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS25` after S24 ComposeSubsetRebuild succeeds |
| Dialect body | living `erasureSubsetRebuildSelfApplyOk` + wrote-expected, not `emitErasureReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **119** unchanged (no new TERM companion) |
| TERM dual-ok | **65** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (641)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (967)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (797)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (399)

FixturesS5 stayed **990** (S25 not appended). All under Sub-1-KLOC.
PackageEnv was **954** before this PE. Adding S25 dialect stayed under 1000
(967). No long-file split required this slice. Greppable cite
`packageEnvTermSurfaceOk` stays in PackageEnv so the presence scan of that
file stays honest.

Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE71 in the later companion. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
Did not rewrite the ErasureSubsetRebuild TERM companion (import / cite only;
TERM file still 308). The living multiline ready helper already existed
there; package env cites it. Ready chain includes
`!erasureSubsetRebuildWithoutLakeFinishedClaimed`.

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0 (338 required paths). Did not flip FullHost
to do it.

Soft J2 does not add an emit-module section. PE-specific good/bad bodies
import CompilePathErasure only. Package env has no emit-module section for
this unit. Did not invent EmitRebuild.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckErasureSubsetRebuildTermSurfaceOk`.
S24 tail chains to S25. `hostModuleCheckPackageEnvDialectOk` checks S25 good text.

Harness inventory string in `HostResidualShrink` was left at the living 119-name
list. This slice is not a new TERM companion. Adding later-evidence tokens to
that string without raising the count would make the count lie. Raising the
count would violate Done when (harness stays 119). Presence of PE71 tokens is
in `host-specs-compile-path-4.nix` on the existing EvidenceLater and
FixturesLater files.

This unit is rebuild / self-apply, not emit. Did not copy `emitErasureReady`.
Did not invent EmitRebuild. Did not flip FullHost. Did not grow Evidence with
PE71 case defs.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE71 fold + ErasureSubsetRebuild in packageEnvTermSurfaceOk + dialectOk on S25 good, before `checkPackageEnvDialectS25` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE71 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. 88 jobs; Evidence was the failing target. |
| Green | same command after `checkPackageEnvDialectS25` + existing `packageBodyImportsCompilePathErasure` + S24 chain to S25 | **exit 0** (88 jobs) |

Contract: package-env dialect must reject an ill-typed ErasureSubsetRebuild TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good ErasureSubsetRebuild section uses the multi-line `erasureSubsetRebuildReady`
shape so collapse is same-line or first next non-empty body line. Ready chain
includes `!erasureSubsetRebuildWithoutLakeFinishedClaimed` (Compose/Graph/Program
shape). Dialect checks living self-apply + wrote-expected, not emitErasureReady.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** (88 jobs; native_decide false) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (green, after S25 dialect) | **0** (88 jobs) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (88 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1525 files; 841 markdown, including this report).

`just systems-host`: **exit 0** (338 required paths). No new required file;
PE71 tokens added to the existing EvidenceLater and FixturesLater
compile-path-4 specs.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 119 / TERM 65 unchanged.
ErasureSubsetRebuild residual-free and complete claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 641 |
| HostModuleCheckPackageEnv.lean | 967 |
| HostModuleCheckPackageEnvEvidence.lean | 797 |
| HostModuleCheckPackageEnvEvidenceLater.lean | 399 |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckAccepts.lean | 993 (untouched cite) |
| HostModuleCheckErasureSubsetRebuildTerm.lean | 308 (cite only) |

## Evidence long-file

Evidence stays PE1..PE44 plus combined Ok folds and theorems (797; two fold
lines for PE71 only). Later-fold covers PE45..PE71 in
`HostModuleCheckPackageEnvEvidenceLater.lean` (399), including the living
`packageEnvTermSurfaceOk` fold. Did not add PE71 case defs to Evidence.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathErasure` requires
  `import SystemsLean.CompilePathErasure`. No EmitErasure farm. No EmitRebuild farm.
  Package env has no emit-module section for ErasureSubsetRebuild.
- Soft J5: `checkErasureSubsetRebuildTermDialect` at package scope via
  `checkPackageEnvDialectS25`.
- This is ErasureSubsetRebuild, not ErasureSubsetEmit, not KernelErasure, not
  CompilePathErasure TERM rewrite.
- Dialect is living `erasureSubsetRebuildSelfApplyOk` + wrote-expected, not
  `emitErasureReady`.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckErasureSubsetRebuildTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S25 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- ErasureSubsetRebuild residual-free or complete claimed (stay false)
- just recipes (no just essay)
- HostResidualShrink harness inventory (stays 119)
- Cold compose init unroll
- Seed-wide 206
- ExtractSubsetRebuild TERM

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckErasureSubsetRebuildTerm
- Re-queue PE70 / ComposeSubsetRebuild TERM
- Re-queue PE69 / GraphSubsetRebuild TERM
- Flipping ErasureSubsetRebuild residual-free or complete claimed
- New harness module / scope-string rename
- Invented EmitRebuild farm
- Cloning ErasureSubsetEmit PE
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
- Growing Evidence case defs (used EvidenceLater)
- Growing FixturesS5
- Opening ExtractSubsetRebuild TERM

## Confirmation

Rebuild / self-apply. Dialect living self-apply + wrote-expected. Not
emitErasureReady. Ready includes `!erasureSubsetRebuildWithoutLakeFinishedClaimed`.
