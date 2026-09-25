/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/ExtractTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveExtractTheorems. Reuses HostFrontLiveHostTerm skip of
  theorem / example / set_option. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on ExtractTheorems text.
  Not HostFrontLiveExtract (that parser is live Extract.lean defs).

  Spec (readable):
  - parseLiveExtractTheoremsSource turns live ExtractTheorems.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.ExtractTheorems even without a module line.
  - kernelCheckLiveExtractTheoremsSource is HostKernel.kernelCheck of that parse.

  Theorems skip until the next command. Kept commands are import, namespace,
  end, and open (open SystemsLean.Mult (Mult) maps to Cmd.openNs [Mult];
  open SystemsLean.Erasure (Erased) maps to Cmd.openNs [Erased];
  kernelCheck accepts Cmd.openNs).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Extract.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EXTRACT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_EXTRACT_THEOREMS_V0, PARSE-LIVE-EXTRACT-THEOREMS,
  parseLiveExtractTheoremsSource, kernelCheckLiveExtractTheoremsSource,
  hostFrontLiveExtractTheoremsReady, liveExtractTheoremsSource,
  liveExtractTheoremsRel, liveRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveExtractTheorems
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveExtractTheorems
  on surmount-1 (queued, not run here). Not package typecheck GREEN. Not FullHost.
  Not Lake-gone. Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveExtractTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveExtractTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EXTRACT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EXTRACT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EXTRACT-THEOREMS"

/-- Live basename. Greppable: liveRel. Must be ExtractTheorems.lean. -/
def liveRel : String := "ExtractTheorems.lean"

/-- Live file relative to repo root. Dual-pin path.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveExtractTheoremsRel : String :=
  "src/systems/SystemsLean/ExtractTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveExtractTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveExtractTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveExtractTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (ExtractTheorems is a theorems companion). -/
def liveExtractTheoremsParseFuel : Nat := 256

/-- Fold commands. Skip theorem / example / set_option. Keep import / namespace /
    end / open. Tokenize with Mult takeIdent so SystemsLean.Extract stays one name. -/
def parseCmdsExtractTheorems : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveExtractTheoremsParseFuel toks with
    | some (c, rest) =>
      if cmdBodyKnown kn c then
        parseCmdsExtractTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsExtractTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveExtractTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsExtractTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live ExtractTheorems.lean text.
    Greppable: parseLiveExtractTheoremsSource, PARSE-LIVE-EXTRACT-THEOREMS. -/
def parseLiveExtractTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsExtractTheorems liveExtractTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ExtractTheorems", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ExtractTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveExtractTheoremsSource, PARSE-LIVE-EXTRACT-THEOREMS. -/
def kernelCheckLiveExtractTheoremsSource (src : String) : Bool :=
  match parseLiveExtractTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveExtractTheoremsParsed? : Option Module :=
  match parseLiveExtractTheoremsSource liveExtractTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveExtractTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / end after theorem skip).
    Real lower bound, not hardcoded true. Three imports + ns + two opens + end. -/
def liveParseCmdCountOk : Bool :=
  match liveExtractTheoremsParsed? with
  | some m => m.commands.length >= 7
  | none => false

/-- Live parse imports SystemsLean.Extract. -/
def liveParseHasExtractImport : Bool :=
  match liveExtractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Extract"
      | _ => false

/-- Live parse imports SystemsLean.Erasure. -/
def liveParseHasErasureImport : Bool :=
  match liveExtractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Erasure"
      | _ => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveExtractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse has the Extract namespace command. -/
def liveParseHasExtractNs : Bool :=
  match liveExtractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.Extract"
      | _ => false

/-- Live parse ends the Extract namespace. -/
def liveParseHasExtractEnd : Bool :=
  match liveExtractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.Extract"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveExtractTheoremsReady, PARSE-LIVE-EXTRACT-THEOREMS,
    HOST-FRONT-LIVE-EXTRACT-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveExtractTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EXTRACT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-EXTRACT-THEOREMS")
    && (parseId == "PARSE-LIVE-EXTRACT-THEOREMS")
    && (liveExtractTheoremsRel == "src/systems/SystemsLean/ExtractTheorems.lean")
    && (liveRel == "ExtractTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveExtractTheoremsFullHost
    && !hostFrontLiveExtractTheoremsResidualFreeClaimed
    && !hostFrontLiveExtractTheoremsProvablyUnlocked
    && kernelCheckLiveExtractTheoremsSource liveExtractTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasExtractImport
    && liveParseHasErasureImport
    && liveParseHasMultImport
    && liveParseHasExtractNs
    && liveParseHasExtractEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveExtractTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveExtractTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EXTRACT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveExtractTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "ExtractTheorems.lean") do
    IO.eprintln "error: liveRel must be ExtractTheorems.lean"
    throw (IO.userError "liveRel must be ExtractTheorems.lean")
  let path := root / liveExtractTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveExtractTheoremsRel}"
    throw (IO.userError s!"missing {liveExtractTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveExtractTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ExtractTheorems.lean != liveExtractTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ExtractTheorems.lean")
  let r := parseLiveExtractTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EXTRACT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EXTRACT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EXTRACT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ExtractTheorems parse false"
      throw (IO.userError "kernelCheck live ExtractTheorems parse false")
    unless hostFrontLiveExtractTheoremsReady do
      IO.eprintln "error: hostFrontLiveExtractTheoremsReady false"
      throw (IO.userError "hostFrontLiveExtractTheoremsReady false")
    IO.println s!"GREEN {stageId}: live ExtractTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveExtractTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveExtractTheorems
