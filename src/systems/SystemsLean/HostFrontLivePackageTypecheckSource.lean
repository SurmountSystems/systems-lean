/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live PackageTypecheck.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePackageTypecheckSource. Not occupancy name 50.
  Not a remill. Mill stays 69 of 69.
  This wrap parses PackageTypecheck.lean only.
  Do not call runPackageTypecheckIOSafe. Do not elaborate the package walk.
  liveRel is the bare name PackageTypecheck.lean. Do not redefine it
  in the parser.
  Greppable: SYSTEMS_LEAN_HOST, livePackageTypecheckSource, liveRel,
  UNIT_SURFACE host surface.
  File module: SystemsLean.HostFrontLivePackageTypecheckSource
  Namespace: SystemsLean.HostFrontLivePackageTypecheck
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLivePackageTypecheck

/-- Live file bare name. Not a path. Greppable: liveRel. -/
def liveRel : String := "PackageTypecheck.lean"

/-- Dual-pinned live PackageTypecheck.lean bytes (must match on-disk file).
    Greppable: livePackageTypecheckSource, PARSE-LIVE-PACKAGE-TYPECHECK. -/
def livePackageTypecheckSource : String := r#"
/-
  SYSTEMS_LEAN_HOST partial -- Slake kernel walk of lean_lib SystemsLean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Driver for just slake-typecheck-src-systems. Same kernel compile as
  ElabMeet tryCompileOnDiskModuleIO (header+body, leakEnv false).
  Does not import ElabMeetCompile: that module runs live probes on load.
  .olean files go under build/package-typecheck (durable; SLAKE_OLEAN_DIR),
  never IO.FS.createTempDir, never under src/systems sources.
  Chunked: parent spawns --compile-one children. Ready-queue: a module
  runs only when every in-walk import already has an olean (or the
  import is omitted from the default walk). Up to SLAKE_TYPECHECK_JOBS
  concurrent children (default 4, min 1, max 4). Child --compile-one
  does not spawn (nested skip).
  Default walk omits leftover isolation-test Lean files
  (SystemsLean.ElabMeetNamed*Probe), occupancy living files, and
  kitchen-sink barrel SystemsLean. Transitive omit when a remaining
  module lists an omitted import.
  Walks product host modules, not occupancy 49.
  slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: slake-typecheck-src-systems, slakeOwnsPackageTypecheck,
  tryCompileOnDiskModuleIO, PackageTypecheck, printMessageLog,
  SLAKE_PACKAGE_TYPECHECK, SystemsLean.PackageTypecheck,
  HOST-ELAB-MEET, SLAKE_OLEAN_DIR, SLAKE_TYPECHECK_JOBS, SKELETON.
  Module: SystemsLean.PackageTypecheck
  Short role name (not ProductPathFreestanding*).
  Red/green: just slake-typecheck-src-systems (chunked product walk;
  slakeOwnsPackageTypecheck stays false). Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHost. Not Lake gone. Not occupancy 50. Not mill 70.
-/

import Lean

namespace SystemsLean.PackageTypecheck

open Lean Elab Command

/-- Occupancy isolation living files. Not this package typecheck. -/
def isOccupancyLiving (n : String) : Bool :=
  n == "SystemsLean.OccupancyProbe"
    || n == "SystemsLean.OccupancyTheorems"
    || n == "SystemsLean.OccupancyWalk"

/-- Leftover isolation-test Lean files (ElabMeetNamed*Probe). Not product. -/
def isLeftoverIsolationTest (n : String) : Bool :=
  n.startsWith "SystemsLean.ElabMeetNamed" && n.endsWith "Probe"

/-- Kitchen-sink barrel module SystemsLean (package root import shell). -/
def isKitchenSinkBarrel (n : String) : Bool :=
  n == "SystemsLean"

/-- Default walk omit: occupancy living, leftover isolation-test, or barrel. -/
def isDefaultWalkOmit (n : String) : Bool :=
  isOccupancyLiving n || isLeftoverIsolationTest n || isKitchenSinkBarrel n

/-- Host prelude imports are not followed from the package dir. -/
def isPreludeImport (n : String) : Bool :=
  n == "Init" || n.startsWith "Init."
    || n == "Lean" || n.startsWith "Lean."
    || n == "Std" || n.startsWith "Std."

/-- Command `import Name` lines only (column 0). Indented prose is not an import. -/
def importsInSource (src : String) : List String :=
  src.splitOn "\n" |>.filterMap fun line =>
    if line.startsWith "import " then
      let rest := (line.dropPrefix "import ").trimAscii.copy
      match rest.splitOn " " with
      | [] => none
      | n :: _ => if n.isEmpty then none else some n
    else
      none

/-- Listed command `import Name` lines that name another module in `names`. -/
def listedImportsInSource (src : String) (names : List String) : List String :=
  let lines := src.splitOn "\n"
  names.filter fun n =>
    lines.any fun line =>
      line == s!"import {n}" || line.startsWith s!"import {n} "

/-- Listed deps of one name. Empty if the name is missing from `deps`. -/
def listedDepsOf (n : String) (deps : List (Prod String (List String))) :
    List String :=
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

/-- Compute compile order among listed names. Dependencies first. -/
def compileOrderAmong (names : List String)
    (deps : List (Prod String (List String))) : Option (List String) :=
  compileOrderLoop names [] deps

/-- Resolve live src/systems (repo root cwd or Lake cwd). -/
def findLiveSrcRoot : IO (Option System.FilePath) := do
  let candA : System.FilePath := "SystemsLean/Mult.lean"
  let candB : System.FilePath := "src/systems/SystemsLean/Mult.lean"
  if (<- candA.pathExists) then
    return some "."
  if (<- candB.pathExists) then
    return some "src/systems"
  return none

/-- Recursively collect SystemsLean.* module names and source paths. -/
partial def collectLibraryLean (dir : System.FilePath) (modPrefix : String) :
    IO (List (Prod String System.FilePath)) := do
  let entries <- dir.readDir
  let mut acc : List (Prod String System.FilePath) := []
  for ent in entries do
    let p := ent.path
    if (<- p.isDir) then
      let nested <- collectLibraryLean p (modPrefix ++ ent.fileName ++ ".")
      acc := acc ++ nested
    else if ent.fileName.endsWith ".lean" then
      let stem := ent.fileName.dropEnd 5
      acc := acc ++ [(modPrefix ++ stem, p)]
  pure acc

/-- On-disk lean_lib SystemsLean: library dir plus package root. -/
def collectPackageModules (srcRoot : System.FilePath) :
    IO (List (Prod String System.FilePath)) := do
  let libDir := srcRoot / "SystemsLean"
  let pkgRoot := srcRoot / "SystemsLean.lean"
  unless (<- libDir.pathExists) do
    return []
  unless (<- libDir.isDir) do
    return []
  let mut mods <- collectLibraryLean libDir "SystemsLean."
  if (<- pkgRoot.pathExists) then
    mods := ("SystemsLean", pkgRoot) :: mods
  let sorted :=
    (mods.toArray.qsort (fun a b => a.fst < b.fst)).toList
  pure sorted

/-- Durable olean dir. Never temp. Never under src/systems sources. -/
def resolveOleanDir : IO System.FilePath := do
  match <- IO.getEnv "SLAKE_OLEAN_DIR" with
  | some d =>
    if d.isEmpty then
      pure "build/package-typecheck"
    else
      pure d
  | none =>
    pure "build/package-typecheck"

/-- True when args or env ask for collect+omit only. -/
def wantListCheck (args : List String) : IO Bool := do
  if args.any (fun a => a == "--list-check") then
    return true
  match <- IO.getEnv "SLAKE_PACKAGE_TYPECHECK_LIST_CHECK" with
  | some "1" => pure true
  | _ => pure false

/-- `--compile-one NAME` from remaining lean --run args. -/
def compileOneName (args : List String) : Option String :=
  match args.dropWhile (fun a => a != "--compile-one") with
  | "--compile-one" :: n :: _ =>
    if n.isEmpty || n.startsWith "--" then none else some n
  | _ => none

/-- Parent walk jobs. Default 4. Clamp 1 .. 4. Child path does not read this. -/
def clampTypecheckJobs (n : Nat) : Nat :=
  if n < 1 then 1 else if n > 4 then 4 else n

def parseTypecheckJobs : IO Nat := do
  match <- IO.getEnv "SLAKE_TYPECHECK_JOBS" with
  | none => pure 4
  | some s =>
    if s.isEmpty then
      pure 4
    else
      match s.toNat? with
      | none => pure 4
      | some n => pure (clampTypecheckJobs n)

/-- One remaining module lists an omitted import. -/
def listsOmittedImport (src : String) (omitted : List String) : Bool :=
  (importsInSource src).any fun imp => omitted.any (fun o => o == imp)

/-- Close omit under listed imports of omitted names. -/
partial def closeTransitiveOmit
    (remaining : List (Prod String System.FilePath))
    (srcByName : List (Prod String String))
    (omitted transAcc : List String) :
    Prod (List (Prod String System.FilePath)) (List String) :=
  let extra := remaining.filter fun p =>
    match srcByName.find? (fun q => q.fst == p.fst) with
    | some q => listsOmittedImport q.snd omitted
    | none => false
  match extra with
  | [] => (remaining, transAcc)
  | _ =>
    let extraNames := extra.map (fun p => p.fst)
    let nextRem := remaining.filter fun p =>
      !(extraNames.any (fun e => e == p.fst))
    closeTransitiveOmit nextRem srcByName (omitted ++ extraNames)
      (transAcc ++ extraNames)

/-- Print Lean MessageLog (reported and unreported). Error evidence. -/
def printMessageLog (msgs : MessageLog) : IO Unit := do
  let dump (arr : PersistentArray Message) : IO Unit := do
    arr.toList.forM fun msg => do
      IO.eprint (<- msg.toString)
  dump msgs.reported
  dump msgs.unreported
  (<- IO.getStderr).flush

/-- Same kernel compile as ElabMeet.tryCompileOnDiskModuleIO.
    leakEnv false. Writes .olean under oleanDir only.
    On fail, print Lean messages (parse / header / commands / write). -/
unsafe def tryCompileOnDiskModuleIO (srcPath : System.FilePath)
    (libMod : Name) (oleanDir : System.FilePath) : IO Bool := do
  enableInitializersExecution
  let input <-
    try
      IO.FS.readFile srcPath
    catch e =>
      IO.eprintln s!"readFile failed: {e.toString}"
      return false
  let oleanPath := Lean.modToFilePath oleanDir libMod "olean"
  match oleanPath.parent with
  | some parent => IO.FS.createDirAll parent
  | none => pure ()
  let fileName := srcPath.toString
  let inputCtx := Parser.mkInputContext input fileName
  let (header, parserState, messages) <- Parser.parseHeader inputCtx
  if messages.hasErrors then
    IO.eprintln s!"parseHeader failed: {libMod}"
    printMessageLog messages
    return false
  let (env, messages) <-
    Lean.Elab.processHeader header {} messages inputCtx
      (leakEnv := false) (mainModule := libMod)
  if messages.hasErrors then
    IO.eprintln s!"processHeader failed: {libMod}"
    printMessageLog messages
    return false
  let commandState := Command.mkState env messages {}
  let s <- Lean.Elab.IO.processCommands inputCtx parserState commandState
  if s.commandState.messages.hasErrors then
    IO.eprintln s!"processCommands failed: {libMod}"
    printMessageLog s.commandState.messages
    return false
  try
    writeModule s.commandState.env oleanPath (writeIR := false)
    pure true
  catch e =>
    IO.eprintln s!"writeModule failed: {libMod} {e.toString}"
    pure false

/-- Flush so ssh / just logs show the named miss before exit. -/
def flushOut : IO Unit := do
  (<- IO.getStdout).flush
  (<- IO.getStderr).flush

/-- Print the named miss. Package remains unowned. -/
def printMiss (why : String) : IO Unit := do
  IO.eprintln s!"slake-typecheck-src-systems RED: miss {why}"
  IO.eprintln "package is not owned"
  IO.eprintln "slakeOwnsPackageTypecheck false"
  IO.eprintln "FullHost false"
  IO.eprintln "occupancy 49 is not lean_lib SystemsLean"
  flushOut

/-- Product walk plan after omit (direct + transitive). -/
structure WalkPlan where
  srcRoot : System.FilePath
  packed : List (Prod String System.FilePath)
  names : List String
  order : List String
  deps : List (Prod String (List String))
  omitDirectN : Nat
  omitTransitiveN : Nat
  transNames : List String

/-- Collect, omit leftover isolation-test / occupancy / barrel, order. -/
def loadWalkPlan : IO (Option WalkPlan) := do
  let srcRoot? <- findLiveSrcRoot
  match srcRoot? with
  | none =>
    printMiss "cannot resolve src/systems (need SystemsLean/Mult.lean)"
    return none
  | some srcRoot =>
    let packedAll <- collectPackageModules srcRoot
    if packedAll.isEmpty then
      printMiss "no on-disk SystemsLean modules"
      return none
    let remaining0 := packedAll.filter (fun p => !isDefaultWalkOmit p.fst)
    let omitDirectN := packedAll.length - remaining0.length
    let mut srcByName : List (Prod String String) := []
    for p in remaining0 do
      let src <-
        try
          IO.FS.readFile p.snd
        catch _ =>
          printMiss s!"{p.fst} unreadable"
          return none
      srcByName := srcByName ++ [(p.fst, src)]
    let directNames :=
      (packedAll.filter (fun p => isDefaultWalkOmit p.fst)).map (fun p => p.fst)
    let closed :=
      closeTransitiveOmit remaining0 srcByName directNames []
    let packed := closed.fst
    let transNames := closed.snd
    if packed.isEmpty then
      printMiss "omit left no product modules"
      return none
    let names := packed.map (fun p => p.fst)
    for p in packed do
      let src :=
        match srcByName.find? (fun q => q.fst == p.fst) with
        | some q => q.snd
        | none => ""
      for imp in importsInSource src do
        if !isPreludeImport imp then
          let inWalk := names.any (fun n => n == imp)
          if !inWalk then
            printMiss s!"{p.fst} imports unowned {imp}"
            return none
    let mut deps : List (Prod String (List String)) := []
    for p in packed do
      let src :=
        match srcByName.find? (fun q => q.fst == p.fst) with
        | some q => q.snd
        | none => ""
      deps := deps ++ [(p.fst, listedImportsInSource src names)]
    let some order := compileOrderAmong names deps
      | do
        printMiss "import cycle among package modules"
        return none
    pure (some {
      srcRoot := srcRoot
      packed := packed
      names := names
      order := order
      deps := deps
      omitDirectN := omitDirectN
      omitTransitiveN := transNames.length
      transNames := transNames
    })

/-- Print omit counts and remaining packageModules. -/
def printWalkCounts (plan : WalkPlan) : IO Unit := do
  IO.println s!"omitDirect={plan.omitDirectN} leftover isolation-test / occupancy living / barrel"
  IO.println s!"omitTransitive={plan.omitTransitiveN}"
  for n in plan.transNames do
    IO.println s!"omitTransitive {n} (listed import of omitted name)"
  IO.println s!"packageModules={plan.names.length}"
  flushOut

/-- Collect+omit only. Exit 1 if omit-class names remain in the walk. -/
def runListCheckIO : IO UInt32 := do
  IO.println "slake-typecheck-src-systems: list-check (collect+omit, no kernel compile)"
  IO.println "slakeOwnsPackageTypecheck false"
  IO.println "FullHost false"
  let plan? <- loadWalkPlan
  match plan? with
  | none => return 1
  | some plan =>
    printWalkCounts plan
    let mut bad : List String := []
    for n in plan.order do
      if isDefaultWalkOmit n then
        bad := bad ++ [n]
    if !bad.isEmpty then
      printMiss "default walk still lists leftover isolation-test / occupancy living / barrel"
      for n in bad do
        IO.eprintln s!"list-check still has {n}"
      flushOut
      return 1
    IO.println "list-check walk names:"
    for n in plan.order do
      IO.println n
    IO.println "list-check GREEN: leftover isolation-test Lean files omitted"
    IO.println "slakeOwnsPackageTypecheck false"
    IO.println "FullHost false"
    flushOut
    return 0

/-- Child: one module into the durable olean dir. Must not spawn. -/
unsafe def runCompileOneIO (n : String) : IO UInt32 := do
  IO.println s!"slake-typecheck-src-systems: compile-one {n}"
  IO.println "slakeOwnsPackageTypecheck false"
  IO.println "FullHost false"
  if isDefaultWalkOmit n then
    printMiss s!"{n} omitted from default product walk"
    return 1
  let srcRoot? <- findLiveSrcRoot
  match srcRoot? with
  | none =>
    printMiss "cannot resolve src/systems (need SystemsLean/Mult.lean)"
    return 1
  | some srcRoot =>
    let packed <- collectPackageModules srcRoot
    let srcPath :=
      match packed.find? (fun p => p.fst == n) with
      | some p => p.snd
      | none => srcRoot / "missing.lean"
    if !(<- srcPath.pathExists) then
      printMiss s!"{n} missing source"
      return 1
    let oleanDir <- resolveOleanDir
    IO.FS.createDirAll oleanDir
    IO.println s!"oleanDir={oleanDir} (durable; never src/systems sources)"
    flushOut
    let prev <- searchPathRef.get
    searchPathRef.set (oleanDir :: prev)
    try
      let modName := String.toName n
      let compiled <- tryCompileOnDiskModuleIO srcPath modName oleanDir
      let olean := Lean.modToFilePath oleanDir modName "olean"
      if !(compiled && (<- olean.pathExists)) then
        printMiss s!"{n} kernel compile failed"
        return 1
      IO.println s!"compile-one GREEN {n}"
      flushOut
      return 0
    finally
      searchPathRef.set prev

/-- Inherit stdio for compile-one children. -/
abbrev inheritStdio : IO.Process.StdioConfig :=
  { stdin := .inherit, stdout := .inherit, stderr := .inherit }

/-- One in-flight --compile-one child. -/
structure CompileChild where
  name : String
  child : IO.Process.Child inheritStdio

/-- In-walk imports only. Omitted names are not listed, so they do not block. -/
def inWalkImportsReady (n : String)
    (deps : List (Prod String (List String)))
    (completed : List String) : Bool :=
  (listedDepsOf n deps).all fun d => completed.any (fun c => c == d)

/-- Spawn the same lean binary as --compile-one. Inherit stdout.
    Child env forces SLAKE_TYPECHECK_JOBS=1 (nested skip; child must not spawn). -/
def spawnCompileOneChild (srcRoot oleanDir : System.FilePath) (n : String) :
    IO (Option CompileChild) := do
  let leanBin <-
    try
      let p <- IO.appPath
      pure p.toString
    catch _ =>
      pure "lean"
  let script := srcRoot / "SystemsLean" / "PackageTypecheck.lean"
  unless (<- script.pathExists) do
    printMiss s!"walker missing {script}"
    return none
  let child <- IO.Process.spawn {
    cmd := leanBin
    args := #[
      "-R", srcRoot.toString,
      "-D", "maxRecDepth=8192",
      "--run", script.toString,
      "--compile-one", n
    ]
    stdin := .inherit
    stdout := .inherit
    stderr := .inherit
    env := #[
      ("SLAKE_PACKAGE_TYPECHECK", some "1"),
      ("SLAKE_OLEAN_DIR", some oleanDir.toString),
      ("SLAKE_TYPECHECK_JOBS", some "1")
    ]
  }
  pure (some { name := n, child := child })

/-- SIGTERM leftover children, then wait so they do not leak. -/
def reapCompileChildren (xs : Array CompileChild) : IO Unit := do
  for inf in xs do
    try
      inf.child.kill
    catch _ =>
      pure ()
  for inf in xs do
    let _ <- inf.child.wait

/-- Wait until any in-flight child exits. -/
partial def waitAnyCompileChild (xs : Array CompileChild) :
    IO (Prod String (Prod UInt32 (Array CompileChild))) := do
  let mut leftover : Array CompileChild := #[]
  let mut found : Option (Prod String UInt32) := none
  for inf in xs do
    match found with
    | some _ => leftover := leftover.push inf
    | none =>
      match <- inf.child.tryWait with
      | some code => found := some (inf.name, code)
      | none => leftover := leftover.push inf
  match found with
  | some p => pure (p.fst, p.snd, leftover)
  | none =>
    IO.sleep 50
    waitAnyCompileChild xs

/-- Ready-queue: spawn up to `jobs` modules whose in-walk imports completed. -/
partial def runReadyQueueIO (plan : WalkPlan) (oleanDir : System.FilePath)
    (jobs : Nat) : IO UInt32 :=
  let total := plan.order.length
  let rec go (pending : List String) (inflight : Array CompileChild)
      (completed : List String) (started : Nat) : IO UInt32 := do
    if pending.isEmpty && inflight.isEmpty then
      IO.println "slake-typecheck-src-systems GREEN: product walk"
      IO.println "slakeOwnsPackageTypecheck false"
      IO.println "FullHost false"
      IO.println "occupancy 49 is not this product walk"
      flushOut
      return 0
    let mut still : List String := []
    let mut inflight' := inflight
    let mut started' := started
    let mut spawnFail : Bool := false
    for n in pending do
      if spawnFail then
        still := still ++ [n]
      else if inflight'.size >= jobs then
        still := still ++ [n]
      else if inWalkImportsReady n plan.deps completed then
        if isDefaultWalkOmit n then
          printMiss s!"{n} omitted from default product walk"
          spawnFail := true
          still := still ++ [n]
        else
          let srcPath :=
            match plan.packed.find? (fun p => p.fst == n) with
            | some p => p.snd
            | none => plan.srcRoot / "missing.lean"
          if !(<- srcPath.pathExists) then
            printMiss s!"{n} missing source"
            spawnFail := true
            still := still ++ [n]
          else
            started' := started' + 1
            IO.println s!"compile {started'}/{total} {n}"
            flushOut
            match <- spawnCompileOneChild plan.srcRoot oleanDir n with
            | none =>
              spawnFail := true
              still := still ++ [n]
            | some ch =>
              inflight' := inflight'.push ch
      else
        still := still ++ [n]
    if spawnFail then
      reapCompileChildren inflight'
      return 1
    if inflight'.isEmpty then
      printMiss "no ready module (in-walk import oleans missing)"
      return 1
    let (n, code, rest) <- waitAnyCompileChild inflight'
    let olean := Lean.modToFilePath oleanDir (String.toName n) "olean"
    if !(code == 0 && (<- olean.pathExists)) then
      printMiss s!"{n} kernel compile failed"
      reapCompileChildren rest
      return 1
    go still rest (completed ++ [n]) started'
  go plan.order #[] [] 0

/-- Parent: omit, order, durable dir, ready-queue compile-one children. -/
def runParentWalkIO : IO UInt32 := do
  IO.println "slake-typecheck-src-systems: Slake kernel walk"
  IO.println "slakeOwnsPackageTypecheck false"
  IO.println "FullHost false"
  let pkgWalk? <- IO.getEnv "SLAKE_PACKAGE_TYPECHECK"
  match pkgWalk? with
  | some "1" =>
    IO.println "SLAKE_PACKAGE_TYPECHECK=1 (library walk; nested live probes skip)"
  | _ =>
    IO.println "SLAKE_PACKAGE_TYPECHECK unset (nested live probes will run)"
  let jobs <- parseTypecheckJobs
  IO.println s!"typecheckJobs={jobs} (SLAKE_TYPECHECK_JOBS; parent walk only)"
  let plan? <- loadWalkPlan
  match plan? with
  | none => return 1
  | some plan =>
    let oleanDir <- resolveOleanDir
    IO.FS.createDirAll oleanDir
    IO.println s!"oleanDir={oleanDir} (durable; never src/systems sources)"
    printWalkCounts plan
    runReadyQueueIO plan oleanDir jobs

unsafe def runPackageTypecheckIO (args : List String) : IO UInt32 := do
  let listCheck <- wantListCheck args
  if listCheck then
    return (<- runListCheckIO)
  match compileOneName args with
  | some n => runCompileOneIO n
  | none => runParentWalkIO

@[implemented_by runPackageTypecheckIO]
opaque runPackageTypecheckIOSafe (args : List String) : IO UInt32

end SystemsLean.PackageTypecheck

/-- lean --run entry. Chunked product walk. slakeOwnsPackageTypecheck false. -/
def main (args : List String) : IO UInt32 :=
  SystemsLean.PackageTypecheck.runPackageTypecheckIOSafe args
"#

end SystemsLean.HostFrontLivePackageTypecheck
