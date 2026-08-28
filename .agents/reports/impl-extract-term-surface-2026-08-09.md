# Report: Extract term-surface pilot

Date: 2026-08-09. Repo: Systems Lean (`/home/hunter/Projects/ai/iso`).

## Goal

Same bar as Mult / Linear / Types / IrProgram / IrGraph / HostCompose / Erasure
TERM-SURFACE pilots for **Extract.lean**: reject named ill-typed Extract twins
that L0/L1 still accept; dual-ok **TERM-SURFACE Extract-only** with E-bad
evidence. Gate via SurfaceOk fold not bare dualOk. Mult Mult-only + Linear
Linear-only + Types Types-only + IrProgram IrProgram-only + IrGraph IrGraph-only
+ HostCompose HostCompose-only + Erasure Erasure-only + MultTheorems PROOF
MultTheorems-only unchanged. FullHostElaborateRemains false.
free/complete/PROVABLY unchanged. Last Mult..Extract foundation unit (L2 band
complete).

## Delivered

| Item | Path / result |
|------|----------------|
| Gap table | `doc/dev/research/extract-term-surface-gap-table-2026-08-09.md` (Kind: analysis only; XT1..XT4) |
| Companion module | `src/systems/SystemsLean/HostModuleCheckExtractTerm.lean` (~539 lines) |
| Nested `:=` lesson | `extractBodyAfterAssign` re-joins after first `:=` so `{ marked := erasedMarked }` does not truncate |
| Wire | `refineExtractWithTermSurface` on `SystemsLean.Extract` in `HostModuleCheckCheckersLater` |
| Dual-ok pins | claim `hostModuleCheckExtractTermSurfaceDualOk` true; **gate** `hostModuleCheckExtractTermSurfaceOk` (E-bad fold); scope Extract-only; HostResidualShrink mirror |
| L0 good fixture | `hostModuleCheckGoodExtractText` upgraded to L2 shapes (seed L0 path still accepts under refine) |
| Harness | seed=206 harness=**37** (added HostModuleCheckExtractTerm) |
| Residual lockstep | RESIDUAL-systems Done + Open **LinearTheorems L3 PROOF-SURFACE pilot**; RESIDUAL.md join; WATCHER `/implement` LinearTheorems L3; SESSION-HANDOFF living tip; self-host / inventory tips |

## Extract L2 dialect rules

Documented subset (not full Lean 4 elaborator):

1. **RuntimeClaim.name**: arms `"RUNTIME-FS"` / `"RUNTIME-CLASSIC"` / `"EDGE-RUNTIME"`
2. **isFreestandingGoal**: one `true` + at least two `false`
3. **ofRuntimeTag?**: four arms (`some runtimeFs` / classic / edge + `none`)
4. **isValidRuntimeTag**: collapsed exact `(ofRuntimeTag? n).isSome`
5. **checkFailClosed**: freestanding guard + Mult.mult0 Erasure path / mult1+omega true
6. **extractOk**: collapsed exact `checkFailClosed m e claim`
7. **extractOkFromTags?**: Mult.ofNat? + ofRuntimeTag? with nested
   `{ marked := erasedMarked }` + fail-closed `none`

Reject reason: `ILL-TYPED-TERM` (shared with Mult..Erasure L2).
Inductive RuntimeClaim stays L0 token only this pilot.

## Twins (RED / GREEN)

| Twin | Mutation | L0/L1 | L2 |
|------|----------|-------|-----|
| XT1 | checkFailClosed body `true` | accept | ILL-TYPED-TERM |
| XT2 | isFreestandingGoal always `true` | accept | ILL-TYPED-TERM |
| XT3 | extractOk always `true` | accept | ILL-TYPED-TERM |
| XT4 | isValidRuntimeTag body `true` | accept | ILL-TYPED-TERM |
| E-good | well-typed Extract term fixture | accept | accept |
| Real disk | `Extract.lean` | accept | accept |

### RED honesty

RED is the design-time gap: L0/L1 structural token check accepts the ill-typed
twin texts before Extract L2 dialect. Living dual-pin encodes the gap:
`hostModuleCheckExtractTermSurfaceOk` requires dialect reject of XT1..XT4 while
`hostModuleCheckBadExtract*L0Accept` stays true. GREEN is lake + without-lake +
SurfaceOk true (not bare dualOk alone).

## Dual-ok pins (honesty)

| Pin | Scope | Value |
|-----|-------|-------|
| hostModuleCheckTermSurfaceDualOk | Mult-only | **true** (unchanged) |
| hostModuleCheckLinearTermSurfaceDualOk | Linear-only | **true** (unchanged) |
| hostModuleCheckTypesTermSurfaceDualOk | Types-only | **true** (unchanged) |
| hostModuleCheckIrProgramTermSurfaceDualOk | IrProgram-only | **true** (unchanged) |
| hostModuleCheckIrGraphTermSurfaceDualOk | IrGraph-only | **true** (unchanged) |
| hostModuleCheckHostComposeTermSurfaceDualOk | HostCompose-only | **true** (unchanged) |
| hostModuleCheckErasureTermSurfaceDualOk | Erasure-only | **true** (unchanged) |
| hostModuleCheckExtractTermSurfaceDualOk | Extract-only claim pin | **true** |
| hostModuleCheckExtractTermSurfaceOk | Extract-only **gate** (E-bad) | **true** |
| hostModuleCheckProofSurfaceDualOk | MultTheorems-only | **true** (unchanged) |
| FullHostElaborateRemains | package | **false** |
| DualResidual free dual-ok | F1 | **unchanged** |
| free / complete / PROVABLY | product | **unchanged** |

Banner (without-lake after rebuild exe):
`extractTermSurface=TERM-SURFACE scope=Extract-only dualOk=true` alongside
Mult-only through Erasure-only.
LoadOk + Driver fold **SurfaceOk**, not bare dualOk alone.

## Commands + exit codes

| Command | Exit |
|---------|------|
| `lake build SystemsLean.Extract` + HostModuleCheck family + HostResidualShrink (+Theorems) + `slake-host-module-check` | **0** |
| `just host-module-check-without-lake` | **0** (modules=206; Extract-only dualOk banner) |
| `just host-residual-shrink` | **0** |
| `just systems-host` | **0** (250 required paths) |
| `just hygiene` | **0** |

## Sub-1-KLOC

All HostModuleCheck*.lean under 1000 (ExtractTerm ~539; Theorems 1000;
CheckersLater 997; FixtureTexts 992; Accepts 933; Driver 948; LoadOk 886;
HostResidualShrink 953).

## Non-claims

- Not package elaborate L4 / FullHostElaborateRemains re-true
- Not ExtractTheorems L3 proof-surface
- Not free/complete/PROVABLY / DualResidual free dual-ok flip
- Not full elaborator / mathlib parity
- Mult Mult-only + Linear Linear-only + Types Types-only + IrProgram IrProgram-only + IrGraph IrGraph-only + HostCompose HostCompose-only + Erasure Erasure-only + MultTheorems PROOF MultTheorems-only stay true
