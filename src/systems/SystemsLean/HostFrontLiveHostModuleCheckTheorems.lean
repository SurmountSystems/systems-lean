/-
  SYSTEMS_LEAN_HOST partial -- parse live HostModuleCheckTheorems.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, set_option, and comments are skipped: HostTerm.Cmd has no
  theorem form, and the proofs are rfl or by native_decide.
  Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not HostModuleCheck.lean. Not an LLVM backend.
  Stage id is HOST-MODULE-CHECK-THEOREMS.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem hostModuleCheck_claims_false is a product pin in the
  source file. It is not this wrap's residual-free flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK-THEOREMS,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_THEOREMS_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS, liveRel,
  kernelCheckLiveHostModuleCheckTheoremsSource,
  hostFrontLiveHostModuleCheckTheoremsReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "HOST-MODULE-CHECK-THEOREMS"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-MODULE-CHECK-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS"

/-- Version token kept beside the hyphenated stage id. -/
def stageVersion : String := "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_THEOREMS_V0"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckTheoremsFullBackend : Bool := false

/-- Honesty: this wrap does not claim product residual free.
    The live file's hostModuleCheck_claims_false theorem is a product pin,
    not this flag. -/
def hostFrontLiveHostModuleCheckTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostModuleCheckTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / set_option tails and the token walk. -/
def liveHostModuleCheckTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From HostModuleCheckTheorems.lean, not a copied lower bound. -/
def liveHostModuleCheckTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveHostModuleCheckTheoremsTheoremCount : Nat := 86

/-- Example smokes in the live file (none; smoke lives elsewhere). -/
def liveHostModuleCheckTheoremsExampleCount : Nat := 0

/-- set_option lines in the live file (skipped). -/
def liveHostModuleCheckTheoremsSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . HostModuleCheck`. -/
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
def cmdAddsHostModuleCheckTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownHostModuleCheckTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckTheoremsParseFuel body
        && termNoAppN liveHostModuleCheckTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostModuleCheckTheoremsParseFuel body
        && termNoAppN liveHostModuleCheckTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem and set_option are not parsed here. -/
def parseOneCmdHostModuleCheckTheorems (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, set_option, and un-kernelable defs. -/
def parseCmdsHostModuleCheckTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostModuleCheckTheorems liveHostModuleCheckTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostModuleCheckTheoremsSkipFuel rest
      if cmdBodyKnownHostModuleCheckTheorems kn c then
        parseCmdsHostModuleCheckTheorems n rest2
          (kn ++ cmdAddsHostModuleCheckTheorems c) (acc ++ [c])
      else
        parseCmdsHostModuleCheckTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostModuleCheckTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostModuleCheckTheorems n rest2 kn acc
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

/-- Parse live HostModuleCheckTheorems.lean text.
    Greppable: parseLiveHostModuleCheckTheoremsSource,
    PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS. -/
def parseLiveHostModuleCheckTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostModuleCheckTheorems liveHostModuleCheckTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckTheorems parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveHostModuleCheckTheoremsSource,
    PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS. -/
def kernelCheckLiveHostModuleCheckTheoremsSource (src : String) : Bool :=
  match parseLiveHostModuleCheckTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostModuleCheckTheoremsParsed? : Option Module :=
  match parseLiveHostModuleCheckTheoremsSource liveHostModuleCheckTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | some m => m.commands.length == liveHostModuleCheckTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is HostModuleCheckTheorems (no module line in the live file). -/
def liveParseHasHostModuleCheckTheoremsModule : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckTheorems"
      && lastSeg m.name.raw == "HostModuleCheckTheorems"

/-- Live parse has namespace SystemsLean.HostModuleCheck. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostModuleCheck. -/
def liveParseHasHostModuleCheckEnd : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse imports SystemsLean.HostModuleCheck. -/
def liveParseHasHostModuleCheckImport : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Theorem names declared in HostModuleCheckTheorems.lean. -/
def liveHostModuleCheckTheoremsTheoremNames : List String :=
  [ "hostModuleCheckLoadOk_true"
  , "hostModuleCheckReady_true"
  , "hostModuleCheckWithoutLakeReady_true"
  , "hostModuleCheckFinishedClaimed_true"
  , "hostModuleCheckHostElaboratorResidualRemains_true"
  , "hostModuleCheckHostFreeClaimed_false"
  , "hostModuleCheckWithoutLakeFinished_true"
  , "hostModuleCheckGoodMult_accept"
  , "hostModuleCheckGoodMultTheorems_accept"
  , "hostModuleCheckGoodLinear_accept"
  , "hostModuleCheckGoodTypes_accept"
  , "hostModuleCheckGoodIrProgram_accept"
  , "hostModuleCheckGoodIrProgramTheorems_accept"
  , "hostModuleCheckGoodIrGraph_accept"
  , "hostModuleCheckGoodIrGraphTheorems_accept"
  , "hostModuleCheckGoodHostCompose_accept"
  , "hostModuleCheckGoodHostComposeTheorems_accept"
  , "hostModuleCheckGoodErasure_accept"
  , "hostModuleCheckGoodExtract_accept"
  , "hostModuleCheckGoodCompilePath_accept"
  , "hostModuleCheckGoodKernelMult_accept"
  , "hostModuleCheckGoodKernelLinear_accept"
  , "hostModuleCheckGoodKernelTypes_accept"
  , "hostModuleCheckGoodKernelProgram_accept"
  , "hostModuleCheckGoodKernelMultTheorems_accept"
  , "hostModuleCheckGoodKernelLinearTheorems_accept"
  , "hostModuleCheckGoodKernelTypesTheorems_accept"
  , "hostModuleCheckGoodKernelProgramTheorems_accept"
  , "hostModuleCheckGoodJoinMap_accept"
  , "hostModuleCheckGoodJoinMapTheorems_accept"
  , "hostModuleCheckGoodSelfHost_accept"
  , "hostModuleCheckGoodSelfHostTheorems_accept"
  , "hostModuleCheckBadMissingInductive_missing"
  , "hostModuleCheckBadMissingNamespace_missing"
  , "hostModuleCheckBadEmpty_empty"
  , "hostModuleCheckBadMissingTheorem_missing"
  , "hostModuleCheckBadMissingAxiom_missing"
  , "hostModuleCheckBadMissingStructure_missing"
  , "hostModuleCheckBadMissingProgramStructure_missing"
  , "hostModuleCheckBadMissingErasedStructure_missing"
  , "hostModuleCheckBadMissingKernelReady_missing"
  , "hostModuleCheckBadMissingPlanStructure_missing"
  , "hostModuleCheckBadMissingParityReady_missing"
  , "hostModuleCheckGoodMultTerm_accept"
  , "hostModuleCheckBadMultNameReturnType_illTyped"
  , "hostModuleCheckBadMultIsValidApp_illTyped"
  , "hostModuleCheckBadMultIsValidArm_illTyped"
  , "hostModuleCheckMultTermSurfaceOk_true"
  , "hostModuleCheckMultKernelOk_true"
  , "hostModuleCheck_term_surface_ids_eq"
  , "hostModuleCheckGoodMultTheoremsProof_accept"
  , "hostModuleCheckBadMultThmWrongStmt_illTyped"
  , "hostModuleCheckBadMultThmSorry_illTyped"
  , "hostModuleCheckMultProofSurfaceOk_true"
  , "hostModuleCheck_proof_surface_ids_eq"
  , "hostModuleCheckGoodLinearTerm_accept"
  , "hostModuleCheckBadLinearShareNatReturnType_illTyped"
  , "hostModuleCheckBadLinearPolyIdBody_illTyped"
  , "hostModuleCheckBadLinearMult0ClassId_illTyped"
  , "hostModuleCheckBadLinearRoundTripBody_illTyped"
  , "hostModuleCheckBadLinearShareNatReturnType_l0Accept"
  , "hostModuleCheckBadLinearPolyIdBody_l0Accept"
  , "hostModuleCheckBadLinearMult0ClassId_l0Accept"
  , "hostModuleCheckBadLinearRoundTripBody_l0Accept"
  , "hostModuleCheckLinearTermSurfaceOk_true"
  , "hostModuleCheck_linear_term_surface_ids_eq"
  , "hostModuleCheckGoodTypesTerm_accept"
  , "hostModuleCheckBadTypesNameArm_illTyped"
  , "hostModuleCheckBadTypesExpectedMultArm_illTyped"
  , "hostModuleCheckBadTypesKindMultOkBody_illTyped"
  , "hostModuleCheckBadTypesOfKindTagArm_illTyped"
  , "hostModuleCheckBadTypesNameArm_l0Accept"
  , "hostModuleCheckBadTypesExpectedMultArm_l0Accept"
  , "hostModuleCheckBadTypesKindMultOkBody_l0Accept"
  , "hostModuleCheckBadTypesOfKindTagArm_l0Accept"
  , "hostModuleCheckTypesTermSurfaceOk_true"
  , "hostModuleCheck_types_term_surface_ids_eq"
  , "hostModuleCheckIrProgramTermSurfaceOk_true"
  , "hostModuleCheck_irprogram_term_surface_ids_eq"
  , "hostModuleCheckIrGraphTermSurfaceOk_true"
  , "hostModuleCheck_irgraph_term_surface_ids_eq"
  , "hostModuleCheckHostComposeTermSurfaceOk_true"
  , "hostModuleCheck_hostcompose_term_surface_ids_eq"
  , "hostModuleCheck_ids_eq"
  , "hostModuleCheck_deepen_band_eq"
  , "hostModuleCheck_claims_false"
  ]

/-- Skip-head still sees each theorem name from HostModuleCheckTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostModuleCheckTheoremsSource)
    let fuel := liveHostModuleCheckTheoremsSkipFuel
    liveHostModuleCheckTheoremsTheoremNames.length
        == liveHostModuleCheckTheoremsTheoremCount
      && liveHostModuleCheckTheoremsTheoremNames.all fun nm =>
        toksHaveTheoremNamed fuel toks nm

/-- Keyword counts match this file: 86 theorems, 0 examples, 1 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveHostModuleCheckTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostModuleCheckTheoremsSource)
    let fuel := liveHostModuleCheckTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveHostModuleCheckTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveHostModuleCheckTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveHostModuleCheckTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportHostModuleCheck : String := "import SystemsLean.HostModuleCheck\n"

/-- set_option needle with a trailing newline. -/
def needleSetOption : String := "set_option maxRecDepth 16384\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- theorem hostModuleCheckLoadOk_true needle with a trailing newline. -/
def needleLoadOk : String :=
  "theorem hostModuleCheckLoadOk_true : hostModuleCheckLoadOk = true := by\n"

/-- theorem hostModuleCheckReady_true needle with a trailing newline. -/
def needleReady : String :=
  "theorem hostModuleCheckReady_true : hostModuleCheckReady = true := by\n"

/-- theorem hostModuleCheckWithoutLakeReady_true needle with a trailing newline. -/
def needleWithoutLake : String :=
  "theorem hostModuleCheckWithoutLakeReady_true :\n"

/-- theorem hostModuleCheck_ids_eq needle with a trailing newline. -/
def needleIdsEq : String := "theorem hostModuleCheck_ids_eq :\n"

/-- theorem hostModuleCheck_deepen_band_eq needle with a trailing newline. -/
def needleDeepenBand : String := "theorem hostModuleCheck_deepen_band_eq :\n"

/-- theorem hostModuleCheck_claims_false needle with a trailing newline. -/
def needleClaimsFalse : String := "theorem hostModuleCheck_claims_false :\n"

/-- theorem hostModuleCheckIrProgramTermSurfaceOk_true needle with a trailing newline. -/
def needleIrProgramTerm : String :=
  "theorem hostModuleCheckIrProgramTermSurfaceOk_true :\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs once in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckTheoremsSource
  (src.splitOn needleImportHostModuleCheck).length == 2
    && (src.splitOn needleSetOption).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleLoadOk).length == 2
    && (src.splitOn needleReady).length == 2
    && (src.splitOn needleWithoutLake).length == 2
    && (src.splitOn needleIdsEq).length == 2
    && (src.splitOn needleDeepenBand).length == 2
    && (src.splitOn needleClaimsFalse).length == 2
    && (src.splitOn needleIrProgramTerm).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckTheoremsReady,
    PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS,
    HOST-MODULE-CHECK-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckTheoremsReady : Bool :=
  (stageId == "HOST-MODULE-CHECK-THEOREMS")
    && (hostId == "HOST-FRONT-LIVE-HOST-MODULE-CHECK-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS")
    && (stageVersion == "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_THEOREMS_V0")
    && (liveRel == "HostModuleCheckTheorems.lean")
    && (liveHostModuleCheckTheoremsRel
      == "src/systems/SystemsLean/HostModuleCheckTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckTheoremsFullHost
    && !hostFrontLiveHostModuleCheckTheoremsFullBackend
    && !hostFrontLiveHostModuleCheckTheoremsResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckTheoremsProvablyUnlocked
    && kernelCheckLiveHostModuleCheckTheoremsSource liveHostModuleCheckTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasHostModuleCheckTheoremsModule
    && liveParseHasHostModuleCheckNs
    && liveParseHasHostModuleCheckEnd
    && liveParseHasHostModuleCheckImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveHostModuleCheckTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckTheoremsRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckTheoremsRel}")
  let disk <- IO.FS.readFile path
  IO.println s!"diskBytes={disk.utf8ByteSize} pinBytes={liveHostModuleCheckTheoremsSource.utf8ByteSize}"
  if disk != liveHostModuleCheckTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckTheorems.lean != liveHostModuleCheckTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckTheorems.lean")
  let r := parseLiveHostModuleCheckTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-MODULE-CHECK-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck {k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckTheorems parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckTheorems parse false")
    unless hostFrontLiveHostModuleCheckTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckTheorems source was accepted"
      throw (IO.userError "empty HostModuleCheckTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheckTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckTheorems
