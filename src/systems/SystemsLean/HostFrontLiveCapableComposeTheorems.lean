/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableComposeTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  This wrap is CapableComposeTheorems.lean. It is not CapableCompose.lean.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live file does not claim PROVABLY. This wrap's provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-COMPOSE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS, COMPOSE-THEOREM, liveRel,
  kernelCheckLiveCapableComposeTheoremsSource,
  hostFrontLiveCapableComposeTheoremsReady.
  Module: SystemsLean.HostFrontLiveCapableComposeTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableComposeTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableComposeTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-COMPOSE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "CapableComposeTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableComposeTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableComposeTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableComposeTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableComposeTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableComposeTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableComposeTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveCapableComposeTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From CapableComposeTheorems.lean, not a copied lower bound. -/
def liveCapableComposeTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveCapableComposeTheoremsTheoremCount : Nat := 15

/-- Example smokes in the live file (skipped). -/
def liveCapableComposeTheoremsExampleCount : Nat := 15

/-- set_option lines in the live file (skipped). -/
def liveCapableComposeTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . CapableCompose`. -/
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
def cmdAddsCapableComposeTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownCapableComposeTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableComposeTheoremsParseFuel body
        && termNoAppN liveCapableComposeTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableComposeTheoremsParseFuel body
        && termNoAppN liveCapableComposeTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableComposeTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableComposeTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableComposeTheorems liveCapableComposeTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableComposeTheoremsSkipFuel rest
      if cmdBodyKnownCapableComposeTheorems kn c then
        parseCmdsCapableComposeTheorems n rest2
          (kn ++ cmdAddsCapableComposeTheorems c) (acc ++ [c])
      else
        parseCmdsCapableComposeTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableComposeTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableComposeTheorems n rest2 kn acc
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

/-- Parse live CapableComposeTheorems.lean text.
    Greppable: parseLiveCapableComposeTheoremsSource,
    PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS. -/
def parseLiveCapableComposeTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableComposeTheorems liveCapableComposeTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableComposeTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableComposeTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveCapableComposeTheoremsSource,
    PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS. -/
def kernelCheckLiveCapableComposeTheoremsSource (src : String) : Bool :=
  match parseLiveCapableComposeTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableComposeTheoremsParsed? : Option Module :=
  match parseLiveCapableComposeTheoremsSource liveCapableComposeTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | some m => m.commands.length == liveCapableComposeTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is CapableComposeTheorems (no module line in the live file). -/
def liveParseHasCapableComposeTheoremsModule : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableComposeTheorems"
      && lastSeg m.name.raw == "CapableComposeTheorems"

/-- Live parse has namespace SystemsLean.CapableCompose. -/
def liveParseHasCapableComposeNs : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableCompose"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableCompose. -/
def liveParseHasCapableComposeEnd : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableCompose"
      | _ => false

/-- Live parse imports SystemsLean.CapableCompose. -/
def liveParseHasCapableComposeImport : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CapableCompose"
      | _ => false

/-- Skip-head still sees each theorem name from CapableComposeTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableComposeTheoremsSource)
    let fuel := liveCapableComposeTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks "contractStepCompose_eq"
      && toksHaveTheoremNamed fuel toks "gapCompose_eq"
      && toksHaveTheoremNamed fuel toks "writerPathStepCompose_eq"
      && toksHaveTheoremNamed fuel toks "freestandingCapableComposeApi_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justRecipeName_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableComposeLakeFreeRecipe_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableComposeAuthorityNotEmit_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableComposeDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableComposeOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableComposePartialReady_true"

/-- Keyword counts match this file: 15 theorems, 15 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableComposeTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableComposeTheoremsSource)
    let fuel := liveCapableComposeTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableComposeTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableComposeTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableComposeTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImport : String := "import SystemsLean.CapableCompose\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableCompose\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem hostId_eq needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- theorem selfHostId_eq needle with a trailing newline. -/
def needleSelfHostIdEq : String := "theorem selfHostId_eq :\n"

/-- theorem DependsOnLake needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "theorem productPathFreestandingCapableComposeDependsOnLake_true :\n"

/-- theorem Full land-time false needle with a trailing newline. -/
def needleFullFalse : String :=
  "theorem productPathFreestandingCapableStepContractFullSatisfied_false :\n"

/-- theorem Ok needle with a trailing newline. -/
def needleOk : String :=
  "theorem productPathFreestandingCapableComposeOk_true :\n"

/-- theorem PartialReady needle with a trailing newline. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingCapableComposePartialReady_true :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleStage : String :=
  "example : stageId = \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0\" := by\n"

/-- Example PartialReady smoke needle with a trailing newline. -/
def needleExamplePartial : String :=
  "example : productPathFreestandingCapableComposePartialReady = true := by\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableCompose\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableComposeTheoremsSource
  (src.splitOn needleImport).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleSelfHostIdEq).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleFullFalse).length > 1
    && (src.splitOn needleOk).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleExampleStage).length > 1
    && (src.splitOn needleExamplePartial).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableComposeTheoremsReady,
    PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS,
    HOST-FRONT-LIVE-CAPABLE-COMPOSE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableComposeTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-COMPOSE-THEOREMS")
    && (parseId == "PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS")
    && (liveRel == "CapableComposeTheorems.lean")
    && (liveCapableComposeTheoremsRel
      == "src/systems/SystemsLean/CapableComposeTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableComposeTheoremsFullHost
    && !hostFrontLiveCapableComposeTheoremsFullBackend
    && !hostFrontLiveCapableComposeTheoremsResidualFreeClaimed
    && !hostFrontLiveCapableComposeTheoremsProvablyUnlocked
    && kernelCheckLiveCapableComposeTheoremsSource liveCapableComposeTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasCapableComposeTheoremsModule
    && liveParseHasCapableComposeNs
    && liveParseHasCapableComposeEnd
    && liveParseHasCapableComposeImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableComposeTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableComposeTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveCapableComposeTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableComposeTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableComposeTheoremsRel}"
    throw (IO.userError s!"missing {liveCapableComposeTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableComposeTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableComposeTheorems.lean != liveCapableComposeTheoremsSource"
    throw (IO.userError "dual-pin mismatch live CapableComposeTheorems.lean")
  let r := parseLiveCapableComposeTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-COMPOSE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableComposeTheorems parse false"
      throw (IO.userError "kernelCheck live CapableComposeTheorems parse false")
    unless hostFrontLiveCapableComposeTheoremsReady do
      IO.eprintln "error: hostFrontLiveCapableComposeTheoremsReady false"
      throw (IO.userError "hostFrontLiveCapableComposeTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableComposeTheorems source was accepted"
      throw (IO.userError "empty CapableComposeTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableComposeTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableComposeTheorems
