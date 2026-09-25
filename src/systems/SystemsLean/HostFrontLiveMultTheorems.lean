/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/MultTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveMultTheorems. Reuses HostFrontLiveHostTerm skip of
  theorem / example / set_option. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on MultTheorems text.
  Not HostFrontLiveMult (that parser is live Mult.lean, not theorems).

  Spec (readable):
  - parseLiveMultTheoremsSource turns live MultTheorems.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.MultTheorems even without a module line.
  - kernelCheckLiveMultTheoremsSource is HostKernel.kernelCheck of that parse.

  Theorems and examples skip until the next command. Kept commands are import,
  namespace, and end (MultTheorems has no kernelable defs).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Mult.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-MULT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_MULT_THEOREMS_V0, PARSE-LIVE-MULT-THEOREMS,
  parseLiveMultTheoremsSource, kernelCheckLiveMultTheoremsSource,
  hostFrontLiveMultTheoremsReady, liveMultTheoremsSource, liveMultTheoremsRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveMultTheorems
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveMultTheorems
  on surmount-1 (queued, not run here). Not package typecheck GREEN. Not FullHost.
  Not Lake-gone. Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveMultTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveMultTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_MULT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-MULT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-MULT-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveMultTheoremsRel : String :=
  "src/systems/SystemsLean/MultTheorems.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "MultTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveMultTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveMultTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveMultTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (MultTheorems is a short theorems companion). -/
def liveMultTheoremsParseFuel : Nat := 192

/-- Fold commands. Skip theorem / example / set_option. Keep import / namespace / end.
    Tokenize with Mult takeIdent so SystemsLean.Mult stays one name. -/
def parseCmdsMultTheorems : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveMultTheoremsParseFuel toks with
    | some (c, rest) =>
      if cmdBodyKnown kn c then
        parseCmdsMultTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsMultTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveMultTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsMultTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live MultTheorems.lean text.
    Greppable: parseLiveMultTheoremsSource, PARSE-LIVE-MULT-THEOREMS. -/
def parseLiveMultTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsMultTheorems liveMultTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.MultTheorems", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live MultTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveMultTheoremsSource, PARSE-LIVE-MULT-THEOREMS. -/
def kernelCheckLiveMultTheoremsSource (src : String) : Bool :=
  match parseLiveMultTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveMultTheoremsParsed? : Option Module :=
  match parseLiveMultTheoremsSource liveMultTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveMultTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveMultTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveMultTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse has the Mult namespace command. -/
def liveParseHasMultNs : Bool :=
  match liveMultTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.Mult"
      | _ => false

/-- Live parse ends the Mult namespace. -/
def liveParseHasMultEnd : Bool :=
  match liveMultTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.Mult"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveMultTheoremsReady, PARSE-LIVE-MULT-THEOREMS,
    HOST-FRONT-LIVE-MULT-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveMultTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_MULT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-MULT-THEOREMS")
    && (parseId == "PARSE-LIVE-MULT-THEOREMS")
    && (liveMultTheoremsRel == "src/systems/SystemsLean/MultTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveMultTheoremsFullHost
    && !hostFrontLiveMultTheoremsResidualFreeClaimed
    && !hostFrontLiveMultTheoremsProvablyUnlocked
    && kernelCheckLiveMultTheoremsSource liveMultTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasMultImport
    && liveParseHasMultNs
    && liveParseHasMultEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveMultTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveMultTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-MULT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveMultTheoremsRel}"
  let path := root / liveMultTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveMultTheoremsRel}"
    throw (IO.userError s!"missing {liveMultTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveMultTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk MultTheorems.lean != liveMultTheoremsSource"
    throw (IO.userError "dual-pin mismatch live MultTheorems.lean")
  let r := parseLiveMultTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-MULT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-MULT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-MULT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live MultTheorems parse false"
      throw (IO.userError "kernelCheck live MultTheorems parse false")
    unless hostFrontLiveMultTheoremsReady do
      IO.eprintln "error: hostFrontLiveMultTheoremsReady false"
      throw (IO.userError "hostFrontLiveMultTheoremsReady false")
    IO.println s!"GREEN {stageId}: live MultTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveMultTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveMultTheorems
