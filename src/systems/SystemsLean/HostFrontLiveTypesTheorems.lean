/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/TypesTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveTypesTheorems. Reuses HostFrontLiveHostTerm
  skip of theorem / example / set_option (and skip open as un-kernelable).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on TypesTheorems text.
  Not HostFrontLiveTypes (non-Theorems live parser is a different slice).

  Spec (readable):
  - parseLiveTypesTheoremsSource turns live TypesTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.TypesTheorems even without a module
    line.
  - kernelCheckLiveTypesTheoremsSource is HostKernel.kernelCheck of that
    parse (import SystemsLean.Mult seeds Mult, import SystemsLean.Types
    seeds Types; other imports including MultTheorems pass through).

  Theorems, examples, set_option, and open skip until the next command. Kept
  commands are import, namespace, and end.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live Types.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-TYPESTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_TYPESTHEOREMS_V0,
  PARSE-LIVE-TYPESTHEOREMS, parseLiveTypesTheoremsSource,
  kernelCheckLiveTypesTheoremsSource,
  hostFrontLiveTypesTheoremsReady, liveTypesTheoremsSource,
  liveTypesTheoremsRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveTypesTheorems
  Red/green: just systems-host; lake build
  SystemsLean.HostFrontLiveTypesTheorems on surmount-1 (queued, not run
  here). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveTypesTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveTypesTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_TYPESTHEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-TYPESTHEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-TYPESTHEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveTypesTheoremsRel : String :=
  "src/systems/SystemsLean/TypesTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveTypesTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveTypesTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveTypesTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (TypesTheorems is a theorems companion). -/
def liveTypesTheoremsParseFuel : Nat := 256

/-- Skip open (un-kernelable) so kernelCheck sees import / namespace / end. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- Fold commands. Skip theorem / example / set_option / open. Keep import /
    namespace / end. Tokenize with Mult takeIdent so SystemsLean.Types
    stays one name. -/
def parseCmdsTypesTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveTypesTheoremsParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        parseCmdsTypesTheorems n rest kn acc
      else if cmdBodyKnown kn c then
        parseCmdsTypesTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsTypesTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveTypesTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsTypesTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live TypesTheorems.lean text.
    Greppable: parseLiveTypesTheoremsSource,
    PARSE-LIVE-TYPESTHEOREMS. -/
def parseLiveTypesTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsTypesTheorems liveTypesTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.TypesTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live TypesTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveTypesTheoremsSource,
    PARSE-LIVE-TYPESTHEOREMS. -/
def kernelCheckLiveTypesTheoremsSource (src : String) : Bool :=
  match parseLiveTypesTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveTypesTheoremsParsed? : Option Module :=
  match parseLiveTypesTheoremsSource liveTypesTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveTypesTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound, not hardcoded true. Three imports plus ns plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveTypesTheoremsParsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Live parse keeps only import / namespace / end (theorems and open skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveTypesTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveTypesTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse imports SystemsLean.MultTheorems. -/
def liveParseHasMultTheoremsImport : Bool :=
  match liveTypesTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "MultTheorems"
      | _ => false

/-- Live parse imports SystemsLean.Types. -/
def liveParseHasTypesImport : Bool :=
  match liveTypesTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Types"
      | _ => false

/-- Live parse has the Types namespace command. -/
def liveParseHasTypesNamespace : Bool :=
  match liveTypesTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.Types"
      | _ => false

/-- Live parse ends the Types namespace. -/
def liveParseHasTypesEnd : Bool :=
  match liveTypesTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.Types"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveTypesTheoremsReady,
    PARSE-LIVE-TYPESTHEOREMS,
    HOST-FRONT-LIVE-TYPESTHEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveTypesTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_TYPESTHEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-TYPESTHEOREMS")
    && (parseId == "PARSE-LIVE-TYPESTHEOREMS")
    && (liveTypesTheoremsRel ==
      "src/systems/SystemsLean/TypesTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveTypesTheoremsFullHost
    && !hostFrontLiveTypesTheoremsResidualFreeClaimed
    && !hostFrontLiveTypesTheoremsProvablyUnlocked
    && kernelCheckLiveTypesTheoremsSource liveTypesTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasMultImport
    && liveParseHasMultTheoremsImport
    && liveParseHasTypesImport
    && liveParseHasTypesNamespace
    && liveParseHasTypesEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveTypesTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveTypesTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-TYPESTHEOREMS =="
  IO.println s!"  host={hostId} file={liveTypesTheoremsRel}"
  let path := root / liveTypesTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveTypesTheoremsRel}"
    throw (IO.userError s!"missing {liveTypesTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveTypesTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk TypesTheorems.lean != liveTypesTheoremsSource"
    throw (IO.userError "dual-pin mismatch live TypesTheorems.lean")
  let r := parseLiveTypesTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-TYPESTHEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-TYPESTHEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-TYPESTHEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live TypesTheorems parse false"
      throw (IO.userError "kernelCheck live TypesTheorems parse false")
    unless hostFrontLiveTypesTheoremsReady do
      IO.eprintln "error: hostFrontLiveTypesTheoremsReady false"
      throw (IO.userError "hostFrontLiveTypesTheoremsReady false")
    IO.println s!"GREEN {stageId}: live TypesTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveTypesTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveTypesTheorems
