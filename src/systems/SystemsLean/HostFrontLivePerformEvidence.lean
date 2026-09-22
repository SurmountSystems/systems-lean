/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/PerformEvidence.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is PerformEvidence.lean. It is not PerformEvidenceTheorems.lean.
  It is not PerformEvidenceMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-PERFORM-EVIDENCE,
  SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_V0,
  PARSE-LIVE-PERFORM-EVIDENCE, PERFORM-EVIDENCE-THEOREM, liveRel,
  kernelCheckLivePerformEvidenceSource,
  hostFrontLivePerformEvidenceReady.
  Module: SystemsLean.HostFrontLivePerformEvidence
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLivePerformEvidenceSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLivePerformEvidence

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-PERFORM-EVIDENCE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-PERFORM-EVIDENCE"

/-- Live file basename. -/
def liveRel : String := "PerformEvidence.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformEvidenceRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLivePerformEvidenceFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLivePerformEvidenceFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLivePerformEvidenceResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLivePerformEvidenceProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def livePerformEvidenceParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def livePerformEvidenceSkipFuel : Nat := 8192

/-- Kept commands: namespace, thirty literal defs, Ok, PartialReady, and end.
    printPerformEvidenceMeasure and main are not kernel-checkable.
    A count of 4 would drop the literal defs. From PerformEvidence.lean. -/
def livePerformEvidenceKeptCmds : Nat := 34

/-- theorem keyword count. PerformEvidence.lean has no theorem. -/
def livePerformEvidenceTheoremCount : Nat := 0

/-- example keyword count. PerformEvidence.lean has no example. -/
def livePerformEvidenceExampleCount : Nat := 0

/-- set_option keyword count. PerformEvidence.lean has no set_option. -/
def livePerformEvidenceSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . PerformEvidence`. -/
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
def cmdAddsPerformEvidence (c : Cmd) : List String :=
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
def cmdBodyKnownPerformEvidence (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformEvidenceParseFuel body
        && termNoAppN livePerformEvidenceParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformEvidenceParseFuel body
        && termNoAppN livePerformEvidenceParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdPerformEvidence (fuel : Nat) (toks : List String) :
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
def parseCmdsPerformEvidence : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPerformEvidence livePerformEvidenceParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd livePerformEvidenceSkipFuel rest
      if cmdBodyKnownPerformEvidence kn c then
        parseCmdsPerformEvidence n rest2
          (kn ++ cmdAddsPerformEvidence c) (acc ++ [c])
      else
        parseCmdsPerformEvidence n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd livePerformEvidenceSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsPerformEvidence n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live PerformEvidence.lean text.
    Greppable: parseLivePerformEvidenceSource,
    PARSE-LIVE-PERFORM-EVIDENCE. -/
def parseLivePerformEvidenceSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPerformEvidence livePerformEvidenceParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.PerformEvidence"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live PerformEvidence parse. Not a fixture.
    Greppable: kernelCheckLivePerformEvidenceSource,
    PARSE-LIVE-PERFORM-EVIDENCE. -/
def kernelCheckLivePerformEvidenceSource (src : String) : Bool :=
  match parseLivePerformEvidenceSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def livePerformEvidenceParsed? : Option Module :=
  match parseLivePerformEvidenceSource livePerformEvidenceSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match livePerformEvidenceParsed? with
  | some m => m.commands.length == livePerformEvidenceKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "productPathFreestandingPerformEvidenceClaimed"
      && has "productPathFreestandingPerformClaimed"
      && has "productPathPerformDependsOnLake"
      && has "productPathFreestandingPerformEvidenceOk"
      && has "productPathFreestandingPerformEvidencePartialReady"

/-- IO measure and CLI main are not kept. -/
def liveParseSkippedIo : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    (!has "printPerformEvidenceMeasure") && (!has "main")

/-- Wrap module lastSeg is PerformEvidence (no module line in the live file). -/
def liveParseHasPerformEvidenceModule : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.PerformEvidence"
      && lastSeg m.name.raw == "PerformEvidence"

/-- Live parse has namespace SystemsLean.PerformEvidence. -/
def liveParseHasPerformEvidenceNs : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.PerformEvidence"
      | _ => false

/-- Live parse ends namespace SystemsLean.PerformEvidence. -/
def liveParseHasPerformEvidenceEnd : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.PerformEvidence"
      | _ => false

/-- This live file has no import. -/
def liveParseHasNoImport : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match livePerformEvidenceParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments livePerformEvidenceSource)
    let fuel := livePerformEvidenceSkipFuel
    toksCountKw fuel toks "theorem" 0 == livePerformEvidenceTheoremCount
      && toksCountKw fuel toks "example" 0 == livePerformEvidenceExampleCount
      && toksCountKw fuel toks "set_option" 0
        == livePerformEvidenceSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.PerformEvidence\n"

/-- stageId string needle with a trailing newline. -/
def needleStageId : String :=
  "  \"SLAKE_SELF_HOST_PRODUCT_PATH_PERFORM_EVIDENCE_V0\"\n"

/-- hostId string needle with a trailing newline. -/
def needleHostId : String :=
  "  \"HOST-SELF-HOST-PRODUCT-PATH-PERFORM-EVIDENCE\"\n"

/-- Evidence claimed def needle with a trailing newline. -/
def needleEvidenceClaimed : String :=
  "def productPathFreestandingPerformEvidenceClaimed : Bool := true\n"

/-- Perform claimed def needle with a trailing newline. -/
def needlePerformClaimed : String :=
  "def productPathFreestandingPerformClaimed : Bool := false\n"

/-- DependsOnLake def needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "def productPathPerformDependsOnLake : Bool := true\n"

/-- performEvidenceId def needle with a trailing newline. -/
def needlePerformEvidenceId : String :=
  "def performEvidenceId : String := \"FREESTANDING-PERFORM-EVIDENCE\"\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.PerformEvidence\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := livePerformEvidenceSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleEvidenceClaimed).length > 1
    && (src.splitOn needlePerformClaimed).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needlePerformEvidenceId).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLivePerformEvidenceReady,
    PARSE-LIVE-PERFORM-EVIDENCE,
    HOST-FRONT-LIVE-PERFORM-EVIDENCE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLivePerformEvidenceReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_V0")
    && (hostId == "HOST-FRONT-LIVE-PERFORM-EVIDENCE")
    && (parseId == "PARSE-LIVE-PERFORM-EVIDENCE")
    && (liveRel == "PerformEvidence.lean")
    && (livePerformEvidenceRel
      == "src/systems/SystemsLean/PerformEvidence.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLivePerformEvidenceFullHost
    && !hostFrontLivePerformEvidenceFullBackend
    && !hostFrontLivePerformEvidenceResidualFreeClaimed
    && !hostFrontLivePerformEvidenceProvablyUnlocked
    && kernelCheckLivePerformEvidenceSource livePerformEvidenceSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseSkippedIo
    && liveParseHasPerformEvidenceModule
    && liveParseHasPerformEvidenceNs
    && liveParseHasPerformEvidenceEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLivePerformEvidenceSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLivePerformEvidence (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PERFORM-EVIDENCE =="
  IO.println s!"  host={hostId} file={livePerformEvidenceRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / livePerformEvidenceRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {livePerformEvidenceRel}"
    throw (IO.userError s!"missing {livePerformEvidenceRel}")
  let disk <- IO.FS.readFile path
  if disk != livePerformEvidenceSource then
    IO.eprintln "error: dual-pin mismatch: on-disk PerformEvidence.lean != livePerformEvidenceSource"
    throw (IO.userError "dual-pin mismatch live PerformEvidence.lean")
  let r := parseLivePerformEvidenceSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PERFORM-EVIDENCE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PERFORM-EVIDENCE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PERFORM-EVIDENCE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live PerformEvidence parse false"
      throw (IO.userError "kernelCheck live PerformEvidence parse false")
    unless hostFrontLivePerformEvidenceReady do
      IO.eprintln "error: hostFrontLivePerformEvidenceReady false"
      IO.eprintln s!"  cmdCountOk={liveParseCmdCountOk} kept={livePerformEvidenceKeptCmds} cmds={m.commands.length}"
      IO.eprintln s!"  literals={liveParseHasLiteralDefs} skippedIo={liveParseSkippedIo}"
      IO.eprintln s!"  module={liveParseHasPerformEvidenceModule} ns={liveParseHasPerformEvidenceNs} endNs={liveParseHasPerformEvidenceEnd}"
      IO.eprintln s!"  noImport={liveParseHasNoImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk}"
      throw (IO.userError "hostFrontLivePerformEvidenceReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty PerformEvidence source was accepted"
      throw (IO.userError "empty PerformEvidence source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLivePerformEvidence root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLivePerformEvidence
