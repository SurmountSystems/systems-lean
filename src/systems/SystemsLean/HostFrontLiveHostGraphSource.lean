/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostGraph.lean bytes, first half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostGraphSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-GRAPH, liveHostGraphSource0,
  HOST-FRONT-LIVE-HOST-GRAPH, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostGraphSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostGraph

/-- Dual-pinned live HostGraph.lean bytes, first half.
    Concatenate liveHostGraphSource0 then liveHostGraphSource1 before parse.
    Greppable: liveHostGraphSource0, PARSE-LIVE-HOST-GRAPH. -/
def liveHostGraphSource0 : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- Mult-first host fragment module graph
  (plan-peer-elaborator Fragment module graph). Side: classic Lean elaborator
  under src/systems/ (not freestanding C).

  Spec (readable):
  - Resolve a tiny multi-file Mult-first import set under without-Lake check
    (Mult + MultSubsetEmit fragment as host fragment dialect files, not full
    Lean import of SystemsLean).
  - Parse each file via HostFront into HostTerm.Module; extract importModule
    edges; fail closed on MISSING-IMPORT or IMPORT-CYCLE.
  - Good closure: Mult leaf + MultSubsetEmit (imports Mult) topo-ok.
  - Bad: single-file missing import; two-file cycle.
  - Lake-built host binary OK (just host-graph). Without-Lake measured step:
    just host-graph-without-lake prebuilt ELF; no lake build/exe/env on hot path.

  Out of scope: full SystemsLean import graph; .olean wire compatibility with
  Lake as success; Mult package write (step 7); PROVABLY / llvm; product free /
  complete tip flips; host residual free claim.

  Theorems (HOST-GRAPH-THEOREM / HOST-GRAPH-SMOKE): live in
  SystemsLean.HostGraphTheorems (same namespace; long-file split). Ready /
  Mult..Compose expand / missing/cycle / without-Lake / claims_false / ids +
  smoke. Do NOT set proofComplete or DualResidual host free.

  Greppable: SYSTEMS_LEAN_HOST, HOST-GRAPH, SLAKE_HOST_GRAPH, SLAKE_HOST_GRAPH_V0,
  HOST-HOST-GRAPH, hostGraphReady, hostGraphFinishedClaimed, hostGraphGoodClosure,
  hostGraphGoodLinearExpand, hostGraphGoodTypesExpand,
  hostGraphGoodProgramExpand, hostGraphGoodGraphExpand,
  hostGraphGoodComposeExpand, hostGraphBadMissing,
  hostGraphBadCycle, hostGraphHostElaboratorResidualRemains,
  hostGraphDoesNotClaimPeerGreen, hostGraphWithoutLakeFinished,
  hostGraphWithoutLakeReady, hostGraphWithoutLakeKeepsHostLake,
  justRecipeWithoutLake, prebuiltHostGraphRel, host-graph-without-lake,
  HOST-GRAPH-WITHOUT-LAKE, HOST-GRAPH-SMOKE, HOST-GRAPH-THEOREM,
  HostGraphTheorems, hostGraphReady_true, slake-host-graph, just host-graph,
  goldens/host-graph,
  MISSING-IMPORT, IMPORT-CYCLE, resolveGraph, moduleImports, linearText,
  typesText, programText, graphText, composeText, LINEAR-EXACT-ONCE, TYPED_IR_V0,
  KIND-MULT-OK, TYPES-FIXTURE, IR_PROGRAM_V0, ORDERED-IR-PROGRAM, PROGRAM-FIXTURE,
  IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE,
  HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostGraph
  Long-file split: HOST-GRAPH-THEOREM + HOST-GRAPH-SMOKE in
  SystemsLean.HostGraphTheorems (same namespace). Core resolve + goldens +
  readiness pins + runGraphSuite driver stay here.
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins (dual-pinned golden String constants) +
  just host-graph-without-lake over on-disk goldens (prebuilt).
  Red/green: just host-graph-without-lake (measured without-Lake);
  just host-graph (Lake bootstrap path); lake build once for prebuilt.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY.
  Not llvm unlock.
  Host elaborator residual remains (Lake still for host develop bootstrap).
-/

import SystemsLean.HostFront
import SystemsLean.HostTerm

namespace SystemsLean.HostGraph

open SystemsLean.HostFront
open SystemsLean.HostTerm

/-! ### HOST-GRAPH / SLAKE_HOST_GRAPH
    Tiny Mult-first multi-file import set under without-Lake check. -/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_GRAPH_V0"

/-- Greppable host map id. HOST-GRAPH durable product token. -/
def hostId : String := "HOST-GRAPH"

/-- Short surface name. -/
def surfaceId : String := "HOST-GRAPH"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-GRAPH"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-graph"

/-- just recipe name (Lake bootstrap path). -/
def justRecipe : String := "host-graph"

/-- just recipe for without-Lake measured graph check (prebuilt).
    Greppable: justRecipeWithoutLake, host-graph-without-lake,
    HOST-GRAPH-WITHOUT-LAKE. -/
def justRecipeWithoutLake : String := "host-graph-without-lake"

/-- Relative path of prebuilt host graph binary under src/systems
    (bootstrap once: lake build slake-host-graph).
    Greppable: prebuiltHostGraphRel, slake-host-graph. -/
def prebuiltHostGraphRel : String :=
  ".lake/build/bin/slake-host-graph"

/-- Goldens directory relative to repo root. -/
def goldensRel : String := "src/systems/goldens/host-graph"

/-- Host elaborator residual still remains (peer not green yet).
    Greppable: hostGraphHostElaboratorResidualRemains. -/
def hostGraphHostElaboratorResidualRemains : Bool := true

/-- Local honesty: this module is not peer elaborator green. -/
def hostGraphDoesNotClaimPeerGreen : Bool := true

/-- Local honesty: host develop surface still uses Lake (not product tip).
    Without-Lake measured step does not retire host develop Lake bootstrap. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostGraphStillUsesLake : Bool := stillUsesLake
def hostGraphDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostGraphResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostGraphProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostGraphProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostGraphLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostGraphProvablyUnlocked : Bool := false

/-- Without-Lake measured step finished (prebuilt ELF; no lake on hot path).
    Greppable: hostGraphWithoutLakeFinished, HOST-GRAPH-WITHOUT-LAKE. -/
def hostGraphWithoutLakeFinished : Bool := true

/-! ### Reject reasons (greppable fail-closed tokens) -/

def reasonMissingImport : String := "MISSING-IMPORT"
def reasonImportCycle : String := "IMPORT-CYCLE"
def reasonParseReject : String := "PARSE-REJECT"
def reasonEmptyGraph : String := "EMPTY-GRAPH"
def reasonDupModule : String := "DUP-MODULE"

/-- Graph check result: accept ordered modules, or reject with reason. -/
inductive GraphResult where
  | accept (order : List Module)
  | reject (reason : String)
  deriving Repr

/-- True when accept. -/
def GraphResult.isAccept : GraphResult -> Bool
  | GraphResult.accept _ => true
  | GraphResult.reject _ => false

/-- True when reject with exact reason. -/
def GraphResult.isRejectWith (r : GraphResult) (reason : String) : Bool :=
  match r with
  | GraphResult.reject r' => r' == reason
  | GraphResult.accept _ => false

/-- Accepted module count when accept; 0 on reject. -/
def GraphResult.acceptCount : GraphResult -> Nat
  | GraphResult.accept xs => xs.length
  | GraphResult.reject _ => 0

/-! ### Import extraction and graph resolve -/

/-- Collect importModule names from a module (order preserved).
    Greppable: moduleImports. -/
def moduleImports (m : Module) : List Name :=
  let rec go (acc : List Name) : List Cmd -> List Name
    | [] => acc.reverse
    | Cmd.importModule n :: rest => go (n :: acc) rest
    | _ :: rest => go acc rest
  go [] m.commands

/-- Find module by exact name.raw in list. -/
def findByName (mods : List Module) (name : Name) : Option Module :=
  let rec go : List Module -> Option Module
    | [] => none
    | m :: rest =>
      if m.name.raw == name.raw then some m else go rest
  go mods

/-- True when name.raw appears in name list. -/
def nameIn (names : List Name) (name : Name) : Bool :=
  names.any (fun n => n.raw == name.raw)

/-- Module names from a list (order preserved). -/
def moduleNames (mods : List Module) : List Name :=
  mods.map (fun m => m.name)

/-- True when every import of every module is present in the set.
    Greppable: importsPresent. -/
def importsPresent (mods : List Module) : Bool :=
  mods.all fun m =>
    (moduleImports m).all fun imp => (findByName mods imp).isSome

/-- True when module names are unique. -/
def namesUnique (mods : List Module) : Bool :=
  let rec go (seen : List Name) : List Module -> Bool
    | [] => true
    | m :: rest =>
      if nameIn seen m.name then false
      else go (m.name :: seen) rest
  go [] mods

/-- Count of modules that import a given name (indegree for Kahn).
    Edge direction: importer depends on importee => indegree on importer. -/
def indegreeOf (mods : List Module) (name : Name) : Nat :=
  let rec go (acc : Nat) : List Module -> Nat
    | [] => acc
    | m :: rest =>
      if m.name.raw == name.raw then
        go (acc + (moduleImports m).length) rest
      else
        go acc rest
  go 0 mods

/-- Indegree list parallel to mods (each indegree = number of imports). -/
def indegrees (mods : List Module) : List Nat :=
  mods.map fun m => (moduleImports m).length

/-- Replace ith indegree with max(0, v-1) style decrement by name.
    When module `done` is processed, decrement indegree of modules that
    import `done`. -/
def decIndegrees (mods : List Module) (degs : List Nat) (done : Name) :
    List Nat :=
  let rec go (ms : List Module) (ds : List Nat) : List Nat :=
    match ms, ds with
    | [], _ => []
    | _, [] => []
    | m :: mrest, d :: drest =>
      let d' :=
        if (moduleImports m).any (fun n => n.raw == done.raw) then
          if d == 0 then 0 else d - 1
        else
          d
      d' :: go mrest drest
  go mods degs

/-- Index of first module with indegree 0 and not yet in done set.
    Returns name option. -/
def pickReady (mods : List Module) (degs : List Nat) (done : List Name) :
    Option Name :=
  let rec go (ms : List Module) (ds : List Nat) : Option Name :=
    match ms, ds with
    | [], _ => none
    | _, [] => none
    | m :: mrest, d :: drest =>
      if d == 0 && !(nameIn done m.name) then some m.name
      else go mrest drest
  go mods degs

/-- Kahn topo sort fuelled. Greppable: topoOrder?. -/
def topoOrderN (fuel : Nat) (mods : List Module) (degs : List Nat)
    (done : List Name) (order : List Module) : Option (List Module) :=
  match fuel with
  | 0 => none
  | Nat.succ f =>
    if done.length == mods.length then some order.reverse
    else
      match pickReady mods degs done with
      | none => none
      | some name =>
        match findByName mods name with
        | none => none
        | some m =>
          let degs' := decIndegrees mods degs name
          topoOrderN f mods degs' (name :: done) (m :: order)

/-- Resolve multi-file module list: each well-formed, unique names, imports
    present, topo order without cycle. Greppable: resolveGraph. -/
def resolveGraph (mods : List Module) : GraphResult :=
  if mods.isEmpty then
    GraphResult.reject reasonEmptyGraph
  else if !mods.all isWellFormed then
    GraphResult.reject reasonParseReject
  else if !namesUnique mods then
    GraphResult.reject reasonDupModule
  else if !importsPresent mods then
    GraphResult.reject reasonMissingImport
  else
    match topoOrderN (mods.length + 1) mods (indegrees mods) [] [] with
    | none => GraphResult.reject reasonImportCycle
    | some order =>
      if order.length == mods.length then
        GraphResult.accept order
      else
        GraphResult.reject reasonImportCycle

/-- Parse each source; require each accept; then resolveGraph on modules. -/
def resolveSources (srcs : List String) : GraphResult :=
  let rec parseAll (acc : List Module) : List String -> GraphResult
    | [] => resolveGraph acc.reverse
    | src :: rest =>
      match parseSource src with
      | FrontResult.reject _ => GraphResult.reject reasonParseReject
      | FrontResult.accept m => parseAll (m :: acc) rest
  parseAll [] srcs

/-! ### Dual-pinned golden texts (must match on-disk files under goldensRel)

  Greppable: multText, multSubsetEmitText, badMissingText,
  badCycleAText, badCycleBText.
-/

/-- Mult leaf golden (no imports). -/
def multText : String :=
  "# Mult-first host fragment -- Mult leaf (no imports)\n" ++
  "# Graph closure leaf for Mult + MultSubsetEmit multi-file set\n" ++
  "# Not full Lean Mult.lean; host fragment dialect only\n" ++
  "\n" ++
  "module Mult\n" ++
  "namespace Mult\n" ++
  "inductive Mult mult0 mult1 multOmega deriving DecidableEq Repr\n" ++
  "def isValid : Mult -> Bool := match var m | mult0 => true | mult1 => true | multOmega => true\n" ++
  "check mult0 : Mult\n" ++
  "end Mult\n"

/-- MultSubsetEmit fragment golden (imports Mult). -/
def multSubsetEmitText : String :=
  "# Mult-first host fragment -- MultSubsetEmit thin dep (imports Mult)\n" ++
  "# Not full SystemsLean.MultSubsetEmit; host fragment dialect only\n" ++
  "# Import closure: Mult -> MultSubsetEmit\n" ++
  "\n" ++
  "module MultSubsetEmit\n" ++
  "import Mult\n" ++
  "namespace MultSubsetEmit\n" ++
  "open Mult\n" ++
  "def multSubsetEmitInputId : String := \"SLAKE_FIRST_SURFACE_MULT\"\n" ++
  "def multSubsetEmitReady : Bool := true\n" ++
  "check mult0 : Mult\n" ++
  "end MultSubsetEmit\n"

/-- Linear Mult companion golden (imports Mult). Expand set row.
    Greppable: linearText, LINEAR-EXACT-ONCE. -/
def linearText : String :=
  "# Linear Mult companion host fragment (imports Mult)\n" ++
  "# Expand set: Mult + MultSubsetEmit + Linear\n" ++
  "# Not full SystemsLean.Linear axioms; host fragment dialect only\n" ++
  "\n" ++
  "module Linear\n" ++
  "import Mult\n" ++
  "namespace Linear\n" ++
  "open Mult\n" ++
  "def shareNat : Nat -> Nat := var n\n" ++
  "def polyId : Nat -> Nat := var x\n" ++
  "def linearExactOnceId : String := \"LINEAR-EXACT-ONCE\"\n" ++
  "check mult0 : Mult\n" ++
  "end Linear\n"

/-- Types Mult companion golden (imports Mult). Expand set row after Linear.
    Greppable: typesText, TYPED_IR_V0, KIND-MULT-OK, TYPES-FIXTURE. -/
def typesText : String :=
  "# Types Mult companion host fragment (imports Mult)\n" ++
  "# Expand set: Mult + MultSubsetEmit + Linear + Types\n" ++
  "# Not full SystemsLean.Types / elaborator; host fragment dialect only\n" ++
  "\n" ++
  "module Types\n" ++
  "import Mult\n" ++
  "namespace Types\n" ++
  "open Mult\n" ++
  "def typedIrId : String := \"TYPED_IR_V0\"\n" ++
  "def kindMultOkId : String := \"KIND-MULT-OK\"\n" ++
  "def typesFixtureId : String := \"TYPES-FIXTURE\"\n" ++
  "check mult0 : Mult\n" ++
  "end Types\n"

/-- Program Mult companion golden (imports Mult). Expand set row after Types.
    Greppable: programText, IR_PROGRAM_V0, ORDERED-IR-PROGRAM, PROGRAM-FIXTURE. -/
def programText : String :=
  "# Program Mult companion host fragment (imports Mult)\n" ++
  "# Expand set: Mult + MultSubsetEmit + Linear + Types + Program\n" ++
  "# Not full SystemsLean.IrProgram / elaborator; host fragment dialect only\n" ++
  "\n" ++
  "module Program\n" ++
  "import Mult\n" ++
  "namespace Program\n" ++
  "open Mult\n" ++
  "def irProgramId : String := \"IR_PROGRAM_V0\"\n" ++
  "def orderedIrProgramId : String := \"ORDERED-IR-PROGRAM\"\n" ++
  "def programFixtureId : String := \"PROGRAM-FIXTURE\"\n" ++
  "check mult0 : Mult\n" ++
  "end Program\n"

/-- Graph Mult companion golden (imports Mult). Expand set row after Program.
    Greppable: graphText, IR_GRAPH_EDGES_V0, EMPTY-GRAPH-OK, GRAPH-FIXTURE. -/
def graphText : String :=
  "# Graph Mult companion host fragment (imports Mult)\n" ++
  "# Expand set: Mult + MultSubsetEmit + Linear + Types + Program + Graph\n" ++
  "# Not full SystemsLean.IrGraph / elaborator; host fragment dialect only\n" ++
  "\n" ++
  "module Graph\n" ++
  "import Mult\n" ++
  "namespace Graph\n" ++
  "open Mult\n" ++
  "def irGraphEdgesId : String := \"IR_GRAPH_EDGES_V0\"\n" ++
  "def emptyGraphOkId : String := \"EMPTY-GRAPH-OK\"\n" ++
  "def graphFixtureId : String := \"GRAPH-FIXTURE\"\n" ++
  "check mult0 : Mult\n" ++
  "end Graph\n"

/-- Compose Mult companion golden (imports Mult). Expand set row after Graph.
    Greppable: composeText, HOST_COMPOSE_V0, HOST-COMPOSE, COMPOSE-FIXTURE. -/
def composeText : String :=
  "# Compose Mult companion host fragment (imports Mult)\n" ++
  "# Expand set: Mult + MultSubsetEmit + Linear + Types + Program + Graph + Compose\n" ++
  "# Not full SystemsLean.HostCompose / elaborator; host fragment dialect only\n" ++
  "\n" ++
  "module Compose\n" ++
  "import Mult\n" ++
  "namespace Compose\n" ++
  "open Mult\n" ++
  "def hostComposeId : String := \"HOST_COMPOSE_V0\"\n" ++
  "def hostComposeSurfaceId : String := \"HOST-COMPOSE\"\n" ++
  "def composeFixtureId : String := \"COMPOSE-FIXTURE\"\n" ++
  "check mult0 : Mult\n" ++
  "end Compose\n"

/-- Missing import golden (single-file closure). -/
def badMissingText : String :=
  "# B-missing: import name not present in graph (MISSING-IMPORT)\n" ++
  "# Checked as single-file closure under HostGraph (import NotPresent absent)\n" ++
  "\n" ++
  "module Bad.Missing\n" ++
  "import NotPresent\n" ++
  "namespace Bad.Missing\n" ++
  "def x : Nat := 0\n" ++
  "check 0 : Nat\n" ++
  "end Bad.Missing\n"

/-- Cycle A golden. -/
def badCycleAText : String :=
  "# B-cycle A: CycleA imports CycleB (pair with bad-cycle-b; IMPORT-CYCLE)\n" ++
  "\n" ++
  "module CycleA\n" ++
  "import CycleB\n" ++
  "namespace CycleA\n" ++
  "def a : Nat := 1\n" ++
  "check 1 : Nat\n" ++
  "end CycleA\n"

/-- Cycle B golden. -/
def badCycleBText : String :=
  "# B-cycle B: CycleB imports CycleA (pair with bad-cycle-a; IMPORT-CYCLE)\n" ++
  "\n" ++
  "module CycleB\n" ++
  "import CycleA\n" ++
  "namespace CycleB\n" ++
  "def b : Nat := 2\n" ++
  "check 2 : Nat\n" ++
  "end CycleB\n"

/-- Golden file basenames. -/
def multFile : String := "mult.slake-host"
def multSubsetEmitFile : String := "mult-subset-emit.slake-host"
def linearFile : String := "linear.slake-host"
def typesFile : String := "types.slake-host"
def programFile : String := "program.slake-host"
def graphFile : String := "graph.slake-host"
def composeFile : String := "compose.slake-host"
def badMissingFile : String := "bad-missing-import.slake-host"
def badCycleAFile : String := "bad-cycle-a.slake-host"
def badCycleBFile : String := "bad-cycle-b.slake-host"

/-- Documented Mult-first import closure (package write subset; names only).
    Greppable: documentedImportClosure. Mult + MultSubsetEmit stay package path. -/
def documentedImportClosure : List String :=
  ["Mult", "MultSubsetEmit"]

"##

end SystemsLean.HostFrontLiveHostGraph
