/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet two executable targets
  from a listed source directory.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeet / ElabMeetExe / ElabMeetExeProbe stay
  under the line cap. Same namespace SystemsLean.ElabMeet.
  Parser plus compile plus the probe live here. Snippets stay
  in SystemsLean.ElabMeetProbe. Compile walk reuses
  tryCompileOnDiskModuleIO (no second elaborator).

  Spec (readable):
  - parseExecutableTargetsSourceDirectory requires exactly two
    `lean_exe` and one `srcDir Dir`.
    Name 120 cwd-only two-exe text (no `srcDir`) is none.
    Name 122 one-exe srcDir text (one `lean_exe`) is none.
    parseExecutableTargets is none on srcDir-bearing text.
    parseExecutableSourceDirectory is none on two-exe text.
    parseExecutableTarget is none on srcDir-bearing text.
    parseSourceDirectory is none on lean_exe text.
  - tryCompileExecutableTargetsSourceDirectory compiles
    executable A, then executable B, both from that
    directory, not cwd. Missing directory fail-closes.
    Distinct from ElabMeetExeTwoMissing /
    ElabMeetExeSrcMissing / ElabMeetExeMultiSrcMissing /
    ElabMeetExeImpSrcMissing.
  - The drive is good && !bad && cwdOnlyRejected &&
    oneExeRejected. A cwd-only Name 120 walk is not this
    accept. A one-exe Name 122 walk is not this accept.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  parseExecutableTargetsSourceDirectory,
  tryCompileExecutableTargetsSourceDirectory,
  tryCompileExecutableTargetsSourceDirectoryIO,
  tryCompileExecutableTargetsSourceDirectoryIOSafe,
  ElabMeetExeTwoSrcA, ElabMeetExeTwoSrcB,
  ElabMeetExeTwoSrcMissing, srcDir,
  elabMeetDrivesExecutableTargetsSourceDirectory,
  elabMeetAcceptsGoodExecutableTargetsSourceDirectory,
  elabMeetRejectsMissingExecutableTargetsSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableTargetsSourceDirectory,
  elabMeetRejectsOneExeAsExecutableTargetsSourceDirectory,
  #elabMeetExecutableTargetsSourceDirectoryProbe,
  ElabMeetExeSrcTwo, SystemsLean.ElabMeetExeSrcTwo,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetExeSrcTwo
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetExeSrcTwo; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe
import SystemsLean.ElabMeetExe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Collect exactly two `lean_exe Name` and one `srcDir Dir`.
    No `srcDir` is none (Name 120). One `lean_exe` is none
    (Name 122). Two `lean_lib` instead of two `lean_exe`
    is none. Three exe or two srcDir is none. Empty, `.`,
    `..`, or a slash in the directory name is none.
    A `default` line is none.
    Greppable: parseExecutableTargetsSourceDirectory. -/
def parseExecutableTargetsSourceDirectory (text : String) :
    Option (Prod String (Prod String String)) :=
  let rec go (lines : List String)
      (srcDir : Option String)
      (exeA : Option String)
      (exeB : Option String)
      (seenExe : Nat) :
      Option (Prod String (Prod String String)) :=
    match lines with
    | [] =>
      match srcDir, exeA, exeB with
      | some d, some a, some b => some (d, (a, b))
      | _, _, _ => none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "srcDir " then
        let n := (t.dropPrefix "srcDir ").trimAscii.copy
        if n.isEmpty || n == "." || n == ".." || n.contains '/' then
          none
        else
          match srcDir with
          | some _ => none
          | none => go rest (some n) exeA exeB seenExe
      else if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe >= 2 then
          none
        else if seenExe == 0 then
          go rest srcDir (some n) exeB 1
        else
          go rest srcDir exeA (some n) 2
      else if t.startsWith "lean_lib " then
        none
      else if t == "default" || t.startsWith "default " then
        none
      else
        go rest srcDir exeA exeB seenExe
  go (text.splitOn "\n") none none none 0

/-- Compile executable A, then executable B, both from the
    listed source directory. Reuses
    `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing directory, module
    only at cwd, type error, or missing `.olean`.
    Greppable: tryCompileExecutableTargetsSourceDirectory. -/
unsafe def tryCompileExecutableTargetsSourceDirectoryIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (srcDirName, p) := parseExecutableTargetsSourceDirectory text
    | return false
  let exeAName := p.fst
  let exeBName := p.snd
  let srcRoot := dir / srcDirName
  if !(<- srcRoot.pathExists) then
    return false
  if !(<- srcRoot.isDir) then
    return false
  let exeASrc := Lean.modToFilePath srcRoot (String.toName exeAName) "lean"
  let exeBSrc := Lean.modToFilePath srcRoot (String.toName exeBName) "lean"
  if !(<- exeASrc.pathExists) then
    return false
  if !(<- exeBSrc.pathExists) then
    return false
  let prev <- searchPathRef.get
  searchPathRef.set (srcRoot :: prev)
  try
    let exeAMod := String.toName exeAName
    let exeBMod := String.toName exeBName
    let exeAOk <- tryCompileOnDiskModuleIO exeASrc exeAMod srcRoot
    let exeAOlean := Lean.modToFilePath srcRoot exeAMod "olean"
    if !(exeAOk && (<- exeAOlean.pathExists)) then
      pure false
    else
      let exeBOk <- tryCompileOnDiskModuleIO exeBSrc exeBMod srcRoot
      let exeBOlean := Lean.modToFilePath srcRoot exeBMod "olean"
      pure (exeBOk && (<- exeBOlean.pathExists))
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableTargetsSourceDirectoryIO]
opaque tryCompileExecutableTargetsSourceDirectoryIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile two executables from srcDir.
    Greppable: tryCompileExecutableTargetsSourceDirectory. -/
def tryCompileExecutableTargetsSourceDirectory
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableTargetsSourceDirectoryIOSafe descPath dir)
  catch _ =>
    pure false

/-- Record accept / reject for two executable targets from a
    listed source directory. Accept writes two `lean_exe`
    plus `srcDir src` and compiles both under `src/` (not
    cwd). Reject names `srcDir ElabMeetExeTwoSrcMissing`
    with no such directory. A Name 120 cwd-only two-exe
    walk compiles as executable-targets and is not this
    accept. A Name 122 one-exe srcDir walk compiles as
    executable source-directory and is not this accept.
    Drive is good && !bad && cwdOnlyRejected && oneExeRejected. -/
elab "#elabMeetExecutableTargetsSourceDirectoryProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirCwd <- liftIO IO.FS.createTempDir
  let dirOneExe <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let srcRoot := dirGood / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let exeAPath :=
      Lean.modToFilePath srcRoot `ElabMeetExeTwoSrcA "lean"
    let exeBPath :=
      Lean.modToFilePath srcRoot `ElabMeetExeTwoSrcB "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile exeAPath exeTwoSrcASnippet)
    liftIO (IO.FS.writeFile exeBPath exeTwoSrcBSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetsSourceDirectoryText)
  let writeBad : CommandElabM Unit := do
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile descPath badExecutableTargetsSourceDirectoryText)
  let writeCwd : CommandElabM Unit := do
    let exeAPath := Lean.modToFilePath dirCwd `ElabMeetExeTwoA "lean"
    let exeBPath := Lean.modToFilePath dirCwd `ElabMeetExeTwoB "lean"
    let descPath := dirCwd / "package.txt"
    liftIO (IO.FS.writeFile exeAPath exeTwoASnippet)
    liftIO (IO.FS.writeFile exeBPath exeTwoBSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetsText)
  let writeOneExe : CommandElabM Unit := do
    let srcRoot := dirOneExe / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let exePath := Lean.modToFilePath srcRoot `ElabMeetExeSrcMain "lean"
    let descPath := dirOneExe / "package.txt"
    liftIO (IO.FS.writeFile exePath exeSrcMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableSourceDirectoryText)
  writeGood
  writeBad
  writeCwd
  writeOneExe
  let srcOk <-
    tryCompileExecutableTargetsSourceDirectory
      (dirGood / "package.txt") dirGood
  let exeAOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeTwoSrcA "olean"
  let exeBOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeTwoSrcB "olean"
  let cwdExeAOlean :=
    Lean.modToFilePath dirGood `ElabMeetExeTwoSrcA "olean"
  let cwdExeBOlean :=
    Lean.modToFilePath dirGood `ElabMeetExeTwoSrcB "olean"
  let exeAOleanOk <- liftIO exeAOlean.pathExists
  let exeBOleanOk <- liftIO exeBOlean.pathExists
  let cwdExeAOk <- liftIO cwdExeAOlean.pathExists
  let cwdExeBOk <- liftIO cwdExeBOlean.pathExists
  let targetsParseNone :=
    match parseExecutableTargets goodExecutableTargetsSourceDirectoryText with
    | none => true
    | some _ => false
  let exeParseNone :=
    match parseExecutableTarget goodExecutableTargetsSourceDirectoryText with
    | none => true
    | some _ => false
  let exeSrcParseNone :=
    match parseExecutableSourceDirectory
      goodExecutableTargetsSourceDirectoryText with
    | none => true
    | some _ => false
  let libSrcParseNone :=
    match parseSourceDirectory goodExecutableTargetsSourceDirectoryText with
    | none => true
    | some _ => false
  let good :=
    srcOk && exeAOleanOk && exeBOleanOk &&
      !cwdExeAOk && !cwdExeBOk &&
      targetsParseNone && exeParseNone &&
      exeSrcParseNone && libSrcParseNone
  let miss <-
    tryCompileExecutableTargetsSourceDirectory
      (dirBad / "package.txt") dirBad
  let bad := miss
  let targetsOk <-
    tryCompileExecutableTargets (dirCwd / "package.txt") dirCwd
  let srcOnCwd <-
    tryCompileExecutableTargetsSourceDirectory
      (dirCwd / "package.txt") dirCwd
  let parseCwdNone :=
    match parseExecutableTargetsSourceDirectory goodExecutableTargetsText with
    | none => true
    | some _ => false
  let cwdOnlyRejected := parseCwdNone && targetsOk && !srcOnCwd
  let oneExeOk <-
    tryCompileExecutableSourceDirectory
      (dirOneExe / "package.txt") dirOneExe
  let srcOnOneExe <-
    tryCompileExecutableTargetsSourceDirectory
      (dirOneExe / "package.txt") dirOneExe
  let parseOneExeNone :=
    match parseExecutableTargetsSourceDirectory
      goodExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let oneExeRejected := parseOneExeNone && oneExeOk && !srcOnOneExe
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirCwd)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirOneExe)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let cStx <- if cwdOnlyRejected then `(true) else `(false)
  let oStx <- if oneExeRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && cwdOnlyRejected && oneExeRejected then
      `(true)
    else
      `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableTargetsSourceDirectory
  let rN := mkIdent `elabMeetRejectsMissingExecutableTargetsSourceDirectory
  let cN := mkIdent `elabMeetRejectsCwdOnlyAsExecutableTargetsSourceDirectory
  let oN := mkIdent `elabMeetRejectsOneExeAsExecutableTargetsSourceDirectory
  let dN := mkIdent `elabMeetDrivesExecutableTargetsSourceDirectory
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $cN : Bool := $cStx))
  elabCommand (<- `(def $oN : Bool := $oStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableTargetsSourceDirectoryProbe

example : elabMeetDrivesExecutableTargetsSourceDirectory = true := rfl
example : elabMeetAcceptsGoodExecutableTargetsSourceDirectory = true := rfl
example : elabMeetRejectsMissingExecutableTargetsSourceDirectory = true := rfl
example : elabMeetRejectsCwdOnlyAsExecutableTargetsSourceDirectory = true := rfl
example : elabMeetRejectsOneExeAsExecutableTargetsSourceDirectory = true := rfl

end SystemsLean.ElabMeet
