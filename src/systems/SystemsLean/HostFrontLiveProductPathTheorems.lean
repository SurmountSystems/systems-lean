/-
  SYSTEMS_LEAN_HOST partial -- parse live ProductPathTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveProductPathTheorems. Reuses HostFrontLiveHostTerm
  skip of theorem / example / set_option (and skip open as un-kernelable).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on ProductPathTheorems text.
  Not HostFrontLiveProductPath (that live parser is a different slice).

  Spec (readable):
  - parseLiveProductPathTheoremsSource turns live ProductPathTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.ProductPathTheorems even without a module
    line.
  - kernelCheckLiveProductPathTheoremsSource is HostKernel.kernelCheck of
    that parse. Not kernelCheckMultFixture. Not the constant true.
  - Product ids PRODUCT-PATH-THEOREM and PRODUCT-PATH-SMOKE stay on the
    live file as source needles. This parser does not change those claims.

  Theorems, examples, set_option, and open skip until the next command. Kept
  commands are import, namespace, and end. The live file imports
  InventoryClose, CompilePath, KernelEmit, KernelProgram, HostCompose,
  IrProgram, JoinMap, SelfHost, SurfaceMatrix, SelfApplyFs, LlvmHold, and
  ProductPath, then namespace SystemsLean.ProductPath and its end.
  119 top-level command lines, so parse fuel is 2048, not 256.

  Disk path is repo root / "src/systems/SystemsLean" / liveRel.
  liveRel is the bare name ProductPathTheorems.lean, not a repo-root path.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live ProductPath.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70.
  - Host tools stay 69 of 69. Not Lake-gone.
  - Not freestanding residual free. Not PROVABLY.
  - Not package-typecheck ownership.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PRODUCTPATHTHEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCTPATHTHEOREMS_V0,
  PARSE-LIVE-PRODUCTPATHTHEOREMS, parseLiveProductPathTheoremsSource,
  kernelCheckLiveProductPathTheoremsSource,
  hostFrontLiveProductPathTheoremsReady, liveProductPathTheoremsSource,
  liveRel, liveProductPathTheoremsRel, PRODUCT-PATH-THEOREM,
  PRODUCT-PATH-SMOKE, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveProductPathTheorems
  Red/green: just slake-typecheck-productpaththeorems (lean --run; no mill;
  no lake). Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PRODUCTPATHTHEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PRODUCTPATHTHEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PRODUCTPATHTHEOREMS"

/-- Live file basename. Dual-pin name. Not a repo-root path. -/
def liveRel : String := "ProductPathTheorems.lean"

/-- Same bare basename. Greppable: liveProductPathTheoremsRel. -/
def liveProductPathTheoremsRel : String := liveRel

/-- Directory under the repo root that holds the live file. -/
def liveDir : String := "src/systems/SystemsLean"

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveProductPathTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel. 119 top-level commands; not 256. -/
def liveProductPathTheoremsParseFuel : Nat := 2048

/-- Source needle. Do not rename. Trailing text stays the product token. -/
def needleProductPathTheorem : String := "PRODUCT-PATH-THEOREM"

/-- Source needle. Do not rename. -/
def needleProductPathSmoke : String := "PRODUCT-PATH-SMOKE"

/-- Skip open (un-kernelable) so kernelCheck sees import / namespace / end. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- Fold commands. Skip theorem / example / set_option / open. Keep import /
    namespace / end. Tokenize with Mult takeIdent so SystemsLean.ProductPath
    stays one name. -/
def parseCmdsProductPathTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveProductPathTheoremsParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        parseCmdsProductPathTheorems n rest kn acc
      else if cmdBodyKnown kn c then
        parseCmdsProductPathTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsProductPathTheorems n rest kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProductPathTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live ProductPathTheorems.lean text.
    Greppable: parseLiveProductPathTheoremsSource,
    PARSE-LIVE-PRODUCTPATHTHEOREMS. -/
def parseLiveProductPathTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathTheorems liveProductPathTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathTheorems parse. Not kernelCheckMultFixture.
    Not the constant true.
    Greppable: kernelCheckLiveProductPathTheoremsSource,
    PARSE-LIVE-PRODUCTPATHTHEOREMS. -/
def kernelCheckLiveProductPathTheoremsSource (src : String) : Bool :=
  match parseLiveProductPathTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathTheoremsParsed? : Option Module :=
  match parseLiveProductPathTheoremsSource liveProductPathTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound from the parse, not hardcoded true. Twelve imports plus
    namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathTheoremsParsed? with
  | some m => m.commands.length >= 14
  | none => false

/-- Live parse keeps only import / namespace / end (theorems and open skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveProductPathTheoremsParsed? with
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
  match liveProductPathTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == seg
      | _ => false

/-- Live parse imports SystemsLean.InventoryClose. -/
def liveParseHasInventoryCloseImport : Bool :=
  liveParseHasImport "InventoryClose"

/-- Live parse imports SystemsLean.CompilePath. -/
def liveParseHasCompilePathImport : Bool :=
  liveParseHasImport "CompilePath"

/-- Live parse imports SystemsLean.KernelEmit. -/
def liveParseHasKernelEmitImport : Bool :=
  liveParseHasImport "KernelEmit"

/-- Live parse imports SystemsLean.KernelProgram. -/
def liveParseHasKernelProgramImport : Bool :=
  liveParseHasImport "KernelProgram"

/-- Live parse imports SystemsLean.HostCompose. -/
def liveParseHasHostComposeImport : Bool :=
  liveParseHasImport "HostCompose"

/-- Live parse imports SystemsLean.IrProgram. -/
def liveParseHasIrProgramImport : Bool :=
  liveParseHasImport "IrProgram"

/-- Live parse imports SystemsLean.JoinMap. -/
def liveParseHasJoinMapImport : Bool :=
  liveParseHasImport "JoinMap"

/-- Live parse imports SystemsLean.SelfHost. -/
def liveParseHasSelfHostImport : Bool :=
  liveParseHasImport "SelfHost"

/-- Live parse imports SystemsLean.SurfaceMatrix. -/
def liveParseHasSurfaceMatrixImport : Bool :=
  liveParseHasImport "SurfaceMatrix"

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  liveParseHasImport "SelfApplyFs"

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  liveParseHasImport "LlvmHold"

/-- Live parse imports SystemsLean.ProductPath. -/
def liveParseHasProductPathImport : Bool :=
  liveParseHasImport "ProductPath"

/-- Live parse has every import the product file actually contains. -/
def liveParseHasRequiredImports : Bool :=
  liveParseHasInventoryCloseImport
    && liveParseHasCompilePathImport
    && liveParseHasKernelEmitImport
    && liveParseHasKernelProgramImport
    && liveParseHasHostComposeImport
    && liveParseHasIrProgramImport
    && liveParseHasJoinMapImport
    && liveParseHasSelfHostImport
    && liveParseHasSurfaceMatrixImport
    && liveParseHasSelfApplyFsImport
    && liveParseHasLlvmHoldImport
    && liveParseHasProductPathImport

/-- Live parse has the ProductPath namespace command. -/
def liveParseHasProductPathNamespace : Bool :=
  match liveProductPathTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPath"
      | _ => false

/-- Live parse ends the ProductPath namespace. -/
def liveParseHasProductPathEnd : Bool :=
  match liveProductPathTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProductPath"
      | _ => false

/-- Source needle PRODUCT-PATH-THEOREM is on the dual-pinned bytes. -/
def liveSourceHasProductPathTheorem : Bool :=
  (liveProductPathTheoremsSource.splitOn needleProductPathTheorem).length > 1

/-- Source needle PRODUCT-PATH-SMOKE is on the dual-pinned bytes. -/
def liveSourceHasProductPathSmoke : Bool :=
  (liveProductPathTheoremsSource.splitOn needleProductPathSmoke).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathTheoremsReady,
    PARSE-LIVE-PRODUCTPATHTHEOREMS,
    HOST-FRONT-LIVE-PRODUCTPATHTHEOREMS.
    Real conjunction: parse plus HostKernel.kernelCheck, plus honesty pins.
    Not hardcoded true. liveRel is the bare name. -/
def hostFrontLiveProductPathTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PRODUCTPATHTHEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-PRODUCTPATHTHEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCTPATHTHEOREMS")
    && (liveRel == "ProductPathTheorems.lean")
    && (liveProductPathTheoremsRel == liveRel)
    && (liveDir == "src/systems/SystemsLean")
    && !hostFrontLiveProductPathTheoremsFullHost
    && !hostFrontLiveProductPathTheoremsResidualFreeClaimed
    && !hostFrontLiveProductPathTheoremsProvablyUnlocked
    && kernelCheckLiveProductPathTheoremsSource liveProductPathTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasRequiredImports
    && liveParseHasProductPathNamespace
    && liveParseHasProductPathEnd
    && liveSourceHasProductPathTheorem
    && liveSourceHasProductPathSmoke

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveProductPathTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCTPATHTHEOREMS =="
  IO.println s!"  host={hostId} file={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveRel}"
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathTheorems.lean != liveProductPathTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathTheorems.lean")
  let r := parseLiveProductPathTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCTPATHTHEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCTPATHTHEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCTPATHTHEOREMS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathTheorems parse false"
      throw (IO.userError "kernelCheck live ProductPathTheorems parse false")
    unless hostFrontLiveProductPathTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductPathTheoremsReady false"
      throw (IO.userError "hostFrontLiveProductPathTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source did not reject"
      throw (IO.userError "empty source did not reject")
    IO.println s!"GREEN {stageId}: live ProductPathTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathTheorems
