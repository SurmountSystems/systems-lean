# Report: S6 TERM SpecProof + DualResidual (2026-08-11)

## Verdict

**GREEN.** Landed HostModuleCheck TERM dual-ok for honesty modules
`SystemsLean.SpecProof` (spec-proof separation dialect -- not FullHost /
proofComplete re-open) and `SystemsLean.DualResidual` (dual residual honesty
dialect -- not free/complete claim re-open).

TERM dual-ok **+2** from pre-S6 tip (**36** -> **38**). Harness partition
**seed=206+Main=59+harness=90** (pre-S6 tip **88** + SpecProofTerm +
DualResidualTerm). free / complete / PROVABLY **true**; FullHostElaborateRemains
**false**; DominanceClaimed **false**; band FullBackend **false**.
`proofCompleteClaimed` stays **true** (Track 4c SpecProof bar only; S6 is
dialect check only, not re-proved as FullHost). Dual residual free claimed
story unchanged (host free claimed under bar a; DualResidual remains false /
free claimed true).

## Done when checklist

| # | Requirement | Status |
|---|-------------|--------|
| 1 | SpecProof TERM dual-ok true | **yes** (`hostModuleCheckSpecProofTermSurfaceDualOk`) |
| 2 | DualResidual TERM dual-ok true | **yes** (`hostModuleCheckDualResidualTermSurfaceDualOk`) |
| 3 | Term companions + dualOk + RealModule + LoadOk + harness | **yes** |
| 4 | Harness +2 from pre-slice (88 -> 90) | **yes** |
| 5 | TERM dual-ok +2 (36 -> 38) | **yes** |
| 6 | without-Lake + systems + residual-shrink + hygiene green | **yes** |
| 7 | Residual S6 done | **yes** |
| 8 | Report on disk | **yes** (this path) |
| 9 | free/complete/PROVABLY true; FullHost/Dominance false | **yes** (no claim flips) |
| 10 | proofCompleteClaimed true; not FullHost re-prove | **honored** |
| 11 | Dual residual free claimed story unchanged | **honored** |

## Pattern (S2 CompilePath / S3 JoinMap / S4 SelfHost+SurfaceMatrix)

### SpecProof companion (`HostModuleCheckSpecProofTerm.lean`, 236 lines)

| Piece | Detail |
|-------|--------|
| Scope | TERM-SURFACE **SpecProof-only** |
| Dialect | stageId `SLAKE_SELF_HOST_SPEC_PROOF_V0`; hostSpecProofId `HOST-SPEC-PROOF`; selfHostSpecProofId `SELF-HOST-SPEC-PROOF`; acceptancePath `src/systems/self-host.md`; hostModulePath `src/systems/SystemsLean/SpecProof.lean` |
| E-good | `hostModuleCheckGoodSpecProofTermText` (required decls + dialect fields) |
| ILL twins | bad stage / host / map / path id (L0 still accepts; dialect rejects ILL-TYPED-TERM) |
| Gate | `hostModuleCheckSpecProofTermSurfaceOk` (not bare dualOk alone) |
| RealModule | `refineSpecProofWithTermSurface` on `SystemsLean.SpecProof` |
| LoadOk | SurfaceOk fold |
| dualOk mirror | `HostResidualShrinkTermOk` SpecProof-only |

### DualResidual companion (`HostModuleCheckDualResidualTerm.lean`, 238 lines)

| Piece | Detail |
|-------|--------|
| Scope | TERM-SURFACE **DualResidual-only** |
| Dialect | stageId `SLAKE_SELF_HOST_DUAL_RESIDUAL_V0`; hostDualResidualId `HOST-DUAL-RESIDUAL`; selfHostDualResidualId `SELF-HOST-DUAL-RESIDUAL`; acceptancePath `src/systems/self-host.md`; hostModulePath `src/systems/SystemsLean/DualResidual.lean` |
| E-good | `hostModuleCheckGoodDualResidualTermText` |
| ILL twins | bad stage / host / map / path id |
| Gate | `hostModuleCheckDualResidualTermSurfaceOk` |
| RealModule | `refineDualResidualWithTermSurface` on `SystemsLean.DualResidual` |
| LoadOk | SurfaceOk fold |
| dualOk mirror | `HostResidualShrinkTermOk` DualResidual-only |

## Wire-up

| Surface | Change |
|---------|--------|
| `HostModuleCheckSpecProofTerm.lean` | new companion |
| `HostModuleCheckDualResidualTerm.lean` | new companion |
| `HostModuleCheckRealModule.lean` | import + SpecProof / DualResidual refine |
| `HostModuleCheckAccepts.lean` | good DualResidual/SpecProof use Term texts |
| `HostModuleCheckLoadOk.lean` | SurfaceOk folds (+2 imports; tip **992**) |
| `HostModuleCheckPackageEnv.lean` | SurfaceOk dual-pin folds (no PE band expand) |
| `HostModuleCheck.lean` / `SystemsLean.lean` | hub imports |
| `HostResidualShrink` / TermOk / Theorems | dualOk + harness list + partition **90** |
| `just/host.just` | SpecProof + DualResidual dualOk greps; harness=90 list |
| `just/host-without-lake.just` | family_mods SpecProofTerm + DualResidualTerm |
| `nix/systems-host-presence/` | host-leans, required-files, host-specs-compile-path-3 |

**PE note:** S6 package-env twins deferred (optional later; S5 Done when said PE for
S6 only if same wave). Package env band still Mult..ParityEmit+U2+S5 only.

## Pins (unchanged claim story)

| Pin | Value | Evidence |
|-----|-------|----------|
| free / residualFreeClaimed | **true** | DualResidual.lean |
| complete / freestandingProductSelfHostComplete | **true** | SelfApplyFs.lean (not re-opened) |
| PROVABLY / provablyUnlocked | **true** | LlvmHold.lean |
| proofCompleteClaimed | **true** | SpecProof.lean (Track 4c; not FullHost) |
| FullHostElaborateRemains | **false** | HostResidualShrink.lean mirror |
| DominanceClaimed / band FullBackend | **false** | LlvmCfgHonesty / residual tip |
| Dual residual host free claimed / remains | true / false | DualResidual.lean |
| seed / Main / harness | **206** / **59** / **90** | HostResidualShrink |
| package-env | Mult..ParityEmit+U2+S5 | unchanged |
| TERM dual-ok | **38** | 36 prior + SpecProof + DualResidual |

## Verify

| Path | Command | Result |
|------|---------|--------|
| Lake Term family | `lake build SystemsLean.HostModuleCheckSpecProofTerm SystemsLean.HostModuleCheckDualResidualTerm` | **exit 0** |
| Lake wire-up | `lake build SystemsLean.HostModuleCheckRealModule SystemsLean.HostModuleCheckAccepts SystemsLean.HostModuleCheckLoadOk SystemsLean.HostModuleCheckPackageEnv SystemsLean.HostResidualShrink SystemsLean.HostResidualShrinkTermOk SystemsLean.HostResidualShrinkTheorems SystemsLean.HostModuleCheck` | **exit 0** |
| Without Lake | `just host-module-check-without-lake` | **GREEN** modules=206 PARTIAL-STRUCTURAL |
| Residual shrink | `just host-residual-shrink` | **GREEN** |
| Host presence | `just systems-host` | **GREEN** (305 required paths) |
| Hygiene | `just hygiene` | **GREEN** |

## Residual / WATCHER

- `RESIDUAL-systems.md`: S6 **done**; living Open **S7-S8**; next **S7**
- `RESIDUAL.md` join board: S6 done; next **S7**
- `WATCHER.md`: next implement **S7** FullHost meet reseed no flip
- `doc/SESSION-HANDOFF.md`: living tip harness 90; TERM dual-ok 38; S6 done; S7 next

## Out of scope (honored)

Full elaborator parity claim; free/complete/PROVABLY forge or re-open; FullHost
flip; product C/shell; git commit/add/push; S5 rework; PE twins for SpecProof /
DualResidual (deferred note); mathlib.
