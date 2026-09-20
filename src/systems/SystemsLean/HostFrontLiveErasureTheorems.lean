/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/ErasureTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveErasureTheorems. Reuses HostFrontLiveHostTerm skip of
  theorem / example / set_option. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on ErasureTheorems text.
  Not HostFrontLiveErasure (that parser is live Erasure.lean defs).

  Spec (readable):
  - parseLiveErasureTheoremsSource turns live ErasureTheorems.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.ErasureTheorems even without a module line.
  - kernelCheckLiveErasureTheoremsSource is HostKernel.kernelCheck of that parse.

  Theorems skip until the next command. Kept commands are import, namespace,
  end, and open (open SystemsLean.Mult (Mult) maps to Cmd.openNs [Mult];
  kernelCheck accepts Cmd.openNs).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Erasure.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-ERASURE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_ERASURE_THEOREMS_V0, PARSE-LIVE-ERASURE-THEOREMS,
  parseLiveErasureTheoremsSource, kernelCheckLiveErasureTheoremsSource,
  hostFrontLiveErasureTheoremsReady, liveErasureTheoremsSource,
  liveErasureTheoremsRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveErasureTheorems
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveErasureTheorems
  on surmount-1 (queued, not run here). Not package typecheck GREEN. Not FullHost.
  Not Lake-gone. Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveErasureTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveErasureTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_ERASURE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-ERASURE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-ERASURE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveErasureTheoremsRel : String :=
  "src/systems/SystemsLean/ErasureTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveErasureTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveErasureTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveErasureTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (ErasureTheorems is a short theorems companion). -/
def liveErasureTheoremsParseFuel : Nat := 192

/-- Fold commands. Skip theorem / example / set_option. Keep import / namespace /
    end / open. Tokenize with Mult takeIdent so SystemsLean.Erasure stays one name. -/
def parseCmdsErasureTheorems : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveErasureTheoremsParseFuel toks with
    | some (c, rest) =>
      if cmdBodyKnown kn c then
        parseCmdsErasureTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsErasureTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveErasureTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsErasureTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live ErasureTheorems.lean text.
    Greppable: parseLiveErasureTheoremsSource, PARSE-LIVE-ERASURE-THEOREMS. -/
def parseLiveErasureTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsErasureTheorems liveErasureTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ErasureTheorems", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ErasureTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveErasureTheoremsSource, PARSE-LIVE-ERASURE-THEOREMS. -/
def kernelCheckLiveErasureTheoremsSource (src : String) : Bool :=
  match parseLiveErasureTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveErasureTheoremsParsed? : Option Module :=
  match parseLiveErasureTheoremsSource liveErasureTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveErasureTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / end after theorem skip).
    Real lower bound, not hardcoded true. Two imports + ns + open + end. -/
def liveParseCmdCountOk : Bool :=
  match liveErasureTheoremsParsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Live parse imports SystemsLean.Erasure. -/
def liveParseHasErasureImport : Bool :=
  match liveErasureTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Erasure"
      | _ => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveErasureTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse has the Erasure namespace command. -/
def liveParseHasErasureNs : Bool :=
  match liveErasureTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.Erasure"
      | _ => false

/-- Live parse ends the Erasure namespace. -/
def liveParseHasErasureEnd : Bool :=
  match liveErasureTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.Erasure"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveErasureTheoremsReady, PARSE-LIVE-ERASURE-THEOREMS,
    HOST-FRONT-LIVE-ERASURE-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveErasureTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_ERASURE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-ERASURE-THEOREMS")
    && (parseId == "PARSE-LIVE-ERASURE-THEOREMS")
    && (liveErasureTheoremsRel == "src/systems/SystemsLean/ErasureTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveErasureTheoremsFullHost
    && !hostFrontLiveErasureTheoremsResidualFreeClaimed
    && !hostFrontLiveErasureTheoremsProvablyUnlocked
    && kernelCheckLiveErasureTheoremsSource liveErasureTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasErasureImport
    && liveParseHasMultImport
    && liveParseHasErasureNs
    && liveParseHasErasureEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveErasureTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveErasureTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-ERASURE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveErasureTheoremsRel}"
  let path := root / liveErasureTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveErasureTheoremsRel}"
    throw (IO.userError s!"missing {liveErasureTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveErasureTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ErasureTheorems.lean != liveErasureTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ErasureTheorems.lean")
  let r := parseLiveErasureTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-ERASURE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-ERASURE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-ERASURE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ErasureTheorems parse false"
      throw (IO.userError "kernelCheck live ErasureTheorems parse false")
    unless hostFrontLiveErasureTheoremsReady do
      IO.eprintln "error: hostFrontLiveErasureTheoremsReady false"
      throw (IO.userError "hostFrontLiveErasureTheoremsReady false")
    IO.println s!"GREEN {stageId}: live ErasureTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveErasureTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveErasureTheorems
