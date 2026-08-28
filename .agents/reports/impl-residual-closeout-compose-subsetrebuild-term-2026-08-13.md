# Implement report: residual closeout after Term-surface for ComposeSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
ComposeSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for ComposeSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE69 plus
TERM through ComposeSubsetRebuild; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue this TERM, GraphSubsetRebuild
TERM, PE69, or PE68. Do not open ErasureSubsetRebuild TERM now. Do not open
cold compose init unroll. Do not invent seed-wide 206, a FullHost flip, or a C
product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-compose-subsetrebuild-term-2026-08-13.md` | GREEN. Companion 307. Harness 117->118. TERM 63->64. LoadOk 914. LoadOkLaterTerm 140. Accepts 992. Dialect living `composeSubsetRebuildSelfApplyOk` not `emitComposeReady`. Four ILL twins. Residual-free/complete claimed stay false. Ready includes `!composeSubsetRebuildWithoutLakeFinishedClaimed`. TDD red exit 1 then green 14 jobs. Wire family 108 jobs. systems-host 337. |
| `/tmp/grok-1000/grok-impl-summary-csr-term.md` | Same GREEN |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-compose-subsetrebuild-term-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged |
| Clone closeout shape | `.agents/reports/impl-residual-closeout-graph-subsetrebuild-term-2026-08-13.md` |

Living product counts after this TERM (confirmed last-line `wc`; do not invent different numbers):

- Seed **206**
- Harness **118**
- TERM dual-ok **64**
- LoadOk **914**
- LoadOkLaterTerm **140**
- Accepts **992** (near 1000; note for later TERM companions)
- ComposeSubsetRebuild TERM companion **307**
- GraphSubsetRebuild TERM companion **306** (cite only)
- PackageEnv **940** (after long-file split at PE69; untouched this TERM)
- Evidence **793** (untouched this TERM)
- EvidenceLater **373** (PE45..PE69 + SurfaceOk fold; untouched this TERM)
- FixturesS5 **990**
- FixturesLater **502** (S17..S23)
- systems-host **337**

---

## Inventory of next seed after ComposeSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.ComposeSubsetRebuild` | `SystemsLean.ErasureSubsetRebuild` in `HostModuleCheckSeeds.lean` (line 445 after 444) and `HostImportGraphSeeds.lean` (line 411 after 410) |
| Existing `HostModuleCheckComposeSubsetRebuildTerm.lean` | **yes** (307; this TERM just landed) |
| Existing PE70 / S24 / `hostModuleCheckGoodPackageEnvS24Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckGraphSubsetRebuildTermSurfaceOk`; does **not** yet fold `hostModuleCheckComposeSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | `packageBodyImportsCompilePathCompose` **exists** (PackageEnv line 331). Soft J2 for the next PE is CompilePath-only (no EmitRebuild farm). |
| Living ComposeSubsetRebuild claims | residual-free **false**; complete **false**; dialect living `composeSubsetRebuildSelfApplyOk`; wrote-expected = self-apply && composeSubsetEmitWroteExpected; ready includes `!composeSubsetRebuildWithoutLakeFinishedClaimed`. This unit is rebuild / self-apply, **not** emit. |
| Living ready helper on TERM companion | `hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText` **exists**; `checkComposeSubsetRebuildTermDialect` **exists** |
| Earlier units through GraphSubsetRebuild | TERM + package-env both landed |
| ComposeSubsetRebuild | TERM landed; PE twin **missing** |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for ComposeSubsetRebuild** (PE70 / S24).
Walking ErasureSubsetRebuild TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM, GraphSubsetRebuild
TERM, PE69, or PE68.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePath-only (`packageBodyImportsCompilePathCompose`; no emit-module farm).
Do **not** invent an EmitRebuild farm.

---

## Why Package-env for ComposeSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | ComposeSubsetRebuild now has TERM dual-ok **64** / harness **118** |
| PE twin for that unit | **missing** (package-env still through PE69 / S23) |
| Next seed ErasureSubsetRebuild | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for ComposeSubsetRebuild **done**; Package-env for ComposeSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE69 plus TERM through ComposeSubsetRebuild; pin still false); two-target table row 42 done / row 43 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for ComposeSubsetRebuild. Fence `/implement --effort 2 Package-env for ComposeSubsetRebuild`. Did not re-queue this TERM, GraphSubsetRebuild TERM, PE69, or PE68. Did not open ErasureSubsetRebuild TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-compose-subsetrebuild-term-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-csr-term-lockstep.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

Did not fix `LoadOk.lean:280` comment nit (product Lean; out of scope).

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE69 + TERM through ComposeSubsetRebuild; pin still false; next named meet-path is Package-env for ComposeSubsetRebuild |
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
| Package-env for ComposeSubsetRebuild | **open** | Highest-value next; clone PE69; PE70 / S24; pin stays false |
| Term-surface for ErasureSubsetRebuild | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for ComposeSubsetRebuild**.

Expected PE land: harness stays **118**; TERM stays **64**; E-good S24 = S23 ++
ComposeSubsetRebuild using `hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText`;
dialect S24 after S23 GraphSubsetRebuild; Soft J5
`checkComposeSubsetRebuildTermDialect` at package scope; Soft J2 CompilePath-only
(`packageBodyImportsCompilePathCompose`; honest; no EmitRebuild farm);
`packageEnvTermSurfaceOk` folds
`hostModuleCheckComposeSubsetRebuildTermSurfaceOk`; later-fold helper
covers PE45..PE70 after the land.

---

## Evidence later-fold note

Evidence is **793** (PE1..PE44 plus combined Ok). EvidenceLater is **373**
(later-fold PE45..PE69). PE70 **must append to EvidenceLater**, not grow
Evidence. FixturesS5 is **990**; append S24 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (502), not FixturesS5.
FixturesLater **502** may need a long-file split if S24 would pass 1000.
PackageEnv is **940** (headroom). Accepts is **992**
(near 1000; later TERM companions must watch).

---

## Next Name contract (living)

Name: Package-env for ComposeSubsetRebuild

Goal: Add the package-env twin (PE70 / S24) so ComposeSubsetRebuild TERM is
visible at package scope.

Done when (checkable; clone PE69):

- E-good S24 = S23 ++ ComposeSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText`).
- Dialect S24 after S23 GraphSubsetRebuild.
- Soft J2 CompilePath-only (`packageBodyImportsCompilePathCompose`; no
  emit-module farm; this unit is rebuild / self-apply; do **not** invent an
  EmitRebuild farm).
- Soft J5 `checkComposeSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckComposeSubsetRebuildTermSurfaceOk`.
- Residual-free claimed true is ILL-TYPED-TERM; L0 package tokens still accept.
- Dialect body living `composeSubsetRebuildSelfApplyOk` + wrote-expected, **not**
  `emitComposeReady`.
- Ready chain includes `!composeSubsetRebuildWithoutLakeFinishedClaimed`.
- EvidenceLater gets PE70. Do **not** grow Evidence.
- S24 fixtures in FixturesLater, not FixturesS5 (990).
- PackageEnv stays under 1000 (now 940; headroom).
- FixturesLater 502 may need a long-file split if S24 would pass 1000.
- Harness stays **118**. TERM stays **64**.
- FullHostElaborateRemains stays **false**.
- TDD: red Evidence `packageEnvDialectRejectsOk_true` before S24 dialect, then
  green.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Term-surface for ErasureSubsetRebuild
(TERM for the next seed comes after this PE); rewrite of ComposeSubsetRebuild
TERM; re-queue PE69; re-queue PE68; re-queue GraphSubsetRebuild TERM; re-queue
this TERM; cold compose init unroll; inventing a C fail-closed residual;
flipping residual-free / complete claimed; `emitComposeReady` as dialect clone;
growing Evidence (use EvidenceLater); growing FixturesS5.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. ComposeSubsetRebuild residual-free and complete claimed
stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 118 / 64 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE69 (PE69 / S23 landed; this PE is next as PE70 / S24; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 502; PackageEnv 940; Evidence 793; EvidenceLater 373 (all under 1000) |
| ComposeSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue this TERM, GraphSubsetRebuild TERM, PE69, or PE68
- Opening ErasureSubsetRebuild TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean
- Fixing LoadOk.lean:280 comment nit

---

## Hygiene

`just hygiene`: **exit 0** (1513 files; 830 markdown). source-hygiene OK;
professional-tone OK. First pass failed on this report (banned token);
mopped to "after long-file split". Then green.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for ComposeSubsetRebuild
```

Do not implement that product Lean in this lockstep.
