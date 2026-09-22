/-
  SYSTEMS_LEAN_HOST partial. Parse live
  src/systems/SystemsLean/CapableTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not Capable.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem productPathFreestandingCapableOk_true is a product pin
  in the source file. It is not this wrap's provably flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_THEOREMS_V0,
  PARSE-LIVE-CAPABLE-THEOREMS, CAPABLE-GAP-THEOREM, liveRel,
  kernelCheckLiveCapableTheoremsSource,
  hostFrontLiveCapableTheoremsReady.
  Module: SystemsLean.HostFrontLiveCapableTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel is defined in HostFrontLiveCapableTheoremsSource. -/
def liveCapableTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file's productPathFreestandingCapableOk_true theorem is not this flag. -/
def hostFrontLiveCapableTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveCapableTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From CapableTheorems.lean. Theorems and examples are not kept. -/
def liveCapableTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveCapableTheoremsTheoremCount : Nat := 20

/-- Example smokes in the live file (skipped). -/
def liveCapableTheoremsExampleCount : Nat := 20

/-- set_option lines in the live file (skipped). -/
def liveCapableTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . Capable`. -/
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
def cmdAddsCapableTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownCapableTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableTheoremsParseFuel body
        && termNoAppN liveCapableTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableTheoremsParseFuel body
        && termNoAppN liveCapableTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableTheorems liveCapableTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableTheoremsSkipFuel rest
      if cmdBodyKnownCapableTheorems kn c then
        parseCmdsCapableTheorems n rest2
          (kn ++ cmdAddsCapableTheorems c) (acc ++ [c])
      else
        parseCmdsCapableTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableTheorems n rest2 kn acc
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

/-- Parse live CapableTheorems.lean text.
    Greppable: parseLiveCapableTheoremsSource,
    PARSE-LIVE-CAPABLE-THEOREMS. -/
def parseLiveCapableTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableTheorems liveCapableTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveCapableTheoremsSource,
    PARSE-LIVE-CAPABLE-THEOREMS. -/
def kernelCheckLiveCapableTheoremsSource (src : String) : Bool :=
  match parseLiveCapableTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableTheoremsParsed? : Option Module :=
  match parseLiveCapableTheoremsSource liveCapableTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableTheoremsParsed? with
  | some m => m.commands.length == liveCapableTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is CapableTheorems (no module line in the live file). -/
def liveParseHasCapableTheoremsModule : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableTheorems"
      && lastSeg m.name.raw == "CapableTheorems"

/-- Live parse has namespace SystemsLean.Capable. -/
def liveParseHasCapableNs : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.Capable"
      | _ => false

/-- Live parse ends namespace SystemsLean.Capable. -/
def liveParseHasCapableEnd : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.Capable"
      | _ => false

/-- Live parse imports SystemsLean.Capable. -/
def liveParseHasCapableImport : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.Capable"
      | _ => false

/-- Skip-head still sees each theorem name from CapableTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableTheoremsSource)
    let fuel := liveCapableTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks "gapReadSsot_eq"
      && toksHaveTheoremNamed fuel toks "gapCompose_eq"
      && toksHaveTheoremNamed fuel toks "gapWriteHc_eq"
      && toksHaveTheoremNamed fuel toks "writerPathStepInstall_eq"
      && toksHaveTheoremNamed fuel toks "orderedPipelineRecipe_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableReadLakeFreeRecipe_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableComposeLakeFreeRecipe_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableWriteHcLakeFreeRecipe_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justMeasureRecipe_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableInstallOnly_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableRead_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableCompose_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableWriteHc_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableFullPerform_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapablePartialReady_true"

/-- Keyword counts match this file: 20 theorems, 20 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableTheoremsSource)
    let fuel := liveCapableTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportCapable : String := "import SystemsLean.Capable\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.Capable\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- theorem hostId_eq needle with a trailing newline. -/
def needleHostIdEq : String := "theorem hostId_eq :\n"

/-- theorem selfHostId_eq needle with a trailing newline. -/
def needleSelfHostIdEq : String := "theorem selfHostId_eq :\n"

/-- theorem gapReadSsot_eq needle with a trailing newline. -/
def needleGapReadSsotEq : String := "theorem gapReadSsot_eq :\n"

/-- theorem productPathFreestandingCapableFullPerform_false needle. -/
def needleFullPerformFalse : String :=
  "theorem productPathFreestandingCapableFullPerform_false :\n"

/-- theorem productPathFreestandingCapableOk_true needle. -/
def needleOkTrue : String :=
  "theorem productPathFreestandingCapableOk_true :\n"

/-- theorem productPathFreestandingCapablePartialReady_true needle. -/
def needlePartialReady : String :=
  "theorem productPathFreestandingCapablePartialReady_true :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleFullPerform : String :=
  "example : productPathFreestandingCapableFullPerform = false := by\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.Capable\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableTheoremsSource
  (src.splitOn needleImportCapable).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleSelfHostIdEq).length > 1
    && (src.splitOn needleGapReadSsotEq).length > 1
    && (src.splitOn needleFullPerformFalse).length > 1
    && (src.splitOn needleOkTrue).length > 1
    && (src.splitOn needlePartialReady).length > 1
    && (src.splitOn needleExampleFullPerform).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableTheoremsReady,
    PARSE-LIVE-CAPABLE-THEOREMS,
    HOST-FRONT-LIVE-CAPABLE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-THEOREMS")
    && (parseId == "PARSE-LIVE-CAPABLE-THEOREMS")
    && (liveRel == "CapableTheorems.lean")
    && (liveCapableTheoremsRel
      == "src/systems/SystemsLean/CapableTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableTheoremsFullHost
    && !hostFrontLiveCapableTheoremsFullBackend
    && !hostFrontLiveCapableTheoremsResidualFreeClaimed
    && !hostFrontLiveCapableTheoremsProvablyUnlocked
    && kernelCheckLiveCapableTheoremsSource liveCapableTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasCapableTheoremsModule
    && liveParseHasCapableNs
    && liveParseHasCapableEnd
    && liveParseHasCapableImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveCapableTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableTheoremsRel}"
    throw (IO.userError s!"missing {liveCapableTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableTheorems.lean != liveCapableTheoremsSource"
    throw (IO.userError "dual-pin mismatch live CapableTheorems.lean")
  let r := parseLiveCapableTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableTheorems parse false"
      throw (IO.userError "kernelCheck live CapableTheorems parse false")
    unless hostFrontLiveCapableTheoremsReady do
      IO.eprintln "error: hostFrontLiveCapableTheoremsReady false"
      throw (IO.userError "hostFrontLiveCapableTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableTheorems source was accepted"
      throw (IO.userError "empty CapableTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableTheorems
