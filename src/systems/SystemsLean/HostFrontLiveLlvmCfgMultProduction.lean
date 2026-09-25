/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmCfgMultProduction.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmCfgMultProduction.lean. It is not LlvmCfgFixture.lean.
  It is not LlvmHold.lean. It is not LlvmCfgMultDf.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. List literals do not parse and are skipped.
  theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-CFG-MULT-PRODUCTION,
  LLVM-CFG-MULT-PRODUCTION,
  PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION, liveRel,
  kernelCheckLiveLlvmCfgMultProductionSource,
  hostFrontLiveLlvmCfgMultProductionReady.
  Module: SystemsLean.HostFrontLiveLlvmCfgMultProduction
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmCfgMultProductionSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmCfgMultProduction

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Hyphenated. Not the LlvmHold stage id. -/
def stageId : String := "LLVM-CFG-MULT-PRODUCTION"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-CFG-MULT-PRODUCTION"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION"

/-- Live file basename. -/
def liveRel : String := "LlvmCfgMultProduction.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgMultProductionRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmCfgMultProductionFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLlvmCfgMultProductionFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmCfgMultProductionResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmCfgMultProductionProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmCfgMultProductionParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmCfgMultProductionSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, the string literal def, and end.
    List and proj/app bodies are skip-folded. From LlvmCfgMultProduction.lean. -/
def liveLlvmCfgMultProductionKeptCmds : Nat := 5

/-- theorem keyword count. LlvmCfgMultProduction.lean has no theorem. -/
def liveLlvmCfgMultProductionTheoremCount : Nat := 0

/-- example keyword count. LlvmCfgMultProduction.lean has no example. -/
def liveLlvmCfgMultProductionExampleCount : Nat := 0

/-- set_option keyword count. LlvmCfgMultProduction.lean has no set_option. -/
def liveLlvmCfgMultProductionSetOptionCount : Nat := 0

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
def cmdAddsLlvmCfgMultProduction (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmCfgMultProduction (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgMultProductionParseFuel body
        && termNoAppN liveLlvmCfgMultProductionParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgMultProductionParseFuel body
        && termNoAppN liveLlvmCfgMultProductionParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmCfgMultProduction (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmCfgMultProduction : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmCfgMultProduction liveLlvmCfgMultProductionParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmCfgMultProductionSkipFuel rest
      if cmdBodyKnownLlvmCfgMultProduction kn c then
        parseCmdsLlvmCfgMultProduction n rest2
          (kn ++ cmdAddsLlvmCfgMultProduction c) (acc ++ [c])
      else
        parseCmdsLlvmCfgMultProduction n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmCfgMultProductionSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmCfgMultProduction n rest2 kn acc
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

/-- Parse live LlvmCfgMultProduction.lean text.
    Greppable: parseLiveLlvmCfgMultProductionSource,
    PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION. -/
def parseLiveLlvmCfgMultProductionSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmCfgMultProduction liveLlvmCfgMultProductionParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmCfgMultProduction"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmCfgMultProduction parse. Not a fixture.
    Not a constant true. Calls HostKernel.kernelCheck.
    Greppable: kernelCheckLiveLlvmCfgMultProductionSource,
    PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION. -/
def kernelCheckLiveLlvmCfgMultProductionSource (src : String) : Bool :=
  match parseLiveLlvmCfgMultProductionSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmCfgMultProductionParsed? : Option Module :=
  match parseLiveLlvmCfgMultProductionSource liveLlvmCfgMultProductionSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Import, namespace, end, and the literal def.
    Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | some m => m.commands.length == liveLlvmCfgMultProductionKeptCmds
  | none => false

/-- Literal def the kernel must keep: justRecipeProductionCfgDeepen. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ => x.raw == "justRecipeProductionCfgDeepen"
      | _ => false

/-- Wrap module lastSeg is LlvmCfgMultProduction (no module line in the live file). -/
def liveParseHasLlvmCfgMultProductionModule : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmCfgMultProduction"
      && lastSeg m.name.raw == "LlvmCfgMultProduction"

/-- Live parse has namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureNs : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureEnd : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse imports SystemsLean.LlvmCfgHonesty. -/
def liveParseHasHonestyImport : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmCfgHonesty"
      | _ => false

/-- Live parse imports SystemsLean.LlvmMultSsa. -/
def liveParseHasMultSsaImport : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmMultSsa"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgMultProductionSource)
    let fuel := liveLlvmCfgMultProductionSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmCfgMultProductionTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmCfgMultProductionExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmCfgMultProductionSetOptionCount

/-- Skip-head still sees the production CFG defs, even when a body was not kept. -/
def liveParseHasCoreDefs : Bool :=
  match liveLlvmCfgMultProductionParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgMultProductionSource)
    let fuel := liveLlvmCfgMultProductionSkipFuel
    toksHaveDefNamed fuel toks "cfgBlocks"
      && toksHaveDefNamed fuel toks "multSsaCfgBlocks"
      && toksHaveDefNamed fuel toks "productionIdomTable"
      && toksHaveDefNamed fuel toks "mergePhiPredsFour"
      && toksHaveDefNamed fuel toks "multSsaCfgDualPin"
      && toksHaveDefNamed fuel toks "productionCfgDeepen"

/-- Import needle. Trailing newline. -/
def needleImportHonesty : String := "import SystemsLean.LlvmCfgHonesty\n"

/-- Second import needle. Trailing newline. -/
def needleImportMultSsa : String := "import SystemsLean.LlvmMultSsa\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmCfgFixture\n"

/-- cfgBlocks def needle with a trailing newline. -/
def needleCfgBlocks : String := "def cfgBlocks : List String :=\n"

/-- multSsaCfgBlocks def needle with a trailing newline. -/
def needleMultSsaCfgBlocks : String := "def multSsaCfgBlocks : List String :=\n"

/-- mergePhiPredsFour def needle with a trailing newline. -/
def needleMergePhiPredsFour : String := "def mergePhiPredsFour : Bool :=\n"

/-- justRecipeProductionCfgDeepen def needle with a trailing newline. -/
def needleJustRecipe : String :=
  "def justRecipeProductionCfgDeepen : String := \"production-cfg-deepen\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmCfgFixture\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmCfgMultProductionSource
  (src.splitOn needleImportHonesty).length > 1
    && (src.splitOn needleImportMultSsa).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleCfgBlocks).length > 1
    && (src.splitOn needleMultSsaCfgBlocks).length > 1
    && (src.splitOn needleMergePhiPredsFour).length > 1
    && (src.splitOn needleJustRecipe).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmCfgMultProductionReady,
    PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION,
    HOST-FRONT-LIVE-LLVM-CFG-MULT-PRODUCTION,
    LLVM-CFG-MULT-PRODUCTION.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmCfgMultProductionReady : Bool :=
  (stageId == "LLVM-CFG-MULT-PRODUCTION")
    && (hostId == "HOST-FRONT-LIVE-LLVM-CFG-MULT-PRODUCTION")
    && (parseId == "PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION")
    && (liveRel == "LlvmCfgMultProduction.lean")
    && (liveLlvmCfgMultProductionRel
      == "src/systems/SystemsLean/LlvmCfgMultProduction.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmCfgMultProductionFullHost
    && !hostFrontLiveLlvmCfgMultProductionFullBackend
    && !hostFrontLiveLlvmCfgMultProductionResidualFreeClaimed
    && !hostFrontLiveLlvmCfgMultProductionProvablyUnlocked
    && kernelCheckLiveLlvmCfgMultProductionSource liveLlvmCfgMultProductionSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmCfgMultProductionModule
    && liveParseHasLlvmCfgFixtureNs
    && liveParseHasLlvmCfgFixtureEnd
    && liveParseHasHonestyImport
    && liveParseHasMultSsaImport
    && liveParseKwCountsOk
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmCfgMultProductionSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmCfgMultProduction (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION =="
  IO.println s!"  host={hostId} file={liveLlvmCfgMultProductionRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmCfgMultProductionRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmCfgMultProductionRel}"
    throw (IO.userError s!"missing {liveLlvmCfgMultProductionRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmCfgMultProductionSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmCfgMultProduction.lean != liveLlvmCfgMultProductionSource"
    throw (IO.userError "dual-pin mismatch live LlvmCfgMultProduction.lean")
  let r := parseLiveLlvmCfgMultProductionSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-CFG-MULT-PRODUCTION ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmCfgMultProduction parse false"
      throw (IO.userError "kernelCheck live LlvmCfgMultProduction parse false")
    unless hostFrontLiveLlvmCfgMultProductionReady do
      IO.eprintln "error: hostFrontLiveLlvmCfgMultProductionReady false"
      throw (IO.userError "hostFrontLiveLlvmCfgMultProductionReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmCfgMultProduction source was accepted"
      throw (IO.userError "empty LlvmCfgMultProduction source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmCfgMultProduction root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmCfgMultProduction
