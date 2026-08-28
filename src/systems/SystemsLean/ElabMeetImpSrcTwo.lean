/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet two-library executable
  import from a listed source directory.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeetExeProbe stays under the line cap.
  Same namespace SystemsLean.ElabMeet. Parser plus compile plus
  the probe live here. Snippets stay in SystemsLean.ElabMeetProbe.
  Compile walk reuses tryCompileOnDiskModuleIO (no second
  elaborator).

  Spec (readable):
  - parseExecutableMultiLibSourceDirectory requires exactly two
    `lean_lib`, one `lean_exe`, and one `srcDir Dir`.
    Name 119 cwd-only two-lib+exe text (no `srcDir`) is none.
    Name 123 one-library srcDir text (one `lean_lib`) is none.
    parseExecutableMultiLib is none on srcDir-bearing text.
    parseExecutableImportSourceDirectory is none on two-lib text.
    parseExecutableSourceDirectory is none on lean_lib text.
    parseSourceDirectory is none on lean_exe text.
  - tryCompileExecutableMultiLibSourceDirectory compiles library
    A, then library B, then the executable, all from that
    directory, not cwd. Missing directory fail-closes.
    Distinct from ElabMeetExeImpSrcMissing /
    ElabMeetExeMultiLibAMissing / ElabMeetExeSrcMissing.
  - The drive is good && !bad && cwdOnlyRejected &&
    oneLibRejected. A cwd-only Name 119 walk is not this
    accept. A one-library Name 123 walk is not this accept.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  parseExecutableMultiLibSourceDirectory,
  tryCompileExecutableMultiLibSourceDirectory,
  tryCompileExecutableMultiLibSourceDirectoryIO,
  tryCompileExecutableMultiLibSourceDirectoryIOSafe,
  ElabMeetExeMultiSrcLibA, ElabMeetExeMultiSrcLibB,
  ElabMeetExeMultiSrcMain, ElabMeetExeMultiSrcMissing, srcDir,
  elabMeetDrivesExecutableMultiLibSourceDirectory,
  elabMeetAcceptsGoodExecutableMultiLibSourceDirectory,
  elabMeetRejectsMissingExecutableMultiLibSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableMultiLibSourceDirectory,
  elabMeetRejectsOneLibAsExecutableMultiLibSourceDirectory,
  #elabMeetExecutableMultiLibSourceDirectoryProbe,
  ElabMeetImpSrcTwo, SystemsLean.ElabMeetImpSrcTwo,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetImpSrcTwo
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetImpSrcTwo; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe
import SystemsLean.ElabMeetExe
import SystemsLean.ElabMeetImpSrc

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Collect exactly two `lean_lib Name`, one `lean_exe Name`,
    one `srcDir Dir`. No `srcDir` is none (Name 119). One
    `lean_lib` is none (Name 123). No `lean_exe` is none.
    Three libs, two exe, or two srcDir is none. Empty, `.`,
    `..`, or a slash in the directory name is none.
    Greppable: parseExecutableMultiLibSourceDirectory. -/
def parseExecutableMultiLibSourceDirectory (text : String) :
    Option (Prod String (Prod String (Prod String String))) :=
  let rec go (lines : List String)
      (srcDir : Option String)
      (libA : Option String)
      (libB : Option String)
      (exe : Option String)
      (seenLib : Nat)
      (seenExe : Bool) :
      Option (Prod String (Prod String (Prod String String))) :=
    match lines with
    | [] =>
      match srcDir, libA, libB, exe with
      | some d, some a, some b, some e => some (d, (a, (b, e)))
      | _, _, _, _ => none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "srcDir " then
        let n := (t.dropPrefix "srcDir ").trimAscii.copy
        if n.isEmpty || n == "." || n == ".." || n.contains '/' then
          none
        else
          match srcDir with
          | some _ => none
          | none => go rest (some n) libA libB exe seenLib seenExe
      else if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
        if n.isEmpty || seenLib >= 2 then
          none
        else if seenLib == 0 then
          go rest srcDir (some n) libB exe 1 seenExe
        else
          go rest srcDir libA (some n) exe 2 seenExe
      else if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe then
          none
        else
          go rest srcDir libA libB (some n) seenLib true
      else if t == "default" || t.startsWith "default " then
        none
      else
        go rest srcDir libA libB exe seenLib seenExe
  go (text.splitOn "\n") none none none none 0 false

/-- Compile library A, then library B, then the executable,
    all from the listed source directory. Reuses
    `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing directory, module
    only at cwd, type error, or missing `.olean`.
    Greppable: tryCompileExecutableMultiLibSourceDirectory. -/
unsafe def tryCompileExecutableMultiLibSourceDirectoryIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (srcDirName, p) := parseExecutableMultiLibSourceDirectory text
    | return false
  let libAName := p.fst
  let libBName := p.snd.fst
  let exeName := p.snd.snd
  let srcRoot := dir / srcDirName
  if !(<- srcRoot.pathExists) then
    return false
  if !(<- srcRoot.isDir) then
    return false
  let libASrc := Lean.modToFilePath srcRoot (String.toName libAName) "lean"
  let libBSrc := Lean.modToFilePath srcRoot (String.toName libBName) "lean"
  let exeSrc := Lean.modToFilePath srcRoot (String.toName exeName) "lean"
  if !(<- libASrc.pathExists) then
    return false
  if !(<- libBSrc.pathExists) then
    return false
  if !(<- exeSrc.pathExists) then
    return false
  let prev <- searchPathRef.get
  searchPathRef.set (srcRoot :: prev)
  try
    let libAMod := String.toName libAName
    let libBMod := String.toName libBName
    let exeMod := String.toName exeName
    let libAOk <- tryCompileOnDiskModuleIO libASrc libAMod srcRoot
    let libAOlean := Lean.modToFilePath srcRoot libAMod "olean"
    if !(libAOk && (<- libAOlean.pathExists)) then
      pure false
    else
      let libBOk <- tryCompileOnDiskModuleIO libBSrc libBMod srcRoot
      let libBOlean := Lean.modToFilePath srcRoot libBMod "olean"
      if !(libBOk && (<- libBOlean.pathExists)) then
        pure false
      else
        let exeOk <- tryCompileOnDiskModuleIO exeSrc exeMod srcRoot
        let exeOlean := Lean.modToFilePath srcRoot exeMod "olean"
        pure (exeOk && (<- exeOlean.pathExists))
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableMultiLibSourceDirectoryIO]
opaque tryCompileExecutableMultiLibSourceDirectoryIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile two libraries then executable from srcDir.
    Greppable: tryCompileExecutableMultiLibSourceDirectory. -/
def tryCompileExecutableMultiLibSourceDirectory
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableMultiLibSourceDirectoryIOSafe descPath dir)
  catch _ =>
    pure false

/-- Record accept / reject for an executable that imports two
    compiled libraries from a listed source directory. Accept
    writes two `lean_lib` plus one `lean_exe` plus `srcDir src`
    and compiles A then B then the executable under `src/`
    (not cwd). Reject names `srcDir ElabMeetExeMultiSrcMissing`
    with no such directory. A Name 119 cwd-only two-lib+exe
    walk compiles as executable-multi-lib and is not this
    accept. A Name 123 one-library srcDir walk compiles as
    executable-import source-directory and is not this accept.
    Drive is good && !bad && cwdOnlyRejected && oneLibRejected. -/
elab "#elabMeetExecutableMultiLibSourceDirectoryProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirCwd <- liftIO IO.FS.createTempDir
  let dirOneLib <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let srcRoot := dirGood / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let libAPath :=
      Lean.modToFilePath srcRoot `ElabMeetExeMultiSrcLibA "lean"
    let libBPath :=
      Lean.modToFilePath srcRoot `ElabMeetExeMultiSrcLibB "lean"
    let exePath :=
      Lean.modToFilePath srcRoot `ElabMeetExeMultiSrcMain "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile libAPath exeMultiSrcLibASnippet)
    liftIO (IO.FS.writeFile libBPath exeMultiSrcLibBSnippet)
    liftIO (IO.FS.writeFile exePath goodExeMultiSrcMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableMultiLibSourceDirectoryText)
  let writeBad : CommandElabM Unit := do
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile descPath badExecutableMultiLibSourceDirectoryText)
  let writeCwd : CommandElabM Unit := do
    let libAPath := Lean.modToFilePath dirCwd `ElabMeetExeMultiLibA "lean"
    let libBPath := Lean.modToFilePath dirCwd `ElabMeetExeMultiLibB "lean"
    let exePath := Lean.modToFilePath dirCwd `ElabMeetExeMultiMain "lean"
    let descPath := dirCwd / "package.txt"
    liftIO (IO.FS.writeFile libAPath exeMultiLibASnippet)
    liftIO (IO.FS.writeFile libBPath exeMultiLibBSnippet)
    liftIO (IO.FS.writeFile exePath goodExeMultiMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableMultiLibText)
  let writeOneLib : CommandElabM Unit := do
    let srcRoot := dirOneLib / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let libPath := Lean.modToFilePath srcRoot `ElabMeetExeImpSrcLib "lean"
    let exePath := Lean.modToFilePath srcRoot `ElabMeetExeImpSrcMain "lean"
    let descPath := dirOneLib / "package.txt"
    liftIO (IO.FS.writeFile libPath exeImpSrcLibSnippet)
    liftIO (IO.FS.writeFile exePath goodExeImpSrcMainSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableImportSourceDirectoryText)
  writeGood
  writeBad
  writeCwd
  writeOneLib
  let srcOk <-
    tryCompileExecutableMultiLibSourceDirectory
      (dirGood / "package.txt") dirGood
  let libAOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeMultiSrcLibA "olean"
  let libBOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeMultiSrcLibB "olean"
  let exeOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetExeMultiSrcMain "olean"
  let cwdLibAOlean :=
    Lean.modToFilePath dirGood `ElabMeetExeMultiSrcLibA "olean"
  let cwdLibBOlean :=
    Lean.modToFilePath dirGood `ElabMeetExeMultiSrcLibB "olean"
  let cwdExeOlean :=
    Lean.modToFilePath dirGood `ElabMeetExeMultiSrcMain "olean"
  let libAOleanOk <- liftIO libAOlean.pathExists
  let libBOleanOk <- liftIO libBOlean.pathExists
  let exeOleanOk <- liftIO exeOlean.pathExists
  let cwdLibAOk <- liftIO cwdLibAOlean.pathExists
  let cwdLibBOk <- liftIO cwdLibBOlean.pathExists
  let cwdExeOk <- liftIO cwdExeOlean.pathExists
  let multiParseNone :=
    match parseExecutableMultiLib goodExecutableMultiLibSourceDirectoryText with
    | none => true
    | some _ => false
  let impParseNone :=
    match parseExecutableImport goodExecutableMultiLibSourceDirectoryText with
    | none => true
    | some _ => false
  let impSrcParseNone :=
    match parseExecutableImportSourceDirectory
      goodExecutableMultiLibSourceDirectoryText with
    | none => true
    | some _ => false
  let exeSrcParseNone :=
    match parseExecutableSourceDirectory
      goodExecutableMultiLibSourceDirectoryText with
    | none => true
    | some _ => false
  let libSrcParseNone :=
    match parseSourceDirectory goodExecutableMultiLibSourceDirectoryText with
    | none => true
    | some _ => false
  let good :=
    srcOk && libAOleanOk && libBOleanOk && exeOleanOk &&
      !cwdLibAOk && !cwdLibBOk && !cwdExeOk &&
      multiParseNone && impParseNone && impSrcParseNone &&
      exeSrcParseNone && libSrcParseNone
  let miss <-
    tryCompileExecutableMultiLibSourceDirectory
      (dirBad / "package.txt") dirBad
  let bad := miss
  let multiOk <-
    tryCompileExecutableMultiLib (dirCwd / "package.txt") dirCwd
  let srcOnCwd <-
    tryCompileExecutableMultiLibSourceDirectory
      (dirCwd / "package.txt") dirCwd
  let parseCwdNone :=
    match parseExecutableMultiLibSourceDirectory goodExecutableMultiLibText with
    | none => true
    | some _ => false
  let cwdOnlyRejected := parseCwdNone && multiOk && !srcOnCwd
  let oneLibOk <-
    tryCompileExecutableImportSourceDirectory
      (dirOneLib / "package.txt") dirOneLib
  let srcOnOneLib <-
    tryCompileExecutableMultiLibSourceDirectory
      (dirOneLib / "package.txt") dirOneLib
  let parseOneLibNone :=
    match parseExecutableMultiLibSourceDirectory
      goodExecutableImportSourceDirectoryText with
    | none => true
    | some _ => false
  let oneLibRejected := parseOneLibNone && oneLibOk && !srcOnOneLib
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
    liftIO (IO.FS.removeDirAll dirOneLib)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let cStx <- if cwdOnlyRejected then `(true) else `(false)
  let oStx <- if oneLibRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && cwdOnlyRejected && oneLibRejected then
      `(true)
    else
      `(false)
  let gN := mkIdent `elabMeetAcceptsGoodExecutableMultiLibSourceDirectory
  let rN := mkIdent `elabMeetRejectsMissingExecutableMultiLibSourceDirectory
  let cN := mkIdent `elabMeetRejectsCwdOnlyAsExecutableMultiLibSourceDirectory
  let oN := mkIdent `elabMeetRejectsOneLibAsExecutableMultiLibSourceDirectory
  let dN := mkIdent `elabMeetDrivesExecutableMultiLibSourceDirectory
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $cN : Bool := $cStx))
  elabCommand (<- `(def $oN : Bool := $oStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetExecutableMultiLibSourceDirectoryProbe

example : elabMeetDrivesExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetAcceptsGoodExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetRejectsMissingExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetRejectsCwdOnlyAsExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetRejectsOneLibAsExecutableMultiLibSourceDirectory = true := rfl

end SystemsLean.ElabMeet
