/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ParityMult.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ParityMult.lean. It is not ParityMultTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-MULT,
  SLAKE_HOST_FRONT_LIVE_PARITY_MULT_V0,
  PARSE-LIVE-PARITY-MULT, PARITY-MULT-THEOREM, liveRel,
  kernelCheckLiveParityMultSource,
  hostFrontLiveParityMultReady.
  Module: SystemsLean.HostFrontLiveParityMult
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityMultSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityMult

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_MULT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-MULT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-MULT"

/-- Live file basename. -/
def liveRel : String := "ParityMult.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityMultRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityMultFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveParityMultFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityMultResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveParityMultProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityMultParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveParityMultSkipFuel : Nat := 8192

/-- Kept commands: three imports, namespace, kernel-checkable defs, and end.
    External projections are skipped. From ParityMult.lean. -/
def liveParityMultKeptCmds : Nat := 18

/-- theorem keyword count. ParityMult.lean has no theorem. -/
def liveParityMultTheoremCount : Nat := 0

/-- example keyword count. ParityMult.lean has no example. -/
def liveParityMultExampleCount : Nat := 0

/-- set_option keyword count. ParityMult.lean has no set_option. -/
def liveParityMultSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ParityMult`. -/
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
def cmdAddsParityMult (c : Cmd) : List String :=
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
def cmdBodyKnownParityMult (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityMultParseFuel body
        && termNoAppN liveParityMultParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityMultParseFuel body
        && termNoAppN liveParityMultParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdParityMult (fuel : Nat) (toks : List String) :
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
def parseCmdsParityMult : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdParityMult liveParityMultParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityMultSkipFuel rest
      if cmdBodyKnownParityMult kn c then
        parseCmdsParityMult n rest2
          (kn ++ cmdAddsParityMult c) (acc ++ [c])
      else
        parseCmdsParityMult n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityMultSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsParityMult n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ParityMult.lean text.
    Greppable: parseLiveParityMultSource,
    PARSE-LIVE-PARITY-MULT. -/
def parseLiveParityMultSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsParityMult liveParityMultParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ParityMult"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ParityMult parse. Not a fixture.
    Greppable: kernelCheckLiveParityMultSource,
    PARSE-LIVE-PARITY-MULT. -/
def kernelCheckLiveParityMultSource (src : String) : Bool :=
  match parseLiveParityMultSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityMultParsed? : Option Module :=
  match parseLiveParityMultSource liveParityMultSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveParityMultParsed? with
  | some m => m.commands.length == liveParityMultKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostParityMultId"
      && has "selfHostParityMultId"
      && has "tag0"
      && has "tag1"
      && has "tagOmega"
      && has "paritySurfaceOk"

/-- Wrap module lastSeg is ParityMult (no module line in the live file). -/
def liveParseHasParityMultModule : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ParityMult"
      && lastSeg m.name.raw == "ParityMult"

/-- Live parse has namespace SystemsLean.ParityMult. -/
def liveParseHasParityMultNs : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ParityMult"
      | _ => false

/-- Live parse ends namespace SystemsLean.ParityMult. -/
def liveParseHasParityMultEnd : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ParityMult"
      | _ => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.Mult"
      | _ => false

/-- Live parse imports SystemsLean.KernelMult. -/
def liveParseHasKernelMultImport : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.KernelMult"
      | _ => false

/-- Live parse imports SystemsLean.EmitMult. -/
def liveParseHasEmitMultImport : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitMult"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParityMultParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityMultSource)
    let fuel := liveParityMultSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveParityMultTheoremCount
      && toksCountKw fuel toks "example" 0 == liveParityMultExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveParityMultSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelMult : String := "import SystemsLean.KernelMult\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitMult : String := "import SystemsLean.EmitMult\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ParityMult\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_MULT_V0\"\n"

/-- hostParityMultId def needle with a trailing newline. -/
def needleHostParityMultId : String :=
  "def hostParityMultId : String := \"HOST-PARITY-MULT\"\n"

/-- selfHostParityMultId def needle with a trailing newline. -/
def needleSelfHostParityMultId : String :=
  "def selfHostParityMultId : String := \"SELF-HOST-PARITY-MULT\"\n"

/-- tag0 def needle with a trailing newline. -/
def needleTag0 : String := "def tag0 : Nat := 0\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ParityMult\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveParityMultSource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleImportKernelMult).length > 1
    && (src.splitOn needleImportEmitMult).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostParityMultId).length > 1
    && (src.splitOn needleSelfHostParityMultId).length > 1
    && (src.splitOn needleTag0).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityMultReady,
    PARSE-LIVE-PARITY-MULT,
    HOST-FRONT-LIVE-PARITY-MULT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveParityMultReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_MULT_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-MULT")
    && (parseId == "PARSE-LIVE-PARITY-MULT")
    && (liveRel == "ParityMult.lean")
    && (liveParityMultRel
      == "src/systems/SystemsLean/ParityMult.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityMultFullHost
    && !hostFrontLiveParityMultFullBackend
    && !hostFrontLiveParityMultResidualFreeClaimed
    && !hostFrontLiveParityMultProvablyUnlocked
    && kernelCheckLiveParityMultSource liveParityMultSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasParityMultModule
    && liveParseHasParityMultNs
    && liveParseHasParityMultEnd
    && liveParseHasMultImport
    && liveParseHasKernelMultImport
    && liveParseHasEmitMultImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityMultSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveParityMult (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-MULT =="
  IO.println s!"  host={hostId} file={liveParityMultRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveParityMultRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityMultRel}"
    throw (IO.userError s!"missing {liveParityMultRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityMultSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ParityMult.lean != liveParityMultSource"
    throw (IO.userError "dual-pin mismatch live ParityMult.lean")
  let r := parseLiveParityMultSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-MULT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-MULT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-MULT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} literalDefs={liveParseHasLiteralDefs} module={liveParseHasParityMultModule} namespace={liveParseHasParityMultNs} end={liveParseHasParityMultEnd} multImport={liveParseHasMultImport} kernelMultImport={liveParseHasKernelMultImport} emitMultImport={liveParseHasEmitMultImport} kwCounts={liveParseKwCountsOk} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live ParityMult parse false"
      throw (IO.userError "kernelCheck live ParityMult parse false")
    unless hostFrontLiveParityMultReady do
      IO.eprintln "error: hostFrontLiveParityMultReady false"
      throw (IO.userError "hostFrontLiveParityMultReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ParityMult source was accepted"
      throw (IO.userError "empty ParityMult source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityMult root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityMult
