/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SelfHostBody.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfHostBody. Reuses HostFrontLiveHostTerm
  skip of theorem / example / set_option (and skip open as un-kernelable).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on SelfHostBody text.

  Spec (readable):
  - parseLiveSelfHostBodySource turns live SelfHostBody.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.SelfHostBody even without a module line.
  - kernelCheckLiveSelfHostBodySource is HostKernel.kernelCheck of that
    parse. It returns false on reject. Not the constant true.
    Not kernelCheckMultFixture.
  - Eighteen import last segments must be present: EmitMult, EmitLinear,
    EmitErasure, EmitExtract, EmitTypes, EmitProgram, EmitGraph,
    EmitCompose, EmitComposeScaffold, EmitPlan, EmitPlanScaffold,
    EmitApply, EmitApplyScaffold, EmitBody, EmitBodyScaffold,
    SelfApplyFs, LlvmHold, DualResidual.
  - String literal defs are kept by cmdBodyKnown. Every kept command is
    import, namespace, end, or def_. No Cmd.check. At least 20 commands.
  - Namespace and end are SystemsLean.SelfHostBody.
  - Stage ids SLAKE_SELF_HOST_BODY_V0, HOST-SELF-HOST-BODY, and
    SELF-HOST-BODY stay on the live file. This parser does not change
    those claims.

  Theorems, examples, set_option, and open skip until the next command.
  Conjunction defs that are not kernel-known are not kept. Parse fuel
  is 2048, not 256.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live SelfHostBodyTheorems.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70.
  - Host tools stay 69 of 69. Not Lake-gone.
  - Not freestanding residual free. Not PROVABLY.
  - Not package-typecheck ownership. Not a self-host claim.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SELFHOSTBODY,
  SLAKE_HOST_FRONT_LIVE_SELFHOSTBODY_V0,
  PARSE-LIVE-SELFHOSTBODY, parseLiveSelfHostBodySource,
  kernelCheckLiveSelfHostBodySource,
  hostFrontLiveSelfHostBodyReady, liveSelfHostBodySource,
  liveRel, liveSelfHostBodyRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSelfHostBody
  Red/green: just slake-typecheck-selfhostbody (lean --run; no mill;
  no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfHostBodySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfHostBody

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SELFHOSTBODY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELFHOSTBODY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELFHOSTBODY"

/-- Live file basename. The driver joins src/systems/SystemsLean. -/
def liveRel : String := "SelfHostBody.lean"

/-- Same dual-pin path. Greppable: liveSelfHostBodyRel. -/
def liveSelfHostBodyRel : String := liveRel

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfHostBodyFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSelfHostBodyResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSelfHostBodyProvablyUnlocked : Bool := false

/-- Parse fuel. Not 256. -/
def liveSelfHostBodyParseFuel : Nat := 2048

/-- Import last segments the live parse must contain. -/
def liveSelfHostBodyImportLasts : List String :=
  [ "EmitMult"
  , "EmitLinear"
  , "EmitErasure"
  , "EmitExtract"
  , "EmitTypes"
  , "EmitProgram"
  , "EmitGraph"
  , "EmitCompose"
  , "EmitComposeScaffold"
  , "EmitPlan"
  , "EmitPlanScaffold"
  , "EmitApply"
  , "EmitApplyScaffold"
  , "EmitBody"
  , "EmitBodyScaffold"
  , "SelfApplyFs"
  , "LlvmHold"
  , "DualResidual"
  ]

/-- Skip open (un-kernelable) so kernelCheck sees import / namespace / end / def_. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- Fold commands. Skip theorem / example / set_option / open. Keep import /
    namespace / end, and defs whose bodies cmdBodyKnown accepts (string
    literals). Tokenize with Mult takeIdent so SystemsLean.EmitMult stays
    one name. -/
def parseCmdsSelfHostBody : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveSelfHostBodyParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        parseCmdsSelfHostBody n rest kn acc
      else if cmdBodyKnown kn c then
        parseCmdsSelfHostBody n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsSelfHostBody n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSelfHostBodyParseFuel rest
          if rest2.length < toks.length then
            parseCmdsSelfHostBody n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live SelfHostBody.lean text.
    Greppable: parseLiveSelfHostBodySource, PARSE-LIVE-SELFHOSTBODY. -/
def parseLiveSelfHostBodySource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfHostBody liveSelfHostBodyParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfHostBody"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfHostBody parse. Not kernelCheckMultFixture.
    Not the constant true. Reject returns false.
    Greppable: kernelCheckLiveSelfHostBodySource, PARSE-LIVE-SELFHOSTBODY. -/
def kernelCheckLiveSelfHostBodySource (src : String) : Bool :=
  match parseLiveSelfHostBodySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfHostBodyParsed? : Option Module :=
  match parseLiveSelfHostBodySource liveSelfHostBodySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfHostBodyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Real lower bound from the parse, not
    hardcoded true. At least 20 kept commands. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfHostBodyParsed? with
  | some m => m.commands.length >= 20
  | none => false

/-- Every kept command is import, namespace, end, or def_.
    String literal defs are kept by cmdBodyKnown. defBind and check are not. -/
def liveParseKeptImportNsEndOrDef : Bool :=
  match liveSelfHostBodyParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | Cmd.def_ _ _ _ => true
      | _ => false

/-- Live parse contains every required import last segment. -/
def liveParseHasSelfHostBodyImports : Bool :=
  match liveSelfHostBodyParsed? with
  | none => false
  | some m =>
    liveSelfHostBodyImportLasts.all fun seg =>
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => lastSeg x.raw == seg
        | _ => false

/-- Live parse has the SelfHostBody namespace command. -/
def liveParseHasSelfHostBodyNamespace : Bool :=
  match liveSelfHostBodyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.SelfHostBody"
      | _ => false

/-- Live parse ends the SelfHostBody namespace. -/
def liveParseHasSelfHostBodyEnd : Bool :=
  match liveSelfHostBodyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.SelfHostBody"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSelfHostBodyReady,
    PARSE-LIVE-SELFHOSTBODY,
    HOST-FRONT-LIVE-SELFHOSTBODY.
    Real conjunction: parse plus HostKernel.kernelCheck, plus honesty pins.
    Not hardcoded true. liveParseOnlyImportNsEnd is not a conjunct. -/
def hostFrontLiveSelfHostBodyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SELFHOSTBODY_V0")
    && (hostId == "HOST-FRONT-LIVE-SELFHOSTBODY")
    && (parseId == "PARSE-LIVE-SELFHOSTBODY")
    && (liveRel == "SelfHostBody.lean")
    && (liveSelfHostBodyRel == liveRel)
    && !hostFrontLiveSelfHostBodyFullHost
    && !hostFrontLiveSelfHostBodyResidualFreeClaimed
    && !hostFrontLiveSelfHostBodyProvablyUnlocked
    && kernelCheckLiveSelfHostBodySource liveSelfHostBodySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseKeptImportNsEndOrDef
    && liveParseHasSelfHostBodyImports
    && liveParseHasSelfHostBodyNamespace
    && liveParseHasSelfHostBodyEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfHostBodySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSelfHostBody (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELFHOSTBODY =="
  IO.println s!"  host={hostId} file={liveRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRel}"
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSelfHostBodySource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfHostBody.lean != liveSelfHostBodySource"
    throw (IO.userError "dual-pin mismatch live SelfHostBody.lean")
  let r := parseLiveSelfHostBodySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELFHOSTBODY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELFHOSTBODY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELFHOSTBODY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfHostBody parse false"
      throw (IO.userError "kernelCheck live SelfHostBody parse false")
    unless hostFrontLiveSelfHostBodyReady do
      IO.eprintln "error: hostFrontLiveSelfHostBodyReady false"
      throw (IO.userError "hostFrontLiveSelfHostBodyReady false")
    IO.println s!"GREEN {stageId}: live SelfHostBody.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfHostBody root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfHostBody
