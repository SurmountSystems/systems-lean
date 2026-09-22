/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/CapableReadTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not CapableRead.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem productPathFreestandingCapableReadOk_true is a product pin
  in the source file. It is not this wrap's provably flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-READ-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-READ-THEOREMS, READ-THEOREM, liveRel,
  kernelCheckLiveCapableReadTheoremsSource,
  hostFrontLiveCapableReadTheoremsReady.
  Module: SystemsLean.HostFrontLiveCapableReadTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableReadTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableReadTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-READ-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-READ-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "CapableReadTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableReadTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableReadTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableReadTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableReadTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file's productPathFreestandingCapableReadOk_true theorem
    is not this flag. -/
def hostFrontLiveCapableReadTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableReadTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveCapableReadTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From CapableReadTheorems.lean. Theorems and examples are not kept. -/
def liveCapableReadTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveCapableReadTheoremsTheoremCount : Nat := 14

/-- Example smokes in the live file (skipped). -/
def liveCapableReadTheoremsExampleCount : Nat := 14

/-- set_option lines in the live file (skipped). -/
def liveCapableReadTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . CapableRead`. -/
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
def cmdAddsCapableReadTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownCapableReadTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableReadTheoremsParseFuel body
        && termNoAppN liveCapableReadTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableReadTheoremsParseFuel body
        && termNoAppN liveCapableReadTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableReadTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableReadTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableReadTheorems liveCapableReadTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableReadTheoremsSkipFuel rest
      if cmdBodyKnownCapableReadTheorems kn c then
        parseCmdsCapableReadTheorems n rest2
          (kn ++ cmdAddsCapableReadTheorems c) (acc ++ [c])
      else
        parseCmdsCapableReadTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableReadTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableReadTheorems n rest2 kn acc
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

/-- Parse live CapableReadTheorems.lean text.
    Greppable: parseLiveCapableReadTheoremsSource,
    PARSE-LIVE-CAPABLE-READ-THEOREMS. -/
def parseLiveCapableReadTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableReadTheorems liveCapableReadTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableReadTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableReadTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveCapableReadTheoremsSource,
    PARSE-LIVE-CAPABLE-READ-THEOREMS. -/
def kernelCheckLiveCapableReadTheoremsSource (src : String) : Bool :=
  match parseLiveCapableReadTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableReadTheoremsParsed? : Option Module :=
  match parseLiveCapableReadTheoremsSource liveCapableReadTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableReadTheoremsParsed? with
  | some m => m.commands.length == liveCapableReadTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is CapableReadTheorems (no module line in the live file). -/
def liveParseHasCapableReadTheoremsModule : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableReadTheorems"
      && lastSeg m.name.raw == "CapableReadTheorems"

/-- Live parse has namespace SystemsLean.CapableRead. -/
def liveParseHasCapableReadNs : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableRead"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableRead. -/
def liveParseHasCapableReadEnd : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableRead"
      | _ => false

/-- Live parse imports SystemsLean.CapableRead. -/
def liveParseHasCapableReadImport : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CapableRead"
      | _ => false

/-- Skip-head still sees each theorem name from CapableReadTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableReadTheoremsSource)
    let fuel := liveCapableReadTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks "contractStepRead_eq"
      && toksHaveTheoremNamed fuel toks "gapReadSsot_eq"
      && toksHaveTheoremNamed fuel toks "freestandingCapableReadApi_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justRecipeName_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableReadLakeFreeRecipe_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableReadAuthorityNotEmit_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableReadDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableReadOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableReadPartialReady_true"

/-- Keyword counts match this file: 14 theorems, 14 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableReadTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableReadTheoremsSource)
    let fuel := liveCapableReadTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableReadTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableReadTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableReadTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCapableRead : String := "import SystemsLean.CapableRead\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableRead\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem hostId_eq needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- theorem selfHostId_eq needle with a trailing newline. -/
def needleSelfHostIdEq : String := "theorem selfHostId_eq :\n"

/-- theorem contractStepRead_eq needle with a trailing newline. -/
def needleContractStepReadEq : String := "theorem contractStepRead_eq :\n"

/-- theorem productPathFreestandingCapableReadOk_true needle. -/
def needleReadOk : String :=
  "theorem productPathFreestandingCapableReadOk_true :\n"

/-- theorem productPathFreestandingCapableReadPartialReady_true needle. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingCapableReadPartialReady_true :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleStage : String :=
  "example : stageId = \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_READ_V0\" := by\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableRead\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableReadTheoremsSource
  (src.splitOn needleImportCapableRead).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleSelfHostIdEq).length > 1
    && (src.splitOn needleContractStepReadEq).length > 1
    && (src.splitOn needleReadOk).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleExampleStage).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableReadTheoremsReady,
    PARSE-LIVE-CAPABLE-READ-THEOREMS,
    HOST-FRONT-LIVE-CAPABLE-READ-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableReadTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-READ-THEOREMS")
    && (parseId == "PARSE-LIVE-CAPABLE-READ-THEOREMS")
    && (liveRel == "CapableReadTheorems.lean")
    && (liveCapableReadTheoremsRel
      == "src/systems/SystemsLean/CapableReadTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableReadTheoremsFullHost
    && !hostFrontLiveCapableReadTheoremsFullBackend
    && !hostFrontLiveCapableReadTheoremsResidualFreeClaimed
    && !hostFrontLiveCapableReadTheoremsProvablyUnlocked
    && kernelCheckLiveCapableReadTheoremsSource liveCapableReadTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasCapableReadTheoremsModule
    && liveParseHasCapableReadNs
    && liveParseHasCapableReadEnd
    && liveParseHasCapableReadImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableReadTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableReadTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-READ-THEOREMS =="
  IO.println s!"  host={hostId} file={liveCapableReadTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableReadTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableReadTheoremsRel}"
    throw (IO.userError s!"missing {liveCapableReadTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableReadTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableReadTheorems.lean != liveCapableReadTheoremsSource"
    throw (IO.userError "dual-pin mismatch live CapableReadTheorems.lean")
  let r := parseLiveCapableReadTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-READ-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-READ-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-READ-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableReadTheorems parse false"
      throw (IO.userError "kernelCheck live CapableReadTheorems parse false")
    unless hostFrontLiveCapableReadTheoremsReady do
      IO.eprintln "error: hostFrontLiveCapableReadTheoremsReady false"
      throw (IO.userError "hostFrontLiveCapableReadTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableReadTheorems source was accepted"
      throw (IO.userError "empty CapableReadTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableReadTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableReadTheorems
