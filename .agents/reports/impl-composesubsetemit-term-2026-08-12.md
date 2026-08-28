# Report: Term-surface for ComposeSubsetEmit (2026-08-12)

ASCII only. Not a FullHost flip. FULLHOST_FLIP=no.

## Verdict

**GREEN.** Pin stays false. Harness **108 -> 109**. TERM dual-ok **54 -> 55**.

Unit TERM accept + reject twins landed for ComposeSubsetEmit, the next real host
seed module after GraphSubsetEmit. Same E-good + ILL-TYPED-TERM residual /
emit / ready / complete twins as GraphSubsetEmit. L0 still accepts the bad
texts. Dialect rejects residual-free / emit / ready / complete ill-typed
bodies. SurfaceOk fold, not bare dualOk. Seed 206 unchanged.
`hostResidualShrinkFullHostElaborateRemains` stays **false**. H2 still partial
vs seed 206. H5 unmet. Do not flip.

## Product slice

| Piece | Detail |
|-------|--------|
| Companion | `HostModuleCheckComposeSubsetEmitTerm.lean` (271). Dialect on Compose emit path, residual-free, product-complete, and composeSubsetEmitReady. |
| E-good emit | `composeSubsetEmitComposeDialectOk` body is `emitComposeReady`. |
| E-good residual | `composeSubsetEmitResidualFreeClaimed` body is `false`. |
| E-good complete | `composeSubsetEmitProductSelfHostCompleteClaimed` body is `false`. |
| E-good ready | Collapsed `composeSubsetEmitReady` matches the real ComposeSubsetEmit chain (`composeSubsetEmitReadyTermBody`). |
| ILL twins | residual-free claimed true; emit body `true`; ready body `true`; complete claimed true. L0 accept + dialect reject. |
| LoadOk | `hostModuleCheckLaterTermSurfaceOk` folds `hostModuleCheckComposeSubsetEmitTermSurfaceOk` (LoadOk tip stays 914). |
| RealModule | `refineComposeSubsetEmitWithTermSurface` instead of bare L0 check. |
| Accepts | Good ComposeSubsetEmit text is Term text, not the L0 FixtureTextsLater stub. |
| Shrink mirrors | `HostResidualShrinkTermOk` dualOk + bar + scope ComposeSubsetEmit-only. |
| Harness | **108 -> 109** (`seed=206+Main=59+harness=109`). One new HostModuleCheck module. Seed 206 unchanged. |
| TERM dual-ok | **54 -> 55**. |

Did **not** edit `HostModuleCheckPackageEnv*.lean`. Package-env twins are
out of scope for this slice.

## Living ComposeSubsetEmit claims twinned (from disk)

| Claim | Living body on `ComposeSubsetEmit.lean` | TERM E-good / ILL |
|-------|----------------------------------------|-------------------|
| emit | `composeSubsetEmitComposeDialectOk := emitComposeReady` | good `emitComposeReady`; ILL body `true` |
| residual | `composeSubsetEmitResidualFreeClaimed := false` | good `false`; ILL claimed `true` |
| complete | `composeSubsetEmitProductSelfHostCompleteClaimed := false` | good `false`; ILL claimed `true` |
| ready | multi-line `composeSubsetEmitReady` (input + Compose dialect + package + Lake + local non-claims + stage/host/surface/input/exe/recipe pins) | collapsed chain `composeSubsetEmitReadyTermBody`; ILL body `true` |

Expected table matched disk. No living-claim surprise.

## TDD

| Step | Command | Result |
|------|---------|--------|
| Red | `lake build SystemsLean.HostModuleCheckComposeSubsetEmitTerm` with `hostModuleCheckComposeSubsetEmitTermSurfaceOk := false` and theorem `= true` | **exit 1**. Tactic `native_decide` evaluated `hostModuleCheckComposeSubsetEmitTermSurfaceOk = true` is false |
| Green | same module after dialect + four ILL twins + L0 accept + SurfaceOk fold | **exit 0** (14 jobs) |

Contract: unit TERM dialect must reject residual-free / emit / ready /
complete ill-typed ComposeSubsetEmit bodies while L0 named-surface still accepts.
Did not rewrite the red theorem.

## Lake commands

| Command | Exit |
|---------|-----:|
| `lake build SystemsLean.HostModuleCheckComposeSubsetEmitTerm` (red, SurfaceOk false) | **1** |
| `lake build SystemsLean.HostModuleCheckComposeSubsetEmitTerm` (green after dialect + twins) | **0** (14 jobs) |
| `lake build SystemsLean.HostModuleCheckComposeSubsetEmitTerm SystemsLean.HostModuleCheckLoadOkLaterTerm SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTheorems SystemsLean.HostResidualShrinkTermOk SystemsLean.HostModuleCheck` (wire green) | **0** (97 jobs) |

## Hygiene

`just hygiene` after product Lean + Nix/just: **exit 0** (1407 files; 735 md).

## systems-host

`just systems-host`: **exit 0** (326 required paths).

## Pin still false

`hostResidualShrinkFullHostElaborateRemains := false` unchanged.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed /
band FullBackend edits.

## Files changed

### Product Lean

- `src/systems/SystemsLean/HostModuleCheckComposeSubsetEmitTerm.lean` (new, 271)
- `src/systems/SystemsLean/HostModuleCheckLoadOkLaterTerm.lean` (118)
- `src/systems/SystemsLean/HostModuleCheckLoadOk.lean` (comment only; tip stays 914)
- `src/systems/SystemsLean/HostModuleCheckRealModule.lean` (600)
- `src/systems/SystemsLean/HostModuleCheckAccepts.lean` (983)
- `src/systems/SystemsLean/HostModuleCheck.lean` (import + greppable)
- `src/systems/SystemsLean.lean` (import)
- `src/systems/SystemsLean/HostResidualShrink.lean` (839)
- `src/systems/SystemsLean/HostResidualShrinkTheorems.lean` (766)
- `src/systems/SystemsLean/HostResidualShrinkTermOk.lean` (256)

### Gates

- `just/host.just`
- `just/host-without-lake.just`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-specs-compile-path-1.nix` (ComposeSubsetEmit TERM spec; L0 home remains compile-path-2)
- `nix/systems-host-presence/host-specs-compile-path-3.nix` (harness 109)

## Residual lockstep

- This Name **done** (implementer). Parent owns WATCHER / residual ledger lockstep after review.
- Full host package elaborate meet stays **done partial**.
- Pin stays false. Seed 206 unchanged.

## Out of scope honored

- FullHostElaborateRemains flip / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Package-env twins for ComposeSubsetEmit (`HostModuleCheckPackageEnv*.lean` untouched)
- Inventing a C fail-closed residual
- Cold compose init unroll
- Rewrite of GraphSubsetEmit TERM
- Re-queue of GraphSubsetEmit TERM or PE60
- Updating WATCHER.md / residual / handoff

## Next PE twin / Evidence

Evidence is 981. The next package-env twin may need an Evidence long-file split.
Do not open or perform that split now.

## Next Name

Parent lockstep after review. Still a pilot. Still not FullHost. Do not flip
the pin without H1-H8 + lake on a named flip residual.
