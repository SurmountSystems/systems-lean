/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitErasureScaffold.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitErasureScaffold.lean. It is not EmitErasure.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 0. example count is 12.
  set_option count is 1. Those commands are skipped.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live namespace is SystemsLean.EmitErasure. Not PROVABLY.
  The provably flag stays false.
  liveRel is EmitErasureScaffold.lean in this module.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-ERASURE-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-ERASURE-SCAFFOLD, liveRel,
  kernelCheckLiveEmitErasureScaffoldSource,
  hostFrontLiveEmitErasureScaffoldReady.
  Module: SystemsLean.HostFrontLiveEmitErasureScaffold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitErasureScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitErasureScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-ERASURE-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-ERASURE-SCAFFOLD"

/-- Live file basename. Exactly EmitErasureScaffold.lean. -/
def liveRel : String := "EmitErasureScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitErasureScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitErasureScaffoldFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveEmitErasureScaffoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitErasureScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The live file says NOT PROVABLY. -/
def hostFrontLiveEmitErasureScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitErasureScaffoldParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveEmitErasureScaffoldSkipFuel : Nat := 8192

/-- Kept commands: namespace, six literal string defs, emitErasureSurfaceOk,
    and end. EmitErasureScaffold.lean has no import. Compound ++ defs are
    skipped. emitErasureReady and emitErasureOk are skipped because the
    concatenated fragments are not kernel-known. A count of 4 would drop
    the literal defs. -/
def liveEmitErasureScaffoldKeptCmds : Nat := 9

/-- theorem keyword count. EmitErasureScaffold.lean has no theorem. -/
def liveEmitErasureScaffoldTheoremCount : Nat := 0

/-- example keyword count. EmitErasureScaffold.lean has twelve examples. -/
def liveEmitErasureScaffoldExampleCount : Nat := 12

/-- set_option keyword count. EmitErasureScaffold.lean has one set_option. -/
def liveEmitErasureScaffoldSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . EmitErasure`. -/
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
def cmdAddsEmitErasureScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitErasureScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitErasureScaffoldParseFuel body
        && termNoAppN liveEmitErasureScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitErasureScaffoldParseFuel body
        && termNoAppN liveEmitErasureScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdEmitErasureScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitErasureScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitErasureScaffold liveEmitErasureScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitErasureScaffoldSkipFuel rest
      if cmdBodyKnownEmitErasureScaffold kn c then
        parseCmdsEmitErasureScaffold n rest2
          (kn ++ cmdAddsEmitErasureScaffold c) (acc ++ [c])
      else
        parseCmdsEmitErasureScaffold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitErasureScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitErasureScaffold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitErasureScaffold.lean text.
    Greppable: parseLiveEmitErasureScaffoldSource,
    PARSE-LIVE-EMIT-ERASURE-SCAFFOLD. -/
def parseLiveEmitErasureScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitErasureScaffold liveEmitErasureScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitErasure"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitErasureScaffold parse. Not a fixture.
    Greppable: kernelCheckLiveEmitErasureScaffoldSource,
    PARSE-LIVE-EMIT-ERASURE-SCAFFOLD. -/
def kernelCheckLiveEmitErasureScaffoldSource (src : String) : Bool :=
  match parseLiveEmitErasureScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitErasureScaffoldParsed? : Option Module :=
  match parseLiveEmitErasureScaffoldSource liveEmitErasureScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, six literal string defs, emitErasureSurfaceOk, and end.
    Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | some m => m.commands.length == liveEmitErasureScaffoldKeptCmds
  | none => false

/-- Literal defs the kernel must keep, plus emitErasureSurfaceOk. -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostEmitErasureId"
      && has "selfHostEmitErasureId"
      && has "acceptancePath"
      && has "hostModulePath"
      && has "ssotArtifactPath"
      && has "emitErasureSurfaceOk"

/-- Wrap module name is the live namespace SystemsLean.EmitErasure.
    There is no module line. The live file is EmitErasureScaffold.lean. -/
def liveParseHasEmitErasureModule : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitErasure"
      && lastSeg m.name.raw == "EmitErasure"

/-- Live parse has namespace SystemsLean.EmitErasure. -/
def liveParseHasEmitErasureNs : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitErasure"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitErasure. -/
def liveParseHasEmitErasureEnd : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitErasure"
      | _ => false

/-- Live file has no import. EmitErasureScaffold.lean does not import. -/
def liveParseHasNoImport : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem 0, example 12, set_option 1. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitErasureScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitErasureScaffoldSource)
    let fuel := liveEmitErasureScaffoldSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitErasureScaffoldTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitErasureScaffoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitErasureScaffoldSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitErasure\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_ERASURE_V0\"\n"

/-- hostEmitErasureId def needle with a trailing newline. -/
def needleHostEmitErasureId : String :=
  "def hostEmitErasureId : String := \"HOST-EMIT-ERASURE\"\n"

/-- selfHostEmitErasureId def needle with a trailing newline. -/
def needleSelfHostEmitErasureId : String :=
  "def selfHostEmitErasureId : String := \"SELF-HOST-EMIT-ERASURE\"\n"

/-- acceptancePath def needle with a trailing newline. -/
def needleAcceptancePath : String :=
  "def acceptancePath : String := \"src/systems/self-host.md\"\n"

/-- emitErasureOk def needle with a trailing newline. The def is skip-folded. -/
def needleEmitErasureOk : String := "def emitErasureOk : Bool := emitErasureReady\n"

/-- set_option needle with a trailing newline. The command is skip-folded. -/
def needleSetOption : String := "set_option maxRecDepth 2048\n"

/-- Example needle with a trailing newline. The example is skip-folded. -/
def needleExample : String :=
  "example : emitErasureOk = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitErasure\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. theorem, example, and set_option are counted, not parsed. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitErasureScaffoldSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostEmitErasureId).length > 1
    && (src.splitOn needleSelfHostEmitErasureId).length > 1
    && (src.splitOn needleAcceptancePath).length > 1
    && (src.splitOn needleEmitErasureOk).length > 1
    && (src.splitOn needleSetOption).length > 1
    && (src.splitOn needleExample).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitErasureScaffoldReady,
    PARSE-LIVE-EMIT-ERASURE-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-ERASURE-SCAFFOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitErasureScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_ERASURE_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-ERASURE-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-ERASURE-SCAFFOLD")
    && (liveRel == "EmitErasureScaffold.lean")
    && (liveEmitErasureScaffoldRel
      == "src/systems/SystemsLean/EmitErasureScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitErasureScaffoldFullHost
    && !hostFrontLiveEmitErasureScaffoldFullBackend
    && !hostFrontLiveEmitErasureScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitErasureScaffoldProvablyUnlocked
    && kernelCheckLiveEmitErasureScaffoldSource liveEmitErasureScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitErasureModule
    && liveParseHasEmitErasureNs
    && liveParseHasEmitErasureEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitErasureScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitErasureScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-ERASURE-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitErasureScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitErasureScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitErasureScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitErasureScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitErasureScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitErasureScaffold.lean != liveEmitErasureScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitErasureScaffold.lean")
  let r := parseLiveEmitErasureScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-ERASURE-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-ERASURE-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-ERASURE-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitErasureScaffold parse false"
      throw (IO.userError "kernelCheck live EmitErasureScaffold parse false")
    unless hostFrontLiveEmitErasureScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitErasureScaffoldReady false"
      IO.eprintln s!"  noCheck={liveParseHasNoCheckCmd} cmdCount={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} module={liveParseHasEmitErasureModule} ns={liveParseHasEmitErasureNs} endNs={liveParseHasEmitErasureEnd} noImport={liveParseHasNoImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk}"
      throw (IO.userError "hostFrontLiveEmitErasureScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitErasureScaffold source was accepted"
      throw (IO.userError "empty EmitErasureScaffold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitErasureScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitErasureScaffold
