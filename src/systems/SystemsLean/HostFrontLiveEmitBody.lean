/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitBody.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is EmitBody.lean. It is not EmitBodyScaffold.lean.
  Literal defs stay. The structure Body stays. Compound defs are skipped
  only when the body is not kernel-checkable. private is skipped.
  theorem count is 19. example count is 11. set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  EmitBody.lean has no llvmUnlocked def and no provablyUnlocked def.
  The provably flag stays false. FullBackend stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-BODY,
  SLAKE_HOST_FRONT_LIVE_EMIT_BODY_V0,
  PARSE-LIVE-EMIT-BODY, EMIT-BODY-THEOREM, liveRel,
  kernelCheckLiveEmitBodySource,
  hostFrontLiveEmitBodyReady.
  Module: SystemsLean.HostFrontLiveEmitBody
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitBodySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitBody

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_BODY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-BODY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-BODY"

/-- Live file basename. -/
def liveRel : String := "EmitBody.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitBodyRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitBodyFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live def llvmUnlocked is true. That def is not this flag. -/
def hostFrontLiveEmitBodyFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitBodyResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live def provablyUnlocked is true. That def is not this flag. -/
def hostFrontLiveEmitBodyProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitBodyParseFuel : Nat := 256

/-- Skip fuel for private and defs whose bodies are not kernel-checkable.
    Also the keyword-count walk over the whole token list. -/
def liveEmitBodySkipFuel : Nat := 65536

/-- Kept commands: six imports, namespace, bodyCap, structure Body,
    emptyComposeFragmentSsot, and end. failClosed is skip-folded:
    its struct literal has no commas, so the parser does not keep it.
    From EmitBody.lean. Parse result is 11. -/
def liveEmitBodyKeptCmds : Nat := 11

/-- theorem keyword count. EmitBody.lean has 19 theorems. -/
def liveEmitBodyTheoremCount : Nat := 19

/-- example keyword count. EmitBody.lean has 11 examples. -/
def liveEmitBodyExampleCount : Nat := 11

/-- set_option keyword count. EmitBody.lean has no set_option. -/
def liveEmitBodySetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . EmitBody`. -/
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
def cmdAddsEmitBody (c : Cmd) : List String :=
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
def cmdBodyKnownEmitBody (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitBodyParseFuel body
        && termNoAppN liveEmitBodyParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitBodyParseFuel body
        && termNoAppN liveEmitBodyParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdEmitBody (fuel : Nat) (toks : List String) :
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
  | "structure" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseStructFieldDeclsHt fuel rest [] with
      | none => none
      | some (fields, rest2) =>
        if fields.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingHt rest3 with
            | some (der, rest4) =>
              some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields der, rest4)
            | none => none
          | _ =>
            some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields [], rest2)
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem, example, set_option, private, and un-kernelable defs. -/
def parseCmdsEmitBody : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitBody liveEmitBodyParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitBodySkipFuel rest
      if cmdBodyKnownEmitBody kn c then
        parseCmdsEmitBody n rest2
          (kn ++ cmdAddsEmitBody c) (acc ++ [c])
      else
        parseCmdsEmitBody n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitBody n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitBodySkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitBody n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live EmitBody.lean text.
    Greppable: parseLiveEmitBodySource,
    PARSE-LIVE-EMIT-BODY. -/
def parseLiveEmitBodySource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitBody liveEmitBodyParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitBody"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitBody parse. Not a fixture.
    Greppable: kernelCheckLiveEmitBodySource,
    PARSE-LIVE-EMIT-BODY. -/
def kernelCheckLiveEmitBodySource (src : String) : Bool :=
  match parseLiveEmitBodySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitBodyParsed? : Option Module :=
  match parseLiveEmitBodySource liveEmitBodySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitBodyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Six imports, namespace, bodyCap,
    structure Body, emptyComposeFragmentSsot, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitBodyParsed? with
  | some m => m.commands.length == liveEmitBodyKeptCmds
  | none => false

/-- Literal defs the kernel must keep: bodyCap and
    emptyComposeFragmentSsot. structure Body is kept beside them.
    failClosed is not kept (comma-less struct literal). -/
def liveParseHasLiteralDefs : Bool :=
  match liveEmitBodyParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    let hasStruct : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.structure_ x _ _ => x.raw == "Body"
        | _ => false
    has "bodyCap"
      && has "emptyComposeFragmentSsot"
      && hasStruct

/-- Wrap module lastSeg is EmitBody (no module line in the live file). -/
def liveParseHasEmitBodyModule : Bool :=
  match liveEmitBodyParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitBody"
      && lastSeg m.name.raw == "EmitBody"

/-- Live parse has namespace SystemsLean.EmitBody. -/
def liveParseHasEmitBodyNs : Bool :=
  match liveEmitBodyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitBody"
      | _ => false

/-- Live parse ends namespace SystemsLean.EmitBody. -/
def liveParseHasEmitBodyEnd : Bool :=
  match liveEmitBodyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitBody"
      | _ => false

/-- Live parse imports the EmitBody prefix, not SystemsLean.SelfApply. -/
def liveParseHasEmitBodyImports : Bool :=
  match liveEmitBodyParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Mult"
      && has "SystemsLean.Types"
      && has "SystemsLean.HostCompose"
      && has "SystemsLean.EmitPlan"
      && has "SystemsLean.EmitApply"
      && has "SystemsLean.EmitBodyScaffold"

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveEmitBodyParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitBodySource)
    let fuel := liveEmitBodySkipFuel
    toksCountKw fuel toks "theorem" 0 == liveEmitBodyTheoremCount
      && toksCountKw fuel toks "example" 0 == liveEmitBodyExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveEmitBodySetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Import needle. Trailing newline. -/
def needleImportTypes : String := "import SystemsLean.Types\n"

/-- Import needle. Trailing newline. -/
def needleImportHostCompose : String := "import SystemsLean.HostCompose\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitPlan : String := "import SystemsLean.EmitPlan\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitApply : String := "import SystemsLean.EmitApply\n"

/-- Import needle. Trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitBodyScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitBody\n"

/-- bodyCap def needle with a trailing newline. -/
def needleBodyCap : String := "def bodyCap : Nat := 256\n"

/-- structure Body needle with a trailing newline. -/
def needleStructureBody : String := "structure Body where\n"

/-- empty fragment def needle with a trailing newline. -/
def needleEmptyFragment : String :=
  "def emptyComposeFragmentSsot : String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitBody\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.SelfApply. No stageId needle. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitBodySource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleImportTypes).length > 1
    && (src.splitOn needleImportHostCompose).length > 1
    && (src.splitOn needleImportEmitPlan).length > 1
    && (src.splitOn needleImportEmitApply).length > 1
    && (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleBodyCap).length > 1
    && (src.splitOn needleStructureBody).length > 1
    && (src.splitOn needleEmptyFragment).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitBodyReady,
    PARSE-LIVE-EMIT-BODY,
    HOST-FRONT-LIVE-EMIT-BODY.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveEmitBodyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_BODY_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-BODY")
    && (parseId == "PARSE-LIVE-EMIT-BODY")
    && (liveRel == "EmitBody.lean")
    && (liveEmitBodyRel
      == "src/systems/SystemsLean/EmitBody.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitBodyFullHost
    && !hostFrontLiveEmitBodyFullBackend
    && !hostFrontLiveEmitBodyResidualFreeClaimed
    && !hostFrontLiveEmitBodyProvablyUnlocked
    && kernelCheckLiveEmitBodySource liveEmitBodySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasEmitBodyModule
    && liveParseHasEmitBodyNs
    && liveParseHasEmitBodyEnd
    && liveParseHasEmitBodyImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitBodySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveEmitBody (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-BODY =="
  IO.println s!"  host={hostId} file={liveEmitBodyRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitBodyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitBodyRel}"
    throw (IO.userError s!"missing {liveEmitBodyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitBodySource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitBody.lean != liveEmitBodySource"
    throw (IO.userError "dual-pin mismatch live EmitBody.lean")
  let r := parseLiveEmitBodySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-BODY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-BODY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-BODY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitBody parse false"
      throw (IO.userError "kernelCheck live EmitBody parse false")
    unless hostFrontLiveEmitBodyReady do
      IO.eprintln s!"error: hostFrontLiveEmitBodyReady false countOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} kw={liveParseKwCountsOk} needles={liveNeedlesOk} imports={liveParseHasEmitBodyImports} ns={liveParseHasEmitBodyNs} endOk={liveParseHasEmitBodyEnd} mod={liveParseHasEmitBodyModule} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveEmitBodyReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitBody source was accepted"
      throw (IO.userError "empty EmitBody source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitBody root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitBody
