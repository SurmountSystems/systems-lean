/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/OfficialPathAlternateTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  This wrap is OfficialPathAlternateTheorems.lean.
  It is not OfficialPathAlternate.lean.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem productPathFreestandingPerformClaimed_false is a product pin
  in the source file. It is not this wrap's provably flag and not FullHost.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_THEOREMS_V0,
  PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS,
  OFFICIAL-PATH-ALTERNATE-THEOREM, liveRel,
  kernelCheckLiveOfficialPathAlternateTheoremsSource,
  hostFrontLiveOfficialPathAlternateTheoremsReady.
  Module: SystemsLean.HostFrontLiveOfficialPathAlternateTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveOfficialPathAlternateTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveOfficialPathAlternateTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "OfficialPathAlternateTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveOfficialPathAlternateTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveOfficialPathAlternateTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveOfficialPathAlternateTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveOfficialPathAlternateTheoremsResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY.
    The live file's productPathFreestandingPerformClaimed_false theorem is not
    this flag. -/
def hostFrontLiveOfficialPathAlternateTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveOfficialPathAlternateTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveOfficialPathAlternateTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From OfficialPathAlternateTheorems.lean, not a copied lower bound. -/
def liveOfficialPathAlternateTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveOfficialPathAlternateTheoremsTheoremCount : Nat := 32

/-- Example smokes in the live file (skipped). -/
def liveOfficialPathAlternateTheoremsExampleCount : Nat := 21

/-- set_option lines in the live file (skipped). This file has none. -/
def liveOfficialPathAlternateTheoremsSetOptionCount : Nat := 0

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
def cmdAddsOfficialPathAlternateTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownOfficialPathAlternateTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathAlternateTheoremsParseFuel body
        && termNoAppN liveOfficialPathAlternateTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveOfficialPathAlternateTheoremsParseFuel body
        && termNoAppN liveOfficialPathAlternateTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdOfficialPathAlternateTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsOfficialPathAlternateTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdOfficialPathAlternateTheorems
        liveOfficialPathAlternateTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveOfficialPathAlternateTheoremsSkipFuel rest
      if cmdBodyKnownOfficialPathAlternateTheorems kn c then
        parseCmdsOfficialPathAlternateTheorems n rest2
          (kn ++ cmdAddsOfficialPathAlternateTheorems c) (acc ++ [c])
      else
        parseCmdsOfficialPathAlternateTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 :=
            skipUntilCmd liveOfficialPathAlternateTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsOfficialPathAlternateTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `theorem` named `nm` even though the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    if t == nm then true else toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live OfficialPathAlternateTheorems.lean text.
    Greppable: parseLiveOfficialPathAlternateTheoremsSource,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS. -/
def parseLiveOfficialPathAlternateTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsOfficialPathAlternateTheorems
        liveOfficialPathAlternateTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.OfficialPathAlternateTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live OfficialPathAlternateTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveOfficialPathAlternateTheoremsSource,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS. -/
def kernelCheckLiveOfficialPathAlternateTheoremsSource (src : String) : Bool :=
  match parseLiveOfficialPathAlternateTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveOfficialPathAlternateTheoremsParsed? : Option Module :=
  match parseLiveOfficialPathAlternateTheoremsSource
      liveOfficialPathAlternateTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | some m =>
    m.commands.length == liveOfficialPathAlternateTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is OfficialPathAlternateTheorems
    (no module line in the live file). -/
def liveParseHasOfficialPathAlternateTheoremsModule : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.OfficialPathAlternateTheorems"
      && lastSeg m.name.raw == "OfficialPathAlternateTheorems"

/-- Live parse has namespace SystemsLean.OfficialPathAlternate.
    The theorems file shares the parent namespace. It is not
    namespace SystemsLean.OfficialPathAlternateTheorems. -/
def liveParseHasOfficialPathAlternateNs : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.OfficialPathAlternate"
      | _ => false

/-- Live parse ends namespace SystemsLean.OfficialPathAlternate. -/
def liveParseHasOfficialPathAlternateEnd : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.OfficialPathAlternate"
      | _ => false

/-- Live parse imports SystemsLean.OfficialPathAlternate. One import only. -/
def liveParseHasOfficialPathAlternateImport : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.OfficialPathAlternate"
      | _ => false

/-- Skip-head still sees each theorem name from OfficialPathAlternateTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveOfficialPathAlternateTheoremsSource)
    let fuel := liveOfficialPathAlternateTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformOfficialPathAlternateMeasured_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathAlternateWriterPresent_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathAlternateNotOfficial_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathDualEqualityBlocksRetirement_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformClaimed_false"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathStillUsesFreestandingEmit_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathStillUsesLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathRetireFreestandingEmitRequired_true"
      && toksHaveTheoremNamed fuel toks
        "productPathPerformDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformOfficialPathGapMeasured_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformOfficialPathAlternateOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformOfficialPathAlternatePartialReady_true"
      && toksHaveTheoremNamed fuel toks "officialPathAlternateId_eq"
      && toksHaveTheoremNamed fuel toks "officialPathAlternateWriterId_eq"
      && toksHaveTheoremNamed fuel toks "officialPathAlternateNotOfficialId_eq"
      && toksHaveTheoremNamed fuel toks "officialPathDualEqualityBlocksId_eq"
      && toksHaveTheoremNamed fuel toks
        "fullBarReqPerformClaimedWithEvidence_eq"
      && toksHaveTheoremNamed fuel toks "lakeFreeAlternateRecipe_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justMeasureRecipe_eq"
      && toksHaveTheoremNamed fuel toks "officialPathRecipe_eq"
      && toksHaveTheoremNamed fuel toks "officialPathLakeWriter_eq"
      && toksHaveTheoremNamed fuel toks "officialPathLakeExe_eq"
      && toksHaveTheoremNamed fuel toks "alternateWriterRecipe_eq"
      && toksHaveTheoremNamed fuel toks "alternateWriterApi_eq"
      && toksHaveTheoremNamed fuel toks "alternateWriterPipeline_eq"
      && toksHaveTheoremNamed fuel toks "alternateWriterModule_eq"
      && toksHaveTheoremNamed fuel toks "b32OfficialPathRecipe_eq"

/-- Keyword counts match this file: 32 theorems, 21 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveOfficialPathAlternateTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveOfficialPathAlternateTheoremsSource)
    let fuel := liveOfficialPathAlternateTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveOfficialPathAlternateTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveOfficialPathAlternateTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveOfficialPathAlternateTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.OfficialPathAlternate\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.OfficialPathAlternate\n"

/-- theorem stageId_eq header needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem productPathFreestandingPerformClaimed_false header needle. -/
def needlePerformClaimedFalse : String :=
  "theorem productPathFreestandingPerformClaimed_false :\n"

/-- theorem productPathFreestandingPerformOfficialPathAlternateOk_true header. -/
def needleOkTrue : String :=
  "theorem productPathFreestandingPerformOfficialPathAlternateOk_true :\n"

/-- theorem PartialReady header needle with a trailing newline. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingPerformOfficialPathAlternatePartialReady_true :\n"

/-- theorem b32OfficialPathRecipe_eq header needle with a trailing newline. -/
def needleB32Recipe : String := "theorem b32OfficialPathRecipe_eq :\n"

/-- Example official path recipe needle with a trailing newline. -/
def needleExampleRecipe : String :=
  "example : officialPathRecipe = \"build\" := by decide\n"

/-- Example official path Lake writer needle with a trailing newline. -/
def needleExampleLakeWriter : String :=
  "example : officialPathLakeWriter = \"FreestandingEmit\" := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.OfficialPathAlternate\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.OfficialPathAlternateTheorems. No set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveOfficialPathAlternateTheoremsSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needlePerformClaimedFalse).length > 1
    && (src.splitOn needleOkTrue).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleB32Recipe).length > 1
    && (src.splitOn needleExampleRecipe).length > 1
    && (src.splitOn needleExampleLakeWriter).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveOfficialPathAlternateTheoremsReady,
    PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS,
    HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveOfficialPathAlternateTheoremsReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_OFFICIAL_PATH_ALTERNATE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS")
    && (parseId == "PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS")
    && (liveRel == "OfficialPathAlternateTheorems.lean")
    && (liveOfficialPathAlternateTheoremsRel
      == "src/systems/SystemsLean/OfficialPathAlternateTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveOfficialPathAlternateTheoremsFullHost
    && !hostFrontLiveOfficialPathAlternateTheoremsFullBackend
    && !hostFrontLiveOfficialPathAlternateTheoremsResidualFreeClaimed
    && !hostFrontLiveOfficialPathAlternateTheoremsProvablyUnlocked
    && kernelCheckLiveOfficialPathAlternateTheoremsSource
      liveOfficialPathAlternateTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasOfficialPathAlternateTheoremsModule
    && liveParseHasOfficialPathAlternateNs
    && liveParseHasOfficialPathAlternateEnd
    && liveParseHasOfficialPathAlternateImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveOfficialPathAlternateTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveOfficialPathAlternateTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveOfficialPathAlternateTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveOfficialPathAlternateTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveOfficialPathAlternateTheoremsRel}"
    throw (IO.userError s!"missing {liveOfficialPathAlternateTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveOfficialPathAlternateTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk OfficialPathAlternateTheorems.lean != liveOfficialPathAlternateTheoremsSource"
    throw (IO.userError "dual-pin mismatch live OfficialPathAlternateTheorems.lean")
  let r := parseLiveOfficialPathAlternateTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-OFFICIAL-PATH-ALTERNATE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live OfficialPathAlternateTheorems parse false"
      throw (IO.userError "kernelCheck live OfficialPathAlternateTheorems parse false")
    unless hostFrontLiveOfficialPathAlternateTheoremsReady do
      IO.eprintln "error: hostFrontLiveOfficialPathAlternateTheoremsReady false"
      throw (IO.userError "hostFrontLiveOfficialPathAlternateTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty OfficialPathAlternateTheorems source was accepted"
      throw (IO.userError "empty OfficialPathAlternateTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveOfficialPathAlternateTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveOfficialPathAlternateTheorems
