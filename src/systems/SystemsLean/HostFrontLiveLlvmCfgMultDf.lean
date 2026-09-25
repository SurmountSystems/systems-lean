/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmCfgMultDf.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmCfgMultDf.lean. It is not LlvmCfgMultProduction.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend. Dominance frontier partial is not a full backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-CFG-MULT-DF,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_MULT_DF_V0,
  PARSE-LIVE-LLVM-CFG-MULT-DF, LLVM-CFG-MULT-DF, liveRel,
  kernelCheckLiveLlvmCfgMultDfSource,
  hostFrontLiveLlvmCfgMultDfReady.
  Module: SystemsLean.HostFrontLiveLlvmCfgMultDf
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmCfgMultDfSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmCfgMultDf

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_MULT_DF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-CFG-MULT-DF"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-CFG-MULT-DF"

/-- Hyphenated stage tag. Not a full LLVM backend. -/
def stageTag : String := "LLVM-CFG-MULT-DF"

/-- Live file basename. -/
def liveRel : String := "LlvmCfgMultDf.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgMultDfRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmCfgMultDfFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLlvmCfgMultDfFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmCfgMultDfResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveLlvmCfgMultDfProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmCfgMultDfParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmCfgMultDfSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, two string recipe defs, and end.
    Compound DF defs are skip-folded. From LlvmCfgMultDf.lean. -/
def liveLlvmCfgMultDfKeptCmds : Nat := 5

/-- theorem keyword count. LlvmCfgMultDf.lean has no theorem. -/
def liveLlvmCfgMultDfTheoremCount : Nat := 0

/-- example keyword count. LlvmCfgMultDf.lean has no example. -/
def liveLlvmCfgMultDfExampleCount : Nat := 0

/-- set_option keyword count. LlvmCfgMultDf.lean has no set_option. -/
def liveLlvmCfgMultDfSetOptionCount : Nat := 0

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
def cmdAddsLlvmCfgMultDf (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmCfgMultDf (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgMultDfParseFuel body
        && termNoAppN liveLlvmCfgMultDfParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgMultDfParseFuel body
        && termNoAppN liveLlvmCfgMultDfParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmCfgMultDf (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmCfgMultDf : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmCfgMultDf liveLlvmCfgMultDfParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmCfgMultDfSkipFuel rest
      if cmdBodyKnownLlvmCfgMultDf kn c then
        parseCmdsLlvmCfgMultDf n rest2
          (kn ++ cmdAddsLlvmCfgMultDf c) (acc ++ [c])
      else
        parseCmdsLlvmCfgMultDf n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmCfgMultDfSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmCfgMultDf n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmCfgMultDf.lean text.
    Greppable: parseLiveLlvmCfgMultDfSource,
    PARSE-LIVE-LLVM-CFG-MULT-DF. -/
def parseLiveLlvmCfgMultDfSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmCfgMultDf liveLlvmCfgMultDfParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmCfgFixture"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmCfgMultDf parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmCfgMultDfSource,
    PARSE-LIVE-LLVM-CFG-MULT-DF. -/
def kernelCheckLiveLlvmCfgMultDfSource (src : String) : Bool :=
  match parseLiveLlvmCfgMultDfSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmCfgMultDfParsed? : Option Module :=
  match parseLiveLlvmCfgMultDfSource liveLlvmCfgMultDfSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Import, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | some m => m.commands.length == liveLlvmCfgMultDfKeptCmds
  | none => false

/-- Literal defs the kernel must keep: the two just-recipe strings. -/
def liveParseHasLiteralDefs : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "justRecipeMultDominanceFrontierPartial"
      && has "justRecipeMultDominanceFrontierDeepen"

/-- Wrap module lastSeg is LlvmCfgFixture (no module line in the live file). -/
def liveParseHasLlvmCfgFixtureModule : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmCfgFixture"
      && lastSeg m.name.raw == "LlvmCfgFixture"

/-- Live parse has namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureNs : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureEnd : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse imports SystemsLean.LlvmCfgMultProduction. -/
def liveParseHasProductionImport : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmCfgMultProduction"
      | _ => false

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmCfgMultDfParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgMultDfSource)
    let fuel := liveLlvmCfgMultDfSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmCfgMultDfTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmCfgMultDfExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmCfgMultDfSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportProduction : String :=
  "import SystemsLean.LlvmCfgMultProduction\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmCfgFixture\n"

/-- multDfTable def needle with a trailing newline. -/
def needleMultDfTable : String := "def multDfTable : List String :=\n"

/-- Partial recipe def needle with a trailing newline. -/
def needleJustPartial : String :=
  "def justRecipeMultDominanceFrontierPartial : String :=\n"

/-- Edge parser def needle with a trailing newline. -/
def needleParseEdge : String :=
  "def multDfParseEdge (e : String) : Option (Prod String String) :=\n"

/-- Cytron join def needle with a trailing newline. -/
def needleCytron : String :=
  "def multDfCytronFromJoin (join : String) : List String :=\n"

/-- Deepen recipe def needle with a trailing newline. -/
def needleJustDeepen : String :=
  "def justRecipeMultDominanceFrontierDeepen : String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmCfgFixture\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.LlvmCfgMultDf. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmCfgMultDfSource
  (src.splitOn needleImportProduction).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleMultDfTable).length > 1
    && (src.splitOn needleJustPartial).length > 1
    && (src.splitOn needleParseEdge).length > 1
    && (src.splitOn needleCytron).length > 1
    && (src.splitOn needleJustDeepen).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmCfgMultDfReady,
    PARSE-LIVE-LLVM-CFG-MULT-DF,
    HOST-FRONT-LIVE-LLVM-CFG-MULT-DF.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmCfgMultDfReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_MULT_DF_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-CFG-MULT-DF")
    && (parseId == "PARSE-LIVE-LLVM-CFG-MULT-DF")
    && (stageTag == "LLVM-CFG-MULT-DF")
    && (liveRel == "LlvmCfgMultDf.lean")
    && (liveLlvmCfgMultDfRel
      == "src/systems/SystemsLean/LlvmCfgMultDf.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmCfgMultDfFullHost
    && !hostFrontLiveLlvmCfgMultDfFullBackend
    && !hostFrontLiveLlvmCfgMultDfResidualFreeClaimed
    && !hostFrontLiveLlvmCfgMultDfProvablyUnlocked
    && kernelCheckLiveLlvmCfgMultDfSource liveLlvmCfgMultDfSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasLlvmCfgFixtureModule
    && liveParseHasLlvmCfgFixtureNs
    && liveParseHasLlvmCfgFixtureEnd
    && liveParseHasProductionImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmCfgMultDfSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmCfgMultDf (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-CFG-MULT-DF =="
  IO.println s!"  host={hostId} file={liveLlvmCfgMultDfRel}"
  IO.println s!"liveRel={liveRel}"
  IO.println s!"stageTag={stageTag}"
  let path := root / liveLlvmCfgMultDfRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmCfgMultDfRel}"
    throw (IO.userError s!"missing {liveLlvmCfgMultDfRel}")
  let disk <- IO.FS.readFile path
  let nBytes := disk.toUTF8.size
  IO.println s!"path={path}"
  IO.println s!"bytes={nBytes}"
  if disk != liveLlvmCfgMultDfSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmCfgMultDf.lean != liveLlvmCfgMultDfSource"
    throw (IO.userError "dual-pin mismatch live LlvmCfgMultDf.lean")
  let r := parseLiveLlvmCfgMultDfSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-CFG-MULT-DF reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-CFG-MULT-DF reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-CFG-MULT-DF ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmCfgMultDf parse false"
      throw (IO.userError "kernelCheck live LlvmCfgMultDf parse false")
    unless hostFrontLiveLlvmCfgMultDfReady do
      IO.eprintln "error: hostFrontLiveLlvmCfgMultDfReady false"
      throw (IO.userError "hostFrontLiveLlvmCfgMultDfReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmCfgMultDf source was accepted"
      throw (IO.userError "empty LlvmCfgMultDf source was accepted")
    IO.println s!"FullHost={hostFrontLiveLlvmCfgMultDfFullHost}"
    IO.println s!"FullBackend={hostFrontLiveLlvmCfgMultDfFullBackend}"
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmCfgMultDf root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmCfgMultDf
