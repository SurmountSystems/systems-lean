# Inventory: clone HostGraph (16) into HostGraphTheorems (17)

Date: 2026-08-16. Read-only. No product edits.

Seventeenth slice is Grow HostGraphTheorems subset (Open Name 143). Extract first. Clone HostGraph one module later. Do not dump onto Subset, HostGraph probe, HostCheck probe, HostFrontTheorems probe, HostTerm walk, Tail, Later, or ElabMeetCompile.

## 1. HostGraph four Bools and four theorems

Bools are elaborated in `src/systems/SystemsLean/ElabMeetNamedHostGraphProbe.lean` (lines 184-191), then `rfl` examples at 195-198.

| Bool | Probe def line |
|------|----------------|
| `elabMeetAcceptsGoodNamedHostGraphSubset` | 184, 188 |
| `elabMeetRejectsBadNamedHostGraphSubset` | 185, 189 |
| `elabMeetRejectsOldWalkAsNamedHostGraphSubset` | 186, 190 |
| `elabMeetDrivesNamedHostGraphSubset` | 187, 191 |

Ready fold in `ElabMeet.lean` 696-699 (after HostCheck four; first conjuncts stay `!slakeOwnsPackageTypecheck` and `!elabMeetFullHostElaborateRemains` at 523-524).

Theorems in `src/systems/SystemsLean/ElabMeetTheorems.lean` (all `= true := by native_decide`):

| Theorem | Line |
|---------|------|
| `elabMeetDrivesNamedHostGraphSubset_true` | 616 |
| `elabMeetAcceptsGoodNamedHostGraphSubset_true` | 621 |
| `elabMeetRejectsBadNamedHostGraphSubset_true` | 626 |
| `elabMeetRejectsOldWalkAsNamedHostGraphSubset_true` | 631 |

File ends at 635. Append the four HostGraphTheorems theorems after 633. Red first: same names, Bools missing. Do not rewrite.

Clone names (TDD red, then implement):

- `elabMeetDrivesNamedHostGraphTheoremsSubset` / `_true`
- `elabMeetAcceptsGoodNamedHostGraphTheoremsSubset` / `_true`
- `elabMeetRejectsBadNamedHostGraphTheoremsSubset` / `_true`
- `elabMeetRejectsOldWalkAsNamedHostGraphTheoremsSubset` / `_true`

## 2. HostGraph wrappers (four-line `tryCompileNamedMemberListIO`)

Live in `src/systems/SystemsLean/ElabMeetNamedWalkHostTerm.lean` 722-839. Shared helpers stay on `ElabMeetNamedWalk`. Do not add seventeenth wrappers here (841 + about 108 lands near 949).

Four-line compile body (792-796):

```
unsafe def tryCompileNamedHostGraphSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostGraphSubsetNames
    namedClosedHostGraphCompileOrder
```

Then `implemented_by` opaque, CommandElab `tryCompileNamedHostGraphSubset` (804-810).

Sibling defs to clone onto NEW `ElabMeetNamedWalkHostGraphTheorems.lean` (do not name it `ElabMeetNamedWalkHostGraph`):

| HostGraph (16) | HostGraphTheorems (17) |
|----------------|------------------------|
| `findLiveHostGraphPath` 725 | `findLiveHostGraphTheoremsPath` |
| `namedClosedHostGraphSubsetNames` 734 | `namedClosedHostGraphTheoremsSubsetNames` |
| `namedClosedHostGraphCompileOrder` 757 | `namedClosedHostGraphTheoremsCompileOrder` |
| `barrelListsNamedHostGraphSubset` 779 | `barrelListsNamedHostGraphTheoremsSubset` |
| `tryCompileNamedHostGraphSubsetIO` 792 | `tryCompileNamedHostGraphTheoremsSubsetIO` |
| `tryCompileNamedHostGraphSubset` 804 | `tryCompileNamedHostGraphTheoremsSubset` |
| `tryCompileAfterHostGraphDepsIO` 820 | `tryCompileAfterHostGraphTheoremsDepsIO` |
| `tryCompileAfterHostGraphDeps` 832 | `tryCompileAfterHostGraphTheoremsDeps` |

New walk file imports `ElabMeetNamedWalk` plus `ElabMeetNamedWalkHostTerm` so prior-list names stay in scope.

## 3. HostGraph probe isolation fold (clone one later)

File: `ElabMeetNamedHostGraphProbe.lean` (200). Command `#elabMeetNamedHostGraphSubsetProbe` at 88 / invoked 193.

| Conjunct | How it is computed |
|----------|--------------------|
| leftover temp `good.lean` | write `isoDir / "good.lean"` as `def n : Nat := 0`; `thisOnTempSnippet := tryCompileNamedHostGraphSubset goodIso isoDir` must be false |
| leftover fake `lean_lib ElabMeetRichLib` | `leftoverFakePackageLakefileText` in `ElabMeetNamedWalk.lean` 319-320 is `"lean_lib ElabMeetRichLib\nmodule ElabMeetRichLib\n"`; `thisOnFakePackage := tryCompileNamedHostGraphSubset fakeLake fakeDir` must be false |
| `priorSubsetStillOk` | `tryCompileNamedHostCheckSubset` (fifteenth walker). Seventeenth must use `tryCompileNamedHostGraphSubset` (sixteenth) |
| `notAliasOfFifteenth` | names != HostCheck names; compile order !=; new list contains `SystemsLean.HostGraph`; HostCheck list does not |

Isolation (148-151): `liveMultStillOk && liveThmStillOk && priorSubsetStillOk && !thisOnTempSnippet && !thisOnFakePackage && notAliasOfFifteenth`.

Drive (179-183): `good && !badCompiled && isolation`.

Planted sidecar: temp copy of live `HostGraph.lean` plus `"\ndef plantedTypeError : Nat := true\n"` as `ElabMeetNamedHostGraphSubsetBad`. Do not plant live `HostGraph.lean`. Seventeenth: temp copy of live `HostGraphTheorems.lean` as `ElabMeetNamedHostGraphTheoremsSubsetBad`. Do not plant live `HostGraphTheorems.lean`.

After-deps (HostGraph 823-824): `["SystemsLean.Mult", "SystemsLean.HostTerm", "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront"]`. HostGraph imports HostFront + HostTerm. HostFrontTheorems clone (588-589) is the same four. Seventeenth planted sidecar needs Mult first, then HostGraph, plus HostGraph real deps: `HostTerm`, `HostFrontGoldens`, `HostFront`. Closest honest list: Mult, HostTerm, HostFrontGoldens, HostFront, HostGraph (compile Mult first).

Membership barrel order (734-751), sixteen, HostGraph last, skip Linear / IrGraph / HostGraphMain / HostCompose:

`Mult, MultTheorems, Types, TypesTheorems, IrProgram, IrProgramTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, HostTerm, HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph`

Compile order (757-774), Mult first, HostGraph last:

`Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph`

Seventeenth: those sixteen plus `SystemsLean.HostGraphTheorems` last on both lists. `notAliasOfSixteenth`: names != HostGraph names; compile order !=; new list contains `SystemsLean.HostGraphTheorems`; HostGraph list does not.

Skip Linear. Skip IrGraph. Do not add HostGraphMain. Do not add HostCompose (`HostCompose.lean` still imports `IrGraph`).

## 4. Barrel import lines to clone

Product HostGraphTheorems is already imported. Do not re-add it. Add the two NEW ElabMeet modules.

`SystemsLean.lean`:

- After HostTerm walk (323 `import SystemsLean.ElabMeetNamedWalkHostTerm`): `import SystemsLean.ElabMeetNamedWalkHostGraphTheorems`
- After HostGraph probe (326 `import SystemsLean.ElabMeetNamedHostGraphProbe`): `import SystemsLean.ElabMeetNamedHostGraphTheoremsProbe`
- Header comment line 22 lists walk/probe names; add the two new ones after HostGraph probe.

Same two imports after the same neighbors in:

- `ElabMeet.lean` 393 / 396
- `ElabMeetTheorems.lean` 51 / 54

Product barrel already has `import SystemsLean.HostGraph` (104) then `import SystemsLean.HostGraphTheorems` (105) then `HostPackageWrite`. Next named closed candidate after 17 is HostPackageWrite. HostGraphMain is lake exe only; not in barrel; do not add.

Lakefile lists `slake-host-graph` -> `HostGraphMain` (66, 294). HostGraph probe/walk are not lake exe roots. Do not add HostGraphMain. No lakefile change for this slice.

## 5. Nix tokens HostGraph added (add HostGraphTheorems twins)

HostGraph ElabMeet slice edited three presence files. `host-specs-compile-path-2.nix` already has product HostGraph / HostGraphTheorems specs (797-875). Do not treat that as the ElabMeet probe gate. Do not invent ElabMeet tokens there.

`nix/systems-host-presence/host-leans.nix` 447 and `required-files.nix` 462:

```
src/systems/SystemsLean/ElabMeetNamedHostGraphProbe.lean
```

Add after that:

```
src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean
src/systems/SystemsLean/ElabMeetNamedHostGraphTheoremsProbe.lean
```

`nix/systems-host-presence/host-specs-hold-close.nix`:

1. ElabMeet ready tokens 1157-1160: four HostGraph Bools. Append four HostGraphTheorems Bools.
2. HostTerm-walk spec 2046-2052: HostGraph wrapper tokens live on the sixteenth walk file. Seventeenth wrappers get a NEW spec block on the new walk file (clone that token group; HostGraphTheorems names).
3. New probe spec after 2115-2139. Clone HostGraph probe `all` list, rename HostGraph -> HostGraphTheorems, add `elabMeetNamedHostGraphTheoremsSubsetProbe`.
4. ElabMeetTheorems spec 2242-2245: four HostGraph theorem strings. Append four HostGraphTheorems theorem strings.

## 6. Line counts (last `end` / last line on disk)

| File | Lines | Absorb 17? |
|------|------:|------------|
| `ElabMeetSubset.lean` | 865 | No. +~124 probe would pass ~880. |
| `ElabMeetCompile.lean` | 916 | Do not grow. |
| `ElabMeetNamedWalk.lean` | 322 | Helpers only. |
| `ElabMeetNamedWalkLater.lean` | 785 | No. |
| `ElabMeetNamedWalkTail.lean` | 863 | No. |
| `ElabMeetNamedWalkHostTerm.lean` | 841 | No. +~108 wrappers would pass ~880. |
| `ElabMeetNamedHostGraphProbe.lean` | 200 | No. Do not dump 17 onto 16. |
| `ElabMeetNamedHostCheckProbe.lean` | 199 | No. |
| `ElabMeetNamedHostFrontTheoremsProbe.lean` | 198 | No. |
| `ElabMeetTheorems.lean` | 635 | Four theorems only. |
| `ElabMeet.lean` | 723 | Fold only. |

New files (neither exists; grep empty under `src/systems`):

- `ElabMeetNamedHostGraphTheoremsProbe.lean`
- `ElabMeetNamedWalkHostGraphTheorems.lean`

## 7. Living metric and Open Name 143

Metric everywhere that is current: **16 of about 206** (Mult, Types, MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph). Host tools without Lake on the step: **0 of about 69**. Linear use-check: **not started**. Same-job: Lake idle-hot **0.459 s**.

Open Name 143 (`RESIDUAL-systems.md` 680-689): Grow HostGraphTheorems subset. Goal: add `SystemsLean.HostGraphTheorems` (imports only HostGraph). Skip Linear. Skip IrGraph. Do not add HostGraphMain. Done when: 17 of about 206; good / planted-error; isolation vs sixteen-module walk; leftover temp `good.lean` and leftover fake `lean_lib ElabMeetRichLib` stay false; four theorems FIRST then native_decide; TDD red then extract-first then green; pins stay. Isolation fold uses `notAliasOfSixteenth` and prior walker `tryCompileNamedHostGraphSubset`. Status: **open**.

WATCHER and plan living tip already name both new files.

## 8. Stale `RESIDUAL.md` sentence to fix

Join-board living tip, `RESIDUAL.md` around line 292, still says (quote):

`Highest-value next: **Grow HostFrontTheorems subset** (open). Grow HostFront subset is **done**. Grow HostFrontGoldens subset is **done**. Grow HostTerm subset is **done**. Named closed subset is **13 of about 206** (SystemsLean.Mult, SystemsLean.Types, SystemsLean.MultTheorems, SystemsLean.TypesTheorems, SystemsLean.Erasure, SystemsLean.ErasureTheorems, SystemsLean.Extract, SystemsLean.ExtractTheorems, SystemsLean.IrProgram, SystemsLean.IrProgramTheorems, SystemsLean.HostTerm, SystemsLean.HostFrontGoldens, SystemsLean.HostFront). Next is HostFrontTheorems (imports only HostFront; HostFront is now closed).`

Same paragraph later (line 330) and Highest value next (line 338) already say Grow HostGraphTheorems subset and 16 of about 206. Fix only the stale 13 / HostFrontTheorems sentence. Do not grow `AGENTS.md` on this slice.

## 9. Pins (do not flip)

| Pin | Value | Site |
|-----|-------|------|
| `slakeOwnsPackageTypecheck` | **false** | `ElabMeet.lean:419` |
| `elabMeetFullHostElaborateRemains` | **false** | `ElabMeet.lean:423` |
| `hostResidualShrinkFullHostElaborateRemains` | **false** | `HostResidualShrink.lean:227` |
| `llvmCfgFixtureDominanceClaimed` | **false** | `LlvmCfgHonesty.lean:86` |
| `llvmMultSsaFullBackendClaimed` | **false** | `LlvmMultSsa.lean:142` |

Ready fold still starts with `!slakeOwnsPackageTypecheck`. DualResidual `residualFreeClaimed` stays true. SpecProof `residualFreeClaimed` stays false.

## 10. HostGraphTheorems already exists (do not plant live)

- Product module `src/systems/SystemsLean/HostGraphTheorems.lean` **exists** (230 lines). Sole import line 40: `import SystemsLean.HostGraph`. Same namespace `SystemsLean.HostGraph`.
- Already in the product barrel: `SystemsLean.lean:105`.
- That is the live file to **typecheck**, not to overwrite. Bad path is a temp copy plus planted type error.
- ElabMeet seventeenth modules do **not** exist. HostGraphTheorems is **not** in the named closed sixteen. After this slice it becomes the seventeenth member.

## Implement order

1. Red: four theorems in `ElabMeetTheorems.lean` (Bools missing). `lake build SystemsLean.ElabMeetTheorems` must fail on unknown identifiers.
2. Extract wrappers into `ElabMeetNamedWalkHostGraphTheorems.lean`.
3. Extract probe into `ElabMeetNamedHostGraphTheoremsProbe.lean`.
4. Wire barrel + ElabMeet fold + Nix presence. Membership = 16 + HostGraphTheorems.
5. Green: same four theorems, same lines. Pins stay. Leftover seed walk stays closed.

Gates: `lake build SystemsLean.ElabMeetTheorems`; `lake build SystemsLean.ElabMeet`; `just hygiene`; `just professional-tone`; `just systems-host`.
