# Implement report: residual closeout after Package-env for ErasureSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). `just hygiene` run after this report.

---

## Goal

Update living residual so the queue matches sibling evidence. Package-env for
ErasureSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Inventory the next seed after ErasureSubsetRebuild. Open the honest
next Name **Term-surface for ExtractSubsetRebuild**. Full host package elaborate
meet stays **done partial** (inventory plus PE43..PE71 plus TERM through
ErasureSubsetRebuild; pin still false). Do not flip `FullHostElaborateRemains`.
Do not re-queue PE71, ErasureSubsetRebuild TERM, PE70, or ComposeSubsetRebuild
TERM. Do not open cold compose init unroll. Do not invent seed-wide 206, a
FullHost flip, or a C product Name. Do not walk ExtractSubsetRebuild package-env
before its TERM exists.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-package-env-erasure-subsetrebuild-2026-08-13.md` | GREEN. PE71 residual-free reject twin plus E-good S25 plus dialect S25. S25 = S24 ++ ErasureSubsetRebuild using living `hostModuleCheckGoodErasureSubsetRebuildReadyMultilineText`. Soft J2 CompilePath-only (`packageBodyImportsCompilePathErasure`; no EmitRebuild farm). Soft J5 `checkErasureSubsetRebuildTermDialect`. Dialect body living `erasureSubsetRebuildSelfApplyOk` + wrote-expected, **not** `emitErasureReady`. Ready includes `!erasureSubsetRebuildWithoutLakeFinishedClaimed`. EvidenceLater PE45..PE71. Evidence 797 (two fold lines only; no PE71 case defs). FixturesLater 641 (S17..S25). FixturesS5 990. PackageEnv 967 (no long-file split this slice). ErasureSubsetRebuild TERM companion 308 cite only. Harness **119**. TERM **65**. Seed **206**. FullHostElaborateRemains false. TDD red exit 1 then green 88 jobs. |
| `/tmp/grok-1000/grok-impl-summary-pe-esr.md` | Same GREEN |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-package-env-erasure-subsetrebuild-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged (`python3 ~/.agents/skills/implement/scripts/memory.py update < /tmp/grok-1000/grok-mem-pe-esr.json`) |
| `.agents/reports/impl-residual-closeout-erasure-subsetrebuild-term-2026-08-13.md` | Prior TERM lockstep (named this PE as next; that Name is now product-done) |
| `.agents/reports/impl-residual-closeout-package-env-compose-subsetrebuild-2026-08-13.md` | Prior PE lockstep clone. **Clone this PE-closeout shape.** |

Living product counts after PE71 (confirmed last-line `wc`; do not invent different numbers):

- Seed **206**
- Harness **119**
- TERM dual-ok **65**
- LoadOk **914**
- LoadOkLaterTerm **143**
- Accepts **993** (near Sub-1-KLOC; next TERM that grows Accepts may need a long-file split)
- ErasureSubsetRebuild TERM companion **308** (cite only in PE)
- PackageEnv **967**
- Evidence **797** (PE1..PE44 plus combined Ok)
- EvidenceLater **399** (later-fold PE45..PE71 + SurfaceOk fold)
- FixturesS5 **990**
- FixturesLater **641** (S17..S25)
- systems-host **338** paths

---

## Inventory of next seed after ErasureSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.ErasureSubsetRebuild` in `HostModuleCheckSeeds.lean` | `SystemsLean.ExtractSubsetRebuild` (line 446 after 445) |
| Seed after `SystemsLean.ErasureSubsetRebuild` in `HostImportGraphSeeds.lean` | `SystemsLean.ExtractSubsetRebuild` (line 412 after 411) |
| Existing `HostModuleCheckErasureSubsetRebuildTerm.lean` | **yes** (308; cite only in PE71) |
| Existing `HostModuleCheckExtractSubsetRebuildTerm.lean` | **none** |
| PE71 / S25 / `hostModuleCheckGoodPackageEnvS25Text` | **yes** (just landed) |
| `packageEnvTermSurfaceOk` fold | already folds `hostModuleCheckErasureSubsetRebuildTermSurfaceOk` (PE71 landed; living fold in EvidenceLater) |
| ExtractSubsetRebuild four-claim TERM twin shape | residual-free claimed **false**; complete claimed **false**; without-lake claimed **false**; living `extractSubsetRebuildSelfApplyOk` / `extractSubsetRebuildWroteExpected` / `extractSubsetRebuildReady` fold. This unit is **rebuild / self-apply, not emit**. Ready includes `!extractSubsetRebuildWithoutLakeFinishedClaimed`. Wrote-expected is `self-apply && extractSubsetEmitWroteExpected`. |
| `emitExtractReady` as dialect clone | **wrong** clone. Clone ErasureSubsetRebuild TERM / ComposeSubsetRebuild TERM, not PE71, and not an emit-unit TERM. |
| Seed / harness / TERM | **206** / **119** / **65** unchanged by this docs slice |
| Earlier units through ErasureSubsetRebuild | TERM + package-env both landed |

Honest next Open is **Term-surface for ExtractSubsetRebuild**. Walking
ExtractSubsetRebuild package-env now would skip TERM for ExtractSubsetRebuild.
This is not a re-queue of PE71, ErasureSubsetRebuild TERM, PE70, or
ComposeSubsetRebuild TERM.

---

## Why Term-surface for ExtractSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| Next seed after ErasureSubsetRebuild | `SystemsLean.ExtractSubsetRebuild` |
| Existing `HostModuleCheck*Term.lean` for that unit | **none** |
| Earlier units through ErasureSubsetRebuild | TERM + package-env both landed |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |
| Package-env for ExtractSubsetRebuild | not this Open (PE twin comes after this TERM) |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Package-env for ErasureSubsetRebuild **done**; Term-surface for ExtractSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE71 plus TERM through ErasureSubsetRebuild; pin still false); two-target table row 45 done / row 46 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Term-surface for ExtractSubsetRebuild. Fence `/implement --effort 2 Term-surface for ExtractSubsetRebuild`. Did not re-queue PE71 or ErasureSubsetRebuild TERM. Did not re-queue PE70 or ComposeSubsetRebuild TERM. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-package-env-erasure-subsetrebuild-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-pe-esr-lockstep.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

No durable plan under `.agents/plans/` still named PE71 as the living Open.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE71 + TERM through ErasureSubsetRebuild; pin still false; next named meet-path is ExtractSubsetRebuild TERM |
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
| Term-surface for ErasureSubsetRebuild | **done** | harness **119**; TERM **65**; companion **308**; pin still false; Accepts 993; LoadOk 914 |
| Package-env for ErasureSubsetRebuild | **done** | PE71 / S25; FixturesS5 990 / FixturesLater 641 / PackageEnv 967 / Evidence 797 / EvidenceLater 399 |
| Term-surface for ExtractSubsetRebuild | **open** | Highest-value next; clone ErasureSubsetRebuild TERM; rebuild / self-apply; pin stays false |
| Package-env for ExtractSubsetRebuild | **not this Open** | PE twin comes after this TERM |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Term-surface for ExtractSubsetRebuild**.

Expected TERM land: harness **119 -> 120**; TERM dual-ok **65 -> 66**; LoadOk
later-fold stays **914** / under 1000; do **not** edit PackageEnv / FixturesS5 /
FixturesLater / Evidence / EvidenceLater; residual-free and complete claimed stay
false; ready multi-line via `extractSubsetRebuildReadyTermBody` (product fold is
`extractSubsetRebuildReady`). Dialect is living `extractSubsetRebuildSelfApplyOk`
+ wrote-expected, **not** `emitExtractReady`. Accepts **993** near Sub-1-KLOC
(long-file split Accepts first if this TERM would pass 1000).

---

## Next Name contract (living)

Name: Term-surface for ExtractSubsetRebuild

Goal: Add unit TERM accept + reject twins for ExtractSubsetRebuild, the next real
host seed after ErasureSubsetRebuild.

Done when (checkable):

- Confirm living ExtractSubsetRebuild claims on disk before clone: residual-free
  claimed **false**; complete claimed **false**; living
  `extractSubsetRebuildSelfApplyOk`; wrote-expected is `self-apply &&
  extractSubsetEmitWroteExpected`; ready includes
  `!extractSubsetRebuildWithoutLakeFinishedClaimed`; without-lake claimed
  **false**.
- New `HostModuleCheckExtractSubsetRebuildTerm` companion cloned from
  `HostModuleCheckErasureSubsetRebuildTerm` under 1000 lines.
- LoadOk later-fold folds ExtractSubsetRebuild SurfaceOk. LoadOk stays **914** /
  under 1000.
- LoadOk later-fold comments extend through ExtractSubsetRebuild when this TERM
  writer lands.
- Do **not** grow Evidence / PackageEnv / Fixtures (Evidence **797**;
  EvidenceLater **399**; PackageEnv **967**; FixturesS5 **990**; FixturesLater
  **641**).
- RealModule `refineExtractSubsetRebuildWithTermSurface`.
- Accepts uses TERM text not L0 FixtureTextsLater stub. Accepts stays under 1000;
  long-file split Accepts first if this TERM would pass 1000 (now **993**).
- Four ILL twins: residual-free claimed true
  (`extractSubsetRebuildResidualFreeClaimed`); dialect / self-apply body as
  living product fold (`extractSubsetRebuildSelfApplyOk` /
  `extractSubsetRebuildWroteExpected`); ready body true
  (`extractSubsetRebuildReady`); complete claimed true
  (`extractSubsetRebuildProductSelfHostCompleteClaimed`).
- L0 accept + dialect reject (`ILL-TYPED-TERM`).
- This unit is rebuild / self-apply, not emit.
- Dialect body living `extractSubsetRebuildSelfApplyOk` fold, **not**
  `emitExtractReady`.
- Residual-free and complete claimed stay false.
- Ready multi-line via `extractSubsetRebuildReadyTermBody` (same collapse as
  ErasureSubsetRebuild; product fold is `extractSubsetRebuildReady`; includes
  `!extractSubsetRebuildWithoutLakeFinishedClaimed`).
- Soft J2 / ShrinkTermOk scope **ExtractSubsetRebuild-only**.
- Harness **119 -> 120**. TERM dual-ok **65 -> 66**.
- FullHostElaborateRemains stays **false**.
- Do **not** edit PackageEnv / FixturesS5 / FixturesLater / Evidence /
  EvidenceLater.
- TDD: red SurfaceOk := false then green same theorem.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Package-env for ExtractSubsetRebuild (PE
twin comes after this TERM); rewrite of ErasureSubsetRebuild TERM; re-queue PE71;
re-queue PE70; re-queue ErasureSubsetRebuild TERM; re-queue ComposeSubsetRebuild
TERM; cold compose init unroll; inventing a C fail-closed residual; flipping
residual-free / complete claimed; `emitExtractReady` as dialect clone;
EmitRebuild farm.

Paths: new `HostModuleCheckExtractSubsetRebuildTerm.lean`; LoadOk later-fold;
RealModule; Accepts; HostModuleCheck; SystemsLean; HostResidualShrink family.
Do not grow past Sub-1-KLOC.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`
(still `false` in `HostResidualShrink.lean`). No FULLHOST_FLIP. No free /
complete / PROVABLY / DominanceClaimed / band FullBackend edits.
ErasureSubsetRebuild residual-free and complete claimed stay false.
ExtractSubsetRebuild residual-free and complete claimed stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 119 / 65 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43/PE44 plus PE45..PE71 (PE71 / S25 landed; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 641; PackageEnv 967; Evidence 797; EvidenceLater 399 (all under 1000) |
| MultSubsetEmit residual-free / complete claimed | **false** |
| MultSubsetRebuild residual-free / complete claimed | **false** |
| LinearSubsetRebuild residual-free / complete claimed | **false** |
| TypesSubsetRebuild residual-free / complete claimed | **false** |
| ProgramSubsetRebuild residual-free / complete claimed | **false** |
| GraphSubsetRebuild residual-free / complete claimed | **false** |
| ComposeSubsetRebuild residual-free / complete claimed | **false** |
| ErasureSubsetRebuild residual-free / complete claimed | **false** |
| ExtractSubsetRebuild residual-free / complete claimed | **false** |
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
- Re-queue PE71, ErasureSubsetRebuild TERM, PE70, or ComposeSubsetRebuild TERM
- Opening Package-env for ExtractSubsetRebuild now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Writer note

This lockstep is docs only. The next ExtractSubsetRebuild TERM implementer after
this lockstep must be **fresh**, not PE71 writer `019ffb40`, not
ErasureSubsetRebuild TERM writer `019ffb29`, not `019ffb4a`.

---

## Hygiene

This lockstep scanned touched novel markdown against the professional-tone
banned list (`nix/professional-tone.nix`: long-file split / no profanity) and
checked ASCII plus no trailing whitespace on WATCHER, this report, and the
`/tmp` summary. Sibling PE71 general review already says **long-file
split** (no mop needed). No product Lean. Parent or mop should still run
live `just hygiene` on the worktree to print the file/markdown counts.

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Term-surface for ExtractSubsetRebuild
```

Do not implement that product Lean in this lockstep.
