/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/DualEqWriteCapableGapTheorems.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is DualEqWriteCapableGapTheorems.lean.
  It is not DualEqWriteCapableGap.lean.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  The live namespace is SystemsLean.DualEqWriteCapableGap (same namespace as
  the parent module). The wrap module name is
  SystemsLean.DualEqWriteCapableGapTheorems.
  Not a backend. FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  These CAPABLE-GAP theorems do not flip this wrap's provably flag.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CAPABLE_GAP_THEOREMS_V0,
  PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS, CAPABLE-GAP-THEOREM,
  liveRel, kernelCheckLiveDualEqWriteCapableGapTheoremsSource,
  hostFrontLiveDualEqWriteCapableGapTheoremsReady.
  Module: SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveDualEqWriteCapableGapTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CAPABLE_GAP_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "DualEqWriteCapableGapTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteCapableGapTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveDualEqWriteCapableGapTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not a backend. FullBackend stays false. -/
def hostFrontLiveDualEqWriteCapableGapTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveDualEqWriteCapableGapTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live CAPABLE-GAP theorems do not flip this flag. -/
def hostFrontLiveDualEqWriteCapableGapTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveDualEqWriteCapableGapTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveDualEqWriteCapableGapTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From DualEqWriteCapableGapTheorems.lean. Theorems are not kept. -/
def liveDualEqWriteCapableGapTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveDualEqWriteCapableGapTheoremsTheoremCount : Nat := 28

/-- Example smokes in the live file (skipped). -/
def liveDualEqWriteCapableGapTheoremsExampleCount : Nat := 21

/-- set_option lines in the live file (skipped). -/
def liveDualEqWriteCapableGapTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . DualEqWriteCapableGap`. -/
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
def cmdAddsDualEqWriteCapableGapTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownDualEqWriteCapableGapTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteCapableGapTheoremsParseFuel body
        && termNoAppN liveDualEqWriteCapableGapTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteCapableGapTheoremsParseFuel body
        && termNoAppN liveDualEqWriteCapableGapTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdDualEqWriteCapableGapTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsDualEqWriteCapableGapTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdDualEqWriteCapableGapTheorems
        liveDualEqWriteCapableGapTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveDualEqWriteCapableGapTheoremsSkipFuel rest
      if cmdBodyKnownDualEqWriteCapableGapTheorems kn c then
        parseCmdsDualEqWriteCapableGapTheorems n rest2
          (kn ++ cmdAddsDualEqWriteCapableGapTheorems c) (acc ++ [c])
      else
        parseCmdsDualEqWriteCapableGapTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveDualEqWriteCapableGapTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsDualEqWriteCapableGapTheorems n rest2 kn acc
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

/-- Parse live DualEqWriteCapableGapTheorems.lean text.
    Greppable: parseLiveDualEqWriteCapableGapTheoremsSource,
    PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS. -/
def parseLiveDualEqWriteCapableGapTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsDualEqWriteCapableGapTheorems
        liveDualEqWriteCapableGapTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.DualEqWriteCapableGapTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live DualEqWriteCapableGapTheorems parse. Not a fixture.
    Calls HostKernel.kernelCheck. Does not stub kernelCheck.
    Greppable: kernelCheckLiveDualEqWriteCapableGapTheoremsSource,
    PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS. -/
def kernelCheckLiveDualEqWriteCapableGapTheoremsSource (src : String) : Bool :=
  match parseLiveDualEqWriteCapableGapTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveDualEqWriteCapableGapTheoremsParsed? : Option Module :=
  match parseLiveDualEqWriteCapableGapTheoremsSource
      liveDualEqWriteCapableGapTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | some m =>
    m.commands.length == liveDualEqWriteCapableGapTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is DualEqWriteCapableGapTheorems
    (no module line in the live file). -/
def liveParseHasDualEqWriteCapableGapTheoremsModule : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.DualEqWriteCapableGapTheorems"
      && lastSeg m.name.raw == "DualEqWriteCapableGapTheorems"

/-- Live parse has namespace SystemsLean.DualEqWriteCapableGap. -/
def liveParseHasDualEqWriteCapableGapNs : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.DualEqWriteCapableGap"
      | _ => false

/-- Live parse ends namespace SystemsLean.DualEqWriteCapableGap. -/
def liveParseHasDualEqWriteCapableGapEnd : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.DualEqWriteCapableGap"
      | _ => false

/-- Live parse imports SystemsLean.DualEqWriteCapableGap. -/
def liveParseHasDualEqWriteCapableGapImport : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.DualEqWriteCapableGap"
      | _ => false

/-- Skip-head still sees each theorem name from
    DualEqWriteCapableGapTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveDualEqWriteCapableGapTheoremsSource)
    let fuel := liveDualEqWriteCapableGapTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true"
      && toksHaveTheoremNamed fuel toks
        "productPathDualEqualityWriteCapableGapClosed_true"
      && toksHaveTheoremNamed fuel toks
        "productPathCapableWriteDualEqualityLive_true"
      && toksHaveTheoremNamed fuel toks
        "productPathDualEqualityWriteCapableGapStepAdvanced_true"
      && toksHaveTheoremNamed fuel toks
        "productPathDualEqualityWriteParityGapOpen_false"
      && toksHaveTheoremNamed fuel toks
        "productPathCapableWriteStructuralNotDualEquality_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformClaimed_false"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathStillUsesFreestandingEmit_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathDualEqualityBlocksRetirement_true"
      && toksHaveTheoremNamed fuel toks
        "productPathPerformDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformDualEqualityWriteCapableGapOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true"
      && toksHaveTheoremNamed fuel toks "dualEqualityWriteCapableGapId_eq"
      && toksHaveTheoremNamed fuel toks
        "dualEqualityWriteCapableGapClosedId_eq"
      && toksHaveTheoremNamed fuel toks
        "dualEqualityWriteCapableGapDualEqLiveId_eq"
      && toksHaveTheoremNamed fuel toks
        "dualEqualityWriteCapableGapStepAdvancedId_eq"
      && toksHaveTheoremNamed fuel toks "closeStepCapableGap_eq"
      && toksHaveTheoremNamed fuel toks "lakeFreeCapableGapRecipe_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justMeasureRecipe_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityGateId_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityApiName_eq"
      && toksHaveTheoremNamed fuel toks "capableWriteModule_eq"
      && toksHaveTheoremNamed fuel toks "capableWriteApi_eq"

/-- Keyword counts match this file: 28 theorems, 21 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveDualEqWriteCapableGapTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveDualEqWriteCapableGapTheoremsSource)
    let fuel := liveDualEqWriteCapableGapTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveDualEqWriteCapableGapTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveDualEqWriteCapableGapTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveDualEqWriteCapableGapTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.DualEqWriteCapableGap\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.DualEqWriteCapableGap\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem hostId_eq needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- theorem selfHostId_eq needle with a trailing newline. -/
def needleSelfHostIdEq : String := "theorem selfHostId_eq :\n"

/-- theorem measured pin needle with a trailing newline. -/
def needleMeasured : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteCapableGapMeasured_true :\n"

/-- theorem gap closed needle with a trailing newline. -/
def needleGapClosed : String :=
  "theorem productPathDualEqualityWriteCapableGapClosed_true :\n"

/-- theorem perform claimed false needle with a trailing newline. -/
def needlePerformClaimed : String :=
  "theorem productPathFreestandingPerformClaimed_false :\n"

/-- theorem Ok fold needle with a trailing newline. -/
def needleOk : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteCapableGapOk_true :\n"

/-- theorem PartialReady fold needle with a trailing newline. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteCapableGapPartialReady_true :\n"

/-- theorem capable gap id needle with a trailing newline. -/
def needleGapId : String := "theorem dualEqualityWriteCapableGapId_eq :\n"

/-- theorem lake-free recipe needle with a trailing newline. -/
def needleLakeFree : String := "theorem lakeFreeCapableGapRecipe_eq :\n"

/-- theorem lake exe name needle with a trailing newline. -/
def needleLakeExe : String := "theorem lakeExeName_eq :\n"

/-- theorem just measure recipe needle with a trailing newline. -/
def needleJustMeasure : String := "theorem justMeasureRecipe_eq :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleClosed : String :=
  "example : productPathDualEqualityWriteCapableGapClosed = true := by decide\n"

/-- Example gate id needle with a trailing newline. -/
def needleExampleGate : String :=
  "example : dualEqualityGateId = \"DUAL-SSOT-EQUALITY\" := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.DualEqWriteCapableGap\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option is a kept command. -/
def liveNeedlesOk : Bool :=
  let src := liveDualEqWriteCapableGapTheoremsSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleSelfHostIdEq).length > 1
    && (src.splitOn needleMeasured).length > 1
    && (src.splitOn needleGapClosed).length > 1
    && (src.splitOn needlePerformClaimed).length > 1
    && (src.splitOn needleOk).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleGapId).length > 1
    && (src.splitOn needleLakeFree).length > 1
    && (src.splitOn needleLakeExe).length > 1
    && (src.splitOn needleJustMeasure).length > 1
    && (src.splitOn needleExampleClosed).length > 1
    && (src.splitOn needleExampleGate).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveDualEqWriteCapableGapTheoremsReady,
    PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS,
    HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveDualEqWriteCapableGapTheoremsReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_CAPABLE_GAP_THEOREMS_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS")
    && (parseId == "PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS")
    && (liveRel == "DualEqWriteCapableGapTheorems.lean")
    && (liveDualEqWriteCapableGapTheoremsRel
      == "src/systems/SystemsLean/DualEqWriteCapableGapTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveDualEqWriteCapableGapTheoremsFullHost
    && !hostFrontLiveDualEqWriteCapableGapTheoremsFullBackend
    && !hostFrontLiveDualEqWriteCapableGapTheoremsResidualFreeClaimed
    && !hostFrontLiveDualEqWriteCapableGapTheoremsProvablyUnlocked
    && kernelCheckLiveDualEqWriteCapableGapTheoremsSource
      liveDualEqWriteCapableGapTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasDualEqWriteCapableGapTheoremsModule
    && liveParseHasDualEqWriteCapableGapNs
    && liveParseHasDualEqWriteCapableGapEnd
    && liveParseHasDualEqWriteCapableGapImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveDualEqWriteCapableGapTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveDualEqWriteCapableGapTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS =="
  IO.println s!"  host={hostId} file={liveDualEqWriteCapableGapTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveDualEqWriteCapableGapTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveDualEqWriteCapableGapTheoremsRel}"
    throw (IO.userError s!"missing {liveDualEqWriteCapableGapTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveDualEqWriteCapableGapTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk DualEqWriteCapableGapTheorems.lean != liveDualEqWriteCapableGapTheoremsSource"
    throw (IO.userError "dual-pin mismatch live DualEqWriteCapableGapTheorems.lean")
  let r := parseLiveDualEqWriteCapableGapTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-DUAL-EQ-WRITE-CAPABLE-GAP-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live DualEqWriteCapableGapTheorems parse false"
      throw (IO.userError "kernelCheck live DualEqWriteCapableGapTheorems parse false")
    unless hostFrontLiveDualEqWriteCapableGapTheoremsReady do
      IO.eprintln "error: hostFrontLiveDualEqWriteCapableGapTheoremsReady false"
      IO.eprintln s!"  cmdCount={liveParseCmdCountOk} onlyImport={liveParseOnlyImportNsEnd} module={liveParseHasDualEqWriteCapableGapTheoremsModule} ns={liveParseHasDualEqWriteCapableGapNs} endNs={liveParseHasDualEqWriteCapableGapEnd} importOk={liveParseHasDualEqWriteCapableGapImport} theorems={liveParseHasCoreTheorems} kw={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveDualEqWriteCapableGapTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty DualEqWriteCapableGapTheorems source was accepted"
      throw (IO.userError "empty DualEqWriteCapableGapTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveDualEqWriteCapableGapTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveDualEqWriteCapableGapTheorems
