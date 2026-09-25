/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmCfgUnitProduction.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmCfgUnitProduction.lean. It is not LlvmCfgFixture.lean.
  It is not LlvmHold.lean. It is not LlvmCfgMultProduction.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. List literals do not parse and are skipped.
  theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-CFG-UNIT-PRODUCTION,
  LLVM-CFG-UNIT-PRODUCTION,
  PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION, liveRel,
  kernelCheckLiveLlvmCfgUnitProductionSource,
  hostFrontLiveLlvmCfgUnitProductionReady.
  Module: SystemsLean.HostFrontLiveLlvmCfgUnitProduction
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmCfgUnitProductionSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmCfgUnitProduction

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Hyphenated. Not the LlvmHold stage id. -/
def stageId : String := "LLVM-CFG-UNIT-PRODUCTION"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-CFG-UNIT-PRODUCTION"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION"

/-- Live file basename. -/
def liveRel : String := "LlvmCfgUnitProduction.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgUnitProductionRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmCfgUnitProductionFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLlvmCfgUnitProductionFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmCfgUnitProductionResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmCfgUnitProductionProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmCfgUnitProductionParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmCfgUnitProductionSkipFuel : Nat := 8192

/-- Kept commands: five imports, namespace, four string literal defs, and end.
    List and Bool bodies are skip-folded. From LlvmCfgUnitProduction.lean.
    Set to the accepted length the green run prints. -/
def liveLlvmCfgUnitProductionKeptCmds : Nat := 11

/-- theorem keyword count. LlvmCfgUnitProduction.lean has no theorem. -/
def liveLlvmCfgUnitProductionTheoremCount : Nat := 0

/-- example keyword count. LlvmCfgUnitProduction.lean has no example. -/
def liveLlvmCfgUnitProductionExampleCount : Nat := 0

/-- set_option keyword count. LlvmCfgUnitProduction.lean has no set_option. -/
def liveLlvmCfgUnitProductionSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmCfgFixture`. -/
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
def cmdAddsLlvmCfgUnitProduction (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmCfgUnitProduction (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgUnitProductionParseFuel body
        && termNoAppN liveLlvmCfgUnitProductionParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgUnitProductionParseFuel body
        && termNoAppN liveLlvmCfgUnitProductionParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmCfgUnitProduction (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmCfgUnitProduction : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmCfgUnitProduction liveLlvmCfgUnitProductionParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmCfgUnitProductionSkipFuel rest
      if cmdBodyKnownLlvmCfgUnitProduction kn c then
        parseCmdsLlvmCfgUnitProduction n rest2
          (kn ++ cmdAddsLlvmCfgUnitProduction c) (acc ++ [c])
      else
        parseCmdsLlvmCfgUnitProduction n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmCfgUnitProductionSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmCfgUnitProduction n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live LlvmCfgUnitProduction.lean text.
    Greppable: parseLiveLlvmCfgUnitProductionSource,
    PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION. -/
def parseLiveLlvmCfgUnitProductionSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmCfgUnitProduction liveLlvmCfgUnitProductionParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmCfgUnitProduction"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmCfgUnitProduction parse. Not a fixture.
    Not a constant true. Calls HostKernel.kernelCheck.
    Greppable: kernelCheckLiveLlvmCfgUnitProductionSource,
    PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION. -/
def kernelCheckLiveLlvmCfgUnitProductionSource (src : String) : Bool :=
  match parseLiveLlvmCfgUnitProductionSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmCfgUnitProductionParsed? : Option Module :=
  match parseLiveLlvmCfgUnitProductionSource liveLlvmCfgUnitProductionSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Five imports, namespace, four string defs, and end. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | some m => m.commands.length == liveLlvmCfgUnitProductionKeptCmds
  | none => false

/-- Literal def the kernel must keep: justRecipeLinearCfgProductionDeepen.
    The other three one-line string recipes are the same shape. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "justRecipeLinearCfgProductionDeepen"
      && has "justRecipeTypesCfgProductionDeepen"
      && has "justRecipeProgramCfgProductionDeepen"
      && has "justRecipeGraphCfgProductionDeepen"

/-- Wrap module lastSeg is LlvmCfgUnitProduction (no module line in the live file). -/
def liveParseHasLlvmCfgUnitProductionModule : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmCfgUnitProduction"
      && lastSeg m.name.raw == "LlvmCfgUnitProduction"

/-- Live parse has namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureNs : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureEnd : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse imports SystemsLean.LlvmCfgMultProduction. -/
def liveParseHasMultProductionImport : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmCfgMultProduction"
      | _ => false

/-- Live parse imports SystemsLean.LlvmLinearSsa. -/
def liveParseHasLinearSsaImport : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmLinearSsa"
      | _ => false

/-- Live parse imports SystemsLean.LlvmTypesSsa. -/
def liveParseHasTypesSsaImport : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmTypesSsa"
      | _ => false

/-- Live parse imports SystemsLean.LlvmProgramSsa. -/
def liveParseHasProgramSsaImport : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmProgramSsa"
      | _ => false

/-- Live parse imports SystemsLean.LlvmGraphSsa. -/
def liveParseHasGraphSsaImport : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmGraphSsa"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgUnitProductionSource)
    let fuel := liveLlvmCfgUnitProductionSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmCfgUnitProductionTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmCfgUnitProductionExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmCfgUnitProductionSetOptionCount

/-- Skip-head still sees the unit CFG defs, even when a body was not kept. -/
def liveParseHasCoreDefs : Bool :=
  match liveLlvmCfgUnitProductionParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgUnitProductionSource)
    let fuel := liveLlvmCfgUnitProductionSkipFuel
    toksHaveDefNamed fuel toks "linearSsaCfgBlocks"
      && toksHaveDefNamed fuel toks "typesSsaCfgBlocks"
      && toksHaveDefNamed fuel toks "programSsaCfgBlocks"
      && toksHaveDefNamed fuel toks "graphSsaCfgBlocks"
      && toksHaveDefNamed fuel toks "multiUnitCfgProductionDeepenGraph"

/-- Import needle. Trailing newline. -/
def needleImportMultProduction : String := "import SystemsLean.LlvmCfgMultProduction\n"

/-- Linear SSA import needle. Trailing newline. -/
def needleImportLinearSsa : String := "import SystemsLean.LlvmLinearSsa\n"

/-- Types SSA import needle. Trailing newline. -/
def needleImportTypesSsa : String := "import SystemsLean.LlvmTypesSsa\n"

/-- Program SSA import needle. Trailing newline. -/
def needleImportProgramSsa : String := "import SystemsLean.LlvmProgramSsa\n"

/-- Graph SSA import needle. Trailing newline. -/
def needleImportGraphSsa : String := "import SystemsLean.LlvmGraphSsa\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmCfgFixture\n"

/-- linearSsaCfgBlocks def needle with a trailing newline. -/
def needleLinearSsaCfgBlocks : String := "def linearSsaCfgBlocks : List String :=\n"

/-- justRecipeLinearCfgProductionDeepen def needle with a trailing newline. -/
def needleJustRecipeLinear : String :=
  "def justRecipeLinearCfgProductionDeepen : String := \"linear-cfg-production-deepen\"\n"

/-- multiUnitCfgProductionDeepenGraph def needle with a trailing newline. -/
def needleMultiUnitGraph : String := "def multiUnitCfgProductionDeepenGraph : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmCfgFixture\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmCfgUnitProductionSource
  (src.splitOn needleImportMultProduction).length > 1
    && (src.splitOn needleImportLinearSsa).length > 1
    && (src.splitOn needleImportTypesSsa).length > 1
    && (src.splitOn needleImportProgramSsa).length > 1
    && (src.splitOn needleImportGraphSsa).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleLinearSsaCfgBlocks).length > 1
    && (src.splitOn needleJustRecipeLinear).length > 1
    && (src.splitOn needleMultiUnitGraph).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmCfgUnitProductionReady,
    PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION,
    HOST-FRONT-LIVE-LLVM-CFG-UNIT-PRODUCTION,
    LLVM-CFG-UNIT-PRODUCTION.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmCfgUnitProductionReady : Bool :=
  (stageId == "LLVM-CFG-UNIT-PRODUCTION")
    && (hostId == "HOST-FRONT-LIVE-LLVM-CFG-UNIT-PRODUCTION")
    && (parseId == "PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION")
    && (liveRel == "LlvmCfgUnitProduction.lean")
    && (liveLlvmCfgUnitProductionRel
      == "src/systems/SystemsLean/LlvmCfgUnitProduction.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmCfgUnitProductionFullHost
    && !hostFrontLiveLlvmCfgUnitProductionFullBackend
    && !hostFrontLiveLlvmCfgUnitProductionResidualFreeClaimed
    && !hostFrontLiveLlvmCfgUnitProductionProvablyUnlocked
    && kernelCheckLiveLlvmCfgUnitProductionSource liveLlvmCfgUnitProductionSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmCfgUnitProductionModule
    && liveParseHasLlvmCfgFixtureNs
    && liveParseHasLlvmCfgFixtureEnd
    && liveParseHasMultProductionImport
    && liveParseHasLinearSsaImport
    && liveParseHasTypesSsaImport
    && liveParseHasProgramSsaImport
    && liveParseHasGraphSsaImport
    && liveParseKwCountsOk
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmCfgUnitProductionSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmCfgUnitProduction (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION =="
  IO.println s!"  host={hostId} file={liveLlvmCfgUnitProductionRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmCfgUnitProductionRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmCfgUnitProductionRel}"
    throw (IO.userError s!"missing {liveLlvmCfgUnitProductionRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmCfgUnitProductionSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmCfgUnitProduction.lean != liveLlvmCfgUnitProductionSource"
    throw (IO.userError "dual-pin mismatch live LlvmCfgUnitProduction.lean")
  let r := parseLiveLlvmCfgUnitProductionSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-CFG-UNIT-PRODUCTION ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmCfgUnitProduction parse false"
      throw (IO.userError "kernelCheck live LlvmCfgUnitProduction parse false")
    unless hostFrontLiveLlvmCfgUnitProductionReady do
      IO.eprintln "error: hostFrontLiveLlvmCfgUnitProductionReady false"
      throw (IO.userError "hostFrontLiveLlvmCfgUnitProductionReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmCfgUnitProduction source was accepted"
      throw (IO.userError "empty LlvmCfgUnitProduction source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmCfgUnitProduction root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmCfgUnitProduction
