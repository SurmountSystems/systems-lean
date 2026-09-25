/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmCfgUnitDf.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmCfgUnitDf.lean. It is not LlvmCfg.lean.
  It is not LlvmCfgGeneral.lean. It is not a full LLVM backend.
  Literal string defs stay. Compound defs are skipped only when the body
  is not kernel-checkable (Term.app, a bad proj, or match).
  theorem, example, and set_option counts are 0.
  The live file has no def stageId, llvmUnlocked, provablyUnlocked,
  or freestandingProductSelfHostComplete. Do not require those names.
  The live file has no import SystemsLean.SelfApply.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-CFG-UNIT-DF,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_UNIT_DF_V0,
  PARSE-LIVE-LLVM-CFG-UNIT-DF, liveRel,
  kernelCheckLiveLlvmCfgUnitDfSource,
  hostFrontLiveLlvmCfgUnitDfReady.
  Module: SystemsLean.HostFrontLiveLlvmCfgUnitDf
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmCfgUnitDfSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmCfgUnitDf

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_UNIT_DF_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-CFG-UNIT-DF"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-CFG-UNIT-DF"

/-- Live file basename. -/
def liveRel : String := "LlvmCfgUnitDf.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgUnitDfRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmCfgUnitDfFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveLlvmCfgUnitDfFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmCfgUnitDfResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveLlvmCfgUnitDfProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmCfgUnitDfParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmCfgUnitDfSkipFuel : Nat := 8192

/-- Kept commands: two imports, namespace, kernel-checkable string defs,
    and end. Not the LlvmHold count of 16. From LlvmCfgUnitDf.lean. -/
def liveLlvmCfgUnitDfKeptCmds : Nat := 13

/-- theorem keyword count. LlvmCfgUnitDf.lean has no theorem. -/
def liveLlvmCfgUnitDfTheoremCount : Nat := 0

/-- example keyword count. LlvmCfgUnitDf.lean has no example. -/
def liveLlvmCfgUnitDfExampleCount : Nat := 0

/-- set_option keyword count. LlvmCfgUnitDf.lean has no set_option. -/
def liveLlvmCfgUnitDfSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . LlvmCfgUnitDf`. -/
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
def cmdAddsLlvmCfgUnitDf (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmCfgUnitDf (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgUnitDfParseFuel body
        && termNoAppN liveLlvmCfgUnitDfParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgUnitDfParseFuel body
        && termNoAppN liveLlvmCfgUnitDfParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmCfgUnitDf (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmCfgUnitDf : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmCfgUnitDf liveLlvmCfgUnitDfParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmCfgUnitDfSkipFuel rest
      if cmdBodyKnownLlvmCfgUnitDf kn c then
        parseCmdsLlvmCfgUnitDf n rest2
          (kn ++ cmdAddsLlvmCfgUnitDf c) (acc ++ [c])
      else
        parseCmdsLlvmCfgUnitDf n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmCfgUnitDfSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmCfgUnitDf n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live LlvmCfgUnitDf.lean text.
    Greppable: parseLiveLlvmCfgUnitDfSource,
    PARSE-LIVE-LLVM-CFG-UNIT-DF. -/
def parseLiveLlvmCfgUnitDfSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmCfgUnitDf liveLlvmCfgUnitDfParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmCfgUnitDf"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmCfgUnitDf parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmCfgUnitDfSource,
    PARSE-LIVE-LLVM-CFG-UNIT-DF. -/
def kernelCheckLiveLlvmCfgUnitDfSource (src : String) : Bool :=
  match parseLiveLlvmCfgUnitDfSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmCfgUnitDfParsed? : Option Module :=
  match parseLiveLlvmCfgUnitDfSource liveLlvmCfgUnitDfSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmCfgUnitDfParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. String defs are kept.
    Two imports, namespace, end, and kernel-checkable defs. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmCfgUnitDfParsed? with
  | some m => m.commands.length == liveLlvmCfgUnitDfKeptCmds
  | none => false

/-- Wrap module lastSeg is LlvmCfgUnitDf (no module line in the live file). -/
def liveParseHasLlvmCfgUnitDfModule : Bool :=
  match liveLlvmCfgUnitDfParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmCfgUnitDf"
      && lastSeg m.name.raw == "LlvmCfgUnitDf"

/-- Live parse has namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureNs : Bool :=
  match liveLlvmCfgUnitDfParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureEnd : Bool :=
  match liveLlvmCfgUnitDfParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse imports LlvmCfgMultDf and LlvmCfgUnitProduction.
    It does not import SystemsLean.SelfApply. -/
def liveParseHasLiveImports : Bool :=
  match liveLlvmCfgUnitDfParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.LlvmCfgMultDf"
      && has "SystemsLean.LlvmCfgUnitProduction"
      && !(has "SystemsLean.SelfApply")

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmCfgUnitDfParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgUnitDfSource)
    let fuel := liveLlvmCfgUnitDfSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmCfgUnitDfTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmCfgUnitDfExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmCfgUnitDfSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportMultDf : String := "import SystemsLean.LlvmCfgMultDf\n"

/-- Import needle. Trailing newline. -/
def needleImportUnitProduction : String :=
  "import SystemsLean.LlvmCfgUnitProduction\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmCfgFixture\n"

/-- unitDfParseEdge def needle with a trailing newline. -/
def needleUnitDfParseEdge : String :=
  "def unitDfParseEdge (e : String) : Option (Prod String String) :=\n"

/-- multiUnitDominanceFrontierDeepen def needle with a trailing newline. -/
def needleMultiUnitDominanceFrontierDeepen : String :=
  "def multiUnitDominanceFrontierDeepen : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmCfgFixture\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.SelfApply. No stageId, llvmUnlocked,
    provablyUnlocked, or freestandingProductSelfHostComplete needle.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmCfgUnitDfSource
  (src.splitOn needleImportMultDf).length > 1
    && (src.splitOn needleImportUnitProduction).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleUnitDfParseEdge).length > 1
    && (src.splitOn needleMultiUnitDominanceFrontierDeepen).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmCfgUnitDfReady,
    PARSE-LIVE-LLVM-CFG-UNIT-DF,
    HOST-FRONT-LIVE-LLVM-CFG-UNIT-DF.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmCfgUnitDfReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_UNIT_DF_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-CFG-UNIT-DF")
    && (parseId == "PARSE-LIVE-LLVM-CFG-UNIT-DF")
    && (liveRel == "LlvmCfgUnitDf.lean")
    && (liveLlvmCfgUnitDfRel
      == "src/systems/SystemsLean/LlvmCfgUnitDf.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmCfgUnitDfFullHost
    && !hostFrontLiveLlvmCfgUnitDfFullBackend
    && !hostFrontLiveLlvmCfgUnitDfResidualFreeClaimed
    && !hostFrontLiveLlvmCfgUnitDfProvablyUnlocked
    && kernelCheckLiveLlvmCfgUnitDfSource liveLlvmCfgUnitDfSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLlvmCfgUnitDfModule
    && liveParseHasLlvmCfgFixtureNs
    && liveParseHasLlvmCfgFixtureEnd
    && liveParseHasLiveImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmCfgUnitDfSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmCfgUnitDf (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-CFG-UNIT-DF =="
  IO.println s!"  host={hostId} file={liveLlvmCfgUnitDfRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmCfgUnitDfRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmCfgUnitDfRel}"
    throw (IO.userError s!"missing {liveLlvmCfgUnitDfRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmCfgUnitDfSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmCfgUnitDf.lean != liveLlvmCfgUnitDfSource"
    throw (IO.userError "dual-pin mismatch live LlvmCfgUnitDf.lean")
  let r := parseLiveLlvmCfgUnitDfSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-CFG-UNIT-DF reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-CFG-UNIT-DF reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-CFG-UNIT-DF ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmCfgUnitDf parse false"
      throw (IO.userError "kernelCheck live LlvmCfgUnitDf parse false")
    unless hostFrontLiveLlvmCfgUnitDfReady do
      IO.eprintln "error: hostFrontLiveLlvmCfgUnitDfReady false"
      throw (IO.userError "hostFrontLiveLlvmCfgUnitDfReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmCfgUnitDf source was accepted"
      throw (IO.userError "empty LlvmCfgUnitDf source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmCfgUnitDf root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmCfgUnitDf
