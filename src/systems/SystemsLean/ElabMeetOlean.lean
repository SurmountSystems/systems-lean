/-
  SYSTEMS_LEAN_HOST partial -- ElabMeet compiled-olean reuse helpers.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from SystemsLean.ElabMeetCompile: olean-reuse
  helpers and the reuse probe command live here so Compile stays
  under the line cap. Same namespace SystemsLean.ElabMeet.

  Spec (readable):
  - tryReuseCompiledOlean compiles a library once, leaves the source
    unchanged, then imports the compiled .olean a second time.
    Accept reuses reuseFromDisk. Reject is a missing compiled
    library .olean.
  - tryCompileReuseOrRebuild skips writeModule when source bytes
    match the last compile. tryRebuildWhenChanged accepts unchanged
    reuse and rebuilds (or fail-closes stale reuse) when source
    bytes change.
  - Follow-imports, follow-import-chain, and cycle-reject probes
    live here so ElabMeet stays under the line cap.
  - tryCompileDependentRebuild compiles a library plus importer,
    reuses the importer when the library is unchanged, and rebuilds
    the importer (or fail-closes a stale artifact) when the library
    source changes.
  - slakeOwnsPackageTypecheck stays false. FullHost stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-ELAB-MEET, SLAKE_ELAB_MEET,
  tryReuseCompiledOlean, tryReuseCompiledOleanPkg,
  tryCompileReuseOrRebuild, tryRebuildWhenChanged,
  tryRebuildWhenChangedPkg, tryCompileReuseOrRebuildDependent,
  tryCompileDependentRebuild, tryCompileDependentRebuildPkg,
  elabMeetDrivesOleanReuse, elabMeetDrivesRebuildWhenChanged,
  elabMeetDrivesDependentRebuild,
  elabMeetAcceptsUnchangedRebuildReuse, elabMeetRejectsStaleRebuild,
  elabMeetAcceptsDependentRebuild, elabMeetRejectsStaleDependent,
  elabMeetDrivesFollowImports, elabMeetDrivesFollowImportChain,
  elabMeetDrivesCycleReject,
  ElabMeetOlean, SystemsLean.ElabMeetOlean,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.ElabMeetOlean
  Short role name (not ProductPathFreestanding*).
  Red/green: lake build SystemsLean.ElabMeetOlean; just systems-host.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not llvm unlock.
  Not FullHostElaborateRemains true. Not Lake gone.
-/

import Lean
import SystemsLean.ElabMeetCompile
import SystemsLean.ElabMeetProbe

namespace SystemsLean.ElabMeet

open Lean Elab Command

/-- Compile a library once, then import the compiled `.olean` without
    rewriting the library source. Accept writes source once, compiles,
    checks the source bytes are unchanged, deletes the `.lean` so the
    second load must use the `.olean`, and elaborates an importer that
    uses `reuseFromDisk`. Reject compiles then deletes the `.olean`
    (source may remain) so the second load fail-closes. Distinct from
    missing source and from library-theorem use.
    Greppable: tryReuseCompiledOlean. -/
unsafe def tryReuseCompiledOleanIO
    (libPath importerPath dir : System.FilePath)
    (libMod : Name) (oleanPresent : Bool) : IO Bool := do
  enableInitializersExecution
  let src0 <-
    try
      IO.FS.readFile libPath
    catch _ =>
      return false
  let compiled <- tryCompileOnDiskModuleIO libPath libMod dir
  if !compiled then
    return false
  let src1 <-
    try
      IO.FS.readFile libPath
    catch _ =>
      return false
  if src1 != src0 then
    return false
  let olean := Lean.modToFilePath dir libMod "olean"
  if !(<- olean.pathExists) then
    return false
  if oleanPresent then
    try
      IO.FS.removeFile libPath
    catch _ =>
      return false
  else
    try
      IO.FS.removeFile olean
    catch _ =>
      return false
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let importer <-
      try
        IO.FS.readFile importerPath
      catch _ =>
        return false
    tryElabImportedModuleStringIO importer
  finally
    searchPathRef.set prev

@[implemented_by tryReuseCompiledOleanIO]
opaque tryReuseCompiledOleanIOSafe
    (libPath importerPath dir : System.FilePath)
    (libMod : Name) (oleanPresent : Bool) : IO Bool

/-- CommandElab wrapper: reuse a compiled `.olean` without rewriting
    source. Greppable: tryReuseCompiledOlean. -/
def tryReuseCompiledOlean
    (libPath importerPath dir : System.FilePath)
    (libMod : Name) (oleanPresent : Bool) : CommandElabM Bool := do
  try
    liftIO (tryReuseCompiledOleanIOSafe
      libPath importerPath dir libMod oleanPresent)
  catch _ =>
    pure false

/-- Write reuse-package files under `dir`, then compile once and
    reuse or drop the `.olean`. Greppable: tryReuseCompiledOleanPkg. -/
def tryReuseCompiledOleanPkg (dir : System.FilePath)
    (libBody impBody : String) (oleanPresent : Bool) : CommandElabM Bool := do
  let libPath := Lean.modToFilePath dir `ElabMeetOleanReuse "lean"
  let impPath := dir / "importer.lean"
  liftIO (IO.FS.writeFile libPath libBody)
  liftIO (IO.FS.writeFile impPath impBody)
  tryReuseCompiledOlean libPath impPath dir `ElabMeetOleanReuse oleanPresent

/-- Record accept / reject for compiled-olean reuse. Accept compiles
    once, does not rewrite source, deletes the `.lean`, and imports
    `reuseFromDisk` from the `.olean`. Reject deletes the compiled
    `.olean` so the second load fail-closes. Distinct from missing
    source and from library-theorem use. -/
elab "#elabMeetOleanReuseProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let good <-
    tryReuseCompiledOleanPkg dirGood
      oleanReuseLibSnippet goodOleanReuseImporterSnippet true
  let bad <-
    tryReuseCompiledOleanPkg dirBad
      oleanReuseLibSnippet goodOleanReuseImporterSnippet false
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
  let gN := mkIdent `elabMeetAcceptsGoodOleanReuse
  let rN := mkIdent `elabMeetRejectsBadOleanReuse
  let dN := mkIdent `elabMeetDrivesOleanReuse
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetOleanReuseProbe

/-- Incremental compile: if the on-disk source still matches `lastSrc`
    and the `.olean` exists, skip `writeModule` and report reused.
    Otherwise compile via `tryCompileOnDiskModuleIO`.
    Returns (ok, reused). Greppable: tryCompileReuseOrRebuild. -/
unsafe def tryCompileReuseOrRebuildIO
    (srcPath : System.FilePath) (libMod : Name)
    (dir : System.FilePath) (lastSrc : String) : IO (Prod Bool Bool) := do
  enableInitializersExecution
  let src <-
    try
      IO.FS.readFile srcPath
    catch _ =>
      return (false, false)
  let olean := Lean.modToFilePath dir libMod "olean"
  if src == lastSrc && (<- olean.pathExists) then
    return (true, true)
  let ok <- tryCompileOnDiskModuleIO srcPath libMod dir
  pure (ok && (<- olean.pathExists), false)

@[implemented_by tryCompileReuseOrRebuildIO]
opaque tryCompileReuseOrRebuildIOSafe
    (srcPath : System.FilePath) (libMod : Name)
    (dir : System.FilePath) (lastSrc : String) : IO (Prod Bool Bool)

/-- CommandElab wrapper: reuse or rebuild from source bytes.
    Greppable: tryCompileReuseOrRebuild. -/
def tryCompileReuseOrRebuild
    (srcPath : System.FilePath) (libMod : Name)
    (dir : System.FilePath) (lastSrc : String) :
    CommandElabM (Prod Bool Bool) := do
  try
    liftIO (tryCompileReuseOrRebuildIOSafe srcPath libMod dir lastSrc)
  catch _ =>
    pure (false, false)

/-- Second compile of unchanged source reuses the `.olean`. Changed
    source refuse stale reuse and rebuild so an importer sees the new
    meaning. Distinct from Name 110 (`.lean` stays) and from missing
    source. Greppable: tryRebuildWhenChanged. -/
unsafe def tryRebuildWhenChangedIO
    (libPath importerPath dir : System.FilePath)
    (libMod : Name) (changeSource : Bool) (srcNext : String) : IO Bool := do
  enableInitializersExecution
  let src0 <-
    try
      IO.FS.readFile libPath
    catch _ =>
      return false
  let compiled <- tryCompileOnDiskModuleIO libPath libMod dir
  if !compiled then
    return false
  let olean := Lean.modToFilePath dir libMod "olean"
  if !(<- olean.pathExists) then
    return false
  let bytes0 <-
    try
      IO.FS.readBinFile olean
    catch _ =>
      return false
  if !changeSource then
    let src1 <-
      try
        IO.FS.readFile libPath
      catch _ =>
        return false
    if src1 != src0 then
      return false
    let pair <- tryCompileReuseOrRebuildIO libPath libMod dir src0
    if !pair.fst || !pair.snd then
      return false
    let bytes1 <-
      try
        IO.FS.readBinFile olean
      catch _ =>
        return false
    if bytes1 != bytes0 then
      return false
    if !(<- libPath.pathExists) then
      return false
    let prev <- searchPathRef.get
    searchPathRef.set (dir :: prev)
    try
      let importer <-
        try
          IO.FS.readFile importerPath
        catch _ =>
          return false
      tryElabImportedModuleStringIO importer
    finally
      searchPathRef.set prev
  else
    try
      IO.FS.writeFile libPath srcNext
    catch _ =>
      return false
    let src1 <-
      try
        IO.FS.readFile libPath
      catch _ =>
        return false
    if src1 == src0 then
      return false
    let prev <- searchPathRef.get
    searchPathRef.set (dir :: prev)
    let staleOk <-
      try
        let importer <-
          try
            IO.FS.readFile importerPath
          catch _ =>
            return false
        tryElabImportedModuleStringIO importer
      finally
        searchPathRef.set prev
    if staleOk then
      return false
    let pair <- tryCompileReuseOrRebuildIO libPath libMod dir src0
    if !pair.fst || pair.snd then
      return false
    if !(<- libPath.pathExists) then
      return false
    let prev2 <- searchPathRef.get
    searchPathRef.set (dir :: prev2)
    try
      let importer <-
        try
          IO.FS.readFile importerPath
        catch _ =>
          return false
      tryElabImportedModuleStringIO importer
    finally
      searchPathRef.set prev2

@[implemented_by tryRebuildWhenChangedIO]
opaque tryRebuildWhenChangedIOSafe
    (libPath importerPath dir : System.FilePath)
    (libMod : Name) (changeSource : Bool) (srcNext : String) : IO Bool

/-- CommandElab wrapper: unchanged reuse or changed rebuild.
    Greppable: tryRebuildWhenChanged. -/
def tryRebuildWhenChanged
    (libPath importerPath dir : System.FilePath)
    (libMod : Name) (changeSource : Bool) (srcNext : String) :
    CommandElabM Bool := do
  try
    liftIO (tryRebuildWhenChangedIOSafe
      libPath importerPath dir libMod changeSource srcNext)
  catch _ =>
    pure false

/-- Write rebuild-when-changed files under `dir`, then compile twice.
    Greppable: tryRebuildWhenChangedPkg. -/
def tryRebuildWhenChangedPkg (dir : System.FilePath)
    (libBody impBody : String) (changeSource : Bool)
    (srcNext : String) : CommandElabM Bool := do
  let libPath := Lean.modToFilePath dir `ElabMeetRebuildWhen "lean"
  let impPath := dir / "importer.lean"
  liftIO (IO.FS.writeFile libPath libBody)
  liftIO (IO.FS.writeFile impPath impBody)
  tryRebuildWhenChanged
    libPath impPath dir `ElabMeetRebuildWhen changeSource srcNext

/-- Record accept / reject for rebuild-when-changed. Accept compiles
    twice with the same source, reuses the `.olean`, and imports
    `rebuildWhen`. Reject changes source bytes, fail-closes stale
    reuse, rebuilds, and imports the new meaning. Distinct from
    deleting `.lean` and from missing-file rejects. -/
elab "#elabMeetRebuildWhenChangedProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let good <-
    tryRebuildWhenChangedPkg dirGood
      rebuildWhenLibSnippet goodRebuildWhenImporterSnippet
      false rebuildWhenLibSnippet
  let bad <-
    tryRebuildWhenChangedPkg dirBad
      rebuildWhenLibSnippet goodRebuildWhenChangedImporterSnippet
      true rebuildWhenChangedLibSnippet
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if bad then `(true) else `(false)
  let dStx <- if good && bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsUnchangedRebuildReuse
  let rN := mkIdent `elabMeetRejectsStaleRebuild
  let dN := mkIdent `elabMeetDrivesRebuildWhenChanged
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetRebuildWhenChangedProbe

/-- Record accept / reject for follow omitted imports.
    Description names only the importer. Accept compiles the omitted
    library first so the importer can use `omitLib`. Reject uses the
    same description with the omitted library file missing.
    Moved here so ElabMeet stays under the line cap. -/
elab "#elabMeetFollowImportsProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let writeImpAndDesc (dir : System.FilePath) : CommandElabM Unit := do
    let impPath := Lean.modToFilePath dir `ElabMeetOmitImp "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile impPath goodFollowImporterSnippet)
    liftIO (IO.FS.writeFile descPath goodFollowDescText)
  writeImpAndDesc dirGood
  let libGood := Lean.modToFilePath dirGood `ElabMeetOmitLib "lean"
  liftIO (IO.FS.writeFile libGood omitLibSnippet)
  writeImpAndDesc dirBad
  let good <- tryCompilePackageDescFollowImports (dirGood / "package.txt") dirGood
  let bad <- tryCompilePackageDescFollowImports (dirBad / "package.txt") dirBad
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
  let gN := mkIdent `elabMeetAcceptsGoodFollowImports
  let rN := mkIdent `elabMeetRejectsBadFollowImports
  let dN := mkIdent `elabMeetDrivesFollowImports
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetFollowImportsProbe

/-- Record accept / reject for a chain of omitted imports.
    Description names only the tip. Accept compiles base then mid
    then the tip so the tip can use `chainMid`. Reject uses the same
    description with the deepest library file missing.
    Moved here so ElabMeet stays under the line cap. -/
elab "#elabMeetFollowImportChainProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let writeTipMidDesc (dir : System.FilePath) : CommandElabM Unit := do
    let tipPath := Lean.modToFilePath dir `ElabMeetChainTip "lean"
    let midPath := Lean.modToFilePath dir `ElabMeetChainMid "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile tipPath goodChainTipSnippet)
    liftIO (IO.FS.writeFile midPath goodChainMidSnippet)
    liftIO (IO.FS.writeFile descPath goodChainDescText)
  writeTipMidDesc dirGood
  let baseGood := Lean.modToFilePath dirGood `ElabMeetChainBase "lean"
  liftIO (IO.FS.writeFile baseGood chainBaseSnippet)
  writeTipMidDesc dirBad
  let good <-
    tryCompilePackageDescFollowImportChain (dirGood / "package.txt") dirGood
  let bad <-
    tryCompilePackageDescFollowImportChain (dirBad / "package.txt") dirBad
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
  let gN := mkIdent `elabMeetAcceptsGoodFollowImportChain
  let rN := mkIdent `elabMeetRejectsBadFollowImportChain
  let dN := mkIdent `elabMeetDrivesFollowImportChain
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetFollowImportChainProbe

/-- Record accept / reject for a cycle of omitted imports.
    Description names only the tip. Accept compiles omitted mid
    (plain library `cycleLib`, no import of tip). Reject uses the
    same description when mid imports the tip (cycle fail-close).
    Distinct from missing omitted library and missing deepest
    library. Must not loop. Moved here so ElabMeet stays under
    the line cap. -/
elab "#elabMeetCycleRejectProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let writeTipAndDesc (dir : System.FilePath) : CommandElabM Unit := do
    let tipPath := Lean.modToFilePath dir `ElabMeetCycleTip "lean"
    let descPath := dir / "package.txt"
    liftIO (IO.FS.writeFile tipPath goodCycleTipSnippet)
    liftIO (IO.FS.writeFile descPath goodCycleDescText)
  writeTipAndDesc dirGood
  let midGood := Lean.modToFilePath dirGood `ElabMeetCycleMid "lean"
  liftIO (IO.FS.writeFile midGood cycleMidLibSnippet)
  writeTipAndDesc dirBad
  let midBad := Lean.modToFilePath dirBad `ElabMeetCycleMid "lean"
  liftIO (IO.FS.writeFile midBad badCycleMidSnippet)
  let good <-
    tryCompilePackageDescCycleReject (dirGood / "package.txt") dirGood
  let bad <-
    tryCompilePackageDescCycleReject (dirBad / "package.txt") dirBad
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
  let gN := mkIdent `elabMeetAcceptsGoodCycleReject
  let rN := mkIdent `elabMeetRejectsBadCycleReject
  let dN := mkIdent `elabMeetDrivesCycleReject
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetCycleRejectProbe

/-- Incremental compile of an importer that depends on a library.
    Reuse only when BOTH importer source and library source still
    match the last compile and the importer `.olean` exists.
    Distinct from Name 111 (that path only checks THIS module).
    Returns (ok, reused). Greppable: tryCompileReuseOrRebuildDependent. -/
unsafe def tryCompileReuseOrRebuildDependentIO
    (impPath : System.FilePath) (impMod : Name)
    (dir libPath : System.FilePath)
    (lastImpSrc lastLibSrc : String) : IO (Prod Bool Bool) := do
  enableInitializersExecution
  let impSrc <-
    try
      IO.FS.readFile impPath
    catch _ =>
      return (false, false)
  let libSrc <-
    try
      IO.FS.readFile libPath
    catch _ =>
      return (false, false)
  let olean := Lean.modToFilePath dir impMod "olean"
  if impSrc == lastImpSrc && libSrc == lastLibSrc && (<- olean.pathExists) then
    return (true, true)
  let prev <- searchPathRef.get
  searchPathRef.set (dir :: prev)
  try
    let ok <- tryCompileOnDiskModuleIO impPath impMod dir
    pure (ok && (<- olean.pathExists), false)
  finally
    searchPathRef.set prev

@[implemented_by tryCompileReuseOrRebuildDependentIO]
opaque tryCompileReuseOrRebuildDependentIOSafe
    (impPath : System.FilePath) (impMod : Name)
    (dir libPath : System.FilePath)
    (lastImpSrc lastLibSrc : String) : IO (Prod Bool Bool)

/-- CommandElab wrapper: reuse or rebuild an importer when a library
    may have changed. Greppable: tryCompileReuseOrRebuildDependent. -/
def tryCompileReuseOrRebuildDependent
    (impPath : System.FilePath) (impMod : Name)
    (dir libPath : System.FilePath)
    (lastImpSrc lastLibSrc : String) :
    CommandElabM (Prod Bool Bool) := do
  try
    liftIO (tryCompileReuseOrRebuildDependentIOSafe
      impPath impMod dir libPath lastImpSrc lastLibSrc)
  catch _ =>
    pure (false, false)

/-- Compile a library plus importer, then either reuse the importer
    when the library is unchanged or fail-close a stale importer
    artifact and rebuild both so the importer sees the new library.
    Distinct from Name 111 (no dependent) and Name 110 (`.lean` stays).
    Greppable: tryCompileDependentRebuild. -/
unsafe def tryCompileDependentRebuildIO
    (libPath importerPath checkPath dir : System.FilePath)
    (libMod impMod : Name) (changeLib : Bool) (srcNext : String) : IO Bool := do
  enableInitializersExecution
  let src0 <-
    try
      IO.FS.readFile libPath
    catch _ =>
      return false
  let compiled <- tryCompileOnDiskModuleIO libPath libMod dir
  if !compiled then
    return false
  let libOlean := Lean.modToFilePath dir libMod "olean"
  if !(<- libOlean.pathExists) then
    return false
  let prev0 <- searchPathRef.get
  searchPathRef.set (dir :: prev0)
  let impOk <-
    try
      tryCompileOnDiskModuleIO importerPath impMod dir
    finally
      searchPathRef.set prev0
  if !impOk then
    return false
  let importerOlean := Lean.modToFilePath dir impMod "olean"
  if !(<- importerOlean.pathExists) then
    return false
  let impSrc0 <-
    try
      IO.FS.readFile importerPath
    catch _ =>
      return false
  let impBytes0 <-
    try
      IO.FS.readBinFile importerOlean
    catch _ =>
      return false
  if !changeLib then
    let pair <-
      tryCompileReuseOrRebuildDependentIO
        importerPath impMod dir libPath impSrc0 src0
    if !pair.fst || !pair.snd then
      return false
    let impBytes1 <-
      try
        IO.FS.readBinFile importerOlean
      catch _ =>
        return false
    if impBytes1 != impBytes0 then
      return false
    if !(<- importerPath.pathExists) then
      return false
    if !(<- libPath.pathExists) then
      return false
    let prev <- searchPathRef.get
    searchPathRef.set (dir :: prev)
    try
      let importer <-
        try
          IO.FS.readFile importerPath
        catch _ =>
          return false
      tryElabImportedModuleStringIO importer
    finally
      searchPathRef.set prev
  else
    try
      IO.FS.writeFile libPath srcNext
    catch _ =>
      return false
    let src1 <-
      try
        IO.FS.readFile libPath
      catch _ =>
        return false
    if src1 == src0 then
      return false
    let prev <- searchPathRef.get
    searchPathRef.set (dir :: prev)
    let staleOk <-
      try
        let check <-
          try
            IO.FS.readFile checkPath
          catch _ =>
            return false
        tryElabImportedModuleStringIO check
      finally
        searchPathRef.set prev
    if staleOk then
      return false
    let libPair <- tryCompileReuseOrRebuildIO libPath libMod dir src0
    if !libPair.fst || libPair.snd then
      return false
    let impPair <-
      tryCompileReuseOrRebuildDependentIO
        importerPath impMod dir libPath impSrc0 src0
    if !impPair.fst || impPair.snd then
      return false
    if !(<- importerPath.pathExists) then
      return false
    if !(<- libPath.pathExists) then
      return false
    let prev2 <- searchPathRef.get
    searchPathRef.set (dir :: prev2)
    try
      let check <-
        try
          IO.FS.readFile checkPath
        catch _ =>
          return false
      tryElabImportedModuleStringIO check
    finally
      searchPathRef.set prev2

@[implemented_by tryCompileDependentRebuildIO]
opaque tryCompileDependentRebuildIOSafe
    (libPath importerPath checkPath dir : System.FilePath)
    (libMod impMod : Name) (changeLib : Bool) (srcNext : String) : IO Bool

/-- CommandElab wrapper: dependent reuse or library-change rebuild.
    Greppable: tryCompileDependentRebuild. -/
def tryCompileDependentRebuild
    (libPath importerPath checkPath dir : System.FilePath)
    (libMod impMod : Name) (changeLib : Bool) (srcNext : String) :
    CommandElabM Bool := do
  try
    liftIO (tryCompileDependentRebuildIOSafe
      libPath importerPath checkPath dir libMod impMod changeLib srcNext)
  catch _ =>
    pure false

/-- Write library, importer, and check files under `dir`, then compile.
    Greppable: tryCompileDependentRebuildPkg. -/
def tryCompileDependentRebuildPkg (dir : System.FilePath)
    (libBody impBody checkBody : String)
    (changeLib : Bool) (srcNext : String) : CommandElabM Bool := do
  let libPath := Lean.modToFilePath dir `ElabMeetDepLib "lean"
  let impPath := Lean.modToFilePath dir `ElabMeetDepImp "lean"
  let checkPath := dir / "check.lean"
  liftIO (IO.FS.writeFile libPath libBody)
  liftIO (IO.FS.writeFile impPath impBody)
  liftIO (IO.FS.writeFile checkPath checkBody)
  tryCompileDependentRebuild
    libPath impPath checkPath dir
    `ElabMeetDepLib `ElabMeetDepImp changeLib srcNext

/-- Record accept / reject for dependent rebuild. Accept compiles a
    library plus importer, leaves the library unchanged, reuses the
    importer `.olean`, and still uses `depLib`. Reject changes the
    library source, fail-closes `example : depLib = 4 := rfl` on the
    stale library `.olean`, rebuilds the library then the importer
    (importer source unchanged, so Name 111 would reuse), and accepts
    the same check. Distinct from Name 111 and from deleting `.lean`. -/
elab "#elabMeetDependentRebuildProbe" : command => do
  let dirGood <- liftIO IO.FS.createTempDir
  let dirBad <- liftIO IO.FS.createTempDir
  let good <-
    tryCompileDependentRebuildPkg dirGood
      depLibSnippet goodDepLibImporterSnippet
      goodDepLibImporterSnippet
      false depLibSnippet
  let bad <-
    tryCompileDependentRebuildPkg dirBad
      depLibSnippet goodDepLibImporterSnippet
      goodDepLibChangedImporterSnippet
      true depLibChangedSnippet
  try
    liftIO (IO.FS.removeDirAll dirGood)
  catch _ =>
    pure ()
  try
    liftIO (IO.FS.removeDirAll dirBad)
  catch _ =>
    pure ()
  let gStx <- if good then `(true) else `(false)
  let rStx <- if bad then `(true) else `(false)
  let dStx <- if good && bad then `(true) else `(false)
  let gN := mkIdent `elabMeetAcceptsDependentRebuild
  let rN := mkIdent `elabMeetRejectsStaleDependent
  let dN := mkIdent `elabMeetDrivesDependentRebuild
  elabCommand (<- `(def $gN : Bool := $gStx))
  elabCommand (<- `(def $rN : Bool := $rStx))
  elabCommand (<- `(def $dN : Bool := $dStx))

#elabMeetDependentRebuildProbe

/-- Same theorem as the observed red: dependent rebuild drive is true. -/
theorem elabMeetDrivesDependentRebuild_true :
    elabMeetDrivesDependentRebuild = true := by
  native_decide

end SystemsLean.ElabMeet

