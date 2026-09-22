/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LinearSubsetEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LinearSubsetEmit.lean. It is not LinearSubsetEmitMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option are skip-folded.
  FullHost stays false. Not Lake-gone. Not Slake typechecking src/systems
  as a compiler. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def linearSubsetEmitLlvmUnlocked is false.
  That def is not this wrap's backend claim. The provably flag stays false.
  Main entry lives here because HostFrontLiveLinearSubsetEmitMain.lean
  is a different module (LinearSubsetEmitMain.lean). Do not use that path.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT,
  SLAKE_HOST_FRONT_LIVE_LINEAR_SUBSET_EMIT_V0,
  PARSE-LIVE-LINEAR-SUBSET-EMIT, LINEAR-SUBSET-EMIT, liveRel,
  kernelCheckLiveLinearSubsetEmitSource,
  hostFrontLiveLinearSubsetEmitReady.
  Module: SystemsLean.HostFrontLiveLinearSubsetEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLinearSubsetEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLinearSubsetEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LINEAR_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LINEAR-SUBSET-EMIT"

/-- Live file basename. -/
def liveRel : String := "LinearSubsetEmit.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearSubsetEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLinearSubsetEmitFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLinearSubsetEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def linearSubsetEmitProvablyUnlocked is false. -/
def hostFrontLiveLinearSubsetEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLinearSubsetEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLinearSubsetEmitSkipFuel : Nat := 16384

/-- Kept commands: two imports, namespace, literal defs, and end.
    String-append, unknown consts, theorem, example, set_option, and
    IO mains are skip-folded. From LinearSubsetEmit.lean. -/
def liveLinearSubsetEmitKeptCmds : Nat := 19

/-- theorem keyword count. LinearSubsetEmit.lean has nine theorems. -/
def liveLinearSubsetEmitTheoremCount : Nat := 9

/-- example keyword count. LinearSubsetEmit.lean has sixteen examples. -/
def liveLinearSubsetEmitExampleCount : Nat := 16

/-- set_option keyword count. LinearSubsetEmit.lean has one set_option. -/
def liveLinearSubsetEmitSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . LinearSubsetEmit`. -/
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
def cmdAddsLinearSubsetEmit (c : Cmd) : List String :=
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
def cmdBodyKnownLinearSubsetEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearSubsetEmitParseFuel body
        && termNoAppN liveLinearSubsetEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearSubsetEmitParseFuel body
        && termNoAppN liveLinearSubsetEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdLinearSubsetEmit (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, open, and un-kernelable defs. -/
def parseCmdsLinearSubsetEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLinearSubsetEmit liveLinearSubsetEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLinearSubsetEmitSkipFuel rest
      if cmdBodyKnownLinearSubsetEmit kn c then
        parseCmdsLinearSubsetEmit n rest2
          (kn ++ cmdAddsLinearSubsetEmit c) (acc ++ [c])
      else
        parseCmdsLinearSubsetEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLinearSubsetEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLinearSubsetEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LinearSubsetEmit.lean text.
    Greppable: parseLiveLinearSubsetEmitSource,
    PARSE-LIVE-LINEAR-SUBSET-EMIT. -/
def parseLiveLinearSubsetEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLinearSubsetEmit liveLinearSubsetEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LinearSubsetEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LinearSubsetEmit parse. Not a fixture.
    Greppable: kernelCheckLiveLinearSubsetEmitSource,
    PARSE-LIVE-LINEAR-SUBSET-EMIT. -/
def kernelCheckLiveLinearSubsetEmitSource (src : String) : Bool :=
  match parseLiveLinearSubsetEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLinearSubsetEmitParsed? : Option Module :=
  match parseLiveLinearSubsetEmitSource liveLinearSubsetEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLinearSubsetEmitParsed? with
  | some m => m.commands.length == liveLinearSubsetEmitKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "surfaceId"
      && has "stillUsesLake"
      && has "dependsOnLake"
      && has "linearSubsetEmitLlvmUnlocked"
      && has "linearSubsetEmitProvablyUnlocked"

/-- Wrap module lastSeg is LinearSubsetEmit (no module line in the live file). -/
def liveParseHasLinearSubsetEmitModule : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LinearSubsetEmit"
      && lastSeg m.name.raw == "LinearSubsetEmit"

/-- Live parse has namespace SystemsLean.LinearSubsetEmit. -/
def liveParseHasLinearSubsetEmitNs : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LinearSubsetEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.LinearSubsetEmit. -/
def liveParseHasLinearSubsetEmitEnd : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LinearSubsetEmit"
      | _ => false

/-- Live parse imports SystemsLean.CompilePathLinear. -/
def liveParseHasCompilePathLinearImport : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompilePathLinear"
      | _ => false

/-- Live parse imports SystemsLean.EmitLinear. -/
def liveParseHasEmitLinearImport : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitLinear"
      | _ => false

/-- Keyword counts: nine theorems, sixteen examples, one set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveLinearSubsetEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLinearSubsetEmitSource)
    let fuel := liveLinearSubsetEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLinearSubsetEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLinearSubsetEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLinearSubsetEmitSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCompilePathLinear : String :=
  "import SystemsLean.CompilePathLinear\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitLinear : String := "import SystemsLean.EmitLinear\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LinearSubsetEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"LINEAR-SUBSET-EMIT\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := true\n"

/-- linearSubsetEmitLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def linearSubsetEmitLlvmUnlocked : Bool := false\n"

/-- linearSubsetEmitProvablyUnlocked def needle with a trailing newline. -/
def needleProvablyUnlocked : String :=
  "def linearSubsetEmitProvablyUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LinearSubsetEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveLinearSubsetEmitSource
  (src.splitOn needleImportCompilePathLinear).length > 1
    && (src.splitOn needleImportEmitLinear).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSurfaceId).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleProvablyUnlocked).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLinearSubsetEmitReady,
    PARSE-LIVE-LINEAR-SUBSET-EMIT,
    HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLinearSubsetEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LINEAR_SUBSET_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-LINEAR-SUBSET-EMIT")
    && (parseId == "PARSE-LIVE-LINEAR-SUBSET-EMIT")
    && (liveRel == "LinearSubsetEmit.lean")
    && (liveLinearSubsetEmitRel
      == "src/systems/SystemsLean/LinearSubsetEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLinearSubsetEmitFullHost
    && !hostFrontLiveLinearSubsetEmitResidualFreeClaimed
    && !hostFrontLiveLinearSubsetEmitProvablyUnlocked
    && kernelCheckLiveLinearSubsetEmitSource liveLinearSubsetEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLinearSubsetEmitModule
    && liveParseHasLinearSubsetEmitNs
    && liveParseHasLinearSubsetEmitEnd
    && liveParseHasCompilePathLinearImport
    && liveParseHasEmitLinearImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLinearSubsetEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLinearSubsetEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LINEAR-SUBSET-EMIT =="
  IO.println s!"  host={hostId} file={liveLinearSubsetEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLinearSubsetEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLinearSubsetEmitRel}"
    throw (IO.userError s!"missing {liveLinearSubsetEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLinearSubsetEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LinearSubsetEmit.lean != liveLinearSubsetEmitSource"
    throw (IO.userError "dual-pin mismatch live LinearSubsetEmit.lean")
  let r := parseLiveLinearSubsetEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LINEAR-SUBSET-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LINEAR-SUBSET-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LINEAR-SUBSET-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LinearSubsetEmit parse false"
      throw (IO.userError "kernelCheck live LinearSubsetEmit parse false")
    unless hostFrontLiveLinearSubsetEmitReady do
      IO.eprintln "error: hostFrontLiveLinearSubsetEmitReady false"
      throw (IO.userError "hostFrontLiveLinearSubsetEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LinearSubsetEmit source was accepted"
      throw (IO.userError "empty LinearSubsetEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLinearSubsetEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLinearSubsetEmit
