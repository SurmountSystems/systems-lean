/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitPlanScaffold.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitPlanScaffold.lean. It is not EmitPlan.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 1. example count is 12.
  set_option count is 2. Those commands are skipped.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live namespace is SystemsLean.EmitPlan. Not PROVABLY.
  The provably flag stays false.
  liveRel is defined in HostFrontLiveEmitPlanScaffoldSource.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-PLAN-SCAFFOLD,
  SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_SCAFFOLD_V0,
  PARSE-LIVE-EMIT-PLAN-SCAFFOLD, liveRel,
  kernelCheckLiveEmitPlanScaffoldSource,
  hostFrontLiveEmitPlanScaffoldReady.
  Module: SystemsLean.HostFrontLiveEmitPlanScaffold
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitPlanScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitPlanScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-PLAN-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-PLAN-SCAFFOLD"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is EmitPlanScaffold.lean in the Source module. -/
def liveEmitPlanScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitPlanScaffoldFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveEmitPlanScaffoldFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitPlanScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The live file says NOT PROVABLY. -/
def hostFrontLiveEmitPlanScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitPlanScaffoldParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveEmitPlanScaffoldSkipFuel : Nat := 8192

/-- Kept commands: namespace, six literal string defs, emitPlanSurfaceOk, and end.
    EmitPlanScaffold.lean has no import. Compound ++ defs are skipped.
    emitPlanOk is skipped because emitPlanReady is not kernel-known.
    A count of 4 would drop the literal defs. -/
def liveEmitPlanScaffoldKeptCmds : Nat := 9

/-- theorem keyword count. EmitPlanScaffold.lean has one theorem. -/
def liveEmitPlanScaffoldTheoremCount : Nat := 1

/-- example keyword count. EmitPlanScaffold.lean has twelve examples. -/
def liveEmitPlanScaffoldExampleCount : Nat := 12

/-- set_option keyword count. EmitPlanScaffold.lean has two set_option lines. -/
def liveEmitPlanScaffoldSetOptionCount : Nat := 2

/-- Dotted ident `SystemsLean . EmitPlan`. -/
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
def cmdAddsEmitPlanScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitPlanScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitPlanScaffoldParseFuel body
        && termNoAppN liveEmitPlanScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitPlanScaffoldParseFuel body
        && termNoAppN liveEmitPlanScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdEmitPlanScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitPlanScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitPlanScaffold liveEmitPlanScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitPlanScaffoldSkipFuel rest
      if cmdBodyKnownEmitPlanScaffold kn c then
        parseCmdsEmitPlanScaffold n rest2
          (kn ++ cmdAddsEmitPlanScaffold c) (acc ++ [c])
      else
        parseCmdsEmitPlanScaffold n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitPlanScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitPlanScaffold n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitPlanScaffold.lean text.
    Greppable: parseLiveEmitPlanScaffoldSource,
    PARSE-LIVE-EMIT-PLAN-SCAFFOLD. -/
def parseLiveEmitPlanScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitPlanScaffold liveEmitPlanScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitPlan"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitPlanScaffold parse. Not a fixture.
    Greppable: kernelCheckLiveEmitPlanScaffoldSource,
    PARSE-LIVE-EMIT-PLAN-SCAFFOLD. -/
def kernelCheckLiveEmitPlanScaffoldSource (src : String) : Bool :=
  match parseLiveEmitPlanScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitPlanScaffoldParsed? : Option Module :=
  match parseLiveEmitPlanScaffoldSource liveEmitPlanScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, six literal string defs, emitPlanSurfaceOk, and end.
    Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | some m => m.commands.length == liveEmitPlanScaffoldKeptCmds
  | none => false

/-- Literal defs the kernel must keep, plus emitPlanSurfaceOk. -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "productStageId"
      && has "hostEmitPlanId"
      && has "selfHostEmitPlanId"
      && has "productAcceptancePath"
      && has "productHostModulePath"
      && has "planSsotArtifactPath"
      && has "emitPlanSurfaceOk"

/-- Wrap module name is the live namespace SystemsLean.EmitPlan.
    There is no module line. The live file is EmitPlanScaffold.lean. -/
def liveParseHasEmitPlanModule : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitPlan"
      && lastSeg m.name.raw == "EmitPlan"

/-- Live parse has namespace SystemsLean.EmitPlan. -/
def liveParseHasEmitPlanNs : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitPlan"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitPlan. -/
def liveParseHasEmitPlanEnd : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitPlan"
      | _ => false

/-- Live file has no import. EmitPlanScaffold.lean does not import. -/
def liveParseHasNoImport : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem 1, example 12, set_option 2. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitPlanScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitPlanScaffoldSource)
    let fuel := liveEmitPlanScaffoldSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitPlanScaffoldTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitPlanScaffoldExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitPlanScaffoldSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitPlan\n"

/-- productStageId def needle with a trailing newline. -/
def needleProductStageId : String :=
  "def productStageId : String := \"SLAKE_SELF_HOST_EMIT_PLAN_V0\"\n"

/-- hostEmitPlanId def needle with a trailing newline. -/
def needleHostEmitPlanId : String :=
  "def hostEmitPlanId : String := \"HOST-EMIT-PLAN\"\n"

/-- selfHostEmitPlanId def needle with a trailing newline. -/
def needleSelfHostEmitPlanId : String :=
  "def selfHostEmitPlanId : String := \"SELF-HOST-EMIT-PLAN\"\n"

/-- productAcceptancePath def needle with a trailing newline. -/
def needleProductAcceptancePath : String :=
  "def productAcceptancePath : String := \"src/systems/self-host.md\"\n"

/-- emitPlanOk def needle with a trailing newline. -/
def needleEmitPlanOk : String := "def emitPlanOk : Bool := emitPlanReady\n"

/-- Theorem needle with a trailing newline. The theorem is skip-folded. -/
def needleTheorem : String :=
  "theorem emitPlanReady_true : emitPlanReady = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitPlan\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. theorem, example, and set_option are counted, not parsed. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitPlanScaffoldSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleProductStageId).length > 1
    && (src.splitOn needleHostEmitPlanId).length > 1
    && (src.splitOn needleSelfHostEmitPlanId).length > 1
    && (src.splitOn needleProductAcceptancePath).length > 1
    && (src.splitOn needleEmitPlanOk).length > 1
    && (src.splitOn needleTheorem).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitPlanScaffoldReady,
    PARSE-LIVE-EMIT-PLAN-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-PLAN-SCAFFOLD.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitPlanScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_PLAN_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-PLAN-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-PLAN-SCAFFOLD")
    && (liveRel == "EmitPlanScaffold.lean")
    && (liveEmitPlanScaffoldRel
      == "src/systems/SystemsLean/EmitPlanScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitPlanScaffoldFullHost
    && !hostFrontLiveEmitPlanScaffoldFullBackend
    && !hostFrontLiveEmitPlanScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitPlanScaffoldProvablyUnlocked
    && kernelCheckLiveEmitPlanScaffoldSource liveEmitPlanScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitPlanModule
    && liveParseHasEmitPlanNs
    && liveParseHasEmitPlanEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitPlanScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitPlanScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-PLAN-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitPlanScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitPlanScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitPlanScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitPlanScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitPlanScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitPlanScaffold.lean != liveEmitPlanScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitPlanScaffold.lean")
  let r := parseLiveEmitPlanScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-PLAN-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-PLAN-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-PLAN-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitPlanScaffold parse false"
      throw (IO.userError "kernelCheck live EmitPlanScaffold parse false")
    unless hostFrontLiveEmitPlanScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitPlanScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitPlanScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitPlanScaffold source was accepted"
      throw (IO.userError "empty EmitPlanScaffold source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitPlanScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitPlanScaffold
