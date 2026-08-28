# Implement report: residual closeout after Term-surface for ExtractSubsetRebuild

**Date:** 2026-08-13
**Repo:** `/home/hunter/Projects/ai/iso`
**Kind:** residual / WATCHER / handoff / RESIDUAL.md lockstep only. No product Lean/C/Nix. No claim-bool flips.

ASCII only. Plain American English.

**Status:** **GREEN** (docs lockstep). Next Open Name is **Package-env for ExtractSubsetRebuild**. `just hygiene` exit 0.

---

## Goal

Update living residual so the queue matches sibling evidence. Term-surface for
ExtractSubsetRebuild closed GREEN with mop GREEN and reviews at 0 open. Mark that
Name **done**. Open next Name **Package-env for ExtractSubsetRebuild**. Full host
package elaborate meet stays **done partial** (inventory plus PE43..PE71 plus
TERM through ExtractSubsetRebuild; pin still false). Do not flip
`FullHostElaborateRemains`. Do not re-queue this TERM, PE71, ErasureSubsetRebuild
TERM, or PE70. Do not open the next seed's TERM now. Do not open
cold compose init unroll. Do not invent seed-wide 206, a FullHost flip, or a C
product Name.

---

## Evidence trusted (not re-researched)

| Report | Outcome |
|--------|---------|
| `.agents/reports/impl-extract-subsetrebuild-term-2026-08-13.md` | GREEN. Companion 309. Harness 119->120. TERM 65->66. LoadOk 914. LoadOkLaterTerm 145. Accepts 994. Dialect living `extractSubsetRebuildSelfApplyOk` not `emitExtractReady`. Four ILL twins. Residual-free/complete/without-Lake claimed stay false. Ready includes `!extractSubsetRebuildWithoutLakeFinishedClaimed`. TDD red exit 1 (12 jobs) then green 14 jobs. Wire family 110 jobs. systems-host 339. |
| `/tmp/grok-1000/grok-impl-summary-xsr-term.md` | Same GREEN |
| Review/mop (trashed; verdict on impl row) | GREEN / APPROVE 0. See `impl-extract-subsetrebuild-term-2026-08-13.md`. |
| Memory | flushed 0 new / 0 merged (`python3 ~/.agents/skills/implement/scripts/memory.py update` via `/tmp/grok-1000/grok-mem-xsr-term.json`) |
| Clone closeout shape | `.agents/reports/impl-residual-closeout-erasure-subsetrebuild-term-2026-08-13.md` |

Living product counts after this TERM (confirmed last-line `wc`; do not invent different numbers):

- Seed **206**
- Harness **120**
- TERM dual-ok **66**
- LoadOk **914**
- LoadOkLaterTerm **145**
- Accepts **994** (cite only for the PE twin)
- ExtractSubsetRebuild TERM companion **309**
- ErasureSubsetRebuild TERM companion **308** (cite only)
- PackageEnv **967** (untouched this TERM)
- Evidence **797** (untouched this TERM)
- EvidenceLater **399** (PE45..PE71 + SurfaceOk fold; untouched this TERM)
- FixturesS5 **990**
- FixturesLater **641** (S17..S25)
- systems-host **339**

---

## Inventory of next seed after ExtractSubsetRebuild

Spot-checked (no product Lean logic edit):

| Check | Result |
|-------|--------|
| Seed after `SystemsLean.ExtractSubsetRebuild` | `SystemsLean.HostFront` in `HostModuleCheckSeeds.lean` (line 447 after 446) and `HostImportGraphSeeds.lean` (line 413 after 412) |
| Existing `HostModuleCheckExtractSubsetRebuildTerm.lean` | **yes** (309; this TERM just landed) |
| Existing PE72 / S26 / `hostModuleCheckGoodPackageEnvS26Text` | **none** |
| `packageEnvTermSurfaceOk` fold | ends at `hostModuleCheckErasureSubsetRebuildTermSurfaceOk`; does **not** yet fold `hostModuleCheckExtractSubsetRebuildTermSurfaceOk` |
| CompilePath rebuild import helper | `packageBodyImportsCompilePathExtract` **exists** (PackageEnv line 348). Soft J2 for the next PE is CompilePathExtract-only (no EmitRebuild farm; do not clone ExtractSubsetEmit PE). |
| Living ExtractSubsetRebuild claims | residual-free **false**; complete **false**; dialect living `extractSubsetRebuildSelfApplyOk`; wrote-expected = self-apply && extractSubsetEmitWroteExpected; ready includes `!extractSubsetRebuildWithoutLakeFinishedClaimed`. This unit is rebuild / self-apply, **not** emit. |
| Living ready helper on TERM companion | `hostModuleCheckGoodExtractSubsetRebuildReadyMultilineText` **exists**; `checkExtractSubsetRebuildTermDialect` **exists** |
| Earlier units through ErasureSubsetRebuild | TERM + package-env both landed |
| ExtractSubsetRebuild | TERM landed; PE twin **missing** |
| Established meet path | TERM first, then PE twin |

Honest next Open is **Package-env for ExtractSubsetRebuild** (PE72 / S26).
Walking HostFront TERM now would skip the PE twin for the unit
that just got TERM. This is not a re-queue of this TERM, PE71,
ErasureSubsetRebuild TERM, or PE70.

This unit is rebuild / self-apply, not emit. PE twin Soft J2 stays
CompilePathExtract-only (`packageBodyImportsCompilePathExtract`; no emit-module farm).
Do **not** invent an EmitRebuild farm. Do **not** clone ExtractSubsetEmit PE.
Do **not** copy `emitExtractReady`.

---

## Why Package-env for ExtractSubsetRebuild is the honest next

The established FullHost meet path is TERM first, then the package-env twin,
walking the real host seed in order.

| Check | Result |
|-------|--------|
| This TERM just landed | ExtractSubsetRebuild now has TERM dual-ok **66** / harness **120** |
| PE twin for that unit | **missing** (package-env still through PE71 / S25) |
| Next seed HostFront | has **no** TERM companion, and comes **after** this PE |
| Seed-wide 206 / mathlib / FullHost flip | not this Open |
| Cold compose init unroll | stays not open |
| C product-meaning Name | not invented |

---

## Paths touched

| Path | Change |
|------|--------|
| `RESIDUAL-systems.md` | Term-surface for ExtractSubsetRebuild **done**; Package-env for ExtractSubsetRebuild **open**; Full host meet stays **done partial** (inventory plus PE43..PE71 plus TERM through ExtractSubsetRebuild; pin still false); two-target table row 46 done / row 47 open; Done archive lockstep line; living tip + next-prompt |
| `RESIDUAL.md` | Join Open table + highest-value next + living tip same story |
| `WATCHER.md` | **IN PROGRESS** Package-env for ExtractSubsetRebuild. Fence `/implement --effort 2 Package-env for ExtractSubsetRebuild`. Did not re-queue this TERM, PE71, ErasureSubsetRebuild TERM, or PE70. Did not open Term-surface for HostFront. Did not open cold compose init unroll. |
| `doc/SESSION-HANDOFF.md` | Living tip / Active product residual / Next / Remaining; table rows; WATCHER tip |
| `.agents/reports/impl-residual-closeout-extract-subsetrebuild-term-2026-08-13.md` | This report |
| `/tmp/grok-1000/grok-impl-summary-xsr-term-lockstep.md` | Short summary for the parent |

No product Lean. No emit C. No just modules. No claim-bool flips.

`src/systems/host-partial-inventory.md` DualResidual harness snapshot was not
rewritten. Living counts stay in residual / WATCHER / handoff.

---

## Queue after lockstep

| Name | Status | Role |
|------|--------|------|
| Compose SSA / llvm-as / richer layout / link smoke / LLVM timing | **done** | already done |
| Full host package elaborate meet | **done partial** | Inventory + PE43..PE71 + TERM through ExtractSubsetRebuild; pin still false; next named meet-path is Package-env for ExtractSubsetRebuild |
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
| Term-surface for ErasureSubsetRebuild | **done** | harness **119** at land; TERM **65** at land; companion **308**; pin still false; Accepts 993; LoadOk 914 |
| Package-env for ErasureSubsetRebuild | **done** | PE71 / S25; FixturesS5 990 / FixturesLater 641 / PackageEnv 967 / Evidence 797 / EvidenceLater 399 |
| Term-surface for ExtractSubsetRebuild | **done** | harness **120**; TERM **66**; companion **309**; pin still false; Accepts 994; LoadOk 914; LoadOkLaterTerm 145 |
| Package-env for ExtractSubsetRebuild | **open** | Highest-value next; clone ErasureSubsetRebuild PE; PE72 / S26; pin stays false |
| Term-surface for HostFront | **not this Open** | next seed after this PE twin |
| Cold compose init unroll | **not open** | operator notes stay not open |

Highest-value next: **Package-env for ExtractSubsetRebuild**.

Expected PE land: harness stays **120**; TERM stays **66**; E-good S26 = S25 ++
ExtractSubsetRebuild using `hostModuleCheckGoodExtractSubsetRebuildReadyMultilineText`;
dialect S26 after S25 ErasureSubsetRebuild; Soft J5
`checkExtractSubsetRebuildTermDialect` at package scope; Soft J2 CompilePathExtract-only
(`packageBodyImportsCompilePathExtract`; honest; no EmitRebuild farm);
`packageEnvTermSurfaceOk` folds
`hostModuleCheckExtractSubsetRebuildTermSurfaceOk`; later-fold helper
covers PE45..PE72 after the land.

---

## Evidence later-fold note

Evidence is **797** (PE1..PE44 plus combined Ok). EvidenceLater is **399**
(later-fold PE45..PE71). PE72 **must append to EvidenceLater**, not grow
Evidence. FixturesS5 is **990**; append S26 fixtures to
`HostModuleCheckPackageEnvFixturesLater.lean` (641), not FixturesS5.
FixturesLater **641** has headroom for S26. PackageEnv is **967**;
long-file split PackageEnv if S26 dialect would pass 1000.
Accepts is **994** (cite only; do not grow Accepts this PE).

---

## Next Name contract (living)

Name: Package-env for ExtractSubsetRebuild

Goal: Add the package-env twin (PE72 / S26) so ExtractSubsetRebuild TERM is
visible at package scope.

Done when (checkable; clone ErasureSubsetRebuild PE):

- E-good S26 = S25 ++ ExtractSubsetRebuild using TERM multi-line ready helper
  (`hostModuleCheckGoodExtractSubsetRebuildReadyMultilineText`).
- Dialect S26 after S25 ErasureSubsetRebuild.
- Soft J2 CompilePathExtract-only (`packageBodyImportsCompilePathExtract`; no
  emit-module farm; this unit is rebuild / self-apply; do **not** invent an
  EmitRebuild farm; do **not** clone ExtractSubsetEmit PE).
- Soft J5 `checkExtractSubsetRebuildTermDialect` at package scope.
- `packageEnvTermSurfaceOk` folds `hostModuleCheckExtractSubsetRebuildTermSurfaceOk`.
- Residual-free claimed true is ILL-TYPED-TERM; L0 package tokens still accept.
- Dialect body living `extractSubsetRebuildSelfApplyOk` + wrote-expected, **not**
  `emitExtractReady`.
- Ready chain includes `!extractSubsetRebuildWithoutLakeFinishedClaimed`.
- EvidenceLater gets PE72. Do **not** grow Evidence.
- S26 fixtures in FixturesLater, not FixturesS5 (990).
- PackageEnv stays under 1000 (now 967; long-file split if S26 dialect would
  pass 1000).
- Accepts 994 cite only.
- Harness stays **120**. TERM stays **66**.
- FullHostElaborateRemains stays **false**.
- TDD: red Evidence `packageEnvDialectRejectsOk_true` before S26 dialect, then
  green.
- `just hygiene` plus focused lake family plus `just systems-host` green.

Out of scope: FullHost flip; seed-wide 206 / mathlib; DominanceClaimed / band
FullBackend; product C; product Rust; Term-surface for HostFront
(TERM for the next seed comes after this PE); rewrite of ExtractSubsetRebuild
TERM; re-queue PE71; re-queue PE70; re-queue ErasureSubsetRebuild TERM; re-queue
this TERM; cold compose init unroll; inventing a C fail-closed residual;
flipping residual-free / complete claimed; `emitExtractReady` as dialect clone;
growing Evidence (use EvidenceLater); growing FixturesS5.

---

## Pin proof (FullHost stays false)

This lockstep did not edit `hostResidualShrinkFullHostElaborateRemains`.
No FULLHOST_FLIP. No free / complete / PROVABLY / DominanceClaimed / band
FullBackend edits. ExtractSubsetRebuild residual-free and complete claimed
stay false.

---

## Pins unchanged (must not forge)

| Pin | Status |
|-----|--------|
| free / complete / PROVABLY | **true** (do not re-open) |
| FullHostElaborateRemains | **false** |
| DominanceClaimed / band FullBackend | **false** |
| irNodeLayoutFullBackendClaimed / rustIrInteropFullBackendClaimed | **false** (untouched) |
| seed / harness / TERM dual-ok | 206 / 120 / 66 |
| package-env | Mult..ParityEmit + U2 + S5 plus PE43..PE71 (PE71 / S25 landed; this PE is next as PE72 / S26; scope string still SurfaceMatrixEnv-only; not seed-wide) |
| PackageEnv line counts | FixturesS5 990; FixturesLater 641; PackageEnv 967; Evidence 797; EvidenceLater 399 (all under 1000) |
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
- Re-queue this TERM, PE71, ErasureSubsetRebuild TERM, or PE70
- Opening HostFront TERM now
- Opening cold compose init unroll
- Invented C fail-closed residual
- Presenting a new plan
- New product Lean

---

## Hygiene

`just hygiene`: **exit 0**. source-hygiene OK (1536 files; ASCII except
allowlist; no trailing whitespace; no stitch/merge markers);
professional-tone OK (851 markdown files; 28 banned tokens; whole-token;
novel *.md only).

---

## Next implement

WATCHER fence:

```
/implement --effort 2 Package-env for ExtractSubsetRebuild
```

Do not implement that product Lean in this lockstep.
Next PE writer after this lockstep must be **fresh** (not 019ffb59, not 019ffb40).
