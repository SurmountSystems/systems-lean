/-
  SYSTEMS_LEAN_HOST partial -- seventeenth HostGraphTheorems
  named-walk wrappers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted so ElabMeetNamedWalkHostTerm stays under about
  880. Same namespace SystemsLean.ElabMeet. Shared path, barrel, and
  name-list compile helpers stay in ElabMeetNamedWalk. HostGraph
  wrappers stay in ElabMeetNamedWalkHostTerm. Do not name this file
  ElabMeetNamedWalkHostGraph.
  Reuses tryCompileNamedMemberListIO (no cloned walker).

  Extract-first (about 880): do not add another leftover probe
  or leftover wrapper here, on ElabMeetSubset, on
  ElabMeetNamedWalkLater, on ElabMeetNamedWalkTail, or on
  ElabMeetNamedWalkHostTerm if that add would pass about 880.
  NamedWalk may keep shared helpers.

  Spec (readable):
  - Seventeenth HostGraphTheorems wrapper lives here:
    findLiveHostGraphTheoremsPath,
    namedClosedHostGraphTheoremsSubsetNames,
    namedClosedHostGraphTheoremsCompileOrder,
    barrelListsNamedHostGraphTheoremsSubset,
    tryCompileNamedHostGraphTheoremsSubset,
    tryCompileAfterHostGraphTheoremsDeps.
    Membership list is barrel order among the seventeen; skip
    Linear, skip IrGraph. HostGraphTheorems last after HostGraph.
    Compile order is the prior sixteen compile order then
    HostGraphTheorems last. HostGraphTheorems imports only HostGraph.
    After-deps lists Mult first, then HostGraph, plus HostGraph's
    real deps (HostTerm, HostFrontGoldens, HostFront) so the planted
    sidecar compiles. HostGraphMain is not a member.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, tryCompileAfterNamedDepsIO,
  findLiveHostGraphTheoremsPath,
  namedClosedHostGraphTheoremsSubsetNames,
  namedClosedHostGraphTheoremsCompileOrder,
  barrelListsNamedHostGraphTheoremsSubset,
  tryCompileNamedHostGraphTheoremsSubset,
  tryCompileAfterHostGraphTheoremsDeps,
  SystemsLean.HostGraphTheorems,
  ElabMeetNamedWalkHostGraphTheorems,
  SystemsLean.ElabMeetNamedWalkHostGraphTheorems,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalkHostGraphTheorems
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalkHostGraphTheorems;
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

/-- Resolve live SystemsLean/HostGraphTheorems.lean.
    Wrapper over findLiveModulePath.
    Greppable: findLiveHostGraphTheoremsPath. -/
def findLiveHostGraphTheoremsPath : IO (Option System.FilePath) :=
  findLiveModulePath "SystemsLean.HostGraphTheorems"

/-- Named closed HostGraphTheorems subset of the live SystemsLean
    library. Closed: every import of a member is also in the list.
    Membership list is barrel order among the seventeen; skip Linear,
    skip IrGraph. HostGraphTheorems last after HostGraph.
    Greppable: namedClosedHostGraphTheoremsSubsetNames.
    SystemsLean.HostGraphTheorems. -/
def namedClosedHostGraphTheoremsSubsetNames : List String :=
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
  ]

/-- Compile order honors imports: prior sixteen compile order then
    HostGraphTheorems last. HostGraphTheorems imports HostGraph.
    Membership list vs compile order.
    Greppable: namedClosedHostGraphTheoremsCompileOrder. -/
def namedClosedHostGraphTheoremsCompileOrder : List String :=
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
  ]

/-- True when the barrel lists each HostGraphTheorems subset member.
    Wrapper over barrelListsNamedMembers.
    Greppable: barrelListsNamedHostGraphTheoremsSubset. -/
def barrelListsNamedHostGraphTheoremsSubset (text : String) : Bool :=
  barrelListsNamedMembers text namedClosedHostGraphTheoremsSubsetNames

/-- Compile the named HostGraphTheorems closed subset after reading
    the live lakefile. Seventeen-module wrapper over
    tryCompileNamedMemberListIO. Compile order honors imports:
    Mult first, then search path, then Types, MultTheorems,
    TypesTheorems, Erasure, ErasureTheorems, Extract,
    ExtractTheorems, IrProgram, IrProgramTheorems, HostTerm,
    HostFrontGoldens, HostFront, HostFrontTheorems, HostCheck,
    HostGraph, HostGraphTheorems last.
    Greppable: tryCompileNamedHostGraphTheoremsSubset.
    tryCompileOnDiskModule. SystemsLean.HostGraphTheorems. -/
unsafe def tryCompileNamedHostGraphTheoremsSubsetIO
    (srcPath oleanDir : System.FilePath) : IO Bool := do
  tryCompileNamedMemberListIO srcPath oleanDir
    namedClosedHostGraphTheoremsSubsetNames
    namedClosedHostGraphTheoremsCompileOrder

@[implemented_by tryCompileNamedHostGraphTheoremsSubsetIO]
opaque tryCompileNamedHostGraphTheoremsSubsetIOSafe
    (srcPath oleanDir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the HostGraphTheorems closed subset.
    Greppable: tryCompileNamedHostGraphTheoremsSubset. -/
def tryCompileNamedHostGraphTheoremsSubset
    (srcPath oleanDir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO
      (tryCompileNamedHostGraphTheoremsSubsetIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, HostGraph, HostTerm, HostFrontGoldens, and
    HostFront, put those .olean files on the search path, then
    compile srcPath as thmMod. HostGraphTheorems imports HostGraph.
    HostGraph imports HostFront and HostTerm. HostFront imports
    HostTerm, Mult, and HostFrontGoldens. Do not plant on the live
    tree. Compile order is Mult first, then HostGraph's real deps,
    then HostGraph, so the planted sidecar can import HostGraph.
    Wrapper over tryCompileAfterNamedDepsIO.
    Greppable: tryCompileAfterHostGraphTheoremsDeps.
    tryCompileOnDiskModule. -/
unsafe def tryCompileAfterHostGraphTheoremsDepsIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool :=
  tryCompileAfterNamedDepsIO srcPath oleanDir thmMod
    ["SystemsLean.Mult", "SystemsLean.HostTerm",
      "SystemsLean.HostFrontGoldens", "SystemsLean.HostFront",
      "SystemsLean.HostGraph"]

@[implemented_by tryCompileAfterHostGraphTheoremsDepsIO]
opaque tryCompileAfterHostGraphTheoremsDepsIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile after HostGraphTheorems deps.
    Greppable: tryCompileAfterHostGraphTheoremsDeps. -/
def tryCompileAfterHostGraphTheoremsDeps
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO
      (tryCompileAfterHostGraphTheoremsDepsIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
