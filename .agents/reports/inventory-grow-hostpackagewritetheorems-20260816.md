# Inventory: clone HostPackageWrite (18) for HostPackageWriteTheorems (19)

Date: 2026-08-16. Read-only. No product edits. No lake.

Open Name: **Grow HostPackageWriteTheorems subset** (Name 145). Metric:
**18 of about 206**. After land: **19**, next **Grow HostPackageRoots**.

## Line counts (last line on disk)

| Lines | Path |
|------:|------|
| 242 | `src/systems/SystemsLean/ElabMeetNamedWalkHostPackageWrite.lean` |
| 205 | `src/systems/SystemsLean/ElabMeetNamedHostPackageWriteProbe.lean` |
| 680 | `src/systems/SystemsLean/ElabMeetTheorems.lean` |
| 745 | `src/systems/SystemsLean/ElabMeet.lean` |
| 916 | `src/systems/SystemsLean/ElabMeetCompile.lean` |
| 865 | `src/systems/SystemsLean/ElabMeetSubset.lean` |
| 322 | `src/systems/SystemsLean/ElabMeetNamedWalk.lean` |
| 841 | `src/systems/SystemsLean/ElabMeetNamedWalkHostTerm.lean` |
| 191 | `src/systems/SystemsLean/ElabMeetNamedWalkHostGraphTheorems.lean` |
| 300 | `src/systems/SystemsLean/HostPackageWriteTheorems.lean` (exists) |
| 784 | `src/systems/SystemsLean/HostPackageWrite.lean` |
| 435 | `src/systems/SystemsLean/HostPackageRoots.lean` |

19th wrappers MAY stay on the 18th walk (242 + ~106-166 ~ 348-408, under
~780). Extract a new walk only if that add would pass ~780. 19th probe
MUST be NEW. Do not grow Subset, Compile, Tail, Later, HostTerm, or
HostGraphTheorems walk.

## Product modules

`HostPackageWriteTheorems.lean` exists. Line 43: `import SystemsLean.HostPackageWrite`.
Namespace `SystemsLean.HostPackageWrite`. `open` HostFront / HostGraph / six
SubsetEmit (no extra imports). Import-closed on HostPackageWrite. Compile
list is **not** closed on the eighteen names alone.

`ElabMeetNamedHostPackageWriteTheoremsProbe.lean` does **not** exist.
`ElabMeetNamedWalkHostPackageWriteTheorems.lean` does **not** exist.
Do not name a walk `ElabMeetNamedWalkHostGraph`.

Barrel `SystemsLean.lean` 106-108:

```
import SystemsLean.HostPackageWrite
import SystemsLean.HostPackageWriteTheorems
import SystemsLean.HostPackageRoots
```

ElabMeet probe imports stop at `ElabMeetNamedHostPackageWriteProbe`
(barrel 330; `ElabMeet.lean` 404; `ElabMeetTheorems.lean` 59). Add the
new probe after that. Do not add a new walk import.

## 18th membership / compile order / wrappers

`namedClosedHostPackageWriteSubsetNames` (walk 85-104), barrel order:

```
SystemsLean.Mult, MultTheorems, Types, TypesTheorems,
IrProgram, IrProgramTheorems, Erasure, ErasureTheorems,
Extract, ExtractTheorems, HostTerm, HostFrontGoldens,
HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, HostPackageWrite
```

`namedClosedHostPackageWriteCompileOrder` (walk 112-159): Mult, Types,
MultTheorems, TypesTheorems, Erasure, ErasureTheorems, Extract,
ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck, HostGraph,
HostGraphTheorems, then extra deps (walk 130-157), then HostPackageWrite:

```
IrGraph, HostCompose, CompilePath,
EmitMultScaffold, EmitLinearScaffold, EmitTypesScaffold,
EmitProgramScaffold, EmitGraphScaffold, EmitComposeScaffold,
EmitMult, EmitLinear, EmitTypes, EmitProgram, EmitGraph, EmitCompose,
CompilePathMult, CompilePathLinear, CompilePathTypes,
CompilePathProgram, CompilePathGraph, CompilePathCompose,
FirstSurface, MultSubsetEmit, LinearSubsetEmit, TypesSubsetEmit,
ProgramSubsetEmit, GraphSubsetEmit, ComposeSubsetEmit
```

IrGraph / HostCompose = compile deps only. Skip Linear as named grow tip.
Skip HostGraphMain. 19th names = 18th + `HostPackageWriteTheorems` last.
19th compile order = 18th compile order + `HostPackageWriteTheorems` last.

| Role | 18th name | 19th clone |
|------|-----------|------------|
| live path | `findLiveHostPackageWritePath` | `findLiveHostPackageWriteTheoremsPath` |
| names | `namedClosedHostPackageWriteSubsetNames` | `...TheoremsSubsetNames` |
| order | `namedClosedHostPackageWriteCompileOrder` | `...TheoremsCompileOrder` |
| barrel | `barrelListsNamedHostPackageWriteSubset` | `...TheoremsSubset` |
| drive | `tryCompileNamedHostPackageWriteSubset` + IO + IOSafe | `...TheoremsSubset` |
| after-deps | `tryCompileAfterHostPackageWriteDeps` + IO + IOSafe | `...TheoremsDeps` |

Drive wrapper (walk 174-178):

```
unsafe def tryCompileNamedHostPackageWriteSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostPackageWriteSubsetNames
    namedClosedHostPackageWriteCompileOrder
```

After-deps (walk 204-225): `tryCompileAfterNamedDepsIO` Mult first through
ComposeSubsetEmit (no HostPackageWrite). 19th after-deps = that list **plus**
`SystemsLean.HostPackageWrite`. Do not plant live `HostPackageWriteTheorems.lean`.

## Shared walker (reuse, do not clone)

`ElabMeetNamedWalk.lean` 225-227:

```
unsafe def tryCompileNamedMemberListIO
    (srcPath oleanDir : System.FilePath)
    (memberNames compileOrder : List String) : IO Bool
```

`import SystemsLean.ElabMeetNamedWalk` (walk 67; probe 72). Namespace
`SystemsLean.ElabMeet`. After-deps: `tryCompileAfterNamedDepsIO` (284-286).
Fake isolation text: `leftoverFakePackageLakefileText` (319-320).

## Isolation fold (18th probe 144-156)

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
  let isolation :=
    liveMultStillOk && liveThmStillOk && priorSubsetStillOk
      && !thisOnTempSnippet && !thisOnFakePackage
      && notAliasOfSeventeenth
```

Drive: `good && !badCompiled && isolation` (probe 185). Prior walker:
`tryCompileNamedHostGraphTheoremsSubset`. 19th prior:
`tryCompileNamedHostPackageWriteSubset`. 19th alias vs 18th names/order;
this list contains `SystemsLean.HostPackageWriteTheorems`; 18th does not.

Probe command 18th: `#elabMeetNamedHostPackageWriteSubsetProbe` (93, 198).
Greppable `elabMeetNamedHostPackageWriteSubsetProbe`.

18th Bools (probe 189-196): `elabMeetAcceptsGoodNamedHostPackageWriteSubset`,
`elabMeetRejectsBadNamedHostPackageWriteSubset`,
`elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset`,
`elabMeetDrivesNamedHostPackageWriteSubset`.

Bad sidecar: `ElabMeetNamedHostPackageWriteSubsetBad.lean` +
`def plantedTypeError : Nat := true` (probe 112-118). Missing live path
treats bad as compiled (`true`). 19th command:
`#elabMeetNamedHostPackageWriteTheoremsSubsetProbe`. 19th Bools: same four
with `HostPackageWriteTheorems` in the name.

## 18th theorems (`ElabMeetTheorems.lean` 660-678)

```
theorem elabMeetDrivesNamedHostPackageWriteSubset_true
theorem elabMeetAcceptsGoodNamedHostPackageWriteSubset_true
theorem elabMeetRejectsBadNamedHostPackageWriteSubset_true
theorem elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset_true
```

All `= true := by native_decide`. File ends 680. Land 19th four **first**
(red: unknown identifiers). Do not rewrite theorems. Nearby HostFrontTheorems /
HostCheck / HostGraph / HostGraphTheorems blocks (580-658) use the same shape.

## Drive fold (`ElabMeet.lean` 425-431). Do not flip.

```
def slakeOwnsPackageTypecheck : Bool := false
def elabMeetFullHostElaborateRemains : Bool := false
```

`elabMeetReady` starts `!slakeOwnsPackageTypecheck && !elabMeetFullHostElaborateRemains`
(536-538). 18th fold (718-721):

```
  && elabMeetAcceptsGoodNamedHostPackageWriteSubset
  && elabMeetRejectsBadNamedHostPackageWriteSubset
  && elabMeetRejectsOldWalkAsNamedHostPackageWriteSubset
  && elabMeetDrivesNamedHostPackageWriteSubset
```

Fold the four 19th Bools after that. Import the new probe next to
`ElabMeetNamedHostPackageWriteProbe` (ElabMeet 404).

## Residual / plan (still 18)

`RESIDUAL-systems.md` Name 145 **open**. `RESIDUAL.md` Systems Open 145 **open**.
`WATCHER.md` `/implement --effort 2 Grow HostPackageWriteTheorems subset`.
`doc/SESSION-HANDOFF.md` and `plan-slake-replaces-lake.md`: **18 of about 206**.

## Nix (`nix/systems-host-presence/`)

Already present: product `HostPackageWriteTheorems.lean` in
`required-files.nix` 122, `host-leans.nix` 109,
`host-specs-compile-path-2.nix` 992-997. 18th walk/probe in required-files
460/470, host-leans 445/455, hold-close helpers/Bools/probe 2199-2238,
four 18th theorems 2356-2359.

**Missing for 19th:** probe path in required-files + host-leans; hold-close
`findLiveHostPackageWriteTheoremsPath`,
`namedClosedHostPackageWriteTheoremsSubsetNames` / `CompileOrder` /
`barrelLists...` / `tryCompileNamedHostPackageWriteTheoremsSubset` /
`tryCompileAfterHostPackageWriteTheoremsDeps`, four Bools, four
`theorem ..._true` names, `ElabMeetNamedHostPackageWriteTheoremsProbe`,
`elabMeetNamedHostPackageWriteTheoremsSubsetProbe`.

## Clone order

1. Red: four 19th theorems in `ElabMeetTheorems.lean`.
2. Wrappers on `ElabMeetNamedWalkHostPackageWrite.lean` (long-file split /
   extract into a role module only if the add would pass ~780).
3. NEW `ElabMeetNamedHostPackageWriteTheoremsProbe.lean`.
4. Barrel + ElabMeet fold + ElabMeetTheorems import + Nix.
5. Green same four theorems. Pins stay false. Lake from `src/systems`.

Do not plant live `HostPackageWriteTheorems.lean`. Do not clone
`tryCompileNamedMemberListIO`. Do not dump the 19th probe onto the 18th.
