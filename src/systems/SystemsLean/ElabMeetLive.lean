/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet live SystemsLean.Mult typecheck.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeetCompile stays under the line cap. Same namespace
  SystemsLean.ElabMeet. Probe plus live-path helpers live here.
  Reuses tryCompileOnDiskModuleIO (no second elaborator).

  Spec (readable):
  - findLiveMultPath resolves SystemsLean/Mult.lean from Lake cwd
    (src/systems) or repo-root cwd. none if neither exists.
    Does not write Mult into temp.
  - tryCompileLiveModule compiles only that live path. A temp
    snippet is not this accept. .olean goes under a temp
    directory, never under src/systems.
  - Good reads the real live file. Bad writes a temp copy plus
    a planted type error. Isolation keeps the Name 99 temp-file
    walk and rejects that walk as this accept.
  - The drive is good && !bad && isolation.
  - findLiveMultTheoremsPath resolves SystemsLean/MultTheorems.lean
    from Lake cwd or repo-root cwd. none if neither exists.
    Does not write MultTheorems into temp.
  - tryCompileLiveTheorems compiles live Mult, puts that .olean on
    the search path, then compiles live MultTheorems. A live Mult
    path is not this accept. .olean files go under a temp directory.
  - Good reads the real live MultTheorems file. Bad writes a temp
    copy plus a planted type error, with Mult .olean on the search
    path so the reject is the planted error, not a missing import.
    Isolation: the live Mult walker still accepts live Mult, and
    this theorems walker is false on the live Mult path.
  - The theorems drive is good && !bad && isolation.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryCompileOnDiskModule, tryCompileOnDiskModuleIO,
  findLiveMultPath, tryCompileLiveModule,
  findLiveMultTheoremsPath, tryCompileLiveTheorems,
  elabMeetDrivesLiveModule,
  elabMeetAcceptsGoodLiveModule,
  elabMeetRejectsBadLiveModule,
  elabMeetRejectsOldWalkAsLiveModule,
  elabMeetDrivesLiveTheorems,
  elabMeetAcceptsGoodLiveTheorems,
  elabMeetRejectsBadLiveTheorems,
  elabMeetRejectsOldWalkAsLiveTheorems,
  #elabMeetLiveModuleProbe, elabMeetLiveModuleProbe,
  #elabMeetLiveTheoremsProbe, elabMeetLiveTheoremsProbe,
  ElabMeetLive, SystemsLean.ElabMeetLive,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetLive
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetLive; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetEarly
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Resolve live SystemsLean/Mult.lean.
    Candidate A (Lake cwd = src/systems): SystemsLean/Mult.lean.
    Candidate B (repo root cwd): src/systems/SystemsLean/Mult.lean.
    First pathExists wins. none if neither exists.
    Does not fall back to writing Mult into temp.
    Greppable: findLiveMultPath. -/
def findLiveMultPath : IO (Option System.FilePath) := do
  let candA : System.FilePath := "SystemsLean/Mult.lean"
  let candB : System.FilePath := "src/systems/SystemsLean/Mult.lean"
  if (<- candA.pathExists) then
    return some candA
  if (<- candB.pathExists) then
    return some candB
  return none

/-- Resolve live SystemsLean/MultTheorems.lean.
    Candidate A (Lake cwd = src/systems): SystemsLean/MultTheorems.lean.
    Candidate B (repo root cwd): src/systems/SystemsLean/MultTheorems.lean.
    First pathExists wins. none if neither exists.
    Does not fall back to writing MultTheorems into temp.
    Greppable: findLiveMultTheoremsPath. -/
def findLiveMultTheoremsPath : IO (Option System.FilePath) := do
  let candA : System.FilePath := "SystemsLean/MultTheorems.lean"
  let candB : System.FilePath := "src/systems/SystemsLean/MultTheorems.lean"
  if (<- candA.pathExists) then
    return some candA
  if (<- candB.pathExists) then
    return some candB
  return none

/-- Live-path-gated compile. False if srcPath is not the live Mult path.
    Write .olean under oleanDir (temp), never under src/systems.
    createDirAll (oleanDir / "SystemsLean") before write.
    Reuses tryCompileOnDiskModuleIO (no second elaborator).
    Success requires compile true and SystemsLean/Mult.olean exists.
    Greppable: tryCompileLiveModule. tryCompileOnDiskModule. -/
unsafe def tryCompileLiveModuleIO (srcPath oleanDir : System.FilePath) :
    IO Bool := do
  enableInitializersExecution
  let live? <- findLiveMultPath
  match live? with
  | none => return false
  | some live =>
    if srcPath.toString != live.toString then
      return false
    IO.FS.createDirAll (oleanDir / "SystemsLean")
    let compiled <-
      tryCompileOnDiskModuleIO srcPath `SystemsLean.Mult oleanDir
    let oleanPath :=
      Lean.modToFilePath oleanDir `SystemsLean.Mult "olean"
    pure (compiled && (<- oleanPath.pathExists))

@[implemented_by tryCompileLiveModuleIO]
opaque tryCompileLiveModuleIOSafe (srcPath oleanDir : System.FilePath) :
    IO Bool

/-- CommandElab wrapper: compile the live Mult module to a temp .olean.
    Greppable: tryCompileLiveModule. -/
def tryCompileLiveModule (srcPath oleanDir : System.FilePath) :
    CommandElabM Bool := do
  try
    liftIO (tryCompileLiveModuleIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Compile live Mult, put that .olean on the search path, then compile
    srcPath as thmMod. Used for the planted-error sidecar so the reject
    is a type error, not a missing import.
    Greppable: tryCompileLiveTheorems. tryCompileOnDiskModule. -/
unsafe def tryCompileTheoremsAfterLiveMultIO
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool := do
  enableInitializersExecution
  let liveMult? <- findLiveMultPath
  match liveMult? with
  | none => return false
  | some liveMult =>
    IO.FS.createDirAll (oleanDir / "SystemsLean")
    let compiledMult <-
      tryCompileOnDiskModuleIO liveMult `SystemsLean.Mult oleanDir
    if !compiledMult then
      return false
    let multOlean := Lean.modToFilePath oleanDir `SystemsLean.Mult "olean"
    if !(<- multOlean.pathExists) then
      return false
    let prev <- searchPathRef.get
    searchPathRef.set (oleanDir :: prev)
    try
      tryCompileOnDiskModuleIO srcPath thmMod oleanDir
    finally
      searchPathRef.set prev

@[implemented_by tryCompileTheoremsAfterLiveMultIO]
opaque tryCompileTheoremsAfterLiveMultIOSafe
    (srcPath oleanDir : System.FilePath) (thmMod : Name) : IO Bool

/-- CommandElab wrapper: compile a theorems file after live Mult.
    Greppable: tryCompileLiveTheorems. -/
def tryCompileTheoremsAfterLiveMult
    (srcPath oleanDir : System.FilePath) (thmMod : Name) :
    CommandElabM Bool := do
  try
    liftIO (tryCompileTheoremsAfterLiveMultIOSafe srcPath oleanDir thmMod)
  catch _ =>
    pure false

/-- Live-path-gated theorems compile. False if srcPath is not the live
    MultTheorems path, or if live Mult is missing. Compiles live Mult
    first, then live MultTheorems with that .olean on the search path.
    Write .olean under oleanDir (temp), never under src/systems.
    Success requires both compiles true and both .olean files exist.
    Greppable: tryCompileLiveTheorems. tryCompileOnDiskModule. -/
unsafe def tryCompileLiveTheoremsIO (srcPath oleanDir : System.FilePath) :
    IO Bool := do
  enableInitializersExecution
  let liveMult? <- findLiveMultPath
  let liveThm? <- findLiveMultTheoremsPath
  match liveMult?, liveThm? with
  | some _, some liveThm =>
    if srcPath.toString != liveThm.toString then
      return false
    let compiledThm <-
      tryCompileTheoremsAfterLiveMultIO
        srcPath oleanDir `SystemsLean.MultTheorems
    if !compiledThm then
      return false
    let multOlean := Lean.modToFilePath oleanDir `SystemsLean.Mult "olean"
    let thmOlean :=
      Lean.modToFilePath oleanDir `SystemsLean.MultTheorems "olean"
    pure ((<- multOlean.pathExists) && (<- thmOlean.pathExists))
  | _, _ => return false

@[implemented_by tryCompileLiveTheoremsIO]
opaque tryCompileLiveTheoremsIOSafe (srcPath oleanDir : System.FilePath) :
    IO Bool

/-- CommandElab wrapper: compile live MultTheorems after live Mult.
    Greppable: tryCompileLiveTheorems. -/
def tryCompileLiveTheorems (srcPath oleanDir : System.FilePath) :
    CommandElabM Bool := do
  try
    liftIO (tryCompileLiveTheoremsIOSafe srcPath oleanDir)
  catch _ =>
    pure false

/-- Record accept / reject for live SystemsLean.Mult typecheck.
    Good compiles the real live file (read only). Bad compiles a
    temp copy with a planted type error. Isolation: Name 99
    temp-file walk still works, and this walker is false on that
    temp good snippet. Drive is good && !bad && isolation. -/
elab "#elabMeetLiveModuleProbe" : command => do
  let live? <- liftIO findLiveMultPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let good <-
    match live? with
    | none => pure false
    | some livePath =>
      tryCompileLiveModule livePath oleanDir
  let badCompiled <-
    match live? with
    | none =>
      pure true
    | some livePath => do
      let liveText <- liftIO (IO.FS.readFile livePath)
      let badPath := badDir / "ElabMeetLiveBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileOnDiskModule badPath `ElabMeetLiveBad badDir
  let goodIso := isoDir / "good.lean"
  let badIso := isoDir / "bad.lean"
  liftIO (IO.FS.writeFile goodIso "def n : Nat := 0")
  liftIO (IO.FS.writeFile badIso "def n : Nat := true")
  let name99Good <- tryElabFileFromDisk goodIso
  let name99Bad <- tryElabFileFromDisk badIso
  let name99Ok := name99Good && !name99Bad
  let thisOnTempSnippet <- tryCompileLiveModule goodIso isoDir
  let isolation := name99Ok && !thisOnTempSnippet
  try
    liftIO (IO.FS.removeDirAll oleanDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll badDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll isoDir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !badCompiled then `(true) else `(false)
  let iStx <- if isolation then `(true) else `(false)
  let dStx <-
    if good && !badCompiled && isolation then
      `(true)
    else
      `(false)
  let gN := mkIdent `elabMeetAcceptsGoodLiveModule
  let rN := mkIdent `elabMeetRejectsBadLiveModule
  let iN := mkIdent `elabMeetRejectsOldWalkAsLiveModule
  let dN := mkIdent `elabMeetDrivesLiveModule
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetLiveModuleProbe

example : elabMeetAcceptsGoodLiveModule = true := rfl
example : elabMeetRejectsBadLiveModule = true := rfl
example : elabMeetRejectsOldWalkAsLiveModule = true := rfl
example : elabMeetDrivesLiveModule = true := rfl

/-- Record accept / reject for live SystemsLean.MultTheorems typecheck.
    Good compiles the real live file after live Mult (read only). Bad
    compiles a temp copy with a planted type error and Mult .olean on
    the search path. Isolation: live Mult walker still accepts live
    Mult, and this walker is false on the live Mult path. Drive is
    good && !bad && isolation. -/
elab "#elabMeetLiveTheoremsProbe" : command => do
  let liveMult? <- liftIO findLiveMultPath
  let liveThm? <- liftIO findLiveMultTheoremsPath
  let oleanDir <- liftIO IO.FS.createTempDir
  let badDir <- liftIO IO.FS.createTempDir
  let isoDir <- liftIO IO.FS.createTempDir
  let good <-
    match liveThm? with
    | none => pure false
    | some liveThm =>
      tryCompileLiveTheorems liveThm oleanDir
  let badCompiled <-
    match liveThm? with
    | none =>
      pure true
    | some liveThm => do
      let liveText <- liftIO (IO.FS.readFile liveThm)
      let badPath := badDir / "ElabMeetLiveTheoremsBad.lean"
      let planted := "\ndef plantedTypeError : Nat := true\n"
      liftIO (IO.FS.writeFile badPath (liveText ++ planted))
      tryCompileTheoremsAfterLiveMult
        badPath badDir `ElabMeetLiveTheoremsBad
  let liveMultStillOk <-
    match liveMult? with
    | none => pure false
    | some liveMult =>
      tryCompileLiveModule liveMult isoDir
  let thisOnLiveMultOnly <-
    match liveMult? with
    | none => pure true
    | some liveMult =>
      tryCompileLiveTheorems liveMult isoDir
  let isolation := liveMultStillOk && !thisOnLiveMultOnly
  try
    liftIO (IO.FS.removeDirAll oleanDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll badDir)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll isoDir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !badCompiled then `(true) else `(false)
  let iStx <- if isolation then `(true) else `(false)
  let dStx <-
    if good && !badCompiled && isolation then
      `(true)
    else
      `(false)
  let gN := mkIdent `elabMeetAcceptsGoodLiveTheorems
  let rN := mkIdent `elabMeetRejectsBadLiveTheorems
  let iN := mkIdent `elabMeetRejectsOldWalkAsLiveTheorems
  let dN := mkIdent `elabMeetDrivesLiveTheorems
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $iN : Bool := $iStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetLiveTheoremsProbe

example : elabMeetAcceptsGoodLiveTheorems = true := rfl
example : elabMeetRejectsBadLiveTheorems = true := rfl
example : elabMeetRejectsOldWalkAsLiveTheorems = true := rfl
example : elabMeetDrivesLiveTheorems = true := rfl

end SystemsLean.ElabMeet
