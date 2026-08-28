# Implement report: residual closeout after Term-surface for LinearSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
LinearSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for LinearSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE65 plus
TERM through LinearSubsetRebuild; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue this TERM or PE65. Do not open
cold compose init unroll. Do not invent seed-wide 206, a FullHost flip, or a
C product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-linear-subsetrebuild-term-2026-08-13.md` | GREEN. New `HostModuleCheckLinearSubsetRebuildTerm.lean` (303). Harness 113->114. TERM 59->60. LoadOk later-fold 914. Accepts 988. Companion four ILL twins + SurfaceOk. This unit is **rebuild / self-apply, not emit**. Dialect is living `linearSubsetRebuildSelfApplyOk` fold, not `emitLinearReady`. Wrote-expected is `self-apply && linearSubsetEmitWroteExpected`. Ready collapsed via `linearSubsetRebuildReadyTermBody` (includes `!linearSubsetRebuildWithoutLakeFinishedClaimed`, Linear shape not Mult). Residual-free and complete claimed stay false. PackageEnv / Evidence / FixturesS5 / FixturesLater **untouched**. Seed 206. FullHostElaborateRemains false. Soft J2 LinearSubsetRebuild-only. RealModule `refineLinearSubsetRebuildWithTermSurface`. TDD red exit 1 then green 14 jobs. Wire family 104 jobs. |
| `/tmp/grok-1000/grok-impl-summary-lsr-term.md` | Same GREEN summary (if present) |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-linear-subsetrebuild-term-2026-08-13.md`. |
| `/tmp/grok-1000/grok-process-mop-lsr-term.md` | Same mop GREEN (if present) |
| Review/mop files (trashed) | APPROVE 0. See `impl-linear-subsetrebuild-term-2026-08-13.md`. |
| `/tmp/grok-1000/grok-review-lsr-term-general.md` | APPROVE 0 (if present) |
| `/tmp/grok-1000/grok-review-lsr-term-tests.md` | APPROVE 0 (if present) |
| `.agents/reports/impl-residual-closeout-package-env-mult-subsetrebuild-2026-08-13.md` | Prior PE lockstep clone (named this TERM as next; that Name is now product-done) |
| `.agents/reports/impl-residual-closeout-mult-subsetrebuild-term-2026-08-13.md` | Prior TERM lockstep clone (named PE65 as next after MSR TERM) |

Living product counts after this TERM (do not invent different numbers):

- Seed **206**
- Harness **114**
- TERM dual-ok **60**
- LoadOk **914**
- Accepts **988**
- Companion **303**
- PackageEnv **951** (untouched this TERM)
- Evidence **785** (untouched this TERM; PE1..PE44 plus combined Ok)
- EvidenceLater **255** (untouched this TERM; later-fold PE45..PE65)
- FixturesS5 **990** (untouched)
- FixturesLater **225** (untouched; S17+S18+S19)
- systems-host **333** paths

---

## Inventory of next seed after LinearSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.LinearSubsetRebuild` | `SystemsLean.TypesSubsetRebuild` in both `HostModuleCheckSeeds.lean` and `HostImportGraphSeeds.lean` |
| Existing `HostModuleCheckLinearSubsetRebuildTerm.lean` | **yes** (303; this TERM just landed) |
| Existing `HostModuleCheckTypesSubsetRebuildTerm.lean` | **none** |
| Existing PE66 / S20 / `hostModuleCheckGoodPackageEnvS20Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckMultSubsetRebuildTermSurfaceOk`; does **not** yet fold `hostModuleCheckLinearSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | `packageBodyImportsCompilePathLinear` **exists** (same helper LinearSubsetEmit PE57 already used). `packageBodyImportsCompilePathMult` remains the living Mult CompilePath check. No EmitRebuild farm. |
| Earlier units through MultSubsetRebuild | TERM + package-env both landed |
| LinearSubsetRebuild | TERM landed; PE twin **missing** |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for LinearSubsetRebuild** (PE66 / S20).
Walking to TypesSubsetRebuild TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM or PE65.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePath-only (`packageBodyImportsCompilePathLinear`; no emit-module farm).
Do **not** invent an EmitRebuild farm.

---

## Why Package-env for LinearSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | LinearSubsetRebuild now has TERM dual-ok **60** / harness **114** |
| PE twin for that unit | **missing** (package-env still through PE65 / S19) |
| Next seed TypesSubsetRebuild | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for LinearSubsetRebuild **done**; Package-env for LinearSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE65 plus TERM through LinearSubsetRebuild; pin still false); two-target table row 34 done / row 35 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for LinearSubsetRebuild. Fence `/implement --effort 2 Package-env for LinearSubsetRebuild`. Did not re-queue this TERM or PE65. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-linear-subsetrebuild-term-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-residual-closeout-lsr-term.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE65 + TERM through LinearSubsetRebuild; pin still false; next named meet-path is Package-env for LinearSubsetRebuild |
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
| Package-env for MultSubsetEmit | **done** | PE64 / S18 |
| Term-surface for MultSubsetRebuild | **done** | harness **113**; TERM **59**; companion **303**; pin still false |
| Package-env for MultSubsetRebuild | **done** | PE65 / S19; FixturesS5 990 / FixturesLater 225 / PackageEnv 951 / Evidence 785 / EvidenceLater 255 |
| Term-surface for LinearSubsetRebuild | **done** | harness **114**; TERM **60**; companion **303**; pin still false |
| Package-env for LinearSubsetRebuild | **open** | Highest-value next; clone PE65; PE66 / S20; pin stays false |
| Term-surface for TypesSubsetRebuild | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for LinearSubsetRebuild**.

Expected PE land: harness stays **114**; TERM stays **60**; E-good S20 = S19 ++
LinearSubsetRebuild using `hostModuleCheckGoodLinearSubsetRebuildReadyMultilineText`;
dialect S20 after S19 MultSubsetRebuild; Soft J5
`checkLinearSubsetRebuildTermDialect` at package scope; Soft J2 CompilePath-only
(`packageBodyImportsCompilePathLinear`; honest; no EmitRebuild farm);
`packageEnvTermSurfaceOk` folds
`hostModuleCheckLinearSubsetRebuildTermSurfaceOk`; later-fold helper
`packageEnvDialectRejectsIllTyped` covers PE45..PE66 after the land.

---

## Evidence later-fold note

Evidence is **785** (PE1..PE44 plus combined Ok). EvidenceLater is **255**
(later-fold PE45..PE65). PE66 **must append to EvidenceLater**, not grow
Evidence. FixturesS5 is **990**; append S20 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (225), not FixturesS5.
PackageEnv is **951** (headroom under 1000).

---

## Next Name contract (living)

Name: Package-env for LinearSubsetRebuild

Goal: Add the package-env twin (PE66 / S20) so LinearSubsetRebuild TERM is
visible at package scope.

Done when (checkable; clone PE65):

- E-good S20 = S19 ++ LinearSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodLinearSubsetRebuildReadyMultilineText`).
- Dialect S20 after S19 MultSubsetRebuild.
- Soft J2 CompilePath-only (`packageBodyImportsCompilePathLinear`; no
  emit-module farm; this unit is rebuild / self-apply; do **not** invent an
  EmitRebuild farm).
- Soft J5 `checkLinearSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckLinearSubsetRebuildTermSurfaceOk`.
- Residual-free claimed true is ILL-TYPED-TERM; L0 package tokens still accept.
- Dialect body living `linearSubsetRebuildSelfApplyOk` + wrote-expected, **not**
  `emitLinearReady`.
- EvidenceLater gets PE66. Do **not** grow Evidence.
- S20 fixtures in FixturesLater, not FixturesS5 (990).
- PackageEnv stays under 1000 (now 951).
- Harness stays **114**. TERM stays **60**.
- FullHostElaborateRemains stays **false**.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Term-surface for TypesSubsetRebuild
(TERM for the next seed comes after this PE); rewrite of LinearSubsetRebuild
TERM; re-queue PE65; cold compose init unroll; inventing a C fail-closed
residual; flipping residual-free / complete claimed; `emitLinearReady` as
dialect clone; growing Evidence (use EvidenceLater); growing FixturesS5.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. LinearSubsetRebuild residual-free and complete claimed
stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 114 / 60 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE65 (PE65 / S19 landed; this PE is next as PE66 / S20; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 225; PackageEnv 951; Evidence 785; EvidenceLater 255 (all under 1000) |
| LinearSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue this TERM or PE65
- Opening TypesSubsetRebuild TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Hygiene

`just hygiene`: **exit 0** (1469 files; 790 markdown). source-hygiene OK;
professional-tone OK. Prior LinearSubsetRebuild TERM mop hygiene was 1465
files / 786 markdown. Extra novel markdown is this closeout plus
residual/handoff already in tree. `/tmp` summary is outside the tree.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for LinearSubsetRebuild
```

Do not implement that product Lean in this lockstep.
