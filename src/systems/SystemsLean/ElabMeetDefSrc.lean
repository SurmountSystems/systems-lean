/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet default executable from a
  listed source directory.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeet / ElabMeetExe / ElabMeetExeProbe /
  ElabMeetExeSrcTwo stay under the line cap. Same namespace
  SystemsLean.ElabMeet. Parser plus compile plus the probe live
  here. Snippets stay in SystemsLean.ElabMeetProbe. Compile walk
  reuses tryCompileOnDiskModuleIO (no second elaborator).
  Long-file split: ELAB-MEET-SMOKE examples live here.

  Spec (readable):
  - parseDefaultExecutableSourceDirectory requires exactly two
    `lean_exe`, one `srcDir Dir`, and one `default Name`.
    Name 125 two-exe srcDir text (no `default`) is none.
    Name 121 two-exe default text (no `srcDir`) is none.
    parseExecutableTargetsSourceDirectory is none on
    default-bearing text.
  - tryCompileDefaultExecutableSourceDirectory compiles only
    the default executable from that directory, not cwd.
    Missing directory or missing default fail-closes.
    Distinct from ElabMeetDefExeMissing /
    ElabMeetExeTwoSrcMissing / ElabMeetExeSrcMissing.
  - The drive is good && !bad && name125BothRejected &&
    name121CwdRejected. A both-in-order Name 125 walk is
    not this accept. A cwd-only Name 121 walk is not this
    accept.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  parseDefaultExecutableSourceDirectory,
  tryCompileDefaultExecutableSourceDirectory,
  tryCompileDefaultExecutableSourceDirectoryIO,
  tryCompileDefaultExecutableSourceDirectoryIOSafe,
  ElabMeetDefExeSrcA, ElabMeetDefExeSrcB,
  ElabMeetDefExeSrcMissing, srcDir,
  elabMeetDrivesDefaultExecutableSourceDirectory,
  elabMeetAcceptsGoodDefaultExecutableSourceDirectory,
  elabMeetRejectsMissingDefaultExecutableSourceDirectory,
  elabMeetRejectsBothAsDefaultExecutableSourceDirectory,
  elabMeetRejectsCwdDefaultAsDefaultExecutableSourceDirectory,
  #elabMeetDefaultExecutableSourceDirectoryProbe,
  ElabMeetDefSrc, SystemsLean.ElabMeetDefSrc, ELAB-MEET-SMOKE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetDefSrc
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetDefSrc; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetEarly
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe
import SystemsLean.ElabMeetOlean
import SystemsLean.ElabMeetDesc
import SystemsLean.ElabMeetExe
import SystemsLean.ElabMeetImpSrc
import SystemsLean.ElabMeetImpSrcTwo
import SystemsLean.ElabMeetExeSrcTwo
import SystemsLean.ElabMeetExeProbe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Collect exactly two `lean_exe Name`, one `srcDir Dir`,
    and one `default Name`. No `srcDir` is none (Name 121).
    No `default` is none (Name 125). One `lean_exe` is none.
    Two `lean_lib` is none. Three exe or two srcDir or two
    default is none. Empty, `.`, `..`, or a slash in the
    directory name is none.
    Greppable: parseDefaultExecutableSourceDirectory. -/
def parseDefaultExecutableSourceDirectory (text : String) :
    Option (Prod String (Prod String (Prod String String))) :=
  let rec go (lines : List String)
      (srcDir : Option String)
      (exeA : Option String)
      (exeB : Option String)
      (defName : Option String)
      (seenExe : Nat) :
      Option (Prod String (Prod String (Prod String String))) :=
    match lines with
    | [] =>
      match srcDir, exeA, exeB, defName with
      | some d, some a, some b, some n => some (d, (a, (b, n)))
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
          | none => go rest (some n) exeA exeB defName seenExe
      else if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe >= 2 then
          none
        else if seenExe == 0 then
          go rest srcDir (some n) exeB defName 1
        else
          go rest srcDir exeA (some n) defName 2
      else if t.startsWith "lean_lib " then
        none
      else if t == "default" then
        none
      else if t.startsWith "default " then
        let n := (t.dropPrefix "default ").trimAscii.copy
        if n.isEmpty then
          none
        else
          match defName with
          | some _ => none
          | none => go rest srcDir exeA exeB (some n) seenExe
      else
        go rest srcDir exeA exeB defName seenExe
  go (text.splitOn "\n") none none none none 0

/-- Compile only the default executable from the listed
    source directory. Reuses `tryCompileOnDiskModuleIO`
    (no second elaborator). Fail-closed on parse none,
    default not among the two executables, missing
    directory, module only at cwd, type error, or missing
    `.olean`. Does not compile the non-default executable.
    Greppable: tryCompileDefaultExecutableSourceDirectory. -/
unsafe def tryCompileDefaultExecutableSourceDirectoryIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (srcDirName, p) := parseDefaultExecutableSourceDirectory text
    | return false
  let exeAName := p.fst
  let exeBName := p.snd.fst
  let defName := p.snd.snd
  if !(defName == exeAName || defName == exeBName) then
    return false
  let srcRoot := dir / srcDirName
  if !(<- srcRoot.pathExists) then
    return false
  if !(<- srcRoot.isDir) then
    return false
  let defSrc := Lean.modToFilePath srcRoot (String.toName defName) "lean"
  if !(<- defSrc.pathExists) then
    return false
  let prev <- searchPathRef.get
  searchPathRef.set (srcRoot :: prev)
  try
    let defMod := String.toName defName
    let defOk <- tryCompileOnDiskModuleIO defSrc defMod srcRoot
    let defOlean := Lean.modToFilePath srcRoot defMod "olean"
    pure (defOk && (<- defOlean.pathExists))
  finally
    searchPathRef.set prev

@[implemented_by tryCompileDefaultExecutableSourceDirectoryIO]
opaque tryCompileDefaultExecutableSourceDirectoryIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the default executable from srcDir.
    Greppable: tryCompileDefaultExecutableSourceDirectory. -/
def tryCompileDefaultExecutableSourceDirectory
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileDefaultExecutableSourceDirectoryIOSafe descPath dir)
  catch _ =>
    pure false

/-- Record accept / reject for a default executable from a
    listed source directory. Accept writes two `lean_exe`
    plus `srcDir src` plus `default ElabMeetDefExeSrcA` and
    compiles only A under `src/` (B `.olean` absent; not
    cwd). Reject names `srcDir ElabMeetDefExeSrcMissing` or
    `default ElabMeetDefExeSrcMissing`. A Name 125
    both-in-order walk compiles both as executable-targets
    from srcDir and is not this accept. A Name 121 cwd
    default walk compiles the default at cwd and is not
    this accept. Drive is good && !bad &&
    name125BothRejected && name121CwdRejected. -/
elab "#elabMeetDefaultExecutableSourceDirectoryProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirMissDef <- liftIO IO.FS.createTempDir
  let dir125 <- liftIO IO.FS.createTempDir
  let dir121 <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let srcRoot := dirGood / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let exeAPath :=
      Lean.modToFilePath srcRoot `ElabMeetDefExeSrcA "lean"
    let exeBPath :=
      Lean.modToFilePath srcRoot `ElabMeetDefExeSrcB "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile exeAPath defExeSrcASnippet)
    liftIO (IO.FS.writeFile exeBPath defExeSrcBSnippet)
    liftIO (IO.FS.writeFile descPath goodDefaultExecutableSourceDirectoryText)
  let writeBad : CommandElabM Unit := do
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile descPath badDefaultExecutableSourceDirectoryText)
  let writeMissDef : CommandElabM Unit := do
    let srcRoot := dirMissDef / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let exeAPath :=
      Lean.modToFilePath srcRoot `ElabMeetDefExeSrcA "lean"
    let exeBPath :=
      Lean.modToFilePath srcRoot `ElabMeetDefExeSrcB "lean"
    let descPath := dirMissDef / "package.txt"
    liftIO (IO.FS.writeFile exeAPath defExeSrcASnippet)
    liftIO (IO.FS.writeFile exeBPath defExeSrcBSnippet)
    liftIO (IO.FS.writeFile descPath missingDefaultExecutableSourceDirectoryText)
  let write125 : CommandElabM Unit := do
    let srcRoot := dir125 / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let exeAPath :=
      Lean.modToFilePath srcRoot `ElabMeetExeTwoSrcA "lean"
    let exeBPath :=
      Lean.modToFilePath srcRoot `ElabMeetExeTwoSrcB "lean"
    let descPath := dir125 / "package.txt"
    liftIO (IO.FS.writeFile exeAPath exeTwoSrcASnippet)
    liftIO (IO.FS.writeFile exeBPath exeTwoSrcBSnippet)
    liftIO (IO.FS.writeFile descPath goodExecutableTargetsSourceDirectoryText)
  let write121 : CommandElabM Unit := do
    let exeAPath := Lean.modToFilePath dir121 `ElabMeetDefExeA "lean"
    let exeBPath := Lean.modToFilePath dir121 `ElabMeetDefExeB "lean"
    let descPath := dir121 / "package.txt"
    liftIO (IO.FS.writeFile exeAPath defExeASnippet)
    liftIO (IO.FS.writeFile exeBPath defExeBSnippet)
    liftIO (IO.FS.writeFile descPath goodDefaultExecutableTargetText)
  writeGood
  writeBad
  writeMissDef
  write125
  write121
  let srcOk <-
    tryCompileDefaultExecutableSourceDirectory
      (dirGood / "package.txt") dirGood
  let exeAOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetDefExeSrcA "olean"
  let exeBOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetDefExeSrcB "olean"
  let cwdExeAOlean :=
    Lean.modToFilePath dirGood `ElabMeetDefExeSrcA "olean"
  let cwdExeBOlean :=
    Lean.modToFilePath dirGood `ElabMeetDefExeSrcB "olean"
  let exeAOleanOk <- liftIO exeAOlean.pathExists
  let exeBOleanOk <- liftIO exeBOlean.pathExists
  let cwdExeAOk <- liftIO cwdExeAOlean.pathExists
  let cwdExeBOk <- liftIO cwdExeBOlean.pathExists
  let twoSrcParseNone :=
    match parseExecutableTargetsSourceDirectory
      goodDefaultExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let targetsParseNone :=
    match parseExecutableTargets goodDefaultExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let exeParseNone :=
    match parseExecutableTarget goodDefaultExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let exeSrcParseNone :=
    match parseExecutableSourceDirectory
      goodDefaultExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let libSrcParseNone :=
    match parseSourceDirectory goodDefaultExecutableSourceDirectoryText with
    | none => true
    | some _ => false
  let good :=
    srcOk && exeAOleanOk && !exeBOleanOk &&
      !cwdExeAOk && !cwdExeBOk &&
      twoSrcParseNone && targetsParseNone && exeParseNone &&
      exeSrcParseNone && libSrcParseNone
  let missDir <-
    tryCompileDefaultExecutableSourceDirectory
      (dirBad / "package.txt") dirBad
  let missDef <-
    tryCompileDefaultExecutableSourceDirectory
      (dirMissDef / "package.txt") dirMissDef
  let bad := missDir || missDef
  let bothOk <-
    tryCompileExecutableTargetsSourceDirectory
      (dir125 / "package.txt") dir125
  let thisOn125 <-
    tryCompileDefaultExecutableSourceDirectory
      (dir125 / "package.txt") dir125
  let parse125None :=
    match parseDefaultExecutableSourceDirectory
      goodExecutableTargetsSourceDirectoryText with
    | none => true
    | some _ => false
  let name125BothRejected := parse125None && bothOk && !thisOn125
  let defOk <-
    tryCompileDefaultExecutableTarget (dir121 / "package.txt") dir121
  let thisOn121 <-
    tryCompileDefaultExecutableSourceDirectory
      (dir121 / "package.txt") dir121
  let parse121None :=
    match parseDefaultExecutableSourceDirectory
      goodDefaultExecutableTargetText with
    | none => true
    | some _ => false
  let name121CwdRejected := parse121None && defOk && !thisOn121
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirMissDef)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dir125)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dir121)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let n125Stx <- if name125BothRejected then `(true) else `(false)
  let n121Stx <- if name121CwdRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && name125BothRejected && name121CwdRejected then
      `(true)
    else
      `(false)
  let gN := mkIdent `elabMeetAcceptsGoodDefaultExecutableSourceDirectory
  let rN := mkIdent `elabMeetRejectsMissingDefaultExecutableSourceDirectory
  let n125N := mkIdent `elabMeetRejectsBothAsDefaultExecutableSourceDirectory
  let n121N :=
    mkIdent `elabMeetRejectsCwdDefaultAsDefaultExecutableSourceDirectory
  let dN := mkIdent `elabMeetDrivesDefaultExecutableSourceDirectory
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $n125N : Bool := $n125Stx))
  elabCommand (<- `(def $n121N : Bool := $n121Stx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetDefaultExecutableSourceDirectoryProbe

example : elabMeetDrivesDefaultExecutableSourceDirectory = true := rfl
example : elabMeetAcceptsGoodDefaultExecutableSourceDirectory = true := rfl
example : elabMeetRejectsMissingDefaultExecutableSourceDirectory = true := rfl
example : elabMeetRejectsBothAsDefaultExecutableSourceDirectory = true := rfl
example : elabMeetRejectsCwdDefaultAsDefaultExecutableSourceDirectory = true :=
  rfl

/-! ### ELAB-MEET-SMOKE -/

example : elabMeetDrivesOneModule = true := rfl
example : elabMeetDrivesOneTheorem = true := rfl
example : elabMeetAcceptsGoodTheorem = true := rfl
example : elabMeetRejectsBadTheorem = true := rfl
example : elabMeetDrivesOneImportedModule = true := rfl
example : elabMeetAcceptsGoodImport = true := rfl
example : elabMeetRejectsBadImport = true := rfl
example : elabMeetDrivesOneFileFromDisk = true := rfl
example : elabMeetAcceptsGoodFile = true := rfl
example : elabMeetRejectsBadFile = true := rfl
example : elabMeetDrivesOnDiskImport = true := rfl
example : elabMeetAcceptsGoodOnDiskImport = true := rfl
example : elabMeetRejectsBadOnDiskImport = true := rfl
example : elabMeetDrivesCompiledImport = true := rfl
example : elabMeetAcceptsGoodCompiledImport = true := rfl
example : elabMeetRejectsBadCompiledImport = true := rfl
example : elabMeetDrivesTwoModulePackage = true := rfl
example : elabMeetAcceptsGoodTwoModulePackage = true := rfl
example : elabMeetRejectsBadTwoModulePackage = true := rfl
example : elabMeetDrivesPackageDesc = true := rfl
example : elabMeetAcceptsGoodPackageDesc = true := rfl
example : elabMeetRejectsBadPackageDesc = true := rfl
example : elabMeetDrivesCompileOrder = true := rfl
example : elabMeetAcceptsGoodCompileOrder = true := rfl
example : elabMeetRejectsBadCompileOrder = true := rfl
example : elabMeetDrivesFollowImports = true := rfl
example : elabMeetAcceptsGoodFollowImports = true := rfl
example : elabMeetRejectsBadFollowImports = true := rfl
example : elabMeetDrivesFollowImportChain = true := rfl
example : elabMeetAcceptsGoodFollowImportChain = true := rfl
example : elabMeetRejectsBadFollowImportChain = true := rfl
example : elabMeetDrivesCycleReject = true := rfl
example : elabMeetAcceptsGoodCycleReject = true := rfl
example : elabMeetRejectsBadCycleReject = true := rfl
example : elabMeetDrivesPackageTheorem = true := rfl
example : elabMeetAcceptsGoodPackageTheorem = true := rfl
example : elabMeetRejectsBadPackageTheorem = true := rfl
example : elabMeetDrivesLibraryTheorem = true := rfl
example : elabMeetAcceptsGoodLibraryTheorem = true := rfl
example : elabMeetRejectsBadLibraryTheorem = true := rfl
example : elabMeetDrivesOleanReuse = true := rfl
example : elabMeetAcceptsGoodOleanReuse = true := rfl
example : elabMeetRejectsBadOleanReuse = true := rfl
example : elabMeetDrivesRebuildWhenChanged = true := rfl
example : elabMeetAcceptsUnchangedRebuildReuse = true := rfl
example : elabMeetRejectsStaleRebuild = true := rfl
example : elabMeetDrivesDependentRebuild = true := rfl
example : elabMeetAcceptsDependentRebuild = true := rfl
example : elabMeetRejectsStaleDependent = true := rfl
example : elabMeetDrivesRicherPackageDesc = true := rfl
example : elabMeetAcceptsGoodRicherPackageDesc = true := rfl
example : elabMeetRejectsBadRicherPackageDesc = true := rfl
example : elabMeetRejectsModuleOnlyRicherPackageDesc = true := rfl
example : elabMeetDrivesNamedLibraryTargets = true := rfl
example : elabMeetAcceptsGoodNamedLibraryTargets = true := rfl
example : elabMeetRejectsMissingNamedLibraryTarget = true := rfl
example : elabMeetRejectsSingleLibAsNamedTargets = true := rfl
example : elabMeetDrivesDefaultLibraryTarget = true := rfl
example : elabMeetAcceptsGoodDefaultLibraryTarget = true := rfl
example : elabMeetRejectsMissingDefaultLibraryTarget = true := rfl
example : elabMeetRejectsRequestOnlyAsDefault = true := rfl
example : elabMeetDrivesSourceDirectory = true := rfl
example : elabMeetAcceptsGoodSourceDirectory = true := rfl
example : elabMeetRejectsMissingSourceDirectory = true := rfl
example : elabMeetRejectsCwdOnlyAsSourceDirectory = true := rfl
example : elabMeetDrivesExecutableSourceDirectory = true := rfl
example : elabMeetAcceptsGoodExecutableImportSourceDirectory = true := rfl
example : elabMeetRejectsMissingExecutableImportSourceDirectory = true := rfl
example : elabMeetRejectsCwdOnlyAsExecutableImportSourceDirectory = true := rfl
example : elabMeetDrivesExecutableImportSourceDirectory = true := rfl
example : elabMeetDrivesExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetAcceptsGoodExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetRejectsMissingExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetRejectsCwdOnlyAsExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetRejectsOneLibAsExecutableMultiLibSourceDirectory = true := rfl
example : elabMeetDrivesExecutableTargetsSourceDirectory = true := rfl
example : elabMeetAcceptsGoodExecutableTargetsSourceDirectory = true := rfl
example : elabMeetRejectsMissingExecutableTargetsSourceDirectory = true := rfl
example : elabMeetRejectsCwdOnlyAsExecutableTargetsSourceDirectory = true := rfl
example : elabMeetRejectsOneExeAsExecutableTargetsSourceDirectory = true := rfl

end SystemsLean.ElabMeet
