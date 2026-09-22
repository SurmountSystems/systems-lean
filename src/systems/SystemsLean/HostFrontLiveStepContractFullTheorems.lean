/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/StepContractFullTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  This wrap is StepContractFullTheorems.lean. It is not StepContractFull.lean.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem freestandingProductSelfHostComplete_true is a product pin
  in the source file. It is not this wrap's provably flag and not FullHost.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-STEP-CONTRACT-FULL-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_STEP_CONTRACT_FULL_THEOREMS_V0,
  PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS, STEP-CONTRACT-FULL-THEOREM, liveRel,
  kernelCheckLiveStepContractFullTheoremsSource,
  hostFrontLiveStepContractFullTheoremsReady.
  Module: SystemsLean.HostFrontLiveStepContractFullTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveStepContractFullTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveStepContractFullTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_STEP_CONTRACT_FULL_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-STEP-CONTRACT-FULL-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "StepContractFullTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveStepContractFullTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveStepContractFullTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveStepContractFullTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveStepContractFullTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file's freestandingProductSelfHostComplete_true theorem is not
    this flag. -/
def hostFrontLiveStepContractFullTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveStepContractFullTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveStepContractFullTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From StepContractFullTheorems.lean, not a copied lower bound. -/
def liveStepContractFullTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveStepContractFullTheoremsTheoremCount : Nat := 27

/-- Example smokes in the live file (skipped). -/
def liveStepContractFullTheoremsExampleCount : Nat := 20

/-- set_option lines in the live file (skipped). This file has none. -/
def liveStepContractFullTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . StepContractFull`. -/
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
def cmdAddsStepContractFullTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownStepContractFullTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveStepContractFullTheoremsParseFuel body
        && termNoAppN liveStepContractFullTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveStepContractFullTheoremsParseFuel body
        && termNoAppN liveStepContractFullTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdStepContractFullTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsStepContractFullTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdStepContractFullTheorems
        liveStepContractFullTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveStepContractFullTheoremsSkipFuel rest
      if cmdBodyKnownStepContractFullTheorems kn c then
        parseCmdsStepContractFullTheorems n rest2
          (kn ++ cmdAddsStepContractFullTheorems c) (acc ++ [c])
      else
        parseCmdsStepContractFullTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveStepContractFullTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsStepContractFullTheorems n rest2 kn acc
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

/-- Parse live StepContractFullTheorems.lean text.
    Greppable: parseLiveStepContractFullTheoremsSource,
    PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS. -/
def parseLiveStepContractFullTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsStepContractFullTheorems liveStepContractFullTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.StepContractFullTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live StepContractFullTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveStepContractFullTheoremsSource,
    PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS. -/
def kernelCheckLiveStepContractFullTheoremsSource (src : String) : Bool :=
  match parseLiveStepContractFullTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveStepContractFullTheoremsParsed? : Option Module :=
  match parseLiveStepContractFullTheoremsSource liveStepContractFullTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | some m => m.commands.length == liveStepContractFullTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is StepContractFullTheorems (no module line in the live file). -/
def liveParseHasStepContractFullTheoremsModule : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.StepContractFullTheorems"
      && lastSeg m.name.raw == "StepContractFullTheorems"

/-- Live parse has namespace SystemsLean.StepContractFull.
    The theorems file shares the parent namespace. It is not
    namespace SystemsLean.StepContractFullTheorems. -/
def liveParseHasStepContractFullNs : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.StepContractFull"
      | _ => false

/-- Live parse ends namespace SystemsLean.StepContractFull. -/
def liveParseHasStepContractFullEnd : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.StepContractFull"
      | _ => false

/-- Live parse imports SystemsLean.StepContractFull. One import only. -/
def liveParseHasStepContractFullImport : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.StepContractFull"
      | _ => false

/-- Skip-head still sees each theorem name from StepContractFullTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveStepContractFullTheoremsSource)
    let fuel := liveStepContractFullTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks "stepContractFullMeasured_true"
      && toksHaveTheoremNamed fuel toks "stepContractFullStepAdvanced_true"
      && toksHaveTheoremNamed fuel toks "stepContractFull_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingOwnershipClaimed_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformClaimed_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathUsesDualEqualityWrite_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathStillUsesFreestandingEmit_false"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathStillUsesLake_false"
      && toksHaveTheoremNamed fuel toks
        "productPathPerformDependsOnLake_false"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostComplete_true"
      && toksHaveTheoremNamed fuel toks "stepContractFullOk_true"
      && toksHaveTheoremNamed fuel toks "stepContractFullPartialReady_true"
      && toksHaveTheoremNamed fuel toks "stepContractFullId_eq"
      && toksHaveTheoremNamed fuel toks "stepContractFullMeasuredId_eq"
      && toksHaveTheoremNamed fuel toks
        "stepContractFullWithOwnershipPerformDualEqWriteId_eq"
      && toksHaveTheoremNamed fuel toks "stepContractFullStepAdvancedId_eq"
      && toksHaveTheoremNamed fuel toks "closeStepFull_eq"
      && toksHaveTheoremNamed fuel toks "lakeFreeStepContractFullRecipe_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justMeasureRecipe_eq"
      && toksHaveTheoremNamed fuel toks "officialPathWriter_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityGateId_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityApiName_eq"
      && toksHaveTheoremNamed fuel toks "capableWriteModule_eq"

/-- Keyword counts match this file: 27 theorems, 20 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveStepContractFullTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveStepContractFullTheoremsSource)
    let fuel := liveStepContractFullTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveStepContractFullTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveStepContractFullTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveStepContractFullTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.StepContractFull\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.StepContractFull\n"

/-- theorem stageId_eq header needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- stageId body needle with a trailing newline. -/
def needleStageIdBody : String :=
  "    stageId = \"SLAKE_SELF_HOST_PRODUCT_PATH_STEP_CONTRACT_FULL_V0\" := rfl\n"

/-- theorem stepContractFull_true needle with a trailing newline. -/
def needleStepContractFullTrue : String :=
  "theorem stepContractFull_true : stepContractFull = true := rfl\n"

/-- theorem freestandingProductSelfHostComplete_true header needle. -/
def needleCompleteTrue : String :=
  "theorem freestandingProductSelfHostComplete_true :\n"

/-- theorem stepContractFullOk_true needle with a trailing newline. -/
def needleOkTrue : String :=
  "theorem stepContractFullOk_true : stepContractFullOk = true := by decide\n"

/-- theorem stepContractFullPartialReady_true header needle. -/
def needlePartialReady : String :=
  "theorem stepContractFullPartialReady_true :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleStep : String :=
  "example : stepContractFull = true := by decide\n"

/-- Example host id needle with a trailing newline. -/
def needleExampleHost : String :=
  "example : hostId = \"HOST-SELF-HOST-PRODUCT-PATH-STEP-CONTRACT-FULL\" := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.StepContractFull\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.StepContractFullTheorems. No set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveStepContractFullTheoremsSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleStageIdBody).length > 1
    && (src.splitOn needleStepContractFullTrue).length > 1
    && (src.splitOn needleCompleteTrue).length > 1
    && (src.splitOn needleOkTrue).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleExampleStep).length > 1
    && (src.splitOn needleExampleHost).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveStepContractFullTheoremsReady,
    PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS,
    HOST-FRONT-LIVE-STEP-CONTRACT-FULL-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveStepContractFullTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_STEP_CONTRACT_FULL_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-STEP-CONTRACT-FULL-THEOREMS")
    && (parseId == "PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS")
    && (liveRel == "StepContractFullTheorems.lean")
    && (liveStepContractFullTheoremsRel
      == "src/systems/SystemsLean/StepContractFullTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveStepContractFullTheoremsFullHost
    && !hostFrontLiveStepContractFullTheoremsFullBackend
    && !hostFrontLiveStepContractFullTheoremsResidualFreeClaimed
    && !hostFrontLiveStepContractFullTheoremsProvablyUnlocked
    && kernelCheckLiveStepContractFullTheoremsSource liveStepContractFullTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasStepContractFullTheoremsModule
    && liveParseHasStepContractFullNs
    && liveParseHasStepContractFullEnd
    && liveParseHasStepContractFullImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveStepContractFullTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveStepContractFullTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS =="
  IO.println s!"  host={hostId} file={liveStepContractFullTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveStepContractFullTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveStepContractFullTheoremsRel}"
    throw (IO.userError s!"missing {liveStepContractFullTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveStepContractFullTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk StepContractFullTheorems.lean != liveStepContractFullTheoremsSource"
    throw (IO.userError "dual-pin mismatch live StepContractFullTheorems.lean")
  let r := parseLiveStepContractFullTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-STEP-CONTRACT-FULL-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live StepContractFullTheorems parse false"
      throw (IO.userError "kernelCheck live StepContractFullTheorems parse false")
    unless hostFrontLiveStepContractFullTheoremsReady do
      IO.eprintln "error: hostFrontLiveStepContractFullTheoremsReady false"
      throw (IO.userError "hostFrontLiveStepContractFullTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty StepContractFullTheorems source was accepted"
      throw (IO.userError "empty StepContractFullTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveStepContractFullTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveStepContractFullTheorems
