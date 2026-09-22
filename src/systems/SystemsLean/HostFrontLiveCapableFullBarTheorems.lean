/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableFullBarTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not CapableFullBar.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem productPathFreestandingCapableStepContractFullSatisfied_false
  is a product pin in the source file. It is not this wrap's FullHost flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-FULL-BAR-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS, FULL-BAR-THEOREM, liveRel,
  kernelCheckLiveCapableFullBarTheoremsSource,
  hostFrontLiveCapableFullBarTheoremsReady.
  Module: SystemsLean.HostFrontLiveCapableFullBarTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableFullBarTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableFullBarTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-FULL-BAR-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "CapableFullBarTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableFullBarTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableFullBarTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableFullBarTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableFullBarTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    FULL-BAR theorems do not flip PROVABLY. -/
def hostFrontLiveCapableFullBarTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableFullBarTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveCapableFullBarTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From CapableFullBarTheorems.lean, not a copied LlvmHold def count.
    Theorems and examples are not kept. -/
def liveCapableFullBarTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveCapableFullBarTheoremsTheoremCount : Nat := 21

/-- Example smokes in the live file (skipped). -/
def liveCapableFullBarTheoremsExampleCount : Nat := 18

/-- set_option lines in the live file (none). -/
def liveCapableFullBarTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . CapableFullBar`. -/
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
def cmdAddsCapableFullBarTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownCapableFullBarTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableFullBarTheoremsParseFuel body
        && termNoAppN liveCapableFullBarTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableFullBarTheoremsParseFuel body
        && termNoAppN liveCapableFullBarTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableFullBarTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableFullBarTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableFullBarTheorems
        liveCapableFullBarTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableFullBarTheoremsSkipFuel rest
      if cmdBodyKnownCapableFullBarTheorems kn c then
        parseCmdsCapableFullBarTheorems n rest2
          (kn ++ cmdAddsCapableFullBarTheorems c) (acc ++ [c])
      else
        parseCmdsCapableFullBarTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableFullBarTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableFullBarTheorems n rest2 kn acc
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

/-- Parse live CapableFullBarTheorems.lean text.
    Greppable: parseLiveCapableFullBarTheoremsSource,
    PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS. -/
def parseLiveCapableFullBarTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableFullBarTheorems liveCapableFullBarTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableFullBarTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableFullBarTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveCapableFullBarTheoremsSource,
    PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS. -/
def kernelCheckLiveCapableFullBarTheoremsSource (src : String) : Bool :=
  match parseLiveCapableFullBarTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableFullBarTheoremsParsed? : Option Module :=
  match parseLiveCapableFullBarTheoremsSource liveCapableFullBarTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | some m => m.commands.length == liveCapableFullBarTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is CapableFullBarTheorems (no module line in the live file). -/
def liveParseHasCapableFullBarTheoremsModule : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableFullBarTheorems"
      && lastSeg m.name.raw == "CapableFullBarTheorems"

/-- Live parse has namespace SystemsLean.CapableFullBar.
    The file shares that namespace; it does not open CapableFullBarTheorems. -/
def liveParseHasCapableFullBarNs : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableFullBar"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableFullBar. -/
def liveParseHasCapableFullBarEnd : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableFullBar"
      | _ => false

/-- Live parse imports SystemsLean.CapableFullBar. One import only. -/
def liveParseHasCapableFullBarImport : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CapableFullBar"
      | _ => false

/-- Skip-head still sees each theorem name from CapableFullBarTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableFullBarTheoremsSource)
    let fuel := liveCapableFullBarTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarStepContractsClosed_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarInstallOutClosed_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarOrderedPipelineJoined_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarOwnershipRegenerateWithoutLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarCapableLakeFree_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullBarPartialReady_true"
      && toksHaveTheoremNamed fuel toks
        "fullBarReqOwnershipRegenerateWithoutLake_eq"
      && toksHaveTheoremNamed fuel toks "fullBarReqCapableReadLakeFree_eq"
      && toksHaveTheoremNamed fuel toks "fullBarReqCapableComposeLakeFree_eq"
      && toksHaveTheoremNamed fuel toks "fullBarReqCapableWriteHcLakeFree_eq"
      && toksHaveTheoremNamed fuel toks
        "fullBarReqPerformClaimedWithEvidence_eq"
      && toksHaveTheoremNamed fuel toks
        "fullBarReqOwnershipClaimedWithEvidence_eq"
      && toksHaveTheoremNamed fuel toks "blockerMustOwnRegenerate_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justMeasureRecipe_eq"

/-- Keyword counts match this file: 21 theorems, 18 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableFullBarTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableFullBarTheoremsSource)
    let fuel := liveCapableFullBarTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableFullBarTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableFullBarTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableFullBarTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCapableFullBar : String := "import SystemsLean.CapableFullBar\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableFullBar\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem hostId_eq needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- theorem selfHostId_eq needle with a trailing newline. -/
def needleSelfHostIdEq : String := "theorem selfHostId_eq :\n"

/-- theorem Ok needle with a trailing newline. -/
def needleOkTrue : String :=
  "theorem productPathFreestandingCapableFullBarOk_true :\n"

/-- theorem PartialReady needle with a trailing newline. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingCapableFullBarPartialReady_true :\n"

/-- theorem Full long-name false needle with a trailing newline. -/
def needleFullFalse : String :=
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n"

/-- theorem DependsOnLake needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "theorem productPathFreestandingCapableFullBarDependsOnLake_true :\n"

/-- theorem lakeExeName_eq needle with a trailing newline. -/
def needleLakeExe : String := "theorem lakeExeName_eq :\n"

/-- theorem justMeasureRecipe_eq needle with a trailing newline. -/
def needleJustRecipe : String := "theorem justMeasureRecipe_eq :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleOk : String :=
  "example : productPathFreestandingCapableFullBarOk = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableFullBar\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No set_option needle: this file has none. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableFullBarTheoremsSource
  (src.splitOn needleImportCapableFullBar).length > 1
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
    && (src.splitOn needleExampleOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableFullBarTheoremsReady,
    PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS,
    HOST-FRONT-LIVE-CAPABLE-FULL-BAR-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableFullBarTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-FULL-BAR-THEOREMS")
    && (parseId == "PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS")
    && (liveRel == "CapableFullBarTheorems.lean")
    && (liveCapableFullBarTheoremsRel
      == "src/systems/SystemsLean/CapableFullBarTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableFullBarTheoremsFullHost
    && !hostFrontLiveCapableFullBarTheoremsFullBackend
    && !hostFrontLiveCapableFullBarTheoremsResidualFreeClaimed
    && !hostFrontLiveCapableFullBarTheoremsProvablyUnlocked
    && kernelCheckLiveCapableFullBarTheoremsSource liveCapableFullBarTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasCapableFullBarTheoremsModule
    && liveParseHasCapableFullBarNs
    && liveParseHasCapableFullBarEnd
    && liveParseHasCapableFullBarImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableFullBarTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableFullBarTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS =="
  IO.println s!"  host={hostId} file={liveCapableFullBarTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableFullBarTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableFullBarTheoremsRel}"
    throw (IO.userError s!"missing {liveCapableFullBarTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableFullBarTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableFullBarTheorems.lean != liveCapableFullBarTheoremsSource"
    throw (IO.userError "dual-pin mismatch live CapableFullBarTheorems.lean")
  let r := parseLiveCapableFullBarTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-FULL-BAR-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableFullBarTheorems parse false"
      throw (IO.userError "kernelCheck live CapableFullBarTheorems parse false")
    unless hostFrontLiveCapableFullBarTheoremsReady do
      IO.eprintln "error: hostFrontLiveCapableFullBarTheoremsReady false"
      throw (IO.userError "hostFrontLiveCapableFullBarTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableFullBarTheorems source was accepted"
      throw (IO.userError "empty CapableFullBarTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableFullBarTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableFullBarTheorems
