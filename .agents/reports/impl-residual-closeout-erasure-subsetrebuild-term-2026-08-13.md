# Implement report: residual closeout after Term-surface for ErasureSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). Next Open Name is **Package-env for ErasureSubsetRebuild**. `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
ErasureSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for ErasureSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE70 plus
TERM through ErasureSubsetRebuild; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue this TERM, PE70, ComposeSubsetRebuild
TERM, or PE69. Do not open ExtractSubsetRebuild TERM now. Do not open
cold compose init unroll. Do not invent seed-wide 206, a FullHost flip, or a C
product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-erasure-subsetrebuild-term-2026-08-13.md` | GREEN. Companion 308. Harness 118->119. TERM 64->65. LoadOk 914. LoadOkLaterTerm 143. Accepts 993. Dialect living `erasureSubsetRebuildSelfApplyOk` not `emitErasureReady`. Four ILL twins. Residual-free/complete claimed stay false. Ready includes `!erasureSubsetRebuildWithoutLakeFinishedClaimed`. TDD red exit 1 then green 14 jobs. Wire family 109 jobs. systems-host 338. |
| `/tmp/grok-1000/grok-impl-summary-esr-term.md` | Same GREEN |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-erasure-subsetrebuild-term-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged (`python3 ~/.agents/skills/implement/scripts/memory.py update` via `/tmp/grok-1000/grok-mem-esr-term.json`) |
| Clone closeout shape | `.agents/reports/impl-residual-closeout-compose-subsetrebuild-term-2026-08-13.md` |

Living product counts after this TERM (confirmed last-line `wc`; do not invent different numbers):

- Seed **206**
- Harness **119**
- TERM dual-ok **65**
- LoadOk **914**
- LoadOkLaterTerm **143**
- Accepts **993** (cite only for the PE twin)
- ErasureSubsetRebuild TERM companion **308**
- ComposeSubsetRebuild TERM companion **307** (cite only)
- PackageEnv **954** (untouched this TERM)
- Evidence **795** (untouched this TERM)
- EvidenceLater **386** (PE45..PE70 + SurfaceOk fold; untouched this TERM)
- FixturesS5 **990**
- FixturesLater **571** (S17..S24)
- systems-host **338**

---

## Inventory of next seed after ErasureSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.ErasureSubsetRebuild` | `SystemsLean.ExtractSubsetRebuild` in `HostModuleCheckSeeds.lean` (line 446 after 445) and `HostImportGraphSeeds.lean` (line 412 after 411) |
| Existing `HostModuleCheckErasureSubsetRebuildTerm.lean` | **yes** (308; this TERM just landed) |
| Existing PE71 / S25 / `hostModuleCheckGoodPackageEnvS25Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckComposeSubsetRebuildTermSurfaceOk`; does **not** yet fold `hostModuleCheckErasureSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | `packageBodyImportsCompilePathErasure` **exists** (PackageEnv line 340). Soft J2 for the next PE is CompilePath-only (no EmitRebuild farm; do not clone ErasureSubsetEmit PE). |
| Living ErasureSubsetRebuild claims | residual-free **false**; complete **false**; dialect living `erasureSubsetRebuildSelfApplyOk`; wrote-expected = self-apply && erasureSubsetEmitWroteExpected; ready includes `!erasureSubsetRebuildWithoutLakeFinishedClaimed`. This unit is rebuild / self-apply, **not** emit. |
| Living ready helper on TERM companion | `hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText` **exists**; `checkErasureSubsetRebuildTermDialect` **exists** |
| Earlier units through ComposeSubsetRebuild | TERM + package-env both landed |
| ErasureSubsetRebuild | TERM landed; PE twin **missing** |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for ErasureSubsetRebuild** (PE71 / S25).
Walking ExtractSubsetRebuild TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM, PE70,
ComposeSubsetRebuild TERM, or PE69.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePath-only (`packageBodyImportsCompilePathErasure`; no emit-module farm).
Do **not** invent an EmitRebuild farm. Do **not** clone ErasureSubsetEmit PE.

---

## Why Package-env for ErasureSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | ErasureSubsetRebuild now has TERM dual-ok **65** / harness **119** |
| PE twin for that unit | **missing** (package-env still through PE70 / S24) |
| Next seed ExtractSubsetRebuild | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for ErasureSubsetRebuild **done**; Package-env for ErasureSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE70 plus TERM through ErasureSubsetRebuild; pin still false); two-target table row 44 done / row 45 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for ErasureSubsetRebuild. Fence `/implement --effort 2 Package-env for ErasureSubsetRebuild`. Did not re-queue this TERM, PE70, ComposeSubsetRebuild TERM, or PE69. Did not open ExtractSubsetRebuild TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-erasure-subsetrebuild-term-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-esr-term-lockstep.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE70 + TERM through ErasureSubsetRebuild; pin still false; next named meet-path is Package-env for ErasureSubsetRebuild |
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
| Package-env for ProgramSubsetRebuild | **done** | PE68 / S22 |
| Term-surface for GraphSubsetRebuild | **done** | harness **117**; TERM **63**; companion **306**; pin still false |
| Package-env for GraphSubsetRebuild | **done** | PE69 / S23; FixturesS5 990 / FixturesLater 502 / PackageEnv 940 after long-file split / Evidence 793 / EvidenceLater 373 |
| Term-surface for ComposeSubsetRebuild | **done** | harness **118**; TERM **64**; companion **307**; pin still false; Accepts 992; LoadOk 914 |
| Package-env for ComposeSubsetRebuild | **done** | PE70 / S24; FixturesS5 990 / FixturesLater 571 / PackageEnv 954 / Evidence 795 / EvidenceLater 386 |
| Term-surface for ErasureSubsetRebuild | **done** | harness **119**; TERM **65**; companion **308**; pin still false; Accepts 993; LoadOk 914 |
| Package-env for ErasureSubsetRebuild | **open** | Highest-value next; clone ComposeSubsetRebuild PE; PE71 / S25; pin stays false |
| Term-surface for ExtractSubsetRebuild | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for ErasureSubsetRebuild**.

Expected PE land: harness stays **119**; TERM stays **65**; E-good S25 = S24 ++
ErasureSubsetRebuild using `hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText`;
dialect S25 after S24 ComposeSubsetRebuild; Soft J5
`checkErasureSubsetRebuildTermDialect` at package scope; Soft J2 CompilePath-only
(`packageBodyImportsCompilePathErasure`; honest; no EmitRebuild farm);
`packageEnvTermSurfaceOk` folds
`hostModuleCheckErasureSubsetRebuildTermSurfaceOk`; later-fold helper
covers PE45..PE71 after the land.

---

## Evidence later-fold note

Evidence is **795** (PE1..PE44 plus combined Ok). EvidenceLater is **386**
(later-fold PE45..PE70). PE71 **must append to EvidenceLater**, not grow
Evidence. FixturesS5 is **990**; append S25 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (571), not FixturesS5.
FixturesLater **571** has headroom for S25. PackageEnv is **954**;
long-file split PackageEnv if S25 dialect would pass 1000.
Accepts is **993** (cite only; do not grow Accepts this PE).

---

## Next Name contract (living)

Name: Package-env for ErasureSubsetRebuild

Goal: Add the package-env twin (PE71 / S25) so ErasureSubsetRebuild TERM is
visible at package scope.

Done when (checkable; clone ComposeSubsetRebuild PE):

- E-good S25 = S24 ++ ErasureSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText`).
- Dialect S25 after S24 ComposeSubsetRebuild.
- Soft J2 CompilePath-only (`packageBodyImportsCompilePathErasure`; no
  emit-module farm; this unit is rebuild / self-apply; do **not** invent an
  EmitRebuild farm; do **not** clone ErasureSubsetEmit PE).
