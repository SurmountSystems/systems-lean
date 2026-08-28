/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet executable-import from
  a listed source directory.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeetExe stays under the line cap. Same
  namespace SystemsLean.ElabMeet. Parser plus compile live here.
  Probe lives in SystemsLean.ElabMeetExeProbe. Snippets stay in
  SystemsLean.ElabMeetProbe. Compile walk reuses
  tryCompileOnDiskModuleIO (no second elaborator).

  Spec (readable):
  - parseExecutableImportSourceDirectory requires one
    `lean_lib`, one `lean_exe`, and one `srcDir Dir`.
    Name 118 cwd-only import text (no `srcDir`) is none.
    Name 122 exe-only srcDir text (no `lean_lib`) is none.
    parseExecutableImport is none on srcDir-bearing text.
    parseExecutableSourceDirectory is none on lib+exe+srcDir
    text. parseSourceDirectory is none on this text.
  - tryCompileExecutableImportSourceDirectory compiles the
    library first, then the executable, both from that
    directory, not cwd. Missing directory fail-closes.
    Distinct from ElabMeetExeSrcMissing /
    ElabMeetExeImpLibMissing / ElabMeetSrcMissing.
  - The drive is good && !bad && cwdOnlyRejected. A cwd-only
    Name 118 walk is not this accept.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  parseExecutableImportSourceDirectory,
  tryCompileExecutableImportSourceDirectory,
  tryCompileExecutableImportSourceDirectoryIO,
  tryCompileExecutableImportSourceDirectoryIOSafe,
  ElabMeetExeImpSrcLib, ElabMeetExeImpSrcMain,
  ElabMeetExeImpSrcMissing, srcDir,
  ElabMeetImpSrc, SystemsLean.ElabMeetImpSrc,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetImpSrc
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetImpSrc; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Collect one `lean_lib Name`, one `lean_exe Name`, one
    `srcDir Dir`, and optional `module Name` lines.
    No `srcDir` is none (Name 118). No `lean_lib` is none
    (Name 122). No `lean_exe` is none. Two of any stanza
    is none. Empty, `.`, `..`, or a slash in the directory
    name is none.
    Greppable: parseExecutableImportSourceDirectory. -/
def parseExecutableImportSourceDirectory (text : String) :
    Option (Prod String (Prod String (Prod String (List String)))) :=
  let rec go (lines : List String)
      (srcDir : Option String)
      (lib : Option String)
      (exe : Option String)
      (mods : List String)
      (seenLib : Bool)
      (seenExe : Bool) :
      Option (Prod String (Prod String (Prod String (List String)))) :=
    match lines with
    | [] =>
      match srcDir, lib, exe with
      | some d, some l, some e =>
        let names := if mods.isEmpty then [l, e] else mods
        some (d, (l, (e, names)))
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
          | none => go rest (some n) lib exe mods seenLib seenExe
      else if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
        if n.isEmpty || seenLib then
          none
        else
          go rest srcDir (some n) exe mods true seenExe
      else if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe then
          none
        else
          go rest srcDir lib (some n) mods seenLib true
      else if t.startsWith "module " then
        let n := (t.dropPrefix "module ").trimAscii.copy
        if n.isEmpty then
          none
        else
          go rest srcDir lib exe (mods ++ [n]) seenLib seenExe
      else if t == "default" || t.startsWith "default " then
        none
      else
        go rest srcDir lib exe mods seenLib seenExe
  go (text.splitOn "\n") none none none [] false false

/-- Compile the named library first, then the executable,
    both from the listed source directory. Reuses
    `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing directory, module
    only at cwd, type error, or missing `.olean`.
    Greppable: tryCompileExecutableImportSourceDirectory. -/
unsafe def tryCompileExecutableImportSourceDirectoryIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (srcDirName, p) := parseExecutableImportSourceDirectory text
    | return false
  let libName := p.fst
  let exeName := p.snd.fst
  let srcRoot := dir / srcDirName
  if !(<- srcRoot.pathExists) then
    return false
  if !(<- srcRoot.isDir) then
    return false
  let libSrc := Lean.modToFilePath srcRoot (String.toName libName) "lean"
  let exeSrc := Lean.modToFilePath srcRoot (String.toName exeName) "lean"
  if !(<- libSrc.pathExists) then
    return false
  if !(<- exeSrc.pathExists) then
    return false
  let prev <- searchPathRef.get
  searchPathRef.set (srcRoot :: prev)
  try
    let libMod := String.toName libName
    let exeMod := String.toName exeName
    let libOk <- tryCompileOnDiskModuleIO libSrc libMod srcRoot
    let libOlean := Lean.modToFilePath srcRoot libMod "olean"
    if !(libOk && (<- libOlean.pathExists)) then
      pure false
    else
      let exeOk <- tryCompileOnDiskModuleIO exeSrc exeMod srcRoot
      let exeOlean := Lean.modToFilePath srcRoot exeMod "olean"
      pure (exeOk && (<- exeOlean.pathExists))
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableImportSourceDirectoryIO]
opaque tryCompileExecutableImportSourceDirectoryIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile library then executable from srcDir.
    Greppable: tryCompileExecutableImportSourceDirectory. -/
def tryCompileExecutableImportSourceDirectory
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableImportSourceDirectoryIOSafe descPath dir)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
