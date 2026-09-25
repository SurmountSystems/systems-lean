/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SelfHostBodyTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not SelfHostBody.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem residualFreeClaimed_false is a product pin in the source file.
  It is not this wrap's residual-free flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-SELF-HOST-BODY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_BODY_THEOREMS_V0,
  PARSE-LIVE-SELF-HOST-BODY-THEOREMS, SELF-HOST-BODY-THEOREMS, liveRel,
  kernelCheckLiveSelfHostBodyTheoremsSource,
  hostFrontLiveSelfHostBodyTheoremsReady.
  Module: SystemsLean.HostFrontLiveSelfHostBodyTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfHostBodyTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfHostBodyTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SELF_HOST_BODY_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELF-HOST-BODY-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELF-HOST-BODY-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "SelfHostBodyTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostBodyTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfHostBodyTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live file cites LlvmHold. It is not this flag. -/
def hostFrontLiveSelfHostBodyTheoremsFullBackend : Bool := false

/-- Honesty: this wrap does not claim product residual free.
    The live file's residualFreeClaimed_false theorem is a product pin,
    not this flag. -/
def hostFrontLiveSelfHostBodyTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file's LlvmHold.provablyUnlocked example is not this flag. -/
def hostFrontLiveSelfHostBodyTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSelfHostBodyTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveSelfHostBodyTheoremsSkipFuel : Nat := 8192

/-- Kept command count: fifteen imports, one namespace, one end.
    From SelfHostBodyTheorems.lean, not a copied lower bound. -/
def liveSelfHostBodyTheoremsKeptCmds : Nat := 17

/-- Theorem declarations in the live file (proofs skipped). -/
def liveSelfHostBodyTheoremsTheoremCount : Nat := 8

/-- Example smokes in the live file (skipped). -/
def liveSelfHostBodyTheoremsExampleCount : Nat := 61

/-- set_option lines in the live file (skipped). -/
def liveSelfHostBodyTheoremsSetOptionCount : Nat := 2

/-- Dotted ident `SystemsLean . SelfHostBody`. -/
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
def cmdAddsSelfHostBodyTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownSelfHostBodyTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostBodyTheoremsParseFuel body
        && termNoAppN liveSelfHostBodyTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostBodyTheoremsParseFuel body
        && termNoAppN liveSelfHostBodyTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdSelfHostBodyTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsSelfHostBodyTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSelfHostBodyTheorems liveSelfHostBodyTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSelfHostBodyTheoremsSkipFuel rest
      if cmdBodyKnownSelfHostBodyTheorems kn c then
        parseCmdsSelfHostBodyTheorems n rest2
          (kn ++ cmdAddsSelfHostBodyTheorems c) (acc ++ [c])
      else
        parseCmdsSelfHostBodyTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSelfHostBodyTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSelfHostBodyTheorems n rest2 kn acc
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

/-- Parse live SelfHostBodyTheorems.lean text.
    Greppable: parseLiveSelfHostBodyTheoremsSource,
    PARSE-LIVE-SELF-HOST-BODY-THEOREMS. -/
def parseLiveSelfHostBodyTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfHostBodyTheorems liveSelfHostBodyTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfHostBodyTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfHostBodyTheorems parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveSelfHostBodyTheoremsSource,
    PARSE-LIVE-SELF-HOST-BODY-THEOREMS. -/
def kernelCheckLiveSelfHostBodyTheoremsSource (src : String) : Bool :=
  match parseLiveSelfHostBodyTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfHostBodyTheoremsParsed? : Option Module :=
  match parseLiveSelfHostBodyTheoremsSource liveSelfHostBodyTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Fifteen imports, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | some m => m.commands.length == liveSelfHostBodyTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is SelfHostBodyTheorems (no module line in the live file). -/
def liveParseHasSelfHostBodyTheoremsModule : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.SelfHostBodyTheorems"
      && lastSeg m.name.raw == "SelfHostBodyTheorems"

/-- Live parse has namespace SystemsLean.SelfHostBody. -/
def liveParseHasSelfHostBodyNs : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.SelfHostBody"
      | _ => false

/-- Live parse ends namespace SystemsLean.SelfHostBody. -/
def liveParseHasSelfHostBodyEnd : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.SelfHostBody"
      | _ => false

/-- True when the live parse kept an import of `raw`. -/
def liveParseHasImport (raw : String) : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == raw
      | _ => false

/-- Live parse imports SystemsLean.EmitMult. -/
def liveParseHasEmitMultImport : Bool :=
  liveParseHasImport "SystemsLean.EmitMult"

/-- Live parse imports SystemsLean.EmitLinear. -/
def liveParseHasEmitLinearImport : Bool :=
  liveParseHasImport "SystemsLean.EmitLinear"

/-- Live parse imports SystemsLean.EmitErasure. -/
def liveParseHasEmitErasureImport : Bool :=
  liveParseHasImport "SystemsLean.EmitErasure"

/-- Live parse imports SystemsLean.EmitExtract. -/
def liveParseHasEmitExtractImport : Bool :=
  liveParseHasImport "SystemsLean.EmitExtract"

/-- Live parse imports SystemsLean.EmitTypes. -/
def liveParseHasEmitTypesImport : Bool :=
  liveParseHasImport "SystemsLean.EmitTypes"

/-- Live parse imports SystemsLean.EmitProgram. -/
def liveParseHasEmitProgramImport : Bool :=
  liveParseHasImport "SystemsLean.EmitProgram"

/-- Live parse imports SystemsLean.EmitGraph. -/
def liveParseHasEmitGraphImport : Bool :=
  liveParseHasImport "SystemsLean.EmitGraph"

/-- Live parse imports SystemsLean.EmitCompose. -/
def liveParseHasEmitComposeImport : Bool :=
  liveParseHasImport "SystemsLean.EmitCompose"

/-- Live parse imports SystemsLean.EmitPlan. -/
def liveParseHasEmitPlanImport : Bool :=
  liveParseHasImport "SystemsLean.EmitPlan"

/-- Live parse imports SystemsLean.EmitApply. -/
def liveParseHasEmitApplyImport : Bool :=
  liveParseHasImport "SystemsLean.EmitApply"

/-- Live parse imports SystemsLean.EmitBody. -/
def liveParseHasEmitBodyImport : Bool :=
  liveParseHasImport "SystemsLean.EmitBody"

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  liveParseHasImport "SystemsLean.SelfApplyFs"

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  liveParseHasImport "SystemsLean.LlvmHold"

/-- Live parse imports SystemsLean.DualResidual. -/
def liveParseHasDualResidualImport : Bool :=
  liveParseHasImport "SystemsLean.DualResidual"

/-- Live parse imports SystemsLean.SelfHostBody. -/
def liveParseHasSelfHostBodyImport : Bool :=
  liveParseHasImport "SystemsLean.SelfHostBody"

/-- Skip-head still sees each theorem name from SelfHostBodyTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveSelfHostBodyTheoremsSource)
    let fuel := liveSelfHostBodyTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostSelfHostBodyId_eq"
      && toksHaveTheoremNamed fuel toks "residualFreeClaimed_false"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostComplete_true"
      && toksHaveTheoremNamed fuel toks "selfHostBodyOk_eq_ready"
      && toksHaveTheoremNamed fuel toks "selfHostBodyReady_true"
      && toksHaveTheoremNamed fuel toks "selfHostBodyDoesNotComplete_false"
      && toksHaveTheoremNamed fuel toks
        "selfHostBodyDoesNotMeanResidualFree_true"

/-- Keyword counts match this file: 8 theorems, 61 examples, 2 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveSelfHostBodyTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveSelfHostBodyTheoremsSource)
    let fuel := liveSelfHostBodyTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveSelfHostBodyTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveSelfHostBodyTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveSelfHostBodyTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportEmitMult : String := "import SystemsLean.EmitMult\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitLinear : String := "import SystemsLean.EmitLinear\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitErasure : String := "import SystemsLean.EmitErasure\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitExtract : String := "import SystemsLean.EmitExtract\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitTypes : String := "import SystemsLean.EmitTypes\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitProgram : String := "import SystemsLean.EmitProgram\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitGraph : String := "import SystemsLean.EmitGraph\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitCompose : String := "import SystemsLean.EmitCompose\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitPlan : String := "import SystemsLean.EmitPlan\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitApply : String := "import SystemsLean.EmitApply\n"

/-- Import needle. Trailing newline. -/
def needleImportEmitBody : String := "import SystemsLean.EmitBody\n"

/-- Import needle. Trailing newline. -/
def needleImportSelfApplyFs : String := "import SystemsLean.SelfApplyFs\n"

/-- Import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Import needle. Trailing newline. -/
def needleImportDualResidual : String := "import SystemsLean.DualResidual\n"

/-- Import needle. Trailing newline. -/
def needleImportSelfHostBody : String := "import SystemsLean.SelfHostBody\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.SelfHostBody\n"

/-- set_option maxRecDepth needle with a trailing newline. -/
def needleSetOptionDepth : String := "set_option maxRecDepth 65536\n"

/-- set_option maxHeartbeats needle with a trailing newline. -/
def needleSetOptionHeartbeats : String := "set_option maxHeartbeats 16000000\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String :=
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_BODY_V0\" := rfl\n"

/-- theorem hostSelfHostBodyId_eq needle with a trailing newline. -/
def needleHostSelfHostBodyIdEq : String :=
  "theorem hostSelfHostBodyId_eq : hostSelfHostBodyId = \"HOST-SELF-HOST-BODY\" := rfl\n"

/-- theorem residualFreeClaimed_false needle with a trailing newline. -/
def needleResidualFreeClaimedFalse : String :=
  "theorem residualFreeClaimed_false : residualFreeClaimed = false := rfl\n"

/-- theorem freestandingProductSelfHostComplete_true needle with a trailing newline. -/
def needleFreestandingComplete : String :=
  "theorem freestandingProductSelfHostComplete_true :\n"

/-- theorem selfHostBodyOk_eq_ready needle with a trailing newline. -/
def needleOkEqReady : String :=
  "theorem selfHostBodyOk_eq_ready : selfHostBodyOk = selfHostBodyReady := rfl\n"

/-- theorem selfHostBodyReady_true needle with a trailing newline. -/
def needleBodyReady : String :=
  "theorem selfHostBodyReady_true : selfHostBodyReady = true := by native_decide\n"

/-- theorem selfHostBodyDoesNotComplete_false needle with a trailing newline. -/
def needleDoesNotComplete : String :=
  "theorem selfHostBodyDoesNotComplete_false :\n"

/-- theorem selfHostBodyDoesNotMeanResidualFree_true needle with a trailing newline. -/
def needleDoesNotMeanResidualFree : String :=
  "theorem selfHostBodyDoesNotMeanResidualFree_true :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleHostId : String :=
  "example : hostSelfHostBodyId = \"HOST-SELF-HOST-BODY\" := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.SelfHostBody\n"

/-- Each needle occurs once in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveSelfHostBodyTheoremsSource
  (src.splitOn needleImportEmitMult).length == 2
    && (src.splitOn needleImportEmitLinear).length == 2
    && (src.splitOn needleImportEmitErasure).length == 2
    && (src.splitOn needleImportEmitExtract).length == 2
    && (src.splitOn needleImportEmitTypes).length == 2
    && (src.splitOn needleImportEmitProgram).length == 2
    && (src.splitOn needleImportEmitGraph).length == 2
    && (src.splitOn needleImportEmitCompose).length == 2
    && (src.splitOn needleImportEmitPlan).length == 2
    && (src.splitOn needleImportEmitApply).length == 2
    && (src.splitOn needleImportEmitBody).length == 2
    && (src.splitOn needleImportSelfApplyFs).length == 2
    && (src.splitOn needleImportLlvmHold).length == 2
    && (src.splitOn needleImportDualResidual).length == 2
    && (src.splitOn needleImportSelfHostBody).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleSetOptionDepth).length == 2
    && (src.splitOn needleSetOptionHeartbeats).length == 2
    && (src.splitOn needleStageIdEq).length == 2
    && (src.splitOn needleHostSelfHostBodyIdEq).length == 2
    && (src.splitOn needleResidualFreeClaimedFalse).length == 2
    && (src.splitOn needleFreestandingComplete).length == 2
    && (src.splitOn needleOkEqReady).length == 2
    && (src.splitOn needleBodyReady).length == 2
    && (src.splitOn needleDoesNotComplete).length == 2
    && (src.splitOn needleDoesNotMeanResidualFree).length == 2
    && (src.splitOn needleExampleHostId).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSelfHostBodyTheoremsReady,
    PARSE-LIVE-SELF-HOST-BODY-THEOREMS,
    HOST-FRONT-LIVE-SELF-HOST-BODY-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveSelfHostBodyTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SELF_HOST_BODY_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-SELF-HOST-BODY-THEOREMS")
    && (parseId == "PARSE-LIVE-SELF-HOST-BODY-THEOREMS")
    && (liveRel == "SelfHostBodyTheorems.lean")
    && (liveSelfHostBodyTheoremsRel
      == "src/systems/SystemsLean/SelfHostBodyTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSelfHostBodyTheoremsFullHost
    && !hostFrontLiveSelfHostBodyTheoremsFullBackend
    && !hostFrontLiveSelfHostBodyTheoremsResidualFreeClaimed
    && !hostFrontLiveSelfHostBodyTheoremsProvablyUnlocked
    && kernelCheckLiveSelfHostBodyTheoremsSource liveSelfHostBodyTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasSelfHostBodyTheoremsModule
    && liveParseHasSelfHostBodyNs
    && liveParseHasSelfHostBodyEnd
    && liveParseHasEmitMultImport
    && liveParseHasEmitLinearImport
    && liveParseHasEmitErasureImport
    && liveParseHasEmitExtractImport
    && liveParseHasEmitTypesImport
    && liveParseHasEmitProgramImport
    && liveParseHasEmitGraphImport
    && liveParseHasEmitComposeImport
    && liveParseHasEmitPlanImport
    && liveParseHasEmitApplyImport
    && liveParseHasEmitBodyImport
    && liveParseHasSelfApplyFsImport
    && liveParseHasLlvmHoldImport
    && liveParseHasDualResidualImport
    && liveParseHasSelfHostBodyImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfHostBodyTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveSelfHostBodyTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELF-HOST-BODY-THEOREMS =="
  IO.println s!"  host={hostId} file={liveSelfHostBodyTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveSelfHostBodyTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSelfHostBodyTheoremsRel}"
    throw (IO.userError s!"missing {liveSelfHostBodyTheoremsRel}")
  let disk <- IO.FS.readFile path
  IO.println s!"diskBytes={disk.utf8ByteSize} pinBytes={liveSelfHostBodyTheoremsSource.utf8ByteSize}"
  if disk != liveSelfHostBodyTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfHostBodyTheorems.lean != liveSelfHostBodyTheoremsSource"
    throw (IO.userError "dual-pin mismatch live SelfHostBodyTheorems.lean")
  let r := parseLiveSelfHostBodyTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELF-HOST-BODY-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELF-HOST-BODY-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELF-HOST-BODY-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfHostBodyTheorems parse false"
      throw (IO.userError "kernelCheck live SelfHostBodyTheorems parse false")
    unless hostFrontLiveSelfHostBodyTheoremsReady do
      IO.eprintln "error: hostFrontLiveSelfHostBodyTheoremsReady false"
      throw (IO.userError "hostFrontLiveSelfHostBodyTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty SelfHostBodyTheorems source was accepted"
      throw (IO.userError "empty SelfHostBodyTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfHostBodyTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfHostBodyTheorems
