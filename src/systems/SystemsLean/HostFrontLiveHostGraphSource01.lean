/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostGraph.lean bytes, second half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostGraphSource01. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-GRAPH, liveHostGraphSource1,
  HOST-FRONT-LIVE-HOST-GRAPH, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostGraphSource01
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostGraph

/-- Dual-pinned live HostGraph.lean bytes, second half.
    Concatenate liveHostGraphSource0 then liveHostGraphSource1 before parse.
    Greppable: liveHostGraphSource1, PARSE-LIVE-HOST-GRAPH. -/
def liveHostGraphSource1 : String := r##"/-- Expanded Mult-first import set including Linear companion (names only).
    Greppable: documentedExpandImportClosure, hostGraphGoodLinearExpand. -/
def documentedExpandImportClosure : List String :=
  ["Mult", "MultSubsetEmit", "Linear"]

/-- Expanded import set including Types companion after Linear (names only).
    Greppable: documentedTypesExpandImportClosure, hostGraphGoodTypesExpand. -/
def documentedTypesExpandImportClosure : List String :=
  ["Mult", "MultSubsetEmit", "Linear", "Types"]

/-- Expanded import set including Program companion after Types (names only).
    Greppable: documentedProgramExpandImportClosure, hostGraphGoodProgramExpand. -/
def documentedProgramExpandImportClosure : List String :=
  ["Mult", "MultSubsetEmit", "Linear", "Types", "Program"]

/-- Expanded import set including Graph companion after Program (names only).
    Greppable: documentedGraphExpandImportClosure, hostGraphGoodGraphExpand. -/
def documentedGraphExpandImportClosure : List String :=
  ["Mult", "MultSubsetEmit", "Linear", "Types", "Program", "Graph"]

/-- Expanded import set including Compose companion after Graph (names only).
    Greppable: documentedComposeExpandImportClosure, hostGraphGoodComposeExpand. -/
def documentedComposeExpandImportClosure : List String :=
  ["Mult", "MultSubsetEmit", "Linear", "Types", "Program", "Graph", "Compose"]

/-! ### Structural golden pins (embedded dual-pinned strings) -/

/-- Good Mult + MultSubsetEmit closure accepts with topo Mult then MultSubsetEmit.
    Greppable: hostGraphGoodClosure. -/
def hostGraphGoodClosure : Bool :=
  let r := resolveSources [multText, multSubsetEmitText]
  r.isAccept
    && r.acceptCount == 2
    && (match r with
        | GraphResult.accept order =>
          match order with
          | m0 :: m1 :: [] =>
            m0.name.raw == "Mult"
              && m1.name.raw == "MultSubsetEmit"
              && (moduleImports m0).isEmpty
              && (moduleImports m1).any (fun n => n.raw == "Mult")
          | _ => false
        | _ => false)

/-- Single-file missing import rejects.
    Greppable: hostGraphBadMissing, MISSING-IMPORT. -/
def hostGraphBadMissing : Bool :=
  (resolveSources [badMissingText]).isRejectWith reasonMissingImport

/-- Two-file cycle rejects.
    Greppable: hostGraphBadCycle, IMPORT-CYCLE. -/
def hostGraphBadCycle : Bool :=
  (resolveSources [badCycleAText, badCycleBText]).isRejectWith reasonImportCycle

/-- Good Mult leaf alone accepts (no imports).
    Greppable: hostGraphGoodMultLeaf. -/
def hostGraphGoodMultLeaf : Bool :=
  let r := resolveSources [multText]
  r.isAccept && r.acceptCount == 1

/-- Expand: Mult + MultSubsetEmit + Linear multi-file accepts.
    Topo: Mult first, then MultSubsetEmit and Linear (both depend on Mult).
    Greppable: hostGraphGoodLinearExpand, LINEAR-EXACT-ONCE. -/
def hostGraphGoodLinearExpand : Bool :=
  let r := resolveSources [multText, multSubsetEmitText, linearText]
  r.isAccept
    && r.acceptCount == 3
    && (match r with
        | GraphResult.accept order =>
          match order with
          | m0 :: rest =>
            m0.name.raw == "Mult"
              && (moduleImports m0).isEmpty
              && rest.length == 2
              && rest.all fun m =>
                (m.name.raw == "MultSubsetEmit" || m.name.raw == "Linear")
                  && (moduleImports m).any (fun n => n.raw == "Mult")
          | _ => false
        | _ => false)

/-- Expand: Mult + MultSubsetEmit + Linear + Types multi-file accepts.
    Topo: Mult first; MultSubsetEmit, Linear, Types depend on Mult.
    Greppable: hostGraphGoodTypesExpand, TYPED_IR_V0, typesText. -/
def hostGraphGoodTypesExpand : Bool :=
  let r := resolveSources [multText, multSubsetEmitText, linearText, typesText]
  r.isAccept
    && r.acceptCount == 4
    && (match r with
        | GraphResult.accept order =>
          match order with
          | m0 :: rest =>
            m0.name.raw == "Mult"
              && (moduleImports m0).isEmpty
              && rest.length == 3
              && rest.all fun m =>
                (m.name.raw == "MultSubsetEmit"
                    || m.name.raw == "Linear"
                    || m.name.raw == "Types")
                  && (moduleImports m).any (fun n => n.raw == "Mult")
          | _ => false
        | _ => false)

/-- Expand: Mult + MultSubsetEmit + Linear + Types + Program multi-file accepts.
    Topo: Mult first; companions depend on Mult.
    Greppable: hostGraphGoodProgramExpand, IR_PROGRAM_V0, programText. -/
def hostGraphGoodProgramExpand : Bool :=
  let r := resolveSources
    [multText, multSubsetEmitText, linearText, typesText, programText]
  r.isAccept
    && r.acceptCount == 5
    && (match r with
        | GraphResult.accept order =>
          match order with
          | m0 :: rest =>
            m0.name.raw == "Mult"
              && (moduleImports m0).isEmpty
              && rest.length == 4
              && rest.all fun m =>
                (m.name.raw == "MultSubsetEmit"
                    || m.name.raw == "Linear"
                    || m.name.raw == "Types"
                    || m.name.raw == "Program")
                  && (moduleImports m).any (fun n => n.raw == "Mult")
          | _ => false
        | _ => false)

/-- Expand: Mult + MultSubsetEmit + Linear + Types + Program + Graph multi-file.
    Topo: Mult first; companions depend on Mult.
    Greppable: hostGraphGoodGraphExpand, IR_GRAPH_EDGES_V0, graphText. -/
def hostGraphGoodGraphExpand : Bool :=
  let r := resolveSources
    [multText, multSubsetEmitText, linearText, typesText, programText,
      graphText]
  r.isAccept
    && r.acceptCount == 6
    && (match r with
        | GraphResult.accept order =>
          match order with
          | m0 :: rest =>
            m0.name.raw == "Mult"
              && (moduleImports m0).isEmpty
              && rest.length == 5
              && rest.all fun m =>
                (m.name.raw == "MultSubsetEmit"
                    || m.name.raw == "Linear"
                    || m.name.raw == "Types"
                    || m.name.raw == "Program"
                    || m.name.raw == "Graph")
                  && (moduleImports m).any (fun n => n.raw == "Mult")
          | _ => false
        | _ => false)

/-- Expand: Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose.
    Topo: Mult first; companions depend on Mult.
    Greppable: hostGraphGoodComposeExpand, HOST_COMPOSE_V0, composeText. -/
def hostGraphGoodComposeExpand : Bool :=
  let r := resolveSources
    [multText, multSubsetEmitText, linearText, typesText, programText,
      graphText, composeText]
  r.isAccept
    && r.acceptCount == 7
    && (match r with
        | GraphResult.accept order =>
          match order with
          | m0 :: rest =>
            m0.name.raw == "Mult"
              && (moduleImports m0).isEmpty
              && rest.length == 6
              && rest.all fun m =>
                (m.name.raw == "MultSubsetEmit"
                    || m.name.raw == "Linear"
                    || m.name.raw == "Types"
                    || m.name.raw == "Program"
                    || m.name.raw == "Graph"
                    || m.name.raw == "Compose")
                  && (moduleImports m).any (fun n => n.raw == "Mult")
          | _ => false
        | _ => false)

/-- Documented closure names match good graph (package subset).
    Greppable: hostGraphClosureDocumented. -/
def hostGraphClosureDocumented : Bool :=
  documentedImportClosure.length == 2
    && documentedImportClosure.head? == some "Mult"
    && documentedImportClosure.getLast? == some "MultSubsetEmit"
    && hostGraphGoodClosure

/-- Documented expand closure includes Linear companion.
    Greppable: hostGraphExpandClosureDocumented. -/
def hostGraphExpandClosureDocumented : Bool :=
  documentedExpandImportClosure.length == 3
    && documentedExpandImportClosure.head? == some "Mult"
    && documentedExpandImportClosure.getLast? == some "Linear"
    && hostGraphGoodLinearExpand

/-- Documented Types expand closure includes Types companion after Linear.
    Greppable: hostGraphTypesExpandClosureDocumented. -/
def hostGraphTypesExpandClosureDocumented : Bool :=
  documentedTypesExpandImportClosure.length == 4
    && documentedTypesExpandImportClosure.head? == some "Mult"
    && documentedTypesExpandImportClosure.getLast? == some "Types"
    && hostGraphGoodTypesExpand

/-- Documented Program expand closure includes Program companion after Types.
    Greppable: hostGraphProgramExpandClosureDocumented. -/
def hostGraphProgramExpandClosureDocumented : Bool :=
  documentedProgramExpandImportClosure.length == 5
    && documentedProgramExpandImportClosure.head? == some "Mult"
    && documentedProgramExpandImportClosure.getLast? == some "Program"
    && hostGraphGoodProgramExpand

/-- Documented Graph expand closure includes Graph companion after Program.
    Greppable: hostGraphGraphExpandClosureDocumented. -/
def hostGraphGraphExpandClosureDocumented : Bool :=
  documentedGraphExpandImportClosure.length == 6
    && documentedGraphExpandImportClosure.head? == some "Mult"
    && documentedGraphExpandImportClosure.getLast? == some "Graph"
    && hostGraphGoodGraphExpand

/-- Documented Compose expand closure includes Compose companion after Graph.
    Greppable: hostGraphComposeExpandClosureDocumented. -/
def hostGraphComposeExpandClosureDocumented : Bool :=
  documentedComposeExpandImportClosure.length == 7
    && documentedComposeExpandImportClosure.head? == some "Mult"
    && documentedComposeExpandImportClosure.getLast? == some "Compose"
    && hostGraphGoodComposeExpand

/-- All structural graph goldens ready.
    Greppable: hostGraphGoldensStructuralOk. -/
def hostGraphGoldensStructuralOk : Bool :=
  hostGraphGoodClosure
    && hostGraphGoodMultLeaf
    && hostGraphGoodLinearExpand
    && hostGraphGoodTypesExpand
    && hostGraphGoodProgramExpand
    && hostGraphGoodGraphExpand
    && hostGraphGoodComposeExpand
    && hostGraphBadMissing
    && hostGraphBadCycle
    && hostGraphClosureDocumented
    && hostGraphExpandClosureDocumented
    && hostGraphTypesExpandClosureDocumented
    && hostGraphProgramExpandClosureDocumented
    && hostGraphGraphExpandClosureDocumented
    && hostGraphComposeExpandClosureDocumented

/-- Stage / exe / recipe identity pin. -/
def hostGraphIdsOk : Bool :=
  (stageId == "SLAKE_HOST_GRAPH_V0")
    && (hostId == "HOST-GRAPH")
    && (surfaceId == "HOST-GRAPH")
    && (surfaceAlias == "HOST-HOST-GRAPH")
    && (lakeExeName == "slake-host-graph")
    && (justRecipe == "host-graph")
    && (justRecipeWithoutLake == "host-graph-without-lake")
    && (prebuiltHostGraphRel == ".lake/build/bin/slake-host-graph")
    && (goldensRel == "src/systems/goldens/host-graph")

/-- Front-end surface still ready (graph builds on HostFront). -/
def hostGraphReusesHostFront : Bool := hostFrontReady

/-- Without-Lake measured step keeps host Lake bootstrap (not host free).
    Greppable: hostGraphWithoutLakeKeepsHostLake, HOST-GRAPH-WITHOUT-LAKE. -/
def hostGraphWithoutLakeKeepsHostLake : Bool :=
  hostGraphWithoutLakeFinished
    && stillUsesLake
    && dependsOnLake
    && hostGraphHostElaboratorResidualRemains

/-- End-to-end host fragment module graph ready.
    Greppable: hostGraphReady, HOST-GRAPH, SLAKE_HOST_GRAPH_V0. -/
def hostGraphReady : Bool :=
  hostGraphGoldensStructuralOk
    && hostGraphIdsOk
    && hostGraphReusesHostFront
    && stillUsesLake
    && dependsOnLake
    && hostGraphStillUsesLake
    && hostGraphDependsOnLake
    && hostGraphHostElaboratorResidualRemains
    && hostGraphDoesNotClaimPeerGreen
    && !hostGraphResidualFreeClaimed
    && !hostGraphProductSelfHostCompleteClaimed
    && !hostGraphProofCompleteClaimed
    && !hostGraphLlvmUnlocked
    && !hostGraphProvablyUnlocked

/-- Without-Lake measured graph surface ready (prebuilt hot path + corpus).
    Greppable: hostGraphWithoutLakeReady, HOST-GRAPH-WITHOUT-LAKE. -/
def hostGraphWithoutLakeReady : Bool :=
  hostGraphReady
    && hostGraphWithoutLakeFinished
    && hostGraphWithoutLakeKeepsHostLake
    && (justRecipeWithoutLake == "host-graph-without-lake")
    && (prebuiltHostGraphRel == ".lake/build/bin/slake-host-graph")

/-- Finished claim: measured multi-file graph surface ready.
    Greppable: hostGraphFinishedClaimed. -/
def hostGraphFinishedClaimed : Bool := hostGraphReady

/-- Ready does not claim peer elaborator green.
    Greppable: hostGraphDoesNotClaimPeer. -/
def hostGraphDoesNotClaimPeer : Bool :=
  hostGraphReady && hostGraphDoesNotClaimPeerGreen

/-- Ready keeps host elaborator residual honesty.
    Greppable: hostGraphKeepsHostResidual. -/
def hostGraphKeepsHostResidual : Bool :=
  hostGraphReady && hostGraphHostElaboratorResidualRemains

/-- Ready is not product residual free claim.
    Greppable: hostGraphDoesNotMeanResidualFree. -/
def hostGraphDoesNotMeanResidualFree : Bool :=
  hostGraphReady && !hostGraphResidualFreeClaimed

/-! ### Driver (short banners only; AGENTS driver stdout policy)
    Theorems/smoke: SystemsLean.HostGraphTheorems (same namespace). -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Require file exists. -/
def requireFile (path : System.FilePath) (label : String) : IO Unit := do
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {label}: {path}"
    throw (IO.userError s!"missing {label}")

/-- Read file and dual-pin against expected Lean constant text. -/
def readDualPin (path : System.FilePath) (expected : String) (label : String) :
    IO String := do
  requireFile path label
  let disk <- IO.FS.readFile path
  if disk != expected then
    IO.eprintln s!"error: dual-pin mismatch {label}: on-disk != Lean constant"
    throw (IO.userError s!"dual-pin mismatch {label}")
  pure disk

/-- Run multi-file graph golden suite under repo root.
    Dual evidence: files + Lean pins. Greppable: runGraphSuite, HOST-GRAPH. -/
def runGraphSuite (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: Mult-first host fragment module graph =="
  IO.println s!"  surface={surfaceId} host={hostId} goldens={goldensRel}"
  IO.println s!"  graphReady={hostGraphReady} finished={hostGraphFinishedClaimed}"
  IO.println s!"  hostResidual={hostGraphHostElaboratorResidualRemains} withoutLake={hostGraphWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostGraphWithoutLakeReady} keepsHostLake={hostGraphWithoutLakeKeepsHostLake}"
  IO.println s!"  closure={documentedImportClosure}"
  let gdir := root / goldensRel
  requireFile gdir "goldens directory"
  let multDisk <- readDualPin (gdir / multFile) multText "mult"
  let mseDisk <-
    readDualPin (gdir / multSubsetEmitFile) multSubsetEmitText "mult-subset-emit"
  let linDisk <- readDualPin (gdir / linearFile) linearText "linear"
  let typDisk <- readDualPin (gdir / typesFile) typesText "types"
  let progDisk <- readDualPin (gdir / programFile) programText "program"
  let graphDisk <- readDualPin (gdir / graphFile) graphText "graph"
  let composeDisk <- readDualPin (gdir / composeFile) composeText "compose"
  let missDisk <-
    readDualPin (gdir / badMissingFile) badMissingText "bad-missing-import"
  let cycADisk <-
    readDualPin (gdir / badCycleAFile) badCycleAText "bad-cycle-a"
  let cycBDisk <-
    readDualPin (gdir / badCycleBFile) badCycleBText "bad-cycle-b"
  -- Good multi-file Mult + MultSubsetEmit closure (package write subset).
  let good := resolveSources [multDisk, mseDisk]
  unless good.isAccept do
    IO.eprintln s!"error: good Mult+MultSubsetEmit closure rejected"
    throw (IO.userError "good closure reject")
  unless good.acceptCount == 2 do
    IO.eprintln s!"error: good closure expected 2 modules, got {good.acceptCount}"
    throw (IO.userError "good closure count")
  IO.println s!"PASS good-closure ACCEPT order=Mult,MultSubsetEmit count=2"
  -- Expand: Mult + MultSubsetEmit + Linear.
  let expand := resolveSources [multDisk, mseDisk, linDisk]
  unless expand.isAccept do
    IO.eprintln s!"error: Mult+MultSubsetEmit+Linear expand rejected"
    throw (IO.userError "linear expand reject")
  unless expand.acceptCount == 3 do
    IO.eprintln s!"error: expand expected 3 modules, got {expand.acceptCount}"
    throw (IO.userError "linear expand count")
  IO.println s!"PASS good-linear-expand ACCEPT Mult+MultSubsetEmit+Linear count=3"
  -- Expand: Mult + MultSubsetEmit + Linear + Types.
  let typesExpand := resolveSources [multDisk, mseDisk, linDisk, typDisk]
  unless typesExpand.isAccept do
    IO.eprintln s!"error: Mult+MultSubsetEmit+Linear+Types expand rejected"
    throw (IO.userError "types expand reject")
  unless typesExpand.acceptCount == 4 do
    IO.eprintln s!"error: types expand expected 4 modules, got {typesExpand.acceptCount}"
    throw (IO.userError "types expand count")
  IO.println s!"PASS good-types-expand ACCEPT Mult+MultSubsetEmit+Linear+Types count=4"
  -- Expand: Mult + MultSubsetEmit + Linear + Types + Program.
  let programExpand :=
    resolveSources [multDisk, mseDisk, linDisk, typDisk, progDisk]
  unless programExpand.isAccept do
    IO.eprintln s!"error: Mult+MultSubsetEmit+Linear+Types+Program expand rejected"
    throw (IO.userError "program expand reject")
  unless programExpand.acceptCount == 5 do
    IO.eprintln s!"error: program expand expected 5 modules, got {programExpand.acceptCount}"
    throw (IO.userError "program expand count")
  IO.println s!"PASS good-program-expand ACCEPT Mult+MultSubsetEmit+Linear+Types+Program count=5"
  -- Expand: Mult + MultSubsetEmit + Linear + Types + Program + Graph.
  let graphExpand :=
    resolveSources [multDisk, mseDisk, linDisk, typDisk, progDisk, graphDisk]
  unless graphExpand.isAccept do
    IO.eprintln s!"error: Mult+MultSubsetEmit+Linear+Types+Program+Graph expand rejected"
    throw (IO.userError "graph expand reject")
  unless graphExpand.acceptCount == 6 do
    IO.eprintln s!"error: graph expand expected 6 modules, got {graphExpand.acceptCount}"
    throw (IO.userError "graph expand count")
  IO.println s!"PASS good-graph-expand ACCEPT Mult+MultSubsetEmit+Linear+Types+Program+Graph count=6"
  -- Expand: Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose.
  let composeExpand :=
    resolveSources
      [multDisk, mseDisk, linDisk, typDisk, progDisk, graphDisk, composeDisk]
  unless composeExpand.isAccept do
    IO.eprintln s!"error: Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose expand rejected"
    throw (IO.userError "compose expand reject")
  unless composeExpand.acceptCount == 7 do
    IO.eprintln s!"error: compose expand expected 7 modules, got {composeExpand.acceptCount}"
    throw (IO.userError "compose expand count")
  IO.println s!"PASS good-compose-expand ACCEPT Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose count=7"
  -- Mult leaf alone.
  let leaf := resolveSources [multDisk]
  unless leaf.isAccept && leaf.acceptCount == 1 do
    IO.eprintln s!"error: Mult leaf alone rejected"
    throw (IO.userError "mult leaf reject")
  IO.println s!"PASS mult-leaf ACCEPT count=1"
  -- Missing import.
  let miss := resolveSources [missDisk]
  unless miss.isRejectWith reasonMissingImport do
    IO.eprintln s!"error: expected MISSING-IMPORT"
    throw (IO.userError "missing import fail")
  IO.println s!"PASS bad-missing REJECT MISSING-IMPORT"
  -- Cycle.
  let cyc := resolveSources [cycADisk, cycBDisk]
  unless cyc.isRejectWith reasonImportCycle do
    IO.eprintln s!"error: expected IMPORT-CYCLE"
    throw (IO.userError "cycle fail")
  IO.println s!"PASS bad-cycle REJECT IMPORT-CYCLE"
  unless hostGraphReady do
    IO.eprintln s!"error: {stageId} hostGraphReady false"
    throw (IO.userError "hostGraphReady false")
  unless hostGraphFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostGraphFinishedClaimed false"
    throw (IO.userError "hostGraphFinishedClaimed false")
  unless hostGraphWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostGraphWithoutLakeFinished false"
    throw (IO.userError "hostGraphWithoutLakeFinished false")
  unless hostGraphWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostGraphWithoutLakeReady false"
    throw (IO.userError "hostGraphWithoutLakeReady false")
  IO.println s!"GREEN {stageId}: Mult+MultSubsetEmit+Linear+Types+Program+Graph+Compose expand; missing/cycle fail-closed; withoutLake finished; host residual remains"

/-- CLI: run measured multi-file graph check. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runGraphSuite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostGraph
"##

end SystemsLean.HostFrontLiveHostGraph
