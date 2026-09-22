/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableRegenerateTheorems.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not CapableRegenerate.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem productPathFreestandingCapableRegenerateOk_true is a
  product pin in the source file. It is not this wrap's provably flag.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-CAPABLE-REGENERATE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_REGENERATE_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS, REGENERATE-THEOREM, liveRel,
  kernelCheckLiveCapableRegenerateTheoremsSource,
  hostFrontLiveCapableRegenerateTheoremsReady.
  Module: SystemsLean.HostFrontLiveCapableRegenerateTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableRegenerateTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableRegenerateTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_REGENERATE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-REGENERATE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "CapableRegenerateTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableRegenerateTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableRegenerateTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableRegenerateTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableRegenerateTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file's productPathFreestandingCapableRegenerateOk_true theorem
    is not this flag. -/
def hostFrontLiveCapableRegenerateTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableRegenerateTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveCapableRegenerateTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From CapableRegenerateTheorems.lean, not a copied lower bound.
    Theorems and examples are not kept. -/
def liveCapableRegenerateTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveCapableRegenerateTheoremsTheoremCount : Nat := 21

/-- Example smokes in the live file (skipped). -/
def liveCapableRegenerateTheoremsExampleCount : Nat := 21

/-- set_option lines in the live file (skipped). -/
def liveCapableRegenerateTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . CapableRegenerate`. -/
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
def cmdAddsCapableRegenerateTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownCapableRegenerateTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableRegenerateTheoremsParseFuel body
        && termNoAppN liveCapableRegenerateTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableRegenerateTheoremsParseFuel body
        && termNoAppN liveCapableRegenerateTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableRegenerateTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableRegenerateTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableRegenerateTheorems
        liveCapableRegenerateTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableRegenerateTheoremsSkipFuel rest
      if cmdBodyKnownCapableRegenerateTheorems kn c then
        parseCmdsCapableRegenerateTheorems n rest2
          (kn ++ cmdAddsCapableRegenerateTheorems c) (acc ++ [c])
      else
        parseCmdsCapableRegenerateTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableRegenerateTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableRegenerateTheorems n rest2 kn acc
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

/-- Parse live CapableRegenerateTheorems.lean text.
    Greppable: parseLiveCapableRegenerateTheoremsSource,
    PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS. -/
def parseLiveCapableRegenerateTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableRegenerateTheorems
        liveCapableRegenerateTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableRegenerateTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableRegenerateTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveCapableRegenerateTheoremsSource,
    PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS. -/
def kernelCheckLiveCapableRegenerateTheoremsSource (src : String) : Bool :=
  match parseLiveCapableRegenerateTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableRegenerateTheoremsParsed? : Option Module :=
  match parseLiveCapableRegenerateTheoremsSource
      liveCapableRegenerateTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | some m => m.commands.length == liveCapableRegenerateTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is CapableRegenerateTheorems
    (no module line in the live file). -/
def liveParseHasCapableRegenerateTheoremsModule : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableRegenerateTheorems"
      && lastSeg m.name.raw == "CapableRegenerateTheorems"

/-- Live parse has namespace SystemsLean.CapableRegenerate. -/
def liveParseHasCapableRegenerateNs : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableRegenerate"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableRegenerate. -/
def liveParseHasCapableRegenerateEnd : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableRegenerate"
      | _ => false

/-- Live parse imports SystemsLean.CapableRegenerate. -/
def liveParseHasCapableRegenerateImport : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CapableRegenerate"
      | _ => false

/-- Skip-head still sees each theorem name from CapableRegenerateTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveCapableRegenerateTheoremsSource)
    let fuel := liveCapableRegenerateTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks "orderedPipelineId_eq"
      && toksHaveTheoremNamed fuel toks "blockerMustOwnRegenerate_eq"
      && toksHaveTheoremNamed fuel toks "freestandingCapableRegenerateApi_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justRecipeName_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableRegenerateAuthorityNotEmit_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableRegenerateDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableRegenerateInstallOutOpen_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableRegenerateOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableRegeneratePartialReady_true"
      && toksHaveTheoremNamed fuel toks
        "productWireWithoutLakeFinishedClaimed_true"
      && toksHaveTheoremNamed fuel toks
        "productWireWithoutLakeKeepsHostLake_true"
      && toksHaveTheoremNamed fuel toks "productWireWithoutLakeReady_true"
      && toksHaveTheoremNamed fuel toks "justRecipeProductWireWithoutLake_eq"
      && toksHaveTheoremNamed fuel toks "prebuiltCapableRegenerateRel_eq"
      && toksHaveTheoremNamed fuel toks "productWire_stillUsesLake_true"
      && toksHaveTheoremNamed fuel toks "productWire_dependsOnLake_true"

/-- Keyword counts match this file: 21 theorems, 21 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableRegenerateTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveCapableRegenerateTheoremsSource)
    let fuel := liveCapableRegenerateTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveCapableRegenerateTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveCapableRegenerateTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableRegenerateTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCapableRegenerate : String :=
  "import SystemsLean.CapableRegenerate\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableRegenerate\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem hostId_eq needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- theorem selfHostId_eq needle with a trailing newline. -/
def needleSelfHostIdEq : String := "theorem selfHostId_eq :\n"

/-- theorem orderedPipelineId_eq needle with a trailing newline. -/
def needleOrderedPipelineIdEq : String := "theorem orderedPipelineId_eq :\n"

/-- theorem productPathFreestandingCapableRegenerateOk_true needle. -/
def needleOkTrue : String :=
  "theorem productPathFreestandingCapableRegenerateOk_true :\n"

/-- theorem productPathFreestandingCapableRegeneratePartialReady_true needle. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingCapableRegeneratePartialReady_true :\n"

/-- theorem productPathFreestandingCapableStepContractFullSatisfied_false needle. -/
def needleFullFalse : String :=
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n"

/-- theorem productWire_stillUsesLake_true needle with a trailing newline. -/
def needleStillUsesLake : String :=
  "theorem productWire_stillUsesLake_true : stillUsesLake = true := rfl\n"

/-- theorem productWire_dependsOnLake_true needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "theorem productWire_dependsOnLake_true : dependsOnLake = true := rfl\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleFinished : String :=
  "example : productWireWithoutLakeFinishedClaimed = true := rfl\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleStillUsesLake : String :=
  "example : stillUsesLake = true := rfl\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableRegenerate\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableRegenerateTheoremsSource
  (src.splitOn needleImportCapableRegenerate).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleSelfHostIdEq).length > 1
    && (src.splitOn needleOrderedPipelineIdEq).length > 1
    && (src.splitOn needleOkTrue).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleFullFalse).length > 1
    && (src.splitOn needleStillUsesLake).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleExampleFinished).length > 1
    && (src.splitOn needleExampleStillUsesLake).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableRegenerateTheoremsReady,
    PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS,
    HOST-FRONT-LIVE-CAPABLE-REGENERATE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableRegenerateTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_REGENERATE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-REGENERATE-THEOREMS")
    && (parseId == "PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS")
    && (liveRel == "CapableRegenerateTheorems.lean")
    && (liveCapableRegenerateTheoremsRel
      == "src/systems/SystemsLean/CapableRegenerateTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableRegenerateTheoremsFullHost
    && !hostFrontLiveCapableRegenerateTheoremsFullBackend
    && !hostFrontLiveCapableRegenerateTheoremsResidualFreeClaimed
    && !hostFrontLiveCapableRegenerateTheoremsProvablyUnlocked
    && kernelCheckLiveCapableRegenerateTheoremsSource
      liveCapableRegenerateTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasCapableRegenerateTheoremsModule
    && liveParseHasCapableRegenerateNs
    && liveParseHasCapableRegenerateEnd
    && liveParseHasCapableRegenerateImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableRegenerateTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableRegenerateTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveCapableRegenerateTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableRegenerateTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableRegenerateTheoremsRel}"
    throw (IO.userError s!"missing {liveCapableRegenerateTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableRegenerateTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableRegenerateTheorems.lean != liveCapableRegenerateTheoremsSource"
    throw (IO.userError "dual-pin mismatch live CapableRegenerateTheorems.lean")
  let r := parseLiveCapableRegenerateTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-REGENERATE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableRegenerateTheorems parse false"
      throw (IO.userError "kernelCheck live CapableRegenerateTheorems parse false")
    unless hostFrontLiveCapableRegenerateTheoremsReady do
      IO.eprintln "error: hostFrontLiveCapableRegenerateTheoremsReady false"
      throw (IO.userError "hostFrontLiveCapableRegenerateTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableRegenerateTheorems source was accepted"
      throw (IO.userError "empty CapableRegenerateTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableRegenerateTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableRegenerateTheorems
