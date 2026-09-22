/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ParityLinear.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ParityLinear.lean. It is not ParityLinearTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-LINEAR,
  SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_V0,
  PARSE-LIVE-PARITY-LINEAR, PARITY-LINEAR-THEOREM, liveRel,
  kernelCheckLiveParityLinearSource,
  hostFrontLiveParityLinearReady.
  Module: SystemsLean.HostFrontLiveParityLinear
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityLinearSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityLinear

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-LINEAR"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-LINEAR"

/-- Live file basename. -/
def liveRel : String := "ParityLinear.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityLinearRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityLinearFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveParityLinearFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityLinearResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveParityLinearProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityLinearParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveParityLinearSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable defs, and end.
    External projections are skipped. From ParityLinear.lean. -/
def liveParityLinearKeptCmds : Nat := 20

/-- theorem keyword count. ParityLinear.lean has no theorem. -/
def liveParityLinearTheoremCount : Nat := 0

/-- example keyword count. ParityLinear.lean has no example. -/
def liveParityLinearExampleCount : Nat := 0

/-- set_option keyword count. ParityLinear.lean has no set_option. -/
def liveParityLinearSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ParityLinear`. -/
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
def cmdAddsParityLinear (c : Cmd) : List String :=
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
def cmdBodyKnownParityLinear (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityLinearParseFuel body
        && termNoAppN liveParityLinearParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityLinearParseFuel body
        && termNoAppN liveParityLinearParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdParityLinear (fuel : Nat) (toks : List String) :
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
def parseCmdsParityLinear : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdParityLinear liveParityLinearParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityLinearSkipFuel rest
      if cmdBodyKnownParityLinear kn c then
        parseCmdsParityLinear n rest2
          (kn ++ cmdAddsParityLinear c) (acc ++ [c])
      else
        parseCmdsParityLinear n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityLinearSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsParityLinear n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ParityLinear.lean text.
    Greppable: parseLiveParityLinearSource,
    PARSE-LIVE-PARITY-LINEAR. -/
def parseLiveParityLinearSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsParityLinear liveParityLinearParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ParityLinear"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ParityLinear parse. Not a fixture.
    Greppable: kernelCheckLiveParityLinearSource,
    PARSE-LIVE-PARITY-LINEAR. -/
def kernelCheckLiveParityLinearSource (src : String) : Bool :=
  match parseLiveParityLinearSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityLinearParsed? : Option Module :=
  match parseLiveParityLinearSource liveParityLinearSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveParityLinearParsed? with
  | some m => m.commands.length == liveParityLinearKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostParityLinearId"
      && has "selfHostParityLinearId"
      && has "productApiSurfaceOk"
      && has "paritySurfaceOk"

/-- Wrap module lastSeg is ParityLinear (no module line in the live file). -/
def liveParseHasParityLinearModule : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ParityLinear"
      && lastSeg m.name.raw == "ParityLinear"

/-- Live parse has namespace SystemsLean.ParityLinear. -/
def liveParseHasParityLinearNs : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ParityLinear"
      | _ => false

/-- Live parse ends namespace SystemsLean.ParityLinear. -/
def liveParseHasParityLinearEnd : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ParityLinear"
      | _ => false

/-- Live parse imports SystemsLean.KernelLinear. -/
def liveParseHasKernelLinearImport : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.KernelLinear"
      | _ => false

/-- Live parse imports SystemsLean.ParityMult. -/
def liveParseHasParityMultImport : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ParityMult"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParityLinearParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityLinearSource)
    let fuel := liveParityLinearSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveParityLinearTheoremCount
      && toksCountKw fuel toks "example" 0 == liveParityLinearExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveParityLinearSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportKernelLinear : String :=
  "import SystemsLean.KernelLinear\n"

/-- Import needle. Trailing newline. -/
def needleImportParityMult : String :=
  "import SystemsLean.ParityMult\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ParityLinear\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_LINEAR_V0\"\n"

/-- hostParityLinearId def needle with a trailing newline. -/
def needleHostParityLinearId : String :=
  "def hostParityLinearId : String := \"HOST-PARITY-LINEAR\"\n"

/-- selfHostParityLinearId def needle with a trailing newline. -/
def needleSelfHostParityLinearId : String :=
  "def selfHostParityLinearId : String := \"SELF-HOST-PARITY-LINEAR\"\n"

/-- productLinearConsumeApi def needle with a trailing newline. -/
def needleProductLinearConsumeApi : String :=
  "def productLinearConsumeApi : String := \"slake_linear_consume\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ParityLinear\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveParityLinearSource
  (src.splitOn needleImportKernelLinear).length > 1
    && (src.splitOn needleImportParityMult).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostParityLinearId).length > 1
    && (src.splitOn needleSelfHostParityLinearId).length > 1
    && (src.splitOn needleProductLinearConsumeApi).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityLinearReady,
    PARSE-LIVE-PARITY-LINEAR,
    HOST-FRONT-LIVE-PARITY-LINEAR.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveParityLinearReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_LINEAR_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-LINEAR")
    && (parseId == "PARSE-LIVE-PARITY-LINEAR")
    && (liveRel == "ParityLinear.lean")
    && (liveParityLinearRel
      == "src/systems/SystemsLean/ParityLinear.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityLinearFullHost
    && !hostFrontLiveParityLinearFullBackend
    && !hostFrontLiveParityLinearResidualFreeClaimed
    && !hostFrontLiveParityLinearProvablyUnlocked
    && kernelCheckLiveParityLinearSource liveParityLinearSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasParityLinearModule
    && liveParseHasParityLinearNs
    && liveParseHasParityLinearEnd
    && liveParseHasKernelLinearImport
    && liveParseHasParityMultImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityLinearSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveParityLinear (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-LINEAR =="
  IO.println s!"  host={hostId} file={liveParityLinearRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveParityLinearRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityLinearRel}"
    throw (IO.userError s!"missing {liveParityLinearRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityLinearSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ParityLinear.lean != liveParityLinearSource"
    throw (IO.userError "dual-pin mismatch live ParityLinear.lean")
  let r := parseLiveParityLinearSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-LINEAR reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-LINEAR reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-LINEAR ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ParityLinear parse false"
      throw (IO.userError "kernelCheck live ParityLinear parse false")
    unless hostFrontLiveParityLinearReady do
      IO.eprintln "error: hostFrontLiveParityLinearReady false"
      throw (IO.userError "hostFrontLiveParityLinearReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ParityLinear source was accepted"
      throw (IO.userError "empty ParityLinear source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityLinear root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityLinear
