# Review -- Grow HostImportGraphMods (23 of about 206)

Date: 2026-08-16.
Reviewer: L3 general reviewer. Product sources were not edited.

## 1. Verdict

**APPROVE WITH NITS**

The twenty-third named closed subset lands. Live `SystemsLean.HostImportGraphMods` is a named ElabMeet member. Isolation is versus the twenty-second HostImportGraphModel walk, not an alias. Four theorems stay `= true := by native_decide`. Pins are unchanged. Next Open is Grow HostImportGraphModsLater.

## 2. Blocker count and nit count

- Blockers: **0**
- Nits: **2**

## 3. May Grow HostImportGraphModsLater start: yes or no

**yes**

Living Open, WATCHER, SESSION-HANDOFF, and the Systems residual ledger already name Grow HostImportGraphModsLater. Do not open Grow HostImportGraph. After ModsLater, the honest next-after Name is Grow HostImportGraphLoadOkLater (barrel import 114), not Grow HostImportGraphLoadOk and not the hub.

## 4. Evidence for each review bar item

### 4.1 Four theorems still `= true := by native_decide`

File: `src/systems/SystemsLean/ElabMeetTheorems.lean` lines 769-787.

| Theorem | Proof |
|---------|-------|
| `elabMeetDrivesNamedHostImportGraphModsSubset_true` | `= true := by native_decide` |
| `elabMeetAcceptsGoodNamedHostImportGraphModsSubset_true` | `= true := by native_decide` |
| `elabMeetRejectsBadNamedHostImportGraphModsSubset_true` | `= true := by native_decide` |
| `elabMeetRejectsOldWalkAsNamedHostImportGraphModsSubset_true` | `= true := by native_decide` |

Theorems were not rewritten after red. Probe examples at `ElabMeetNamedHostImportGraphModsProbe.lean` 202-205 use `rfl` on the same four Bools.

### 4.2 Drive fold includes isolation; isolation versus Model

Probe `ElabMeetNamedHostImportGraphModsProbe.lean` 186-190:

```
if good && !badCompiled && isolation then true else false
```

Isolation (155-158) is:

- live Mult and MultTheorems still compile
- leftover temp `good.lean` is false (`tryCompileNamedHostImportGraphModsSubset` on a snippet)
- leftover fake package is false (`leftoverFakePackageLakefileText`)
- prior walker `tryCompileNamedHostImportGraphModelSubset` still succeeds
- `notAliasOfTwentySecond` (146-154): Mods names and compile order differ from Model; only the twenty-third list contains `SystemsLean.HostImportGraphMods`; Model names do not contain that module

This is not an alias of the twenty-second HostImportGraphModel walk. Prior walker is the Model subset, not Seeds.

### 4.3 Pins 8/8 unchanged

Verified in product Lean (see section 8).

### 4.4 AGENTS.md left alone

Allowed lag. `AGENTS.md` still says **13 of about 206** and still names Grow HostFrontTheorems as next remaining work. Nit only. Not a blocker.

### 4.5 Residual Open is Grow HostImportGraphModsLater; metric 23 of about 206

- `RESIDUAL-systems.md` item 150 Open Name: Grow HostImportGraphModsLater. Metric **23 of about 206**. Status of item 149 is done.
- `WATCHER.md` fence: `/implement --effort 2 Grow HostImportGraphModsLater`. Table says 23 of about 206 including HostImportGraphMods.
- `doc/SESSION-HANDOFF.md`: Grow HostImportGraphMods subset is done. Next is Grow HostImportGraphModsLater. Metric 23 of about 206. Seeds walk 441. Do not open Grow HostImportGraph.
- `RESIDUAL.md` Systems Open table item 150 is open and names ModsLater. Item 149 is done.

Stale prose only: `RESIDUAL.md` "Highest value next" still says HostImportGraphSeeds walk is **305** and still describes a twenty-third probe as the extract-first job. Living Open, WATCHER, handoff, and the systems ledger already have 441 and ModsLater Open. Nit. Not a blocker for starting ModsLater.

### 4.6 Nix presence

- `required-files.nix` 481-482: new probe listed after the Model probe, before `ElabMeetSubset.lean`. No Mods walk path.
- `host-leans.nix` 466-467: same.
- `host-specs-hold-close.nix` Seeds walk `rel` (2255-2289): Mods helper tokens (`findLiveHostImportGraphModsPath`, names, compile order, barrel, tryCompile, after-deps, `SystemsLean.HostImportGraphMods`).
- New probe spec 2427-2451 after the Model probe, before ElabMeetTheorems `rel`.
- Four Bool strings at 1185-1188 and 2440-2443.
- Four theorem name strings at 2582-2585.
- Barrel `SystemsLean.lean` 336: `import SystemsLean.ElabMeetNamedHostImportGraphModsProbe` after the Model probe (335). Product `import SystemsLean.HostImportGraphMods` already at 111. No second product import.

`just systems-host` was reported exit 0 with 396 required paths by implementer and mop.

### 4.7 Live HostImportGraphMods.lean was not planted

`src/systems/SystemsLean/HostImportGraphMods.lean` already existed (774 lines). Header import is `SystemsLean.HostImportGraphModel` only. Last line is `end SystemsLean.HostImportGraph`. No `plantedTypeError` on the live file. Do not require a new plant.

`ElabMeetNamedWalkHostImportGraphMods.lean` does **not** exist. Twenty-third wrappers live on `ElabMeetNamedWalkHostImportGraphSeeds.lean`. Header there says "Do not add ElabMeetNamedWalkHostImportGraphMods."

### 4.8 Lake from `src/systems`

Red log `/tmp/grok-1000/grok-red-grow-hostimportgraphmods-20260816.md`:

- command: `lake build SystemsLean.ElabMeetTheorems`
- cwd: `/home/hunter/Projects/ai/iso/src/systems`
- exit 1 at 2026-08-16T15:35:23Z through 15:35:24Z
- fail reason: unknown Bools treated as free variables on the four theorem names at lines 770, 775, 780, 785

Green (implementer):

- same cwd, same filter, start 2026-08-16T15:38:36Z, end 16:06:50Z, exit 0, about 1694s (Mods probe about 1651s)
- `lake build SystemsLean.ElabMeet` exit 0 in 945ms

Mop independently re-ran both lake builds warm from `src/systems`: ElabMeetTheorems exit 0; ElabMeet exit 0. This review did not re-run lake. Code, residual, Nix, and both reports agree.

## 5. TDD honesty (red observed then green)

Honest red then green.

1. Four theorems landed first so `lake build SystemsLean.ElabMeetTheorems` from `src/systems` failed on unknown Bools (free-variable expected type). Probe module and wrappers were not present yet.
2. Same four theorems then went green via `native_decide`. Statements were not rewritten.
3. Red log exists on disk with command, cwd, exit 1, fail reason, and timestamps.
4. Green used the same lake filter and cwd. Mop confirmed warm oleans still exit 0.

This is not a green-only drive-by.

## 6. Product correctness notes

Isolation is versus HostImportGraphModel (twenty-second), not Seeds and not an alias. Membership is Model names plus `SystemsLean.HostImportGraphMods`. Compile order is Model compile order plus HostImportGraphMods last, which keeps the inherited extra-dep block (IrGraph, HostCompose, CompilePath, six Emit scaffolds, six Emit modules, six CompilePath units, FirstSurface, six SubsetEmit modules, HostPackageWrite, HostPackageWriteTheorems, HostPackageRoots, HostImportGraphSeeds, HostImportGraphModel) and then HostImportGraphMods last. After-deps are Model after-deps plus HostImportGraphModel. Skip Linear. Skip IrGraph as a named member. Skip HostGraphMain.

No new Mods walk file. Wrappers stay on the Seeds walk.

Measured `wc -l`:

| Path | Lines |
|------|------:|
| ElabMeetNamedHostImportGraphModsProbe.lean | 207 |
| ElabMeetNamedWalkHostImportGraphSeeds.lean | 441 |
| ElabMeetNamedWalkHostPackageWrite.lean | 622 |
| ElabMeetNamedWalkHostTerm.lean | 841 |
| ElabMeetSubset.lean | 865 |
| ElabMeetCompile.lean | 916 |
| ElabMeetTheorems.lean | 789 |
| ElabMeet.lean | 771 |
| HostImportGraphMods.lean | 774 |
| ElabMeetNamedHostImportGraphModelProbe.lean | 206 |

HostPackageWrite stayed 622. Subset stayed 865. Compile stayed 916. Seeds walk 441 is under the walk bar of about 780. New probe 207 keeps Subset under about 880.

Isolation command is `#elabMeetNamedHostImportGraphModsSubsetProbe` (not an alias of the Model command).

## 7. Residual honesty

Grow HostImportGraphMods is **done**. Named closed subset is **23 of about 206**. Next Open is **Grow HostImportGraphModsLater**. Do not open Grow HostImportGraph.

Living lockstep holds on `RESIDUAL-systems.md`, `WATCHER.md`, `SESSION-HANDOFF.md`, and `RESIDUAL.md` item 150.

The only residual honesty miss is stale extract-first prose in the `RESIDUAL.md` "Highest value next" paragraph (Seeds walk still 305; still talks about a twenty-third probe). That paragraph already names ModsLater as highest value next and already lists 23 of about 206 including HostImportGraphMods. Fix on a later residual mop if wanted. Not required before ModsLater starts.

## 8. Pins table

| Pin | Required | Observed | File |
|-----|----------|----------|------|
| `slakeOwnsPackageTypecheck` | false | false | `ElabMeet.lean` 433 |
| `elabMeetFullHostElaborateRemains` | false | false | `ElabMeet.lean` 437 |
| `hostResidualShrinkFullHostElaborateRemains` | false | false | `HostResidualShrink.lean` 227 |
| `llvmCfgFixtureDominanceClaimed` | false | false | `LlvmCfgHonesty.lean` 86 |
| `llvmMultSsaFullBackendClaimed` | false | false | `LlvmMultSsa.lean` 142 |
| DualResidual `residualFreeClaimed` | true | true | `DualResidual.lean` 227 |
| SpecProof `residualFreeClaimed` | false | false | `SpecProof.lean` 406 |
| SpecProof `proofCompleteClaimed` | true | true | `SpecProof.lean` 389 |

No claim-bool flips on this slice.

## 9. Blockers and nits

No blockers.

### Issue 1 -- Severity: nit
- File: `AGENTS.md:341`
- Description: Progress metric still says 13 of about 206 and still names Grow HostFrontTheorems as next remaining work. The review bar allows this lag.
- Suggestion: Update the living remaining-work sentence on a later hygiene pass if desired. Do not block ModsLater for it.
- Status: open

### Issue 2 -- Severity: nit
- File: `RESIDUAL.md:1270`
- Description: "Highest value next" already names Grow HostImportGraphModsLater and 23 of about 206, but the extract-first sentences still say HostImportGraphSeeds walk is 305 and still describe a twenty-third probe. Living Open item 150, WATCHER, SESSION-HANDOFF, and RESIDUAL-systems.md already say Seeds walk 441 and ModsLater Open.
- Suggestion: Refresh those two stale sentences to Seeds walk 441 and twenty-fourth probe / ModsLater wrappers. Optional. Not required to start ModsLater.
- Status: open

## 10. Final one-line recommendation

**APPROVE WITH NITS.** Grow HostImportGraphModsLater may start: **yes**.
