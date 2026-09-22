/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/DualEqWriteParityTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not DualEqWriteParity.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem productPathFreestandingCapableStepContractFullSatisfied_false
  is a product pin in the source file. It is not this wrap's FullHost flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_PARITY_THEOREMS_V0,
  PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS, WRITE-PARITY-THEOREM, liveRel,
  kernelCheckLiveDualEqWriteParityTheoremsSource,
  hostFrontLiveDualEqWriteParityTheoremsReady.
  Module: SystemsLean.HostFrontLiveDualEqWriteParityTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveDualEqWriteParityTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveDualEqWriteParityTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_PARITY_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "DualEqWriteParityTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualEqWriteParityTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveDualEqWriteParityTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveDualEqWriteParityTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveDualEqWriteParityTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    WRITE-PARITY theorems do not flip PROVABLY. -/
def hostFrontLiveDualEqWriteParityTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveDualEqWriteParityTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveDualEqWriteParityTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From DualEqWriteParityTheorems.lean, not a copied LlvmHold def count.
    Theorems and examples are not kept. -/
def liveDualEqWriteParityTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveDualEqWriteParityTheoremsTheoremCount : Nat := 31

/-- Example smokes in the live file (skipped). -/
def liveDualEqWriteParityTheoremsExampleCount : Nat := 20

/-- set_option lines in the live file (none). -/
def liveDualEqWriteParityTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . DualEqWriteParity`. -/
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
def cmdAddsDualEqWriteParityTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownDualEqWriteParityTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteParityTheoremsParseFuel body
        && termNoAppN liveDualEqWriteParityTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualEqWriteParityTheoremsParseFuel body
        && termNoAppN liveDualEqWriteParityTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdDualEqWriteParityTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsDualEqWriteParityTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdDualEqWriteParityTheorems
        liveDualEqWriteParityTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveDualEqWriteParityTheoremsSkipFuel rest
      if cmdBodyKnownDualEqWriteParityTheorems kn c then
        parseCmdsDualEqWriteParityTheorems n rest2
          (kn ++ cmdAddsDualEqWriteParityTheorems c) (acc ++ [c])
      else
        parseCmdsDualEqWriteParityTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveDualEqWriteParityTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsDualEqWriteParityTheorems n rest2 kn acc
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

/-- Parse live DualEqWriteParityTheorems.lean text.
    Greppable: parseLiveDualEqWriteParityTheoremsSource,
    PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS. -/
def parseLiveDualEqWriteParityTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsDualEqWriteParityTheorems
        liveDualEqWriteParityTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.DualEqWriteParityTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live DualEqWriteParityTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveDualEqWriteParityTheoremsSource,
    PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS. -/
def kernelCheckLiveDualEqWriteParityTheoremsSource (src : String) : Bool :=
  match parseLiveDualEqWriteParityTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveDualEqWriteParityTheoremsParsed? : Option Module :=
  match parseLiveDualEqWriteParityTheoremsSource
      liveDualEqWriteParityTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | some m => m.commands.length == liveDualEqWriteParityTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is DualEqWriteParityTheorems (no module line in the live file). -/
def liveParseHasDualEqWriteParityTheoremsModule : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.DualEqWriteParityTheorems"
      && lastSeg m.name.raw == "DualEqWriteParityTheorems"

/-- Live parse has namespace SystemsLean.DualEqWriteParity.
    The file shares that namespace; it does not open DualEqWriteParityTheorems. -/
def liveParseHasDualEqWriteParityNs : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.DualEqWriteParity"
      | _ => false

/-- Live parse ends namespace SystemsLean.DualEqWriteParity. -/
def liveParseHasDualEqWriteParityEnd : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.DualEqWriteParity"
      | _ => false

/-- Live parse imports SystemsLean.DualEqWriteParity. One import only. -/
def liveParseHasDualEqWriteParityImport : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.DualEqWriteParity"
      | _ => false

/-- Skip-head still sees each theorem name from DualEqWriteParityTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveDualEqWriteParityTheoremsSource)
    let fuel := liveDualEqWriteParityTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformDualEqualityWriteParityMeasured_true"
      && toksHaveTheoremNamed fuel toks
        "productPathDualEqualityWriteParityGapOpen_true"
      && toksHaveTheoremNamed fuel toks
        "productPathCapableWriteStructuralNotDualEquality_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformClaimed_false"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathStillUsesFreestandingEmit_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathStillUsesLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathRetireFreestandingEmitRequired_true"
      && toksHaveTheoremNamed fuel toks
        "productPathOfficialPathDualEqualityBlocksRetirement_true"
      && toksHaveTheoremNamed fuel toks
        "productPathPerformDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformOfficialPathAlternateMeasured_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformDualEqualityWriteParityOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingPerformDualEqualityWriteParityPartialReady_true"
      && toksHaveTheoremNamed fuel toks "dualEqualityWriteParityId_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityWriteParityGapOpenId_eq"
      && toksHaveTheoremNamed fuel toks
        "dualEqualityWriteParityCapableStructuralId_eq"
      && toksHaveTheoremNamed fuel toks
        "dualEqualityWriteParityOfficialEmitId_eq"
      && toksHaveTheoremNamed fuel toks "dualEqualityBlocksRetirementId_eq"
      && toksHaveTheoremNamed fuel toks
        "fullBarReqPerformClaimedWithEvidence_eq"
      && toksHaveTheoremNamed fuel toks "lakeFreeParityRecipe_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justMeasureRecipe_eq"
      && toksHaveTheoremNamed fuel toks "officialPathDualEqualityGate_eq"
      && toksHaveTheoremNamed fuel toks "officialPathDualEqualityApi_eq"
      && toksHaveTheoremNamed fuel toks "capableWriteModule_eq"
      && toksHaveTheoremNamed fuel toks "capableWriteApi_eq"
      && toksHaveTheoremNamed fuel toks "officialPathLakeWriter_eq"
      && toksHaveTheoremNamed fuel toks "b33AlternateRecipe_eq"

/-- Keyword counts match this file: 31 theorems, 20 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveDualEqWriteParityTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveDualEqWriteParityTheoremsSource)
    let fuel := liveDualEqWriteParityTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveDualEqWriteParityTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveDualEqWriteParityTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveDualEqWriteParityTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportDualEqWriteParity : String :=
  "import SystemsLean.DualEqWriteParity\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.DualEqWriteParity\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem hostId_eq needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- theorem selfHostId_eq needle with a trailing newline. -/
def needleSelfHostIdEq : String := "theorem selfHostId_eq :\n"

/-- theorem Ok needle with a trailing newline. -/
def needleOkTrue : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteParityOk_true :\n"

/-- theorem PartialReady needle with a trailing newline. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingPerformDualEqualityWriteParityPartialReady_true :\n"

/-- theorem Full long-name false needle with a trailing newline. -/
def needleFullFalse : String :=
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n"

/-- theorem DependsOnLake needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "theorem productPathPerformDependsOnLake_true :\n"

/-- theorem lakeExeName_eq needle with a trailing newline. -/
def needleLakeExe : String := "theorem lakeExeName_eq :\n"

/-- theorem justMeasureRecipe_eq needle with a trailing newline. -/
def needleJustRecipe : String := "theorem justMeasureRecipe_eq :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleGapOpen : String :=
  "example : productPathDualEqualityWriteParityGapOpen = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.DualEqWriteParity\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No set_option needle: this file has none. -/
def liveNeedlesOk : Bool :=
  let src := liveDualEqWriteParityTheoremsSource
  (src.splitOn needleImportDualEqWriteParity).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleSelfHostIdEq).length > 1
    && (src.splitOn needleOkTrue).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleFullFalse).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleLakeExe).length > 1
    && (src.splitOn needleJustRecipe).length > 1
    && (src.splitOn needleExampleGapOpen).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveDualEqWriteParityTheoremsReady,
    PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS,
    HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveDualEqWriteParityTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_DUAL_EQ_WRITE_PARITY_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS")
    && (parseId == "PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS")
    && (liveRel == "DualEqWriteParityTheorems.lean")
    && (liveDualEqWriteParityTheoremsRel
      == "src/systems/SystemsLean/DualEqWriteParityTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveDualEqWriteParityTheoremsFullHost
    && !hostFrontLiveDualEqWriteParityTheoremsFullBackend
    && !hostFrontLiveDualEqWriteParityTheoremsResidualFreeClaimed
    && !hostFrontLiveDualEqWriteParityTheoremsProvablyUnlocked
    && kernelCheckLiveDualEqWriteParityTheoremsSource
      liveDualEqWriteParityTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasDualEqWriteParityTheoremsModule
    && liveParseHasDualEqWriteParityNs
    && liveParseHasDualEqWriteParityEnd
    && liveParseHasDualEqWriteParityImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveDualEqWriteParityTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveDualEqWriteParityTheorems (root : System.FilePath) : IO Unit := do
  IO.println
    s!"== {stageId}: PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS =="
  IO.println s!"  host={hostId} file={liveDualEqWriteParityTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveDualEqWriteParityTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveDualEqWriteParityTheoremsRel}"
    throw (IO.userError s!"missing {liveDualEqWriteParityTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveDualEqWriteParityTheoremsSource then
    IO.eprintln
      "error: dual-pin mismatch: on-disk DualEqWriteParityTheorems.lean != liveDualEqWriteParityTheoremsSource"
    throw (IO.userError "dual-pin mismatch live DualEqWriteParityTheorems.lean")
  let r := parseLiveDualEqWriteParityTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln
      s!"error: PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS reject {reason}"
    throw
      (IO.userError s!"PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println
      s!"PASS PARSE-LIVE-DUAL-EQ-WRITE-PARITY-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live DualEqWriteParityTheorems parse false"
      throw (IO.userError "kernelCheck live DualEqWriteParityTheorems parse false")
    unless hostFrontLiveDualEqWriteParityTheoremsReady do
      IO.eprintln "error: hostFrontLiveDualEqWriteParityTheoremsReady false"
      throw (IO.userError "hostFrontLiveDualEqWriteParityTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty DualEqWriteParityTheorems source was accepted"
      throw (IO.userError "empty DualEqWriteParityTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveDualEqWriteParityTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveDualEqWriteParityTheorems
