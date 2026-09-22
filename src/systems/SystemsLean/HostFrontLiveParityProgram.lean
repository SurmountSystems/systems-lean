/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ParityProgram.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ParityProgram.lean. It is not ParityProgramTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-PROGRAM,
  SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_V0,
  PARSE-LIVE-PARITY-PROGRAM, PARITY-PROGRAM-THEOREM, liveRel,
  kernelCheckLiveParityProgramSource,
  hostFrontLiveParityProgramReady.
  Module: SystemsLean.HostFrontLiveParityProgram
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityProgramSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityProgram

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-PROGRAM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-PROGRAM"

/-- Live file basename. -/
def liveRel : String := "ParityProgram.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityProgramRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityProgramFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveParityProgramFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityProgramResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveParityProgramProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityProgramParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveParityProgramSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable defs, and end.
    External projections are skipped. From ParityProgram.lean. -/
def liveParityProgramKeptCmds : Nat := 28

/-- theorem keyword count. ParityProgram.lean has no theorem. -/
def liveParityProgramTheoremCount : Nat := 0

/-- example keyword count. ParityProgram.lean has no example. -/
def liveParityProgramExampleCount : Nat := 0

/-- set_option keyword count. ParityProgram.lean has no set_option. -/
def liveParityProgramSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ParityProgram`. -/
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
def cmdAddsParityProgram (c : Cmd) : List String :=
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
def cmdBodyKnownParityProgram (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityProgramParseFuel body
        && termNoAppN liveParityProgramParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityProgramParseFuel body
        && termNoAppN liveParityProgramParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdParityProgram (fuel : Nat) (toks : List String) :
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
def parseCmdsParityProgram : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdParityProgram liveParityProgramParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityProgramSkipFuel rest
      if cmdBodyKnownParityProgram kn c then
        parseCmdsParityProgram n rest2
          (kn ++ cmdAddsParityProgram c) (acc ++ [c])
      else
        parseCmdsParityProgram n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityProgramSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsParityProgram n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ParityProgram.lean text.
    Greppable: parseLiveParityProgramSource,
    PARSE-LIVE-PARITY-PROGRAM. -/
def parseLiveParityProgramSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsParityProgram liveParityProgramParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ParityProgram"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ParityProgram parse. Not a fixture.
    Greppable: kernelCheckLiveParityProgramSource,
    PARSE-LIVE-PARITY-PROGRAM. -/
def kernelCheckLiveParityProgramSource (src : String) : Bool :=
  match parseLiveParityProgramSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityProgramParsed? : Option Module :=
  match parseLiveParityProgramSource liveParityProgramSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveParityProgramParsed? with
  | some m => m.commands.length == liveParityProgramKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostParityProgramId"
      && has "selfHostParityProgramId"
      && has "productApiSurfaceOk"
      && has "paritySurfaceOk"

/-- Wrap module lastSeg is ParityProgram (no module line in the live file). -/
def liveParseHasParityProgramModule : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ParityProgram"
      && lastSeg m.name.raw == "ParityProgram"

/-- Live parse has namespace SystemsLean.ParityProgram. -/
def liveParseHasParityProgramNs : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ParityProgram"
      | _ => false

/-- Live parse ends namespace SystemsLean.ParityProgram. -/
def liveParseHasParityProgramEnd : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ParityProgram"
      | _ => false

/-- Live parse imports SystemsLean.KernelProgram. -/
def liveParseHasKernelProgramImport : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.KernelProgram"
      | _ => false

/-- Live parse imports SystemsLean.ParityTypes. -/
def liveParseHasParityTypesImport : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ParityTypes"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParityProgramParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityProgramSource)
    let fuel := liveParityProgramSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveParityProgramTheoremCount
      && toksCountKw fuel toks "example" 0 == liveParityProgramExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveParityProgramSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportKernelProgram : String :=
  "import SystemsLean.KernelProgram\n"

/-- Import needle. Trailing newline. -/
def needleImportParityTypes : String :=
  "import SystemsLean.ParityTypes\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ParityProgram\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_PROGRAM_V0\"\n"

/-- hostParityProgramId def needle with a trailing newline. -/
def needleHostParityProgramId : String :=
  "def hostParityProgramId : String := \"HOST-PARITY-PROGRAM\"\n"

/-- selfHostParityProgramId def needle with a trailing newline. -/
def needleSelfHostParityProgramId : String :=
  "def selfHostParityProgramId : String := \"SELF-HOST-PARITY-PROGRAM\"\n"

/-- productHostComposeConsumeApi def needle with a trailing newline. -/
def needleProductHostComposeConsumeApi : String :=
  "def productHostComposeConsumeApi : String := \"slake_host_compose_consume\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ParityProgram\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveParityProgramSource
  (src.splitOn needleImportKernelProgram).length > 1
    && (src.splitOn needleImportParityTypes).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostParityProgramId).length > 1
    && (src.splitOn needleSelfHostParityProgramId).length > 1
    && (src.splitOn needleProductHostComposeConsumeApi).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityProgramReady,
    PARSE-LIVE-PARITY-PROGRAM,
    HOST-FRONT-LIVE-PARITY-PROGRAM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveParityProgramReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_PROGRAM_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-PROGRAM")
    && (parseId == "PARSE-LIVE-PARITY-PROGRAM")
    && (liveRel == "ParityProgram.lean")
    && (liveParityProgramRel
      == "src/systems/SystemsLean/ParityProgram.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityProgramFullHost
    && !hostFrontLiveParityProgramFullBackend
    && !hostFrontLiveParityProgramResidualFreeClaimed
    && !hostFrontLiveParityProgramProvablyUnlocked
    && kernelCheckLiveParityProgramSource liveParityProgramSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasParityProgramModule
    && liveParseHasParityProgramNs
    && liveParseHasParityProgramEnd
    && liveParseHasKernelProgramImport
    && liveParseHasParityTypesImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityProgramSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveParityProgram (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-PROGRAM =="
  IO.println s!"  host={hostId} file={liveParityProgramRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveParityProgramRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityProgramRel}"
    throw (IO.userError s!"missing {liveParityProgramRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityProgramSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ParityProgram.lean != liveParityProgramSource"
    throw (IO.userError "dual-pin mismatch live ParityProgram.lean")
  let r := parseLiveParityProgramSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-PROGRAM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-PROGRAM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-PROGRAM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ParityProgram parse false"
      throw (IO.userError "kernelCheck live ParityProgram parse false")
    unless hostFrontLiveParityProgramReady do
      IO.eprintln "error: hostFrontLiveParityProgramReady false"
      throw (IO.userError "hostFrontLiveParityProgramReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ParityProgram source was accepted"
      throw (IO.userError "empty ParityProgram source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityProgram root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityProgram
