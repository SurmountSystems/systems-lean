/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmCfgHonesty.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Not LlvmCfg.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-CFG-HONESTY,
  SLAKE_HOST_FRONT_LIVE_LLVM_CFG_HONESTY_V0,
  PARSE-LIVE-LLVM-CFG-HONESTY, LLVM-CFG-HONESTY, liveRel,
  kernelCheckLiveLlvmCfgHonestySource,
  hostFrontLiveLlvmCfgHonestyReady.
  Module: SystemsLean.HostFrontLiveLlvmCfgHonesty
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmCfgHonestySource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmCfgHonesty

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_HONESTY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-CFG-HONESTY"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-CFG-HONESTY"

/-- Live file basename. -/
def liveRel : String := "LlvmCfgHonesty.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmCfgHonestyRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmCfgHonestyFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live file's fixture tip llvmCfgFixtureFullBackendClaimed is a
    separate product pin and is not this flag. -/
def hostFrontLiveLlvmCfgHonestyFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmCfgHonestyResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLlvmCfgHonestyProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmCfgHonestyParseFuel : Nat := 256

/-- Skip fuel for open / un-kernelable tails. -/
def liveLlvmCfgHonestySkipFuel : Nat := 8192

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
    LlvmHold.llvmHoldReady and LlvmMultSsa.* are skipped with the def. -/
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
def cmdAddsLlvmCfgHonesty (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. `Mult.name Mult.mult0` is an app the skip-fold drops. -/
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
def cmdBodyKnownLlvmCfgHonesty (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgHonestyParseFuel body
        && termNoAppN liveLlvmCfgHonestyParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmCfgHonestyParseFuel body
        && termNoAppN liveLlvmCfgHonestyParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    open is not parsed here; the fold skips it. -/
def parseOneCmdLlvmCfgHonesty (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip open and un-kernelable def bodies. -/
def parseCmdsLlvmCfgHonesty : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmCfgHonesty liveLlvmCfgHonestyParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmCfgHonestySkipFuel rest
      if cmdBodyKnownLlvmCfgHonesty kn c then
        parseCmdsLlvmCfgHonesty n rest2
          (kn ++ cmdAddsLlvmCfgHonesty c) (acc ++ [c])
      else
        parseCmdsLlvmCfgHonesty n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmCfgHonestySkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmCfgHonesty n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live LlvmCfgHonesty.lean text.
    Greppable: parseLiveLlvmCfgHonestySource,
    PARSE-LIVE-LLVM-CFG-HONESTY. -/
def parseLiveLlvmCfgHonestySource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmCfgHonesty liveLlvmCfgHonestyParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmCfgHonesty"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmCfgHonesty parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmCfgHonestySource,
    PARSE-LIVE-LLVM-CFG-HONESTY. -/
def kernelCheckLiveLlvmCfgHonestySource (src : String) : Bool :=
  match parseLiveLlvmCfgHonestySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmCfgHonestyParsed? : Option Module :=
  match parseLiveLlvmCfgHonestySource liveLlvmCfgHonestySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmCfgHonestyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Real lower bound, not hardcoded true.
    Imports, namespace, end, and literal defs. Proj and app bodies skipped. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmCfgHonestyParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Wrap module lastSeg is LlvmCfgHonesty (no module line in the live file). -/
def liveParseHasLlvmCfgHonestyModule : Bool :=
  match liveLlvmCfgHonestyParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "LlvmCfgHonesty"

/-- Live parse has the living LlvmCfgFixture namespace command. -/
def liveParseHasLlvmCfgFixtureNs : Bool :=
  match liveLlvmCfgHonestyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "LlvmCfgFixture"
      | _ => false

/-- Skip-head still sees the honesty pins and the Mult.name def,
    even when a body was not kernel-kept. -/
def liveParseHasCoreDefs : Bool :=
  match liveLlvmCfgHonestyParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmCfgHonestySource)
    toksHaveDefNamed liveLlvmCfgHonestySkipFuel toks "stageId"
      && toksHaveDefNamed liveLlvmCfgHonestySkipFuel toks
        "llvmCfgFixtureFullBackendClaimed"
      && toksHaveDefNamed liveLlvmCfgHonestySkipFuel toks
        "dominancePipelineRequiredForFullBackend"
      && toksHaveDefNamed liveLlvmCfgHonestySkipFuel toks "multGradeOmegaName"

/-- Import needle. Trailing newline. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmCfgFixture\n"

/-- def stageId needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String := \"SLAKE_LLVM_CFG_FIXTURE_V0\"\n"

/-- Fixture tip in the live file. Not this wrap's FullBackend pin. -/
def needleFullBackendTip : String :=
  "def llvmCfgFixtureFullBackendClaimed : Bool := true\n"

/-- Dominance pipeline required pin stays false in the live file. -/
def needleDominanceRequired : String :=
  "def dominancePipelineRequiredForFullBackend : Bool := false\n"

/-- Mult.name app needle. Body is skipped; the text must still be present. -/
def needleMultGradeOmega : String :=
  "def multGradeOmegaName : String := Mult.name Mult.multOmega\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmCfgHonestySource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleFullBackendTip).length > 1
    && (src.splitOn needleDominanceRequired).length > 1
    && (src.splitOn needleMultGradeOmega).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmCfgHonestyReady,
    PARSE-LIVE-LLVM-CFG-HONESTY,
    HOST-FRONT-LIVE-LLVM-CFG-HONESTY.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. -/
def hostFrontLiveLlvmCfgHonestyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_CFG_HONESTY_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-CFG-HONESTY")
    && (parseId == "PARSE-LIVE-LLVM-CFG-HONESTY")
    && (liveRel == "LlvmCfgHonesty.lean")
    && (liveLlvmCfgHonestyRel
      == "src/systems/SystemsLean/LlvmCfgHonesty.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmCfgHonestyFullHost
    && !hostFrontLiveLlvmCfgHonestyFullBackend
    && !hostFrontLiveLlvmCfgHonestyResidualFreeClaimed
    && !hostFrontLiveLlvmCfgHonestyProvablyUnlocked
    && kernelCheckLiveLlvmCfgHonestySource liveLlvmCfgHonestySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLlvmCfgFixtureNs
    && liveParseHasLlvmCfgHonestyModule
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmCfgHonestySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmCfgHonesty (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-CFG-HONESTY =="
  IO.println s!"  host={hostId} file={liveLlvmCfgHonestyRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmCfgHonestyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmCfgHonestyRel}"
    throw (IO.userError s!"missing {liveLlvmCfgHonestyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmCfgHonestySource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmCfgHonesty.lean != liveLlvmCfgHonestySource"
    throw (IO.userError "dual-pin mismatch live LlvmCfgHonesty.lean")
  let r := parseLiveLlvmCfgHonestySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-CFG-HONESTY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-CFG-HONESTY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-CFG-HONESTY ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmCfgHonesty parse false"
      throw (IO.userError "kernelCheck live LlvmCfgHonesty parse false")
    unless hostFrontLiveLlvmCfgHonestyReady do
      IO.eprintln "error: hostFrontLiveLlvmCfgHonestyReady false"
      throw (IO.userError "hostFrontLiveLlvmCfgHonestyReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmCfgHonesty source was accepted"
      throw (IO.userError "empty LlvmCfgHonesty source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmCfgHonesty root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmCfgHonesty
