# Report: Package-env for ExtractSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **120**. TERM dual-ok **66**.
Seed **206** unchanged.

Package-env fixture twins landed for ExtractSubsetRebuild now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE71
ErasureSubsetRebuild. This unit is rebuild / self-apply, not emit. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE72 | ExtractSubsetRebuild residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS26Text` = S25 good ++ ExtractSubsetRebuild |
| Multi-line | E-good ExtractSubsetRebuild body uses `hostModuleCheckGoodExtractSubsetRebuildReadyMultilineText` (already on the TERM companion) |
| Soft J2 | ExtractSubsetRebuild import CompilePathExtract only (`packageBodyImportsCompilePathExtract`; no emit-module farm) |
| Soft J5 | unit `checkExtractSubsetRebuildTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS26` after S25 ErasureSubsetRebuild succeeds |
| Dialect body | living `extractSubsetRebuildSelfApplyOk` + wrote-expected, not `emitExtractReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **120** unchanged (no new TERM companion) |
| TERM dual-ok | **66** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (710)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (980)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (799)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (412)

FixturesS5 stayed **990** (S26 not appended). All under Sub-1-KLOC.
PackageEnv was **967** before this PE. Adding S26 dialect stayed under 1000
(980). No long-file split required this slice. Greppable cite
`packageEnvTermSurfaceOk` stays in PackageEnv so the presence scan of that
file stays honest. Living fold remains on EvidenceLater after the PE69 split.

Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE72 in the later companion. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
Did not rewrite the ExtractSubsetRebuild TERM companion (import / cite only;
TERM file still 309). The living multiline ready helper already existed
there; package env cites it. Ready chain includes
`!extractSubsetRebuildWithoutLakeFinishedClaimed`.

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0 (339 required paths). Did not flip FullHost
to do it.

Soft J2 does not add an emit-module section. PE-specific good/bad bodies
import CompilePathExtract only. Package env has no emit-module section for
this unit. Did not invent EmitRebuild.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckExtractSubsetRebuildTermSurfaceOk`.
S25 tail chains to S26. `hostModuleCheckPackageEnvDialectOk` checks S26 good text.

Harness inventory string in `HostResidualShrink` was left at the living 120-name
list. This slice is not a new TERM companion. Adding later-evidence tokens to
that string without raising the count would make the count lie. Raising the
count would violate Done when (harness stays 120). Presence of PE72 tokens is
in `host-specs-compile-path-4.nix` on the existing EvidenceLater and
FixturesLater files.

This unit is rebuild / self-apply, not emit. Did not copy `emitExtractReady`.
Did not invent EmitRebuild. Did not flip FullHost. Did not grow Evidence with
PE72 case defs.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE72 fold + ExtractSubsetRebuild in packageEnvTermSurfaceOk + dialectOk on S26 good, before `checkPackageEnvDialectS26` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE72 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. 89 jobs; Evidence was the failing target. |
| Green | same command after `checkPackageEnvDialectS26` + existing `packageBodyImportsCompilePathExtract` + S25 chain to S26 | **exit 0** (89 jobs) |

Contract: package-env dialect must reject an ill-typed ExtractSubsetRebuild TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good ExtractSubsetRebuild section uses the multi-line `extractSubsetRebuildReady`
shape so collapse is same-line or first next non-empty body line. Ready chain
includes `!extractSubsetRebuildWithoutLakeFinishedClaimed` (Compose/Graph/Program
shape). Dialect checks living self-apply + wrote-expected, not emitExtractReady.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** (89 jobs; native_decide false) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (green, after S26 dialect) | **0** (89 jobs) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (89 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1537 files; 852 markdown, including this report).

`just systems-host`: **exit 0** (339 required paths). No new required file;
PE72 tokens added to the existing EvidenceLater and FixturesLater
compile-path-4 specs.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 120 / TERM 66 unchanged.
ExtractSubsetRebuild residual-free, complete, and without-Lake finished
claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 710 |
| HostModuleCheckPackageEnv.lean | 980 |
| HostModuleCheckPackageEnvEvidence.lean | 799 |
| HostModuleCheckPackageEnvEvidenceLater.lean | 412 |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckAccepts.lean | 994 (untouched cite) |
| HostModuleCheckExtractSubsetRebuildTerm.lean | 309 (cite only) |

## Evidence long-file

Evidence stays PE1..PE44 plus combined Ok folds and theorems (799; two fold
lines for PE72 only). Later-fold covers PE45..PE72 in
`HostModuleCheckPackageEnvEvidenceLater.lean` (412), including the living
`packageEnvTermSurfaceOk` fold. Did not add PE72 case defs to Evidence.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathExtract` requires
  `import SystemsLean.CompilePathExtract`. No EmitExtract farm. No EmitRebuild farm.
  Package env has no emit-module section for ExtractSubsetRebuild.
- Soft J5: `checkExtractSubsetRebuildTermDialect` at package scope via
  `checkPackageEnvDialectS26`.
- This is ExtractSubsetRebuild, not ExtractSubsetEmit, not KernelExtract, not
  CompilePathExtract TERM rewrite.
- Dialect is living `extractSubsetRebuildSelfApplyOk` + wrote-expected, not
  `emitExtractReady`.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckExtractSubsetRebuildTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S26 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- ExtractSubsetRebuild residual-free, complete, or without-Lake finished claimed (stay false)
- just recipes (no just essay)
- HostResidualShrink harness inventory (stays 120)
- Cold compose init unroll
- Seed-wide 206
- HostFront TERM

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckExtractSubsetRebuildTerm
- Re-queue PE71 / ErasureSubsetRebuild TERM
- Re-queue PE70 / ComposeSubsetRebuild TERM
- Flipping ExtractSubsetRebuild residual-free or complete claimed
- New harness module / scope-string rename
- Invented EmitRebuild farm
- Cloning ExtractSubsetEmit PE
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
- Growing Evidence case defs (used EvidenceLater)
- Growing FixturesS5
- Opening HostFront TERM

## Confirmation

Rebuild / self-apply. Dialect living self-apply + wrote-expected. Not
emitExtractReady. Ready includes `!extractSubsetRebuildWithoutLakeFinishedClaimed`.