- Soft J5 `checkErasureSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckErasureSubsetRebuildTermSurfaceOk`.
- Residual-free claimed true is ILL-TYPED-TERM; L0 package tokens still accept.
- Dialect body living `erasureSubsetRebuildSelfApplyOk` + wrote-expected, **not**
  `emitErasureReady`.
- Ready chain includes `!erasureSubsetRebuildWithoutLakeFinishedClaimed`.
- EvidenceLater gets PE71. Do **not** grow Evidence.
- S25 fixtures in FixturesLater, not FixturesS5 (990).
- PackageEnv stays under 1000 (now 954; long-file split if S25 dialect would
  pass 1000).
- Accepts 993 cite only.
- Harness stays **119**. TERM stays **65**.
- FullHostElaborateRemains stays **false**.
- TDD: red Evidence `packageEnvDialectRejectsOk_true` before S25 dialect, then
  green.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Term-surface for ExtractSubsetRebuild
(TERM for the next seed comes after this PE); rewrite of ErasureSubsetRebuild
TERM; re-queue PE70; re-queue PE69; re-queue ComposeSubsetRebuild TERM; re-queue
this TERM; cold compose init unroll; inventing a C fail-closed residual;
flipping residual-free / complete claimed; `emitErasureReady` as dialect clone;
growing Evidence (use EvidenceLater); growing FixturesS5.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. ErasureSubsetRebuild residual-free and complete claimed
stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 119 / 65 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE70 (PE70 / S24 landed; this PE is next as PE71 / S25; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 571; PackageEnv 954; Evidence 795; EvidenceLater 386 (all under 1000) |
| ErasureSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue this TERM, PE70, ComposeSubsetRebuild TERM, or PE69
- Opening ExtractSubsetRebuild TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Hygiene

`just hygiene`: **exit 0** (1524 files; 840 markdown). source-hygiene OK;
professional-tone OK.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for ErasureSubsetRebuild
```

Do not implement that product Lean in this lockstep.
