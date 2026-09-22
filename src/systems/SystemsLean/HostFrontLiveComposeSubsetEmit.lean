/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ComposeSubsetEmit.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ComposeSubsetEmit.lean. It is not ComposeSubsetEmitMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option are skip-folded.
  FullHost stays false. Not Lake-gone. Not Slake typechecking src/systems
  as a compiler. Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def composeSubsetEmitLlvmUnlocked is false.
  That def is not this wrap's backend claim. The provably flag stays false.
  Main entry lives here because HostFrontLiveComposeSubsetEmitMain.lean
  is a different module (ComposeSubsetEmitMain.lean). Do not use that path.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT,
  SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_EMIT_V0,
  PARSE-LIVE-COMPOSE-SUBSET-EMIT, COMPOSE-SUBSET-EMIT, liveRel,
  kernelCheckLiveComposeSubsetEmitSource,
  hostFrontLiveComposeSubsetEmitReady.
  Module: SystemsLean.HostFrontLiveComposeSubsetEmit
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveComposeSubsetEmitSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveComposeSubsetEmit

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_EMIT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPOSE-SUBSET-EMIT"

/-- Live file basename. -/
def liveRel : String := "ComposeSubsetEmit.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveComposeSubsetEmitRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveComposeSubsetEmitFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveComposeSubsetEmitResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def composeSubsetEmitProvablyUnlocked is false. -/
def hostFrontLiveComposeSubsetEmitProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveComposeSubsetEmitParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveComposeSubsetEmitSkipFuel : Nat := 16384

/-- Kept commands: two imports, namespace, literal defs, and end.
    String-append, unknown consts, theorem, example, set_option, and
    IO mains are skip-folded. From ComposeSubsetEmit.lean. -/
def liveComposeSubsetEmitKeptCmds : Nat := 19

/-- theorem keyword count. ComposeSubsetEmit.lean has nine theorems. -/
def liveComposeSubsetEmitTheoremCount : Nat := 9

/-- example keyword count. ComposeSubsetEmit.lean has sixteen examples. -/
def liveComposeSubsetEmitExampleCount : Nat := 16

/-- set_option keyword count. ComposeSubsetEmit.lean has one set_option. -/
def liveComposeSubsetEmitSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . ComposeSubsetEmit`. -/
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
def cmdAddsComposeSubsetEmit (c : Cmd) : List String :=
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
def cmdBodyKnownComposeSubsetEmit (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveComposeSubsetEmitParseFuel body
        && termNoAppN liveComposeSubsetEmitParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveComposeSubsetEmitParseFuel body
        && termNoAppN liveComposeSubsetEmitParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdComposeSubsetEmit (fuel : Nat) (toks : List String) :
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
def parseCmdsComposeSubsetEmit : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdComposeSubsetEmit liveComposeSubsetEmitParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveComposeSubsetEmitSkipFuel rest
      if cmdBodyKnownComposeSubsetEmit kn c then
        parseCmdsComposeSubsetEmit n rest2
          (kn ++ cmdAddsComposeSubsetEmit c) (acc ++ [c])
      else
        parseCmdsComposeSubsetEmit n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveComposeSubsetEmitSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsComposeSubsetEmit n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ComposeSubsetEmit.lean text.
    Greppable: parseLiveComposeSubsetEmitSource,
    PARSE-LIVE-COMPOSE-SUBSET-EMIT. -/
def parseLiveComposeSubsetEmitSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsComposeSubsetEmit liveComposeSubsetEmitParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ComposeSubsetEmit"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ComposeSubsetEmit parse. Not a fixture.
    Greppable: kernelCheckLiveComposeSubsetEmitSource,
    PARSE-LIVE-COMPOSE-SUBSET-EMIT. -/
def kernelCheckLiveComposeSubsetEmitSource (src : String) : Bool :=
  match parseLiveComposeSubsetEmitSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveComposeSubsetEmitParsed? : Option Module :=
  match parseLiveComposeSubsetEmitSource liveComposeSubsetEmitSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveComposeSubsetEmitParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveComposeSubsetEmitParsed? with
  | some m => m.commands.length == liveComposeSubsetEmitKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveComposeSubsetEmitParsed? with
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
      && has "composeSubsetEmitLlvmUnlocked"
      && has "composeSubsetEmitProvablyUnlocked"

/-- Wrap module lastSeg is ComposeSubsetEmit (no module line in the live file). -/
def liveParseHasComposeSubsetEmitModule : Bool :=
  match liveComposeSubsetEmitParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ComposeSubsetEmit"
      && lastSeg m.name.raw == "ComposeSubsetEmit"

/-- Live parse has namespace SystemsLean.ComposeSubsetEmit. -/
def liveParseHasComposeSubsetEmitNs : Bool :=
  match liveComposeSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ComposeSubsetEmit"
      | _ => false

/-- Live parse ends namespace SystemsLean.ComposeSubsetEmit. -/
def liveParseHasComposeSubsetEmitEnd : Bool :=
  match liveComposeSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.ComposeSubsetEmit"
      | _ => false

/-- Live parse imports SystemsLean.CompilePathCompose. -/
def liveParseHasCompilePathComposeImport : Bool :=
  match liveComposeSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompilePathCompose"
      | _ => false

/-- Live parse imports SystemsLean.EmitCompose. -/
def liveParseHasEmitComposeImport : Bool :=
  match liveComposeSubsetEmitParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitCompose"
      | _ => false

/-- Keyword counts: nine theorems, sixteen examples, one set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveComposeSubsetEmitParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveComposeSubsetEmitSource)
    let fuel := liveComposeSubsetEmitSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveComposeSubsetEmitTheoremCount
      && toksCountKw fuel toks "example" 0 == liveComposeSubsetEmitExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveComposeSubsetEmitSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCompilePathCompose : String :=
  "import SystemsLean.CompilePathCompose\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitCompose : String := "import SystemsLean.EmitCompose\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.ComposeSubsetEmit\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n"

/-- surfaceId def needle with a trailing newline. -/
def needleSurfaceId : String :=
  "def surfaceId : String := \"COMPOSE-SUBSET-EMIT\"\n"

/-- stillUsesLake def needle with a trailing newline. -/
def needleStillUsesLake : String := "def stillUsesLake : Bool := true\n"

/-- dependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String := "def dependsOnLake : Bool := true\n"

/-- composeSubsetEmitLlvmUnlocked def needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "def composeSubsetEmitLlvmUnlocked : Bool := false\n"

/-- composeSubsetEmitProvablyUnlocked def needle with a trailing newline. -/
def needleProvablyUnlocked : String :=
  "def composeSubsetEmitProvablyUnlocked : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ComposeSubsetEmit\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveComposeSubsetEmitSource
  (src.splitOn needleImportCompilePathCompose).length > 1
    && (src.splitOn needleImportEmitCompose).length > 1
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
    Greppable: hostFrontLiveComposeSubsetEmitReady,
    PARSE-LIVE-COMPOSE-SUBSET-EMIT,
    HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveComposeSubsetEmitReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPOSE_SUBSET_EMIT_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPOSE-SUBSET-EMIT")
    && (parseId == "PARSE-LIVE-COMPOSE-SUBSET-EMIT")
    && (liveRel == "ComposeSubsetEmit.lean")
    && (liveComposeSubsetEmitRel
      == "src/systems/SystemsLean/ComposeSubsetEmit.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveComposeSubsetEmitFullHost
    && !hostFrontLiveComposeSubsetEmitResidualFreeClaimed
    && !hostFrontLiveComposeSubsetEmitProvablyUnlocked
    && kernelCheckLiveComposeSubsetEmitSource liveComposeSubsetEmitSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasComposeSubsetEmitModule
    && liveParseHasComposeSubsetEmitNs
    && liveParseHasComposeSubsetEmitEnd
    && liveParseHasCompilePathComposeImport
    && liveParseHasEmitComposeImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveComposeSubsetEmitSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveComposeSubsetEmit (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPOSE-SUBSET-EMIT =="
  IO.println s!"  host={hostId} file={liveComposeSubsetEmitRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveComposeSubsetEmitRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveComposeSubsetEmitRel}"
    throw (IO.userError s!"missing {liveComposeSubsetEmitRel}")
  let disk <- IO.FS.readFile path
  if disk != liveComposeSubsetEmitSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ComposeSubsetEmit.lean != liveComposeSubsetEmitSource"
    throw (IO.userError "dual-pin mismatch live ComposeSubsetEmit.lean")
  let r := parseLiveComposeSubsetEmitSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPOSE-SUBSET-EMIT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPOSE-SUBSET-EMIT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPOSE-SUBSET-EMIT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ComposeSubsetEmit parse false"
      throw (IO.userError "kernelCheck live ComposeSubsetEmit parse false")
    unless hostFrontLiveComposeSubsetEmitReady do
      IO.eprintln "error: hostFrontLiveComposeSubsetEmitReady false"
      throw (IO.userError "hostFrontLiveComposeSubsetEmitReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ComposeSubsetEmit source was accepted"
      throw (IO.userError "empty ComposeSubsetEmit source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveComposeSubsetEmit root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveComposeSubsetEmit
