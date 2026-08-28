/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet richer package-description helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  New companion so ElabMeetCompile stays under the line cap. Same
  namespace SystemsLean.ElabMeet. Parser plus compile plus the
  richer-description probe live here. Snippets stay in
  SystemsLean.ElabMeetProbe. Compile walk reuses
  tryCompilePackageDesc (no second elaborator).

  Spec (readable):
  - parseRicherPackageDesc requires a `lean_lib Name` stanza plus
    `module Name` lines. A description that is only `module Name`
    lines is none (not a richer-description accept).
  - tryCompileRicherPackageDesc compiles the named modules under
    that library target. Fail-closed when the stanza is missing,
    the library target has no matching on-disk module, or a
    listed module is missing. Distinct from ElabMeetDescMissing.
  - The richer-description drive is good && !bad &&
    moduleOnlyRejected. Module-only text with both sources on
    disk is not a richer accept.
  - parseNamedLibraryTargets requires exactly two `lean_lib`
    stanzas. One `lean_lib` (Name 113 richer text) is none.
  - tryCompileNamedLibraryTarget compiles the requested
    target. none or "both" compiles both in order.
    Missing second target fail-closes. Distinct from
    ElabMeetRichMissing and ElabMeetDescMissing.
  - The two-target drive is good && !bad &&
    singleLibRejected. A one-library richer description is
    not a two-target accept.
  - parseDefaultLibraryTarget requires exactly two
    `lean_lib` plus one `default Name`. Name 114 request
    text (no default line) is none. parseNamedLibraryTargets
    is none on default-bearing text.
  - tryCompileDefaultLibraryTarget compiles only the
    default library. Missing default fail-closes. Distinct
    from ElabMeetLibMissing / ElabMeetRichMissing /
    ElabMeetDescMissing.
  - The default-target drive is good && !bad &&
    requestOnlyRejected. A request-A-only Name 114 walk
    is not a default accept.
  - parseSourceDirectory requires one `srcDir Dir` plus
    one `lean_lib`. No srcDir line is none (Name 103/113).
  - tryCompileSourceDirectory compiles listed modules
    from that directory, not the description cwd.
    Missing directory fail-closes. Distinct from
    ElabMeetDefMissing / ElabMeetLibMissing /
    ElabMeetRichMissing / ElabMeetDescMissing.
  - The source-directory drive is good && !bad &&
    cwdOnlyRejected. A cwd-only Name 113 compile is
    not a source-directory accept.
  - Compile-order probe lives here so ElabMeet stays under
    the line cap. Same tryCompilePackageDescOrdered walk.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  parseRicherPackageDesc, tryCompileRicherPackageDesc,
  tryCompileRicherPackageDescIO, tryCompileRicherPackageDescIOSafe,
  elabMeetDrivesRicherPackageDesc,
  elabMeetAcceptsGoodRicherPackageDesc,
  elabMeetRejectsBadRicherPackageDesc,
  elabMeetRejectsModuleOnlyRicherPackageDesc,
  ElabMeetRichMissing, ElabMeetRichLib, ElabMeetRichImp,
  moduleOnlyRicherPackageDescText,
  #elabMeetRicherPackageDescProbe,
  parseNamedLibraryTargets, tryCompileNamedLibraryTarget,
  tryCompileNamedLibraryTargets,
  elabMeetDrivesNamedLibraryTargets,
  elabMeetAcceptsGoodNamedLibraryTargets,
  elabMeetRejectsMissingNamedLibraryTarget,
  elabMeetRejectsSingleLibAsNamedTargets,
  ElabMeetLibA, ElabMeetLibB, ElabMeetLibMissing,
  #elabMeetNamedLibraryTargetsProbe,
  parseDefaultLibraryTarget, tryCompileDefaultLibraryTarget,
  elabMeetDrivesDefaultLibraryTarget,
  elabMeetAcceptsGoodDefaultLibraryTarget,
  elabMeetRejectsMissingDefaultLibraryTarget,
  elabMeetRejectsRequestOnlyAsDefault,
  ElabMeetDefLibA, ElabMeetDefLibB, ElabMeetDefMissing,
  #elabMeetDefaultLibraryTargetProbe,
  parseSourceDirectory, tryCompileSourceDirectory,
  elabMeetDrivesSourceDirectory,
  elabMeetAcceptsGoodSourceDirectory,
  elabMeetRejectsMissingSourceDirectory,
  elabMeetRejectsCwdOnlyAsSourceDirectory,
  ElabMeetSrcLib, ElabMeetSrcMissing, srcDir,
  #elabMeetSourceDirectoryProbe,
  #elabMeetCompileOrderProbe,
  ElabMeetDesc, SystemsLean.ElabMeetDesc,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetDesc
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetDesc; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Collect a required `lean_lib Name` plus `module Name` lines.
    Empty lines and other text are ignored. A description that is
    only `module Name` lines is none. Two `lean_lib` lines are none.
    Greppable: parseRicherPackageDesc. -/
def parseRicherPackageDesc (text : String) : Option (Prod String (List String)) :=
  let rec go (lines : List String) (lib : Option String) (mods : List String)
      (seenLib : Bool) : Option (Prod String (List String)) :=
    match lines with
    | [] =>
      match lib with
      | none => none
      | some n => if mods.isEmpty then none else some (n, mods)
    | line :: rest =>
      let t := line.trimAscii
      if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
        if n.isEmpty || seenLib then
          none
        else
          go rest (some n) mods true
      else if t.startsWith "module " then
        let n := (t.dropPrefix "module ").trimAscii.copy
        if n.isEmpty then
          none
        else
          go rest lib (mods ++ [n]) seenLib
      else
        go rest lib mods seenLib
  go (text.splitOn "\n") none [] false

/-- Walk a richer package description: require a library-target
    stanza, require that target and each listed module exist on
    disk, then reuse `tryCompilePackageDescIO` (no second
    elaborator). Fail-closed on missing stanza, missing target,
    missing listed module, type error, or missing `.olean`.
    Greppable: tryCompileRicherPackageDesc. -/
unsafe def tryCompileRicherPackageDescIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (libTarget, names) := parseRicherPackageDesc text | return false
  let libSrc := Lean.modToFilePath dir (String.toName libTarget) "lean"
  if !(<- libSrc.pathExists) then
    return false
  let mut listedOk := true
  for n in names do
    if listedOk then
      let src := Lean.modToFilePath dir (String.toName n) "lean"
      listedOk := (<- src.pathExists)
  if !listedOk then
    return false
  tryCompilePackageDescIO descPath dir

@[implemented_by tryCompileRicherPackageDescIO]
opaque tryCompileRicherPackageDescIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: read a richer description and compile.
    Greppable: tryCompileRicherPackageDesc. -/
def tryCompileRicherPackageDesc
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileRicherPackageDescIOSafe descPath dir)
  catch _ =>
    pure false

/-- Record accept / reject for a richer library-target stanza.
    Accept writes `lean_lib ElabMeetRichLib` plus both modules
    (library defines `richLib`; importer uses it). Reject names
    `lean_lib ElabMeetRichMissing` with no matching on-disk
    module. Module-only text names the same richer modules with
    both sources on disk (Name 103 would accept). That parse is
    none and that compile is false. Drive is
    good && !bad && moduleOnlyRejected. -/
elab "#elabMeetRicherPackageDescProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirMod <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirGood `ElabMeetRichLib "lean"
    let impPath := Lean.modToFilePath dirGood `ElabMeetRichImp "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile libPath richLibSnippet)
    liftIO (IO.FS.writeFile impPath goodRichImporterSnippet)
    liftIO (IO.FS.writeFile descPath goodRicherPackageDescText)
  let writeBad : CommandElabM Unit := do
    let impPath := Lean.modToFilePath dirBad `ElabMeetRichImp "lean"
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile impPath goodRichImporterSnippet)
    liftIO (IO.FS.writeFile descPath badRicherPackageDescText)
  let writeMod : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirMod `ElabMeetRichLib "lean"
    let impPath := Lean.modToFilePath dirMod `ElabMeetRichImp "lean"
    let descPath := dirMod / "package.txt"
    liftIO (IO.FS.writeFile libPath richLibSnippet)
    liftIO (IO.FS.writeFile impPath goodRichImporterSnippet)
    liftIO (IO.FS.writeFile descPath moduleOnlyRicherPackageDescText)
  writeGood
  writeBad
  writeMod
  let good <-
    tryCompileRicherPackageDesc (dirGood / "package.txt") dirGood
  let bad <-
    tryCompileRicherPackageDesc (dirBad / "package.txt") dirBad
  let parseNone :=
    match parseRicherPackageDesc moduleOnlyRicherPackageDescText with
    | none => true
    | some _ => false
  let richerCompile <-
    tryCompileRicherPackageDesc (dirMod / "package.txt") dirMod
  let moduleOnlyRejected := parseNone && !richerCompile
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirMod)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let mStx <- if moduleOnlyRejected then `(true) else `(false)
  let dStx <- if good && !bad && moduleOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodRicherPackageDesc
  let rN := mkIdent `elabMeetRejectsBadRicherPackageDesc
  let mN := mkIdent `elabMeetRejectsModuleOnlyRicherPackageDesc
  let dN := mkIdent `elabMeetDrivesRicherPackageDesc
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $mN : Bool := $mStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetRicherPackageDescProbe

/-- Modules for one named library: listed `module` lines, or the
    stanza name when the list is empty. -/
def namedTargetModules (p : Prod String (List String)) : List String :=
  if p.snd.isEmpty then [p.fst] else p.snd

/-- Collect exactly two `lean_lib Name` stanzas. Each may list
    `module` lines; empty modules means the stanza name is the
    module. One `lean_lib` is none. Three or more is none.
    A `default` line is none (that is the default-target parse).
    Greppable: parseNamedLibraryTargets. -/
def parseNamedLibraryTargets (text : String) :
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
      if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
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
          | some (lib, mods) =>
            go rest acc (some (lib, mods ++ [n]))
      else if t == "default" || t.startsWith "default " then
        none
      else
        go rest acc cur
  go (text.splitOn "\n") [] none

/-- Choose modules for a request. none or `both` means both
    libraries in order. A named request must match a stanza. -/
def selectNamedLibraryModules
    (targets : List (Prod String (List String)))
    (request : Option String) : Option (List String) :=
  let rec collect (ts : List (Prod String (List String)))
      (acc : List String) : List String :=
    match ts with
    | [] => acc
    | p :: rest => collect rest (acc ++ namedTargetModules p)
  match request with
  | none => some (collect targets [])
  | some r =>
    if r == "both" then
      some (collect targets [])
    else
      match targets.find? (fun p => p.fst == r) with
      | some p => some (namedTargetModules p)
      | none => none

/-- Compile one requested library target, or both in order when
    the request is none or `both`. Reuses
    `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing request, missing module,
    type error, or missing `.olean`.
    Greppable: tryCompileNamedLibraryTarget. -/
unsafe def tryCompileNamedLibraryTargetIO
    (descPath dir : System.FilePath) (request : Option String) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some targets := parseNamedLibraryTargets text | return false
  let some names := selectNamedLibraryModules targets request | return false
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

@[implemented_by tryCompileNamedLibraryTargetIO]
opaque tryCompileNamedLibraryTargetIOSafe
    (descPath dir : System.FilePath) (request : Option String) : IO Bool

/-- CommandElab wrapper: compile the requested named target.
    Greppable: tryCompileNamedLibraryTarget. -/
def tryCompileNamedLibraryTarget
    (descPath dir : System.FilePath) (request : Option String) :
    CommandElabM Bool := do
  try
    liftIO (tryCompileNamedLibraryTargetIOSafe descPath dir request)
  catch _ =>
    pure false

/-- Compile both named library targets in listed order.
    Greppable: tryCompileNamedLibraryTargets. -/
def tryCompileNamedLibraryTargets
    (descPath dir : System.FilePath) : CommandElabM Bool :=
  tryCompileNamedLibraryTarget descPath dir none

/-- Record accept / reject for two named library targets.
    Accept writes `lean_lib ElabMeetLibA` plus `lean_lib
    ElabMeetLibB` with both sources on disk: request A compiles
    only A, request B compiles only B, omitted request compiles
    both in order. Reject names `lean_lib ElabMeetLibMissing`
    with no matching on-disk module. A Name 113 one-library
    richer description is parse none and compile false. Drive
    is good && !bad && singleLibRejected. -/
elab "#elabMeetNamedLibraryTargetsProbe" : command => do
  let dirA <- liftIO IO.FS.createTempDir
  let dirB <- liftIO IO.FS.createTempDir
  let dirBoth <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirSingle <- liftIO IO.FS.createTempDir
  let writePair (dir : System.FilePath) : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dir `ElabMeetLibA "lean"
    let bPath := Lean.modToFilePath dir `ElabMeetLibB "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile aPath libASnippet)
    liftIO (IO.FS.writeFile bPath libBSnippet)
    liftIO (IO.FS.writeFile descPath goodNamedLibraryTargetsText)
  let writeBad : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dirBad `ElabMeetLibA "lean"
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile aPath libASnippet)
    liftIO (IO.FS.writeFile descPath badNamedLibraryTargetsText)
  let writeSingle : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirSingle `ElabMeetRichLib "lean"
    let impPath := Lean.modToFilePath dirSingle `ElabMeetRichImp "lean"
    let descPath := dirSingle / "package.txt"
    liftIO (IO.FS.writeFile libPath richLibSnippet)
    liftIO (IO.FS.writeFile impPath goodRichImporterSnippet)
    liftIO (IO.FS.writeFile descPath goodRicherPackageDescText)
  writePair dirA
  writePair dirB
  writePair dirBoth
  writeBad
  writeSingle
  let reqA <-
    tryCompileNamedLibraryTarget (dirA / "package.txt") dirA (some "ElabMeetLibA")
  let aOleanA := Lean.modToFilePath dirA `ElabMeetLibA "olean"
  let aOleanB := Lean.modToFilePath dirA `ElabMeetLibB "olean"
  let aExists <- liftIO aOleanA.pathExists
  let bAfterA <- liftIO aOleanB.pathExists
  let onlyA := reqA && aExists && !bAfterA
  let reqB <-
    tryCompileNamedLibraryTarget (dirB / "package.txt") dirB (some "ElabMeetLibB")
  let bOleanA := Lean.modToFilePath dirB `ElabMeetLibA "olean"
  let bOleanB := Lean.modToFilePath dirB `ElabMeetLibB "olean"
  let bExists <- liftIO bOleanB.pathExists
  let aAfterB <- liftIO bOleanA.pathExists
  let onlyB := reqB && bExists && !aAfterB
  let both <-
    tryCompileNamedLibraryTargets (dirBoth / "package.txt") dirBoth
  let bothA := Lean.modToFilePath dirBoth `ElabMeetLibA "olean"
  let bothB := Lean.modToFilePath dirBoth `ElabMeetLibB "olean"
  let bothAOk <- liftIO bothA.pathExists
  let bothBOk <- liftIO bothB.pathExists
  let bothOk := both && bothAOk && bothBOk
  let good := onlyA && onlyB && bothOk
  let miss <-
    tryCompileNamedLibraryTarget
      (dirBad / "package.txt") dirBad (some "ElabMeetLibMissing")
  let missBoth <-
    tryCompileNamedLibraryTargets (dirBad / "package.txt") dirBad
  let bad := miss || missBoth
  let parseNone :=
    match parseNamedLibraryTargets goodRicherPackageDescText with
    | none => true
    | some _ => false
  let singleCompile <-
    tryCompileNamedLibraryTargets (dirSingle / "package.txt") dirSingle
  let singleLibRejected := parseNone && !singleCompile
  try
    liftIO (IO.FS.removeDirAll dirA)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirB)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBoth)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirSingle)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let sStx <- if singleLibRejected then `(true) else `(false)
  let dStx <- if good && !bad && singleLibRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodNamedLibraryTargets
  let rN := mkIdent `elabMeetRejectsMissingNamedLibraryTarget
  let sN := mkIdent `elabMeetRejectsSingleLibAsNamedTargets
  let dN := mkIdent `elabMeetDrivesNamedLibraryTargets
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $sN : Bool := $sStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetNamedLibraryTargetsProbe

/-- Collect exactly two `lean_lib Name` stanzas plus one
    `default Name`. No default line is none (Name 114). Two
    default lines are none. One `lean_lib` is none.
    Greppable: parseDefaultLibraryTarget. -/
def parseDefaultLibraryTarget (text : String) :
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
      if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
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
          | some (lib, mods) =>
            go rest acc (some (lib, mods ++ [n])) defName
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

/-- Compile only the default library named by `default`.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, default not among stanzas,
    missing module, type error, or missing `.olean`.
    Greppable: tryCompileDefaultLibraryTarget. -/
unsafe def tryCompileDefaultLibraryTargetIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (targets, defName) := parseDefaultLibraryTarget text | return false
  let some names := selectNamedLibraryModules targets (some defName)
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

@[implemented_by tryCompileDefaultLibraryTargetIO]
opaque tryCompileDefaultLibraryTargetIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile the default library target.
    Greppable: tryCompileDefaultLibraryTarget. -/
def tryCompileDefaultLibraryTarget
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileDefaultLibraryTargetIOSafe descPath dir)
  catch _ =>
    pure false

/-- Record accept / reject for a default library target.
    Accept writes `lean_lib ElabMeetDefLibA` plus `lean_lib
    ElabMeetDefLibB` plus `default ElabMeetDefLibA`: compile
    writes only A `.olean`. Reject names `default
    ElabMeetDefMissing`. A Name 114 request-A-only walk
    (two `lean_lib`, no default line) compiles A and is
    not a default accept. Drive is good && !bad &&
    requestOnlyRejected. -/
elab "#elabMeetDefaultLibraryTargetProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirReq <- liftIO IO.FS.createTempDir
  let writeDef (dir : System.FilePath) (desc : String) : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dir `ElabMeetDefLibA "lean"
    let bPath := Lean.modToFilePath dir `ElabMeetDefLibB "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile aPath defLibASnippet)
    liftIO (IO.FS.writeFile bPath defLibBSnippet)
    liftIO (IO.FS.writeFile descPath desc)
  let writeReq : CommandElabM Unit := do
    let aPath := Lean.modToFilePath dirReq `ElabMeetLibA "lean"
    let bPath := Lean.modToFilePath dirReq `ElabMeetLibB "lean"
    let descPath := dirReq / "package.txt"
    liftIO (IO.FS.writeFile aPath libASnippet)
    liftIO (IO.FS.writeFile bPath libBSnippet)
    liftIO (IO.FS.writeFile descPath goodNamedLibraryTargetsText)
  writeDef dirGood goodDefaultLibraryTargetText
  writeDef dirBad badDefaultLibraryTargetText
  writeReq
  let defOk <-
    tryCompileDefaultLibraryTarget (dirGood / "package.txt") dirGood
  let aOlean := Lean.modToFilePath dirGood `ElabMeetDefLibA "olean"
  let bOlean := Lean.modToFilePath dirGood `ElabMeetDefLibB "olean"
  let aExists <- liftIO aOlean.pathExists
  let bExists <- liftIO bOlean.pathExists
  let namedParseNone :=
    match parseNamedLibraryTargets goodDefaultLibraryTargetText with
    | none => true
    | some _ => false
  let good := defOk && aExists && !bExists && namedParseNone
  let miss <-
    tryCompileDefaultLibraryTarget (dirBad / "package.txt") dirBad
  let bad := miss
  let reqA <-
    tryCompileNamedLibraryTarget
      (dirReq / "package.txt") dirReq (some "ElabMeetLibA")
  let reqAOlean := Lean.modToFilePath dirReq `ElabMeetLibA "olean"
  let reqBOlean := Lean.modToFilePath dirReq `ElabMeetLibB "olean"
  let reqAExists <- liftIO reqAOlean.pathExists
  let reqBExists <- liftIO reqBOlean.pathExists
  let onlyA := reqA && reqAExists && !reqBExists
  let defOnReq <-
    tryCompileDefaultLibraryTarget (dirReq / "package.txt") dirReq
  let parseNone :=
    match parseDefaultLibraryTarget goodNamedLibraryTargetsText with
    | none => true
    | some _ => false
  let requestOnlyRejected := parseNone && onlyA && !defOnReq
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirReq)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let qStx <- if requestOnlyRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && requestOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodDefaultLibraryTarget
  let rN := mkIdent `elabMeetRejectsMissingDefaultLibraryTarget
  let qN := mkIdent `elabMeetRejectsRequestOnlyAsDefault
  let dN := mkIdent `elabMeetDrivesDefaultLibraryTarget
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $qN : Bool := $qStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetDefaultLibraryTargetProbe

/-- Collect one `lean_lib Name`, one `srcDir Dir`, and optional
    `module Name` lines. No `srcDir` is none (Name 103/113).
    Two `lean_lib` is none. A `default` line is none.
    Empty, `.`, `..`, or a slash in the directory name is none.
    A `lean_exe` line is none (Name 123 lib+exe+srcDir text).
    Greppable: parseSourceDirectory. -/
def parseSourceDirectory (text : String) :
    Option (Prod String (Prod String (List String))) :=
  let rec go (lines : List String)
      (srcDir : Option String)
      (lib : Option String)
      (mods : List String)
      (seenLib : Bool) :
      Option (Prod String (Prod String (List String))) :=
    match lines with
    | [] =>
      match srcDir, lib with
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
          | none => go rest (some n) lib mods seenLib
      else if t.startsWith "lean_lib " then
        let n := (t.dropPrefix "lean_lib ").trimAscii.copy
        if n.isEmpty || seenLib then
          none
        else
          go rest srcDir (some n) mods true
      else if t.startsWith "module " then
        let n := (t.dropPrefix "module ").trimAscii.copy
        if n.isEmpty then
          none
        else
          go rest srcDir lib (mods ++ [n]) seenLib
      else if t.startsWith "lean_exe " then
        none
      else if t == "default" || t.startsWith "default " then
        none
      else
        go rest srcDir lib mods seenLib
  go (text.splitOn "\n") none none [] false

/-- Compile listed modules from the named source directory.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on parse none, missing directory, module only
    at cwd, type error, or missing `.olean`.
    Greppable: tryCompileSourceDirectory. -/
unsafe def tryCompileSourceDirectoryIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let some (srcDirName, p) := parseSourceDirectory text | return false
  let libTarget := p.fst
  let names := p.snd
  if names.isEmpty then
    return false
  let srcRoot := dir / srcDirName
  if !(<- srcRoot.pathExists) then
    return false
  if !(<- srcRoot.isDir) then
    return false
  let libSrc := Lean.modToFilePath srcRoot (String.toName libTarget) "lean"
  if !(<- libSrc.pathExists) then
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

@[implemented_by tryCompileSourceDirectoryIO]
opaque tryCompileSourceDirectoryIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile from the listed source directory.
    Greppable: tryCompileSourceDirectory. -/
def tryCompileSourceDirectory
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileSourceDirectoryIOSafe descPath dir)
  catch _ =>
    pure false

/-- Record accept / reject for a listed source directory.
    Accept writes `srcDir src` plus `src/ElabMeetSrcLib.lean`
    (not at cwd). Reject names `srcDir ElabMeetSrcMissing`
    with no such directory. A Name 113 cwd-only richer
    walk compiles at cwd and is not a source-directory
    accept. Drive is good && !bad && cwdOnlyRejected. -/
elab "#elabMeetSourceDirectoryProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let dirCwd <- liftIO IO.FS.createTempDir
  let writeGood : CommandElabM Unit := do
    let srcRoot := dirGood / "src"
    liftIO (IO.FS.createDirAll srcRoot)
    let libPath := Lean.modToFilePath srcRoot `ElabMeetSrcLib "lean"
    let descPath := dirGood / "package.txt"
    liftIO (IO.FS.writeFile libPath srcLibSnippet)
    liftIO (IO.FS.writeFile descPath goodSourceDirectoryText)
  let writeBad : CommandElabM Unit := do
    let descPath := dirBad / "package.txt"
    liftIO (IO.FS.writeFile descPath badSourceDirectoryText)
  let writeCwd : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dirCwd `ElabMeetRichLib "lean"
    let impPath := Lean.modToFilePath dirCwd `ElabMeetRichImp "lean"
    let descPath := dirCwd / "package.txt"
    liftIO (IO.FS.writeFile libPath richLibSnippet)
    liftIO (IO.FS.writeFile impPath goodRichImporterSnippet)
    liftIO (IO.FS.writeFile descPath goodRicherPackageDescText)
  writeGood
  writeBad
  writeCwd
  let srcOk <-
    tryCompileSourceDirectory (dirGood / "package.txt") dirGood
  let srcOlean :=
    Lean.modToFilePath (dirGood / "src") `ElabMeetSrcLib "olean"
  let cwdOlean := Lean.modToFilePath dirGood `ElabMeetSrcLib "olean"
  let srcOleanOk <- liftIO srcOlean.pathExists
  let cwdOleanOk <- liftIO cwdOlean.pathExists
  let good := srcOk && srcOleanOk && !cwdOleanOk
  let miss <-
    tryCompileSourceDirectory (dirBad / "package.txt") dirBad
  let bad := miss
  let richerOk <-
    tryCompileRicherPackageDesc (dirCwd / "package.txt") dirCwd
  let srcOnCwd <-
    tryCompileSourceDirectory (dirCwd / "package.txt") dirCwd
  let parseNone :=
    match parseSourceDirectory goodRicherPackageDescText with
    | none => true
    | some _ => false
  let cwdOnlyRejected := parseNone && richerOk && !srcOnCwd
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
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let cStx <- if cwdOnlyRejected then `(true) else `(false)
  let dStx <-
    if good && !bad && cwdOnlyRejected then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodSourceDirectory
  let rN := mkIdent `elabMeetRejectsMissingSourceDirectory
  let cN := mkIdent `elabMeetRejectsCwdOnlyAsSourceDirectory
  let dN := mkIdent `elabMeetDrivesSourceDirectory
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $cN : Bool := $cStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetSourceDirectoryProbe

/-- Record accept / reject for honor-compile-order.
    Description lists the importer first, then the library.
    Accept compiles both (library first so the importer can use
    `orderLib`). Reject uses the same importer-first description
    with an ill-typed library (`def n : Nat := true`).
    Extracted from ElabMeet so that file stays under the line cap. -/
elab "#elabMeetCompileOrderProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let writePair (dir : System.FilePath) (libBody : String) : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dir `ElabMeetOrderLib "lean"
    let impPath := Lean.modToFilePath dir `ElabMeetOrderImp "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile libPath libBody)
    liftIO (IO.FS.writeFile impPath goodOrderImporterSnippet)
    liftIO (IO.FS.writeFile descPath goodOrderDescText)
  writePair dirGood orderLibSnippet
  writePair dirBad badOrderLibSnippet
  let good <- tryCompilePackageDescOrdered (dirGood / "package.txt") dirGood
  let bad <- tryCompilePackageDescOrdered (dirBad / "package.txt") dirBad
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodCompileOrder
  let rN := mkIdent `elabMeetRejectsBadCompileOrder
  let dN := mkIdent `elabMeetDrivesCompileOrder
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetCompileOrderProbe

end SystemsLean.ElabMeet
