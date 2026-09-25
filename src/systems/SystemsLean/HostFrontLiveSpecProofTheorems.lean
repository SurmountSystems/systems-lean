/-
  SYSTEMS_LEAN_HOST partial -- parse live SpecProofTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSpecProofTheorems. Reuses HostFrontLiveHostTerm
  skip of theorem / example / set_option (and skip open as un-kernelable).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on SpecProofTheorems text.
  Not HostFrontLiveSpecProof (that live parser is a different slice).

  Spec (readable):
  - parseLiveSpecProofTheoremsSource turns live SpecProofTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.SpecProofTheorems even without a module
    line.
  - kernelCheckLiveSpecProofTheoremsSource is HostKernel.kernelCheck of
    that parse. Not kernelCheckMultFixture. Not the constant true.
  - Product ids SPEC-PROOF-THEOREM and SPEC-PROOF-SMOKE stay on the
    live file as source needles. This parser does not change those claims.
  - proofCompleteClaimed stays as it is in the live file. This parser
    does not flip it.

  Theorems, examples, set_option, and open skip until the next command. Kept
  commands are import, namespace, and end. The live file imports
  ProbeWire, DualResidual, ProductPath, InventoryClose, SelfApplyFs,
  LlvmHold, and SpecProof, then namespace SystemsLean.SpecProof and its end.
  66 top-level command lines, so parse fuel is 2048, not 256.

  Disk path is repo root / "src/systems/SystemsLean" / liveRel.
  liveRel is the bare name SpecProofTheorems.lean, not a repo-root path.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live SpecProof.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70.
  - Host tools stay 69 of 69. Not Lake-gone.
  - Not freestanding residual free. Not PROVABLY.
  - Not package-typecheck ownership.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SPECPROOFTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_SPECPROOFTHEOREMS_V0,
  PARSE-LIVE-SPECPROOFTHEOREMS, parseLiveSpecProofTheoremsSource,
  kernelCheckLiveSpecProofTheoremsSource,
  hostFrontLiveSpecProofTheoremsReady, liveSpecProofTheoremsSource,
  liveRel, liveSpecProofTheoremsRel, SPEC-PROOF-THEOREM,
  SPEC-PROOF-SMOKE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveSpecProofTheorems
  Red/green: just slake-typecheck-specprooftheorems (lean --run; no mill;
  no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSpecProofTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSpecProofTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SPECPROOFTHEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SPECPROOFTHEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SPECPROOFTHEOREMS"

/-- Live file basename. Dual-pin name. Not a repo-root path. -/
def liveRel : String := "SpecProofTheorems.lean"

/-- Same bare basename. Greppable: liveSpecProofTheoremsRel. -/
def liveSpecProofTheoremsRel : String := liveRel

/-- Directory under the repo root that holds the live file. -/
def liveDir : String := "src/systems/SystemsLean"

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSpecProofTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSpecProofTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSpecProofTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel. 66 top-level commands; not 256. -/
def liveSpecProofTheoremsParseFuel : Nat := 2048

/-- Source needle. Do not rename. The token is not end-of-line in the
    live file, so the literal is the token, as in the ProductPathTheorems
    exemplar. A newline inside this literal would miss every occurrence. -/
def needleSpecProofTheorem : String := "SPEC-PROOF-THEOREM"

/-- Source needle. Do not rename. Same encoding as needleSpecProofTheorem. -/
def needleSpecProofSmoke : String := "SPEC-PROOF-SMOKE"

/-- Skip open (un-kernelable) so kernelCheck sees import / namespace / end. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- Fold commands. Skip theorem / example / set_option / open. Keep import /
    namespace / end. Tokenize with Mult takeIdent so SystemsLean.SpecProof
    stays one name. -/
def parseCmdsSpecProofTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveSpecProofTheoremsParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        parseCmdsSpecProofTheorems n rest kn acc
      else if cmdBodyKnown kn c then
        parseCmdsSpecProofTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsSpecProofTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSpecProofTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsSpecProofTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live SpecProofTheorems.lean text.
    Greppable: parseLiveSpecProofTheoremsSource,
    PARSE-LIVE-SPECPROOFTHEOREMS. -/
def parseLiveSpecProofTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSpecProofTheorems liveSpecProofTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SpecProofTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SpecProofTheorems parse. Not kernelCheckMultFixture.
    Not the constant true.
    Greppable: kernelCheckLiveSpecProofTheoremsSource,
    PARSE-LIVE-SPECPROOFTHEOREMS. -/
def kernelCheckLiveSpecProofTheoremsSource (src : String) : Bool :=
  match parseLiveSpecProofTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSpecProofTheoremsParsed? : Option Module :=
  match parseLiveSpecProofTheoremsSource liveSpecProofTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSpecProofTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound from the parse, not hardcoded true. Seven imports plus
    namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveSpecProofTheoremsParsed? with
  | some m => m.commands.length >= 9
  | none => false

/-- Live parse keeps only import / namespace / end (theorems and open skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveSpecProofTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- True when the live parse kept an import whose last segment is `seg`. -/
def liveParseHasImport (seg : String) : Bool :=
  match liveSpecProofTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == seg
      | _ => false

/-- Live parse imports SystemsLean.ProbeWire. -/
def liveParseHasProbeWireImport : Bool :=
  liveParseHasImport "ProbeWire"

/-- Live parse imports SystemsLean.DualResidual. -/
def liveParseHasDualResidualImport : Bool :=
  liveParseHasImport "DualResidual"

/-- Live parse imports SystemsLean.ProductPath. -/
def liveParseHasProductPathImport : Bool :=
  liveParseHasImport "ProductPath"

/-- Live parse imports SystemsLean.InventoryClose. -/
def liveParseHasInventoryCloseImport : Bool :=
  liveParseHasImport "InventoryClose"

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  liveParseHasImport "SelfApplyFs"

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  liveParseHasImport "LlvmHold"

/-- Live parse imports SystemsLean.SpecProof. -/
def liveParseHasSpecProofImport : Bool :=
  liveParseHasImport "SpecProof"

/-- Live parse has every import the product file actually contains. -/
def liveParseHasRequiredImports : Bool :=
  liveParseHasProbeWireImport
    && liveParseHasDualResidualImport
    && liveParseHasProductPathImport
    && liveParseHasInventoryCloseImport
    && liveParseHasSelfApplyFsImport
    && liveParseHasLlvmHoldImport
    && liveParseHasSpecProofImport

/-- Live parse has the SpecProof namespace command. -/
def liveParseHasSpecProofNamespace : Bool :=
  match liveSpecProofTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.SpecProof"
      | _ => false

/-- Live parse ends the SpecProof namespace. -/
def liveParseHasSpecProofEnd : Bool :=
  match liveSpecProofTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.SpecProof"
      | _ => false

/-- Source needle SPEC-PROOF-THEOREM is on the dual-pinned bytes. -/
def liveSourceHasSpecProofTheorem : Bool :=
  (liveSpecProofTheoremsSource.splitOn needleSpecProofTheorem).length > 1

/-- Source needle SPEC-PROOF-SMOKE is on the dual-pinned bytes. -/
def liveSourceHasSpecProofSmoke : Bool :=
  (liveSpecProofTheoremsSource.splitOn needleSpecProofSmoke).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSpecProofTheoremsReady,
    PARSE-LIVE-SPECPROOFTHEOREMS,
    HOST-FRONT-LIVE-SPECPROOFTHEOREMS.
    Real conjunction: parse plus HostKernel.kernelCheck, plus honesty pins.
    Not hardcoded true. liveRel is the bare name. -/
def hostFrontLiveSpecProofTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SPECPROOFTHEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-SPECPROOFTHEOREMS")
    && (parseId == "PARSE-LIVE-SPECPROOFTHEOREMS")
    && (liveRel == "SpecProofTheorems.lean")
    && (liveSpecProofTheoremsRel == liveRel)
    && (liveDir == "src/systems/SystemsLean")
    && !hostFrontLiveSpecProofTheoremsFullHost
    && !hostFrontLiveSpecProofTheoremsResidualFreeClaimed
    && !hostFrontLiveSpecProofTheoremsProvablyUnlocked
    && kernelCheckLiveSpecProofTheoremsSource liveSpecProofTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasRequiredImports
    && liveParseHasSpecProofNamespace
    && liveParseHasSpecProofEnd
    && liveSourceHasSpecProofTheorem
    && liveSourceHasSpecProofSmoke

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSpecProofTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSpecProofTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SPECPROOFTHEOREMS =="
  IO.println s!"  host={hostId} file={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRel}"
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSpecProofTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SpecProofTheorems.lean != liveSpecProofTheoremsSource"
    throw (IO.userError "dual-pin mismatch live SpecProofTheorems.lean")
  let r := parseLiveSpecProofTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SPECPROOFTHEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SPECPROOFTHEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SPECPROOFTHEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SpecProofTheorems parse false"
      throw (IO.userError "kernelCheck live SpecProofTheorems parse false")
    unless hostFrontLiveSpecProofTheoremsReady do
      IO.eprintln "error: hostFrontLiveSpecProofTheoremsReady false"
      throw (IO.userError "hostFrontLiveSpecProofTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source did not reject"
      throw (IO.userError "empty source did not reject")
    IO.println s!"GREEN {stageId}: live SpecProofTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSpecProofTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSpecProofTheorems
