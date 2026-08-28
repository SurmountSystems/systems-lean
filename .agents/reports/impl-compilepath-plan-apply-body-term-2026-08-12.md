# Report: Term-surface for CompilePath Plan Apply Body (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **99 -> 102**. TERM dual-ok **46 -> 49**.

Unit TERM accept + reject twins landed for the three CompilePath peels that S8
left at L0 (Plan, Apply, Body). Same E-good + ILL-TYPED-TERM residual / emit /
ready / complete twins as CompilePathMult. L0 still accepts the bad texts.
Package-env twins for these three are the next Name, not this slice.
H2 still partial vs seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Plan TERM | `HostModuleCheckCompilePathPlanTerm` (217). Dialect on emit/residual/complete/ready bodies. Ready chain includes `planFixturePlanOk`. |
| Apply TERM | `HostModuleCheckCompilePathApplyTerm` (217). Same four twins. Ready chain includes `applyFixtureApplyOk`. |
| Body TERM | `HostModuleCheckCompilePathBodyTerm` (217). Same four twins. Ready chain includes `bodyFixtureBodyOk`. |
| E-good | `hostModuleCheckGoodCompilePath*TermText` accepts; emit body is `EmitPlan.emitPlanReady` / `EmitApply.emitApplyReady` / `EmitBody.emitBodyReady`. |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckCompilePathUnitsTermSurfaceOk` now folds Plan/Apply/Body SurfaceOk. |
| RealModule | `refineCompilePathPlan/Apply/BodyWithTermSurface` instead of bare L0 check. |
| Accepts | Good Plan/Apply/Body texts are Term texts, not L0 FixtureTextsProduct stubs. |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope for the three. |
| Harness | **99 -> 102** (`seed=206+Main=59+harness=102`). Three new HostModuleCheck modules. Seed 206 unchanged. |
| TERM dual-ok | **46 -> 49**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckCompilePathPlanTerm` with `hostModuleCheckCompilePathPlanTermSurfaceOk := false` and theorem `= true` | **exit 1** -- Tactic `native_decide` evaluated `hostModuleCheckCompilePathPlanTermSurfaceOk = true` is false |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** |

Contract: unit TERM dialect must reject residual-free / emit / ready / complete
ill-typed Plan (then Apply, Body) bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckCompilePathPlanTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckCompilePathPlanTerm SystemsLean.HostModuleCheckCompilePathApplyTerm SystemsLean.HostModuleCheckCompilePathBodyTerm SystemsLean.HostModuleCheckLoadOkCompilePathUnits SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostModuleCheck SystemsLean.HostResidualShrinkTermOk` (green) | **0** (90 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0**. Re-run after residual
markdown in this closeout (same command).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Residual lockstep

- This Name **done**.
- Full host package elaborate meet stays **done partial**.
- Next named meet-path: **Package-env for CompilePath Plan Apply Body**
  (PE twins for the three units that now have TERM).
- WATCHER `/implement` is that next Name.
- Do not empty-park. Do not start seed-wide 206.

Updated: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`,
`doc/SESSION-HANDOFF.md`.

## Next Name

**Package-env for CompilePath Plan Apply Body.**

Still a pilot. Still not FullHost. Do not flip the pin without H1-H8 + lake
on a named flip residual.

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Plan/Apply/Body package-env twins in this slice
- Edits to `HostModuleCheckPackageEnv*.lean`

## Files

New:

- `src/systems/SystemsLean/HostModuleCheckCompilePathPlanTerm.lean`
- `src/systems/SystemsLean/HostModuleCheckCompilePathApplyTerm.lean`
- `src/systems/SystemsLean/HostModuleCheckCompilePathBodyTerm.lean`

Wire-up: LoadOkCompilePathUnits, RealModule, Accepts, HostResidualShrink +
Theorems + TermOk, SystemsLean.lean, HostModuleCheck.lean.

Gates: `just/host.just`, `just/host-without-lake.just`,
`nix/systems-host-presence/host-leans.nix`,
`nix/systems-host-presence/required-files.nix`,
`nix/systems-host-presence/host-specs-compile-path-3.nix`.
