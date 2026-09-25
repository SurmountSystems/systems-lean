/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmCfgFixture.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is LlvmCfgFixture.lean. It is not LlvmCfgHonesty.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem count is 72. example count is 67.
  set_option count is 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The fixture tip fullBackend claim lives on LlvmCfgHonesty, not here.
  That claim is not this wrap's backend flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-CFG-FIXTURE,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_FIXTURE_V0,
  PARSE-LIVE-LLVM-CFG-FIXTURE, LLVM-CFG-FIXTURE, liveRel,
  kernelCheckLiveLlvmCfgFixtureSource,
  hostFrontLiveLlvmCfgFixtureReady.
  Module: SystemsLean.HostFrontLiveLlvmCfgFixture
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmCfgFixtureSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmCfgFixture

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. Hyphenated short banner id. -/
def stageId : String := "LLVM-CFG-FIXTURE"

/-- Greppable long stage token. -/
def stageToken : String := "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_FIXTURE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-CFG-FIXTURE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-CFG-FIXTURE"

/-- Live file basename. -/
def liveRel : String := "LlvmCfgFixture.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgFixtureRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmCfgFixtureFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The fixture tip llvmCfgFixtureFullBackendClaimed is not this flag. -/
def hostFrontLiveLlvmCfgFixtureFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmCfgFixtureResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveLlvmCfgFixtureProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). 13 imports, namespace, open, 8 defs,
    72 theorems, 67 examples, and end are 163 command starts. -/
def liveLlvmCfgFixtureParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveLlvmCfgFixtureSkipFuel : Nat := 16384

/-- Kept commands: 13 imports, namespace, and end.
    Open is skipped. Eight compound defs are skip-folded.
    Theorems and examples are skipped. -/
def liveLlvmCfgFixtureKeptCmds : Nat := 15

/-- theorem keyword count. LlvmCfgFixture.lean has 72 theorems. -/
def liveLlvmCfgFixtureTheoremCount : Nat := 72

/-- example keyword count. LlvmCfgFixture.lean has 67 examples. -/
def liveLlvmCfgFixtureExampleCount : Nat := 67

/-- set_option keyword count. LlvmCfgFixture.lean has no set_option. -/
def liveLlvmCfgFixtureSetOptionCount : Nat := 0

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

/-- Reject field proj the kernel cannot type (keep isEmpty / isSome / length).
    LlvmMultSsa.* and lowerMultKernel.isSome are skipped with the def. -/
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
def cmdAddsLlvmCfgFixture (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. `.isSome` is an app the skip-fold drops. -/
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
def cmdBodyKnownLlvmCfgFixture (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgFixtureParseFuel body
        && termNoAppN liveLlvmCfgFixtureParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgFixtureParseFuel body
        && termNoAppN liveLlvmCfgFixtureParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, open, and set_option are not parsed here. -/
def parseOneCmdLlvmCfgFixture (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, open, set_option,
    and un-kernelable defs. -/
def parseCmdsLlvmCfgFixture : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmCfgFixture liveLlvmCfgFixtureParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmCfgFixtureSkipFuel rest
      if cmdBodyKnownLlvmCfgFixture kn c then
        parseCmdsLlvmCfgFixture n rest2
          (kn ++ cmdAddsLlvmCfgFixture c) (acc ++ [c])
      else
        parseCmdsLlvmCfgFixture n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmCfgFixtureSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmCfgFixture n rest2 kn acc
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

/-- Parse live LlvmCfgFixture.lean text.
    Greppable: parseLiveLlvmCfgFixtureSource,
    PARSE-LIVE-LLVM-CFG-FIXTURE. -/
def parseLiveLlvmCfgFixtureSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmCfgFixture liveLlvmCfgFixtureParseFuel
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

/-- Kernel-check live LlvmCfgFixture parse. Not a constant true.
    Greppable: kernelCheckLiveLlvmCfgFixtureSource,
    PARSE-LIVE-LLVM-CFG-FIXTURE. -/
def kernelCheckLiveLlvmCfgFixtureSource (src : String) : Bool :=
  match parseLiveLlvmCfgFixtureSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmCfgFixtureParsed? : Option Module :=
  match parseLiveLlvmCfgFixtureSource liveLlvmCfgFixtureSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Imports, namespace, and end.
    Compound defs are not kept. Not a hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | some m => m.commands.length == liveLlvmCfgFixtureKeptCmds
  | none => false

/-- Compound band, surface, package, and ready defs are not kernel-kept. -/
def liveParseSkippedCompoundDefs : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is LlvmCfgFixture (no module line in the live file). -/
def liveParseHasLlvmCfgFixtureModule : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmCfgFixture"
      && lastSeg m.name.raw == "LlvmCfgFixture"

/-- Live parse has namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureNs : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmCfgFixture. -/
def liveParseHasLlvmCfgFixtureEnd : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmCfgFixture"
      | _ => false

/-- True when the parsed module imports `nm`. -/
def liveParseHasImport (nm : String) : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == nm
      | _ => false

/-- The thirteen live imports of LlvmCfgFixture.lean. -/
def liveParseHasFixtureImports : Bool :=
  liveParseHasImport "SystemsLean.KernelMult"
    && liveParseHasImport "SystemsLean.LlvmHold"
    && liveParseHasImport "SystemsLean.LlvmMultSsa"
    && liveParseHasImport "SystemsLean.LlvmLinearSsa"
    && liveParseHasImport "SystemsLean.LlvmTypesSsa"
    && liveParseHasImport "SystemsLean.LlvmProgramSsa"
    && liveParseHasImport "SystemsLean.LlvmGraphSsa"
    && liveParseHasImport "SystemsLean.LlvmCfgHonesty"
    && liveParseHasImport "SystemsLean.LlvmCfgMultProduction"
    && liveParseHasImport "SystemsLean.LlvmCfgMultDf"
    && liveParseHasImport "SystemsLean.LlvmCfgUnitDf"
    && liveParseHasImport "SystemsLean.LlvmCfgUnitProduction"
    && liveParseHasImport "SystemsLean.LlvmCfgGeneral"

/-- Skip-head still sees the eight fixture defs, even when bodies are skipped. -/
def liveParseHasCoreDefs : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgFixtureSource)
    let fuel := liveLlvmCfgFixtureSkipFuel
    toksHaveDefNamed fuel toks "multBandOk"
      && toksHaveDefNamed fuel toks "linearBandOk"
      && toksHaveDefNamed fuel toks "typesBandOk"
      && toksHaveDefNamed fuel toks "programBandOk"
      && toksHaveDefNamed fuel toks "graphBandOk"
      && toksHaveDefNamed fuel toks "llvmCfgFixtureSurfaceOk"
      && toksHaveDefNamed fuel toks "llvmCfgFixturePackageOk"
      && toksHaveDefNamed fuel toks "llvmCfgFixtureReady"

/-- Keyword counts: theorem 72, example 67, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmCfgFixtureParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgFixtureSource)
    let fuel := liveLlvmCfgFixtureSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmCfgFixtureTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmCfgFixtureExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmCfgFixtureSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportKernelMult : String := "import SystemsLean.KernelMult\n"

/-- Last import needle. Trailing newline. -/
def needleImportLlvmCfgGeneral : String := "import SystemsLean.LlvmCfgGeneral\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmCfgFixture\n"

/-- Open needle with a trailing newline. -/
def needleOpenKernelMult : String :=
  "open SystemsLean.KernelMult (multKernelReady kernelOk lowerMultKernel)\n"

/-- multBandOk def needle with a trailing newline. -/
def needleMultBandOk : String := "def multBandOk : Bool :=\n"

/-- Surface def needle with a trailing newline. -/
def needleSurfaceOk : String := "def llvmCfgFixtureSurfaceOk : Bool :=\n"

/-- Package def needle with a trailing newline. -/
def needlePackageOk : String := "def llvmCfgFixturePackageOk : Bool :=\n"

/-- Ready def needle with a trailing newline. -/
def needleReady : String := "def llvmCfgFixtureReady : Bool :=\n"

/-- Ready theorem needle with a trailing newline. -/
def needleReadyTheorem : String := "theorem llvmCfgFixtureReady_true :\n"

/-- Last smoke example needle with a trailing newline. -/
def needleGraphSsaExample : String :=
  "example : LlvmGraphSsa.llvmGraphSsaReady = true := by native_decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmCfgFixture\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmCfgFixtureSource
  (src.splitOn needleImportKernelMult).length > 1
    && (src.splitOn needleImportLlvmCfgGeneral).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleOpenKernelMult).length > 1
    && (src.splitOn needleMultBandOk).length > 1
    && (src.splitOn needleSurfaceOk).length > 1
    && (src.splitOn needlePackageOk).length > 1
    && (src.splitOn needleReady).length > 1
    && (src.splitOn needleReadyTheorem).length > 1
    && (src.splitOn needleGraphSsaExample).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmCfgFixtureReady,
    PARSE-LIVE-LLVM-CFG-FIXTURE,
    HOST-FRONT-LIVE-LLVM-CFG-FIXTURE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmCfgFixtureReady : Bool :=
  (stageId == "LLVM-CFG-FIXTURE")
    && (stageToken == "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_FIXTURE_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-CFG-FIXTURE")
    && (parseId == "PARSE-LIVE-LLVM-CFG-FIXTURE")
    && (liveRel == "LlvmCfgFixture.lean")
    && (liveLlvmCfgFixtureRel
      == "src/systems/SystemsLean/LlvmCfgFixture.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmCfgFixtureFullHost
    && !hostFrontLiveLlvmCfgFixtureFullBackend
    && !hostFrontLiveLlvmCfgFixtureResidualFreeClaimed
    && !hostFrontLiveLlvmCfgFixtureProvablyUnlocked
    && kernelCheckLiveLlvmCfgFixtureSource liveLlvmCfgFixtureSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseSkippedCompoundDefs
    && liveParseHasLlvmCfgFixtureModule
    && liveParseHasLlvmCfgFixtureNs
    && liveParseHasLlvmCfgFixtureEnd
    && liveParseHasFixtureImports
    && liveParseHasCoreDefs
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmCfgFixtureSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmCfgFixture (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: {parseId} =="
  IO.println s!"  host={hostId} file={liveLlvmCfgFixtureRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmCfgFixtureRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmCfgFixtureRel}"
    throw (IO.userError s!"missing {liveLlvmCfgFixtureRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmCfgFixtureSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmCfgFixture.lean != liveLlvmCfgFixtureSource"
    throw (IO.userError "dual-pin mismatch live LlvmCfgFixture.lean")
  let r := parseLiveLlvmCfgFixtureSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-CFG-FIXTURE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-CFG-FIXTURE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-CFG-FIXTURE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmCfgFixture parse false"
      throw (IO.userError "kernelCheck live LlvmCfgFixture parse false")
    unless hostFrontLiveLlvmCfgFixtureReady do
      IO.eprintln "error: hostFrontLiveLlvmCfgFixtureReady false"
      throw (IO.userError "hostFrontLiveLlvmCfgFixtureReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmCfgFixture source was accepted"
      throw (IO.userError "empty LlvmCfgFixture source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmCfgFixture root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmCfgFixture
