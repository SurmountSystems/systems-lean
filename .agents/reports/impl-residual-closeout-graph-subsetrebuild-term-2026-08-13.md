# Implement report: residual closeout after Term-surface for GraphSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
GraphSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for GraphSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE68 plus
TERM through GraphSubsetRebuild; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue this TERM, ProgramSubsetRebuild
TERM, PE68, or PE67. Do not open ComposeSubsetRebuild TERM now. Do not open
cold compose init unroll. Do not invent seed-wide 206, a FullHost flip, or a C
product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-graph-subsetrebuild-term-2026-08-13.md` | GREEN. Companion 306. Harness 116->117. TERM 62->63. LoadOk 914. LoadOkLaterTerm 138. Accepts 991. Dialect living `graphSubsetRebuildSelfApplyOk` not `emitGraphReady`. Four ILL twins. Residual-free/complete claimed stay false. Ready includes `!graphSubsetRebuildWithoutLakeFinishedClaimed`. TDD red exit 1 then green. Wire 107 jobs. systems-host 336. |
| `/tmp/grok-1000/grok-impl-summary-gsr-term.md` | Same GREEN if present |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-graph-subsetrebuild-term-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged |
| Clone closeout shape | `.agents/reports/impl-residual-closeout-program-subsetrebuild-term-2026-08-13.md` |

Living product counts after this TERM (do not invent different numbers):

- Seed **206**
- Harness **117**
- TERM dual-ok **63**
- LoadOk **914**
- LoadOkLaterTerm **138**
- Accepts **991** (near 1000; note for later TERM companions)
- GraphSubsetRebuild TERM companion **306**
- PackageEnv **990** (untouched this slice; near Sub-1-KLOC)
- Evidence **791** (untouched)
- EvidenceLater **291** (untouched; later PE must append here)
- FixturesS5 **990**
- FixturesLater **432** (S17..S22; later PE fixtures go here)
- systems-host **336**

---

## Inventory of next seed after GraphSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.GraphSubsetRebuild` | `SystemsLean.ComposeSubsetRebuild` in `HostModuleCheckSeeds.lean` (line 444 after 443) |
| Existing `HostModuleCheckGraphSubsetRebuildTerm.lean` | **yes** (306; this TERM just landed) |
| Existing `HostModuleCheckComposeSubsetRebuildTerm.lean` | **none** |
| Existing PE69 / S23 / `hostModuleCheckGoodPackageEnvS23Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckProgramSubsetRebuildTermSurfaceOk`; does **not** yet fold `hostModuleCheckGraphSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | `packageBodyImportsCompilePathGraph` **exists** (PackageEnv line 323). Soft J2 for the next PE is CompilePath-only (no EmitRebuild farm). |
| Living GraphSubsetRebuild claims | residual-free **false**; complete **false**; self-apply + wrote-expected + ready. This unit is rebuild / self-apply, **not** emit. Ready includes `!graphSubsetRebuildWithoutLakeFinishedClaimed`. |
| Earlier units through ProgramSubsetRebuild | TERM + package-env both landed |
| GraphSubsetRebuild | TERM landed; PE twin **missing** |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for GraphSubsetRebuild** (PE69 / S23).
Walking ComposeSubsetRebuild TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM, ProgramSubsetRebuild
TERM, PE68, or PE67.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePath-only (`packageBodyImportsCompilePathGraph`; no emit-module farm).
Do **not** invent an EmitRebuild farm.

---

## Why Package-env for GraphSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | GraphSubsetRebuild now has TERM dual-ok **63** / harness **117** |
| PE twin for that unit | **missing** (package-env still through PE68 / S22) |
| Next seed ComposeSubsetRebuild | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for GraphSubsetRebuild **done**; Package-env for GraphSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE68 plus TERM through GraphSubsetRebuild; pin still false); two-target table row 40 done / row 41 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for GraphSubsetRebuild. Fence `/implement --effort 2 Package-env for GraphSubsetRebuild`. Did not re-queue this TERM, ProgramSubsetRebuild TERM, PE68, or PE67. Did not open ComposeSubsetRebuild TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-graph-subsetrebuild-term-2026-08-13.md` | This report |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE68 + TERM through GraphSubsetRebuild; pin still false; next named meet-path is Package-env for GraphSubsetRebuild |
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
| Package-env for MultSubsetRebuild | **done** | PE65 / S19 |
| Term-surface for LinearSubsetRebuild | **done** | harness **114**; TERM **60**; companion **303**; pin still false |
| Package-env for LinearSubsetRebuild | **done** | PE66 / S20 |
| Term-surface for TypesSubsetRebuild | **done** | harness **115**; TERM **61**; companion **304**; pin still false |
| Package-env for TypesSubsetRebuild | **done** | PE67 / S21 |
| Term-surface for ProgramSubsetRebuild | **done** | harness **116**; TERM **62**; companion **305**; pin still false |
| Package-env for ProgramSubsetRebuild | **done** | PE68 / S22; FixturesS5 990 / FixturesLater 432 / PackageEnv 990 / Evidence 791 / EvidenceLater 291 |
| Term-surface for GraphSubsetRebuild | **done** | harness **117**; TERM **63**; companion **306**; pin still false |
| Package-env for GraphSubsetRebuild | **open** | Highest-value next; clone PE68; PE69 / S23; pin stays false |
| Term-surface for ComposeSubsetRebuild | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for GraphSubsetRebuild**.

Expected PE land: harness stays **117**; TERM stays **63**; E-good S23 = S22 ++
GraphSubsetRebuild using `hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText`;
dialect S23 after S22 ProgramSubsetRebuild; Soft J5
`checkGraphSubsetRebuildTermDialect` at package scope; Soft J2 CompilePath-only
(`packageBodyImportsCompilePathGraph`; honest; no EmitRebuild farm);
`packageEnvTermSurfaceOk` folds
`hostModuleCheckGraphSubsetRebuildTermSurfaceOk`; later-fold helper
covers PE45..PE69 after the land.

---

## Evidence later-fold note

Evidence is **791** (PE1..PE44 plus combined Ok). EvidenceLater is **291**
(later-fold PE45..PE68). PE69 **must append to EvidenceLater**, not grow
Evidence. FixturesS5 is **990**; append S23 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (432), not FixturesS5.
PackageEnv is **990** (split PackageEnv if this PE would pass 1000). Accepts is **991**
(near 1000; later TERM companions must watch).

---

## Next Name contract (living)

Name: Package-env for GraphSubsetRebuild

Goal: Add the package-env twin (PE69 / S23) so GraphSubsetRebuild TERM is
visible at package scope.

Done when (checkable; clone PE68):

- E-good S23 = S22 ++ GraphSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodGraphSubsetRebuildReadyMultilineText`).
- Dialect S23 after S22 ProgramSubsetRebuild.
- Soft J2 CompilePath-only (`packageBodyImportsCompilePathGraph`; no
  emit-module farm; this unit is rebuild / self-apply; do **not** invent an
  EmitRebuild farm).
- Soft J5 `checkGraphSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckGraphSubsetRebuildTermSurfaceOk`.
- Residual-free claimed true is ILL-TYPED-TERM; L0 package tokens still accept.
- Dialect body living `graphSubsetRebuildSelfApplyOk` + wrote-expected, **not**
  `emitGraphReady`.
- Ready chain includes `!graphSubsetRebuildWithoutLakeFinishedClaimed`.
- EvidenceLater gets PE69. Do **not** grow Evidence.
- S23 fixtures in FixturesLater, not FixturesS5 (990).
- PackageEnv stays under 1000 (now 990; split PackageEnv if this PE would pass 1000).
- Harness stays **117**. TERM stays **63**.
- FullHostElaborateRemains stays **false**.
- TDD: red Evidence `packageEnvDialectRejectsOk_true` before S23 dialect, then
  green.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Term-surface for ComposeSubsetRebuild
(TERM for the next seed comes after this PE); rewrite of GraphSubsetRebuild
TERM; re-queue PE68; re-queue PE67; re-queue ProgramSubsetRebuild TERM; re-queue
TypesSubsetRebuild TERM; cold compose init unroll; inventing a C fail-closed
residual; flipping residual-free / complete claimed; `emitGraphReady` as
dialect clone; growing Evidence (use EvidenceLater); growing FixturesS5.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. GraphSubsetRebuild residual-free and complete claimed
stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 117 / 63 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE68 (PE68 / S22 landed; this PE is next as PE69 / S23; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 432; PackageEnv 990; Evidence 791; EvidenceLater 291 (all under 1000) |
| GraphSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue this TERM, ProgramSubsetRebuild TERM, PE68, or PE67
- Opening ComposeSubsetRebuild TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Hygiene

`just hygiene`: **exit 0** (1502 files; 820 markdown). source-hygiene OK;
professional-tone OK. Prior GraphSubsetRebuild TERM mop hygiene was 1498
files / 816 markdown. Extra novel markdown is this closeout plus
residual/handoff already in tree.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for GraphSubsetRebuild
```

Do not implement that product Lean in this lockstep.
