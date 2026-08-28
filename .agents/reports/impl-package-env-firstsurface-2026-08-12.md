# Report: Package-env for FirstSurface (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **104** (no new module). TERM dual-ok **50**.

Package-env fixture twins landed for FirstSurface now that the unit has TERM
dual-ok. Same accept / residual-free reject shape as PE53..PE55. H2 still
partial versus seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| PE56 | FirstSurface residual-free claimed true; dialect ILL-TYPED-TERM; L0 still accepts |
| E-good | `hostModuleCheckGoodPackageEnvS10Text` = S9 good ++ FirstSurface |
| Soft J2 | FirstSurface import CompilePathMult (already in env) |
| Soft J5 | unit `checkFirstSurfaceTermDialect` at package scope |
| Dialect | `checkPackageEnvDialectS10` after S9 Body succeeds |
| Multi-line | E-good FirstSurface body uses `hostModuleCheckGoodFirstSurfaceReadyMultilineText` |
| Scope string | Unchanged `...SurfaceMatrixEnv-only` (just / Nix dual-pin lock) |
| Harness | **104** unchanged (no new module) |
| TERM dual-ok | **50** unchanged |

Primary Lean paths:

- `src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean` (607)
- `src/systems/SystemsLean/HostModuleCheckPackageEnv.lean` (805)
- `src/systems/SystemsLean/HostModuleCheckPackageEnvEvidence.lean` (921)

All under Sub-1-KLOC. No new harness module. Did not rewrite the FirstSurface
TERM companion (import only).

Honesty nit closed: `HostModuleCheckPackageEnv.lean` cites
`hostModuleCheckGoodPackageEnvS5Text` so the presence scan of that file is
honest. `just systems-host` exit 0. Did not flip FullHost to do it.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` after PE56 fold, before S10 dialect | **exit 1** -- Tactic `native_decide` evaluated `packageEnvDialectRejectsOk = true` is false (PE56 not yet rejected) |
| Green | same command after `checkPackageEnvDialectS10` + dialectOk on S10 good | **exit 0** |

Contract: package-env dialect must reject an ill-typed FirstSurface TERM body
(residual-free claimed true) while L0 package tokens still accept. The E-good
FirstSurface section uses the multi-line `firstSurfaceReady` shape so collapse
is same-line or first next non-empty body line. Did not rewrite the red fold.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence` (red, before dialect) | **1** |
| `lake build SystemsLean.HostModuleCheckPackageEnvEvidence SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostModuleCheckPackageEnvFixturesS5` (green) | **0** |

## Hygiene

`just hygiene` after product Lean first failed on a pre-existing sibling
report (`.agents/reports/review-general-firstsurface-term-2026-08-12.md`)
that used a banned module-split slang token. That wording was rewritten to
"module split". Re-run: **exit 0** (1357 files; 690 markdown).

`just systems-host`: **exit 0**.

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged
(`src/systems/SystemsLean/HostResidualShrink.lean`).
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Residual lockstep

- This Name **done** (implementer).
- Full host package elaborate meet stays **done partial**.
- WATCHER / residual / handoff lockstep is **parent after review**.
  This report does not change the next-action fence.

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Rewrite of HostModuleCheckFirstSurfaceTerm
- New harness module / scope-string rename
- Cold compose init unroll
- Invented C fail-closed residual
