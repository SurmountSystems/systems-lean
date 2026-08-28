# Residual lockstep after PE76 and LLVM Linear TERM (2026-08-13)

Docs only. No product Lean or C. No claim-bool flips.

## Status

GREEN (docs). Highest-value next: **Package-import for LLVM Linear text**.

Prior lockstep w4d listed Package-import for Host fragment graph as next.
That PE is GREEN on disk. This lockstep closes it.

A later product writer landed Term-surface for LLVM Linear text while
this lockstep still listed that TERM as next. Same race class. This
lockstep closes the TERM and opens the package-import twin.

## Closed from disk

| Name | Evidence |
|------|----------|
| Package-import for Host fragment graph | `.agents/reports/impl-package-env-hostgraph-2026-08-13.md` GREEN. `checkPackageEnvDialectS30` exists. E-good `hostModuleCheckGoodPackageEnvS30Text` is S29 good plus HostGraph. Soft J2 `packageBodyImportsMult` (no `packageBodyImportsHostFront`). Soft J5 `checkHostGraphTermDialect`. Dialect living `hostGraphReady`. PackageEnv **972**. Evidence **807**. EvidenceLater **464**. FixturesLater **939**. FixturesS5 **990**. |
| Term-surface for LLVM Linear text | `.agents/reports/impl-llvm-linear-text-term-2026-08-13.md` GREEN. Companion `HostModuleCheckLlvmLinearTextTerm.lean` (**358**) exists. Dialect living `llvmLinearTextReady`. Soft class LLVM Mult text TERM, not HostFront. `checkLlvmLinearTextTermDialect`. Gate `hostModuleCheckLlvmLinearTextTermSurfaceOk`. RealModule `refineLlvmLinearTextWithTermSurface`. LoadOkLaterTerm folds SurfaceOk (**156**). Accepts **617**. AcceptsLater **426** cite only. Harness **125->126**. TERM dual-ok **70->71**. Leftover TERM **136->135**. Seed **206**. Both-lessons stay **70 of 206** until the package-import. Lake family green in that report. No S31 yet. |

Both-lessons **70 of 206**. Seed **206**. Harness **126**. TERM dual-ok **71**.
Leftover TERM **135**. Idle-hot Lake **0.459 s**. Slake cannot.

FullHostElaborateRemains **false** (`hostResidualShrinkFullHostElaborateRemains := false`).

Trash **done partial**: 6 batches, **120** files; about **55** remain. HAP /
U1-U7 / perf held. Batch 6 closeout
`.agents/reports/impl-review-trash-batch6-2026-08-13.md`.

## Opened

**Package-import for LLVM Linear text**: leftover seed
`SystemsLean.LlvmLinearText`. Clone LLVM Mult text PE (PE74 / S28), not
HostFront-class. Dialect `checkPackageEnvDialectS31` after S30. E-good
S31 = S30 ++ LlvmLinearText using living `llvmLinearTextReady`. Soft J2
`packageBodyImportsMult`. Soft J5 `checkLlvmLinearTextTermDialect`. Do
not invent a new LLVM Linear import helper. PackageEnv is **972**;
long-file split first if the new dialect would pass 1000. Harness stays
**126**. TERM stays **71**. Both-lessons **70 of 206 -> 71 of 206**.
Leftover TERM stays **135**. Do not claim GREEN unless
`checkPackageEnvDialectS31` exists. After this Name: Term-surface for
MultFsWriteTool. Skip HostFrontTheorems and HostGraphTheorems (proof).

Also still open: Review then trash remaining reports.

## Pins

free / complete / PROVABLY **true**. FullHostElaborateRemains **false**.
DominanceClaimed / band FullBackend **false**.

## Files

`RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`,
`doc/SESSION-HANDOFF.md`, `.agents/plans/plan-slake-replaces-lake.md`.
