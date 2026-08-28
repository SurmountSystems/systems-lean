# Review: Grow HostPackageWrite (eighteenth named-subset member)

## Verdict: APPROVE WITH NITS

Independent tree review of the eighteenth named ElabMeet subset member
(SystemsLean.HostPackageWrite). Implementer and mop reports were treated as
claims only. Product Lean was not edited. Full just suite and lake were not
re-run.

## Blockers

None.

## Nits

1. `AGENTS.md` still says Slake typechecks **13 of about 206** through
   HostFront, with next work Grow HostFrontTheorems. Living residual,
   handoff, watcher, and plan already say **18 of about 206** and next
   Grow HostPackageWriteTheorems. Allowed lag. Not a blocker.

2. Stale footer in `RESIDUAL-systems.md` near line 4228 still says
   `WATCHER.md` (Grow HostPackageWrite subset). Living Open, Name 145,
   the WATCHER fence, handoff, and plan already point at Grow
   HostPackageWriteTheorems. Not a second Open Name.

## Evidence by check

### 1. Isolation Name 113

Pass.

`ElabMeetNamedHostPackageWriteProbe.lean` writes leftover temp
`good.lean` (`def n : Nat := 0`) and leftover fake lakefile text
`leftoverFakePackageLakefileText` (`lean_lib ElabMeetRichLib` plus
`module ElabMeetRichLib` from `ElabMeetNamedWalk.lean`). Both must stay
false:

```
  let thisOnTempSnippet <-
    tryCompileNamedHostPackageWriteSubset goodIso isoDir
  ...
  let thisOnFakePackage <-
    tryCompileNamedHostPackageWriteSubset fakeLake fakeDir
```

Prior seventeenth walk still runs as `priorSubsetStillOk` via
`tryCompileNamedHostGraphTheoremsSubset`. Eighteenth walk is not an
alias of the seventeenth:

```
  let notAliasOfSeventeenth :=
    namedClosedHostPackageWriteSubsetNames
      != namedClosedHostGraphTheoremsSubsetNames
      && namedClosedHostPackageWriteCompileOrder
           != namedClosedHostGraphTheoremsCompileOrder
      && namedClosedHostPackageWriteSubsetNames.contains
           "SystemsLean.HostPackageWrite"
      && !namedClosedHostGraphTheoremsSubsetNames.contains
           "SystemsLean.HostPackageWrite"
```

Isolation fold:

```
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfSeventeenth
```

Drive is `good && !badCompiled && isolation`. `ElabMeet.elabMeetReady`
folds the four probe-decided Bools, including
`elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset` (the isolation
conjunct).

Live `HostPackageWrite.lean` was not planted. Planted error is only
written to a temp copy
`ElabMeetNamedHostPackageWriteSubsetBad.lean`. `plantedTypeError` does
not appear in `HostPackageWrite.lean`.

Seventeenth walk still exists and is HostGraphTheorems-only (17 names,
last `SystemsLean.HostGraphTheorems`, no HostPackageWrite). Eighteenth
membership is 18 names, last `SystemsLean.HostPackageWrite`.

### 2. Extract-first

Pass. Independent `wc -l`:

| Lines | Path |
|------:|------|
| 205 | `src/systems/SystemsLean/ElabMeetNamedHostPackageWriteProbe.lean` |
| 242 | `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` |
| 865 | `src/systems/SystemsLean/ElabMeetSubset.lean` |
| 916 | `src/systems/SystemsLean/ElabMeetCompile.lean` |
| 841 | `src/systems/SystemsLean/ElabMeetNamedWalkHostTerm.lean` |
| 191 | `src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean` |
| 745 | `src/systems/SystemsLean/ElabMeet.lean` |
| 680 | `src/systems/SystemsLean/ElabMeetTheorems.lean` |
| 322 | `src/systems/SystemsLean/ElabMeetNamedWalk.lean` |
| 785 | `src/systems/SystemsLean/ElabMeetNamedWalkLater.lean` |
| 863 | `src/systems/SystemsLean/ElabMeetNamedWalkTail.lean` |
| 201 | `src/systems/SystemsLean/ElabMeetNamedHostGraphTheoremsProbe.lean` |

New probe and new walk exist. HostGraphTheorems walk stayed 191 and has
no HostPackageWrite names. Subset has no HostPackageWrite. Compile has
no HostPackageWrite. HostTerm walk has no HostPackageWrite wrappers.

Barrel `SystemsLean.lean` imports
`ElabMeetNamedWalkHostPackageWrite` and
`ElabMeetNamedHostPackageWriteProbe`. `ElabMeet.lean` imports the same
two and folds the four Bools. `ElabMeetTheorems.lean` imports the probe
and walk. `lakefile.lean` still owns the existing
`slake-host-package-write` exe (`HostPackageWriteMain`). New modules
ride the SystemsLean library barrel, which matches prior named-subset
lands.

### 3. TDD

Pass. Four theorems in `ElabMeetTheorems.lean` stay
`= true := by native_decide`:

- `elabMeetDrivesNamedHostPackageWriteSubset_true` (line 661)
- `elabMeetAcceptsGoodNamedHostPackageWriteSubset_true` (line 666)
- `elabMeetRejectsBadNamedHostPackageWriteSubset_true` (line 671)
- `elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset_true` (line 676)

Red log `/tmp/grok-1000/grok-red-grow-hostpackagewrite-20260816.md`
quotes Lake exit 1 with free-variable errors on those same four names
at those same lines before the Bools existed. Theorems were not
rewritten to finish green. Probe also has `example ... := rfl` on the
four Bools.

### 4. Reuse tryCompileNamedMemberListIO

Pass. Eighteenth walker is a four-line IO wrapper:

```
unsafe def tryCompileNamedHostPackageWriteSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostPackageWriteSubsetNames
    namedClosedHostPackageWriteCompileOrder
```

After-deps is a wrapper over `tryCompileAfterNamedDepsIO`, not a cloned
walker. Shared helpers stay on `ElabMeetNamedWalk`.

### 5. Compile order honors HostPackageWrite real imports

Pass. Live `HostPackageWrite.lean` imports HostFront, HostGraph, and
Mult / Linear / Types / Program / Graph / Compose subset-emit.

Membership (`namedClosedHostPackageWriteSubsetNames`) is barrel order
among the eighteen. HostPackageWrite last. Linear, IrGraph, and
HostGraphMain are not grow-tip Names.

Compile order is the prior seventeen compile order, then IrGraph,
HostCompose, CompilePath, emit scaffolds, emit units, CompilePath
units, FirstSurface, the six subset-emit modules, then
HostPackageWrite last. IrGraph and HostCompose are compile
dependencies only (CompilePath imports both). After-deps lists Mult
first, then HostFront, HostGraph, and MultSubsetEmit through
ComposeSubsetEmit plus their real deps.

Import chain checked on disk: MultSubsetEmit imports FirstSurface and
EmitMult; FirstSurface imports CompilePathMult; CompilePathMult
imports CompilePath and EmitMult; CompilePath imports IrGraph and
HostCompose; each unit subset-emit imports its CompilePath unit and
Emit unit; those import CompilePath and the matching emit scaffold.

### 6. Residual lockstep

Pass. Living tip is **18 of about 206**. Open next is Grow
HostPackageWriteTheorems.

- `RESIDUAL-systems.md`: Name 144 done; Name 145 open; metric table 18
- `RESIDUAL.md`: Systems Open and living tip 18 / HostPackageWriteTheorems
- `WATCHER.md` fence: `/implement --effort 2 Grow HostPackageWriteTheorems subset`
- `doc/SESSION-HANDOFF.md`: Grow HostPackageWrite done; next
  HostPackageWriteTheorems; metric 18
- `.agents/plans/plan-slake-replaces-lake.md` living tip (2026-08-16):
  same 18 and next HostPackageWriteTheorems

Eighteen modules named: Mult, Types, MultTheorems, TypesTheorems,
Erasure, ErasureTheorems, Extract, ExtractTheorems, IrProgram,
IrProgramTheorems, HostTerm, HostFrontGoldens, HostFront,
HostFrontTheorems, HostCheck, HostGraph, HostGraphTheorems,
HostPackageWrite.

No leftover slang in the residual, watcher, handoff, or plan living
tip inspected for this slice.

### 7. No pin flips

Pass.

- `ElabMeet.lean:427` `slakeOwnsPackageTypecheck : Bool := false`
- `ElabMeet.lean:431` `elabMeetFullHostElaborateRemains : Bool := false`
- `HostResidualShrink.lean:227`
  `hostResidualShrinkFullHostElaborateRemains : Bool := false`
- `LlvmCfgHonesty.lean:86` `llvmCfgFixtureDominanceClaimed : Bool := false`
- `LlvmMultSsa.lean:142` `llvmMultSsaFullBackendClaimed : Bool := false`
- `DualResidual.lean:227` `residualFreeClaimed : Bool := true`
- `SpecProof.lean:406` `residualFreeClaimed : Bool := false`
- `SpecProof.lean:389` `proofCompleteClaimed : Bool := true`

## What you ran

- `wc -l` on the ElabMeet HostPackageWrite / HostGraphTheorems / Subset
  / Compile / HostTerm / NamedWalk / Later / Tail / ElabMeet /
  ElabMeetTheorems files
- Reads of the new probe, new walk, HostPackageWrite imports,
  ElabMeet drive fold and imports, ElabMeetTheorems four theorems,
  HostGraphTheorems walk names, leftover fake-package helper,
  residual / watcher / handoff / plan living tip, pins, barrel,
  lakefile, Nix presence tokens
- Greps for HostPackageWrite placement, plantedTypeError, pin defs,
  leftover slang in residual and living docs

## What you did not re-run

- `just hygiene`
- `just professional-tone`
- `just systems-host`
- `lake build` of ElabMeetTheorems, ElabMeet, or the new probe
- crate-wide cargo
- any product Lean edit
