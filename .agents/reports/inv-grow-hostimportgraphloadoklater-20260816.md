# Inventory: Grow HostImportGraphLoadOkLater (25 of about 206)

Date: 2026-08-16
Kind: inventory only. Product was not edited. Lake was not run.

This is the extract-first inventory for the living Open Name
**Grow HostImportGraphLoadOkLater**. Clone source is Grow
HostImportGraphModsLater (24 of about 206). Do not plant live
`HostImportGraphLoadOkLater.lean`. Do not open Grow HostImportGraph
(hub 119) or Grow HostImportGraphLoadOk (hub 113).

## Verdict for the later implementer

- Live product `HostImportGraphLoadOkLater.lean` **already exists**
  (526 lines). Do not overwrite it.
- The twenty-fifth probe, LoadOkLater wrappers, four LoadOkLater
  Bools, four LoadOkLater theorems, isolation command, and Nix probe
  rows **do not exist**.
- Extract-first: **new probe yes**, **new walk no**. Grow wrappers on
  the existing Seeds walk (578). Projected 578 + 137 = 715, under the
  walk bar of about 780.
- TDD status: the four LoadOkLater theorems are **not on disk**.
  Land them first so `lake build SystemsLean.ElabMeetTheorems` goes
  red on unknown names. The four ModsLater theorems are already on
  disk and stay.
- Residual living Open on all four living files is **Grow
  HostImportGraphLoadOkLater**. After this Name: Grow
  HostImportGraphWalkLater. Do not open WalkLater now.

## What already exists (do not plant)

| Path | Lines | Role |
|------|------:|------|
| `src/systems/SystemsLean/HostImportGraphLoadOkLater.lean` | 526 | Live product. Last line `end SystemsLean.HostImportGraph`. Header import is `import SystemsLean.HostImportGraphModsLater` only. Namespace `SystemsLean.HostImportGraph`. Fold `hostImportGraphLoadOkImportEdges`. |
| `src/systems/SystemsLean/HostImportGraphLoadOk.lean` | 498 | Hub. Imports ModsLater and LoadOkLater. **Do not open** as a named member. |
| `src/systems/SystemsLean/HostImportGraphModsLater.lean` | 768 | Twenty-fourth named member. Clone source product. |
| `src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean` | 207 | Clone source probe. Isolation `#elabMeetNamedHostImportGraphModsLaterSubsetProbe`. |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` | 578 | Wrapper home. ModsLater wrappers occupy 466-576. Last content line is `end SystemsLean.ElabMeet`. |
| `src/systems/SystemsLean/ElabMeet.lean` | 776 | Folds ModsLater four Bools at 749-752 into `elabMeetReady` (starts 543). Probe import at 411. |
| `src/systems/SystemsLean/ElabMeetTheorems.lean` | 811 | Four ModsLater theorems at 791-809. Probe import at 70. Last content 811. |
| `src/systems/SystemsLean.lean` | 340 | Product `import SystemsLean.HostImportGraphLoadOkLater` at 114. Probe imports stop at ModsLater (337). |
| `nix/systems-host-presence/required-files.nix` | (product 132) | Product LoadOkLater already listed. Probe list stops at ModsLater (484). |
| `nix/systems-host-presence/host-leans.nix` | (product 120) | Same. Probe list stops at ModsLater (469). |
| `nix/systems-host-presence/host-specs-hold-close.nix` | ModsLater only | Bools 1189-1192. Seeds walk `rel` tokens 2288-2294. Probe `rel` 2465-2490. Theorems 2624-2627. |

No committed Bad sidecar for ModsLater. The ModsLater probe writes a
temp file `badDir / ElabMeetNamedHostImportGraphModsLaterSubsetBad.lean`
at runtime. That pattern is correct. Do not commit a LoadOkLater Bad
sidecar either.

## What is missing

| Path or name | Status |
|--------------|--------|
| `src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean` | **MISSING** (required; new probe) |
| `src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterSubsetBad.lean` | **MISSING** (expected; do not create a committed sidecar) |
| `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphLoadOkLater.lean` | **MISSING** (leave missing; do not add a new walk) |
| `HostImportGraphLoadOkLaterTheorems.lean` | **MISSING** (do not invent) |
| `#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe` | **unused** (zero hits in the tree) |
| Four LoadOkLater Bools (see below) | **absent from all `.lean`** |
| Four LoadOkLater `_true` theorems | **absent from all `.lean`** |
| LoadOkLater wrappers on the Seeds walk | **absent** |
| Barrel probe import after line 337 | **absent** |
| ElabMeet probe import after line 411 | **absent** |
| ElabMeet four-Bool fold after line 752 | **absent** |
| ElabMeetTheorems probe import after line 70 | **absent** |
| ElabMeetTheorems four theorems after line 809 | **absent** |
| Nix probe rows after ModsLater (required-files 484, host-leans 469) | **absent** |
| host-specs LoadOkLater probe `rel` | **absent** |
| host-specs LoadOkLater Bools / `_true` strings | **absent** |

The four LoadOkLater Bools were grepped across `*.lean`. Zero matches:

1. `elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset`
2. `elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset`
3. `elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset`
4. `elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset`

Those names appear only in residual / watcher / brief prose as the
owed contract, not as Lean defs.

## Exact current line counts

Measured with `wc -l` this inventory (2026-08-16). Last content line
matches `wc` on every file that exists.

| Path | Lines | Note |
|------|------:|------|
| HostImportGraphLoadOkLater.lean | 526 | Live. Do not plant. |
| ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean | -- | missing |
| ElabMeetNamedHostImportGraphLoadOkLaterSubsetBad.lean | -- | missing (expected) |
| ElabMeetNamedWalkHostImportGraphSeeds.lean | 578 | wrapper home |
| ElabMeetNamedHostImportGraphModsLaterProbe.lean | 207 | clone pattern |
| ElabMeetNamedHostImportGraphModsLaterSubsetBad.lean | -- | missing (temp only; correct) |
| ElabMeet.lean | 776 | fold only |
| ElabMeetTheorems.lean | 811 | theorems first |
| ElabMeetSubset.lean | 865 | do not grow; no ModsLater/LoadOkLater dump |
| ElabMeetCompile.lean | 916 | do not grow |
| ElabMeetNamedWalkLater.lean | 785 | do not grow |
| ElabMeetNamedWalkTail.lean | 863 | do not grow |
| ElabMeetNamedWalkHostTerm.lean | 841 | do not grow |
| ElabMeetNamedWalk.lean | 322 | shared helpers only |
| ElabMeetNamedWalkHostPackageWrite.lean | 622 | must stay |
| HostImportGraphModsLater.lean | 768 | twenty-fourth product |
| HostImportGraphLoadOk.lean | 498 | hub; do not open |
| SystemsLean.lean | 340 | barrel |

Extract-first math (unchanged from the brief):

- Walk bar about 780. Seeds 578 + measured last wrapper family 137 =
  715. Range if wrappers are 110 to 205 is 688 to 783. This add stays
  under about 780. **New walk: no.**
- Leftover / Subset bar about 880. Subset 865 + about 207 probe =
  1072. **New probe: yes.** Tail 863 and Later 785 cannot take another
  leftover wrapper.

## TDD status

| Item | On disk? |
|------|----------|
| ModsLater four theorems (`= true := by native_decide`) | **yes** (ElabMeetTheorems 791-809) |
| ModsLater four Bools (defined by probe command) | **yes** (probe 191-198; examples 202-205 use `rfl`) |
| LoadOkLater four theorems | **no** |
| LoadOkLater four Bools | **no** |

Implementer TDD order from the brief (do not skip):

1. Land the four LoadOkLater theorems first in `ElabMeetTheorems.lean`
   so `lake build SystemsLean.ElabMeetTheorems` fails on unknown Bools
   or a missing probe import.
2. Record that red (command, exit 1, unknown names). Lake cwd is
   `/home/hunter/Projects/ai/iso/src/systems` only.
3. Grow Seeds wrappers. Add the new probe. Fold imports and four
   Bools. Update Nix presence.
4. Re-run the same lake filter. Same four theorems green via
   `native_decide`. Do not rewrite theorems. Probe examples use `rfl`.

Theorems to land first (each `= true := by native_decide`):

1. `elabMeetDrivesNamedHostImportGraphLoadOkLaterSubset_true`
2. `elabMeetAcceptsGoodNamedHostImportGraphLoadOkLaterSubset_true`
3. `elabMeetRejectsBadNamedHostImportGraphLoadOkLaterSubset_true`
4. `elabMeetRejectsOldWalkAsNamedHostImportGraphLoadOkLaterSubset_true`

## Residual current Open Name

Living tip agrees on all four files:

| File | Living next |
|------|-------------|
| `RESIDUAL-systems.md` | Open item **Grow HostImportGraphLoadOkLater subset** (table row 151; detail block at line 783). Status **open**. Named closed subset **24 of about 206**. |
| `RESIDUAL.md` | Highest-value next / Systems Open table row 151: **Grow HostImportGraphLoadOkLater subset**. Count **24 of about 206**. |
| `WATCHER.md` | Fenced `/implement --effort 2 Grow HostImportGraphLoadOkLater`. Name: Grow HostImportGraphLoadOkLater subset. |
| `doc/SESSION-HANDOFF.md` | Next: Grow HostImportGraphLoadOkLater subset (barrel import 114). Metric 24 of about 206. |

ModsLater is **done** (row 150). Hubs Grow HostImportGraph and Grow
HostImportGraphLoadOk are not Open. Review nits (stale mid-body
RESIDUAL.md 20-of-206 leftover; AGENTS.md still says 13 /
HostFrontTheorems; successor WalkLater not named on the four living
files) are documentation leftovers. Living Open is LoadOkLater.

After this Name lands: **Grow HostImportGraphWalkLater** (barrel 116).
Do not open it now.

## Clone contract (retarget ModsLater to LoadOkLater)

Ten wrappers to add on
`ElabMeetNamedWalkHostImportGraphSeeds.lean` after the ModsLater
family (after line 576, before `end SystemsLean.ElabMeet`):

1. `findLiveHostImportGraphLoadOkLaterPath`
2. `namedClosedHostImportGraphLoadOkLaterSubsetNames`
3. `namedClosedHostImportGraphLoadOkLaterCompileOrder`
4. `barrelListsNamedHostImportGraphLoadOkLaterSubset`
5. `tryCompileNamedHostImportGraphLoadOkLaterSubsetIO`
6. `tryCompileNamedHostImportGraphLoadOkLaterSubsetIOSafe`
7. `tryCompileNamedHostImportGraphLoadOkLaterSubset`
8. `tryCompileAfterHostImportGraphLoadOkLaterDepsIO`
9. `tryCompileAfterHostImportGraphLoadOkLaterDepsIOSafe`
10. `tryCompileAfterHostImportGraphLoadOkLaterDeps`

Membership = ModsLater names ++ `["SystemsLean.HostImportGraphLoadOkLater"]`.
Compile order = ModsLater compile order ++ same last name.
After-deps = ModsLater after-deps ++ `SystemsLean.HostImportGraphModsLater`.
Do **not** add `SystemsLean.HostImportGraphLoadOk`.

Shared helpers stay in `ElabMeetNamedWalk.lean`. Do not clone those
bodies.

## Exact clone snippets

### 1. ModsLater probe (full isolation command)

File: `src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean`
(1-207). Imports (70-74):

```
import Lean
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk
import SystemsLean.ElabMeetNamedWalkHostPackageWrite
import SystemsLean.ElabMeetNamedWalkHostImportGraphSeeds
```

Namespace `SystemsLean.ElabMeet`. Isolation command (95-198) and
invocation (200). How it decides the subset:

1. Resolve live lakefile, live Mult, live MultTheorems, and live
   HostImportGraphModsLater via `findLiveLakefilePath`,
   `findLiveMultPath`, `findLiveMultTheoremsPath`,
   `findLiveHostImportGraphModsLaterPath`.
2. **Good:** `tryCompileNamedHostImportGraphModsLaterSubset liveLake
   oleanDir` on the live lakefile. That walker uses the twenty-four
   name list and compile order (ModsLater last).
3. **Bad:** if live ModsLater is missing, treat as compiled (so reject
   fails). Else copy live text, append
   `def plantedTypeError : Nat := true`, write temp
   `badDir / ElabMeetNamedHostImportGraphModsLaterSubsetBad.lean`,
   then `tryCompileAfterHostImportGraphModsLaterDeps` as module
   `ElabMeetNamedHostImportGraphModsLaterSubsetBad`.
4. **Isolation** is the conjunction of:
   - live Mult still compiles (`tryCompileLiveModule`)
   - live MultTheorems still compiles (`tryCompileLiveTheorems`)
   - prior twenty-three walker
     `tryCompileNamedHostImportGraphModsSubset` still succeeds
   - this walker on leftover temp `good.lean` (`def n : Nat := 0`)
     is **false**
   - this walker on leftover fake package
     `leftoverFakePackageLakefileText` is **false**
   - `notAliasOfTwentyThird`: ModsLater names != Mods names, ModsLater
     compile order != Mods compile order, ModsLater names contain
     `SystemsLean.HostImportGraphModsLater`, Mods names do **not**
5. Drive = `good && !badCompiled && isolation`.
6. The command elaborates four `def ... : Bool := true/false` names,
   then `#elabMeetNamedHostImportGraphModsLaterSubsetProbe` runs, then
   four `example : ... = true := rfl`.

Full isolation body (lines 95-198):

```
elab "#elabMeetNamedHostImportGraphModsLaterSubsetProbe" : command => do
  let liveLake? <- liftIO findLiveLakefilePath
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let liveHostImportGraphModsLater? <- liftIO findLiveHostImportGraphModsLaterPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let fakeDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphModsLaterSubset liveLake oleanDir
  let badCompiled <-
    match liveHostImportGraphModsLater? with
    | none =>
      pure true
    | some liveHostImportGraphModsLater => do
      let liveText <- liftIO (IO.FS.readFile liveHostImportGraphModsLater)
      let badPath :=
        badDir / "ElabMeetNamedHostImportGraphModsLaterSubsetBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileAfterHostImportGraphModsLaterDeps
        badPath badDir `ElabMeetNamedHostImportGraphModsLaterSubsetBad
  let liveMultStillOk <-
    match liveMult? with
    | none => pure false
    | some liveMult =>
      tryCompileLiveModule liveMult isoDir
  let thmIsoDir <- liftIO IO.FS.createTempDir
  let liveThmStillOk <-
    match liveThm? with
    | none => pure false
    | some liveThm =>
      tryCompileLiveTheorems liveThm thmIsoDir
  let subsetIsoDir <- liftIO IO.FS.createTempDir
  let priorSubsetStillOk <-
    match liveLake? with
    | none => pure false
    | some liveLake =>
      tryCompileNamedHostImportGraphModsSubset liveLake subsetIsoDir
  let goodIso := isoDir / "good.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  let thisOnTempSnippet <-
    tryCompileNamedHostImportGraphModsLaterSubset goodIso isoDir
  let fakeLake := fakeDir / "lakefile.lean"
  liftIO (IO.FS.writeFile fakeLake leftoverFakePackageLakefileText)
  let thisOnFakePackage <-
    tryCompileNamedHostImportGraphModsLaterSubset fakeLake fakeDir
  let notAliasOfTwentyThird :=
    namedClosedHostImportGraphModsLaterSubsetNames
      != namedClosedHostImportGraphModsSubsetNames
      && namedClosedHostImportGraphModsLaterCompileOrder
           != namedClosedHostImportGraphModsCompileOrder
      && namedClosedHostImportGraphModsLaterSubsetNames.contains
           "SystemsLean.HostImportGraphModsLater"
      && !namedClosedHostImportGraphModsSubsetNames.contains
           "SystemsLean.HostImportGraphModsLater"
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfTwentyThird
  ... cleanup temps ...
  let dStx <-
    if good && !badCompiled && isolation then
      `(true)
    else
      `(false)
  let gN := mkIdent `elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset
  let rN := mkIdent `elabMeetRejectsBadNamedHostImportGraphModsLaterSubset
  let iN := mkIdent `elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset
  let dN := mkIdent `elabMeetDrivesNamedHostImportGraphModsLaterSubset
  elabCommand (<- `(def $gN : Bool := $gStx))
  ...
```

Retarget for LoadOkLater:

- Command `#elabMeetNamedHostImportGraphLoadOkLaterSubsetProbe`
- Live path `findLiveHostImportGraphLoadOkLaterPath`
- Good walker `tryCompileNamedHostImportGraphLoadOkLaterSubset`
- Bad temp `ElabMeetNamedHostImportGraphLoadOkLaterSubsetBad.lean`
- After-deps `tryCompileAfterHostImportGraphLoadOkLaterDeps`
- Prior walker `tryCompileNamedHostImportGraphModsLaterSubset`
- Alias check `notAliasOfTwentyFourth` vs ModsLater names / compile
  order; these names must contain
  `SystemsLean.HostImportGraphLoadOkLater`; ModsLater names must not.
  Do not put `SystemsLean.HostImportGraphLoadOk` on the twenty-fifth
  list.
- Four Bools as listed in What is missing.

### 2. ModsLater wrappers on Seeds walk (466-576)

File: `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean`

```
/-- Resolve live SystemsLean/HostImportGraphModsLater.lean. -/
def findLiveHostImportGraphModsLaterPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostImportGraphModsLater"

def namedClosedHostImportGraphModsLaterSubsetNames : List String :=
  namedClosedHostImportGraphModsSubsetNames ++
    ["SystemsLean.HostImportGraphModsLater"]

def namedClosedHostImportGraphModsLaterCompileOrder : List String :=
  namedClosedHostImportGraphModsCompileOrder ++
    ["SystemsLean.HostImportGraphModsLater"]

def barrelListsNamedHostImportGraphModsLaterSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostImportGraphModsLaterSubsetNames

unsafe def tryCompileNamedHostImportGraphModsLaterSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostImportGraphModsLaterSubsetNames
    namedClosedHostImportGraphModsLaterCompileOrder

@[implemented_by tryCompileNamedHostImportGraphModsLaterSubsetIO]
opaque tryCompileNamedHostImportGraphModsLaterSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

def tryCompileNamedHostImportGraphModsLaterSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostImportGraphModsLaterSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

unsafe def tryCompileAfterHostImportGraphModsLaterDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.Types",
      "SystemsLean.IrProgram", "SystemsLean.IrGraph",
      "SystemsLean.Erasure", "SystemsLean.Extract",
      "SystemsLean.HostCompose", "SystemsLean.CompilePath",
      "SystemsLean.EmitMultScaffold", "SystemsLean.EmitLinearScaffold",
      "SystemsLean.EmitTypesScaffold", "SystemsLean.EmitProgramScaffold",
      "SystemsLean.EmitGraphScaffold", "SystemsLean.EmitComposeScaffold",
      "SystemsLean.EmitMult", "SystemsLean.EmitLinear",
      "SystemsLean.EmitTypes", "SystemsLean.EmitProgram",
      "SystemsLean.EmitGraph", "SystemsLean.EmitCompose",
      "SystemsLean.CompilePathMult", "SystemsLean.CompilePathLinear",
      "SystemsLean.CompilePathTypes", "SystemsLean.CompilePathProgram",
      "SystemsLean.CompilePathGraph", "SystemsLean.CompilePathCompose",
      "SystemsLean.FirstSurface", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront",
      "SystemsLean.HostGraph", "SystemsLean.MultSubsetEmit",
      "SystemsLean.LinearSubsetEmit", "SystemsLean.TypesSubsetEmit",
      "SystemsLean.ProgramSubsetEmit", "SystemsLean.GraphSubsetEmit",
      "SystemsLean.ComposeSubsetEmit", "SystemsLean.HostPackageWrite",
      "SystemsLean.HostPackageWriteTheorems",
      "SystemsLean.HostPackageRoots",
      "SystemsLean.HostImportGraphSeeds",
      "SystemsLean.HostImportGraphModel",
      "SystemsLean.HostImportGraphMods"]
```

LoadOkLater after-deps = that list ++
`SystemsLean.HostImportGraphModsLater`. Last six become
HostPackageWriteTheorems, HostPackageRoots, HostImportGraphSeeds,
HostImportGraphModel, HostImportGraphMods, HostImportGraphModsLater.

### 3. ElabMeet four-Bool fold (749-752)

`elabMeetReady` starts at line 543. ModsLater fold is the last four
conjuncts today:

```
  && elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset
  && elabMeetRejectsBadNamedHostImportGraphModsLaterSubset
  && elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset
  && elabMeetDrivesNamedHostImportGraphModsLaterSubset
```

Append the four LoadOkLater Bools after 752. Import the new probe
after line 411 (`import SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe`).

### 4. ElabMeetTheorems ModsLater theorems (791-809)

```
theorem elabMeetDrivesNamedHostImportGraphModsLaterSubset_true :
    elabMeetDrivesNamedHostImportGraphModsLaterSubset = true := by
  native_decide

theorem elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset_true :
    elabMeetAcceptsGoodNamedHostImportGraphModsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsBadNamedHostImportGraphModsLaterSubset_true :
    elabMeetRejectsBadNamedHostImportGraphModsLaterSubset = true := by
  native_decide

theorem elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset_true :
    elabMeetRejectsOldWalkAsNamedHostImportGraphModsLaterSubset = true := by
  native_decide
```

Clone after 809. Import the new probe after line 70.

### 5. Barrel folds

`src/systems/SystemsLean.lean`:

- Product already at 114: `import SystemsLean.HostImportGraphLoadOkLater`.
  Do not add a second product import. Do not add the LoadOk hub to
  the membership list.
- Probe imports 336-338:

```
import SystemsLean.ElabMeetNamedHostImportGraphModsProbe
import SystemsLean.ElabMeetNamedHostImportGraphModsLaterProbe
import SystemsLean.ElabMeetSubset
```

Add `import SystemsLean.ElabMeetNamedHostImportGraphLoadOkLaterProbe`
after 337 (after ModsLater, before Subset).

### 6. Nix rows (insert probe after ModsLater, before Subset)

`required-files.nix` product already at 130-133:

```
  "src/systems/SystemsLean/HostImportGraphModsLater.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOk.lean"
  "src/systems/SystemsLean/HostImportGraphLoadOkLater.lean"
  "src/systems/SystemsLean/HostImportGraphTheorems.lean"
```

`required-files.nix` probe neighbors 481-486:

```
  # Twenty-third HostImportGraphMods named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsProbe.lean"
  # Twenty-fourth HostImportGraphModsLater named closed subset probe.
  "src/systems/SystemsLean/ElabMeetNamedHostImportGraphModsLaterProbe.lean"
  # Named closed subset from the real package description.
  "src/systems/SystemsLean/ElabMeetSubset.lean"
```

`host-leans.nix` product 118-121 and probe 466-471 are the same
neighbors. Insert the new probe after ModsLater and before
`ElabMeetSubset.lean`. Do not add a LoadOkLater walk path.

`host-specs-hold-close.nix`:

- ElabMeet Bools list ends at ModsLater (1189-1192). Add four
  LoadOkLater Bools after those.
- Seeds walk `rel` (2258-2300) already lists ModsLater wrapper tokens
  at 2288-2294. Grow that same `rel` with LoadOkLater wrapper tokens.
  Do not add a new walk `rel`.
- ModsLater probe `rel` is 2465-2490. Add a new LoadOkLater probe
  `rel` after it (before ElabMeetTheorems `rel` at 2491).
- ElabMeetTheorems strings 2624-2627 are the four ModsLater `_true`
  theorems. Add four LoadOkLater `_true` strings after those.

There is **no** LoadOkLater probe `rel` today. Product LoadOkLater
already has a compile-path spec in `host-specs-compile-path-3.nix`
(rel around 208). That is the live product file, not the ElabMeet
probe. Do not treat it as the probe row.

## Pins / skips (do not flip)

Stay **false**:

- `slakeOwnsPackageTypecheck`
- `elabMeetFullHostElaborateRemains`
- `hostResidualShrinkFullHostElaborateRemains`
- `llvmCfgFixtureDominanceClaimed`
- `llvmMultSsaFullBackendClaimed`
- SpecProof `residualFreeClaimed`

Stay **true**: DualResidual `residualFreeClaimed`; SpecProof
`proofCompleteClaimed`.

Skip Linear. Skip IrGraph as a named member. Skip HostCompose as a
named member. Skip HostGraphMain. Do not invent leftover-walk Names.
Leave `AGENTS.md` alone. No product C. No new shell. ASCII only.

Lake cwd is `/home/hunter/Projects/ai/iso/src/systems` only.

## Primary paths the later implementer may touch

- `src/systems/SystemsLean/ElabMeetNamedHostImportGraphLoadOkLaterProbe.lean` (NEW)
- `src/systems/SystemsLean/ElabMeetNamedWalkHostImportGraphSeeds.lean` (wrappers)
- `src/systems/SystemsLean/ElabMeet.lean` (import + four Bools fold)
- `src/systems/SystemsLean/ElabMeetTheorems.lean` (import + four theorems first)
- `src/systems/SystemsLean.lean` (probe import only)
- `nix/systems-host-presence/required-files.nix`
- `nix/systems-host-presence/host-leans.nix`
- `nix/systems-host-presence/host-specs-hold-close.nix`
- residual / watcher / handoff after GREEN (not AGENTS.md)

Do not edit live `HostImportGraphLoadOkLater.lean`.
Do not edit live `HostImportGraphLoadOk.lean`.
