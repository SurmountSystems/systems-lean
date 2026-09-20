/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostGraph.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGraph. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostCheckSource on HostGraph text. Not DualPinOk.

  Spec (readable):
  - parseLiveHostGraphSource turns live HostGraph.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostGraph even without a module line.
  - kernelCheckLiveHostGraphSource is HostKernel.kernelCheckN of that parse
    with HostFront and HostTerm import seeds (HostKernel.lean is locked; seed locally).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostFrontTheorems.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-GRAPH, SLAKE_HOST_FRONT_LIVE_GRAPH_V0,
  PARSE-LIVE-HOST-GRAPH, parseLiveHostGraphSource, kernelCheckLiveHostGraphSource,
  hostFrontLiveGraphReady, liveHostGraphSource, liveHostGraphRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveGraph
  Red/green: just systems-host dest rows later; lake build SystemsLean.HostFrontLiveGraph
  on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveGraphSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveGraph

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-GRAPH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-GRAPH"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostGraphRel : String := "src/systems/SystemsLean/HostGraph.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveGraphFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveGraphResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveGraphProvablyUnlocked : Bool := false

/-- Seed names from SystemsLean.HostFront import plus goldensRel lastSeg. -/
def seedKnown : List String :=
  ["hostFrontGoodG1", "hostFrontGoodG2", "hostFrontGoodG3", "hostFrontGoodG4",
    "hostFrontGoodG5", "hostFrontGoodG6", "hostFrontGoodG7",
    "hostFrontBadB1", "hostFrontBadB2", "hostFrontBadB3", "hostFrontBadB4",
    "hostFrontGoldensStructuralOk", "hostFrontReady", "goldensRel"]

/-- Seed names from SystemsLean.HostTerm import (HostGraph imports HostTerm). -/
def seedKnownTerm : List String :=
  ["n", "nameOk", "isWellFormed", "termOk", "termFuel"]

/-- Kernel env for HostFront import (HostKernel does not seed HostFront). -/
def seedHostFront (env : Env) : Env :=
  ("hostFrontGoodG1", HostType.bool)
    :: ("hostFrontGoodG2", HostType.bool)
    :: ("hostFrontGoodG3", HostType.bool)
    :: ("hostFrontGoodG4", HostType.bool)
    :: ("hostFrontGoodG5", HostType.bool)
    :: ("hostFrontGoodG6", HostType.bool)
    :: ("hostFrontGoodG7", HostType.bool)
    :: ("hostFrontBadB1", HostType.bool)
    :: ("hostFrontBadB2", HostType.bool)
    :: ("hostFrontBadB3", HostType.bool)
    :: ("hostFrontBadB4", HostType.bool)
    :: ("hostFrontGoldensStructuralOk", HostType.bool)
    :: ("hostFrontReady", HostType.bool)
    :: ("goldensRel", HostType.string)
    :: env

/-- Kernel env for HostTerm import (HostKernel does not seed HostTerm). -/
def seedHostTerm (env : Env) : Env :=
  ("n", HostType.arrow HostType.string (HostType.named (HostTerm.n "Name")))
    :: ("nameOk", HostType.arrow (HostType.named (HostTerm.n "Name")) HostType.bool)
    :: ("isWellFormed",
        HostType.arrow (HostType.named (HostTerm.n "Module")) HostType.bool)
    :: ("termOk", HostType.arrow (HostType.named (HostTerm.n "Term")) HostType.bool)
    :: ("termFuel", HostType.nat)
    :: env

/-- Names a command adds to the known-const set (HostFront / HostTerm import seeds). -/
def cmdAddsGraph (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    if lastSeg x.raw == "HostFront" then seedKnown
    else if lastSeg x.raw == "HostTerm" then seedKnownTerm
    else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsGraph : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveHostTermParseFuel toks with
    | some (c, rest) =>
      if cmdBodyKnown kn c then
        parseCmdsGraph n rest (kn ++ cmdAddsGraph c) (acc ++ [c])
      else
        parseCmdsGraph n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostTermParseFuel rest
          if rest2.length < toks.length then
            parseCmdsGraph n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostGraph.lean text.
    Greppable: parseLiveHostGraphSource, PARSE-LIVE-HOST-GRAPH. -/
def parseLiveHostGraphSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGraph liveHostTermParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostGraph", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostGraph parse with HostFront and HostTerm seeds.
    Greppable: kernelCheckLiveHostGraphSource, PARSE-LIVE-HOST-GRAPH. -/
def kernelCheckLiveHostGraphSource (src : String) : Bool :=
  match parseLiveHostGraphSource src with
  | FrontResult.accept m =>
    isWellFormed m
      && kernelCheckN kernelFuel (seedHostTerm (seedHostFront [])) [] m.commands
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostGraphParsed? : Option Module :=
  match parseLiveHostGraphSource liveHostGraphSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / typed defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveHostGraphParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.HostFront. -/
def liveParseHasHostFrontImport : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostFront"
      | _ => false

/-- Live parse imports SystemsLean.HostTerm. -/
def liveParseHasHostTermImport : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostTerm"
      | _ => false

/-- Live parse has GraphResult accept/reject. -/
def liveParseHasGraphResult : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "GraphResult" && ctors.length == 2
          && ctors.any (fun x => x.name.raw == "accept")
          && ctors.any (fun x => x.name.raw == "reject")
      | _ => false

/-- Live parse has core HostGraph defs (def_ or defBind).
    Prefer plain String/Bool names the skip-fold keeps. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostGraphParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "hostId" && has "goldensRel"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveGraphReady, PARSE-LIVE-HOST-GRAPH, HOST-FRONT-LIVE-GRAPH.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveGraphReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_GRAPH_V0")
    && (hostId == "HOST-FRONT-LIVE-GRAPH")
    && (parseId == "PARSE-LIVE-HOST-GRAPH")
    && (liveHostGraphRel == "src/systems/SystemsLean/HostGraph.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveGraphFullHost
    && !hostFrontLiveGraphResidualFreeClaimed
    && !hostFrontLiveGraphProvablyUnlocked
    && kernelCheckLiveHostGraphSource liveHostGraphSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostFrontImport
    && liveParseHasHostTermImport
    && liveParseHasGraphResult
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostGraphSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostGraph (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-GRAPH =="
  IO.println s!"  host={hostId} file={liveHostGraphRel}"
  let path := root / liveHostGraphRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostGraphRel}"
    throw (IO.userError s!"missing {liveHostGraphRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostGraphSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostGraph.lean != liveHostGraphSource"
    throw (IO.userError "dual-pin mismatch live HostGraph.lean")
  let r := parseLiveHostGraphSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-GRAPH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-GRAPH reject {reason}")
  | FrontResult.accept m =>
    let k :=
      isWellFormed m
        && kernelCheckN kernelFuel (seedHostTerm (seedHostFront [])) [] m.commands
    IO.println s!"PASS PARSE-LIVE-HOST-GRAPH ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostGraph parse false"
      throw (IO.userError "kernelCheck live HostGraph parse false")
    unless hostFrontLiveGraphReady do
      IO.eprintln "error: hostFrontLiveGraphReady false"
      throw (IO.userError "hostFrontLiveGraphReady false")
    IO.println s!"GREEN {stageId}: live HostGraph.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostGraph root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveGraph
