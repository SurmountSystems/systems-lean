/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet on-disk compile helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeet: compile seam, compile-then-import,
  two-module package compile, and package-description walk live here.
  The library-theorem, two-module package, and package-description
  probe commands live here so ElabMeet stays under the line cap.
  Other probes and theorems stay in ElabMeet.
  Same namespace SystemsLean.ElabMeet so helper names stay
  unqualified.

  Spec (readable):
  - tryCompileOnDiskModule reads one `.lean` file and writes an `.olean`.
  - tryCompileThenImportFiles compiles then imports (no second elaborator).
  - tryCompileTwoModulePackage compiles library then importer.
  - parsePackageDescModules / tryCompilePackageDesc walk listed names
    in listed order.
  - tryCompilePackageDescOrdered compiles listed names in import
    order (library before importer even when the description lists
    the importer first). Fail-closed on missing or ill-typed modules.
  - tryCompilePackageDescFollowImports compiles a listed importer
    after following a non-prelude import that the description
    omitted. Fail-closed when that omitted library file is missing.
    One hop only.
  - tryCompilePackageDescFollowImportChain follows omitted library
    imports as well (tip -> mid -> base). Description still names
    only the tip. Fail-closed when the deepest library file is missing.
  - tryCompilePackageDescCycleReject follows omitted imports then
    fail-closes on an import cycle (tip imports mid, mid imports tip).
    Hop-bounded follow must not loop. Distinct from missing omitted
    library and missing deepest library.
  - tryCompilePackageDescTheorem reuses tryCompilePackageDesc so a
    listed package module that holds a theorem must typecheck.
  - tryCompilePackageDescLibraryTheorem reuses tryCompilePackageDesc
    so an importer theorem that uses a compiled library theorem must
    typecheck.
  - Compiled-olean reuse lives in SystemsLean.ElabMeetOlean.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryElabImportedModuleStringIO, tryElabOnDiskImportFiles,
  tryCompileOnDiskModule,
  tryCompileThenImportFiles, tryCompileTwoModulePackage,
  tryCompilePackageDesc, tryCompilePackageDescOrdered,
  tryCompilePackageDescFollowImports,
  tryCompilePackageDescFollowImportChain,
  tryCompilePackageDescCycleReject, tryCompilePackageDescTheorem,
  tryCompilePackageDescLibraryTheorem, tryCompileLibraryTheoremPkg,
  elabMeetDrivesLibraryTheorem,
  importGraphHasCycle,
  followOmittedImportsBoundedIO, followImportHopBound,
  parsePackageDescModules,
  listedImportsInSource, importsInSource, compileOrderAmong,
  ElabMeetCompile, SystemsLean.ElabMeetCompile,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetCompile
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetCompile; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetProbe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- IO body for `tryElabImportedModuleString`. Unsafe because header import
    with environment extensions needs `enableInitializersExecution` (same as
    Lake's config elaborator). leakEnv true is only for this single-shot helper
    (one env for that probe). Multi-module on-disk compiles must not leak. -/
unsafe def tryElabImportedModuleStringIO (input : String) : IO Bool := do
  enableInitializersExecution
  let fileName := "<elab-meet-import>"
  let inputCtx := Parser.mkInputContext input fileName
  let (header, parserState, messages) <- Parser.parseHeader inputCtx
  if messages.hasErrors then
    return false
  let (env, messages) <-
    Lean.Elab.processHeader header {} messages inputCtx
      (leakEnv := true) (mainModule := `ElabMeetImportProbe)
  if messages.hasErrors then
    return false
  let commandState := Command.mkState env messages {}
  let s <- Lean.Elab.IO.processCommands inputCtx parserState commandState
  pure !(s.commandState.messages.hasErrors)

@[implemented_by tryElabImportedModuleStringIO]
opaque tryElabImportedModuleStringIOSafe (input : String) : IO Bool

/-- Write a library module to an `.olean` on `dir`, put `dir` on the Lean
    search path, then elaborate the good and bad importer files.
    Reuses `tryElabImportedModuleStringIO` (no second elaborator).
    Fail-closed on library elab, write, import, parse, or body error.
    Greppable: tryElabOnDiskImportFiles. -/
unsafe def tryElabOnDiskImportFilesIO (libInput : String) (libMod : Name)
    (goodPath badPath dir : System.FilePath) : IO (Prod Bool Bool) := do
  enableInitializersExecution
  let oleanPath := Lean.modToFilePath dir libMod "olean"
  let fileName := "<elab-meet-ondisk-lib>"
  let inputCtx := Parser.mkInputContext libInput fileName
  let (header, parserState, messages) <- Parser.parseHeader inputCtx
  if messages.hasErrors then
    return (false, true)
  -- Multi-module on-disk library elab must not leak environments.
  let (env, messages) <-
    Lean.Elab.processHeader header {} messages inputCtx
      (leakEnv := false) (mainModule := libMod)
  if messages.hasErrors then
    return (false, true)
  let commandState := Command.mkState env messages {}
  let s <- Lean.Elab.IO.processCommands inputCtx parserState commandState
  if s.commandState.messages.hasErrors then
    return (false, true)
  try
    writeModule s.commandState.env oleanPath (writeIR := false)
  catch _ =>
    return (false, true)
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let goodInput <- IO.FS.readFile goodPath
    let badInput <- IO.FS.readFile badPath
    let good <- tryElabImportedModuleStringIO goodInput
    let bad <- tryElabImportedModuleStringIO badInput
    pure (good, bad)
  finally
    searchPathRef.set prev

@[implemented_by tryElabOnDiskImportFilesIO]
opaque tryElabOnDiskImportFilesIOSafe (libInput : String) (libMod : Name)
    (goodPath badPath dir : System.FilePath) : IO (Prod Bool Bool)

/-- CommandElab wrapper: library file plus two importers under `dir`.
    Greppable: tryElabOnDiskImportFiles. -/
def tryElabOnDiskImportFiles (libInput : String) (libMod : Name)
    (goodPath badPath dir : System.FilePath) : CommandElabM (Prod Bool Bool) := do
  try
    liftIO (tryElabOnDiskImportFilesIOSafe libInput libMod goodPath badPath dir)
  catch _ =>
    pure (false, true)

/-- Compile one on-disk `.lean` source to an `.olean`.
    Seam: read the source file, run the same header+body elaborator as
    the import helper, then persist the environment with `writeModule`.
    The `.olean` is the compile result of that file, not an in-memory
    snippet dump. Fail-closed on read, parse, elab, or write error.
    leakEnv false: multi-module on-disk compiles must not mark env persistent.
    Greppable: tryCompileOnDiskModule. -/
unsafe def tryCompileOnDiskModuleIO (srcPath : System.FilePath)
    (libMod : Name) (dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let input <-
    try
      IO.FS.readFile srcPath
    catch _ =>
      return false
  let oleanPath := Lean.modToFilePath dir libMod "olean"
  let fileName := srcPath.toString
  let inputCtx := Parser.mkInputContext input fileName
  let (header, parserState, messages) <- Parser.parseHeader inputCtx
  if messages.hasErrors then
    return false
  -- Multi-module on-disk compiles must not leak environments.
  let (env, messages) <-
    Lean.Elab.processHeader header {} messages inputCtx
      (leakEnv := false) (mainModule := libMod)
  if messages.hasErrors then
    return false
  let commandState := Command.mkState env messages {}
  let s <- Lean.Elab.IO.processCommands inputCtx parserState commandState
  if s.commandState.messages.hasErrors then
    return false
  try
    writeModule s.commandState.env oleanPath (writeIR := false)
    pure true
  catch _ =>
    pure false

@[implemented_by tryCompileOnDiskModuleIO]
opaque tryCompileOnDiskModuleIOSafe (srcPath : System.FilePath)
    (libMod : Name) (dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile one on-disk module to `.olean`.
    Greppable: tryCompileOnDiskModule. -/
def tryCompileOnDiskModule (srcPath : System.FilePath)
    (libMod : Name) (dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompileOnDiskModuleIOSafe srcPath libMod dir)
  catch _ =>
    pure false

/-- Compile good library source from disk to `.olean`, put `dir` on the
    search path, elaborate the importer of that compiled module, then
    compile the bad library source (must fail). Reuses
    `tryElabImportedModuleStringIO` (no second elaborator).
    Greppable: tryCompileThenImportFiles. -/
unsafe def tryCompileThenImportFilesIO
    (goodLibPath badLibPath goodImporterPath dir : System.FilePath)
    (libMod : Name) : IO (Prod Bool Bool) := do
  enableInitializersExecution
  let compiled <- tryCompileOnDiskModuleIO goodLibPath libMod dir
  if !compiled then
    return (false, true)
  let oleanPath := Lean.modToFilePath dir libMod "olean"
  if !(<- oleanPath.pathExists) then
    return (false, true)
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let goodInput <- IO.FS.readFile goodImporterPath
    let good <- tryElabImportedModuleStringIO goodInput
    let badCompiled <-
      tryCompileOnDiskModuleIO badLibPath `ElabMeetCompiledBad dir
    pure (good, badCompiled)
  finally
    searchPathRef.set prev

@[implemented_by tryCompileThenImportFilesIO]
opaque tryCompileThenImportFilesIOSafe
    (goodLibPath badLibPath goodImporterPath dir : System.FilePath)
    (libMod : Name) : IO (Prod Bool Bool)

/-- CommandElab wrapper: compile-then-import under `dir`.
    Greppable: tryCompileThenImportFiles. -/
def tryCompileThenImportFiles
    (goodLibPath badLibPath goodImporterPath dir : System.FilePath)
    (libMod : Name) : CommandElabM (Prod Bool Bool) := do
  try
    liftIO (tryCompileThenImportFilesIOSafe
      goodLibPath badLibPath goodImporterPath dir libMod)
  catch _ =>
    pure (false, true)

/-- Compile a two-module package from disk: library then importer.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator). Puts
    `dir` on the search path so the importer finds the compiled
    library. Accept is importer compile plus importer `.olean`.
    Reject is compile-fail of the ill-typed importer.
    Greppable: tryCompileTwoModulePackage. -/
unsafe def tryCompileTwoModulePackageIO
    (libPath goodImporterPath badImporterPath dir : System.FilePath)
    (libMod importerMod : Name) : IO (Prod Bool Bool) := do
  enableInitializersExecution
  let libOk <- tryCompileOnDiskModuleIO libPath libMod dir
  if !libOk then
    return (false, true)
  let libOlean := Lean.modToFilePath dir libMod "olean"
  if !(<- libOlean.pathExists) then
    return (false, true)
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let goodOk <- tryCompileOnDiskModuleIO goodImporterPath importerMod dir
    let goodOlean := Lean.modToFilePath dir importerMod "olean"
    let good := goodOk && (<- goodOlean.pathExists)
    let badOk <-
      tryCompileOnDiskModuleIO badImporterPath `ElabMeetPkgBad dir
    pure (good, badOk)
  finally
    searchPathRef.set prev

@[implemented_by tryCompileTwoModulePackageIO]
opaque tryCompileTwoModulePackageIOSafe
    (libPath goodImporterPath badImporterPath dir : System.FilePath)
    (libMod importerMod : Name) : IO (Prod Bool Bool)

/-- CommandElab wrapper: compile both package modules under `dir`.
    Greppable: tryCompileTwoModulePackage. -/
def tryCompileTwoModulePackage
    (libPath goodImporterPath badImporterPath dir : System.FilePath)
    (libMod importerMod : Name) : CommandElabM (Prod Bool Bool) := do
  try
    liftIO (tryCompileTwoModulePackageIOSafe
      libPath goodImporterPath badImporterPath dir libMod importerMod)
  catch _ =>
    pure (false, true)

/-- Collect `module Name` lines from a tiny package description.
    Empty lines and other text are ignored. Greppable: parsePackageDescModules. -/
def parsePackageDescModules (text : String) : List String :=
  text.splitOn "\n" |>.filterMap fun line =>
    let t := line.trimAscii
    if t.startsWith "module " then
      let n := (t.dropPrefix "module ").trimAscii.copy
      if n.isEmpty then none else some n
    else
      none

/-- Walk a package description on disk and compile each named module
    with `tryCompileOnDiskModuleIO` (no second elaborator). Compile
    order is the listed order. Fail-closed on empty desc, missing
    source, type error, or missing `.olean`.
    Greppable: tryCompilePackageDesc. -/
unsafe def tryCompilePackageDescIO (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let names := parsePackageDescModules text
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
        let compiled <- tryCompileOnDiskModuleIO src modName dir
        let olean := Lean.modToFilePath dir modName "olean"
        allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompilePackageDescIO]
opaque tryCompilePackageDescIOSafe (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: read a package description and compile names.
    Greppable: tryCompilePackageDesc. -/
def tryCompilePackageDesc (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompilePackageDescIOSafe descPath dir)
  catch _ =>
    pure false

/-- Listed `import Name` lines that name another module in `names`. -/
def listedImportsInSource (src : String) (names : List String) : List String :=
  let lines := src.splitOn "\n"
  names.filter fun n =>
    lines.any fun line =>
      let t := line.trimAscii
      t == s!"import {n}" || t.startsWith s!"import {n} "

/-- Listed deps of one name. Empty if the name is missing from `deps`. -/
def listedDepsOf (n : String) (deps : List (Prod String (List String))) : List String :=
  match deps.find? (fun p => p.fst == n) with
  | some p => p.snd
  | none => []

/-- Dependencies first. None if a listed import cycle remains. -/
partial def compileOrderLoop (remaining acc : List String)
    (deps : List (Prod String (List String))) : Option (List String) :=
  match remaining with
  | [] => some acc
  | _ =>
    match remaining.find? fun n =>
        (listedDepsOf n deps).all fun d =>
          !(remaining.any (fun r => r == d)) with
    | none => none
    | some n =>
      compileOrderLoop (remaining.filter (fun r => r != n)) (acc ++ [n]) deps

/-- Compute compile order among listed names. Dependencies first.
    Greppable: compileOrderAmong. -/
def compileOrderAmong (names : List String)
    (deps : List (Prod String (List String))) : Option (List String) :=
  compileOrderLoop names [] deps

/-- Walk a package description and compile named modules in import
    order via `tryCompileOnDiskModuleIO` (no second elaborator). If
    the description lists an importer before its library, the library
    still compiles first. Fail-closed on empty desc, missing source,
    import cycle, type error, or missing `.olean`.
    Greppable: tryCompilePackageDescOrdered. -/
unsafe def tryCompilePackageDescOrderedIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let names := parsePackageDescModules text
  if names.isEmpty then
    return false
  let mut deps : List (Prod String (List String)) := []
  for n in names do
    let modName := String.toName n
    let srcPath := Lean.modToFilePath dir modName "lean"
    let src <-
      try
        IO.FS.readFile srcPath
      catch _ =>
        return false
    deps := deps ++ [(n, listedImportsInSource src names)]
  let some order := compileOrderAmong names deps | return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let mut allOk := true
    for n in order do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath dir modName "lean"
        let compiled <- tryCompileOnDiskModuleIO src modName dir
        let olean := Lean.modToFilePath dir modName "olean"
        allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompilePackageDescOrderedIO]
opaque tryCompilePackageDescOrderedIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile named modules in import order.
    Greppable: tryCompilePackageDescOrdered. -/
def tryCompilePackageDescOrdered
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompilePackageDescOrderedIOSafe descPath dir)
  catch _ =>
    pure false

/-- All `import Name` lines in a source string. Greppable: importsInSource. -/
def importsInSource (src : String) : List String :=
  src.splitOn "\n" |>.filterMap fun line =>
    let t := line.trimAscii
    if t.startsWith "import " then
      let rest := (t.dropPrefix "import ").trimAscii.copy
      match rest.splitOn " " with
      | [] => none
      | n :: _ => if n.isEmpty then none else some n
    else
      none

/-- Host prelude imports are not followed from the package dir. -/
def isPreludeImport (n : String) : Bool :=
  n == "Init" || n.startsWith "Init."
    || n == "Lean" || n.startsWith "Lean."
    || n == "Std" || n.startsWith "Std."

/-- Direct omitted imports of listed modules (not prelude, not listed). -/
def omittedImportsOfListed (listed : List String)
    (srcByName : List (Prod String String)) : List String :=
  listed.foldl (init := []) fun extra n =>
    match srcByName.find? (fun p => p.fst == n) with
    | none => extra
    | some p =>
      (importsInSource p.snd).foldl (init := extra) fun acc imp =>
        let already :=
          listed.any (fun x => x == imp) || acc.any (fun x => x == imp)
        if !isPreludeImport imp && !already then acc ++ [imp] else acc

/-- Walk a package description and compile listed modules after
    compiling each listed module's omitted non-prelude imports.
    One hop only: the omitted library's own imports are not followed.
    Reuses `tryCompileOnDiskModuleIO` (no second elaborator).
    Fail-closed on empty desc, missing listed source, missing omitted
    library file, import cycle, type error, or missing `.olean`.
    Greppable: tryCompilePackageDescFollowImports. -/
unsafe def tryCompilePackageDescFollowImportsIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let listed := parsePackageDescModules text
  if listed.isEmpty then
    return false
  let mut srcByName : List (Prod String String) := []
  for n in listed do
    let modName := String.toName n
    let srcPath := Lean.modToFilePath dir modName "lean"
    let src <-
      try
        IO.FS.readFile srcPath
      catch _ =>
        return false
    srcByName := srcByName ++ [(n, src)]
  let extra := omittedImportsOfListed listed srcByName
  let names := extra ++ listed
  let mut deps : List (Prod String (List String)) := []
  for n in names do
    let modName := String.toName n
    let srcPath := Lean.modToFilePath dir modName "lean"
    let src <-
      try
        IO.FS.readFile srcPath
      catch _ =>
        return false
    deps := deps ++ [(n, listedImportsInSource src names)]
  let some order := compileOrderAmong names deps | return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let mut allOk := true
    for n in order do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath dir modName "lean"
        let compiled <- tryCompileOnDiskModuleIO src modName dir
        let olean := Lean.modToFilePath dir modName "olean"
        allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompilePackageDescFollowImportsIO]
opaque tryCompilePackageDescFollowImportsIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile listed names plus omitted imports.
    Greppable: tryCompilePackageDescFollowImports. -/
def tryCompilePackageDescFollowImports
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompilePackageDescFollowImportsIOSafe descPath dir)
  catch _ =>
    pure false

/-- Fresh omitted non-prelude imports of `src` not already in `known` or
    `pending`. Greppable: nextOmittedImports. -/
def nextOmittedImports (src : String) (known pending : List String) : List String :=
  (importsInSource src).foldl (init := []) fun acc imp =>
    let seen :=
      known.any (fun x => x == imp)
      || pending.any (fun x => x == imp)
      || acc.any (fun x => x == imp)
    if !isPreludeImport imp && !seen then acc ++ [imp] else acc

/-- Load omitted imports of listed modules, then omitted imports of those
    libraries, until no new names. Fail-closed when a followed file is
    missing. Greppable: followOmittedImportsIO. -/
partial def followOmittedImportsIO (dir : System.FilePath)
    (listed extra work : List String)
    (srcByName : List (Prod String String)) :
    IO (Option (Prod (List String) (List (Prod String String)))) := do
  match work with
  | [] => pure (some (extra, srcByName))
  | n :: rest =>
    if listed.any (fun x => x == n) || extra.any (fun x => x == n) then
      followOmittedImportsIO dir listed extra rest srcByName
    else
      let modName := String.toName n
      let srcPath := Lean.modToFilePath dir modName "lean"
      let src <-
        try
          IO.FS.readFile srcPath
        catch _ =>
          return none
      let extra' := extra ++ [n]
      let srcByName' := srcByName ++ [(n, src)]
      let news := nextOmittedImports src (listed ++ extra') rest
      followOmittedImportsIO dir listed extra' (rest ++ news) srcByName'

/-- Walk a package description and compile listed modules after
    compiling omitted non-prelude imports of those modules and of
    the omitted libraries themselves (a chain). Reuses
    `tryCompileOnDiskModuleIO` (no second elaborator). Fail-closed
    on empty desc, missing listed source, missing deepest library
    file, import cycle, type error, or missing `.olean`.
    Greppable: tryCompilePackageDescFollowImportChain. -/
unsafe def tryCompilePackageDescFollowImportChainIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let listed := parsePackageDescModules text
  if listed.isEmpty then
    return false
  let mut srcByName : List (Prod String String) := []
  for n in listed do
    let modName := String.toName n
    let srcPath := Lean.modToFilePath dir modName "lean"
    let src <-
      try
        IO.FS.readFile srcPath
      catch _ =>
        return false
    srcByName := srcByName ++ [(n, src)]
  let first := omittedImportsOfListed listed srcByName
  let some pair :=
    (<- followOmittedImportsIO dir listed [] first srcByName) | return false
  let extra := pair.fst
  let loaded := pair.snd
  let names := extra ++ listed
  let mut deps : List (Prod String (List String)) := []
  for n in names do
    let src :=
      match loaded.find? (fun p => p.fst == n) with
      | some p => p.snd
      | none => ""
    deps := deps ++ [(n, listedImportsInSource src names)]
  let some order := compileOrderAmong names deps | return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let mut allOk := true
    for n in order do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath dir modName "lean"
        let compiled <- tryCompileOnDiskModuleIO src modName dir
        let olean := Lean.modToFilePath dir modName "olean"
        allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompilePackageDescFollowImportChainIO]
opaque tryCompilePackageDescFollowImportChainIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: compile listed names plus an omitted import chain.
    Greppable: tryCompilePackageDescFollowImportChain. -/
def tryCompilePackageDescFollowImportChain
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompilePackageDescFollowImportChainIOSafe descPath dir)
  catch _ =>
    pure false

/-- Hop bound so an omitted-import follow cannot run forever. -/
def followImportHopBound : Nat := 64

/-- True when listed-plus-omitted names have an import cycle.
    Greppable: importGraphHasCycle. -/
def importGraphHasCycle (names : List String)
    (deps : List (Prod String (List String))) : Bool :=
  match compileOrderAmong names deps with
  | none => true
  | some _ => false

/-- Follow omitted imports with a hop bound. Fail-closed when hops run
    out (cycle-safe; must not loop).
    Greppable: followOmittedImportsBoundedIO. -/
partial def followOmittedImportsBoundedIO (dir : System.FilePath)
    (listed extra work : List String)
    (srcByName : List (Prod String String))
    (hops : Nat) :
    IO (Option (Prod (List String) (List (Prod String String)))) := do
  match work with
  | [] => pure (some (extra, srcByName))
  | n :: rest =>
    if hops == 0 then
      return none
    if listed.any (fun x => x == n) || extra.any (fun x => x == n) then
      followOmittedImportsBoundedIO dir listed extra rest srcByName hops.pred
    else
      let modName := String.toName n
      let srcPath := Lean.modToFilePath dir modName "lean"
      let src <-
        try
          IO.FS.readFile srcPath
        catch _ =>
          return none
      let extra' := extra ++ [n]
      let srcByName' := srcByName ++ [(n, src)]
      let news := nextOmittedImports src (listed ++ extra') rest
      followOmittedImportsBoundedIO dir listed extra' (rest ++ news)
        srcByName' hops.pred

/-- Walk a package description, follow omitted imports, and fail-close
    when the followed graph has a cycle. Does not loop: hop-bounded
    follow plus importGraphHasCycle. Reuses tryCompileOnDiskModuleIO
    (no second elaborator). Accept is an acyclic follow (mid is a
    plain library). Reject is a cycle among listed plus omitted names.
    Distinct from missing omitted library and missing deepest library.
    Greppable: tryCompilePackageDescCycleReject. -/
unsafe def tryCompilePackageDescCycleRejectIO
    (descPath dir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let text <-
    try
      IO.FS.readFile descPath
    catch _ =>
      return false
  let listed := parsePackageDescModules text
  if listed.isEmpty then
    return false
  let mut srcByName : List (Prod String String) := []
  for n in listed do
    let modName := String.toName n
    let srcPath := Lean.modToFilePath dir modName "lean"
    let src <-
      try
        IO.FS.readFile srcPath
      catch _ =>
        return false
    srcByName := srcByName ++ [(n, src)]
  let first := omittedImportsOfListed listed srcByName
  let some pair :=
    (<- followOmittedImportsBoundedIO dir listed [] first srcByName
      followImportHopBound) | return false
  let extra := pair.fst
  let loaded := pair.snd
  let names := extra ++ listed
  let mut deps : List (Prod String (List String)) := []
  for n in names do
    let src :=
      match loaded.find? (fun p => p.fst == n) with
      | some p => p.snd
      | none => ""
    deps := deps ++ [(n, listedImportsInSource src names)]
  if importGraphHasCycle names deps then
    return false
  let some order := compileOrderAmong names deps | return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let mut allOk := true
    for n in order do
      if allOk then
        let modName := String.toName n
        let src := Lean.modToFilePath dir modName "lean"
        let compiled <- tryCompileOnDiskModuleIO src modName dir
        let olean := Lean.modToFilePath dir modName "olean"
        allOk := compiled && (<- olean.pathExists)
    pure allOk
  finally
    searchPathRef.set prev

@[implemented_by tryCompilePackageDescCycleRejectIO]
opaque tryCompilePackageDescCycleRejectIOSafe
    (descPath dir : System.FilePath) : IO Bool

/-- CommandElab wrapper: follow omitted imports and reject a cycle.
    Greppable: tryCompilePackageDescCycleReject. -/
def tryCompilePackageDescCycleReject
    (descPath dir : System.FilePath) : CommandElabM Bool := do
  try
    liftIO (tryCompilePackageDescCycleRejectIOSafe descPath dir)
  catch _ =>
    pure false

/-- Compile a package description that names a theorem-bearing module.
    Reuses `tryCompilePackageDesc` (no second elaborator). Accept is
    a listed module whose theorem checks. Reject is the same package
    shape when the theorem does not check.
    Greppable: tryCompilePackageDescTheorem. -/
def tryCompilePackageDescTheorem
    (descPath dir : System.FilePath) : CommandElabM Bool :=
  tryCompilePackageDesc descPath dir

/-- Record accept / reject for a theorem in a compiled package module.
    Description names a library plus the theorem module. Accept
    compiles both when the theorem is `theorem t : 1 = 1 := rfl`.
    Reject uses the same description when the theorem is
    `theorem t : 1 = 2 := rfl`. Distinct from a theorem command
    string with no package compile. Moved here so ElabMeet stays
    under the line cap. -/
elab "#elabMeetPackageTheoremProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let writePkg (dir : System.FilePath) (thmBody : String) : CommandElabM Unit := do
    let libPath := Lean.modToFilePath dir `ElabMeetPkgThmLib "lean"
    let thmPath := Lean.modToFilePath dir `ElabMeetPkgThm "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile libPath pkgTheoremLibSnippet)
    liftIO (IO.FS.writeFile thmPath thmBody)
    liftIO (IO.FS.writeFile descPath goodPkgTheoremDescText)
  writePkg dirGood goodPkgTheoremSnippet
  writePkg dirBad badPkgTheoremSnippet
  let good <-
    tryCompilePackageDescTheorem (dirGood / "package.txt") dirGood
  let bad <-
    tryCompilePackageDescTheorem (dirBad / "package.txt") dirBad
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
  let gN := mkIdent `elabMeetAcceptsGoodPackageTheorem
  let rN := mkIdent `elabMeetRejectsBadPackageTheorem
  let dN := mkIdent `elabMeetDrivesPackageTheorem
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetPackageTheoremProbe

/-- Compile a package whose library holds a theorem and whose
    importer theorem uses that compiled fact. Reuses
    `tryCompilePackageDesc` (no second elaborator). Accept is
    importer `useFact` checking via `libFact`. Reject is the same
    package when the importer theorem does not check.
    Greppable: tryCompilePackageDescLibraryTheorem. -/
def tryCompilePackageDescLibraryTheorem
    (descPath dir : System.FilePath) : CommandElabM Bool :=
  tryCompilePackageDesc descPath dir

/-- Write library-theorem package files under `dir`, then compile.
    Used by the library-theorem probe so ElabMeet stays under the
    line cap. Greppable: tryCompileLibraryTheoremPkg. -/
def tryCompileLibraryTheoremPkg (dir : System.FilePath)
    (libBody impBody descText : String) : CommandElabM Bool := do
  let libPath := Lean.modToFilePath dir `ElabMeetLibFact "lean"
  let impPath := Lean.modToFilePath dir `ElabMeetUseFact "lean"
  let descPath := dir / "package.txt"
  liftIO (IO.FS.writeFile libPath libBody)
  liftIO (IO.FS.writeFile impPath impBody)
  liftIO (IO.FS.writeFile descPath descText)
  tryCompilePackageDescLibraryTheorem descPath dir

/-- Record accept / reject for an importer theorem that uses a
    compiled library theorem. Description names the library plus
    the importer. Accept compiles both when the library proves
    `theorem libFact : 1 = 1 := rfl` and the importer proves
    `theorem useFact : 1 = 1 := libFact`. Reject uses the same
    description when the importer is `theorem useFact : 1 = 2 :=
    libFact`. Distinct from a theorem that lives only in one
    listed module and does not use a library fact. -/
elab "#elabMeetLibraryTheoremProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let good <-
    tryCompileLibraryTheoremPkg dirGood
      libFactSnippet goodUseFactSnippet goodLibFactDescText
  let bad <-
    tryCompileLibraryTheoremPkg dirBad
      libFactSnippet badUseFactSnippet goodLibFactDescText
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
  let gN := mkIdent `elabMeetAcceptsGoodLibraryTheorem
  let rN := mkIdent `elabMeetRejectsBadLibraryTheorem
  let dN := mkIdent `elabMeetDrivesLibraryTheorem
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetLibraryTheoremProbe

/-- Record accept / reject for a tiny two-module package compile.
    Writes library and importer, compiles both from disk. Accept is
    importer `.olean` plus use of `pkgLib`. Reject is compile-fail of
    `def k : Nat := true`. Payload strings match twoModuleLibSnippet /
    goodTwoModuleImporterSnippet / badTwoModuleImporterSnippet.
    Moved here so ElabMeet stays under the line cap. -/
elab "#elabMeetTwoModulePackageProbe" : command => do
  let dir <- liftIO IO.FS.createTempDir
  let libPath := dir / "ElabMeetPkgLib.lean"
  let goodPath := dir / "ElabMeetPkg.lean"
  let badPath := dir / "ElabMeetPkgBad.lean"
  liftIO (IO.FS.writeFile libPath twoModuleLibSnippet)
  liftIO (IO.FS.writeFile goodPath goodTwoModuleImporterSnippet)
  liftIO (IO.FS.writeFile badPath badTwoModuleImporterSnippet)
  let (good, bad) <-
    tryCompileTwoModulePackage libPath goodPath badPath dir
      `ElabMeetPkgLib `ElabMeetPkg
  try
    liftIO (IO.FS.removeDirAll dir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodTwoModulePackage
  let rN := mkIdent `elabMeetRejectsBadTwoModulePackage
  let dN := mkIdent `elabMeetDrivesTwoModulePackage
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetTwoModulePackageProbe

/-- Record accept / reject for a package description walk.
    Writes a tiny package root that names two modules, plus the
    library and importer those names point at. Accept compiles both
    named files (importer uses `descLib`). Reject names a missing
    module so the walk is not a hardcoded success.
    Moved here so ElabMeet stays under the line cap. -/
elab "#elabMeetPackageDescProbe" : command => do
  let dir <- liftIO IO.FS.createTempDir
  let libPath := Lean.modToFilePath dir `ElabMeetDescLib "lean"
  let impPath := Lean.modToFilePath dir `ElabMeetDescImp "lean"
  let descGood := dir / "package.txt"
  let descBad := dir / "package-bad.txt"
  liftIO (IO.FS.writeFile libPath packageDescLibSnippet)
  liftIO (IO.FS.writeFile impPath goodPackageDescImporterSnippet)
  liftIO (IO.FS.writeFile descGood goodPackageDescText)
  liftIO (IO.FS.writeFile descBad badPackageDescText)
  let good <- tryCompilePackageDesc descGood dir
  let bad <- tryCompilePackageDesc descBad dir
  try
    liftIO (IO.FS.removeDirAll dir)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if !bad then `(true) else `(false)
  let dStx <- if good && !bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsGoodPackageDesc
  let rN := mkIdent `elabMeetRejectsBadPackageDesc
  let dN := mkIdent `elabMeetDrivesPackageDesc
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetPackageDescProbe

end SystemsLean.ElabMeet
