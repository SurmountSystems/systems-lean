/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitComposeScaffold.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitComposeScaffold.lean. It is not a theorems file.
  The live namespace is SystemsLean.EmitCompose. There is no import.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. String-append bodies are skipped.
  theorem count is 1. example count is 12. set_option count is 2.
  Not a backend. FullBackend stays false.
  FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-COMPOSE-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD, EMIT-COMPOSE-SMOKE, liveRel,
  kernelCheckLiveEmitComposeScaffoldSource,
  hostFrontLiveEmitComposeScaffoldReady.
  Module: SystemsLean.HostFrontLiveEmitComposeScaffold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitComposeScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitComposeScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-COMPOSE-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD"

/-- Live file basename. -/
def liveRel : String := "EmitComposeScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitComposeScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitComposeScaffoldFullHost : Bool := false

/-- Honesty: FullBackend stays false. Not a backend. -/
def hostFrontLiveEmitComposeScaffoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitComposeScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveEmitComposeScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold and term walk). -/
def liveEmitComposeScaffoldParseFuel : Nat := 1024

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveEmitComposeScaffoldSkipFuel : Nat := 8192

/-- Kept commands: namespace, six literal string defs, emitComposeSurfaceOk,
    and end. EmitComposeScaffold.lean has no import.
    A smaller count would drop the literal defs. -/
def liveEmitComposeScaffoldKeptCmds : Nat := 9

/-- theorem keyword count. One theorem: emitComposeReady_true. -/
def liveEmitComposeScaffoldTheoremCount : Nat := 1

/-- example keyword count. Twelve examples in the smoke section. -/
def liveEmitComposeScaffoldExampleCount : Nat := 12

/-- set_option keyword count. maxRecDepth and maxHeartbeats. -/
def liveEmitComposeScaffoldSetOptionCount : Nat := 2

/-- Dotted ident `SystemsLean . EmitCompose`. -/
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
def cmdAddsEmitComposeScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitComposeScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitComposeScaffoldParseFuel body
        && termNoAppN liveEmitComposeScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitComposeScaffoldParseFuel body
        && termNoAppN liveEmitComposeScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdEmitComposeScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitComposeScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitComposeScaffold liveEmitComposeScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitComposeScaffoldSkipFuel rest
      if cmdBodyKnownEmitComposeScaffold kn c then
        parseCmdsEmitComposeScaffold n rest2
          (kn ++ cmdAddsEmitComposeScaffold c) (acc ++ [c])
      else
        parseCmdsEmitComposeScaffold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitComposeScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitComposeScaffold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitComposeScaffold.lean text.
    Greppable: parseLiveEmitComposeScaffoldSource,
    PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD. -/
def parseLiveEmitComposeScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitComposeScaffold liveEmitComposeScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitCompose"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitComposeScaffold parse. Not a fixture.
    Greppable: kernelCheckLiveEmitComposeScaffoldSource,
    PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD. -/
def kernelCheckLiveEmitComposeScaffoldSource (src : String) : Bool :=
  match parseLiveEmitComposeScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitComposeScaffoldParsed? : Option Module :=
  match parseLiveEmitComposeScaffoldSource liveEmitComposeScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable defs. No import. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | some m => m.commands.length == liveEmitComposeScaffoldKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostEmitComposeId"
      && has "selfHostEmitComposeId"
      && has "acceptancePath"
      && has "hostModulePath"
      && has "ssotArtifactPath"
      && has "emitComposeSurfaceOk"

/-- Wrap module lastSeg is EmitCompose (namespace; no module line in the live file). -/
def liveParseHasEmitComposeModule : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitCompose"
      && lastSeg m.name.raw == "EmitCompose"

/-- Live parse has namespace SystemsLean.EmitCompose. -/
def liveParseHasEmitComposeNs : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitCompose"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitCompose. -/
def liveParseHasEmitComposeEnd : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitCompose"
      | _ => false

/-- Live file has no import command. -/
def liveParseHasNoImport : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Count one keyword in the stripped live source. -/
def liveKwCount (kw : String) : Nat :=
  let toks := tokenizeHostTerm (stripComments liveEmitComposeScaffoldSource)
  toksCountKw liveEmitComposeScaffoldSkipFuel toks kw 0

/-- Keyword counts: one theorem, twelve examples, two set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitComposeScaffoldParsed? with
  | none => false
  | some _ =>
    liveKwCount "theorem" == liveEmitComposeScaffoldTheoremCount
      && liveKwCount "example" == liveEmitComposeScaffoldExampleCount
      && liveKwCount "set_option" == liveEmitComposeScaffoldSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitCompose\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_SELF_HOST_EMIT_COMPOSE_V0\"\n"

/-- hostEmitComposeId def needle with a trailing newline. -/
def needleHostEmitComposeId : String :=
  "def hostEmitComposeId : String := \"HOST-EMIT-COMPOSE\"\n"

/-- selfHostEmitComposeId def needle with a trailing newline. -/
def needleSelfHostEmitComposeId : String :=
  "def selfHostEmitComposeId : String := \"SELF-HOST-EMIT-COMPOSE\"\n"

/-- acceptancePath def needle with a trailing newline. -/
def needleAcceptancePath : String :=
  "def acceptancePath : String := \"src/systems/self-host.md\"\n"

/-- hostModulePath def needle with a trailing newline. -/
def needleHostModulePath : String :=
  "def hostModulePath : String := \"src/systems/SystemsLean/EmitCompose.lean\"\n"

/-- ssotArtifactPath def needle with a trailing newline. -/
def needleSsotArtifactPath : String :=
  "def ssotArtifactPath : String := \"src/systems/emit/host_emit_compose.ssot.txt\"\n"

/-- Host-owned section needle with a trailing newline. -/
def needleSectionHostOwned : String :=
  "/-! ### Host-owned freestanding host compose product C (HOST-EMIT-COMPOSE)\n"

/-- composeHeaderFragment declaration needle with a trailing newline. -/
def needleComposeHeaderFragment : String :=
  "def composeHeaderFragment : String :=\n"

/-- composeBodyFragment declaration needle with a trailing newline. -/
def needleComposeBodyFragment : String :=
  "def composeBodyFragment : String :=\n"

/-- emitComposeSurfaceOk declaration needle with a trailing newline. -/
def needleEmitComposeSurfaceOk : String :=
  "def emitComposeSurfaceOk : Bool :=\n"

/-- emitComposeReady declaration needle with a trailing newline. -/
def needleEmitComposeReady : String :=
  "def emitComposeReady : Bool :=\n"

/-- Smoke section needle with a trailing newline. -/
def needleSectionSmoke : String :=
  "/-! ### Host compose host emit smoke (behavioral; lake build fails if an example does not hold)\n"

/-- maxRecDepth set_option needle with a trailing newline. -/
def needleSetOptionDepth : String := "set_option maxRecDepth 32768\n"

/-- maxHeartbeats set_option needle with a trailing newline. -/
def needleSetOptionHearts : String := "set_option maxHeartbeats 800000\n"

/-- emitComposeReady_true theorem needle with a trailing newline. -/
def needleTheorem : String :=
  "theorem emitComposeReady_true : emitComposeReady = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitCompose\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. Section text is the live EmitComposeScaffold text. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitComposeScaffoldSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostEmitComposeId).length > 1
    && (src.splitOn needleSelfHostEmitComposeId).length > 1
    && (src.splitOn needleAcceptancePath).length > 1
    && (src.splitOn needleHostModulePath).length > 1
    && (src.splitOn needleSsotArtifactPath).length > 1
    && (src.splitOn needleSectionHostOwned).length > 1
    && (src.splitOn needleComposeHeaderFragment).length > 1
    && (src.splitOn needleComposeBodyFragment).length > 1
    && (src.splitOn needleEmitComposeSurfaceOk).length > 1
    && (src.splitOn needleEmitComposeReady).length > 1
    && (src.splitOn needleSectionSmoke).length > 1
    && (src.splitOn needleSetOptionDepth).length > 1
    && (src.splitOn needleSetOptionHearts).length > 1
    && (src.splitOn needleTheorem).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitComposeScaffoldReady,
    PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-COMPOSE-SCAFFOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitComposeScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-COMPOSE-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD")
    && (liveRel == "EmitComposeScaffold.lean")
    && (liveEmitComposeScaffoldRel
      == "src/systems/SystemsLean/EmitComposeScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitComposeScaffoldFullHost
    && !hostFrontLiveEmitComposeScaffoldFullBackend
    && !hostFrontLiveEmitComposeScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitComposeScaffoldProvablyUnlocked
    && kernelCheckLiveEmitComposeScaffoldSource liveEmitComposeScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitComposeModule
    && liveParseHasEmitComposeNs
    && liveParseHasEmitComposeEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitComposeScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- Short command label for a failed ready check. -/
def emitComposeScaffoldCmdDiag (c : Cmd) : String :=
  match c with
  | Cmd.def_ x _ _ => "def " ++ x.raw
  | Cmd.defBind x _ _ _ => "defBind " ++ x.raw
  | Cmd.importModule x => "import " ++ x.raw
  | Cmd.namespace x => "namespace " ++ x.raw
  | Cmd.endNamespace x => "end " ++ x.raw
  | Cmd.check _ _ => "check"
  | _ => "other"

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitComposeScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitComposeScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitComposeScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitComposeScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitComposeScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitComposeScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitComposeScaffold.lean != liveEmitComposeScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitComposeScaffold.lean")
  let r := parseLiveEmitComposeScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-COMPOSE-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitComposeScaffold parse false"
      throw (IO.userError "kernelCheck live EmitComposeScaffold parse false")
    unless hostFrontLiveEmitComposeScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitComposeScaffoldReady false"
      IO.eprintln s!"diag cmdCountOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} module={liveParseHasEmitComposeModule} ns={liveParseHasEmitComposeNs} endNs={liveParseHasEmitComposeEnd} noImport={liveParseHasNoImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd}"
      let th := liveKwCount "theorem"
      let ex := liveKwCount "example"
      let so := liveKwCount "set_option"
      IO.eprintln s!"diag kw theorem={th} example={ex} set_option={so}"
      match liveEmitComposeScaffoldParsed? with
      | none => IO.eprintln "diag parse none"
      | some parsed =>
        IO.eprintln s!"diag cmds={parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"diag {emitComposeScaffoldCmdDiag c}"
      throw (IO.userError "hostFrontLiveEmitComposeScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitComposeScaffold source was accepted"
      throw (IO.userError "empty EmitComposeScaffold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitComposeScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitComposeScaffold
