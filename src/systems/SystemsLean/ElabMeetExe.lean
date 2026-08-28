/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet executable-target helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeetDesc stays under the line cap. Same
  namespace SystemsLean.ElabMeet. Parser plus compile plus the
  executable-target probe live here. Snippets stay in
  SystemsLean.ElabMeetProbe. Compile walk reuses
  tryCompileOnDiskModuleIO (no second elaborator).

  Spec (readable):
  - parseExecutableTarget requires one `lean_exe Name`.
    Name 113 richer text (`lean_lib` plus modules, no
    `lean_exe`) is none. Name 116 srcDir text is none.
  - tryCompileExecutable compiles the named executable
    module only, not a library. Fail-closed when the
    stanza is missing or the module is missing. Distinct
    from ElabMeetSrcMissing / ElabMeetDefMissing /
    ElabMeetLibMissing / ElabMeetRichMissing /
    ElabMeetDescMissing.
  - The executable-target drive is good && !bad &&
    libraryOnlyRejected. A library-only walk is not an
    executable accept.
  - parseExecutableImport requires one `lean_lib` plus
    one `lean_exe`. Name 117 exe-only text is none.
  - tryCompileExecutableImport compiles the library
    first, then the executable. Fail-closed when the
    library or the executable is missing. Distinct
    from ElabMeetExeMissing / ElabMeetSrcMissing /
    ElabMeetDefMissing / ElabMeetLibMissing /
    ElabMeetRichMissing / ElabMeetDescMissing.
  - The executable-import drive is good && !bad &&
    exeOnlyRejected. A Name 117 standalone `lean_exe`
    is not this accept.
  - parseExecutableMultiLib requires exactly two
    `lean_lib` plus one `lean_exe`. Name 118 one-library
    text is none. srcDir-bearing text is none (Name
    124). parseExecutableImport is none on
    two-library text.
  - tryCompileExecutableMultiLib compiles lib A, then
    lib B, then the executable. Fail-closed when a
    library or the executable is missing. Distinct
    from ElabMeetExeImpLibMissing / ElabMeetExeImpMissing
    / ElabMeetExeMissing.
  - The executable-multi-lib drive is good && !bad &&
    oneLibRejected. A Name 118 one-library walk is
    not this accept.
  - parseExecutableTargets requires exactly two
    `lean_exe`. Name 117 one-exe text is none.
    srcDir-bearing text is none (Name 125).
    parseExecutableTarget is none on two-exe text.
  - tryCompileExecutableTargets compiles exe A then
    exe B, or only a requested executable. Fail-closed
    when an executable is missing. Distinct from
    ElabMeetExeMissing / ElabMeetExeImpMissing /
    ElabMeetExeMultiLibAMissing.
  - The two-executable drive is good && !bad &&
    oneExeRejected. A Name 117 one-exe walk is
    not this accept.
  - parseDefaultExecutableTarget requires exactly two
    `lean_exe` plus one `default Name`. Name 120
    request text (no default line) is none.
    parseExecutableTargets is none on default-bearing
    text.
  - tryCompileDefaultExecutableTarget compiles only
    the default executable. Missing default
    fail-closes. Distinct from ElabMeetExeTwoMissing /
    ElabMeetExeMissing / ElabMeetDefMissing.
  - The default-executable drive is good && !bad &&
    requestOnlyRejected. A request-A-only Name 120
    walk is not a default accept.
  - parseExecutableSourceDirectory requires one
    `lean_exe` plus one `srcDir Dir`. Name 117
    cwd-only text is none. Name 116 library srcDir
    text is none. parseExecutableTarget is none on
    srcDir-bearing exe text.
  - tryCompileExecutableSourceDirectory compiles the
    named executable from that directory, not cwd.
    Missing directory fail-closes. Distinct from
    ElabMeetSrcMissing / ElabMeetExeMissing /
    ElabMeetDefExeMissing / ElabMeetDescMissing.
  - The executable source-directory drive is good &&
    !bad && cwdOnlyRejected. A cwd-only Name 117
    walk is not this accept.
  - parseExecutableImportSourceDirectory requires one
    `lean_lib` plus one `lean_exe` plus one `srcDir Dir`.
    Name 118 cwd-only text is none. Name 122 exe-only
    srcDir text is none. Helpers live in
    SystemsLean.ElabMeetImpSrc.
  - tryCompileExecutableImportSourceDirectory compiles
    the library first, then the executable, from that
    directory. Missing ElabMeetExeImpSrcMissing
    fail-closes. Distinct from ElabMeetExeSrcMissing /
    ElabMeetExeImpLibMissing / ElabMeetSrcMissing.
  - The executable-import source-directory drive is
    good && !bad && cwdOnlyRejected. A cwd-only Name
    118 walk is not this accept.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  parseExecutableTarget, tryCompileExecutable,
  tryCompileExecutableIO, tryCompileExecutableIOSafe,
  parseExecutableImport, tryCompileExecutableImport,
  tryCompileExecutableImportIO, tryCompileExecutableImportIOSafe,
  parseExecutableMultiLib, tryCompileExecutableMultiLib,
  tryCompileExecutableMultiLibIO, tryCompileExecutableMultiLibIOSafe,
  parseExecutableTargets, tryCompileExecutableTarget,
  tryCompileExecutableTargets,
  tryCompileExecutableTargetsIO, tryCompileExecutableTargetsIOSafe,
  parseDefaultExecutableTarget, tryCompileDefaultExecutableTarget,
  tryCompileDefaultExecutableTargetIO,
  tryCompileDefaultExecutableTargetIOSafe,
  parseExecutableSourceDirectory, tryCompileExecutableSourceDirectory,
  tryCompileExecutableSourceDirectoryIO,
  tryCompileExecutableSourceDirectoryIOSafe,
  parseExecutableImportSourceDirectory,
  tryCompileExecutableImportSourceDirectory,
  tryCompileExecutableImportSourceDirectoryIO,
  tryCompileExecutableImportSourceDirectoryIOSafe,
  elabMeetDrivesExecutableTarget,
  elabMeetAcceptsGoodExecutableTarget,
  elabMeetRejectsMissingExecutableTarget,
  elabMeetRejectsLibraryOnlyAsExecutable,
  elabMeetDrivesExecutableImport,
  elabMeetAcceptsGoodExecutableImport,
  elabMeetRejectsMissingExeImpLib,
  elabMeetRejectsMissingExeImp,
  elabMeetRejectsExeOnlyAsExecutableImport,
  elabMeetDrivesExecutableMultiLib,
  elabMeetAcceptsGoodExecutableMultiLib,
  elabMeetRejectsMissingExeMultiLib,
  elabMeetRejectsOneLibAsExecutableMultiLib,
  elabMeetDrivesExecutableTargets,
  elabMeetAcceptsGoodExecutableTargets,
  elabMeetRejectsMissingExeTwo,
  elabMeetRejectsOneExeAsExecutableTargets,
  ElabMeetExeMain, ElabMeetExeMissing, lean_exe,
  ElabMeetExeImpLib, ElabMeetExeImpMain,
  ElabMeetExeImpLibMissing, ElabMeetExeImpMissing,
  ElabMeetExeMultiLibA, ElabMeetExeMultiLibB,
  ElabMeetExeMultiMain, ElabMeetExeMultiLibAMissing,
  ElabMeetExeTwoA, ElabMeetExeTwoB, ElabMeetExeTwoMissing,
  elabMeetDrivesDefaultExecutableTarget,
  elabMeetAcceptsGoodDefaultExecutableTarget,
  elabMeetRejectsMissingDefaultExecutableTarget,
  elabMeetRejectsRequestOnlyAsDefaultExecutable,
  ElabMeetDefExeA, ElabMeetDefExeB, ElabMeetDefExeMissing,
  elabMeetDrivesExecutableSourceDirectory,
  elabMeetAcceptsGoodExecutableSourceDirectory,
  elabMeetRejectsMissingExecutableSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableSourceDirectory,
  ElabMeetExeSrcMain, ElabMeetExeSrcMissing, srcDir,
  elabMeetDrivesExecutableImportSourceDirectory,
  elabMeetAcceptsGoodExecutableImportSourceDirectory,
  elabMeetRejectsMissingExecutableImportSourceDirectory,
  elabMeetRejectsCwdOnlyAsExecutableImportSourceDirectory,
  ElabMeetExeImpSrcLib, ElabMeetExeImpSrcMain,
  ElabMeetExeImpSrcMissing,
  #elabMeetExecutableSourceDirectoryProbe,
  #elabMeetExecutableImportSourceDirectoryProbe,
  #elabMeetExecutableTargetProbe,
  #elabMeetExecutableImportProbe,
  #elabMeetExecutableMultiLibProbe,
  #elabMeetExecutableTargetsProbe,
  #elabMeetDefaultExecutableTargetProbe,
  ElabMeetExe, SystemsLean.ElabMeetExe,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetExe
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetExe; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe
import SystemsLean.ElabMeetDesc

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Collect one `lean_exe Name` and optional `module Name` lines.
    No `lean_exe` is none (Name 113/116 library-only text).
    Two `lean_exe` is none. Empty name is none.
    Greppable: parseExecutableTarget. -/
def parseExecutableTarget (text : String) :
    Option (Prod String (List String)) :=
  let rec go (lines : List String)
      (exe : Option String)
      (mods : List String)
      (seenExe : Bool) :
      Option (Prod String (List String)) :=
    match lines with
    | [] =>
      match exe with
      | some n =>
        let names := if mods.isEmpty then [n] else mods
        some (n, names)
      | none => none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe then
          none
        else
          go rest (some n) mods true
      else if t.startsWith "srcDir " then
        none
      else if t.startsWith "module " then
        let n := (t.dropPrefix "module ").trimAscii.copy
        if n.isEmpty then
          none
        else
          go rest exe (mods ++ [n]) seenExe
      else
        go rest exe mods seenExe
  go (text.splitOn "\n") none [] false

/-- Compile the named executable module only, not a library.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing module, type error, or
    missing `.olean`.
    Greppable: tryCompileExecutable. -/
unsafe def tryCompileExecutableIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (exeName, _) := parseExecutableTarget text | return false
  let names := [exeName]
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let mut allOk := true
    for n in names do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath dir modName "lean"
        if !(<- src.pathExists) then
          allOk := false
        else
          let compiled <- tryCompileOnDiskModuleIO src modName dir
          let olean := Lean.modToFilePath dir modName "olean"
          allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableIO]
opaque tryCompileExecutableIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the named executable module.
    Greppable: tryCompileExecutable. -/
def tryCompileExecutable
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableIOSafe descPath dir)
  catch _ =>
    pure false

/-
  Executable-target probe lives in SystemsLean.ElabMeetExeProbe
  so this file stays under the line cap.
  #elabMeetExecutableTargetProbe
-/

/-- Collect one `lean_lib Name` plus one `lean_exe Name`.
    Name 117 exe-only text (no `lean_lib`) is none.
    Name 113 richer text (no `lean_exe`) is none.
    Name 123 srcDir-bearing text is none.
    Two `lean_lib` or two `lean_exe` is none. Empty name is none.
    Greppable: parseExecutableImport. -/
def parseExecutableImport (text : String) :
    Option (Prod String String) :=
  let rec go (lines : List String)
      (lib : Option String)
      (exe : Option String)
      (seenLib : Bool)
      (seenExe : Bool) :
      Option (Prod String String) :=
    match lines with
    | [] =>
      match lib, exe with
      | some l, some e => some (l, e)
      | _, _ => none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
        if n.isEmpty || seenLib then
          none
        else
          go rest (some n) exe true seenExe
      else if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe then
          none
        else
          go rest lib (some n) seenLib true
      else if t.startsWith "srcDir " then
        none
      else
        go rest lib exe seenLib seenExe
  go (text.splitOn "\n") none none false false

/-- Compile the named library first, then the executable.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing library, missing
    executable, type error, or missing `.olean`.
    Greppable: tryCompileExecutableImport. -/
unsafe def tryCompileExecutableImportIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (libName, exeName) := parseExecutableImport text | return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let libMod := String.toName libName
    let exeMod := String.toName exeName
    let libSrc := Lean.modToFilePath dir libMod "lean"
    let exeSrc := Lean.modToFilePath dir exeMod "lean"
    if !(<- libSrc.pathExists) then
      pure false
    else if !(<- exeSrc.pathExists) then
      pure false
    else
      let libOk <- tryCompileOnDiskModuleIO libSrc libMod dir
      let libOlean := Lean.modToFilePath dir libMod "olean"
      if !(libOk && (<- libOlean.pathExists)) then
        pure false
      else
        let exeOk <- tryCompileOnDiskModuleIO exeSrc exeMod dir
        let exeOlean := Lean.modToFilePath dir exeMod "olean"
        pure (exeOk && (<- exeOlean.pathExists))
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableImportIO]
opaque tryCompileExecutableImportIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile library then executable.
    Greppable: tryCompileExecutableImport. -/
def tryCompileExecutableImport
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableImportIOSafe descPath dir)
  catch _ =>
    pure false

/-
  Executable-import probe lives in SystemsLean.ElabMeetExeProbe
  so this file stays under the line cap.
  #elabMeetExecutableImportProbe
-/

/-- Collect exactly two `lean_lib Name` plus one `lean_exe Name`.
    Name 118 one-library text (one `lean_lib`) is none.
    Name 117 exe-only text (no `lean_lib`) is none.
    Name 124 srcDir-bearing text is none.
    Three `lean_lib` or two `lean_exe` is none. Empty name is none.
    Greppable: parseExecutableMultiLib. -/
def parseExecutableMultiLib (text : String) :
    Option (Prod String (Prod String String)) :=
  let rec go (lines : List String)
      (libA : Option String)
      (libB : Option String)
      (exe : Option String)
      (seenLib : Nat)
      (seenExe : Bool) :
      Option (Prod String (Prod String String)) :=
    match lines with
    | [] =>
      match libA, libB, exe with
      | some a, some b, some e => some (a, b, e)
      | _, _, _ => none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
        if n.isEmpty || seenLib >= 2 then
          none
        else if seenLib == 0 then
          go rest (some n) libB exe 1 seenExe
        else
          go rest libA (some n) exe 2 seenExe
      else if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe then
          none
        else
          go rest libA libB (some n) seenLib true
      else if t.startsWith "srcDir " then
        none
      else
        go rest libA libB exe seenLib seenExe
  go (text.splitOn "\n") none none none 0 false

/-- Compile library A, then library B, then the executable.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing library, missing
    executable, type error, or missing `.olean`.
    Greppable: tryCompileExecutableMultiLib. -/
unsafe def tryCompileExecutableMultiLibIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (libAName, libBName, exeName) :=
    parseExecutableMultiLib text | return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let libAMod := String.toName libAName
    let libBMod := String.toName libBName
    let exeMod := String.toName exeName
    let libASrc := Lean.modToFilePath dir libAMod "lean"
    let libBSrc := Lean.modToFilePath dir libBMod "lean"
    let exeSrc := Lean.modToFilePath dir exeMod "lean"
    if !(<- libASrc.pathExists) then
      pure false
    else if !(<- libBSrc.pathExists) then
      pure false
    else if !(<- exeSrc.pathExists) then
      pure false
    else
      let libAOk <- tryCompileOnDiskModuleIO libASrc libAMod dir
      let libAOlean := Lean.modToFilePath dir libAMod "olean"
      if !(libAOk && (<- libAOlean.pathExists)) then
        pure false
      else
        let libBOk <- tryCompileOnDiskModuleIO libBSrc libBMod dir
        let libBOlean := Lean.modToFilePath dir libBMod "olean"
        if !(libBOk && (<- libBOlean.pathExists)) then
          pure false
        else
          let exeOk <- tryCompileOnDiskModuleIO exeSrc exeMod dir
          let exeOlean := Lean.modToFilePath dir exeMod "olean"
          pure (exeOk && (<- exeOlean.pathExists))
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableMultiLibIO]
opaque tryCompileExecutableMultiLibIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile two libraries then executable.
    Greppable: tryCompileExecutableMultiLib. -/
def tryCompileExecutableMultiLib
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableMultiLibIOSafe descPath dir)
  catch _ =>
    pure false

/-
  Executable-multi-lib probe lives in SystemsLean.ElabMeetExeProbe
  so this file stays under the line cap.
  #elabMeetExecutableMultiLibProbe
-/

/-- Collect exactly two `lean_exe Name` stanzas. Each may list
    `module` lines; empty modules means the stanza name is the
    module. One `lean_exe` is none (Name 117). Three or more
    is none. A `default` line is none (that is the default-exe
    parse). srcDir-bearing text is none (Name 125).
    Empty name is none.
    Greppable: parseExecutableTargets. -/
def parseExecutableTargets (text : String) :
    Option (List (Prod String (List String))) :=
  let rec go (lines : List String)
      (acc : List (Prod String (List String)))
      (cur : Option (Prod String (List String))) :
      Option (List (Prod String (List String))) :=
    match lines with
    | [] =>
      let acc :=
        match cur with
        | none => acc
        | some p => acc ++ [p]
      if acc.length == 2 then some acc else none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty then
          none
        else
          let acc :=
            match cur with
            | none => acc
            | some p => acc ++ [p]
          go rest acc (some (n, []))
      else if t.startsWith "module " then
        let n := (t.dropPrefix "module ").trimAscii.copy
        if n.isEmpty then
          none
        else
          match cur with
          | none => none
          | some (exe, mods) =>
            go rest acc (some (exe, mods ++ [n]))
      else if t == "default" || t.startsWith "default " then
        none
      else if t.startsWith "srcDir " then
        none
      else
        go rest acc cur
  go (text.splitOn "\n") [] none

/-- Choose modules for a request. none or `both` means both
    executables in order. A named request must match a stanza. -/
def selectExecutableTargets
    (targets : List (Prod String (List String)))
    (request : Option String) : Option (List String) :=
  selectNamedLibraryModules targets request

/-- Compile one requested executable target, or both in order
    when the request is none or `both`. Reuses
    `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing request, missing module,
    type error, or missing `.olean`.
    Greppable: tryCompileExecutableTargets. -/
unsafe def tryCompileExecutableTargetsIO
    (descPath dir : System.FilePath) (request : Option String) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some targets := parseExecutableTargets text | return false
  let some names := selectExecutableTargets targets request | return false
  if names.isEmpty then
    return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let mut allOk := true
    for n in names do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath dir modName "lean"
        if !(<- src.pathExists) then
          allOk := false
        else
          let compiled <- tryCompileOnDiskModuleIO src modName dir
          let olean := Lean.modToFilePath dir modName "olean"
          allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableTargetsIO]
opaque tryCompileExecutableTargetsIOSafe
    (descPath dir : System.FilePath) (request : Option String) : IO Bool

/-- CommandElab wrapper: compile the requested executable.
    Greppable: tryCompileExecutableTarget. -/
def tryCompileExecutableTarget
    (descPath dir : System.FilePath) (request : Option String) :
    CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableTargetsIOSafe descPath dir request)
  catch _ =>
    pure false

/-- Compile both executable targets in listed order.
    Greppable: tryCompileExecutableTargets. -/
def tryCompileExecutableTargets
    (descPath dir : System.FilePath) : CommandElabM Bool :=
  tryCompileExecutableTarget descPath dir none

/-
  Two-executable probe lives in SystemsLean.ElabMeetExeProbe
  so this file stays under the line cap.
  #elabMeetExecutableTargetsProbe
-/

/-- Collect exactly two `lean_exe Name` stanzas plus one
    `default Name`. No default line is none (Name 120). Two
    default lines are none. One `lean_exe` is none.
    Greppable: parseDefaultExecutableTarget. -/
def parseDefaultExecutableTarget (text : String) :
    Option (Prod (List (Prod String (List String))) String) :=
  let rec go (lines : List String)
      (acc : List (Prod String (List String)))
      (cur : Option (Prod String (List String)))
      (defName : Option String) :
      Option (Prod (List (Prod String (List String))) String) :=
    match lines with
    | [] =>
      let acc :=
        match cur with
        | none => acc
        | some p => acc ++ [p]
      match defName with
      | none => none
      | some d =>
        if acc.length == 2 then some (acc, d) else none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty then
          none
        else
          let acc :=
            match cur with
            | none => acc
            | some p => acc ++ [p]
          go rest acc (some (n, [])) defName
      else if t.startsWith "module " then
        let n := (t.dropPrefix "module ").trimAscii.copy
        if n.isEmpty then
          none
        else
          match cur with
          | none => none
          | some (exe, mods) =>
            go rest acc (some (exe, mods ++ [n])) defName
      else if t == "default" then
        none
      else if t.startsWith "default " then
        let n := (t.dropPrefix "default ").trimAscii.copy
        if n.isEmpty then
          none
        else
          match defName with
          | some _ => none
          | none => go rest acc cur (some n)
      else
        go rest acc cur defName
  go (text.splitOn "\n") [] none none

/-- Compile only the default executable named by `default`.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, default not among stanzas,
    missing module, type error, or missing `.olean`.
    Greppable: tryCompileDefaultExecutableTarget. -/
unsafe def tryCompileDefaultExecutableTargetIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (targets, defName) := parseDefaultExecutableTarget text | return false
  let some names := selectExecutableTargets targets (some defName)
    | return false
  if names.isEmpty then
    return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let mut allOk := true
    for n in names do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath dir modName "lean"
        if !(<- src.pathExists) then
          allOk := false
        else
          let compiled <- tryCompileOnDiskModuleIO src modName dir
          let olean := Lean.modToFilePath dir modName "olean"
          allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompileDefaultExecutableTargetIO]
opaque tryCompileDefaultExecutableTargetIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the default executable target.
    Greppable: tryCompileDefaultExecutableTarget. -/
def tryCompileDefaultExecutableTarget
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileDefaultExecutableTargetIOSafe descPath dir)
  catch _ =>
    pure false

/-- Collect one `lean_exe Name`, one `srcDir Dir`, and optional
    `module Name` lines. No `srcDir` is none (Name 117).
    Name 116 library srcDir text (no `lean_exe`) is none.
    Two `lean_exe` is none. A `lean_lib` or `default` line
    is none. Empty, `.`, `..`, or a slash in the directory
    name is none.
    Greppable: parseExecutableSourceDirectory. -/
def parseExecutableSourceDirectory (text : String) :
    Option (Prod String (Prod String (List String))) :=
  let rec go (lines : List String)
      (srcDir : Option String)
      (exe : Option String)
      (mods : List String)
      (seenExe : Bool) :
      Option (Prod String (Prod String (List String))) :=
    match lines with
    | [] =>
      match srcDir, exe with
      | some d, some n =>
        let names := if mods.isEmpty then [n] else mods
        some (d, (n, names))
      | _, _ => none
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "srcDir " then
        let n := (t.dropPrefix "srcDir ").trimAscii.copy
        if n.isEmpty || n == "." || n == ".." || n.contains '/' then
          none
        else
          match srcDir with
          | some _ => none
          | none => go rest (some n) exe mods seenExe
      else if t.startsWith "lean_exe " then
        let n := (t.dropPrefix "lean_exe ").trimAscii.copy
        if n.isEmpty || seenExe then
          none
        else
          go rest srcDir (some n) mods true
      else if t.startsWith "module " then
        let n := (t.dropPrefix "module ").trimAscii.copy
        if n.isEmpty then
          none
        else
          go rest srcDir exe (mods ++ [n]) seenExe
      else if t.startsWith "lean_lib " then
        none
      else if t == "default" || t.startsWith "default " then
        none
      else
        go rest srcDir exe mods seenExe
  go (text.splitOn "\n") none none [] false

/-- Compile the named executable from the listed source
    directory. Reuses `tryCompileOnDiskModuleIO` (no second
    elaborator). Fail-closed on parse none, missing
    directory, module only at cwd, type error, or missing
    `.olean`.
    Greppable: tryCompileExecutableSourceDirectory. -/
unsafe def tryCompileExecutableSourceDirectoryIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (srcDirName, p) := parseExecutableSourceDirectory text
    | return false
  let exeTarget := p.fst
  let names := p.snd
  if names.isEmpty then
    return false
  let srcRoot := dir / srcDirName
  if !(<- srcRoot.pathExists) then
    return false
  if !(<- srcRoot.isDir) then
    return false
  let exeSrc := Lean.modToFilePath srcRoot (String.toName exeTarget) "lean"
  if !(<- exeSrc.pathExists) then
    return false
  let prev <- searchPathRef.get
  searchPathRef.set (srcRoot :: prev)
  try
    let mut allOk := true
    for n in names do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath srcRoot modName "lean"
        if !(<- src.pathExists) then
          allOk := false
        else
          let compiled <- tryCompileOnDiskModuleIO src modName srcRoot
          let olean := Lean.modToFilePath srcRoot modName "olean"
          allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompileExecutableSourceDirectoryIO]
opaque tryCompileExecutableSourceDirectoryIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile an executable from srcDir.
    Greppable: tryCompileExecutableSourceDirectory. -/
def tryCompileExecutableSourceDirectory
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileExecutableSourceDirectoryIOSafe descPath dir)
  catch _ =>
    pure false

end SystemsLean.ElabMeet
