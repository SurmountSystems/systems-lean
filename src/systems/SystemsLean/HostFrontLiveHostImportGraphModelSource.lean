/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphModel.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphModelSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostImportGraphModel.lean only.
  Do not steal HostFrontLiveHostImportGraphLoadOk (that liveRel is
  HostImportGraphLoadOk.lean). Do not edit HostFrontLiveHostImportGraphLoadOkLater.
  Do not steal occupancy leftover HostFrontLiveImportLoadOkLater.
  Do not steal HostFrontLiveHostImportGraph.
  Do not steal mill wrap HostFrontLiveHostImportGraphMain.
  Unique needles (each id is the whole line, so a shorter id is not this module):
  HostFrontLiveHostImportGraphModelSource
  HostFrontLiveHostImportGraphModel
  PARSE-LIVE-HOST-IMPORT-GRAPH-MODEL
  HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODEL
  SLAKE_HOST_FRONT_LIVE_HOST_IMPORT_GRAPH_MODEL_V0
  Greppable: SYSTEMS_LEAN_HOST, liveHostImportGraphModelSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostImportGraphModelSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostImportGraphModel

/-- Dual-pinned live HostImportGraphModel.lean bytes (must match on-disk file).
    Greppable: liveHostImportGraphModelSource,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODEL. -/
def liveHostImportGraphModelSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph RealMod model + resolveImportGraph.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphModel, RealMod,
  ImportGraphResult, resolveImportGraph, extractImports, filterSeedImports.
  Module: SystemsLean.HostImportGraphModel
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphModel; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphSeeds
namespace SystemsLean.HostImportGraph
/-- One real host module node (name + package-local imports).
    Greppable: RealMod. -/
structure RealMod where
  name : String
  imports : List String
  deriving Repr, DecidableEq

/-- Graph check result: accept ordered modules, or reject with reason. -/
inductive ImportGraphResult where
  | accept (order : List RealMod)
  | reject (reason : String)
  deriving Repr

/-- True when accept. -/
def ImportGraphResult.isAccept : ImportGraphResult -> Bool
  | ImportGraphResult.accept _ => true
  | ImportGraphResult.reject _ => false

/-- True when reject with exact reason. -/
def ImportGraphResult.isRejectWith (r : ImportGraphResult) (reason : String) :
    Bool :=
  match r with
  | ImportGraphResult.reject r' => r' == reason
  | ImportGraphResult.accept _ => false

/-- Accepted module count when accept; 0 on reject. -/
def ImportGraphResult.acceptCount : ImportGraphResult -> Nat
  | ImportGraphResult.accept xs => xs.length
  | ImportGraphResult.reject _ => 0

/-! ### Import extraction (real .lean line scan; package-local only) -/

/-- Whitespace? -/
def isWs (c : Char) : Bool := c == ' ' || c == '\t' || c == '\r'

/-- Drop leading ASCII whitespace. -/
def trimLeft (s : String) : String :=
  let rec go (cs : List Char) : List Char :=
    match cs with
    | [] => []
    | c :: rest => if isWs c then go rest else c :: rest
  String.ofList (go s.toList)

/-- Drop trailing ASCII whitespace. -/
def trimRight (s : String) : String :=
  let rec dropEnd (cs : List Char) : List Char :=
    match cs with
    | [] => []
    | c :: rest =>
      if isWs c then dropEnd rest else c :: rest
  String.ofList (dropEnd s.toList.reverse).reverse

/-- Trim both ends. -/
def trim (s : String) : String :=
  trimRight (trimLeft s)

/-- True when string starts with prefix. -/
def hasPrefix (s pref : String) : Bool :=
  s.startsWith pref

/-- Strip line comment from first `--` not inside this simple scanner. -/
def stripLineComment (s : String) : String :=
  match s.splitOn "--" with
  | [] => s
  | h :: _ => h

/-- True when token is a package-local SystemsLean import target. -/
def isPackageLocalImport (name : String) : Bool :=
  hasPrefix name "SystemsLean."

/-- Parse one line for `import SystemsLean.X` (optional leading ws).
    Returns package-local module name only. Greppable: parseImportLine. -/
def parseImportLine (line : String) : Option String :=
  let t := trim (stripLineComment line)
  if !(hasPrefix t "import ") then none
  else
    let rest := trim (String.Slice.toString (t.drop "import ".length))
    -- Take first token (module name); stop at space or end.
    let name :=
      match rest.splitOn " " with
      | [] => ""
      | h :: _ =>
        match h.splitOn "\t" with
        | [] => h
        | n :: _ => n
    let name := trimRight name
    if name.isEmpty then none
    else if isPackageLocalImport name then some name
    else none

/-- Extract package-local imports from full file content (block-comment aware).
    Greppable: extractImports. -/
def extractImports (content : String) : List String :=
  let rec go (inBlock : Bool) (acc : List String) :
      List String -> List String
    | [] => acc.reverse
    | line :: rest =>
      if inBlock then
        -- End block when line contains "-/" (simple; enough for seed files).
        if (line.splitOn "-/").length > 1 then
          go false acc rest
        else
          go true acc rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          -- Same-line open+close or open only.
          if (t.splitOn "-/").length > 1 then
            go false acc rest
          else
            go true acc rest
        else
          match parseImportLine line with
          | none => go false acc rest
          | some n =>
            if acc.any (fun x => x == n) then go false acc rest
            else go false (n :: acc) rest
  go false [] (content.splitOn "\n")

/-- Keep only package-local imports that are also seed members.
    After Host real module seed expand, Erasure/Extract are seed members so
    HostCompose seed-local edges include Erasure + Extract (and
    HostComposeTheorems includes Erasure / ErasureTheorems / Extract).
    Greppable: filterSeedImports. -/
def filterSeedImports (seed : List String) (imps : List String) : List String :=
  imps.filter (fun i => seed.any (fun s => s == i))

/-! ### Graph resolve (fail-closed MISSING-IMPORT / IMPORT-CYCLE) -/

/-- Find module by exact name. -/
def findByName (mods : List RealMod) (name : String) : Option RealMod :=
  let rec go : List RealMod -> Option RealMod
    | [] => none
    | m :: rest => if m.name == name then some m else go rest
  go mods

/-- True when name appears in list. -/
def nameIn (names : List String) (name : String) : Bool :=
  names.any (fun n => n == name)

/-- True when every package-local import of every module is present. -/
def importsPresent (mods : List RealMod) : Bool :=
  mods.all fun m =>
    m.imports.all fun imp => (findByName mods imp).isSome

/-- True when module names are unique. -/
def namesUnique (mods : List RealMod) : Bool :=
  let rec go (seen : List String) : List RealMod -> Bool
    | [] => true
    | m :: rest =>
      if nameIn seen m.name then false
      else go (m.name :: seen) rest
  go [] mods

/-- Indegree = number of package-local imports (importer depends on importee). -/
def indegrees (mods : List RealMod) : List Nat :=
  mods.map fun m => m.imports.length

/-- When module `done` finishes, decrement indegree of modules that import it. -/
def decIndegrees (mods : List RealMod) (degs : List Nat) (done : String) :
    List Nat :=
  let rec go (ms : List RealMod) (ds : List Nat) : List Nat :=
    match ms, ds with
    | [], _ => []
    | _, [] => []
    | m :: mrest, d :: drest =>
      let d' :=
        if m.imports.any (fun n => n == done) then
          if d == 0 then 0 else d - 1
        else
          d
      d' :: go mrest drest
  go mods degs

/-- First module with indegree 0 not yet done. -/
def pickReady (mods : List RealMod) (degs : List Nat) (done : List String) :
    Option String :=
  let rec go (ms : List RealMod) (ds : List Nat) : Option String :=
    match ms, ds with
    | [], _ => none
    | _, [] => none
    | m :: mrest, d :: drest =>
      if d == 0 && !(nameIn done m.name) then some m.name
      else go mrest drest
  go mods degs

/-- Kahn topo sort with fuel. -/
def topoOrderN (fuel : Nat) (mods : List RealMod) (degs : List Nat)
    (done : List String) (order : List RealMod) : Option (List RealMod) :=
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

/-- Resolve real-module list: unique names, imports present, topo no cycle.
    Greppable: resolveImportGraph, MISSING-IMPORT, IMPORT-CYCLE. -/
def resolveImportGraph (mods : List RealMod) : ImportGraphResult :=
  if mods.isEmpty then
    ImportGraphResult.reject reasonEmptyGraph
  else if !namesUnique mods then
    ImportGraphResult.reject reasonDupModule
  else if !importsPresent mods then
    ImportGraphResult.reject reasonMissingImport
  else
    match topoOrderN (mods.length + 1) mods (indegrees mods) [] [] with
    | none => ImportGraphResult.reject reasonImportCycle
    | some order =>
      if order.length == mods.length then
        ImportGraphResult.accept order
      else
        ImportGraphResult.reject reasonImportCycle
end SystemsLean.HostImportGraph
"#

end SystemsLean.HostFrontLiveHostImportGraphModel
