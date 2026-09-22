/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/InstallOut.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is InstallOut.lean. It is not InstallOutTheorems.lean.
  It is not InstallOutMain.lean.
  Literal defs stay. IO requireFile, requireInstalledTokens,
  freestandingCapableInstallFreestandingOut, and main are skipped
  when the body is not kernel-checkable. theorem, example, and
  set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def productPathFreestandingCapableInstallOutDependsOnLake
  is true. That def is not this wrap's FullHost flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-INSTALL-OUT,
  SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_V0,
  PARSE-LIVE-INSTALL-OUT, liveRel,
  kernelCheckLiveInstallOutSource,
  hostFrontLiveInstallOutReady.
  Module: SystemsLean.HostFrontLiveInstallOut
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveInstallOutSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveInstallOut

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-INSTALL-OUT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-INSTALL-OUT"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is the Source def. Do not redefine it. -/
def liveInstallOutRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveInstallOutFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveInstallOutFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveInstallOutResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveInstallOutProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveInstallOutParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveInstallOutSkipFuel : Nat := 8192

/-- Kept commands: namespace, sixteen literal defs, and end.
    No import. IO requireFile and main are not kept.
    Ok and PartialReady conjunctions are not kept.
    Not LlvmHold's count of 16. From InstallOut.lean. -/
def liveInstallOutKeptCmds : Nat := 18

/-- theorem keyword count. InstallOut.lean has no theorem. -/
def liveInstallOutTheoremCount : Nat := 0

/-- example keyword count. InstallOut.lean has no example. -/
def liveInstallOutExampleCount : Nat := 0

/-- set_option keyword count. InstallOut.lean has no set_option. -/
def liveInstallOutSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . InstallOut`. -/
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
def cmdAddsInstallOut (c : Cmd) : List String :=
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
def cmdBodyKnownInstallOut (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInstallOutParseFuel body
        && termNoAppN liveInstallOutParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInstallOutParseFuel body
        && termNoAppN liveInstallOutParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdInstallOut (fuel : Nat) (toks : List String) :
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
def parseCmdsInstallOut : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdInstallOut liveInstallOutParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveInstallOutSkipFuel rest
      if cmdBodyKnownInstallOut kn c then
        parseCmdsInstallOut n rest2
          (kn ++ cmdAddsInstallOut c) (acc ++ [c])
      else
        parseCmdsInstallOut n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveInstallOutSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsInstallOut n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live InstallOut.lean text.
    Greppable: parseLiveInstallOutSource,
    PARSE-LIVE-INSTALL-OUT. -/
def parseLiveInstallOutSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsInstallOut liveInstallOutParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.InstallOut"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live InstallOut parse. Not a fixture.
    Greppable: kernelCheckLiveInstallOutSource,
    PARSE-LIVE-INSTALL-OUT. -/
def kernelCheckLiveInstallOutSource (src : String) : Bool :=
  match parseLiveInstallOutSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveInstallOutParsed? : Option Module :=
  match parseLiveInstallOutSource liveInstallOutSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveInstallOutParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable defs. Not a count of 16. -/
def liveParseCmdCountOk : Bool :=
  match liveInstallOutParsed? with
  | some m => m.commands.length == liveInstallOutKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveInstallOutParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "selfHostId"
      && has "installOutId"
      && has "writerPathStepInstallOut"
      && has "blockerMustOwnRegenerate"
      && has "lakeExeName"
      && has "justRecipeName"
      && has "freestandingCapableInstallOutApi"
      && has "productPathFreestandingCapableInstallOutAuthorityNotEmit"
      && has "productPathFreestandingCapableInstallOutDependsOnLake"
      && has "productPathFreestandingCapableRegenerateInstallOutOpen"
      && has "productPathFreestandingCapableStepContractFullSatisfied"
      && has "emitHeaderBase"
      && has "emitSourceBase"
      && has "productOutRel"

/-- Wrap module lastSeg is InstallOut (no module line in the live file). -/
def liveParseHasInstallOutModule : Bool :=
  match liveInstallOutParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.InstallOut"
      && lastSeg m.name.raw == "InstallOut"

/-- Live parse has namespace SystemsLean.InstallOut. -/
def liveParseHasInstallOutNs : Bool :=
  match liveInstallOutParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.InstallOut"
      | _ => false

/-- Live parse ends namespace SystemsLean.InstallOut. -/
def liveParseHasInstallOutEnd : Bool :=
  match liveInstallOutParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.InstallOut"
      | _ => false

/-- Live file has no import command. -/
def liveParseHasNoImport : Bool :=
  match liveInstallOutParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveInstallOutParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveInstallOutSource)
    let fuel := liveInstallOutSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveInstallOutTheoremCount
      && toksCountKw fuel toks "example" 0 == liveInstallOutExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveInstallOutSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.InstallOut\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String :=
  "def stageId : String :=\n  \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_INSTALL_OUT_V0\"\n"

/-- hostId def needle with a trailing newline. -/
def needleHostId : String :=
  "def hostId : String :=\n  \"HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-INSTALL-OUT\"\n"

/-- installOutId def needle with a trailing newline. -/
def needleInstallOutId : String :=
  "def installOutId : String := \"FREESTANDING-CAPABLE-INSTALL-OUT\"\n"

/-- Authority-not-emit def needle with a trailing newline. -/
def needleAuthorityNotEmit : String :=
  "def productPathFreestandingCapableInstallOutAuthorityNotEmit : Bool := true\n"

/-- Step-contract full def needle with a trailing newline. -/
def needleStepContractFull : String :=
  "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false\n"

/-- requireFile def needle with a trailing newline. IO, skip-folded. -/
def needleRequireFile : String :=
  "def requireFile (path : System.FilePath) (label : String) : IO Unit := do\n"

/-- main def needle with a trailing newline. IO, skip-folded. -/
def needleMain : String :=
  "def main (args : List String) : IO UInt32 := do\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.InstallOut\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.InstallOut. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveInstallOutSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleInstallOutId).length > 1
    && (src.splitOn needleAuthorityNotEmit).length > 1
    && (src.splitOn needleStepContractFull).length > 1
    && (src.splitOn needleRequireFile).length > 1
    && (src.splitOn needleMain).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveInstallOutReady,
    PARSE-LIVE-INSTALL-OUT,
    HOST-FRONT-LIVE-INSTALL-OUT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveInstallOutReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_V0")
    && (hostId == "HOST-FRONT-LIVE-INSTALL-OUT")
    && (parseId == "PARSE-LIVE-INSTALL-OUT")
    && (liveRel == "InstallOut.lean")
    && (liveInstallOutRel
      == "src/systems/SystemsLean/InstallOut.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveInstallOutFullHost
    && !hostFrontLiveInstallOutFullBackend
    && !hostFrontLiveInstallOutResidualFreeClaimed
    && !hostFrontLiveInstallOutProvablyUnlocked
    && kernelCheckLiveInstallOutSource liveInstallOutSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasInstallOutModule
    && liveParseHasInstallOutNs
    && liveParseHasInstallOutEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveInstallOutSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveInstallOut (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-INSTALL-OUT =="
  IO.println s!"  host={hostId} file={liveInstallOutRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveInstallOutRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveInstallOutRel}"
    throw (IO.userError s!"missing {liveInstallOutRel}")
  let disk <- IO.FS.readFile path
  if disk != liveInstallOutSource then
    IO.eprintln "error: dual-pin mismatch: on-disk InstallOut.lean != liveInstallOutSource"
    throw (IO.userError "dual-pin mismatch live InstallOut.lean")
  let r := parseLiveInstallOutSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-INSTALL-OUT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-INSTALL-OUT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-INSTALL-OUT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live InstallOut parse false"
      throw (IO.userError "kernelCheck live InstallOut parse false")
    unless hostFrontLiveInstallOutReady do
      IO.eprintln "error: hostFrontLiveInstallOutReady false"
      throw (IO.userError "hostFrontLiveInstallOutReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty InstallOut source was accepted"
      throw (IO.userError "empty InstallOut source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveInstallOut root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveInstallOut
