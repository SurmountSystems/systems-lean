/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckDriverIO.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckDriverIOSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckDriverIO.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckDriver.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKDRIVERIO,
  liveHostModuleCheckDriverIOSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKDRIVERIO,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckDriverIOSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckDriverIO

/-- Dual-pinned live HostModuleCheckDriverIO.lean bytes.
    One part. Not split. 81 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckDriverIOSource,
    PARSE-LIVE-HOSTMODULECHECKDRIVERIO. -/
def liveHostModuleCheckDriverIOSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostModuleCheck driver IO helpers (load / print / filter).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split from HostModuleCheckDriver: filterArgs, moduleNameToRel,
  loadAndCheckRealModule, printSurface, loadMultModuleCheck.
  Same namespace SystemsLean.HostModuleCheck. PARTIAL-STRUCTURAL only.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, HostModuleCheckDriverIO,
  loadAndCheckRealModule, loadMultModuleCheck, PARTIAL-STRUCTURAL,
  FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckDriverIO
  Red/green: lake build SystemsLean.HostModuleCheckDriverIO; just systems-host.
  Module must stay ASCII. Not freestanding residual free. Not freestanding emit. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSeeds
import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckRealModule

namespace SystemsLean.HostModuleCheck

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Map seed module name to relative path under library dir. -/
def moduleNameToRel (modName : String) : Option String :=
  if hasPrefix modName "SystemsLean." then
    let rest := String.Slice.toString (modName.drop "SystemsLean.".length)
    some (hostModuleCheckLibraryDirRel ++ "/" ++ rest ++ ".lean")
  else
    none

/-- Load and check one real module from disk.
    Greppable: loadAndCheckRealModule. -/
def loadAndCheckRealModule (root : System.FilePath) (modName : String) :
    IO RealModuleSurface := do
  match moduleNameToRel modName with
  | none =>
    IO.eprintln s!"error: {stageId} not package-local module: {modName}"
    throw (IO.userError "not package-local")
  | some rel =>
    let path := root / rel
    unless (<- path.pathExists) do
      IO.eprintln s!"error: {stageId} {reasonMissingFile}: {path}"
      throw (IO.userError reasonMissingFile)
    let content <- IO.FS.readFile path
    match checkRealModule modName content with
    | ModuleCheckResult.reject reason =>
      IO.eprintln s!"error: {stageId} {modName} reject: {reason}"
      throw (IO.userError reason)
    | ModuleCheckResult.accept surf =>
      pure surf

/-- Print accepted surface summary. -/
def printSurface (surf : RealModuleSurface) : IO Unit := do
  let ns :=
    match surf.namespaceName with
    | none => "(none)"
    | some n => n
  let imps :=
    if surf.imports.isEmpty then "(none)"
    else String.intercalate ", " surf.imports
  let decls := String.intercalate ", " surf.keyDecls
  IO.println s!"    {surf.name} ns={ns} imports={imps}"
  IO.println s!"      decls={decls}"

/-- Load Mult seed modules from disk and check each (fail-closed).
    Greppable: loadMultModuleCheck, HOST-MODULE-CHECK. -/
def loadMultModuleCheck (root : System.FilePath) : IO (List RealModuleSurface) := do
  let mut surfs : List RealModuleSurface := []
  for name in hostModuleCheckSeedModules do
    let surf <- loadAndCheckRealModule root name
    surfs := surfs ++ [surf]
  unless surfs.length == hostModuleCheckSeedModules.length do
    IO.eprintln s!"error: {stageId} {reasonSeedMismatch}: count"
    throw (IO.userError reasonSeedMismatch)
  pure surfs

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckDriverIO
