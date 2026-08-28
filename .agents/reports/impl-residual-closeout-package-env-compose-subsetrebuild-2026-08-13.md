# Implement report: residual closeout after Package-env for ComposeSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Package-env for
ComposeSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Inventory the next seed after ComposeSubsetRebuild. Open the honest
next Name **Term-surface for ErasureSubsetRebuild**. Full host package elaborate
meet stays **done partial** (inventory plus PE43..PE70 plus TERM through
ComposeSubsetRebuild; pin still false). Do not flip `FullHostElaborateRemains`.
Do not re-queue PE70, ComposeSubsetRebuild TERM, PE69, or GraphSubsetRebuild
TERM. Do not open cold compose init unroll. Do not invent seed-wide 206, a
FullHost flip, or a C product Name. Do not walk ErasureSubsetRebuild package-env
before its TERM exists.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-package-env-compose-subsetrebuild-2026-08-13.md` | GREEN. PE70 residual-free reject twin plus E-good S24 plus dialect S24. S24 = S23 ++ ComposeSubsetRebuild using living `hostModuleCheckGoodComposeSubsetRebuildReadyMultilineText`. Soft J2 CompilePath-only (`packageBodyImportsCompilePathCompose`; no EmitRebuild farm). Soft J5 `checkComposeSubsetRebuildTermDialect`. Dialect body living `composeSubsetRebuildSelfApplyOk` + wrote-expected, **not** `emitComposeReady`. Ready includes `!composeSubsetRebuildWithoutLakeFinishedClaimed`. EvidenceLater PE45..PE70. Evidence 795 (two fold lines only; no PE70 case defs). FixturesLater 571 (S17..S24). FixturesS5 990. PackageEnv 954 (no long-file split this slice). ComposeSubsetRebuild TERM companion 307 cite only. Harness **118**. TERM **64**. Seed **206**. FullHostElaborateRemains false. TDD red exit 1 then green 87 jobs. |
| `/tmp/grok-1000/grok-impl-summary-pe-csr.md` | Same GREEN |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-package-env-compose-subsetrebuild-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged (`python3 ~/.agents/skills/implement/scripts/memory.py update < /tmp/grok-1000/grok-mem-pe-csr.json`) |
| `.agents/reports/impl-residual-closeout-compose-subsetrebuild-term-2026-08-13.md` | Prior TERM lockstep (named this PE as next; that Name is now product-done) |
| `.agents/reports/impl-residual-closeout-package-env-graph-subsetrebuild-2026-08-13.md` | Prior PE lockstep clone. **Clone this PE-closeout shape.** |

Living product counts after PE70 (confirmed last-line `wc`; do not invent different numbers):

- Seed **206**
- Harness **118**
- TERM dual-ok **64**
- LoadOk **914**
- LoadOkLaterTerm **140**
- Accepts **992** (near Sub-1-KLOC; next TERM that grows Accepts may need a long-file split)
- ComposeSubsetRebuild TERM companion **307** (cite only in PE)
- PackageEnv **954**
- Evidence **795** (PE1..PE44 plus combined Ok)
- EvidenceLater **386** (later-fold PE45..PE70 + SurfaceOk fold)
- FixturesS5 **990**
- FixturesLater **571** (S17..S24)
- systems-host **337** paths

---

## Inventory of next seed after ComposeSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.ComposeSubsetRebuild` in `HostModuleCheckSeeds.lean` | `SystemsLean.ErasureSubsetRebuild` (line 445 after 444) |
| Seed after `SystemsLean.ComposeSubsetRebuild` in `HostImportGraphSeeds.lean` | `SystemsLean.ErasureSubsetRebuild` (line 411 after 410) |
| Existing `HostModuleCheckComposeSubsetRebuildTerm.lean` | **yes** (307; cite only in PE70) |
| Existing `HostModuleCheckErasureSubsetRebuildTerm.lean` | **none** |
| PE70 / S24 / `hostModuleCheckGoodPackageEnvS24Text` | **yes** (just landed) |
| `packageEnvTermSurfaceOk` fold | already folds `hostModuleCheckComposeSubsetRebuildTermSurfaceOk` (PE70 landed; living fold in EvidenceLater) |
| ErasureSubsetRebuild four-claim TERM twin shape | residual-free claimed **false**; complete claimed **false**; living `erasureSubsetRebuildSelfApplyOk` / `erasureSubsetRebuildWroteExpected` / `erasureSubsetRebuildReady` fold. This unit is **rebuild / self-apply, not emit**. Ready includes `!erasureSubsetRebuildWithoutLakeFinishedClaimed`. Wrote-expected is `self-apply && erasureSubsetEmitWroteExpected`. |
| `emitErasureReady` as dialect clone | **wrong** clone. Clone ComposeSubsetRebuild TERM, not PE70, and not an emit-unit TERM. |
| Seed / harness / TERM | **206** / **118** / **64** unchanged by this docs slice |
| Earlier units through ComposeSubsetRebuild | TERM + package-env both landed |

Honest next Open is **Term-surface for ErasureSubsetRebuild**. Walking
ErasureSubsetRebuild package-env now would skip TERM for ErasureSubsetRebuild.
This is not a re-queue of PE70, ComposeSubsetRebuild TERM, PE69, or
GraphSubsetRebuild TERM.

---

## Why Term-surface for ErasureSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| Next seed after ComposeSubsetRebuild | `SystemsLean.ErasureSubsetRebuild` |
| Existing `HostModuleCheck*Term.lean` for that unit | **none** |
| Earlier units through ComposeSubsetRebuild | TERM + package-env both landed |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |
| Package-env for ErasureSubsetRebuild | not this Open (PE twin comes after this TERM) |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Package-env for ComposeSubsetRebuild **done**; Term-surface for ErasureSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE70 plus TERM through ComposeSubsetRebuild; pin still false); two-target table row 43 done / row 44 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Term-surface for ErasureSubsetRebuild. Fence `/implement --effort 2 Term-surface for ErasureSubsetRebuild`. Did not re-queue PE70 or ComposeSubsetRebuild TERM. Did not re-queue PE69 or GraphSubsetRebuild TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-package-env-compose-subsetrebuild-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-pe-csr-lockstep.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

No durable plan under `.agents/plans/` still named PE70 as the living Open.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE70 + TERM through ComposeSubsetRebuild; pin still false; next named meet-path is ErasureSubsetRebuild TERM |
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
| Term-surface for MultSubsetEmit | **done** | harness 112 at land; TERM 58 at land |
| Package-env for MultSubsetEmit | **done** | PE64 / S18 |
| Term-surface for MultSubsetRebuild | **done** | harness 113 at land; TERM 59 at land |
| Package-env for MultSubsetRebuild | **done** | PE65 / S19 |
| Term-surface for LinearSubsetRebuild | **done** | harness **114**; TERM **60**; companion **303**; pin still false |
| Package-env for LinearSubsetRebuild | **done** | PE66 / S20 |
| Term-surface for TypesSubsetRebuild | **done** | harness **115**; TERM **61**; companion **304**; pin still false |
| Package-env for TypesSubsetRebuild | **done** | PE67 / S21 |
| Term-surface for ProgramSubsetRebuild | **done** | harness **116**; TERM **62**; companion **305**; pin still false |
| Package-env for ProgramSubsetRebuild | **done** | PE68 / S22 |
| Term-surface for GraphSubsetRebuild | **done** | harness **117**; TERM **63**; companion **306**; pin still false |
| Package-env for GraphSubsetRebuild | **done** | PE69 / S23 |
| Term-surface for ComposeSubsetRebuild | **done** | harness **118**; TERM **64**; companion **307**; pin still false; Accepts 992; LoadOk 914 |
| Package-env for ComposeSubsetRebuild | **done** | PE70 / S24; FixturesS5 990 / FixturesLater 571 / PackageEnv 954 / Evidence 795 / EvidenceLater 386 |
| Term-surface for ErasureSubsetRebuild | **open** | Highest-value next; clone ComposeSubsetRebuild TERM; rebuild / self-apply; pin stays false |
| Package-env for ErasureSubsetRebuild | **not this Open** | PE twin comes after this TERM |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Term-surface for ErasureSubsetRebuild**.

Expected TERM land: harness **118 -> 119**; TERM dual-ok **64 -> 65**; LoadOk
later-fold stays **914** / under 1000; do **not** edit PackageEnv / FixturesS5 /
FixturesLater / Evidence / EvidenceLater; residual-free and complete claimed stay
false; ready multi-line via `erasureSubsetRebuildReadyTermBody` (product fold is
`erasureSubsetRebuildReady`). Dialect is living `erasureSubsetRebuildSelfApplyOk`
+ wrote-expected, **not** `emitErasureReady`. Accepts **992** near Sub-1-KLOC
(long-file split Accepts first if this TERM would pass 1000).

---

## Next Name contract (living)

Name: Term-surface for ErasureSubsetRebuild

Goal: Add unit TERM accept + reject twins for ErasureSubsetRebuild, the next real
host seed after ComposeSubsetRebuild.

Done when (checkable):

- New `HostModuleCheckErasureSubsetRebuildTerm` companion cloned from
  `HostModuleCheckComposeSubsetRebuildTerm` under 1000 lines.
- LoadOk later-fold folds ErasureSubsetRebuild SurfaceOk. LoadOk stays **914** /
  under 1000.
- LoadOk later-fold comments extend through ErasureSubsetRebuild when this TERM
  writer lands.
- Do **not** grow Evidence / PackageEnv / Fixtures (Evidence **795**;
  EvidenceLater **386**; PackageEnv **954**; FixturesS5 **990**; FixturesLater
  **571**).
- RealModule `refineErasureSubsetRebuildWithTermSurface`.
- Accepts uses TERM text not L0 FixtureTextsLater stub. Accepts stays under 1000;
  long-file split Accepts first if this TERM would pass 1000 (now **992**).
- Four ILL twins: residual-free claimed true
  (`erasureSubsetRebuildResidualFreeClaimed`); dialect / self-apply body as
  living product fold (`erasureSubsetRebuildSelfApplyOk` /
  `erasureSubsetRebuildWroteExpected`); ready body true
  (`erasureSubsetRebuildReady`); complete claimed true
  (`erasureSubsetRebuildProductSelfHostCompleteClaimed`).
- L0 accept + dialect reject (`ILL-TYPED-TERM`).
- This unit is rebuild / self-apply, not emit.
- Dialect body living `erasureSubsetRebuildSelfApplyOk` fold, **not**
  `emitErasureReady`.
- Residual-free and complete claimed stay false.
- Ready multi-line via `erasureSubsetRebuildReadyTermBody` (same collapse as
  ComposeSubsetRebuild; product fold is `erasureSubsetRebuildReady`; includes
  `!erasureSubsetRebuildWithoutLakeFinishedClaimed`).
- Soft J2 / ShrinkTermOk scope **ErasureSubsetRebuild-only**.
- Harness **118 -> 119**. TERM dual-ok **64 -> 65**.
- FullHostElaborateRemains stays **false**.
- Do **not** edit PackageEnv / FixturesS5 / FixturesLater / Evidence /
  EvidenceLater.
- TDD: red SurfaceOk := false then green same theorem.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Package-env for ErasureSubsetRebuild (PE
twin comes after this TERM); rewrite of ComposeSubsetRebuild TERM; re-queue PE70;
re-queue PE69; re-queue ComposeSubsetRebuild TERM; re-queue GraphSubsetRebuild
TERM; cold compose init unroll; inventing a C fail-closed residual; flipping
residual-free / complete claimed; `emitErasureReady` as dialect clone;
EmitRebuild farm.

Paths: new `HostModuleCheckErasureSubsetRebuildTerm.lean`; LoadOk later-fold;
RealModule; Accepts; HostModuleCheck; SystemsLean; HostResidualShrink family.
Do not grow past Sub-1-KLOC.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`
(still `false` in `HostResidualShrink.lean`). No FULLHOST_FLIP. No free /
complete / PROVABLY / DominanceClaimed / band FullBackend edits.
ComposeSubsetRebuild residual-free and complete claimed stay false.
ErasureSubsetRebuild residual-free and complete claimed stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 118 / 64 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43/PE44 plus PE45..PE70 (PE70 / S24 landed; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 571; PackageEnv 954; Evidence 795; EvidenceLater 386 (all under 1000) |
| MultSubsetEmit residual-free / complete claimed | **false** |
| MultSubsetRebuild residual-free / complete claimed | **false** |
| LinearSubsetRebuild residual-free / complete claimed | **false** |
| TypesSubsetRebuild residual-free / complete claimed | **false** |
| ProgramSubsetRebuild residual-free / complete claimed | **false** |
| GraphSubsetRebuild residual-free / complete claimed | **false** |
| ComposeSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue PE70, ComposeSubsetRebuild TERM, PE69, or GraphSubsetRebuild TERM
- Opening Package-env for ErasureSubsetRebuild now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Writer note

This lockstep is docs only. The next ErasureSubsetRebuild TERM implementer after
this lockstep must be **fresh**, not PE70 writer `019ffb10`, not
ComposeSubsetRebuild TERM writer `019ffaf7`.

---

## Hygiene

`just hygiene`: **exit 0** (1518 files; 835 markdown). source-hygiene OK;
professional-tone OK. First pass failed on sibling review report banned module-split
slang (four lines); mopped those to **long-file split** in that review (trashed;
see `.agents/reports/impl-package-env-compose-subsetrebuild-2026-08-13.md`).
Extra novel markdown is this closeout plus residual/handoff already in
tree. `/tmp` summary is outside the tree.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Term-surface for ErasureSubsetRebuild
```

Do not implement that product Lean in this lockstep.
