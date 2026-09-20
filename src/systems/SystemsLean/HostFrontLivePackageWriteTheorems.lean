/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostPackageWriteTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLivePackageWriteTheorems. Reuses HostFrontLiveHostTerm
  skip of theorem / example / set_option (and skip open as un-kernelable).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostPackageWriteTheorems text.
  Not HostFrontLivePackageWrite (non-Theorems live parser is a different slice).

  Spec (readable):
  - parseLivePackageWriteTheoremsSource turns live HostPackageWriteTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostPackageWriteTheorems even without a module
    line.
  - kernelCheckLivePackageWriteTheoremsSource is HostKernel.kernelCheck of that
    parse (no local HostFront/HostGraph seed env; theorems companion has no
    kernelable defs).

  Theorems, examples, set_option, and open skip until the next command. Kept
  commands are import, namespace, and end.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostPackageWrite.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_THEOREMS_V0,
  PARSE-LIVE-PACKAGEWRITE-THEOREMS, parseLivePackageWriteTheoremsSource,
  kernelCheckLivePackageWriteTheoremsSource,
  hostFrontLivePackageWriteTheoremsReady, livePackageWriteTheoremsSource,
  livePackageWriteTheoremsRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLivePackageWriteTheorems
  Red/green: just systems-host; lake build
  SystemsLean.HostFrontLivePackageWriteTheorems on surmount-1 (queued, not run
  here). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLivePackageWriteTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLivePackageWriteTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PACKAGEWRITE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def livePackageWriteTheoremsRel : String :=
  "src/systems/SystemsLean/HostPackageWriteTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLivePackageWriteTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLivePackageWriteTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLivePackageWriteTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (HostPackageWriteTheorems is a theorems companion). -/
def livePackageWriteTheoremsParseFuel : Nat := 256

/-- Skip open (un-kernelable) so kernelCheck sees import / namespace / end. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- Fold commands. Skip theorem / example / set_option / open. Keep import /
    namespace / end. Tokenize with Mult takeIdent so SystemsLean.HostPackageWrite
    stays one name. -/
def parseCmdsPackageWriteTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt livePackageWriteTheoremsParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        parseCmdsPackageWriteTheorems n rest kn acc
      else if cmdBodyKnown kn c then
        parseCmdsPackageWriteTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsPackageWriteTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd livePackageWriteTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsPackageWriteTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostPackageWriteTheorems.lean text.
    Greppable: parseLivePackageWriteTheoremsSource,
    PARSE-LIVE-PACKAGEWRITE-THEOREMS. -/
def parseLivePackageWriteTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPackageWriteTheorems livePackageWriteTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostPackageWriteTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostPackageWriteTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLivePackageWriteTheoremsSource,
    PARSE-LIVE-PACKAGEWRITE-THEOREMS. -/
def kernelCheckLivePackageWriteTheoremsSource (src : String) : Bool :=
  match parseLivePackageWriteTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def livePackageWriteTheoremsParsed? : Option Module :=
  match parseLivePackageWriteTheoremsSource livePackageWriteTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match livePackageWriteTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match livePackageWriteTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Live parse imports SystemsLean.HostPackageWrite. -/
def liveParseHasHostPackageWriteImport : Bool :=
  match livePackageWriteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostPackageWrite"
      | _ => false

/-- Live parse has the HostPackageWrite namespace command. -/
def liveParseHasHostPackageWriteNs : Bool :=
  match livePackageWriteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostPackageWrite"
      | _ => false

/-- Live parse ends the HostPackageWrite namespace. -/
def liveParseHasHostPackageWriteEnd : Bool :=
  match livePackageWriteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostPackageWrite"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLivePackageWriteTheoremsReady,
    PARSE-LIVE-PACKAGEWRITE-THEOREMS,
    HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLivePackageWriteTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PACKAGEWRITE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PACKAGEWRITE-THEOREMS")
    && (parseId == "PARSE-LIVE-PACKAGEWRITE-THEOREMS")
    && (livePackageWriteTheoremsRel ==
      "src/systems/SystemsLean/HostPackageWriteTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLivePackageWriteTheoremsFullHost
    && !hostFrontLivePackageWriteTheoremsResidualFreeClaimed
    && !hostFrontLivePackageWriteTheoremsProvablyUnlocked
    && kernelCheckLivePackageWriteTheoremsSource livePackageWriteTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostPackageWriteImport
    && liveParseHasHostPackageWriteNs
    && liveParseHasHostPackageWriteEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLivePackageWriteTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLivePackageWriteTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PACKAGEWRITE-THEOREMS =="
  IO.println s!"  host={hostId} file={livePackageWriteTheoremsRel}"
  let path := root / livePackageWriteTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {livePackageWriteTheoremsRel}"
    throw (IO.userError s!"missing {livePackageWriteTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != livePackageWriteTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostPackageWriteTheorems.lean != livePackageWriteTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostPackageWriteTheorems.lean")
  let r := parseLivePackageWriteTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PACKAGEWRITE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PACKAGEWRITE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PACKAGEWRITE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostPackageWriteTheorems parse false"
      throw (IO.userError "kernelCheck live HostPackageWriteTheorems parse false")
    unless hostFrontLivePackageWriteTheoremsReady do
      IO.eprintln "error: hostFrontLivePackageWriteTheoremsReady false"
      throw (IO.userError "hostFrontLivePackageWriteTheoremsReady false")
    IO.println s!"GREEN {stageId}: live HostPackageWriteTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLivePackageWriteTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLivePackageWriteTheorems
