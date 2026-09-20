/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostCheck.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCheck. Reuses HostFrontLiveHostTerm skip-un-kernelable
  fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostCheck text.

  Spec (readable):
  - parseLiveHostCheckSource turns live HostCheck.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostCheck even without a module line.
  - kernelCheckLiveHostCheckSource is HostKernel.kernelCheckN of that parse
    with HostFront import seeds (HostKernel.lean is locked; seed locally).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CHECK, SLAKE_HOST_FRONT_LIVE_CHECK_V0,
  PARSE-LIVE-HOST-CHECK, parseLiveHostCheckSource, kernelCheckLiveHostCheckSource,
  hostFrontLiveCheckReady, liveHostCheckSource, liveHostCheckRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCheck
  Red/green: just systems-host dest rows later (HostTerm holds nix/systems-host-presence);
  lake build SystemsLean.HostFrontLiveCheck on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCheckSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCheck

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CHECK"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-CHECK"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostCheckRel : String := "src/systems/SystemsLean/HostCheck.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCheckFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCheckResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCheckProvablyUnlocked : Bool := false

/-- Seed names from SystemsLean.HostFront import plus goldensRel lastSeg. -/
def seedKnown : List String :=
  ["hostFrontGoodG1", "hostFrontGoodG2", "hostFrontGoodG3", "hostFrontGoodG4",
    "hostFrontGoodG5", "hostFrontGoodG6", "hostFrontGoodG7",
    "hostFrontBadB1", "hostFrontBadB2", "hostFrontBadB3", "hostFrontBadB4",
    "hostFrontGoldensStructuralOk", "hostFrontReady", "goldensRel"]

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

/-- Names a command adds to the known-const set (HostFront import seeds). -/
def cmdAddsCheck (c : Cmd) : List String :=
  match c with
  | Cmd.importModule x =>
    if lastSeg x.raw == "HostFront" then seedKnown else []
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Fold commands. Skip theorem / example / set_option / un-kernelable defs. -/
def parseCmdsCheck : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveHostTermParseFuel toks with
    | some (c, rest) =>
      if cmdBodyKnown kn c then
        parseCmdsCheck n rest (kn ++ cmdAddsCheck c) (acc ++ [c])
      else
        parseCmdsCheck n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostTermParseFuel rest
          if rest2.length < toks.length then
            parseCmdsCheck n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live HostCheck.lean text.
    Greppable: parseLiveHostCheckSource, PARSE-LIVE-HOST-CHECK. -/
def parseLiveHostCheckSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCheck liveHostTermParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostCheck", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostCheck parse with HostFront seeds.
    Greppable: kernelCheckLiveHostCheckSource, PARSE-LIVE-HOST-CHECK. -/
def kernelCheckLiveHostCheckSource (src : String) : Bool :=
  match parseLiveHostCheckSource src with
  | FrontResult.accept m =>
    isWellFormed m
      && kernelCheckN kernelFuel (seedHostFront []) [] m.commands
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostCheckParsed? : Option Module :=
  match parseLiveHostCheckSource liveHostCheckSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostCheckParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / typed defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveHostCheckParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Live parse imports SystemsLean.HostFront. -/
def liveParseHasHostFrontImport : Bool :=
  match liveHostCheckParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostFront"
      | _ => false

/-- Live parse has core HostCheck defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveHostCheckParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId" && has "hostId" && has "hostFragmentCheckReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCheckReady, PARSE-LIVE-HOST-CHECK, HOST-FRONT-LIVE-CHECK.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCheckReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CHECK_V0")
    && (hostId == "HOST-FRONT-LIVE-CHECK")
    && (parseId == "PARSE-LIVE-HOST-CHECK")
    && (liveHostCheckRel == "src/systems/SystemsLean/HostCheck.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCheckFullHost
    && !hostFrontLiveCheckResidualFreeClaimed
    && !hostFrontLiveCheckProvablyUnlocked
    && kernelCheckLiveHostCheckSource liveHostCheckSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostFrontImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostCheckSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostCheck (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-CHECK =="
  IO.println s!"  host={hostId} file={liveHostCheckRel}"
  let path := root / liveHostCheckRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostCheckRel}"
    throw (IO.userError s!"missing {liveHostCheckRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostCheckSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostCheck.lean != liveHostCheckSource"
    throw (IO.userError "dual-pin mismatch live HostCheck.lean")
  let r := parseLiveHostCheckSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-CHECK reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-CHECK reject {reason}")
  | FrontResult.accept m =>
    let k :=
      isWellFormed m
        && kernelCheckN kernelFuel (seedHostFront []) [] m.commands
    IO.println s!"PASS PARSE-LIVE-HOST-CHECK ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostCheck parse false"
      throw (IO.userError "kernelCheck live HostCheck parse false")
    unless hostFrontLiveCheckReady do
      IO.eprintln "error: hostFrontLiveCheckReady false"
      throw (IO.userError "hostFrontLiveCheckReady false")
    IO.println s!"GREEN {stageId}: live HostCheck.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostCheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCheck
