/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph driver IO (runImportGraph / main).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphDriver,
  loadMultImportGraph, runImportGraph, filterArgs, printOrder,
  slake-host-import-graph, just host-import-graph.
  Module: SystemsLean.HostImportGraphDriver
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphDriver; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphLoadOk
import SystemsLean.HostImportGraphWalk
namespace SystemsLean.HostImportGraph
/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Map seed module name to relative path under library dir. -/
def moduleNameToRel (modName : String) : Option String :=
  if hasPrefix modName "SystemsLean." then
    let rest := String.Slice.toString (modName.drop "SystemsLean.".length)
    -- Dotted remainder becomes path segments; seed uses single segment only.
    some (hostImportGraphLibraryDirRel ++ "/" ++ rest ++ ".lean")
  else
    none

/-- Load one real module from disk (parse package-local imports; seed-local filter). -/
def loadRealMod (root : System.FilePath) (modName : String) : IO RealMod := do
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
    let imps :=
      filterSeedImports hostImportGraphSeedModules (extractImports content)
    pure { name := modName, imports := imps }

/-- Load Mult seed set from disk and resolve.
    Greppable: loadMultImportGraph, HOST-IMPORT-GRAPH. -/
def loadMultImportGraph (root : System.FilePath) : IO (List RealMod) := do
  let mut mods : List RealMod := []
  for name in hostImportGraphSeedModules do
    let m <- loadRealMod root name
    mods := mods ++ [m]
  -- Dual-pin seed size honesty.
  unless mods.length == hostImportGraphSeedModules.length do
    IO.eprintln s!"error: {stageId} {reasonSeedMismatch}: count"
    throw (IO.userError reasonSeedMismatch)
  pure mods

/-- Print ordered module names and their imports. -/
def printOrder (order : List RealMod) : IO Unit := do
  IO.println "  order:"
  for m in order do
    let imps :=
      if m.imports.isEmpty then "(none)"
      else String.intercalate ", " m.imports
    IO.println s!"    {m.name} <- {imps}"

/-- Run measured real Mult..Compose+Erasure/Extract import graph.
    Dual evidence: pins + walk.
    Greppable: runImportGraph, HOST-IMPORT-GRAPH,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE, Host real module seed expand. -/
def runImportGraph (root : System.FilePath) : IO Unit := do
  let seedLabel := hostImportGraphSeedUnitsLabel
  IO.println s!"== {stageId}: real Mult..Compose+Erasure/Extract import graph =="
  IO.println s!"  surface={surfaceId} host={hostId} residual={residualName}"
  IO.println s!"  expand={hostImportGraphExpandSliceName} seed={seedLabel}"
  IO.println s!"  structuralReady={hostImportGraphReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  IO.println s!"  hostResidual={hostImportGraphHostElaboratorResidualRemains} withoutLake={hostImportGraphWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostImportGraphWithoutLakeReady} keepsHostLake={hostImportGraphWithoutLakeKeepsHostLake}"
  unless hostImportGraphReady do
    IO.eprintln s!"error: {stageId} hostImportGraphReady false"
    throw (IO.userError "hostImportGraphReady false")
  unless hostImportGraphFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostImportGraphFinishedClaimed false"
    throw (IO.userError "hostImportGraphFinishedClaimed false")
  unless hostImportGraphWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostImportGraphWithoutLakeFinished false"
    throw (IO.userError "hostImportGraphWithoutLakeFinished false")
  unless hostImportGraphWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostImportGraphWithoutLakeReady false"
    throw (IO.userError "hostImportGraphWithoutLakeReady false")
  -- Fail-closed structural smoke (no disk).
  unless hostImportGraphBadMissing.isRejectWith reasonMissingImport do
    IO.eprintln s!"error: {stageId} expected {reasonMissingImport} on bad missing"
    throw (IO.userError "bad missing not fail-closed")
  unless hostImportGraphBadCycle.isRejectWith reasonImportCycle do
    IO.eprintln s!"error: {stageId} expected {reasonImportCycle} on bad cycle"
    throw (IO.userError "bad cycle not fail-closed")
  unless hostImportGraphGoodExpandSeed.isAccept do
    IO.eprintln s!"error: {stageId} expand seed structural accept failed"
    throw (IO.userError "expand seed")
  IO.println s!"  failClosed: {reasonMissingImport} + {reasonImportCycle} ok"
  -- On-disk Mult..Compose+Erasure/Extract expand seed walk.
  let mods <- loadMultImportGraph root
  match resolveImportGraph mods with
  | ImportGraphResult.reject reason =>
    IO.eprintln s!"error: {stageId} resolve reject: {reason}"
    for m in mods do
      IO.eprintln s!"  loaded {m.name} imports={m.imports}"
    throw (IO.userError reason)
  | ImportGraphResult.accept order =>
    unless order.length == hostImportGraphSeedModules.length do
      IO.eprintln s!"error: {stageId} expected order length {hostImportGraphSeedModules.length} got {order.length}"
      throw (IO.userError "order length")
    -- Required nodes and edges for expand seed.
    checkImportOrderEdges order
    printOrder order
    IO.println s!"GREEN {stageId}: seed {seedLabel} modules={order.length}; expand={hostImportGraphExpandSliceName}; withoutLake finished; host residual remains"

/-- CLI: real Mult import graph. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runImportGraph root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1
end SystemsLean.HostImportGraph
