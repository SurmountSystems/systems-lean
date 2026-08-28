# Report: Package-env for LinearSubsetRebuild (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **114**. TERM dual-ok **60**.
Seed **206** unchanged.

Package-env fixture twins landed for LinearSubsetRebuild now that the unit has
TERM dual-ok. Same accept / residual-free reject shape as PE65
MultSubsetRebuild. This unit is rebuild / self-apply, not emit. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE66 | LinearSubsetRebuild residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS20Text` = S19 good ++ LinearSubsetRebuild |
| Multi-line | E-good LinearSubsetRebuild body uses `hostModuleCheckGoodLinearSubsetRebuildReadyMultilineText` (already on the TERM companion) |
| Soft J2 | LinearSubsetRebuild import CompilePathLinear only (`packageBodyImportsCompilePathLinear`; no emit-module farm) |
| Soft J5 | unit `checkLinearSubsetRebuildTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS20` after S19 MultSubsetRebuild succeeds |
| Dialect body | living `linearSubsetRebuildSelfApplyOk` + wrote-expected, not `emitLinearReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **114** unchanged (no new TERM companion) |
| TERM dual-ok | **60** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (294)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (964)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (787)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (267)

FixturesS5 stayed **990** (S20 not appended). All under Sub-1-KLOC.
Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE66 in the later companion. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
Did not rewrite the LinearSubsetRebuild TERM companion (import / cite only;
TERM file still 303). The living multiline ready helper already existed
there; package env cites it.

Honesty cite stays: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0 (333 required paths). Did not flip FullHost
to do it.

Soft J2 does not add an emit-module section. PE-specific good/bad bodies
import CompilePathLinear only. Package env has no emit-module section for
this unit. Did not invent EmitRebuild.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckLinearSubsetRebuildTermSurfaceOk`.
S19 tail chains to S20. `hostModuleCheckPackageEnvDialectOk` checks S20 good text.

Harness inventory string in `HostResidualShrink` was left at the living 114-name
list. This slice is not a new TERM companion. Adding later-evidence tokens to
that string without raising the count would make the count lie. Raising the
count would violate Done when (harness stays 114). Presence of PE66 tokens is
in `host-specs-compile-path-4.nix` on the existing EvidenceLater file.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE66 fold + LinearSubsetRebuild in packageEnvTermSurfaceOk + dialectOk on S20 good, before `checkPackageEnvDialectS20` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE66 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. |
| Green | same command after `checkPackageEnvDialectS20` + `packageBodyImportsCompilePathLinear` + S19 chain to S20 | **exit 0** (83 jobs) |

Contract: package-env dialect must reject an ill-typed LinearSubsetRebuild TERM
body (residual-free claimed true) while L0 package tokens still accept. The
E-good LinearSubsetRebuild section uses the multi-line `linearSubsetRebuildReady`
shape so collapse is same-line or first next non-empty body line. Ready chain
includes `!linearSubsetRebuildWithoutLakeFinishedClaimed` (Linear shape).
Dialect checks living self-apply + wrote-expected, not emitLinearReady. Did
not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5 SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (83 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1470 files; 791 markdown, including this report).

`just systems-host`: **exit 0** (333 required paths). No new required file;
PE66 tokens added to the existing EvidenceLater compile-path-4 spec.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. Seed 206 / harness 114 / TERM 60 unchanged.
LinearSubsetRebuild residual-free and complete claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 |
| HostModuleCheckPackageEnvFixturesLater.lean | 294 |
| HostModuleCheckPackageEnv.lean | 964 |
| HostModuleCheckPackageEnvEvidence.lean | 787 |
| HostModuleCheckPackageEnvEvidenceLater.lean | 267 |
| HostModuleCheckLoadOk.lean | 914 (untouched) |
| HostModuleCheckAccepts.lean | 988 (untouched) |
| HostModuleCheckLinearSubsetRebuildTerm.lean | 303 (cite only) |

## Evidence long-file

Evidence stays PE1..PE44 plus combined Ok folds and theorems (787; two fold
lines for PE66 only). Later-fold covers PE45..PE66 in
`HostModuleCheckPackageEnvEvidenceLater.lean` (267). Did not add PE66 case
defs to Evidence.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsCompilePathLinear` requires
  `import SystemsLean.CompilePathLinear`. No EmitLinear farm. No EmitRebuild farm.
  Package env has no emit-module section for LinearSubsetRebuild.
- Soft J5: `checkLinearSubsetRebuildTermDialect` at package scope via
  `checkPackageEnvDialectS20`.
- This is LinearSubsetRebuild, not LinearSubsetEmit, not KernelLinear, not
  CompilePathLinear TERM rewrite.
- Dialect is living `linearSubsetRebuildSelfApplyOk` + wrote-expected, not
  `emitLinearReady`.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## What this implementer did not touch

- `HostModuleCheckLinearSubsetRebuildTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S20 went to FixturesLater)
- Residual / WATCHER / SESSION-HANDOFF
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- LinearSubsetRebuild residual-free or complete claimed (stay false)
- just recipes (no just essay)
- HostResidualShrink harness inventory (stays 114)
- Cold compose init unroll
- Seed-wide 206
- TypesSubsetRebuild TERM

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckLinearSubsetRebuildTerm
- Re-queue PE65
- Flipping LinearSubsetRebuild residual-free or complete claimed
- New harness module / scope-string rename
- Invented EmitRebuild farm
- Cold compose init unroll
- Invented C fail-closed residual
- Updating WATCHER / residual / SESSION-HANDOFF
- Growing Evidence case defs (used EvidenceLater)
- Growing FixturesS5
