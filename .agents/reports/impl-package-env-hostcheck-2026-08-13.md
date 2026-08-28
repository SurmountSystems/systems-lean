# Report: Package-env for Host fragment check (2026-08-13)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. No new TERM companion. Seed unchanged.

Package-env fixture twins landed for Host fragment check (`SystemsLean.HostCheck`)
now that the unit has TERM dual-ok. Same accept / residual-free reject shape as
PE73 HostFront. This unit is a Mult-first host fragment checker, same class as
HostFront, not LLVM Mult text, not emit, and not rebuild / self-apply. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE75 | HostCheck residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS29Text` = S28 good ++ HostCheck |
| Multi-line | E-good body uses `hostModuleCheckGoodHostCheckReadyMultilineText` (already on the TERM companion) |
| Soft J2 | Mult-only (`packageBodyImportsMult`; no CompilePathHostCheck; no packageBodyImportsHostFront) |
| Soft J5 | unit `checkHostCheckTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS29` after S28 LLVM Mult text succeeds |
| Dialect body | living `hostFragmentCheckReady` (corpus + ids + HostFront reuse + Lake + residual remains + peer-green + living false claims), not `hostFrontReady`, not `llvmMultTextReady`, not `hostCheckReady` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesLater.lean` (939)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (882)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (805)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean` (451)

FixturesS5 stayed **990** (S29 not appended). Accepts and HostCheck TERM
untouched (cite / import only). All under Sub-1-KLOC. PackageEnv was **868**
before this PE. Adding S29 dialect stayed under 980 (882). No long-file split
required this slice.

Evidence later-fold helper `packageEnvDialectRejectsIllTyped` now covers
PE45..PE75 in the later companion. Combined theorem
`packageEnvDialectRejectsOk_true` still `= true := by native_decide`.
Did not rewrite the HostCheck TERM companion. The living multiline ready
helper already existed there; package env cites it.

`packageEnvTermSurfaceOk` now includes `hostModuleCheckHostCheckTermSurfaceOk`.
S28 tail chains to S29 (S28 must succeed first).
`hostModuleCheckPackageEnvDialectOk` checks S29 good text.

This unit is a Mult-first host fragment checker, not LLVM Mult text, not
rebuild / self-apply, and not emit. Did not invent `hostCheckReady`. Did not
invent `packageBodyImportsHostFront`. Did not flip FullHost. Did not grow
Evidence with PE75 case defs (two fold lines only).

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE75 fold + HostCheck in packageEnvTermSurfaceOk + dialectOk on S29 good, before `checkPackageEnvDialectS29` | **exit 1**. Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE75 not yet rejected). Theorem `packageEnvDialectRejectsOk_true`. 93 jobs; Evidence was the failing target. |
| Green | same command after `checkPackageEnvDialectS29` + existing `packageBodyImportsMult` + S28 chain to S29 | **exit 0** (93 jobs) |

Contract: package-env dialect must reject an ill-typed HostCheck TERM body
(residual-free claimed true) while L0 package tokens still accept. The
E-good HostCheck section uses the multi-line `hostFragmentCheckReady` shape so
collapse is same-line or first next non-empty body line. Did not rewrite
the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** (93 jobs; native_decide false) |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesLater SystemsLean.HostModuleCheckPackageEnvEvidenceLater` (green family) | **0** (93 jobs) |

## Hygiene

`just hygiene`: **exit 0** (1481 files; 785 markdown, including this report).

Did not edit `nix/` (not in this slice's allowed paths). Existing presence
specs still require S28 tokens; S29 tokens live in Lean.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits. HostCheck residual-free, complete, proof, llvm,
and PROVABLY claimed stay **false**.

## Line counts after land

| File | Lines |
|------|------:|
| HostModuleCheckPackageEnvFixturesS5.lean | 990 (untouched) |
| HostModuleCheckPackageEnvFixturesLater.lean | 939 |
| HostModuleCheckPackageEnv.lean | 882 |
| HostModuleCheckPackageEnvEvidence.lean | 805 (two PE75 fold lines) |
| HostModuleCheckPackageEnvEvidenceLater.lean | 451 |
| HostModuleCheckPackageEnvImports.lean | 174 (untouched) |
| HostModuleCheckHostCheckTerm.lean | 339 (cite only) |

## Evidence long-file

Evidence stays PE1..PE44 plus combined Ok folds and theorems (805; two fold
lines for PE75 only). Later-fold covers PE45..PE75 in
`HostModuleCheckPackageEnvEvidenceLater.lean` (451), including the living
`packageEnvTermSurfaceOk` fold. Did not add PE75 case defs to Evidence.

## Soft J2 / Soft J5 honesty

- Soft J2: living helper `packageBodyImportsMult` requires
  `import SystemsLean.Mult`. No CompilePathHostCheck. No HostFront import
  helper. No emit-module farm. Living HostCheck imports HostFront; that
  module is already a package-env section from PE73.
- Soft J5: `checkHostCheckTermDialect` at package scope via
  `checkPackageEnvDialectS29`.
- This is Host fragment check, not LLVM Mult text, not emit, not rebuild.
- Dialect is living `hostFragmentCheckReady`, not `hostFrontReady`, not
  `llvmMultTextReady`, not `hostCheckReady`.

## Residual lockstep

- This implementer did not edit residual / WATCHER / handoff.
- FullHost stays false.

## What this implementer did not touch

- `HostModuleCheckHostCheckTerm.lean` (cite / import only)
- `HostModuleCheckPackageEnvFixturesS5.lean` (990; S29 went to FixturesLater)
- `HostModuleCheckAccepts.lean`
- Product C; product Rust
- FullHost / free / complete / PROVABLY / DominanceClaimed / band FullBackend
- HostCheck residual-free, complete, proof, llvm, or PROVABLY claimed
- just recipes
- HostResidualShrink harness inventory
- residual / WATCHER / handoff
- RuntimeBench
- nix presence specs

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckHostCheckTerm
- Invented hostCheckReady
- Invented packageBodyImportsHostFront
- Cloning LLVM Mult text dialect body as the HostCheck body
- Growing Evidence case defs (used EvidenceLater)
- Growing FixturesS5
- Growing Accepts

## Confirmation

Host fragment check. Dialect living `hostFragmentCheckReady`.
Not hostFrontReady. Not llvmMultTextReady. Not hostCheckReady.
Soft J2 is existing `packageBodyImportsMult`.
TERM-SURFACE dual-ok is not package L4 or full elaborator parity.
FullHost stays false.
