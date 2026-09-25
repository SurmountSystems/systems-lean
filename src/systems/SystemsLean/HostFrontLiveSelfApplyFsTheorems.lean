/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SelfApplyFsTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfApplyFsTheorems. Reuses HostFrontLiveHostTerm
  skip of theorem / example / set_option (and skip open as un-kernelable).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on SelfApplyFsTheorems text.
  Not HostFrontLiveSelfApplyFs (that live parser is a different slice).

  Spec (readable):
  - parseLiveSelfApplyFsTheoremsSource turns live SelfApplyFsTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.SelfApplyFsTheorems even without a module
    line.
  - kernelCheckLiveSelfApplyFsTheoremsSource is HostKernel.kernelCheck of
    that parse. Import SystemsLean.SelfApplyFs and
    SystemsLean.SelfApplyFsClose pass through. Not kernelCheckMultFixture.
  - Product ids SELF-APPLY-FS-THEOREM and SELF-APPLY-FS-SMOKE stay on the
    live file. This parser does not change those claims.

  Theorems, examples, set_option, and open skip until the next command. Kept
  commands are import, namespace, and end. The live file keeps 4 commands:
  import SystemsLean.SelfApplyFs, import SystemsLean.SelfApplyFsClose,
  namespace SystemsLean.SelfApplyFs, and end SystemsLean.SelfApplyFs.
  401 top-level command lines, so parse fuel is 2048, not 256.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live SelfApplyFs.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70.
  - Host tools stay 69 of 69. Not Lake-gone.
  - Not freestanding residual free. Not PROVABLY.
  - Not package-typecheck ownership.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SELFAPPLYFSTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_SELFAPPLYFSTHEOREMS_V0,
  PARSE-LIVE-SELFAPPLYFSTHEOREMS, parseLiveSelfApplyFsTheoremsSource,
  kernelCheckLiveSelfApplyFsTheoremsSource,
  hostFrontLiveSelfApplyFsTheoremsReady, liveSelfApplyFsTheoremsSource,
  liveRel, liveSelfApplyFsTheoremsRel, SELF-APPLY-FS-THEOREM,
  SELF-APPLY-FS-SMOKE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSelfApplyFsTheorems
  Red/green: just slake-typecheck-selfapplyfstheorems (lean --run; no mill;
  no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfApplyFsTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfApplyFsTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SELFAPPLYFSTHEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELFAPPLYFSTHEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELFAPPLYFSTHEOREMS"

/-- Live file basename. The driver joins src/systems/SystemsLean. -/
def liveRel : String := "SelfApplyFsTheorems.lean"

/-- Same dual-pin path. Greppable: liveSelfApplyFsTheoremsRel. -/
def liveSelfApplyFsTheoremsRel : String := liveRel

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfApplyFsTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSelfApplyFsTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSelfApplyFsTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel. 401 top-level commands; not 256. -/
def liveSelfApplyFsTheoremsParseFuel : Nat := 2048

/-- Skip open (un-kernelable) so kernelCheck sees import / namespace / end. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- Fold commands. Skip theorem / example / set_option / open. Keep import /
    namespace / end. Tokenize with Mult takeIdent so SystemsLean.SelfApplyFs
    stays one name. -/
def parseCmdsSelfApplyFsTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveSelfApplyFsTheoremsParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        parseCmdsSelfApplyFsTheorems n rest kn acc
      else if cmdBodyKnown kn c then
        parseCmdsSelfApplyFsTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsSelfApplyFsTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSelfApplyFsTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsSelfApplyFsTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live SelfApplyFsTheorems.lean text.
    Greppable: parseLiveSelfApplyFsTheoremsSource,
    PARSE-LIVE-SELFAPPLYFSTHEOREMS. -/
def parseLiveSelfApplyFsTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfApplyFsTheorems liveSelfApplyFsTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfApplyFsTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfApplyFsTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveSelfApplyFsTheoremsSource,
    PARSE-LIVE-SELFAPPLYFSTHEOREMS. -/
def kernelCheckLiveSelfApplyFsTheoremsSource (src : String) : Bool :=
  match parseLiveSelfApplyFsTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfApplyFsTheoremsParsed? : Option Module :=
  match parseLiveSelfApplyFsTheoremsSource liveSelfApplyFsTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfApplyFsTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound from the parse, not hardcoded true. Two imports plus
    namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfApplyFsTheoremsParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Live parse keeps only import / namespace / end (theorems and open skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveSelfApplyFsTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  match liveSelfApplyFsTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "SelfApplyFs"
      | _ => false

/-- Live parse imports SystemsLean.SelfApplyFsClose. -/
def liveParseHasSelfApplyFsCloseImport : Bool :=
  match liveSelfApplyFsTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "SelfApplyFsClose"
      | _ => false

/-- Live parse has the SelfApplyFs namespace command. -/
def liveParseHasSelfApplyFsNamespace : Bool :=
  match liveSelfApplyFsTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.SelfApplyFs"
      | _ => false

/-- Live parse ends the SelfApplyFs namespace. -/
def liveParseHasSelfApplyFsEnd : Bool :=
  match liveSelfApplyFsTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.SelfApplyFs"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSelfApplyFsTheoremsReady,
    PARSE-LIVE-SELFAPPLYFSTHEOREMS,
    HOST-FRONT-LIVE-SELFAPPLYFSTHEOREMS.
    Real conjunction: parse plus HostKernel.kernelCheck, plus honesty pins.
    Not hardcoded true. -/
def hostFrontLiveSelfApplyFsTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SELFAPPLYFSTHEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-SELFAPPLYFSTHEOREMS")
    && (parseId == "PARSE-LIVE-SELFAPPLYFSTHEOREMS")
    && (liveRel == "SelfApplyFsTheorems.lean")
    && (liveSelfApplyFsTheoremsRel == liveRel)
    && !hostFrontLiveSelfApplyFsTheoremsFullHost
    && !hostFrontLiveSelfApplyFsTheoremsResidualFreeClaimed
    && !hostFrontLiveSelfApplyFsTheoremsProvablyUnlocked
    && kernelCheckLiveSelfApplyFsTheoremsSource liveSelfApplyFsTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasSelfApplyFsImport
    && liveParseHasSelfApplyFsCloseImport
    && liveParseHasSelfApplyFsNamespace
    && liveParseHasSelfApplyFsEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfApplyFsTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSelfApplyFsTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELFAPPLYFSTHEOREMS =="
  IO.println s!"  host={hostId} file={liveRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRel}"
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSelfApplyFsTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfApplyFsTheorems.lean != liveSelfApplyFsTheoremsSource"
    throw (IO.userError "dual-pin mismatch live SelfApplyFsTheorems.lean")
  let r := parseLiveSelfApplyFsTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELFAPPLYFSTHEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELFAPPLYFSTHEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELFAPPLYFSTHEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfApplyFsTheorems parse false"
      throw (IO.userError "kernelCheck live SelfApplyFsTheorems parse false")
    unless hostFrontLiveSelfApplyFsTheoremsReady do
      IO.eprintln "error: hostFrontLiveSelfApplyFsTheoremsReady false"
      throw (IO.userError "hostFrontLiveSelfApplyFsTheoremsReady false")
    IO.println s!"GREEN {stageId}: live SelfApplyFsTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfApplyFsTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfApplyFsTheorems
