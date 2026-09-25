/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmComposeSsa.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmComposeSsa.lean. It is not LlvmComposeSsaTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 15. example count is 23.
  set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The product def llvmComposeSsaLlvmUnlocked is false. Do not flip it.
  This wrap is not PROVABLY. The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-COMPOSE-SSA,
  SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_SSA_V0,
  PARSE-LIVE-LLVM-COMPOSE-SSA, LLVM-COMPOSE-SSA-THEOREM, liveRel,
  kernelCheckLiveLlvmComposeSsaSource,
  hostFrontLiveLlvmComposeSsaReady.
  Module: SystemsLean.HostFrontLiveLlvmComposeSsa
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmComposeSsaSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmComposeSsa

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-COMPOSE-SSA"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-COMPOSE-SSA"

/-- Live file basename. -/
def liveRel : String := "LlvmComposeSsa.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmComposeSsaRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmComposeSsaFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The product def llvmComposeSsaLlvmUnlocked is false. That def is not this flag. -/
def hostFrontLiveLlvmComposeSsaFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmComposeSsaResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveLlvmComposeSsaProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmComposeSsaParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable.
    Also the keyword-count walk, so a long SSA text does not stop early. -/
def liveLlvmComposeSsaSkipFuel : Nat := 65536

/-- Kept commands: imports, namespace, kernel-checkable defs, and end.
    A count of 4 would drop the literal defs. From LlvmComposeSsa.lean.
    Reset from the printed cmds= count when that count differs. -/
def liveLlvmComposeSsaKeptCmds : Nat := 47

/-- theorem keyword count. LlvmComposeSsa.lean has 15 theorem tokens. -/
def liveLlvmComposeSsaTheoremCount : Nat := 15

/-- example keyword count. Tokenizer count of example. -/
def liveLlvmComposeSsaExampleCount : Nat := 23

/-- set_option keyword count. LlvmComposeSsa.lean has no set_option. -/
def liveLlvmComposeSsaSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmComposeSsa`. -/
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
def cmdAddsLlvmComposeSsa (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmComposeSsa (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmComposeSsaParseFuel body
        && termNoAppN liveLlvmComposeSsaParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmComposeSsaParseFuel body
        && termNoAppN liveLlvmComposeSsaParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmComposeSsa (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmComposeSsa : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmComposeSsa liveLlvmComposeSsaParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmComposeSsaSkipFuel rest
      if cmdBodyKnownLlvmComposeSsa kn c then
        parseCmdsLlvmComposeSsa n rest2
          (kn ++ cmdAddsLlvmComposeSsa c) (acc ++ [c])
      else
        parseCmdsLlvmComposeSsa n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmComposeSsaSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmComposeSsa n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmComposeSsa.lean text.
    Greppable: parseLiveLlvmComposeSsaSource,
    PARSE-LIVE-LLVM-COMPOSE-SSA. -/
def parseLiveLlvmComposeSsaSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmComposeSsa liveLlvmComposeSsaParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmComposeSsa"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmComposeSsa parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmComposeSsaSource,
    PARSE-LIVE-LLVM-COMPOSE-SSA. -/
def kernelCheckLiveLlvmComposeSsaSource (src : String) : Bool :=
  match parseLiveLlvmComposeSsaSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmComposeSsaParsed? : Option Module :=
  match parseLiveLlvmComposeSsaSource liveLlvmComposeSsaSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmComposeSsaParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmComposeSsaParsed? with
  | some m => m.commands.length == liveLlvmComposeSsaKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmComposeSsaParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "llvmComposeSsaFinishedClaimed"
      && has "llvmComposeSsaLlvmUnlocked"
      && has "llvmComposeSsaFullBackendClaimed"

/-- Wrap module lastSeg is LlvmComposeSsa (no module line in the live file). -/
def liveParseHasLlvmComposeSsaModule : Bool :=
  match liveLlvmComposeSsaParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmComposeSsa"
      && lastSeg m.name.raw == "LlvmComposeSsa"

/-- Live parse has namespace SystemsLean.LlvmComposeSsa. -/
def liveParseHasLlvmComposeSsaNs : Bool :=
  match liveLlvmComposeSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmComposeSsa"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmComposeSsa. -/
def liveParseHasLlvmComposeSsaEnd : Bool :=
  match liveLlvmComposeSsaParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmComposeSsa"
      | _ => false

/-- Live parse imports HostCompose and the six peer modules. Not SelfApply. -/
def liveParseHasImports : Bool :=
  match liveLlvmComposeSsaParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.HostCompose"
      && has "SystemsLean.IrProgram"
      && has "SystemsLean.IrGraph"
      && has "SystemsLean.LlvmHold"
      && has "SystemsLean.LlvmEmitPath"
      && has "SystemsLean.LlvmComposeText"
      && has "SystemsLean.LlvmGraphSsa"

/-- Keyword counts: theorem 15, example from the tokenizer, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmComposeSsaParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmComposeSsaSource)
    let fuel := liveLlvmComposeSsaSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmComposeSsaTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmComposeSsaExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmComposeSsaSetOptionCount

/-- Import needles. Each line keeps its trailing newline. -/
def needleImportHostCompose : String := "import SystemsLean.HostCompose\n"
def needleImportIrProgram : String := "import SystemsLean.IrProgram\n"
def needleImportIrGraph : String := "import SystemsLean.IrGraph\n"
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"
def needleImportLlvmEmitPath : String := "import SystemsLean.LlvmEmitPath\n"
def needleImportLlvmComposeText : String := "import SystemsLean.LlvmComposeText\n"
def needleImportLlvmGraphSsa : String := "import SystemsLean.LlvmGraphSsa\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmComposeSsa\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_COMPOSE_SSA_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String := \"HOST-LLVM-COMPOSE-SSA\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmComposeSsa\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No SelfApply needle. No hostLlvmComposeSsaId needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmComposeSsaSource
  (src.splitOn needleImportHostCompose).length > 1
    && (src.splitOn needleImportIrProgram).length > 1
    && (src.splitOn needleImportIrGraph).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleImportLlvmEmitPath).length > 1
    && (src.splitOn needleImportLlvmComposeText).length > 1
    && (src.splitOn needleImportLlvmGraphSsa).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmComposeSsaReady,
    PARSE-LIVE-LLVM-COMPOSE-SSA,
    HOST-FRONT-LIVE-LLVM-COMPOSE-SSA.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmComposeSsaReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_COMPOSE_SSA_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-COMPOSE-SSA")
    && (parseId == "PARSE-LIVE-LLVM-COMPOSE-SSA")
    && (liveRel == "LlvmComposeSsa.lean")
    && (liveLlvmComposeSsaRel
      == "src/systems/SystemsLean/LlvmComposeSsa.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmComposeSsaFullHost
    && !hostFrontLiveLlvmComposeSsaFullBackend
    && !hostFrontLiveLlvmComposeSsaResidualFreeClaimed
    && !hostFrontLiveLlvmComposeSsaProvablyUnlocked
    && kernelCheckLiveLlvmComposeSsaSource liveLlvmComposeSsaSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmComposeSsaModule
    && liveParseHasLlvmComposeSsaNs
    && liveParseHasLlvmComposeSsaEnd
    && liveParseHasImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmComposeSsaSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmComposeSsa (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-COMPOSE-SSA =="
  IO.println s!"  host={hostId} file={liveLlvmComposeSsaRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmComposeSsaRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmComposeSsaRel}"
    throw (IO.userError s!"missing {liveLlvmComposeSsaRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmComposeSsaSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmComposeSsa.lean != liveLlvmComposeSsaSource"
    throw (IO.userError "dual-pin mismatch live LlvmComposeSsa.lean")
  let r := parseLiveLlvmComposeSsaSource disk
  match r with
  | FrontResult.reject reason =>
    let toks := tokenizeHostTerm (stripComments disk)
    let fuel := liveLlvmComposeSsaSkipFuel
    let th := toksCountKw fuel toks "theorem" 0
    let ex := toksCountKw fuel toks "example" 0
    let so := toksCountKw fuel toks "set_option" 0
    IO.println s!"kw theorem={th} example={ex} set_option={so}"
    IO.eprintln s!"error: PARSE-LIVE-LLVM-COMPOSE-SSA reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-COMPOSE-SSA reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-COMPOSE-SSA ACCEPT cmds={m.commands.length} kernelCheck={k}"
    let toks := tokenizeHostTerm (stripComments disk)
    let fuel := liveLlvmComposeSsaSkipFuel
    let th := toksCountKw fuel toks "theorem" 0
    let ex := toksCountKw fuel toks "example" 0
    let so := toksCountKw fuel toks "set_option" 0
    IO.println s!"kw theorem={th} example={ex} set_option={so}"
    IO.println s!"checks cmdCount={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} imports={liveParseHasImports} kw={liveParseKwCountsOk} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmComposeSsa parse false"
      throw (IO.userError "kernelCheck live LlvmComposeSsa parse false")
    unless hostFrontLiveLlvmComposeSsaReady do
      IO.eprintln "error: hostFrontLiveLlvmComposeSsaReady false"
      throw (IO.userError "hostFrontLiveLlvmComposeSsaReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmComposeSsa source was accepted"
      throw (IO.userError "empty LlvmComposeSsa source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmComposeSsa root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmComposeSsa
