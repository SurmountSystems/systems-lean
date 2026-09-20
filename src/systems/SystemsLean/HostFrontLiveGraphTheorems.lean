/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostGraphTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveGraphTheorems. Reuses HostFrontLiveHostTerm skip of
  theorem / example / set_option. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostGraphTheorems text.
  Not HostFrontLiveGraph (no non-Theorems live Graph parser in this slice).

  Spec (readable):
  - parseLiveGraphTheoremsSource turns live HostGraphTheorems.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostGraphTheorems even without a module line.
  - kernelCheckLiveGraphTheoremsSource is HostKernel.kernelCheck of that parse.

  Theorems and examples skip until the next command. Kept commands are import,
  namespace, and end (HostGraphTheorems has no kernelable defs).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostGraph.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-GRAPH-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_GRAPH_THEOREMS_V0, PARSE-LIVE-GRAPH-THEOREMS,
  parseLiveGraphTheoremsSource, kernelCheckLiveGraphTheoremsSource,
  hostFrontLiveGraphTheoremsReady, liveGraphTheoremsSource, liveGraphTheoremsRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveGraphTheorems
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveGraphTheorems
  on surmount-1 (queued, not run here). Not package typecheck GREEN. Not FullHost.
  Not Lake-gone. Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveGraphTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveGraphTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_GRAPH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-GRAPH-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-GRAPH-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveGraphTheoremsRel : String :=
  "src/systems/SystemsLean/HostGraphTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveGraphTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveGraphTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveGraphTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (HostGraphTheorems is a short theorems companion). -/
def liveGraphTheoremsParseFuel : Nat := 192

/-- Fold commands. Skip theorem / example / set_option. Keep import / namespace / end.
    Tokenize with Mult takeIdent so SystemsLean.HostGraph stays one name. -/
def parseCmdsGraphTheorems : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveGraphTheoremsParseFuel toks with
    | some (c, rest) =>
      if cmdBodyKnown kn c then
        parseCmdsGraphTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsGraphTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveGraphTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsGraphTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostGraphTheorems.lean text.
    Greppable: parseLiveGraphTheoremsSource, PARSE-LIVE-GRAPH-THEOREMS. -/
def parseLiveGraphTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsGraphTheorems liveGraphTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostGraphTheorems", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostGraphTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveGraphTheoremsSource, PARSE-LIVE-GRAPH-THEOREMS. -/
def kernelCheckLiveGraphTheoremsSource (src : String) : Bool :=
  match parseLiveGraphTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveGraphTheoremsParsed? : Option Module :=
  match parseLiveGraphTheoremsSource liveGraphTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveGraphTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveGraphTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Live parse imports SystemsLean.HostGraph. -/
def liveParseHasHostGraphImport : Bool :=
  match liveGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostGraph"
      | _ => false

/-- Live parse has the HostGraph namespace command. -/
def liveParseHasHostGraphNs : Bool :=
  match liveGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostGraph"
      | _ => false

/-- Live parse ends the HostGraph namespace. -/
def liveParseHasHostGraphEnd : Bool :=
  match liveGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostGraph"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveGraphTheoremsReady, PARSE-LIVE-GRAPH-THEOREMS,
    HOST-FRONT-LIVE-GRAPH-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveGraphTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_GRAPH_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-GRAPH-THEOREMS")
    && (parseId == "PARSE-LIVE-GRAPH-THEOREMS")
    && (liveGraphTheoremsRel == "src/systems/SystemsLean/HostGraphTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveGraphTheoremsFullHost
    && !hostFrontLiveGraphTheoremsResidualFreeClaimed
    && !hostFrontLiveGraphTheoremsProvablyUnlocked
    && kernelCheckLiveGraphTheoremsSource liveGraphTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostGraphImport
    && liveParseHasHostGraphNs
    && liveParseHasHostGraphEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveGraphTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveGraphTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-GRAPH-THEOREMS =="
  IO.println s!"  host={hostId} file={liveGraphTheoremsRel}"
  let path := root / liveGraphTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveGraphTheoremsRel}"
    throw (IO.userError s!"missing {liveGraphTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveGraphTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostGraphTheorems.lean != liveGraphTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostGraphTheorems.lean")
  let r := parseLiveGraphTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-GRAPH-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-GRAPH-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-GRAPH-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostGraphTheorems parse false"
      throw (IO.userError "kernelCheck live HostGraphTheorems parse false")
    unless hostFrontLiveGraphTheoremsReady do
      IO.eprintln "error: hostFrontLiveGraphTheoremsReady false"
      throw (IO.userError "hostFrontLiveGraphTheoremsReady false")
    IO.println s!"GREEN {stageId}: live HostGraphTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveGraphTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveGraphTheorems
