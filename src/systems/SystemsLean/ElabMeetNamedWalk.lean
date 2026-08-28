/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet named-walk compile helper.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Role module extracted from ElabMeetSubset so subset probes stay
  under the line cap. Same namespace SystemsLean.ElabMeet.
  Shared path, barrel, and name-list compile helpers live here.
  Three-through-eight named-subset wrappers now live in
  ElabMeetNamedWalkLater. Shared helpers stay here. Probes stay
  in ElabMeetSubset. Leftover ExtractTheorems probe lives in
  ElabMeetNamedWalkLater. Greppable wrapper names stay in this
  header so existing Nix NamedWalk tokens still match.
  Reuses tryCompileOnDiskModuleIO (no second elaborator).

  Spec (readable):
  - findLiveLakefilePath resolves lakefile.lean from Lake cwd
    (src/systems) or repo-root cwd. none if neither exists.
  - findLiveBarrelPath resolves SystemsLean.lean the same way.
  - findLiveModulePath resolves each live SystemsLean/Foo.lean.
  - parseRealLakeLibraryName reads a live lakefile and takes the
    single lean_lib Name. Two lean_lib lines are none.
  - barrelListsNamedMembers checks membership import lines.
  - tryCompileNamedMemberListIO compiles a named closed list.
    Compile order starts with SystemsLean.Mult. Search path is
    pushed after Mult. .olean files go under a temp directory.
  - tryCompileAfterNamedDepsIO compiles depOrder then srcPath.
    Used for planted-error sidecars. Not live-tree plant.
  - leftoverFakePackageLakefileText is leftover isolation text.
  - Three/four/five/six/seven/eight-module wrappers live in
    ElabMeetNamedWalkLater (names stay greppable here):
    namedClosedSubsetNames, tryCompileNamedClosedSubset,
    namedClosedTypesTheoremsSubsetNames,
    tryCompileNamedTypesTheoremsSubset,
    namedClosedErasureSubsetNames, tryCompileNamedErasureSubset,
    namedClosedErasureTheoremsSubsetNames,
    tryCompileNamedErasureTheoremsSubset,
    namedClosedExtractSubsetNames, tryCompileNamedExtractSubset,
    namedClosedExtractTheoremsSubsetNames,
    tryCompileNamedExtractTheoremsSubset.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  tryCompileNamedMemberListIO, findLiveLakefilePath,
  findLiveBarrelPath, findLiveModulePath,
  parseRealLakeLibraryName, barrelListsNamedMembers,
  tryCompileAfterNamedDepsIO, leftoverFakePackageLakefileText,
  closedMemberToName, compileRemainingNamedMembersIO,
  namedMemberOlearsExistIO,
  namedClosedSubsetNames, namedClosedSubsetCompileOrder,
  findLiveTypesPath, barrelListsNamedSubset,
  tryCompileNamedClosedSubset,
  findLiveTypesTheoremsPath,
  namedClosedTypesTheoremsSubsetNames,
  namedClosedTypesTheoremsCompileOrder,
  barrelListsNamedTypesTheoremsSubset,
  tryCompileNamedTypesTheoremsSubset,
  tryCompileAfterTypesTheoremsDeps,
  findLiveErasurePath, namedClosedErasureSubsetNames,
  namedClosedErasureCompileOrder, barrelListsNamedErasureSubset,
  tryCompileNamedErasureSubset, tryCompileAfterErasureDeps,
  findLiveErasureTheoremsPath,
  namedClosedErasureTheoremsSubsetNames,
  namedClosedErasureTheoremsCompileOrder,
  barrelListsNamedErasureTheoremsSubset,
  tryCompileNamedErasureTheoremsSubset,
  tryCompileAfterErasureTheoremsDeps,
  findLiveExtractPath, namedClosedExtractSubsetNames,
  namedClosedExtractCompileOrder, barrelListsNamedExtractSubset,
  tryCompileNamedExtractSubset, tryCompileAfterExtractDeps,
  SystemsLean.Extract,
  findLiveExtractTheoremsPath, namedClosedExtractTheoremsSubsetNames,
  namedClosedExtractTheoremsCompileOrder,
  barrelListsNamedExtractTheoremsSubset,
  tryCompileNamedExtractTheoremsSubset,
  tryCompileAfterExtractTheoremsDeps,
  SystemsLean.ExtractTheorems,
  ElabMeetNamedWalk, SystemsLean.ElabMeetNamedWalk,
  ElabMeetNamedWalkLater,
  findLiveIrProgramPath, namedClosedIrProgramSubsetNames,
  namedClosedIrProgramCompileOrder,
  barrelListsNamedIrProgramSubset,
  tryCompileNamedIrProgramSubset, tryCompileAfterIrProgramDeps,
  SystemsLean.IrProgram,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetNamedWalk
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetNamedWalk; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not FullHostElaborateRemains true. Not Lake gone.
  slakeOwnsPackageTypecheck stays false.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetLive

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live src/systems/lakefile.lean.
    Candidate A (Lake cwd = src/systems): lakefile.lean.
    Candidate B (repo root cwd): src/systems/lakefile.lean.
    First pathExists wins. none if neither exists.
    Greppable: findLiveLakefilePath. -/
def findLiveLakefilePath : IO (Option System.FilePath) := do
  let candA : System.FilePath := "lakefile.lean"
  let candB : System.FilePath := "src/systems/lakefile.lean"
  if (<- candA.pathExists) then
    return some candA
  if (<- candB.pathExists) then
    return some candB
  return none

/-- Resolve live src/systems/SystemsLean.lean barrel.
    Candidate A (Lake cwd = src/systems): SystemsLean.lean.
    Candidate B (repo root cwd): src/systems/SystemsLean.lean.
    First pathExists wins. none if neither exists.
    Greppable: findLiveBarrelPath. -/
def findLiveBarrelPath : IO (Option System.FilePath) := do
  let candA : System.FilePath := "SystemsLean.lean"
  let candB : System.FilePath := "src/systems/SystemsLean.lean"
  if (<- candA.pathExists) then
    return some candA
  if (<- candB.pathExists) then
    return some candB
  return none

/-- Resolve a live SystemsLean/Foo.lean from a dotted module name.
    Candidate A (Lake cwd = src/systems): SystemsLean/Foo.lean.
    Candidate B (repo root cwd): src/systems/SystemsLean/Foo.lean.
    First pathExists wins. none if neither exists.
    Greppable: findLiveModulePath. -/
def findLiveModulePath (modName : String) : IO (Option System.FilePath) := do
  let rel := String.intercalate "/" (modName.splitOn ".") ++ ".lean"
  let candA : System.FilePath := rel
  let candB : System.FilePath := "src/systems/" ++ rel
  if (<- candA.pathExists) then
    return some candA
  if (<- candB.pathExists) then
    return some candB
  return none

/-- Read one `lean_lib Name` from a Lake description.
    Empty lines, `--` comments, and other text are ignored.
    Two `lean_lib` lines are none. Empty name is none.
    Greppable: parseRealLakeLibraryName. -/
def parseRealLakeLibraryName (text : String) : Option String :=
  let rec go (lines : List String) (found : Option String) : Option String :=
    match lines with
    | [] => found
    | line :: rest =>
      let t := line.trimAscii
      if t.isEmpty || t.startsWith "--" then
        go rest found
      else if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
        if n.isEmpty || found.isSome then
          none
        else
          go rest (some n)
      else
        go rest found
  go (text.splitOn "\n") none

/-- True when the barrel lists each named member as an import.
    Exact trimmed line match. MultTheorems does not count as Mult.
    Greppable: barrelListsNamedMembers. -/
def barrelListsNamedMembers (text : String) (names : List String) : Bool :=
  let rec hasLine (lines : List String) (needle : String) : Bool :=
    match lines with
    | [] => false
    | line :: rest =>
      if line.trimAscii == needle then
        true
      else
        hasLine rest needle
  let lines := text.splitOn "\n"
  names.all (fun n => hasLine lines ("import " ++ n))

/-- Hierarchical Name from a closed member string (SystemsLean.Mult).
    Greppable: closedMemberToName. -/
def closedMemberToName (modName : String) : Name :=
  (modName.splitOn ".").foldl (init := Name.anonymous) fun n p =>
    Name.str n p

/-- Compile remaining members after Mult .olean is on the search path.
    Reuses tryCompileOnDiskModuleIO (no second elaborator). -/
unsafe def compileRemainingNamedMembersIO
    (oleanDir : System.FilePath) (ms : List String) : IO Bool := do
  match ms with
  | [] => return true
  | m :: rest =>
    let live? <- findLiveModulePath m
    match live? with
    | none => return false
    | some live =>
      let compiled <-
        tryCompileOnDiskModuleIO live (closedMemberToName m) oleanDir
      if !compiled then
        return false
      compileRemainingNamedMembersIO oleanDir rest

/-- True when each named member has an .olean under oleanDir. -/
def namedMemberOlearsExistIO
    (oleanDir : System.FilePath) (ns : List String) : IO Bool := do
  match ns with
  | [] => return true
  | n :: rest =>
    let p := Lean.modToFilePath oleanDir (closedMemberToName n) "olean"
    if !(<- p.pathExists) then
      return false
    namedMemberOlearsExistIO oleanDir rest

/-- Compile named members after reading the live lakefile.
    memberNames is import-closed membership (barrel must list each).
    compileOrder is Mult first, then remaining members so imports
    resolve. False if srcPath is not the live lakefile, the parsed
    library is not SystemsLean, the barrel omits a member, compile
    order does not start with SystemsLean.Mult, or a live source is
    missing. Write .olean under oleanDir (temp).
    Reuses tryCompileOnDiskModuleIO (no second elaborator).
    Greppable: tryCompileNamedMemberListIO. tryCompileOnDiskModule. -/
unsafe def tryCompileNamedMemberListIO
    (srcPath oleanDir : System.FilePath)
    (memberNames compileOrder : List String) : IO Bool := do
  enableInitializersExecution
  let liveLake? <- findLiveLakefilePath
  match liveLake? with
  | none => return false
  | some liveLake =>
    if srcPath.toString != liveLake.toString then
      return false
    let text <-
      try
        IO.FS.readFile liveLake
      catch _ =>
        return false
    let some libName := parseRealLakeLibraryName text | return false
    if libName != "SystemsLean" then
      return false
    let barrel? <- findLiveBarrelPath
    match barrel? with
    | none => return false
    | some barrel =>
      let barrelText <-
        try
          IO.FS.readFile barrel
        catch _ =>
          return false
      if !barrelListsNamedMembers barrelText memberNames then
        return false
      match compileOrder with
      | [] => return false
      | first :: rest =>
        if first != "SystemsLean.Mult" then
          return false
        let liveFirst? <- findLiveModulePath first
        match liveFirst? with
        | none => return false
        | some liveFirst =>
          IO.FS.createDirAll (oleanDir / "SystemsLean")
          let compiledFirst <-
            tryCompileOnDiskModuleIO liveFirst (closedMemberToName first)
              oleanDir
          if !compiledFirst then
            return false
          let prev <- searchPathRef.get
          searchPathRef.set (oleanDir :: prev)
          try
            let compiledRest <-
              compileRemainingNamedMembersIO oleanDir rest
            if !compiledRest then
              return false
            namedMemberOlearsExistIO oleanDir compileOrder
          finally
            searchPathRef.set prev

/-- Compile depOrder (Mult first), then compile srcPath as thmMod.
    Used for planted-error sidecars so the reject is a type error,
    not a missing import. Reuses tryCompileOnDiskModuleIO.
    Greppable: tryCompileAfterNamedDeps. tryCompileOnDiskModule. -/
unsafe def tryCompileAfterNamedDepsIO
    (srcPath oleanDir : System.FilePath)
    (thmMod : Name) (depOrder : List String) : IO Bool := do
  enableInitializersExecution
  match depOrder with
  | [] => return false
  | first :: rest =>
    if first != "SystemsLean.Mult" then
      return false
    let liveFirst? <- findLiveModulePath first
    match liveFirst? with
    | none => return false
    | some liveFirst =>
      IO.FS.createDirAll (oleanDir / "SystemsLean")
      let compiledFirst <-
        tryCompileOnDiskModuleIO liveFirst (closedMemberToName first)
          oleanDir
      if !compiledFirst then
        return false
      let prev <- searchPathRef.get
      searchPathRef.set (oleanDir :: prev)
      try
        let compiledRest <-
          compileRemainingNamedMembersIO oleanDir rest
        if !compiledRest then
          return false
        let oleans <- namedMemberOlearsExistIO oleanDir depOrder
        if !oleans then
          return false
        tryCompileOnDiskModuleIO srcPath thmMod oleanDir
      finally
        searchPathRef.set prev

/-- Leftover richer-description text. Not the live lakefile.
    Greppable: leftoverFakePackageLakefileText. -/
def leftoverFakePackageLakefileText : String :=
  "lean_lib ElabMeetRichLib\nmodule ElabMeetRichLib\n"

end SystemsLean.ElabMeet
