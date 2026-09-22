/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ParityEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ParityEmit.lean. It is not ParityEmitTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-EMIT,
  SLAKE_HOST_FRONT_LIVE_PARITY_EMIT_V0,
  PARSE-LIVE-PARITY-EMIT, PARITY-EMIT-THEOREM, liveRel,
  kernelCheckLiveParityEmitSource,
  hostFrontLiveParityEmitReady.
  Module: SystemsLean.HostFrontLiveParityEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-EMIT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-EMIT"

/-- Live file basename. -/
def liveRel : String := "ParityEmit.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityEmitFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveParityEmitFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveParityEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveParityEmitSkipFuel : Nat := 8192

/-- Kept commands: three imports, namespace, kernel-checkable defs, and end.
    External KernelEmit, ParityProgram, and EmitMult projections are skipped.
    From ParityEmit.lean. -/
def liveParityEmitKeptCmds : Nat := 30

/-- theorem keyword count. ParityEmit.lean has no theorem. -/
def liveParityEmitTheoremCount : Nat := 0

/-- example keyword count. ParityEmit.lean has no example. -/
def liveParityEmitExampleCount : Nat := 0

/-- set_option keyword count. ParityEmit.lean has no set_option. -/
def liveParityEmitSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ParityEmit`. -/
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
def cmdAddsParityEmit (c : Cmd) : List String :=
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
def cmdBodyKnownParityEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityEmitParseFuel body
        && termNoAppN liveParityEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityEmitParseFuel body
        && termNoAppN liveParityEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdParityEmit (fuel : Nat) (toks : List String) :
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
def parseCmdsParityEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdParityEmit liveParityEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityEmitSkipFuel rest
      if cmdBodyKnownParityEmit kn c then
        parseCmdsParityEmit n rest2
          (kn ++ cmdAddsParityEmit c) (acc ++ [c])
      else
        parseCmdsParityEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsParityEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ParityEmit.lean text.
    Greppable: parseLiveParityEmitSource,
    PARSE-LIVE-PARITY-EMIT. -/
def parseLiveParityEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsParityEmit liveParityEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ParityEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ParityEmit parse. Not a fixture.
    kernelCheck is HostKernel.kernelCheck.
    Greppable: kernelCheckLiveParityEmitSource,
    PARSE-LIVE-PARITY-EMIT. -/
def kernelCheckLiveParityEmitSource (src : String) : Bool :=
  match parseLiveParityEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityEmitParsed? : Option Module :=
  match parseLiveParityEmitSource liveParityEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Three imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveParityEmitParsed? with
  | some m => m.commands.length == liveParityEmitKeptCmds
  | none => false

/-- Literal and local defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostParityEmitId"
      && has "selfHostParityEmitId"
      && has "productEmitPlanId"
      && has "productEmitApplyId"
      && has "productEmitBodyId"
      && has "productApiSurfaceOk"
      && has "paritySurfaceOk"

/-- Wrap module lastSeg is ParityEmit (no module line in the live file). -/
def liveParseHasParityEmitModule : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ParityEmit"
      && lastSeg m.name.raw == "ParityEmit"

/-- Live parse has namespace SystemsLean.ParityEmit. -/
def liveParseHasParityEmitNs : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ParityEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.ParityEmit. -/
def liveParseHasParityEmitEnd : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ParityEmit"
      | _ => false

/-- Live parse imports SystemsLean.KernelEmit. -/
def liveParseHasKernelEmitImport : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.KernelEmit"
      | _ => false

/-- Live parse imports SystemsLean.ParityProgram. -/
def liveParseHasParityProgramImport : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ParityProgram"
      | _ => false

/-- Live parse imports SystemsLean.EmitMult. -/
def liveParseHasEmitMultImport : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitMult"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParityEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityEmitSource)
    let fuel := liveParityEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveParityEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveParityEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveParityEmitSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportKernelEmit : String := "import SystemsLean.KernelEmit\n"

/-- Second import needle. Trailing newline. -/
def needleImportParityProgram : String := "import SystemsLean.ParityProgram\n"

/-- Third import needle. Trailing newline. -/
def needleImportEmitMult : String := "import SystemsLean.EmitMult\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ParityEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_EMIT_V0\"\n"

/-- hostParityEmitId def needle with a trailing newline. -/
def needleHostParityEmitId : String :=
  "def hostParityEmitId : String := \"HOST-PARITY-EMIT\"\n"

/-- selfHostParityEmitId def needle with a trailing newline. -/
def needleSelfHostParityEmitId : String :=
  "def selfHostParityEmitId : String := \"SELF-HOST-PARITY-EMIT\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ParityEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveParityEmitSource
  (src.splitOn needleImportKernelEmit).length > 1
    && (src.splitOn needleImportParityProgram).length > 1
    && (src.splitOn needleImportEmitMult).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostParityEmitId).length > 1
    && (src.splitOn needleSelfHostParityEmitId).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityEmitReady,
    PARSE-LIVE-PARITY-EMIT,
    HOST-FRONT-LIVE-PARITY-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveParityEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-EMIT")
    && (parseId == "PARSE-LIVE-PARITY-EMIT")
    && (liveRel == "ParityEmit.lean")
    && (liveParityEmitRel
      == "src/systems/SystemsLean/ParityEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityEmitFullHost
    && !hostFrontLiveParityEmitFullBackend
    && !hostFrontLiveParityEmitResidualFreeClaimed
    && !hostFrontLiveParityEmitProvablyUnlocked
    && kernelCheckLiveParityEmitSource liveParityEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasParityEmitModule
    && liveParseHasParityEmitNs
    && liveParseHasParityEmitEnd
    && liveParseHasKernelEmitImport
    && liveParseHasParityProgramImport
    && liveParseHasEmitMultImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveParityEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-EMIT =="
  IO.println s!"  host={hostId} file={liveParityEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveParityEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityEmitRel}"
    throw (IO.userError s!"missing {liveParityEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ParityEmit.lean != liveParityEmitSource"
    throw (IO.userError "dual-pin mismatch live ParityEmit.lean")
  let r := parseLiveParityEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ParityEmit parse false"
      throw (IO.userError "kernelCheck live ParityEmit parse false")
    unless hostFrontLiveParityEmitReady do
      IO.eprintln "error: hostFrontLiveParityEmitReady false"
      throw (IO.userError "hostFrontLiveParityEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ParityEmit source was accepted"
      throw (IO.userError "empty ParityEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityEmit
