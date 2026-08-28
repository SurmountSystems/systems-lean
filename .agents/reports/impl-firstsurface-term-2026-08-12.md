# Report: Term-surface for FirstSurface (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **102 -> 103**. TERM dual-ok **49 -> 50**.

Unit TERM accept + reject twins landed for FirstSurface, the next real L0
seed after all 49 existing TERM units have package-env twins. Same E-good +
ILL-TYPED-TERM residual / emit / ready / complete twins as the last
CompilePath Plan Apply Body land. L0 still accepts the bad texts. Dialect rejects
residual-free / emit / ready / complete ill-typed bodies. SurfaceOk fold,
not bare dualOk. Seed 206 unchanged. H2 still partial vs seed 206. H5 unmet.
Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckFirstSurfaceTerm.lean` (236). Dialect on emit Mult path, residual-free, product-complete, and firstSurfaceReady. |
| E-good emit | `firstSurfaceEmitMultOk` body is `multFixtureEmitPathOk`. |
| E-good residual | `firstSurfaceResidualFreeClaimed` body is `false`. |
| E-good complete | `firstSurfaceProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `firstSurfaceReady` matches the real FirstSurface CompilePathMult chain (`firstSurfaceReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLoadOk` folds `hostModuleCheckFirstSurfaceTermSurfaceOk` (not in CompilePathUnits; FirstSurface is a seed unit). |
| RealModule | `refineFirstSurfaceWithTermSurface` instead of bare L0 check. |
| Accepts | Good FirstSurface text is Term text, not the L0 FixtureTextsProduct stub. |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope FirstSurface-only. |
| Harness | **102 -> 103** (`seed=206+Main=59+harness=103`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **49 -> 50**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`. Package-env twins are
the next Name.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckFirstSurfaceTerm` with `hostModuleCheckFirstSurfaceTermSurfaceOk := false` and theorem `= true` | **exit 1** -- Tactic `native_decide` evaluated `hostModuleCheckFirstSurfaceTermSurfaceOk = true` is false |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed FirstSurface bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckFirstSurfaceTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckFirstSurfaceTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckFirstSurfaceTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostModuleCheck SystemsLean.HostResidualShrinkTermOk` (wire green) | **0** (92 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1350 files; 684 md).
Re-run after residual markdown and report tone fix: **exit 0**
(1351 files; 685 md).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckFirstSurfaceTerm.lean` (new, 236)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean`
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean`
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean`
- `src/systems/SystemsLean/HostModuleCheck.lean`
- `src/systems/SystemsLean.lean`
- `src/systems/SystemsLean/HostResidualShrink.lean`
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean`
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean`

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-1.nix` (FirstSurface L0 home plus TERM spec)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 103)

### Residual lockstep

- `RESIDUAL-systems.md`
- `RESIDUAL.md`
- `WATCHER.md`
- `doc/SESSION-HANDOFF.md`

## Residual lockstep

- This Name **done**.
- Full host package elaborate meet stays **done partial**.
- Next named meet-path: **Package-env for FirstSurface**
  (PE twin; pin stays false).
- WATCHER `/implement --effort 2 Package-env for FirstSurface`.
- Do not empty-park. Do not start seed-wide 206.

Updated: `RESIDUAL-systems.md`, `RESIDUAL.md`, `WATCHER.md`,
`doc/SESSION-HANDOFF.md`.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for FirstSurface (next Name)
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewriting existing TERM companions

## Next Name

**Package-env for FirstSurface.**

Still a pilot. Still not FullHost. Do not flip the pin without H1-H8 + lake
on a named flip residual.
