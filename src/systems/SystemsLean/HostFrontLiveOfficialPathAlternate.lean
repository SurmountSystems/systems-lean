/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OfficialPathAlternate.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is OfficialPathAlternate.lean. It is not OfficialPathAlternateTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live def productPathFreestandingPerformOfficialPathAlternateMeasured
  is true. productPathFreestandingPerformClaimed is false.
  Those live defs are not this wrap's backend claim.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE,
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_V0,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE, OFFICIAL-PATH-ALTERNATE-THEOREM, liveRel,
  kernelCheckLiveOfficialPathAlternateSource,
  hostFrontLiveOfficialPathAlternateReady.
  Module: SystemsLean.HostFrontLiveOfficialPathAlternate
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOfficialPathAlternateSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOfficialPathAlternate

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OFFICIAL-PATH-ALTERNATE"

/-- Live file basename. -/
def liveRel : String := "OfficialPathAlternate.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathAlternateRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOfficialPathAlternateFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    Not the live perform-claimed pin. -/
def hostFrontLiveOfficialPathAlternateFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOfficialPathAlternateResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live perform-claimed pin is false. That pin is not this flag. -/
def hostFrontLiveOfficialPathAlternateProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveOfficialPathAlternateParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveOfficialPathAlternateSkipFuel : Nat := 8192

/-- Kept commands: no import, namespace, kernel-checkable defs, and end.
    Thirty string or Bool atoms, the Ok decideEq chain, PartialReady,
    namespace, and end. IO print and main are skip-folded.
    From OfficialPathAlternate.lean. -/
def liveOfficialPathAlternateKeptCmds : Nat := 34

/-- theorem keyword count. OfficialPathAlternate.lean has no theorem. -/
def liveOfficialPathAlternateTheoremCount : Nat := 0

/-- example keyword count. OfficialPathAlternate.lean has no example. -/
def liveOfficialPathAlternateExampleCount : Nat := 0

/-- set_option keyword count. OfficialPathAlternate.lean has no set_option. -/
def liveOfficialPathAlternateSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . OfficialPathAlternate`. -/
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
def cmdAddsOfficialPathAlternate (c : Cmd) : List String :=
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
def cmdBodyKnownOfficialPathAlternate (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathAlternateParseFuel body
        && termNoAppN liveOfficialPathAlternateParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathAlternateParseFuel body
        && termNoAppN liveOfficialPathAlternateParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdOfficialPathAlternate (fuel : Nat) (toks : List String) :
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
def parseCmdsOfficialPathAlternate : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOfficialPathAlternate liveOfficialPathAlternateParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOfficialPathAlternateSkipFuel rest
      if cmdBodyKnownOfficialPathAlternate kn c then
        parseCmdsOfficialPathAlternate n rest2
          (kn ++ cmdAddsOfficialPathAlternate c) (acc ++ [c])
      else
        parseCmdsOfficialPathAlternate n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveOfficialPathAlternateSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsOfficialPathAlternate n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live OfficialPathAlternate.lean text.
    Greppable: parseLiveOfficialPathAlternateSource,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE. -/
def parseLiveOfficialPathAlternateSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOfficialPathAlternate liveOfficialPathAlternateParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OfficialPathAlternate"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OfficialPathAlternate parse. Not a fixture.
    Greppable: kernelCheckLiveOfficialPathAlternateSource,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE. -/
def kernelCheckLiveOfficialPathAlternateSource (src : String) : Bool :=
  match parseLiveOfficialPathAlternateSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOfficialPathAlternateParsed? : Option Module :=
  match parseLiveOfficialPathAlternateSource liveOfficialPathAlternateSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOfficialPathAlternateParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    No import. Namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveOfficialPathAlternateParsed? with
  | some m => m.commands.length == liveOfficialPathAlternateKeptCmds
  | none => false

/-- Literal defs the kernel must keep: stageId, the measured pin,
    perform claimed false, and the step-contract full pin false. -/
def liveParseHasLiteralDefs : Bool :=
  match liveOfficialPathAlternateParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "productPathFreestandingPerformOfficialPathAlternateMeasured"
      && has "productPathFreestandingPerformClaimed"
      && has "productPathFreestandingCapableStepContractFullSatisfied"

/-- Wrap module lastSeg is OfficialPathAlternate (no module line in the live file). -/
def liveParseHasOfficialPathAlternateModule : Bool :=
  match liveOfficialPathAlternateParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.OfficialPathAlternate"
      && lastSeg m.name.raw == "OfficialPathAlternate"

/-- Live parse has namespace SystemsLean.OfficialPathAlternate. -/
def liveParseHasOfficialPathAlternateNs : Bool :=
  match liveOfficialPathAlternateParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.OfficialPathAlternate"
      | _ => false

/-- Live parse ends namespace SystemsLean.OfficialPathAlternate. -/
def liveParseHasOfficialPathAlternateEnd : Bool :=
  match liveOfficialPathAlternateParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.OfficialPathAlternate"
      | _ => false

/-- Live file has no import. OfficialPathAlternate.lean does not import. -/
def liveParseHasNoImport : Bool :=
  match liveOfficialPathAlternateParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveOfficialPathAlternateParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveOfficialPathAlternateSource)
    let fuel := liveOfficialPathAlternateSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveOfficialPathAlternateTheoremCount
      && toksCountKw fuel toks "example" 0 == liveOfficialPathAlternateExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveOfficialPathAlternateSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.OfficialPathAlternate\n"

/-- stageId def head needle with a trailing newline.
    The stage string is the next line in OfficialPathAlternate.lean. -/
def needleStageId : String := "def stageId : String :=\n"

/-- hostId def head needle with a trailing newline. -/
def needleHostId : String := "def hostId : String :=\n"

/-- Measured pin needle with a trailing newline. -/
def needleMeasured : String :=
  "def productPathFreestandingPerformOfficialPathAlternateMeasured : Bool := true\n"

/-- Perform claimed stays false. Trailing newline. -/
def needlePerformClaimed : String :=
  "def productPathFreestandingPerformClaimed : Bool := false\n"

/-- Alternate is not the official path. Trailing newline. -/
def needleNotOfficial : String :=
  "def productPathOfficialPathAlternateNotOfficial : Bool := true\n"

/-- Step-contract full stays false. Trailing newline. -/
def needleStepContractFull : String :=
  "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.OfficialPathAlternate\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import needle. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveOfficialPathAlternateSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleMeasured).length > 1
    && (src.splitOn needlePerformClaimed).length > 1
    && (src.splitOn needleNotOfficial).length > 1
    && (src.splitOn needleStepContractFull).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOfficialPathAlternateReady,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE,
    HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveOfficialPathAlternateReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_V0")
    && (hostId == "HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE")
    && (parseId == "PARSE-LIVE-OFFICIAL-PATH-ALTERNATE")
    && (liveRel == "OfficialPathAlternate.lean")
    && (liveOfficialPathAlternateRel
      == "src/systems/SystemsLean/OfficialPathAlternate.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOfficialPathAlternateFullHost
    && !hostFrontLiveOfficialPathAlternateFullBackend
    && !hostFrontLiveOfficialPathAlternateResidualFreeClaimed
    && !hostFrontLiveOfficialPathAlternateProvablyUnlocked
    && kernelCheckLiveOfficialPathAlternateSource liveOfficialPathAlternateSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasOfficialPathAlternateModule
    && liveParseHasOfficialPathAlternateNs
    && liveParseHasOfficialPathAlternateEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOfficialPathAlternateSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveOfficialPathAlternate (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OFFICIAL-PATH-ALTERNATE =="
  IO.println s!"  host={hostId} file={liveOfficialPathAlternateRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveOfficialPathAlternateRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOfficialPathAlternateRel}"
    throw (IO.userError s!"missing {liveOfficialPathAlternateRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOfficialPathAlternateSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OfficialPathAlternate.lean != liveOfficialPathAlternateSource"
    throw (IO.userError "dual-pin mismatch live OfficialPathAlternate.lean")
  let r := parseLiveOfficialPathAlternateSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OFFICIAL-PATH-ALTERNATE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OFFICIAL-PATH-ALTERNATE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OFFICIAL-PATH-ALTERNATE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OfficialPathAlternate parse false"
      throw (IO.userError "kernelCheck live OfficialPathAlternate parse false")
    unless hostFrontLiveOfficialPathAlternateReady do
      IO.eprintln "error: hostFrontLiveOfficialPathAlternateReady false"
      throw (IO.userError "hostFrontLiveOfficialPathAlternateReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty OfficialPathAlternate source was accepted"
      throw (IO.userError "empty OfficialPathAlternate source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOfficialPathAlternate root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOfficialPathAlternate
