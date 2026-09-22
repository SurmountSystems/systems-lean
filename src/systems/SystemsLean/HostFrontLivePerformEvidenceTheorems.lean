/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/PerformEvidenceTheorems.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is PerformEvidenceTheorems.lean.
  It is not PerformEvidence.lean.
  Literal defs stay when present. This live file has no def.
  theorem and example commands are skipped. Their keyword counts are
  checked. set_option count is 0.
  Not a backend. FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  These PERFORM-EVIDENCE theorems do not flip llvm or PROVABLY.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-PERFORM-EVIDENCE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_THEOREMS_V0,
  PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS,
  PERFORM-EVIDENCE-THEOREMS-THEOREM,
  PERFORM-EVIDENCE-THEOREM, liveRel,
  kernelCheckLivePerformEvidenceTheoremsSource,
  hostFrontLivePerformEvidenceTheoremsReady.
  Module: SystemsLean.HostFrontLivePerformEvidenceTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLivePerformEvidenceTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLivePerformEvidenceTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-PERFORM-EVIDENCE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "PerformEvidenceTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def livePerformEvidenceTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLivePerformEvidenceTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not a backend. FullBackend stays false. -/
def hostFrontLivePerformEvidenceTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLivePerformEvidenceTheoremsResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLivePerformEvidenceTheoremsProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold). -/
def livePerformEvidenceTheoremsParseFuel : Nat := 256

/-- Skip fuel for commands whose bodies are not kernel-checkable. -/
def livePerformEvidenceTheoremsSkipFuel : Nat := 16384

/-- Kept commands: one import, namespace, and end.
    Theorems and examples are skipped. From
    PerformEvidenceTheorems.lean. -/
def livePerformEvidenceTheoremsKeptCmds : Nat := 3

/-- theorem keyword count. Thirty-two theorems in the live file. -/
def livePerformEvidenceTheoremsTheoremCount : Nat := 32

/-- example keyword count. Seventeen examples in the live file. -/
def livePerformEvidenceTheoremsExampleCount : Nat := 17

/-- set_option keyword count. The live file has no set_option. -/
def livePerformEvidenceTheoremsSetOptionCount : Nat := 0

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
def cmdAddsPerformEvidenceTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownPerformEvidenceTheorems (kn : List String) :
    Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformEvidenceTheoremsParseFuel body
        && termNoAppN livePerformEvidenceTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN livePerformEvidenceTheoremsParseFuel body
        && termNoAppN livePerformEvidenceTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdPerformEvidenceTheorems (fuel : Nat)
    (toks : List String) : Option (Prod Cmd (List String)) :=
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
def parseCmdsPerformEvidenceTheorems : Nat -> List String ->
    List String -> List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdPerformEvidenceTheorems
        livePerformEvidenceTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd livePerformEvidenceTheoremsSkipFuel rest
      if cmdBodyKnownPerformEvidenceTheorems kn c then
        parseCmdsPerformEvidenceTheorems n rest2
          (kn ++ cmdAddsPerformEvidenceTheorems c) (acc ++ [c])
      else
        parseCmdsPerformEvidenceTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t || t == "theorem" || t == "example"
            || t == "set_option" then
          let rest2 :=
            skipUntilCmd livePerformEvidenceTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsPerformEvidenceTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live PerformEvidenceTheorems.lean text.
    Greppable: parseLivePerformEvidenceTheoremsSource,
    PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS. -/
def parseLivePerformEvidenceTheoremsSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsPerformEvidenceTheorems
        livePerformEvidenceTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.PerformEvidence"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live PerformEvidenceTheorems parse. Not a fixture.
    Greppable: kernelCheckLivePerformEvidenceTheoremsSource,
    PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS. -/
def kernelCheckLivePerformEvidenceTheoremsSource (src : String) :
    Bool :=
  match parseLivePerformEvidenceTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def livePerformEvidenceTheoremsParsed? : Option Module :=
  match parseLivePerformEvidenceTheoremsSource
      livePerformEvidenceTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Import, namespace, and end.
    Theorems and examples are not kept. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | some m =>
    m.commands.length == livePerformEvidenceTheoremsKeptCmds
  | none => false

/-- This live file has no literal def. Theorems are skipped, not kept
    as defs. -/
def liveParseHasNoKeptDef : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is PerformEvidence
    (namespace in the live file; no module line). -/
def liveParseHasPerformEvidenceModule : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.PerformEvidence"
      && lastSeg m.name.raw == "PerformEvidence"

/-- Live parse has namespace SystemsLean.PerformEvidence. -/
def liveParseHasPerformEvidenceNs : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.PerformEvidence"
      | _ => false

/-- Live parse ends namespace SystemsLean.PerformEvidence. -/
def liveParseHasPerformEvidenceEnd : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x =>
        x.raw == "SystemsLean.PerformEvidence"
      | _ => false

/-- Live parse imports SystemsLean.PerformEvidence. -/
def liveParseHasPerformEvidenceImport : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x =>
        x.raw == "SystemsLean.PerformEvidence"
      | _ => false

/-- Keyword counts: thirty-two theorem, seventeen example, and set_option is 0. -/
def liveParseKwCountsOk : Bool :=
  match livePerformEvidenceTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments livePerformEvidenceTheoremsSource)
    let fuel := livePerformEvidenceTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == livePerformEvidenceTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == livePerformEvidenceTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == livePerformEvidenceTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportPerformEvidence : String :=
  "import SystemsLean.PerformEvidence\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String :=
  "namespace SystemsLean.PerformEvidence\n"

/-- stageId theorem needle with a trailing newline. -/
def needleStageIdThm : String := "theorem stageId_eq :\n"

/-- hostId theorem needle with a trailing newline. -/
def needleHostIdThm : String := "theorem hostId_eq :\n"

/-- Ok theorem needle with a trailing newline. -/
def needleOkThm : String :=
  "theorem productPathFreestandingPerformEvidenceOk_true :\n"

/-- PartialReady theorem needle with a trailing newline. -/
def needlePartialReadyThm : String :=
  "theorem productPathFreestandingPerformEvidencePartialReady_true :\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.PerformEvidence\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.PerformEvidenceTheorems.
    No set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := livePerformEvidenceTheoremsSource
  (src.splitOn needleImportPerformEvidence).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdThm).length > 1
    && (src.splitOn needleHostIdThm).length > 1
    && (src.splitOn needleOkThm).length > 1
    && (src.splitOn needlePartialReadyThm).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLivePerformEvidenceTheoremsReady,
    PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS,
    HOST-FRONT-LIVE-PERFORM-EVIDENCE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLivePerformEvidenceTheoremsReady : Bool :=
  (stageId
    == "SLAKE_HOST_FRONT_LIVE_PERFORM_EVIDENCE_THEOREMS_V0")
    && (hostId
      == "HOST-FRONT-LIVE-PERFORM-EVIDENCE-THEOREMS")
    && (parseId == "PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS")
    && (liveRel == "PerformEvidenceTheorems.lean")
    && (livePerformEvidenceTheoremsRel
      == "src/systems/SystemsLean/PerformEvidenceTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLivePerformEvidenceTheoremsFullHost
    && !hostFrontLivePerformEvidenceTheoremsFullBackend
    && !hostFrontLivePerformEvidenceTheoremsResidualFreeClaimed
    && !hostFrontLivePerformEvidenceTheoremsProvablyUnlocked
    && kernelCheckLivePerformEvidenceTheoremsSource
      livePerformEvidenceTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoKeptDef
    && liveParseHasPerformEvidenceModule
    && liveParseHasPerformEvidenceNs
    && liveParseHasPerformEvidenceEnd
    && liveParseHasPerformEvidenceImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLivePerformEvidenceTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLivePerformEvidenceTheorems (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS =="
  IO.println s!"  host={hostId} file={livePerformEvidenceTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / livePerformEvidenceTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {livePerformEvidenceTheoremsRel}"
    throw (IO.userError s!"missing {livePerformEvidenceTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != livePerformEvidenceTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk PerformEvidenceTheorems.lean != livePerformEvidenceTheoremsSource"
    throw (IO.userError "dual-pin mismatch live PerformEvidenceTheorems.lean")
  let r := parseLivePerformEvidenceTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PERFORM-EVIDENCE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live PerformEvidenceTheorems parse false"
      throw (IO.userError "kernelCheck live PerformEvidenceTheorems parse false")
    unless hostFrontLivePerformEvidenceTheoremsReady do
      IO.eprintln "error: hostFrontLivePerformEvidenceTheoremsReady false"
      let toks := tokenizeHostTerm
        (stripComments livePerformEvidenceTheoremsSource)
      let fuel := livePerformEvidenceTheoremsSkipFuel
      IO.eprintln s!"diag theoremTok={toksCountKw fuel toks "theorem" 0} exampleTok={toksCountKw fuel toks "example" 0} setoptTok={toksCountKw fuel toks "set_option" 0}"
      match livePerformEvidenceTheoremsParsed? with
      | none => IO.eprintln "diag parsed=none"
      | some pm => IO.eprintln s!"diag parsedCmds={pm.commands.length}"
      IO.eprintln s!"diag cmdCount={liveParseCmdCountOk} noDef={liveParseHasNoKeptDef} module={liveParseHasPerformEvidenceModule} ns={liveParseHasPerformEvidenceNs} endNs={liveParseHasPerformEvidenceEnd} import={liveParseHasPerformEvidenceImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLivePerformEvidenceTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty PerformEvidenceTheorems source was accepted"
      throw (IO.userError "empty PerformEvidenceTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLivePerformEvidenceTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLivePerformEvidenceTheorems
