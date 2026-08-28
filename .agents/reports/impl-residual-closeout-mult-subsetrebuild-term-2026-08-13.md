# Implement report: residual closeout after Term-surface for MultSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
MultSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for MultSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE64 plus
this TERM; pin still false). Do not flip `FullHostElaborateRemains`. Do not
re-queue this TERM or PE64. Do not open cold compose init unroll. Do not invent
seed-wide 206, a FullHost flip, or a C product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-mult-subsetrebuild-term-2026-08-13.md` | GREEN. New `HostModuleCheckMultSubsetRebuildTerm.lean` (303). Harness 112->113. TERM 58->59. LoadOk later-fold 914. Accepts 987. Companion four ILL twins + SurfaceOk. This unit is **rebuild / self-apply, not emit**. Dialect is living `multSubsetRebuildSelfApplyOk` fold, not `emitMultReady`. Wrote-expected is `self-apply && multSubsetEmitWroteExpected`. Ready collapsed via `multSubsetRebuildReadyTermBody`. Residual-free and complete claimed stay false. PackageEnv / Evidence / FixturesS5 / FixturesLater **untouched**. Seed 206. FullHostElaborateRemains false. Soft J2 MultSubsetRebuild-only. RealModule `refineMultSubsetRebuildWithTermSurface`. |
| `/tmp/grok-1000/grok-impl-summary-msr-term.md` | Same GREEN summary |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-mult-subsetrebuild-term-2026-08-13.md`. |
| `/tmp/grok-1000/grok-review-msr-term-tests.md` | APPROVE 0 |
| `/tmp/grok-1000/grok-review-msr-term-general.md` | APPROVE 0 |
| `.agents/reports/impl-residual-closeout-package-env-mult-subsetemit-2026-08-12.md` | Prior lockstep clone (named this TERM as next; that Name is now product-done) |

Living product counts after this TERM (do not invent different numbers):

- Seed **206**
- Harness **113**
- TERM dual-ok **59**
- LoadOk **914**
- Accepts **987**
- Companion **303**
- PackageEnv **938** (untouched this TERM)
- Evidence **988** (untouched this TERM; later-fold PE45..PE64)
- FixturesS5 **990** (untouched)
- FixturesLater **155** (untouched; S17+S18)
- systems-host **331** paths

---

## Inventory of next seed after MultSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.MultSubsetRebuild` | `SystemsLean.LinearSubsetRebuild` in both `HostModuleCheckSeeds.lean` and `HostImportGraphSeeds.lean` |
| Existing `HostModuleCheckMultSubsetRebuildTerm.lean` | **yes** (303; this TERM just landed) |
| Existing `HostModuleCheckLinearSubsetRebuildTerm.lean` | **none** |
| Existing PE65 / S19 / `hostModuleCheckGoodPackageEnvS19Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckMultSubsetEmitTermSurfaceOk`; does **not** yet fold `hostModuleCheckMultSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | **none** (`packageBodyImportsCompilePathMult` is the living Mult CompilePath check; no EmitRebuild farm) |
| Earlier SubsetEmit units (Linear through MultSubsetEmit) | TERM + package-env both landed |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for MultSubsetRebuild** (PE65 / S18++).
Walking to LinearSubsetRebuild TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM or PE64.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePath-only (`packageBodyImportsCompilePathMult`; no emit-module farm).
Do **not** invent an EmitRebuild farm.

---

## Why Package-env for MultSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | MultSubsetRebuild now has TERM dual-ok **59** / harness **113** |
| PE twin for that unit | **missing** (package-env still through PE64 / S18) |
| Next seed LinearSubsetRebuild | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for MultSubsetRebuild **done**; Package-env for MultSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE64 plus this TERM; pin still false); two-target table row 32 done / row 33 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for MultSubsetRebuild. Fence `/implement --effort 2 Package-env for MultSubsetRebuild`. Did not re-queue this TERM or PE64. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-mult-subsetrebuild-term-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-residual-closeout-msr-term.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE64 + this TERM; pin still false; next named meet-path is Package-env for MultSubsetRebuild |
| Package-env for CompilePath unit TERM | **done** | PE45..PE52 |
| Term-surface for CompilePath Plan Apply Body | **done** | |
| Package-env for CompilePath Plan Apply Body | **done** | PE53..PE55 |
| Term-surface for FirstSurface | **done** | |
| Package-env for FirstSurface | **done** | PE56 / S10 |
| Term-surface for LinearSubsetEmit | **done** | |
| Package-env for LinearSubsetEmit | **done** | PE57 / S11 |
| Term-surface for TypesSubsetEmit | **done** | |
| Package-env for TypesSubsetEmit | **done** | PE58 / S12 |
| Term-surface for ProgramSubsetEmit | **done** | |
| Package-env for ProgramSubsetEmit | **done** | PE59 / S13 |
| Term-surface for GraphSubsetEmit | **done** | |
| Package-env for GraphSubsetEmit | **done** | PE60 / S14 |
| Term-surface for ComposeSubsetEmit | **done** | |
| Package-env for ComposeSubsetEmit | **done** | PE61 / S15 |
| Term-surface for ErasureSubsetEmit | **done** | |
| Package-env for ErasureSubsetEmit | **done** | PE62 / S16 |
| Term-surface for ExtractSubsetEmit | **done** | |
| Package-env for ExtractSubsetEmit | **done** | PE63 / S17 |
| Term-surface for MultSubsetEmit | **done** | harness 112 at land; TERM 58 at land; companion 274 |
| Package-env for MultSubsetEmit | **done** | PE64 / S18; FixturesS5 990 / FixturesLater 155 / PackageEnv 938 / Evidence 988 |
| Term-surface for MultSubsetRebuild | **done** | harness **113**; TERM **59**; companion **303**; pin still false |
| Package-env for MultSubsetRebuild | **open** | Highest-value next; clone PE64; PE65 / S19; pin stays false |
| Term-surface for LinearSubsetRebuild | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for MultSubsetRebuild**.

Expected PE land: harness stays **113**; TERM stays **59**; E-good S19 = S18 ++
MultSubsetRebuild using `hostModuleCheckGoodMultSubsetRebuildReadyMultilineText`;
dialect S19 after S18 MultSubsetEmit; Soft J5
`checkMultSubsetRebuildTermDialect` at package scope; Soft J2 CompilePath-only
(honest); `packageEnvTermSurfaceOk` folds
`hostModuleCheckMultSubsetRebuildTermSurfaceOk`; later-fold helper
`packageEnvDialectRejectsIllTyped` covers PE45..PE65 after the land.

---

## Evidence near-bar note (required)

Evidence is **988** / under 1000. PE65 **must split Evidence** if the land would
exceed 1000. FixturesS5 is **990**; append S19 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (155), not FixturesS5.

---

## Next Name contract (living)

Name: Package-env for MultSubsetRebuild

Goal: Add package-env residual-free reject twin plus E-good S19 plus dialect
S19 for MultSubsetRebuild.

Done when (checkable; clone PE64):

- E-good S19 = S18 ++ MultSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodMultSubsetRebuildReadyMultilineText`).
- Dialect S19 after S18 MultSubsetEmit.
- Soft J2 CompilePath-only (`packageBodyImportsCompilePathMult`; no emit-module
  farm; this unit is rebuild / self-apply; do **not** invent an EmitRebuild
  farm).
- Soft J5 `checkMultSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckMultSubsetRebuildTermSurfaceOk`.
- Residual-free reject twin at package scope.
- Evidence later-fold covers PE45..PE65. **Split Evidence first if the land
  would exceed 1000** (now 988).
- S19 fixtures in FixturesLater, not FixturesS5 (990).
- Harness stays **113**. TERM stays **59**.
- FullHostElaborateRemains stays **false**.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; rewrite of MultSubsetRebuild TERM;
re-queue PE64; cold compose init unroll; inventing a C fail-closed residual;
flipping residual-free / complete claimed.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. MultSubsetEmit residual-free and complete claimed stay
false. MultSubsetRebuild residual-free and complete claimed stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 113 / 59 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE64 (PE64 / S18 landed; this PE is next as PE65 / S19; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 155; PackageEnv 938; Evidence 988 (all under 1000) |
| MultSubsetEmit residual-free / complete claimed | **false** |
| MultSubsetRebuild residual-free / complete claimed | **false** |
| systems-emit-wire | green |
| FULLHOST_FLIP | no |
| Speed | empirical (`just bench-runtime`); never rename as PROVABLY |

No Lean claim-bool edits.

---

## Out of scope (honored)

- FullHostElaborateRemains / FULLHOST_FLIP
- Seed-wide 206 / mathlib / full Lean 4 elaborator parity
- DominanceClaimed / band FullBackend
- Product C; product Rust under src/
- Re-queue this TERM or PE64
- Opening LinearSubsetRebuild TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Hygiene

`just hygiene`: **exit 0** (1457 files; 780 markdown). source-hygiene OK;
professional-tone OK. Prior MultSubsetRebuild TERM mop hygiene was 1453 files /
776 markdown. Extra novel markdown is this closeout plus residual/handoff
already in tree. `/tmp` summary is outside the tree.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for MultSubsetRebuild
```

Do not implement that product Lean in this lockstep.
