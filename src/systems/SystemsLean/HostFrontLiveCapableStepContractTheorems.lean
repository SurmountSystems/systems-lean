/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableStepContractTheorems.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that
  parse. Ready is that conjunction, not a hardcoded true.
  This wrap is CapableStepContractTheorems.lean. It is not
  CapableStepContract.lean.
  Theorems and examples are skipped. Bodies are rfl or by decide, not
  kernel-checkable here. Kept commands are import, namespace, and end.
  theorem count is 21. example count is 21. set_option count is 0.
  Section anchors are the STEP-CONTRACT-THEOREM and STEP-CONTRACT-SMOKE headers.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS, STEP-CONTRACT-THEOREM, liveRel,
  kernelCheckLiveCapableStepContractTheoremsSource,
  hostFrontLiveCapableStepContractTheoremsReady.
  Module: SystemsLean.HostFrontLiveCapableStepContractTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableStepContractTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableStepContractTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel itself is defined in the Source module. -/
def liveCapableStepContractTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableStepContractTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableStepContractTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableStepContractTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableStepContractTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableStepContractTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorems, examples, and non-commands. -/
def liveCapableStepContractTheoremsSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, and end.
    Theorems and examples are skipped. From CapableStepContractTheorems.lean.
    A count of 4 would invent a def this file does not have. -/
def liveCapableStepContractTheoremsKeptCmds : Nat := 3

/-- theorem keyword count. CapableStepContractTheorems.lean has 21 theorems. -/
def liveCapableStepContractTheoremsTheoremCount : Nat := 21

/-- example keyword count. CapableStepContractTheorems.lean has 21 examples. -/
def liveCapableStepContractTheoremsExampleCount : Nat := 21

/-- set_option keyword count. CapableStepContractTheorems.lean has no set_option. -/
def liveCapableStepContractTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . CapableStepContract`. -/
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
def cmdAddsCapableStepContractTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownCapableStepContractTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableStepContractTheoremsParseFuel body
        && termNoAppN liveCapableStepContractTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableStepContractTheoremsParseFuel body
        && termNoAppN liveCapableStepContractTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableStepContractTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableStepContractTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableStepContractTheorems
        liveCapableStepContractTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableStepContractTheoremsSkipFuel rest
      if cmdBodyKnownCapableStepContractTheorems kn c then
        parseCmdsCapableStepContractTheorems n rest2
          (kn ++ cmdAddsCapableStepContractTheorems c) (acc ++ [c])
      else
        parseCmdsCapableStepContractTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableStepContractTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableStepContractTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live CapableStepContractTheorems.lean text.
    Greppable: parseLiveCapableStepContractTheoremsSource,
    PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS. -/
def parseLiveCapableStepContractTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableStepContractTheorems
        liveCapableStepContractTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableStepContractTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableStepContractTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveCapableStepContractTheoremsSource,
    PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS. -/
def kernelCheckLiveCapableStepContractTheoremsSource (src : String) : Bool :=
  match parseLiveCapableStepContractTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableStepContractTheoremsParsed? : Option Module :=
  match parseLiveCapableStepContractTheoremsSource
      liveCapableStepContractTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Import, namespace, and end.
    Theorems and examples are not kept. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | some m => m.commands.length == liveCapableStepContractTheoremsKeptCmds
  | none => false

/-- This file has no def. Theorems and examples are the surface. -/
def liveParseHasNoDef : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is CapableStepContractTheorems
    (no module line in the live file). -/
def liveParseHasCapableStepContractTheoremsModule : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableStepContractTheorems"
      && lastSeg m.name.raw == "CapableStepContractTheorems"

/-- Live parse has namespace SystemsLean.CapableStepContract.
    The long-file split shares that namespace. It is not
    SystemsLean.CapableStepContractTheorems. -/
def liveParseHasCapableStepContractNs : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableStepContract"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableStepContract. -/
def liveParseHasCapableStepContractEnd : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableStepContract"
      | _ => false

/-- Live parse imports SystemsLean.CapableStepContract. -/
def liveParseHasCapableStepContractImport : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CapableStepContract"
      | _ => false

/-- Keyword counts: theorem 21, example 21, set_option 0. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableStepContractTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveCapableStepContractTheoremsSource)
    let fuel := liveCapableStepContractTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveCapableStepContractTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveCapableStepContractTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableStepContractTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCapableStepContract : String :=
  "import SystemsLean.CapableStepContract\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableStepContract\n"

/-- STEP-CONTRACT-THEOREM section anchor. Trailing newline. -/
def needleSectionTheorem : String :=
  "/-! ### STEP-CONTRACT-THEOREM / HOST-STEP-CONTRACT-THEOREM (readable statements)\n"

/-- Theorem anchors. Trailing newline. -/
def needleTheoremStageId : String := "theorem stageId_eq :\n"
def needleTheoremHostId : String := "theorem hostId_eq :\n"
def needleTheoremSelfHostId : String := "theorem selfHostId_eq :\n"
def needleTheoremContractStepRead : String := "theorem contractStepRead_eq :\n"
def needleTheoremContractStepCompose : String := "theorem contractStepCompose_eq :\n"
def needleTheoremContractStepWriteHc : String := "theorem contractStepWriteHc_eq :\n"
def needleTheoremGapReadSsot : String := "theorem gapReadSsot_eq :\n"
def needleTheoremGapCompose : String := "theorem gapCompose_eq :\n"
def needleTheoremGapWriteHc : String := "theorem gapWriteHc_eq :\n"
def needleTheoremReadApi : String := "theorem freestandingCapableReadApi_eq :\n"
def needleTheoremComposeApi : String := "theorem freestandingCapableComposeApi_eq :\n"
def needleTheoremWriteHcApi : String := "theorem freestandingCapableWriteHcApi_eq :\n"
def needleTheoremLakeExe : String := "theorem lakeExeName_eq :\n"
def needleTheoremJustRecipe : String := "theorem justMeasureRecipe_eq :\n"
def needleTheoremAuthority : String :=
  "theorem productPathFreestandingCapableStepContractAuthorityNotEmit_true :\n"
def needleTheoremReadSatisfied : String :=
  "theorem productPathFreestandingCapableStepContractReadSatisfied_true :\n"
def needleTheoremComposeSatisfied : String :=
  "theorem productPathFreestandingCapableStepContractComposeSatisfied_true :\n"
def needleTheoremWriteHcSatisfied : String :=
  "theorem productPathFreestandingCapableStepContractWriteHcSatisfied_true :\n"
def needleTheoremFullSatisfied : String :=
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n"
def needleTheoremOk : String :=
  "theorem productPathFreestandingCapableStepContractOk_true :\n"
def needleTheoremPartialReady : String :=
  "theorem productPathFreestandingCapableStepContractPartialReady_true :\n"

/-- STEP-CONTRACT-SMOKE section anchor. Trailing newline. -/
def needleSectionSmoke : String :=
  "/-! ### STEP-CONTRACT-SMOKE / HOST-STEP-CONTRACT-SMOKE (behavioral)\n"

/-- Example anchors. Trailing newline. -/
def needleExampleStageId : String := "example :\n    stageId =\n"
def needleExampleHostId : String := "example :\n    hostId =\n"
def needleExampleSelfHostId : String := "example :\n    selfHostId =\n"
def needleExampleContractStepRead : String :=
  "example : contractStepRead = \"FREESTANDING-CAPABLE-STEP-CONTRACT-READ\" := by\n"
def needleExampleContractStepCompose : String :=
  "example : contractStepCompose = \"FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE\" := by\n"
def needleExampleContractStepWriteHc : String :=
  "example : contractStepWriteHc = \"FREESTANDING-CAPABLE-STEP-CONTRACT-WRITE-HC\" := by\n"
def needleExampleGapReadSsot : String :=
  "example : gapReadSsot = \"FREESTANDING-PERFORM-GAP-READ-SSOT\" := by\n"
def needleExampleGapCompose : String :=
  "example : gapCompose = \"FREESTANDING-PERFORM-GAP-COMPOSE\" := by\n"
def needleExampleGapWriteHc : String :=
  "example : gapWriteHc = \"FREESTANDING-PERFORM-GAP-WRITE-HC\" := by\n"
def needleExampleReadApi : String :=
  "example : freestandingCapableReadApi = \"freestandingCapableReadDualSsot\" := by\n"
def needleExampleComposeApi : String :=
  "example :\n    freestandingCapableComposeApi =\n"
def needleExampleWriteHcApi : String :=
  "example :\n    freestandingCapableWriteHcApi =\n"
def needleExampleLakeExe : String :=
  "example : lakeExeName = \"slake-freestanding-capable-step-contract\" := by\n"
def needleExampleJustRecipe : String :=
  "example : justMeasureRecipe = \"freestanding-capable-step-contract\" := by\n"
def needleExampleAuthority : String :=
  "example : productPathFreestandingCapableStepContractAuthorityNotEmit = true := by\n"
def needleExampleReadSatisfied : String :=
  "example : productPathFreestandingCapableStepContractReadSatisfied = true := by\n"
def needleExampleComposeSatisfied : String :=
  "example : productPathFreestandingCapableStepContractComposeSatisfied = true := by\n"
def needleExampleWriteHcSatisfied : String :=
  "example : productPathFreestandingCapableStepContractWriteHcSatisfied = true := by\n"
def needleExampleFullSatisfied : String :=
  "example : productPathFreestandingCapableStepContractFullSatisfied = false := by\n"
def needleExampleOk : String :=
  "example : productPathFreestandingCapableStepContractOk = true := by\n"
def needleExamplePartialReady : String :=
  "example : productPathFreestandingCapableStepContractPartialReady = true := by\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableStepContract\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.CapableStepContractTheorems. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableStepContractTheoremsSource
  (src.splitOn needleImportCapableStepContract).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleSectionTheorem).length > 1
    && (src.splitOn needleTheoremStageId).length > 1
    && (src.splitOn needleTheoremHostId).length > 1
    && (src.splitOn needleTheoremSelfHostId).length > 1
    && (src.splitOn needleTheoremContractStepRead).length > 1
    && (src.splitOn needleTheoremContractStepCompose).length > 1
    && (src.splitOn needleTheoremContractStepWriteHc).length > 1
    && (src.splitOn needleTheoremGapReadSsot).length > 1
    && (src.splitOn needleTheoremGapCompose).length > 1
    && (src.splitOn needleTheoremGapWriteHc).length > 1
    && (src.splitOn needleTheoremReadApi).length > 1
    && (src.splitOn needleTheoremComposeApi).length > 1
    && (src.splitOn needleTheoremWriteHcApi).length > 1
    && (src.splitOn needleTheoremLakeExe).length > 1
    && (src.splitOn needleTheoremJustRecipe).length > 1
    && (src.splitOn needleTheoremAuthority).length > 1
    && (src.splitOn needleTheoremReadSatisfied).length > 1
    && (src.splitOn needleTheoremComposeSatisfied).length > 1
    && (src.splitOn needleTheoremWriteHcSatisfied).length > 1
    && (src.splitOn needleTheoremFullSatisfied).length > 1
    && (src.splitOn needleTheoremOk).length > 1
    && (src.splitOn needleTheoremPartialReady).length > 1
    && (src.splitOn needleSectionSmoke).length > 1
    && (src.splitOn needleExampleStageId).length > 1
    && (src.splitOn needleExampleHostId).length > 1
    && (src.splitOn needleExampleSelfHostId).length > 1
    && (src.splitOn needleExampleContractStepRead).length > 1
    && (src.splitOn needleExampleContractStepCompose).length > 1
    && (src.splitOn needleExampleContractStepWriteHc).length > 1
    && (src.splitOn needleExampleGapReadSsot).length > 1
    && (src.splitOn needleExampleGapCompose).length > 1
    && (src.splitOn needleExampleGapWriteHc).length > 1
    && (src.splitOn needleExampleReadApi).length > 1
    && (src.splitOn needleExampleComposeApi).length > 1
    && (src.splitOn needleExampleWriteHcApi).length > 1
    && (src.splitOn needleExampleLakeExe).length > 1
    && (src.splitOn needleExampleJustRecipe).length > 1
    && (src.splitOn needleExampleAuthority).length > 1
    && (src.splitOn needleExampleReadSatisfied).length > 1
    && (src.splitOn needleExampleComposeSatisfied).length > 1
    && (src.splitOn needleExampleWriteHcSatisfied).length > 1
    && (src.splitOn needleExampleFullSatisfied).length > 1
    && (src.splitOn needleExampleOk).length > 1
    && (src.splitOn needleExamplePartialReady).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableStepContractTheoremsReady,
    PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS,
    HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableStepContractTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS")
    && (parseId == "PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS")
    && (liveRel == "CapableStepContractTheorems.lean")
    && (liveCapableStepContractTheoremsRel
      == "src/systems/SystemsLean/CapableStepContractTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableStepContractTheoremsFullHost
    && !hostFrontLiveCapableStepContractTheoremsFullBackend
    && !hostFrontLiveCapableStepContractTheoremsResidualFreeClaimed
    && !hostFrontLiveCapableStepContractTheoremsProvablyUnlocked
    && kernelCheckLiveCapableStepContractTheoremsSource
      liveCapableStepContractTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoDef
    && liveParseHasCapableStepContractTheoremsModule
    && liveParseHasCapableStepContractNs
    && liveParseHasCapableStepContractEnd
    && liveParseHasCapableStepContractImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableStepContractTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableStepContractTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveCapableStepContractTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableStepContractTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableStepContractTheoremsRel}"
    throw (IO.userError s!"missing {liveCapableStepContractTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableStepContractTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableStepContractTheorems.lean != liveCapableStepContractTheoremsSource"
    throw (IO.userError "dual-pin mismatch live CapableStepContractTheorems.lean")
  let r := parseLiveCapableStepContractTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-STEP-CONTRACT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableStepContractTheorems parse false"
      throw (IO.userError "kernelCheck live CapableStepContractTheorems parse false")
    unless hostFrontLiveCapableStepContractTheoremsReady do
      IO.eprintln "error: hostFrontLiveCapableStepContractTheoremsReady false"
      throw (IO.userError "hostFrontLiveCapableStepContractTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableStepContractTheorems source was accepted"
      throw (IO.userError "empty CapableStepContractTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableStepContractTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableStepContractTheorems
