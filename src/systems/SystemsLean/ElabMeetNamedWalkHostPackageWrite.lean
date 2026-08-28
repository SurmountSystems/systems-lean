/-
  SYSTEMS_LEAN_HOST partial -- eighteenth HostPackageWrite,
  nineteenth HostPackageWriteTheorems, and twentieth
  HostPackageRoots named-walk wrappers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostGraphTheorems stays
  the seventeenth walk. Same namespace SystemsLean.ElabMeet. Shared
  path, barrel, and name-list compile helpers stay in
  ElabMeetNamedWalk. This file extracts into a role module only if
  it would pass about 780. Do not name this file
  ElabMeetNamedWalkHostGraph. Do not extract
  ElabMeetNamedWalkHostPackageRoots unless this file
  would pass about 780.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Spec (readable):
  - Eighteenth HostPackageWrite wrapper lives here:
    findLiveHostPackageWritePath,
    namedClosedHostPackageWriteSubsetNames,
    namedClosedHostPackageWriteCompileOrder,
    barrelListsNamedHostPackageWriteSubset,
    tryCompileNamedHostPackageWriteSubset,
    tryCompileAfterHostPackageWriteDeps.
    Named membership is barrel order among the eighteen; skip
    Linear, skip IrGraph, skip HostGraphMain as grow-tip Names.
    HostPackageWrite last after HostGraphTheorems.
    Compile order is the prior seventeen compile order, then
    the subset-emit / CompilePath / Emit / IrGraph / HostCompose
    closure HostPackageWrite needs, then HostPackageWrite last.
    IrGraph and HostCompose enter as compile dependencies only,
    not as grow-tip residual Names. After-deps lists Mult first,
    then HostFront, HostGraph, and MultSubsetEmit through
    ComposeSubsetEmit plus their real deps so the planted
    sidecar compiles. HostGraphMain is not a member.
  - Nineteenth HostPackageWriteTheorems wrapper lives here:
    findLiveHostPackageWriteTheoremsPath,
    namedClosedHostPackageWriteTheoremsSubsetNames,
    namedClosedHostPackageWriteTheoremsCompileOrder,
    barrelListsNamedHostPackageWriteTheoremsSubset,
    tryCompileNamedHostPackageWriteTheoremsSubset,
    tryCompileAfterHostPackageWriteTheoremsDeps.
    Named membership is the prior eighteen plus
    HostPackageWriteTheorems last. Compile order is the
    eighteenth compile order plus HostPackageWriteTheorems last.
    After-deps are the eighteenth after-deps plus
    HostPackageWrite. Do not plant live
    HostPackageWriteTheorems.lean.
  - Twentieth HostPackageRoots wrapper lives here:
    findLiveHostPackageRootsPath,
    namedClosedHostPackageRootsSubsetNames,
    namedClosedHostPackageRootsCompileOrder,
    barrelListsNamedHostPackageRootsSubset,
    tryCompileNamedHostPackageRootsSubset,
    tryCompileAfterHostPackageRootsDeps.
    Named membership is the prior nineteen plus
    HostPackageRoots last. Compile order is the
    nineteenth compile order plus HostPackageRoots last.
    After-deps are the nineteenth after-deps plus
    HostPackageWriteTheorems. HostPackageRoots has no
    imports. Do not plant live HostPackageRoots.lean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostPackageWritePath,
  namedClosedHostPackageWriteSubsetNames,
  namedClosedHostPackageWriteCompileOrder,
  barrelListsNamedHostPackageWriteSubset,
  tryCompileNamedHostPackageWriteSubset,
  tryCompileAfterHostPackageWriteDeps,
  findLiveHostPackageWriteTheoremsPath,
  namedClosedHostPackageWriteTheoremsSubsetNames,
  namedClosedHostPackageWriteTheoremsCompileOrder,
  barrelListsNamedHostPackageWriteTheoremsSubset,
  tryCompileNamedHostPackageWriteTheoremsSubset,
  tryCompileAfterHostPackageWriteTheoremsDeps,
  findLiveHostPackageRootsPath,
  namedClosedHostPackageRootsSubsetNames,
  namedClosedHostPackageRootsCompileOrder,
  barrelListsNamedHostPackageRootsSubset,
  tryCompileNamedHostPackageRootsSubset,
  tryCompileAfterHostPackageRootsDeps,
  SystemsLean.HostPackageWrite,
  SystemsLean.HostPackageWriteTheorems,
  SystemsLean.HostPackageRoots,
  ElabMeetNamedWalkHostPackageWrite,
  SystemsLean.ElabMeetNamedWalkHostPackageWrite,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostPackageWrite
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostPackageWrite;
  just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetLive
import SystemsLean.ElabMeetNamedWalk

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/HostPackageWrite.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostPackageWritePath. -/
def findLiveHostPackageWritePath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostPackageWrite"

/-- Named HostPackageWrite subset of the live SystemsLean library.
    Membership is the prior seventeen plus HostPackageWrite last.
    Barrel order among the eighteen; skip Linear, skip IrGraph,
    skip HostGraphMain. Not import-closed on these eighteen alone.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostPackageWriteSubsetNames.
    SystemsLean.HostPackageWrite. -/
def namedClosedHostPackageWriteSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  , "SystemsLean.HostGraphTheorems"
  , "SystemsLean.HostPackageWrite"
  ]

/-- Compile order honors imports: prior seventeen compile order,
    then the subset-emit / CompilePath / Emit closure, then
    HostPackageWrite last. IrGraph and HostCompose are compile
    dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostPackageWriteCompileOrder. -/
def namedClosedHostPackageWriteCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  , "SystemsLean.HostGraphTheorems"
  , "SystemsLean.IrGraph"
  , "SystemsLean.HostCompose"
  , "SystemsLean.CompilePath"
  , "SystemsLean.EmitMultScaffold"
  , "SystemsLean.EmitLinearScaffold"
  , "SystemsLean.EmitTypesScaffold"
  , "SystemsLean.EmitProgramScaffold"
  , "SystemsLean.EmitGraphScaffold"
  , "SystemsLean.EmitComposeScaffold"
  , "SystemsLean.EmitMult"
  , "SystemsLean.EmitLinear"
  , "SystemsLean.EmitTypes"
  , "SystemsLean.EmitProgram"
  , "SystemsLean.EmitGraph"
  , "SystemsLean.EmitCompose"
  , "SystemsLean.CompilePathMult"
  , "SystemsLean.CompilePathLinear"
  , "SystemsLean.CompilePathTypes"
  , "SystemsLean.CompilePathProgram"
  , "SystemsLean.CompilePathGraph"
  , "SystemsLean.CompilePathCompose"
  , "SystemsLean.FirstSurface"
  , "SystemsLean.MultSubsetEmit"
  , "SystemsLean.LinearSubsetEmit"
  , "SystemsLean.TypesSubsetEmit"
  , "SystemsLean.ProgramSubsetEmit"
  , "SystemsLean.GraphSubsetEmit"
  , "SystemsLean.ComposeSubsetEmit"
  , "SystemsLean.HostPackageWrite"
  ]

/-- True when the barrel lists each HostPackageWrite subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostPackageWriteSubset. -/
def barrelListsNamedHostPackageWriteSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostPackageWriteSubsetNames

/-- Compile the named HostPackageWrite subset after reading
    the live lakefile. Eighteen-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the prior seventeen, then the subset-emit
    closure, then HostPackageWrite last.
    Greppable: tryCompileNamedHostPackageWriteSubset.
    tryCompileOnDiskModule. SystemsLean.HostPackageWrite. -/
unsafe def tryCompileNamedHostPackageWriteSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostPackageWriteSubsetNames
    namedClosedHostPackageWriteCompileOrder

@[implemented_by tryCompileNamedHostPackageWriteSubsetIO]
opaque tryCompileNamedHostPackageWriteSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostPackageWrite subset.
    Greppable: tryCompileNamedHostPackageWriteSubset. -/
def tryCompileNamedHostPackageWriteSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostPackageWriteSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, and
    MultSubsetEmit through ComposeSubsetEmit plus their real
    deps, put those .olean files on the search path, then
    compile srcPath as thmMod. HostPackageWrite imports
    HostFront, HostGraph, and the six unit SubsetEmit modules.
    IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostPackageWriteDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostPackageWriteDepsIO
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
      "SystemsLean.ComposeSubsetEmit"]

@[implemented_by tryCompileAfterHostPackageWriteDepsIO]
opaque tryCompileAfterHostPackageWriteDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostPackageWrite deps.
    Greppable: tryCompileAfterHostPackageWriteDeps. -/
def tryCompileAfterHostPackageWriteDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostPackageWriteDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostPackageWriteTheorems.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostPackageWriteTheoremsPath. -/
def findLiveHostPackageWriteTheoremsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostPackageWriteTheorems"

/-- Named HostPackageWriteTheorems subset of the live SystemsLean library.
    Membership is the prior eighteen plus HostPackageWriteTheorems last.
    Barrel order among the nineteen; skip Linear, skip IrGraph,
    skip HostGraphMain. Not import-closed on these nineteen alone.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostPackageWriteTheoremsSubsetNames.
    SystemsLean.HostPackageWriteTheorems. -/
def namedClosedHostPackageWriteTheoremsSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  , "SystemsLean.HostGraphTheorems"
  , "SystemsLean.HostPackageWrite"
  , "SystemsLean.HostPackageWriteTheorems"
  ]

/-- Compile order honors imports: eighteenth compile order, then
    HostPackageWriteTheorems last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostPackageWriteTheoremsCompileOrder. -/
def namedClosedHostPackageWriteTheoremsCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  , "SystemsLean.HostGraphTheorems"
  , "SystemsLean.IrGraph"
  , "SystemsLean.HostCompose"
  , "SystemsLean.CompilePath"
  , "SystemsLean.EmitMultScaffold"
  , "SystemsLean.EmitLinearScaffold"
  , "SystemsLean.EmitTypesScaffold"
  , "SystemsLean.EmitProgramScaffold"
  , "SystemsLean.EmitGraphScaffold"
  , "SystemsLean.EmitComposeScaffold"
  , "SystemsLean.EmitMult"
  , "SystemsLean.EmitLinear"
  , "SystemsLean.EmitTypes"
  , "SystemsLean.EmitProgram"
  , "SystemsLean.EmitGraph"
  , "SystemsLean.EmitCompose"
  , "SystemsLean.CompilePathMult"
  , "SystemsLean.CompilePathLinear"
  , "SystemsLean.CompilePathTypes"
  , "SystemsLean.CompilePathProgram"
  , "SystemsLean.CompilePathGraph"
  , "SystemsLean.CompilePathCompose"
  , "SystemsLean.FirstSurface"
  , "SystemsLean.MultSubsetEmit"
  , "SystemsLean.LinearSubsetEmit"
  , "SystemsLean.TypesSubsetEmit"
  , "SystemsLean.ProgramSubsetEmit"
  , "SystemsLean.GraphSubsetEmit"
  , "SystemsLean.ComposeSubsetEmit"
  , "SystemsLean.HostPackageWrite"
  , "SystemsLean.HostPackageWriteTheorems"
  ]

/-- True when the barrel lists each HostPackageWriteTheorems subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostPackageWriteTheoremsSubset. -/
def barrelListsNamedHostPackageWriteTheoremsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostPackageWriteTheoremsSubsetNames

/-- Compile the named HostPackageWriteTheorems subset after reading
    the live lakefile. Nineteen-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the eighteenth compile order, then
    HostPackageWriteTheorems last.
    Greppable: tryCompileNamedHostPackageWriteTheoremsSubset.
    tryCompileOnDiskModule. SystemsLean.HostPackageWriteTheorems. -/
unsafe def tryCompileNamedHostPackageWriteTheoremsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostPackageWriteTheoremsSubsetNames
    namedClosedHostPackageWriteTheoremsCompileOrder

@[implemented_by tryCompileNamedHostPackageWriteTheoremsSubsetIO]
opaque tryCompileNamedHostPackageWriteTheoremsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostPackageWriteTheorems subset.
    Greppable: tryCompileNamedHostPackageWriteTheoremsSubset. -/
def tryCompileNamedHostPackageWriteTheoremsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostPackageWriteTheoremsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, and HostPackageWrite,
    put those .olean files on the search path, then compile srcPath
    as thmMod. HostPackageWriteTheorems imports HostPackageWrite.
    IrGraph and HostCompose are compile dependencies only.
    Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostPackageWriteTheoremsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostPackageWriteTheoremsDepsIO
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
      "SystemsLean.ComposeSubsetEmit", "SystemsLean.HostPackageWrite"]

@[implemented_by tryCompileAfterHostPackageWriteTheoremsDepsIO]
opaque tryCompileAfterHostPackageWriteTheoremsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostPackageWriteTheorems deps.
    Greppable: tryCompileAfterHostPackageWriteTheoremsDeps. -/
def tryCompileAfterHostPackageWriteTheoremsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostPackageWriteTheoremsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Resolve live SystemsLean/HostPackageRoots.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostPackageRootsPath. -/
def findLiveHostPackageRootsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostPackageRoots"

/-- Named HostPackageRoots subset of the live SystemsLean library.
    Membership is the prior nineteen plus HostPackageRoots last.
    Barrel order among the twenty; skip Linear, skip IrGraph,
    skip HostGraphMain. Not import-closed on these twenty alone.
    Compile order holds the subset-emit closure.
    Greppable: namedClosedHostPackageRootsSubsetNames.
    SystemsLean.HostPackageRoots. -/
def namedClosedHostPackageRootsSubsetNames : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.Types"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  , "SystemsLean.HostGraphTheorems"
  , "SystemsLean.HostPackageWrite"
  , "SystemsLean.HostPackageWriteTheorems"
  , "SystemsLean.HostPackageRoots"
  ]

/-- Compile order honors imports: nineteenth compile order, then
    HostPackageRoots last. IrGraph and HostCompose are
    compile dependencies only (CompilePath / HostCompose force them).
    Mult first. Membership list vs compile order.
    Greppable: namedClosedHostPackageRootsCompileOrder. -/
def namedClosedHostPackageRootsCompileOrder : List String :=
  [ "SystemsLean.Mult"
  , "SystemsLean.Types"
  , "SystemsLean.MultTheorems"
  , "SystemsLean.TypesTheorems"
  , "SystemsLean.Erasure"
  , "SystemsLean.ErasureTheorems"
  , "SystemsLean.Extract"
  , "SystemsLean.ExtractTheorems"
  , "SystemsLean.IrProgram"
  , "SystemsLean.IrProgramTheorems"
  , "SystemsLean.HostTerm"
  , "SystemsLean.HostFrontGoldens"
  , "SystemsLean.HostFront"
  , "SystemsLean.HostFrontTheorems"
  , "SystemsLean.HostCheck"
  , "SystemsLean.HostGraph"
  , "SystemsLean.HostGraphTheorems"
  , "SystemsLean.IrGraph"
  , "SystemsLean.HostCompose"
  , "SystemsLean.CompilePath"
  , "SystemsLean.EmitMultScaffold"
  , "SystemsLean.EmitLinearScaffold"
  , "SystemsLean.EmitTypesScaffold"
  , "SystemsLean.EmitProgramScaffold"
  , "SystemsLean.EmitGraphScaffold"
  , "SystemsLean.EmitComposeScaffold"
  , "SystemsLean.EmitMult"
  , "SystemsLean.EmitLinear"
  , "SystemsLean.EmitTypes"
  , "SystemsLean.EmitProgram"
  , "SystemsLean.EmitGraph"
  , "SystemsLean.EmitCompose"
  , "SystemsLean.CompilePathMult"
  , "SystemsLean.CompilePathLinear"
  , "SystemsLean.CompilePathTypes"
  , "SystemsLean.CompilePathProgram"
  , "SystemsLean.CompilePathGraph"
  , "SystemsLean.CompilePathCompose"
  , "SystemsLean.FirstSurface"
  , "SystemsLean.MultSubsetEmit"
  , "SystemsLean.LinearSubsetEmit"
  , "SystemsLean.TypesSubsetEmit"
  , "SystemsLean.ProgramSubsetEmit"
  , "SystemsLean.GraphSubsetEmit"
  , "SystemsLean.ComposeSubsetEmit"
  , "SystemsLean.HostPackageWrite"
  , "SystemsLean.HostPackageWriteTheorems"
  , "SystemsLean.HostPackageRoots"
  ]

/-- True when the barrel lists each HostPackageRoots subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostPackageRootsSubset. -/
def barrelListsNamedHostPackageRootsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostPackageRootsSubsetNames

/-- Compile the named HostPackageRoots subset after reading
    the live lakefile. Twenty-name wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then the nineteenth compile order, then
    HostPackageRoots last.
    Greppable: tryCompileNamedHostPackageRootsSubset.
    tryCompileOnDiskModule. SystemsLean.HostPackageRoots. -/
unsafe def tryCompileNamedHostPackageRootsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostPackageRootsSubsetNames
    namedClosedHostPackageRootsCompileOrder

@[implemented_by tryCompileNamedHostPackageRootsSubsetIO]
opaque tryCompileNamedHostPackageRootsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostPackageRoots subset.
    Greppable: tryCompileNamedHostPackageRootsSubset. -/
def tryCompileNamedHostPackageRootsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostPackageRootsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult first, then HostFront, HostGraph, the six
    unit SubsetEmit modules, their real deps, HostPackageWrite,
    and HostPackageWriteTheorems, put those .olean files on the
    search path, then compile srcPath as thmMod. HostPackageRoots
    has no imports. IrGraph and HostCompose are compile
    dependencies only. Do not plant on the live tree. Wrapper over
    tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostPackageRootsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostPackageRootsDepsIO
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
      "SystemsLean.HostPackageWriteTheorems"]

@[implemented_by tryCompileAfterHostPackageRootsDepsIO]
opaque tryCompileAfterHostPackageRootsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostPackageRoots deps.
    Greppable: tryCompileAfterHostPackageRootsDeps. -/
def tryCompileAfterHostPackageRootsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostPackageRootsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
