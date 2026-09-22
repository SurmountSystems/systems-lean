/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SelfHostCompleteTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  This wrap is SelfHostCompleteTheorems.lean. It is not SelfHostComplete.lean.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorems residualFreeClaimed_true and provablyUnlocked_true are
  product pins in the source file. They are not this wrap's flags and not FullHost.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SELF-HOST-COMPLETE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_COMPLETE_THEOREMS_V0,
  PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS, COMPLETE-THEOREM, liveRel,
  kernelCheckLiveSelfHostCompleteTheoremsSource,
  hostFrontLiveSelfHostCompleteTheoremsReady.
  Module: SystemsLean.HostFrontLiveSelfHostCompleteTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfHostCompleteTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfHostCompleteTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SELF_HOST_COMPLETE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELF-HOST-COMPLETE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is defined in HostFrontLiveSelfHostCompleteTheoremsSource. -/
def liveSelfHostCompleteTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfHostCompleteTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveSelfHostCompleteTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free.
    The live theorem residualFreeClaimed_true is not this flag. -/
def hostFrontLiveSelfHostCompleteTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live theorem provablyUnlocked_true is not this flag. -/
def hostFrontLiveSelfHostCompleteTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSelfHostCompleteTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveSelfHostCompleteTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From SelfHostCompleteTheorems.lean, not a copied lower bound. -/
def liveSelfHostCompleteTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveSelfHostCompleteTheoremsTheoremCount : Nat := 29

/-- Example smokes in the live file (skipped). -/
def liveSelfHostCompleteTheoremsExampleCount : Nat := 23

/-- set_option lines in the live file (skipped). This file has none. -/
def liveSelfHostCompleteTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . SelfHostComplete`. -/
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
def cmdAddsSelfHostCompleteTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownSelfHostCompleteTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostCompleteTheoremsParseFuel body
        && termNoAppN liveSelfHostCompleteTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostCompleteTheoremsParseFuel body
        && termNoAppN liveSelfHostCompleteTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdSelfHostCompleteTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsSelfHostCompleteTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSelfHostCompleteTheorems
        liveSelfHostCompleteTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSelfHostCompleteTheoremsSkipFuel rest
      if cmdBodyKnownSelfHostCompleteTheorems kn c then
        parseCmdsSelfHostCompleteTheorems n rest2
          (kn ++ cmdAddsSelfHostCompleteTheorems c) (acc ++ [c])
      else
        parseCmdsSelfHostCompleteTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSelfHostCompleteTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSelfHostCompleteTheorems n rest2 kn acc
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

/-- Parse live SelfHostCompleteTheorems.lean text.
    Greppable: parseLiveSelfHostCompleteTheoremsSource,
    PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS. -/
def parseLiveSelfHostCompleteTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfHostCompleteTheorems liveSelfHostCompleteTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfHostCompleteTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfHostCompleteTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveSelfHostCompleteTheoremsSource,
    PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS. -/
def kernelCheckLiveSelfHostCompleteTheoremsSource (src : String) : Bool :=
  match parseLiveSelfHostCompleteTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfHostCompleteTheoremsParsed? : Option Module :=
  match parseLiveSelfHostCompleteTheoremsSource liveSelfHostCompleteTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | some m => m.commands.length == liveSelfHostCompleteTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is SelfHostCompleteTheorems (no module line in the live file). -/
def liveParseHasSelfHostCompleteTheoremsModule : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.SelfHostCompleteTheorems"
      && lastSeg m.name.raw == "SelfHostCompleteTheorems"

/-- Live parse has namespace SystemsLean.SelfHostComplete.
    The theorems file shares the parent namespace. It is not
    namespace SystemsLean.SelfHostCompleteTheorems. -/
def liveParseHasSelfHostCompleteNs : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.SelfHostComplete"
      | _ => false

/-- Live parse ends namespace SystemsLean.SelfHostComplete. -/
def liveParseHasSelfHostCompleteEnd : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.SelfHostComplete"
      | _ => false

/-- Live parse imports SystemsLean.SelfHostComplete. One import only. -/
def liveParseHasSelfHostCompleteImport : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.SelfHostComplete"
      | _ => false

/-- Skip-head still sees each theorem name from SelfHostCompleteTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveSelfHostCompleteTheoremsSource)
    let fuel := liveSelfHostCompleteTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostCompleteMeasured_true"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostCompleteStepAdvanced_true"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostComplete_true"
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
      && toksHaveTheoremNamed fuel toks "residualFreeClaimed_true"
      && toksHaveTheoremNamed fuel toks "llvmUnlocked_false"
      && toksHaveTheoremNamed fuel toks "provablyUnlocked_true"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostCompleteOk_true"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostCompletePartialReady_true"
      && toksHaveTheoremNamed fuel toks "completeId_eq"
      && toksHaveTheoremNamed fuel toks "completeMeasuredId_eq"
      && toksHaveTheoremNamed fuel toks
        "completeWithFullOwnershipPerformDualEqWriteId_eq"
      && toksHaveTheoremNamed fuel toks "completeStepAdvancedId_eq"
      && toksHaveTheoremNamed fuel toks "lakeFreeCompleteRecipe_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justMeasureRecipe_eq"
      && toksHaveTheoremNamed fuel toks "officialPathWriter_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityGateId_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityApiName_eq"
      && toksHaveTheoremNamed fuel toks "capableWriteModule_eq"

/-- Keyword counts match this file: 29 theorems, 23 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveSelfHostCompleteTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveSelfHostCompleteTheoremsSource)
    let fuel := liveSelfHostCompleteTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveSelfHostCompleteTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveSelfHostCompleteTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveSelfHostCompleteTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.SelfHostComplete\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.SelfHostComplete\n"

/-- theorem stageId_eq header needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- stageId body needle with a trailing newline. -/
def needleStageIdBody : String :=
  "    stageId = \"SLAKE_SELF_HOST_FREESTANDING_PRODUCT_COMPLETE_V0\" := rfl\n"

/-- theorem stepContractFull_true needle with a trailing newline. -/
def needleStepContractFullTrue : String :=
  "theorem stepContractFull_true : stepContractFull = true := rfl\n"

/-- theorem freestandingProductSelfHostComplete_true header needle. -/
def needleCompleteTrue : String :=
  "theorem freestandingProductSelfHostComplete_true :\n"

/-- theorem freestandingProductSelfHostCompleteOk_true header needle. -/
def needleOkTrue : String :=
  "theorem freestandingProductSelfHostCompleteOk_true :\n"

/-- theorem freestandingProductSelfHostCompletePartialReady_true header needle. -/
def needlePartialReady : String :=
  "theorem freestandingProductSelfHostCompletePartialReady_true :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleStep : String :=
  "example : stepContractFull = true := by decide\n"

/-- Example host id needle with a trailing newline. -/
def needleExampleHost : String :=
  "example : hostId = \"HOST-SELF-HOST-FREESTANDING-PRODUCT-COMPLETE\" := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.SelfHostComplete\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.SelfHostCompleteTheorems. No set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveSelfHostCompleteTheoremsSource
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
    Greppable: hostFrontLiveSelfHostCompleteTheoremsReady,
    PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS,
    HOST-FRONT-LIVE-SELF-HOST-COMPLETE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveSelfHostCompleteTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SELF_HOST_COMPLETE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-SELF-HOST-COMPLETE-THEOREMS")
    && (parseId == "PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS")
    && (liveRel == "SelfHostCompleteTheorems.lean")
    && (liveSelfHostCompleteTheoremsRel
      == "src/systems/SystemsLean/SelfHostCompleteTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSelfHostCompleteTheoremsFullHost
    && !hostFrontLiveSelfHostCompleteTheoremsFullBackend
    && !hostFrontLiveSelfHostCompleteTheoremsResidualFreeClaimed
    && !hostFrontLiveSelfHostCompleteTheoremsProvablyUnlocked
    && kernelCheckLiveSelfHostCompleteTheoremsSource liveSelfHostCompleteTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasSelfHostCompleteTheoremsModule
    && liveParseHasSelfHostCompleteNs
    && liveParseHasSelfHostCompleteEnd
    && liveParseHasSelfHostCompleteImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfHostCompleteTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveSelfHostCompleteTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveSelfHostCompleteTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveSelfHostCompleteTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSelfHostCompleteTheoremsRel}"
    throw (IO.userError s!"missing {liveSelfHostCompleteTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSelfHostCompleteTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfHostCompleteTheorems.lean != liveSelfHostCompleteTheoremsSource"
    throw (IO.userError "dual-pin mismatch live SelfHostCompleteTheorems.lean")
  let r := parseLiveSelfHostCompleteTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELF-HOST-COMPLETE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfHostCompleteTheorems parse false"
      throw (IO.userError "kernelCheck live SelfHostCompleteTheorems parse false")
    unless hostFrontLiveSelfHostCompleteTheoremsReady do
      IO.eprintln "error: hostFrontLiveSelfHostCompleteTheoremsReady false"
      throw (IO.userError "hostFrontLiveSelfHostCompleteTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty SelfHostCompleteTheorems source was accepted"
      throw (IO.userError "empty SelfHostCompleteTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfHostCompleteTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfHostCompleteTheorems
