# Report: Package-env for GraphSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **117**. TERM dual-ok **63**.
Seed **206** unchanged.

Package-env fixture twins landed for GraphSubsetRebuild now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE68
ProgramSubsetRebuild. This unit is rebuild / self-apply, not emit. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE69 | GraphSubsetRebuild residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS23Text` = S22 good ++ GraphSubsetRebuild |
| Multi-line | E-good GraphSubsetRebuild body uses `hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText` (already on the TERM companion) |
| Soft J2 | GraphSubsetRebuild import CompilePathGraph only (`packageBodyImportsCompilePathGraph`; no emit-module farm) |
| Soft J5 | unit `checkGraphSubsetRebuildTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS23` after S22 ProgramSubsetRebuild succeeds |
| Dialect body | living `graphSubsetRebuildSelfApplyOk` + wrote-expected, not `emitGraphReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **117** unchanged (no new TERM companion) |
| TERM dual-ok | **63** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (502)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (940)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (793)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (373)

FixturesS5 stayed **990** (S23 not appended). All under Sub-1-KLOC.
PackageEnv was **990** before this PE. The living TERM SurfaceOk fold moved to
EvidenceLater first (coherent long-file split) so adding S23 dialect would not
pass 1000. PackageEnv now **940**. Greppable cite `packageEnvTermSurfaceOk`
stays in PackageEnv so the presence scan of that file stays honest.

Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE69 in the later companion. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
Did not rewrite the GraphSubsetRebuild TERM companion (import / cite only;
TERM file still 306). The living multiline ready helper already existed
there; package env cites it. Ready chain includes
`!graphSubsetRebuildWithoutLakeFinishedClaimed`.

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0 (336 required paths). Did not flip FullHost
to do it.

Soft J2 does not add an emit-module section. PE-specific good/bad bodies
import CompilePathGraph only. Package env has no emit-module section for
this unit. Did not invent EmitRebuild.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckGraphSubsetRebuildTermSurfaceOk`.
S22 tail chains to S23. `hostModuleCheckPackageEnvDialectOk` checks S23 good text.

Harness inventory string in `HostResidualShrink` was left at the living 117-name
list. This slice is not a new TERM companion. Adding later-evidence tokens to
that string without raising the count would make the count lie. Raising the
count would violate Done when (harness stays 117). Presence of PE69 tokens is
in `host-specs-compile-path-4.nix` on the existing EvidenceLater and
FixturesLater files.

This unit is rebuild / self-apply, not emit. Did not copy `emitGraphReady`.
Did not invent EmitRebuild. Did not flip FullHost. Did not grow Evidence with
PE69 case defs.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE69 fold + GraphSubsetRebuild in packageEnvTermSurfaceOk + dialectOk on S23 good, before `checkPackageEnvDialectS23` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE69 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. 86 jobs; Evidence was the failing target. |
| Green | same command after `checkPackageEnvDialectS23` + existing `packageBodyImportsCompilePathGraph` + S22 chain to S23 | **exit 0** (86 jobs) |

Contract: package-env dialect must reject an ill-typed GraphSubsetRebuild TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good GraphSubsetRebuild section uses the multi-line `graphSubsetRebuildReady`
shape so collapse is same-line or first next non-empty body line. Ready chain
includes `!graphSubsetRebuildWithoutLakeFinishedClaimed` (Graph/Program/Types
shape). Dialect checks living self-apply + wrote-expected, not emitGraphReady.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** (86 jobs; native_decide false) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (green, after S23 dialect) | **0** (86 jobs) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (86 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1503 files; 821 markdown, including this report).

`just systems-host`: **exit 0** (336 required paths). No new required file;
PE69 tokens added to the existing EvidenceLater and FixturesLater
compile-path-4 specs.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 117 / TERM 63 unchanged.
GraphSubsetRebuild residual-free and complete claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 502 |
| HostModuleCheckPackageEnv.lean | 940 |
| HostModuleCheckPackageEnvEvidence.lean | 793 |
| HostModuleCheckPackageEnvEvidenceLater.lean | 373 |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckAccepts.lean | 991 (untouched) |
| HostModuleCheckGraphSubsetRebuildTerm.lean | 306 (cite only) |

## Evidence long-file

Evidence stays PE1..PE44 plus combined Ok folds and theorems (793; two fold
lines for PE69 only). Later-fold covers PE45..PE69 in
`HostModuleCheckPackageEnvEvidenceLater.lean` (373), including the living
`packageEnvTermSurfaceOk` fold split out of PackageEnv. Did not add PE69 case
defs to Evidence.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathGraph` requires
  `import SystemsLean.CompilePathGraph`. No EmitGraph farm. No EmitRebuild farm.
  Package env has no emit-module section for GraphSubsetRebuild.
- Soft J5: `checkGraphSubsetRebuildTermDialect` at package scope via
  `checkPackageEnvDialectS23`.
- This is GraphSubsetRebuild, not GraphSubsetEmit, not KernelGraph, not
  CompilePathGraph TERM rewrite.
- Dialect is living `graphSubsetRebuildSelfApplyOk` + wrote-expected, not
  `emitGraphReady`.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckGraphSubsetRebuildTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S23 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- GraphSubsetRebuild residual-free or complete claimed (stay false)
- just recipes (no just essay)
- HostResidualShrink harness inventory (stays 117)
- Cold compose init unroll
- Seed-wide 206
- ComposeSubsetRebuild TERM

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckGraphSubsetRebuildTerm
- Re-queue PE68 / ProgramSubsetRebuild TERM
- Flipping GraphSubsetRebuild residual-free or complete claimed
- New harness module / scope-string rename
- Invented EmitRebuild farm
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
- Growing Evidence case defs (used EvidenceLater)
- Growing FixturesS5
- Opening ComposeSubsetRebuild TERM
