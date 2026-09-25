/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProbeWire.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProbeWire.lean. It is not ProbeWireTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PROBE-WIRE,
  SLAKE_HOST_FRONT_LIVE_PROBE_WIRE_V0,
  PARSE-LIVE-PROBE-WIRE, PROBE-WIRE, liveRel,
  kernelCheckLiveProbeWireSource,
  hostFrontLiveProbeWireReady.
  Module: SystemsLean.HostFrontLiveProbeWire
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProbeWireSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProbeWire

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PROBE_WIRE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PROBE-WIRE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PROBE-WIRE"

/-- Live file basename. -/
def liveRel : String := "ProbeWire.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProbeWireRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProbeWireFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveProbeWireFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProbeWireResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProbeWireProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveProbeWireParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveProbeWireSkipFuel : Nat := 8192

/-- Kept commands: five imports, namespace, kernel-checkable defs, and end.
    Literal string defs, literal Bool defs, and local && chains stay.
    Dotted projections are skipped. From ProbeWire.lean. -/
def liveProbeWireKeptCmds : Nat := 37

/-- theorem keyword count. ProbeWire.lean has no theorem. -/
def liveProbeWireTheoremCount : Nat := 0

/-- example keyword count. ProbeWire.lean has no example. -/
def liveProbeWireExampleCount : Nat := 0

/-- set_option keyword count. ProbeWire.lean has no set_option. -/
def liveProbeWireSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ProbeWire`. -/
def parseDottedName : Nat -> List String -> Option (Prod String (List String))
  | 0, _ => none
  | Nat.succ _, [] => none
  | Nat.succ n, a :: rest =>
    if !liveIsIdent a then none
    else
      match rest with
      | "." :: rest2 =>
        match parseDottedName n rest2 with
        | some (more, rest3) => some (a ++ "." ++ more, rest3)
        | none => none
      | _ => some (a, rest)

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Reject field proj the kernel cannot type (keep isEmpty / isSome / length). -/
def termNoBadProjN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.app f a => termNoBadProjN n f && termNoBadProjN n a
  | Nat.succ n, Term.some_ t => termNoBadProjN n t
  | Nat.succ n, Term.ite c t e =>
      termNoBadProjN n c && termNoBadProjN n t && termNoBadProjN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoBadProjN n a && termNoBadProjN n b
  | Nat.succ n, Term.proj o f =>
      (f.raw == "isEmpty" || f.raw == "isSome" || f.raw == "length")
        && termNoBadProjN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoBadProjN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Names a command adds to the known-const set. -/
def cmdAddsProbeWire (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ n, Term.some_ t => termNoAppN n t
  | Nat.succ n, Term.ite c t e =>
      termNoAppN n c && termNoAppN n t && termNoAppN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoAppN n a && termNoAppN n b
  | Nat.succ n, Term.proj o _ => termNoAppN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownProbeWire (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProbeWireParseFuel body
        && termNoAppN liveProbeWireParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProbeWireParseFuel body
        && termNoAppN liveProbeWireParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProbeWire (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.importModule (HostTerm.n nm), rest2)
    | none => none
  | "namespace" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.namespace (HostTerm.n nm), rest2)
    | none => none
  | "end" :: rest =>
    match parseDottedName fuel rest with
    | some (nm, rest2) => some (Cmd.endNamespace (HostTerm.n nm), rest2)
    | none => none
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsProbeWire : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProbeWire liveProbeWireParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProbeWireSkipFuel rest
      if cmdBodyKnownProbeWire kn c then
        parseCmdsProbeWire n rest2
          (kn ++ cmdAddsProbeWire c) (acc ++ [c])
      else
        parseCmdsProbeWire n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveProbeWireSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProbeWire n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProbeWire.lean text.
    Greppable: parseLiveProbeWireSource,
    PARSE-LIVE-PROBE-WIRE. -/
def parseLiveProbeWireSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProbeWire liveProbeWireParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProbeWire"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProbeWire parse. Not a fixture.
    Greppable: kernelCheckLiveProbeWireSource,
    PARSE-LIVE-PROBE-WIRE. -/
def kernelCheckLiveProbeWireSource (src : String) : Bool :=
  match parseLiveProbeWireSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProbeWireParsed? : Option Module :=
  match parseLiveProbeWireSource liveProbeWireSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProbeWireParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveProbeWireParsed? with
  | some m => m.commands.length == liveProbeWireKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, hostProbeWireId,
    behavioralProbeIsSmokeDebt, residualFreeClaimed,
    productSelfHostCompleteClaimed, probeWireSurfaceOk,
    probeWireSurfacesDistinct. -/
def liveParseHasLiteralDefs : Bool :=
  match liveProbeWireParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostProbeWireId"
      && has "behavioralProbeIsSmokeDebt"
      && has "residualFreeClaimed"
      && has "productSelfHostCompleteClaimed"
      && has "probeWireSurfaceOk"
      && has "probeWireSurfacesDistinct"

/-- Wrap module lastSeg is ProbeWire (no module line in the live file). -/
def liveParseHasProbeWireModule : Bool :=
  match liveProbeWireParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProbeWire"
      && lastSeg m.name.raw == "ProbeWire"

/-- Live parse has namespace SystemsLean.ProbeWire. -/
def liveParseHasProbeWireNs : Bool :=
  match liveProbeWireParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProbeWire"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProbeWire. -/
def liveParseHasProbeWireEnd : Bool :=
  match liveProbeWireParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ProbeWire"
      | _ => false

/-- Live parse imports one named module. -/
def liveParseHasImport (mod : String) : Bool :=
  match liveProbeWireParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == mod
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveProbeWireParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveProbeWireSource)
    let fuel := liveProbeWireSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveProbeWireTheoremCount
      && toksCountKw fuel toks "example" 0 == liveProbeWireExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProbeWireSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportDualResidual : String := "import SystemsLean.DualResidual\n"

/-- ProductPath import needle. Trailing newline. -/
def needleImportProductPath : String := "import SystemsLean.ProductPath\n"

/-- InventoryClose import needle. Trailing newline. -/
def needleImportInventoryClose : String := "import SystemsLean.InventoryClose\n"

/-- SelfApplyFs import needle. Trailing newline. -/
def needleImportSelfApplyFs : String := "import SystemsLean.SelfApplyFs\n"

/-- LlvmHold import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ProbeWire\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PROBE_WIRE_V0\"\n"

/-- hostProbeWireId def needle with a trailing newline. -/
def needleHostProbeWireId : String :=
  "def hostProbeWireId : String := \"HOST-PROBE-WIRE\"\n"

/-- behavioralProbeIsSmokeDebt def needle with a trailing newline. -/
def needleSmokeDebt : String :=
  "def behavioralProbeIsSmokeDebt : Bool := true\n"

/-- residualFreeClaimed def needle with a trailing newline. -/
def needleResidualFree : String := "def residualFreeClaimed : Bool := false\n"

/-- productSelfHostCompleteClaimed def needle with a trailing newline. -/
def needleProductComplete : String :=
  "def productSelfHostCompleteClaimed : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProbeWire\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ProbeWire. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveProbeWireSource
  (src.splitOn needleImportDualResidual).length > 1
    && (src.splitOn needleImportProductPath).length > 1
    && (src.splitOn needleImportInventoryClose).length > 1
    && (src.splitOn needleImportSelfApplyFs).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostProbeWireId).length > 1
    && (src.splitOn needleSmokeDebt).length > 1
    && (src.splitOn needleResidualFree).length > 1
    && (src.splitOn needleProductComplete).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProbeWireReady,
    PARSE-LIVE-PROBE-WIRE,
    HOST-FRONT-LIVE-PROBE-WIRE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProbeWireReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PROBE_WIRE_V0")
    && (hostId == "HOST-FRONT-LIVE-PROBE-WIRE")
    && (parseId == "PARSE-LIVE-PROBE-WIRE")
    && (liveRel == "ProbeWire.lean")
    && (liveProbeWireRel
      == "src/systems/SystemsLean/ProbeWire.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProbeWireFullHost
    && !hostFrontLiveProbeWireFullBackend
    && !hostFrontLiveProbeWireResidualFreeClaimed
    && !hostFrontLiveProbeWireProvablyUnlocked
    && kernelCheckLiveProbeWireSource liveProbeWireSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasProbeWireModule
    && liveParseHasProbeWireNs
    && liveParseHasProbeWireEnd
    && liveParseHasImport "SystemsLean.DualResidual"
    && liveParseHasImport "SystemsLean.ProductPath"
    && liveParseHasImport "SystemsLean.InventoryClose"
    && liveParseHasImport "SystemsLean.SelfApplyFs"
    && liveParseHasImport "SystemsLean.LlvmHold"
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProbeWireSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProbeWire (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PROBE-WIRE =="
  IO.println s!"  host={hostId} file={liveProbeWireRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProbeWireRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProbeWireRel}"
    throw (IO.userError s!"missing {liveProbeWireRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProbeWireSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProbeWire.lean != liveProbeWireSource"
    throw (IO.userError "dual-pin mismatch live ProbeWire.lean")
  let r := parseLiveProbeWireSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PROBE-WIRE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PROBE-WIRE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PROBE-WIRE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProbeWire parse false"
      throw (IO.userError "kernelCheck live ProbeWire parse false")
    unless hostFrontLiveProbeWireReady do
      IO.eprintln "error: hostFrontLiveProbeWireReady false"
      throw (IO.userError "hostFrontLiveProbeWireReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProbeWire source was accepted"
      throw (IO.userError "empty ProbeWire source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProbeWire root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProbeWire
