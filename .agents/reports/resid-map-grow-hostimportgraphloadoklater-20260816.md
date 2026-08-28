# Residual lockstep map -- after lake GREEN on Grow HostImportGraphLoadOkLater

Date: 2026-08-16
Kind: map only. Do not apply here. Product Lean was not edited by this map.

Apply only after `lake build SystemsLean.ElabMeetTheorems` and
`lake build SystemsLean.ElabMeet` are GREEN (cwd
`/home/hunter/Projects/ai/iso/src/systems`). Fill measured `wc -l` and
lake times from the GREEN implementer report. Do not invent counts.

## Current living Open (before this mop)

All four living files agree today:

| File | Living Open | Named closed subset |
|------|-------------|---------------------|
| `RESIDUAL-systems.md` | Grow HostImportGraphLoadOkLater subset (table 151; detail 783) | 24 of about 206 including HostImportGraphModsLater |
| `RESIDUAL.md` | same Name (table 151; tip line 62; footer 1271) | 24 of about 206 |
| `WATCHER.md` | `/implement --effort 2 Grow HostImportGraphLoadOkLater` | 24 of about 206 |
| `doc/SESSION-HANDOFF.md` | Next: Grow HostImportGraphLoadOkLater (barrel 114) | 24 of about 206 |

Hubs Grow HostImportGraph (barrel 119) and Grow HostImportGraphLoadOk
(barrel 113) are not Open. Grow HostImportGraphWalkLater is not named
as next-after on those four files (review nit 2).

## After GREEN (owed)

1. Named closed subset becomes **25 of about 206**, including
   SystemsLean.HostImportGraphLoadOkLater.
2. Close Grow HostImportGraphLoadOkLater.
3. Open next Name: **Grow HostImportGraphWalkLater subset**.
4. Do **not** open Grow HostImportGraph or Grow HostImportGraphLoadOk.
5. Do **not** open Grow HostImportGraphTheorems (imports the LoadOk hub).
6. Skip Linear, IrGraph, HostCompose, HostGraphMain as grow-tip Names.
7. Fold review nit 1: stale mid-body HostPackageWriteTheorems / 20 of
   about 206 in `RESIDUAL.md` line 292.
8. Living docs name Grow HostImportGraphWalkLater as next-after.
9. Leave `AGENTS.md` living tip alone (review nit 3; documented lag).

Canonical 25-member list (append LoadOkLater last):

SystemsLean.Mult, SystemsLean.Types, SystemsLean.MultTheorems,
SystemsLean.TypesTheorems, SystemsLean.Erasure, SystemsLean.ErasureTheorems,
SystemsLean.Extract, SystemsLean.ExtractTheorems, SystemsLean.IrProgram,
SystemsLean.IrProgramTheorems, SystemsLean.HostTerm,
SystemsLean.HostFrontGoldens, SystemsLean.HostFront,
SystemsLean.HostFrontTheorems, SystemsLean.HostCheck, SystemsLean.HostGraph,
SystemsLean.HostGraphTheorems, SystemsLean.HostPackageWrite,
SystemsLean.HostPackageWriteTheorems, SystemsLean.HostPackageRoots,
SystemsLean.HostImportGraphSeeds, SystemsLean.HostImportGraphModel,
SystemsLean.HostImportGraphMods, SystemsLean.HostImportGraphModsLater,
SystemsLean.HostImportGraphLoadOkLater

WalkLater facts (already on disk; do not plant):

- Barrel import **116** (`SystemsLean.lean` line 116).
- Header import is `import SystemsLean.HostImportGraphModel` only.
- Import-closed on the 25 (Model is already a named member).
- HostImportGraphTheorems (barrel 115) imports HostImportGraphLoadOk.
  Skip it. HostImportGraphWalk (117) imports Model and WalkLater; do
  not open it this Name.

Extract-first for the **new** Open (WalkLater), after LoadOkLater GREEN:

- Measure `ElabMeetNamedWalkHostImportGraphSeeds.lean`. Inventory
  projected about 715 after LoadOkLater wrappers (578 plus about 137).
- Walk bar about 780. Another twelfth-sized family of about 110 to 169
  on a 715 file lands near 825 to 884 and **passes** about 780.
- Therefore twenty-sixth wrappers MUST go to a NEW module
  `ElabMeetNamedWalkHostImportGraphWalkLater.lean` unless measured
  Seeds plus that add stay under about 780.
- Twenty-sixth probe MUST be NEW
  `ElabMeetNamedHostImportGraphWalkLaterProbe.lean`.
- Do not dump WalkLater onto
  `ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean`.
- Do not grow ElabMeetCompile (916). Do not grow Tail (863), Later
  (785), HostTerm (841), HostGraphTheorems (191), HostPackageWrite
  (622), or Subset (865).

Fill-from-GREEN tokens below: `SEEDS_WC`, `PROBE_WC`, `ELAB_WC`,
`THM_WC`, `LAKE_THM`, `LAKE_ELAB`.

---

## Shared replace fragments

### A. Highest-value next sentence (living tip)

Current:

```
Highest-value next is **Grow HostImportGraphLoadOkLater subset**. Grow HostImportGraphModsLater subset is **done**.
```

Proposed:

```
Highest-value next is **Grow HostImportGraphWalkLater subset**. Grow HostImportGraphLoadOkLater subset is **done**. Grow HostImportGraphModsLater subset is **done**.
```

Same swap for `Highest-value next:` / `Highest value next is`.

### B. Named closed subset count + list

Current: `**24 of about 206**` plus list ending
`..., SystemsLean.HostImportGraphMods, SystemsLean.HostImportGraphModsLater)`.

Proposed: `**25 of about 206**` plus same list with
`, SystemsLean.HostImportGraphLoadOkLater)` appended.

### C. Next-after sentence (LoadOkLater -> WalkLater)

Current (typical):

```
Next is HostImportGraphLoadOkLater (barrel import 114; one import SystemsLean.HostImportGraphModsLater; import-closed on the 24). Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
```

Proposed:

```
Next is HostImportGraphWalkLater (barrel import 116; one import SystemsLean.HostImportGraphModel; import-closed on the 25). After LoadOkLater the next Name is Grow HostImportGraphWalkLater. Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. Skip HostImportGraphTheorems (imports the LoadOk hub). Skip Linear. Skip IrGraph. Skip HostCompose. Skip HostGraphMain.
```

### D. Remaining-work table (four living files)

Replace the Real modules row: `**24 of about 206**` plus 24 names
with `**25 of about 206**` plus the canonical 25-member list.
Leave the other three rows unchanged (0 of about 69; not started;
0.459 s).

### E. Stale mid-body nit (RESIDUAL.md:292 only)

Current wording to replace (surgical; do not rewrite the rest of the
monster paragraph):

```
Highest-value next: **Grow HostPackageWriteTheorems subset** (open). Grow HostPackageWrite subset is **done**. Grow HostGraphTheorems subset is **done**. Grow HostGraph subset is **done**. Grow HostCheck subset is **done**. Grow HostFrontTheorems subset is **done**. Grow HostFront subset is **done**. Grow HostFrontGoldens subset is **done**. Grow HostTerm subset is **done**. Named closed subset is **20 of about 206** (SystemsLean.Mult, SystemsLean.Types, SystemsLean.MultTheorems, SystemsLean.TypesTheorems, SystemsLean.Erasure, SystemsLean.ErasureTheorems, SystemsLean.Extract, SystemsLean.ExtractTheorems, SystemsLean.IrProgram, SystemsLean.IrProgramTheorems, SystemsLean.HostTerm, SystemsLean.HostFrontGoldens, SystemsLean.HostFront, SystemsLean.HostFrontTheorems, SystemsLean.HostCheck, SystemsLean.HostGraph, SystemsLean.HostGraphTheorems, SystemsLean.HostPackageWrite, SystemsLean.HostPackageWriteTheorems, SystemsLean.HostPackageRoots). Next is HostPackageWriteTheorems (imports only HostPackageWrite; import-closed on the 18). Skip HostGraphMain. Skip Linear. Skip IrGraph.
```

Proposed:

```
Highest-value next: **Grow HostImportGraphWalkLater subset** (open). Grow HostImportGraphLoadOkLater subset is **done**. Grow HostImportGraphModsLater subset is **done**. Grow HostImportGraphMods subset is **done**. Grow HostImportGraphModel subset is **done**. Grow HostImportGraphSeeds subset is **done**. Grow HostPackageRoots subset is **done**. Grow HostPackageWriteTheorems subset is **done**. Grow HostPackageWrite subset is **done**. Grow HostGraphTheorems subset is **done**. Grow HostGraph subset is **done**. Grow HostCheck subset is **done**. Grow HostFrontTheorems subset is **done**. Grow HostFront subset is **done**. Grow HostFrontGoldens subset is **done**. Grow HostTerm subset is **done**. Named closed subset is **25 of about 206** (SystemsLean.Mult, SystemsLean.Types, SystemsLean.MultTheorems, SystemsLean.TypesTheorems, SystemsLean.Erasure, SystemsLean.ErasureTheorems, SystemsLean.Extract, SystemsLean.ExtractTheorems, SystemsLean.IrProgram, SystemsLean.IrProgramTheorems, SystemsLean.HostTerm, SystemsLean.HostFrontGoldens, SystemsLean.HostFront, SystemsLean.HostFrontTheorems, SystemsLean.HostCheck, SystemsLean.HostGraph, SystemsLean.HostGraphTheorems, SystemsLean.HostPackageWrite, SystemsLean.HostPackageWriteTheorems, SystemsLean.HostPackageRoots, SystemsLean.HostImportGraphSeeds, SystemsLean.HostImportGraphModel, SystemsLean.HostImportGraphMods, SystemsLean.HostImportGraphModsLater, SystemsLean.HostImportGraphLoadOkLater). Next is HostImportGraphWalkLater (barrel import 116; one import SystemsLean.HostImportGraphModel; import-closed on the 25). Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. Skip HostImportGraphTheorems. Skip HostGraphMain. Skip Linear. Skip IrGraph. Skip HostCompose.
```

---

## File 1 -- RESIDUAL-systems.md

Do not rewrite Done archive items 146-150. Row 146 may keep
historical **20 of about 206** (HostPackageRoots land-time). That is
not the living tip.

### 1.1 Living tip cell "Next product work" (line 43)

Section: living tip table, Next product work.

Current (two copies in the same cell): `Highest-value next is **Grow
HostImportGraphLoadOkLater subset**.` plus `Named closed subset is
**24 of about 206**` plus 24 names.

Proposed: apply fragments A and B in both copies in that cell.

### 1.2 Open living queue paragraph (about line 205)

Current: `Highest-value next is **Grow HostImportGraphLoadOkLater
subset**.` plus 24-list.

Proposed: fragments A and B.

### 1.3 Later living-tip restatement (about line 325)

Same as 1.2. Apply A and B.

### 1.4 Open Names table row 150 (line 575)

Current ends: `next Grow HostImportGraphLoadOkLater subset`

Leave as historical next-from-ModsLater. Optional: no change.

### 1.5 Open Names table row 151 (line 576)

Current:

```
| 151 | Grow HostImportGraphLoadOkLater subset | **open** | add SystemsLean.HostImportGraphLoadOkLater (barrel import 114; ...
```

Proposed (clone row 150 style; fill GREEN measures):

```
| 151 | Grow HostImportGraphLoadOkLater subset | **done** | HostImportGraphLoadOkLater landed; named closed subset Mult + MultTheorems + Types + TypesTheorems + Erasure + ErasureTheorems + Extract + ExtractTheorems + IrProgram + IrProgramTheorems + HostTerm + HostFrontGoldens + HostFront + HostFrontTheorems + HostCheck + HostGraph + HostGraphTheorems + HostPackageWrite + HostPackageWriteTheorems + HostPackageRoots + HostImportGraphSeeds + HostImportGraphModel + HostImportGraphMods + HostImportGraphModsLater + HostImportGraphLoadOkLater (**25 of about 206**); extract-first: twenty-fifth probe in ElabMeetNamedHostImportGraphLoadOkLaterProbe (PROBE_WC); twenty-fifth wrappers on ElabMeetNamedWalkHostImportGraphSeeds (SEEDS_WC); HostPackageWrite walk stays **622**; leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false; prior twenty-four-module walker tryCompileNamedHostImportGraphModsLaterSubset still succeeds; twenty-fifth walk is not an alias of the twenty-fourth; live HostImportGraphLoadOkLater.lean was not planted; after-deps twenty-fourth after-deps plus HostImportGraphModsLater; ElabMeetSubset **865**; ElabMeetNamedWalk **322**; ElabMeetNamedWalkLater **785**; ElabMeetNamedWalkTail **863**; ElabMeetNamedWalkHostTerm **841**; ElabMeetNamedWalkHostGraphTheorems **191**; ElabMeetNamedWalkHostPackageWrite **622**; ElabMeet ELAB_WC; ElabMeetTheorems THM_WC; ElabMeetCompile **916**; slakeOwnsPackageTypecheck false; FullHost stays false; leftover walk stays closed; DualResidual residualFreeClaimed stays true; SpecProof residualFreeClaimed stays false; next Grow HostImportGraphWalkLater subset |
```

### 1.6 Insert table row 152 after 151

```
| 152 | Grow HostImportGraphWalkLater subset | **open** | add SystemsLean.HostImportGraphWalkLater (barrel import 116; one import SystemsLean.HostImportGraphModel; import-closed on the 25); do not open Grow HostImportGraph; do not open Grow HostImportGraphLoadOk; do not open Grow HostImportGraphTheorems; skip HostGraphMain; skip Linear as a named member; skip IrGraph; skip HostCompose; extract first: HostTerm walk **841** stays; HostGraphTheorems walk stays **191**; HostPackageWrite walk stays **622**; HostImportGraphSeeds walk is SEEDS_WC; extract bar for that walk is about 780; another twelfth-sized wrapper family of about 110 to 169 on a measured-Seeds-near-715 file passes about 780, so twenty-sixth wrappers MUST be NEW ElabMeetNamedWalkHostImportGraphWalkLater.lean unless measured Seeds plus that add stay under about 780; twenty-sixth probe MUST be NEW ElabMeetNamedHostImportGraphWalkLaterProbe.lean (do not dump onto ElabMeetNamedHostImportGraphLoadOkLaterProbe); do not grow ElabMeetCompile (**916**); still not whole-package typecheck; still not slakeOwnsPackageTypecheck |
```

### 1.7 ModsLater detail Status (line 774)

Current ends: `Living next is **Grow HostImportGraphLoadOkLater subset**.`

Leave. That is the living next at ModsLater close time.

### 1.8 LoadOkLater detail heading (line 783)

Current: `#### Grow HostImportGraphLoadOkLater subset (host finish, open)`

Proposed: `#### Grow HostImportGraphLoadOkLater subset (host finish, done)`

### 1.9 LoadOkLater Status field (line 792)

Current: `**Status** | **open**. Grow HostImportGraphModsLater subset is
**done**. Current named subset is ... (**24 of about 206**). ... Do not
open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. ...`

Proposed (clone ModsLater done style; fill GREEN):

```
| **Status** | **done** (2026-08-16). HostImportGraphLoadOkLater landed. Named closed subset is Mult + MultTheorems + Types + TypesTheorems + Erasure + ErasureTheorems + Extract + ExtractTheorems + IrProgram + IrProgramTheorems + HostTerm + HostFrontGoldens + HostFront + HostFrontTheorems + HostCheck + HostGraph + HostGraphTheorems + HostPackageWrite + HostPackageWriteTheorems + HostPackageRoots + HostImportGraphSeeds + HostImportGraphModel + HostImportGraphMods + HostImportGraphModsLater + HostImportGraphLoadOkLater (**25 of about 206**). HostImportGraphLoadOkLater imports only HostImportGraphModsLater and is import-closed on the 24. Extract-first: twenty-fifth probe lives in role module `ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean` (PROBE_WC) so Subset stays **865**. Twenty-fifth wrappers live on `ElabMeetNamedWalkHostImportGraphSeeds.lean` (SEEDS_WC) so the HostPackageWrite walk stays **622**, the HostGraphTheorems walk stays **191**, and the HostTerm walk stays **841**. Shared helpers stay on NamedWalk. Thin twenty-fifth wrapper over `tryCompileNamedMemberListIO`. Membership list order is barrel order, not compile order; compile Mult first. HostImportGraphLoadOkLater last after the closed twenty-four oleans. After-deps lists the twenty-fourth after-deps plus HostImportGraphModsLater. Drive fold is good && !bad && isolation. Isolation keeps leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib false; prior twenty-four-module walker `tryCompileNamedHostImportGraphModsLaterSubset` still succeeds; twenty-fifth walk is not an alias of the twenty-fourth; live HostImportGraphLoadOkLater.lean was not planted. Four theorems native_decide. Fill TDD honesty from the GREEN report (red observed or theorems-already-on-disk). Lake proof (LAKE_THM; LAKE_ELAB; cwd `src/systems`). Real `wc -l` after: ElabMeet ELAB_WC. ElabMeetCompile **916**. ElabMeetSubset **865**. ElabMeetNamedWalk **322**. ElabMeetNamedWalkLater **785**. ElabMeetNamedWalkTail **863**. ElabMeetNamedWalkHostTerm **841**. ElabMeetNamedWalkHostGraphTheorems **191**. ElabMeetNamedWalkHostPackageWrite **622**. ElabMeetNamedWalkHostImportGraphSeeds SEEDS_WC. ElabMeetNamedHostImportGraphLoadOkLaterProbe PROBE_WC. ElabMeetTheorems THM_WC. Pins stay false: slakeOwnsPackageTypecheck, elabMeetFullHostElaborateRemains, FullHostElaborateRemains, hostResidualShrinkFullHostElaborateRemains, llvmCfgFixtureDominanceClaimed, llvmMultSsaFullBackendClaimed. DualResidual residualFreeClaimed stays **true**. SpecProof residualFreeClaimed stays **false**. SpecProof proofCompleteClaimed stays **true**. The leftover seed walk is **closed**. Do not invent a leftover-walk Name. Skip Linear. Skip IrGraph. Skip HostCompose. Skip HostGraphMain. Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. Do not open Grow HostImportGraphTheorems. HostImportGraphWalkLater imports only HostImportGraphModel (already import-closed on the 25). Living next is **Grow HostImportGraphWalkLater subset**. |
```

### 1.10 LoadOkLater remaining-work table (lines 794-799)

Apply fragment D (24 -> 25 including LoadOkLater).

### 1.11 Insert new Open item after that table (before Thin extract)

```
#### Grow HostImportGraphWalkLater subset (host finish, open)

| Field | Content |
|-------|---------|
| **Name** | Grow HostImportGraphWalkLater subset |
| **Goal** | Add SystemsLean.HostImportGraphWalkLater to the named ElabMeet subset toward the develop seed. HostImportGraphWalkLater already exists as product Lean (barrel import 116) and imports only SystemsLean.HostImportGraphModel. HostImportGraphLoadOkLater is now in the closed subset. WalkLater is import-closed on the 25. Skip HostGraphMain (lake exe root, not in the barrel). Skip Linear as a named membership member. Skip IrGraph. Skip HostCompose. Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. Do not open Grow HostImportGraphTheorems. |
| **Done when** | The named closed subset typechecks live HostImportGraphWalkLater via `tryCompileNamedMemberListIO`. Twenty-five-plus-HostImportGraphWalkLater becomes **26 of about 206**. Accept good / reject planted error. Isolation vs the prior twenty-five-module walk. Leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false. Four theorems FIRST (`elabMeetDrivesNamedHostImportGraphWalkLaterSubset_true`, `elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset_true`, `elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset_true`, `elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset_true`) all `= true := by native_decide` BEFORE the Bools exist. TDD red then extract-first then implement then green. Theorems not rewritten. `slakeOwnsPackageTypecheck` stays **false**. `elabMeetFullHostElaborateRemains` stays **false**. FullHostElaborateRemains stays **false**. llvm pins stay. Leftover seed walk stays **closed**. `just hygiene` plus focused lake and `just systems-host` green. Isolation fold: leftover temp good.lean false && leftover fake lean_lib ElabMeetRichLib false && priorSubsetStillOk && notAliasOfTwentyFifth. Prior walker `tryCompileNamedHostImportGraphLoadOkLaterSubset` still succeeds. |
| **Out of scope** | Whole-package typecheck; leftover seed increments; flipping ownership / FullHost / DualResidual / Dominance / FullBackend / SpecProof; claiming the whole develop seed; planting errors in live product; growing ElabMeetCompile; flipping free / complete / PROVABLY; adding Linear as a named membership member; adding IrGraph; adding HostCompose; adding HostGraphMain this slice; opening Grow HostImportGraph; opening Grow HostImportGraphLoadOk; opening Grow HostImportGraphTheorems; inventing a leftover-walk Name; flipping slakeOwnsPackageTypecheck / elabMeetFullHostElaborateRemains / FullHostElaborateRemains / llvm pins. |
| **Primary paths** | EXTRACT-FIRST (hard). Tail is **863** and Later is **785**; neither can absorb another leftover wrapper without passing about 880. HostTerm walk is **841** and stays. HostGraphTheorems walk stays **191**. HostPackageWrite walk stays **622**. HostImportGraphSeeds walk is SEEDS_WC; extract bar for that file is about 780; another twelfth-sized wrapper family of about 110 to 169 on a measured-Seeds-near-715 file passes about 780, so twenty-sixth wrappers MUST go to NEW `ElabMeetNamedWalkHostImportGraphWalkLater.lean` unless measured Seeds plus that add stay under about 780. Twenty-sixth probe MUST be NEW `ElabMeetNamedHostImportGraphWalkLaterProbe.lean`. Do not dump HostImportGraphWalkLater onto `ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean`. Do not grow ElabMeetCompile (**916**). Reuse `tryCompileNamedMemberListIO`. After-deps for HostImportGraphWalkLater: Mult first, then HostImportGraphLoadOkLater after-deps plus HostImportGraphLoadOkLater. Do not add HostImportGraphLoadOk or HostImportGraphTheorems. Membership: prior twenty-five then HostImportGraphWalkLater last. Compile order: prior twenty-five compile order, then HostImportGraphWalkLater last. Fold only on ElabMeet (ELAB_WC). Theorems on ElabMeetTheorems (THM_WC). Thin Nix/just/residual if gates require tokens. |
| **Status** | **open**. Grow HostImportGraphLoadOkLater subset is **done**. Current named subset is Mult + MultTheorems + Types + TypesTheorems + Erasure + ErasureTheorems + Extract + ExtractTheorems + IrProgram + IrProgramTheorems + HostTerm + HostFrontGoldens + HostFront + HostFrontTheorems + HostCheck + HostGraph + HostGraphTheorems + HostPackageWrite + HostPackageWriteTheorems + HostPackageRoots + HostImportGraphSeeds + HostImportGraphModel + HostImportGraphMods + HostImportGraphModsLater + HostImportGraphLoadOkLater (**25 of about 206**). HostImportGraphWalkLater imports only HostImportGraphModel and is import-closed on the 25. Skip Linear. Skip IrGraph. Skip HostCompose. Skip HostGraphMain. Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. Do not open Grow HostImportGraphTheorems. The leftover seed walk is **closed**. Still not `slakeOwnsPackageTypecheck`. Still not FullHost. |

| Remaining work | Honest number |
|----------------|---------------|
| Real modules Slake typechecks | **25 of about 206** (canonical 25-member list) |
| Real host tools that build without Lake on the step | **0 of about 69** |
| Linear use-check | **not started** |
| Same-job time | Lake idle-hot **0.459 s** (`doc/BENCH-SAME-JOB-latest.md`). Slake cannot run that full-package job. Do not invent a fake Slake wall-clock. |
```

### 1.12 Highest value next table (line 3961)

Current: `| **1 next** | Grow HostImportGraphLoadOkLater subset (open) |`
plus 24-list and LoadOkLater extract-first.

Proposed: `| **1 next** | Grow HostImportGraphWalkLater subset (open) |`
then fragment A/B/C plus WalkLater extract-first (new walk unless
Seeds plus add stay under about 780). Keep honesty pins false.

### 1.13 Next residual implement prompt (line 4307)

Current: `Sole next-action fence: `WATCHER.md` (Grow
HostImportGraphLoadOkLater subset).`

Proposed: `Sole next-action fence: `WATCHER.md` (Grow
HostImportGraphWalkLater subset).`

---

## File 2 -- RESIDUAL.md

### 2.1 Open (high-value next) paragraph (line 62)

Current: `Highest-value next is **Grow HostImportGraphLoadOkLater
subset**.` plus 24-list plus remaining-work **24**.

Proposed: fragments A, B, C, D. Name WalkLater as next-after.

### 2.2 Remaining-work table (lines 64-68)

Fragment D.

### 2.3 Mid-body Systems Open (join) paragraph (line 292) -- review nit 1

Apply fragment E. This is the leftover HostPackageWriteTheorems /
20 of about 206 wording. Living tip at line 62 already says
LoadOkLater / 24 today; after GREEN it must say WalkLater / 25.
This mid-body sentence must match the living tip, not stay at 20.

### 2.4 Same paragraph later (line 330)

Current already says LoadOkLater / 24. Apply A, B, C so it does
not fight fragment E.

### 2.5 Host finish **Highest value next** cell (line 338)

Current: `Highest-value next is **Grow HostImportGraphLoadOkLater
subset**.` plus 24-list.

Proposed: A, B, C.

### 2.6 Open Names table row 151 (line 496)

Same rewrite as systems 1.5 (status **done**; 25 including
LoadOkLater; next Grow HostImportGraphWalkLater).

### 2.7 Insert table row 152 after 151

Same as systems 1.6.

### 2.8 Footer Highest value next (line 1271)

Current: `**Highest value next:** **Grow HostImportGraphLoadOkLater
subset** (open).` plus 24-list plus `Next is HostImportGraphLoadOkLater
(barrel import 114; ...)`.

Proposed: `**Highest value next:** **Grow HostImportGraphWalkLater
subset** (open).` plus LoadOkLater **done** plus 25-list plus
fragment C. Keep extract-first for WalkLater (new walk unless
measured Seeds plus add stay under about 780). Twenty-sixth probe
MUST be NEW ElabMeetNamedHostImportGraphWalkLaterProbe.lean.

---

## File 3 -- WATCHER.md

Replace the whole fence between `WATCHER_BEGIN` and `WATCHER_END`.

Current: `/implement --effort 2 Grow HostImportGraphLoadOkLater` plus
LoadOkLater Goal/Done when/24-table.

Proposed:

```
<!-- WATCHER_BEGIN -->
/implement --effort 2 Grow HostImportGraphWalkLater

Name: Grow HostImportGraphWalkLater subset
Goal: Add SystemsLean.HostImportGraphWalkLater to the named ElabMeet subset toward the develop seed. HostImportGraphWalkLater already exists as product Lean (barrel import 116) and imports only SystemsLean.HostImportGraphModel. HostImportGraphLoadOkLater is now in the closed subset, so WalkLater is import-closed on the 25. Skip HostGraphMain (lake exe root, not in the barrel). Skip Linear as a named membership member. Skip IrGraph. Skip HostCompose. Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. Do not open Grow HostImportGraphTheorems. Still not whole-package typecheck.
Done when: The named closed subset typechecks live HostImportGraphWalkLater via tryCompileNamedMemberListIO; twenty-five-plus-HostImportGraphWalkLater becomes 26 of about 206; accept good / reject planted error; isolation vs the prior twenty-five-module walk (leftover temp good.lean and leftover fake lean_lib ElabMeetRichLib stay false); four theorems FIRST (elabMeetDrivesNamedHostImportGraphWalkLaterSubset_true, elabMeetAcceptsGoodNamedHostImportGraphWalkLaterSubset_true, elabMeetRejectsBadNamedHostImportGraphWalkLaterSubset_true, elabMeetRejectsOldWalkAsNamedHostImportGraphWalkLaterSubset_true) all = true := by native_decide BEFORE the Bools exist; TDD red then extract-first then implement then green; theorems not rewritten; slakeOwnsPackageTypecheck stays false; elabMeetFullHostElaborateRemains stays false; FullHostElaborateRemains stays false; llvm pins stay; leftover walk stays closed; hygiene + systems-host green. Isolation fold: leftover temp good.lean false && leftover fake lean_lib ElabMeetRichLib false && priorSubsetStillOk && notAliasOfTwentyFifth. Prior walker tryCompileNamedHostImportGraphLoadOkLaterSubset still succeeds.
Out of scope: flipping ownership/FullHost/DualResidual/Dominance/FullBackend/SpecProof; leftover seed increments; growing ElabMeetCompile; claiming the whole develop seed; planting errors in live product; flipping free/complete/PROVABLY; adding Linear as a named membership member; adding IrGraph; adding HostCompose; adding HostGraphMain this slice; opening Grow HostImportGraph; opening Grow HostImportGraphLoadOk; opening Grow HostImportGraphTheorems; inventing a leftover-walk Name; flipping slakeOwnsPackageTypecheck / elabMeetFullHostElaborateRemains / FullHostElaborateRemains / llvm pins.
Paths: EXTRACT-FIRST (hard). ElabMeetNamedWalkTail.lean is 863 and ElabMeetNamedWalkLater.lean is 785; neither can absorb another leftover wrapper without passing about 880. HostTerm walk ElabMeetNamedWalkHostTerm.lean is 841 and stays. HostGraphTheorems walk ElabMeetNamedWalkHostGraphTheorems.lean is 191 and stays. HostPackageWrite walk ElabMeetNamedWalkHostPackageWrite.lean is 622 and stays. HostImportGraphSeeds walk ElabMeetNamedWalkHostImportGraphSeeds.lean is SEEDS_WC; extract bar for that file is about 780; another twelfth-sized wrapper family of about 110 to 169 on a measured-Seeds-near-715 file passes about 780, so twenty-sixth wrappers MUST go to NEW ElabMeetNamedWalkHostImportGraphWalkLater.lean unless measured Seeds plus that add stay under about 780. Twenty-sixth probe MUST be a NEW ElabMeetNamedHostImportGraphWalkLaterProbe.lean. Do not dump HostImportGraphWalkLater onto ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean. Do not invent leftover slang names. ElabMeetNamedWalk.lean is 322 (helpers only). ElabMeet.lean fold only; ElabMeetTheorems.lean theorems; nix host presence. Do not grow ElabMeetCompile (916). Reuse tryCompileNamedMemberListIO. After-deps: Mult first, then HostImportGraphLoadOkLater after-deps plus HostImportGraphLoadOkLater. Do not add HostImportGraphLoadOk or HostImportGraphTheorems. Membership: prior twenty-five then HostImportGraphWalkLater last. Compile order: prior twenty-five compile order, then HostImportGraphWalkLater last.
Gates: lake build SystemsLean.ElabMeetTheorems; lake build SystemsLean.ElabMeet; just hygiene; just professional-tone; just systems-host

Honesty: product residual free, freestanding product self-host complete, and PROVABLY stay true. FullHostElaborateRemains stays false. slakeOwnsPackageTypecheck stays false. DualResidual residualFreeClaimed stays true. Grow HostImportGraphLoadOkLater subset landed. Named closed subset is 25 of about 206 including HostImportGraphLoadOkLater. Extract leftover first: Tail (863) and Later (785) cannot take another leftover wrapper. NamedWalk is 322. HostTerm wrapper module is 841. HostGraphTheorems walk is 191. HostPackageWrite walk is 622. HostImportGraphSeeds walk is SEEDS_WC. Subset is 865. Twenty-fifth probe lives in ElabMeetNamedHostImportGraphLoadOkLaterProbe (PROBE_WC). ElabMeet is ELAB_WC. ElabMeetTheorems is THM_WC. ElabMeetCompile is 916; do not grow it. The leftover seed walk is closed. Do not invent a leftover-walk Name. Reuse tryCompileNamedMemberListIO. Membership list order is barrel order, not compile order; compile Mult first. HostImportGraphWalkLater last after the closed twenty-five oleans. Skip Linear as a named member. Skip IrGraph. Skip HostCompose. HostImportGraphWalkLater imports only HostImportGraphModel and is import-closed on the 25. Do not open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk. Do not open Grow HostImportGraphTheorems. HostGraphMain also imports only HostGraph; do not add it here.

| Remaining work | Honest number |
|----------------|---------------|
| Real modules Slake typechecks | **25 of about 206** (canonical 25-member list) |
| Real host tools that build without Lake on the step | **0 of about 69** |
| Linear use-check | **not started** |
| Same-job time | Lake idle-hot **0.459 s** (`doc/BENCH-SAME-JOB-latest.md`). Slake cannot run that full-package job. Do not invent a fake Slake wall-clock. |
<!-- WATCHER_END -->
```

---

## File 4 -- doc/SESSION-HANDOFF.md

Section: Living tip (2026-08-16), lines 87-150.

### 4.1 After ModsLater done (lines 108-121)

Current:

```
Grow HostImportGraphModsLater subset is **done**.
Named closed subset is Mult, Types, ... and HostImportGraphModsLater.
Metric: **24 of about 206** live modules on the Slake path. Next: Grow
HostImportGraphLoadOkLater subset (barrel import 114; one import
SystemsLean.HostImportGraphModsLater; import-closed on the 24). Do not
open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
```

Proposed:

```
Grow HostImportGraphModsLater subset is **done**. Grow
HostImportGraphLoadOkLater subset is **done**.
Named closed subset is Mult, Types, ... HostImportGraphModsLater, and
HostImportGraphLoadOkLater.
Metric: **25 of about 206** live modules on the Slake path. Next: Grow
HostImportGraphWalkLater subset (barrel import 116; one import
SystemsLean.HostImportGraphModel; import-closed on the 25). Do not
open Grow HostImportGraph. Do not open Grow HostImportGraphLoadOk.
Skip HostImportGraphTheorems. Skip HostGraphMain. Skip Linear as a named
member. Skip IrGraph. Skip HostCompose.
```

### 4.2 Extract-first paragraph (lines 123-137)

Retarget twenty-fifth / LoadOkLaterProbe to twenty-sixth / WalkLater.
Seeds walk is SEEDS_WC (not 578). State the 780-bar pass: twenty-sixth
wrappers MUST be NEW ElabMeetNamedWalkHostImportGraphWalkLater unless
measured Seeds plus the add stay under about 780. Twenty-sixth probe
MUST be NEW ElabMeetNamedHostImportGraphWalkLaterProbe.lean. Do not
dump WalkLater onto ElabMeetNamedHostImportGraphLoadOkLaterProbe.
ElabMeet / Theorems / Compile become ELAB_WC / THM_WC / 916.

### 4.3 Remaining-work table (lines 145-150)

Fragment D.

---

## Do not touch

| Path | Why |
|------|-----|
| `AGENTS.md` living tip (about 340-348) | Review nit 3. Documented lag (still says 13 / HostFrontTheorems). Not a grow surface. |
| Product Lean / Nix | Residual mop only after GREEN. |
| Done archive rows 146-150 land-time **20/21/22/23/24** | Historical. Living tip wins. |
| ModsLater Status "Living next is LoadOkLater" | Historical next-from-that-close. |
| `plan-slake-replaces-lake.md` | No LoadOkLater living tip today. |

---

## Review nits folded

| Nit | Where | This mop |
|-----|-------|----------|
| 1 leftover HostPackageWriteTheorems / 20 of 206 | `RESIDUAL.md:292` | Fragment E. Required. |
| 2 successor WalkLater not named | four living files | Fragment C + new Open item / WATCHER / handoff Next. |
| 3 AGENTS.md 13 / HostFrontTheorems | `AGENTS.md:340-348` | Leave alone. |

---

## Proposed next Open Name text (short)

Name: Grow HostImportGraphWalkLater subset

Goal: Add live SystemsLean.HostImportGraphWalkLater (barrel 116; imports
only HostImportGraphModel) to the named ElabMeet subset. Import-closed
on the 25. Do not open the LoadOk or HostImportGraph hubs. Skip
Theorems, Linear, IrGraph, HostCompose, HostGraphMain.

Done when: 26 of about 206 via tryCompileNamedMemberListIO; four
WalkLater theorems native_decide first; extract-first new walk unless
measured Seeds plus wrappers stay under about 780; new probe; pins stay
false.

---

Map only. Do not apply.
