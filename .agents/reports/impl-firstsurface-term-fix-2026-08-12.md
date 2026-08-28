# Report: Term-surface for FirstSurface review fix (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Three review issues closed. FirstSurface TERM stays **done**.
Next named meet-path stays **Package-env for FirstSurface**. LoadOk later-fold
companion is done hygiene, not a new Open Name.

## Issue 1 -- LoadOk later-fold companion

LoadOk was 998 lines. Extracted later TERM SurfaceOk folds (EmitPlan through
FirstSurface, including CompilePath unit aggregate and Parity smoke) into
`HostModuleCheckLoadOkLaterTerm.lean` (107). LoadOk now **914** (under ~950).

LoadOk folds `hostModuleCheckLaterTermSurfaceOk` plus the remaining Kernel
proof and package-elaborate gates. Surgical in-place. Did not rewrite LoadOk
from /tmp.

Harness **103 -> 104** (one new HostModuleCheck module). Seed 206 unchanged.
TERM dual-ok stays **50**.

Wired: SystemsLean.lean, HostModuleCheck.lean, HostResidualShrink +
Theorems, just/host.just, just/host-without-lake.just, host-leans.nix,
required-files.nix, host-specs-compile-path-3.nix.

## Issue 2 -- duplicate presence cite

`host-specs-compile-path-1.nix` FirstSurface TERM spec listed
`hostModuleCheckFirstSurfaceTermSurfaceOk` twice. Kept one cite.

## Issue 3 -- multi-line ready collapse (TDD)

Product `firstSurfaceReady` is multi-line. Added
`hostModuleCheckGoodFirstSurfaceReadyMultilineText` matching the on-disk
shape and folded `firstSurfaceReadyBodyOk` on it into SurfaceOk.

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckFirstSurfaceTerm` with `hostModuleCheckFirstSurfaceReadyMultilineOk := false` and theorem `= true` (also folded into SurfaceOk) | **exit 1** -- `native_decide` evaluated both `hostModuleCheckFirstSurfaceTermSurfaceOk = true` and `hostModuleCheckFirstSurfaceReadyMultilineOk = true` as false |
| Green | same theorems after `hostModuleCheckFirstSurfaceReadyMultilineOk := firstSurfaceReadyBodyOk hostModuleCheckGoodFirstSurfaceReadyMultilineText` | **exit 0** |

Did not rewrite the red theorems.

## Lake commands (fix round)

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckFirstSurfaceTerm` (red, multilineOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckFirstSurfaceTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostModuleCheck SystemsLean.HostResidualShrinkTermOk` (green after smoke import) | **0** (92 jobs) |

## Hygiene

`just hygiene` after product + residual + this report: **exit 0**
(1356 files; ASCII except allowlist; professional-tone OK, 689 markdown).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false`.
No DominanceClaimed / band FullBackend / free / complete / PROVABLY flips.
No package-env twins. No FullHost flip.

## Residual lockstep

FirstSurface TERM stays **done**. Next remains **Package-env for FirstSurface**.
LoadOk later-fold documented as done hygiene. Living harness **104**.

## Out of scope honored

Package-env twins; FullHost flip; seed-wide 206; product C; product Rust
under src/; git add/commit.
