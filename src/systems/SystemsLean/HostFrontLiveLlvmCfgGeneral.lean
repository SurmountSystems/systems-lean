/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmCfgGeneral.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmCfgGeneral.lean. It is not LlvmCfgFixture.lean.
  Literal defs stay. List, match, and app bodies are skipped.
  theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-CFG-GENERAL,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_GENERAL_V0,
  PARSE-LIVE-LLVM-CFG-GENERAL, GENERAL-CFG-CONSTRUCTION-PARTIAL, liveRel,
  kernelCheckLiveLlvmCfgGeneralSource,
  hostFrontLiveLlvmCfgGeneralReady.
  Module: SystemsLean.HostFrontLiveLlvmCfgGeneral
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmCfgGeneralSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmCfgGeneral

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_GENERAL_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-CFG-GENERAL"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-CFG-GENERAL"

/-- Live file basename. -/
def liveRel : String := "LlvmCfgGeneral.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgGeneralRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmCfgGeneralFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLlvmCfgGeneralFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmCfgGeneralResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveLlvmCfgGeneralProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmCfgGeneralParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmCfgGeneralSkipFuel : Nat := 8192

/-- Kept commands: seven imports, namespace, three literal defs, and end.
    List, match, and app bodies are skip-folded. From LlvmCfgGeneral.lean.
    A count of 4 would drop the literal defs. -/
def liveLlvmCfgGeneralKeptCmds : Nat := 12

/-- theorem keyword count. LlvmCfgGeneral.lean has no theorem. -/
def liveLlvmCfgGeneralTheoremCount : Nat := 0

/-- example keyword count. LlvmCfgGeneral.lean has no example. -/
def liveLlvmCfgGeneralExampleCount : Nat := 0

/-- set_option keyword count. LlvmCfgGeneral.lean has no set_option. -/
def liveLlvmCfgGeneralSetOptionCount : Nat := 0

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
def cmdAddsLlvmCfgGeneral (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmCfgGeneral (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgGeneralParseFuel body
        && termNoAppN liveLlvmCfgGeneralParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgGeneralParseFuel body
        && termNoAppN liveLlvmCfgGeneralParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdLlvmCfgGeneral (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip open, list bodies, match, and un-kernelable defs. -/
def parseCmdsLlvmCfgGeneral : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmCfgGeneral liveLlvmCfgGeneralParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmCfgGeneralSkipFuel rest
      if cmdBodyKnownLlvmCfgGeneral kn c then
        parseCmdsLlvmCfgGeneral n rest2
          (kn ++ cmdAddsLlvmCfgGeneral c) (acc ++ [c])
      else
        parseCmdsLlvmCfgGeneral n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmCfgGeneralSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmCfgGeneral n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmCfgGeneral.lean text.
    Greppable: parseLiveLlvmCfgGeneralSource,
    PARSE-LIVE-LLVM-CFG-GENERAL. -/
def parseLiveLlvmCfgGeneralSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmCfgGeneral liveLlvmCfgGeneralParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmCfgGeneral"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmCfgGeneral parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmCfgGeneralSource,
    PARSE-LIVE-LLVM-CFG-GENERAL. -/
def kernelCheckLiveLlvmCfgGeneralSource (src : String) : Bool :=
  match parseLiveLlvmCfgGeneralSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmCfgGeneralParsed? : Option Module :=
  match parseLiveLlvmCfgGeneralSource liveLlvmCfgGeneralSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Imports, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | some m => m.commands.length == liveLlvmCfgGeneralKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "justRecipeGeneralProgramCfgPartial"
      && has "productionCfgUnitDiamondsOnlyClaimed"
      && has "justRecipeIterativeCfgConstructionPartial"

/-- Wrap module lastSeg is LlvmCfgGeneral (no module line in the live file). -/
def liveParseHasLlvmCfgGeneralModule : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmCfgGeneral"
      && lastSeg m.name.raw == "LlvmCfgGeneral"

/-- Live parse has namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureNs : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureEnd : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse imports the seven live modules. -/
def liveParseHasCfgGeneralImports : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.LlvmCfgUnitProduction"
      && has "SystemsLean.LlvmCfgMultDf"
      && has "SystemsLean.LlvmComposeText"
      && has "SystemsLean.Types"
      && has "SystemsLean.IrProgram"
      && has "SystemsLean.IrGraph"
      && has "SystemsLean.KernelProgram"

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmCfgGeneralParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgGeneralSource)
    let fuel := liveLlvmCfgGeneralSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmCfgGeneralTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmCfgGeneralExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmCfgGeneralSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportUnitProduction : String :=
  "import SystemsLean.LlvmCfgUnitProduction\n"

/-- Import needle. Trailing newline. -/
def needleImportKernelProgram : String := "import SystemsLean.KernelProgram\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmCfgFixture\n"

/-- Unit-roots def needle with a trailing newline. -/
def needleUnitRoots : String := "def generalCfgUnitRoots : List String :=\n"

/-- General recipe def needle with a trailing newline. -/
def needleJustGeneral : String :=
  "def justRecipeGeneralProgramCfgPartial : String := \"general-program-cfg-partial\"\n"

/-- Unit-diamonds-only pin needle with a trailing newline. -/
def needleDiamondsOnly : String :=
  "def productionCfgUnitDiamondsOnlyClaimed : Bool := false\n"

/-- Iterative block walk def needle with a trailing newline. -/
def needleBlocksFromProgram : String :=
  "def iterativeCfgBlocksFromProgram (p : Program) : List String :=\n"

/-- Full bar partial def needle with a trailing newline. -/
def needleFullBar : String := "def fullLlvmBarEvidencePartial : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmCfgFixture\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmCfgGeneralSource
  (src.splitOn needleImportUnitProduction).length > 1
    && (src.splitOn needleImportKernelProgram).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleUnitRoots).length > 1
    && (src.splitOn needleJustGeneral).length > 1
    && (src.splitOn needleDiamondsOnly).length > 1
    && (src.splitOn needleBlocksFromProgram).length > 1
    && (src.splitOn needleFullBar).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmCfgGeneralReady,
    PARSE-LIVE-LLVM-CFG-GENERAL,
    HOST-FRONT-LIVE-LLVM-CFG-GENERAL.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmCfgGeneralReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_GENERAL_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-CFG-GENERAL")
    && (parseId == "PARSE-LIVE-LLVM-CFG-GENERAL")
    && (liveRel == "LlvmCfgGeneral.lean")
    && (liveLlvmCfgGeneralRel
      == "src/systems/SystemsLean/LlvmCfgGeneral.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmCfgGeneralFullHost
    && !hostFrontLiveLlvmCfgGeneralFullBackend
    && !hostFrontLiveLlvmCfgGeneralResidualFreeClaimed
    && !hostFrontLiveLlvmCfgGeneralProvablyUnlocked
    && kernelCheckLiveLlvmCfgGeneralSource liveLlvmCfgGeneralSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmCfgGeneralModule
    && liveParseHasLlvmCfgFixtureNs
    && liveParseHasLlvmCfgFixtureEnd
    && liveParseHasCfgGeneralImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmCfgGeneralSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmCfgGeneral (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-CFG-GENERAL =="
  IO.println s!"  host={hostId} file={liveLlvmCfgGeneralRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmCfgGeneralRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmCfgGeneralRel}"
    throw (IO.userError s!"missing {liveLlvmCfgGeneralRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmCfgGeneralSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmCfgGeneral.lean != liveLlvmCfgGeneralSource"
    throw (IO.userError "dual-pin mismatch live LlvmCfgGeneral.lean")
  let r := parseLiveLlvmCfgGeneralSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-CFG-GENERAL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-CFG-GENERAL reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-CFG-GENERAL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmCfgGeneral parse false"
      throw (IO.userError "kernelCheck live LlvmCfgGeneral parse false")
    unless hostFrontLiveLlvmCfgGeneralReady do
      IO.eprintln "error: hostFrontLiveLlvmCfgGeneralReady false"
      throw (IO.userError "hostFrontLiveLlvmCfgGeneralReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmCfgGeneral source was accepted"
      throw (IO.userError "empty LlvmCfgGeneral source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmCfgGeneral root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmCfgGeneral
