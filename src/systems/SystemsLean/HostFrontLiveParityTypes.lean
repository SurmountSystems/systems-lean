/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ParityTypes.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ParityTypes.lean. It is not ParityTypesTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PARITY-TYPES,
  SLAKE_HOST_FRONT_LIVE_PARITY_TYPES_V0,
  PARSE-LIVE-PARITY-TYPES, PARITY-TYPES-THEOREM, liveRel,
  kernelCheckLiveParityTypesSource,
  hostFrontLiveParityTypesReady.
  Module: SystemsLean.HostFrontLiveParityTypes
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveParityTypesSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveParityTypes

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PARITY_TYPES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PARITY-TYPES"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PARITY-TYPES"

/-- Live file basename. -/
def liveRel : String := "ParityTypes.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveParityTypesRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveParityTypesFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveParityTypesFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveParityTypesResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveParityTypesProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveParityTypesParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveParityTypesSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable defs, and end.
    External KernelTypes and ParityLinear projections are skipped.
    From ParityTypes.lean. -/
def liveParityTypesKeptCmds : Nat := 17

/-- theorem keyword count. ParityTypes.lean has no theorem. -/
def liveParityTypesTheoremCount : Nat := 0

/-- example keyword count. ParityTypes.lean has no example. -/
def liveParityTypesExampleCount : Nat := 0

/-- set_option keyword count. ParityTypes.lean has no set_option. -/
def liveParityTypesSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ParityTypes`. -/
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
def cmdAddsParityTypes (c : Cmd) : List String :=
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
def cmdBodyKnownParityTypes (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityTypesParseFuel body
        && termNoAppN liveParityTypesParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParityTypesParseFuel body
        && termNoAppN liveParityTypesParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdParityTypes (fuel : Nat) (toks : List String) :
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
def parseCmdsParityTypes : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdParityTypes liveParityTypesParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveParityTypesSkipFuel rest
      if cmdBodyKnownParityTypes kn c then
        parseCmdsParityTypes n rest2
          (kn ++ cmdAddsParityTypes c) (acc ++ [c])
      else
        parseCmdsParityTypes n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveParityTypesSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsParityTypes n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ParityTypes.lean text.
    Greppable: parseLiveParityTypesSource,
    PARSE-LIVE-PARITY-TYPES. -/
def parseLiveParityTypesSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsParityTypes liveParityTypesParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ParityTypes"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ParityTypes parse. Not a fixture.
    Greppable: kernelCheckLiveParityTypesSource,
    PARSE-LIVE-PARITY-TYPES. -/
def kernelCheckLiveParityTypesSource (src : String) : Bool :=
  match parseLiveParityTypesSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParityTypesParsed? : Option Module :=
  match parseLiveParityTypesSource liveParityTypesSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Two imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveParityTypesParsed? with
  | some m => m.commands.length == liveParityTypesKeptCmds
  | none => false

/-- Literal and local defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostParityTypesId"
      && has "selfHostParityTypesId"
      && has "productTypedIrId"
      && has "productApiSurfaceOk"
      && has "paritySurfaceOk"

/-- Wrap module lastSeg is ParityTypes (no module line in the live file). -/
def liveParseHasParityTypesModule : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ParityTypes"
      && lastSeg m.name.raw == "ParityTypes"

/-- Live parse has namespace SystemsLean.ParityTypes. -/
def liveParseHasParityTypesNs : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ParityTypes"
      | _ => false

/-- Live parse ends namespace SystemsLean.ParityTypes. -/
def liveParseHasParityTypesEnd : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ParityTypes"
      | _ => false

/-- Live parse imports SystemsLean.KernelTypes. -/
def liveParseHasKernelTypesImport : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.KernelTypes"
      | _ => false

/-- Live parse imports SystemsLean.ParityLinear. -/
def liveParseHasParityLinearImport : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ParityLinear"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParityTypesParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveParityTypesSource)
    let fuel := liveParityTypesSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveParityTypesTheoremCount
      && toksCountKw fuel toks "example" 0 == liveParityTypesExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveParityTypesSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportKernelTypes : String := "import SystemsLean.KernelTypes\n"

/-- Second import needle. Trailing newline. -/
def needleImportParityLinear : String := "import SystemsLean.ParityLinear\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ParityTypes\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_PARITY_TYPES_V0\"\n"

/-- hostParityTypesId def needle with a trailing newline. -/
def needleHostParityTypesId : String :=
  "def hostParityTypesId : String := \"HOST-PARITY-TYPES\"\n"

/-- selfHostParityTypesId def needle with a trailing newline. -/
def needleSelfHostParityTypesId : String :=
  "def selfHostParityTypesId : String := \"SELF-HOST-PARITY-TYPES\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ParityTypes\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveParityTypesSource
  (src.splitOn needleImportKernelTypes).length > 1
    && (src.splitOn needleImportParityLinear).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostParityTypesId).length > 1
    && (src.splitOn needleSelfHostParityTypesId).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveParityTypesReady,
    PARSE-LIVE-PARITY-TYPES,
    HOST-FRONT-LIVE-PARITY-TYPES.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveParityTypesReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PARITY_TYPES_V0")
    && (hostId == "HOST-FRONT-LIVE-PARITY-TYPES")
    && (parseId == "PARSE-LIVE-PARITY-TYPES")
    && (liveRel == "ParityTypes.lean")
    && (liveParityTypesRel
      == "src/systems/SystemsLean/ParityTypes.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveParityTypesFullHost
    && !hostFrontLiveParityTypesFullBackend
    && !hostFrontLiveParityTypesResidualFreeClaimed
    && !hostFrontLiveParityTypesProvablyUnlocked
    && kernelCheckLiveParityTypesSource liveParityTypesSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasParityTypesModule
    && liveParseHasParityTypesNs
    && liveParseHasParityTypesEnd
    && liveParseHasKernelTypesImport
    && liveParseHasParityLinearImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveParityTypesSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveParityTypes (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PARITY-TYPES =="
  IO.println s!"  host={hostId} file={liveParityTypesRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveParityTypesRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveParityTypesRel}"
    throw (IO.userError s!"missing {liveParityTypesRel}")
  let disk <- IO.FS.readFile path
  if disk != liveParityTypesSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ParityTypes.lean != liveParityTypesSource"
    throw (IO.userError "dual-pin mismatch live ParityTypes.lean")
  let r := parseLiveParityTypesSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PARITY-TYPES reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PARITY-TYPES reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PARITY-TYPES ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ParityTypes parse false"
      throw (IO.userError "kernelCheck live ParityTypes parse false")
    unless hostFrontLiveParityTypesReady do
      IO.eprintln "error: hostFrontLiveParityTypesReady false"
      throw (IO.userError "hostFrontLiveParityTypesReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ParityTypes source was accepted"
      throw (IO.userError "empty ParityTypes source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveParityTypes root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveParityTypes
