/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LlvmHoldTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not LlvmHold.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem provablyUnlocked_true is a product pin in the source file.
  It is not this wrap's provably flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-LLVM-HOLD-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_THEOREMS_V0,
  PARSE-LIVE-LLVM-HOLD-THEOREMS, LLVM-HOLD-THEOREM, liveRel,
  kernelCheckLiveLlvmHoldTheoremsSource,
  hostFrontLiveLlvmHoldTheoremsReady.
  Module: SystemsLean.HostFrontLiveLlvmHoldTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLlvmHoldTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLlvmHoldTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LLVM-HOLD-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LLVM-HOLD-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "LlvmHoldTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLlvmHoldTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLlvmHoldTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live file's llvmUnlocked_true theorem is a product pin, not this flag. -/
def hostFrontLiveLlvmHoldTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLlvmHoldTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file's provablyUnlocked_true theorem is not this flag. -/
def hostFrontLiveLlvmHoldTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLlvmHoldTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveLlvmHoldTheoremsSkipFuel : Nat := 8192

/-- Kept command count: two imports, one namespace, one end.
    From LlvmHoldTheorems.lean, not a copied lower bound. -/
def liveLlvmHoldTheoremsKeptCmds : Nat := 4

/-- Theorem declarations in the live file (proofs skipped). -/
def liveLlvmHoldTheoremsTheoremCount : Nat := 8

/-- Example smokes in the live file (skipped). -/
def liveLlvmHoldTheoremsExampleCount : Nat := 18

/-- set_option lines in the live file (skipped). -/
def liveLlvmHoldTheoremsSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . LlvmHold`. -/
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
def cmdAddsLlvmHoldTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownLlvmHoldTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmHoldTheoremsParseFuel body
        && termNoAppN liveLlvmHoldTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLlvmHoldTheoremsParseFuel body
        && termNoAppN liveLlvmHoldTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdLlvmHoldTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsLlvmHoldTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLlvmHoldTheorems liveLlvmHoldTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLlvmHoldTheoremsSkipFuel rest
      if cmdBodyKnownLlvmHoldTheorems kn c then
        parseCmdsLlvmHoldTheorems n rest2
          (kn ++ cmdAddsLlvmHoldTheorems c) (acc ++ [c])
      else
        parseCmdsLlvmHoldTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLlvmHoldTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLlvmHoldTheorems n rest2 kn acc
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

/-- Parse live LlvmHoldTheorems.lean text.
    Greppable: parseLiveLlvmHoldTheoremsSource,
    PARSE-LIVE-LLVM-HOLD-THEOREMS. -/
def parseLiveLlvmHoldTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLlvmHoldTheorems liveLlvmHoldTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LlvmHoldTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LlvmHoldTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveLlvmHoldTheoremsSource,
    PARSE-LIVE-LLVM-HOLD-THEOREMS. -/
def kernelCheckLiveLlvmHoldTheoremsSource (src : String) : Bool :=
  match parseLiveLlvmHoldTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLlvmHoldTheoremsParsed? : Option Module :=
  match parseLiveLlvmHoldTheoremsSource liveLlvmHoldTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Two imports, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | some m => m.commands.length == liveLlvmHoldTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is LlvmHoldTheorems (no module line in the live file). -/
def liveParseHasLlvmHoldTheoremsModule : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.LlvmHoldTheorems"
      && lastSeg m.name.raw == "LlvmHoldTheorems"

/-- Live parse has namespace SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldNs : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Live parse ends namespace SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldEnd : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Live parse imports SystemsLean.SelfApply. -/
def liveParseHasSelfApplyImport : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.SelfApply"
      | _ => false

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Skip-head still sees each theorem name from LlvmHoldTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmHoldTheoremsSource)
    let fuel := liveLlvmHoldTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostLlvmHoldId_eq"
      && toksHaveTheoremNamed fuel toks "llvmUnlocked_true"
      && toksHaveTheoremNamed fuel toks "provablyUnlocked_true"
      && toksHaveTheoremNamed fuel toks
        "freestandingProductSelfHostComplete_false"
      && toksHaveTheoremNamed fuel toks "selfApplyDoesNotUnlockLlvm_true"
      && toksHaveTheoremNamed fuel toks "llvmHoldReady_true"
      && toksHaveTheoremNamed fuel toks "sh6HoldReady_eq_llvmHoldReady"

/-- Keyword counts match this file: 8 theorems, 18 examples, 1 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveLlvmHoldTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLlvmHoldTheoremsSource)
    let fuel := liveLlvmHoldTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveLlvmHoldTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveLlvmHoldTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveLlvmHoldTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportSelfApply : String := "import SystemsLean.SelfApply\n"

/-- Import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.LlvmHold\n"

/-- set_option needle with a trailing newline. -/
def needleSetOption : String := "set_option maxRecDepth 16384\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String :=
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_LLVM_HOLD_V0\" := rfl\n"

/-- theorem hostLlvmHoldId_eq needle with a trailing newline. -/
def needleHostIdEq : String :=
  "theorem hostLlvmHoldId_eq : hostLlvmHoldId = \"HOST-LLVM-HOLD\" := rfl\n"

/-- theorem llvmUnlocked_true needle with a trailing newline. -/
def needleLlvmUnlocked : String :=
  "theorem llvmUnlocked_true : llvmUnlocked = true := rfl\n"

/-- theorem provablyUnlocked_true needle with a trailing newline. -/
def needleProvablyUnlocked : String :=
  "theorem provablyUnlocked_true : provablyUnlocked = true := rfl\n"

/-- theorem llvmHoldReady_true needle with a trailing newline. -/
def needleLlvmHoldReady : String :=
  "theorem llvmHoldReady_true : llvmHoldReady = true := by decide\n"

/-- theorem sh6HoldReady_eq_llvmHoldReady needle with a trailing newline. -/
def needleSh6Eq : String :=
  "theorem sh6HoldReady_eq_llvmHoldReady : sh6HoldReady = llvmHoldReady := rfl\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleHoldOk : String :=
  "example : llvmHoldOk = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.LlvmHold\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveLlvmHoldTheoremsSource
  (src.splitOn needleImportSelfApply).length > 1
    && (src.splitOn needleImportLlvmHold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleSetOption).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleHostIdEq).length > 1
    && (src.splitOn needleLlvmUnlocked).length > 1
    && (src.splitOn needleProvablyUnlocked).length > 1
    && (src.splitOn needleLlvmHoldReady).length > 1
    && (src.splitOn needleSh6Eq).length > 1
    && (src.splitOn needleExampleHoldOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLlvmHoldTheoremsReady,
    PARSE-LIVE-LLVM-HOLD-THEOREMS,
    HOST-FRONT-LIVE-LLVM-HOLD-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveLlvmHoldTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LLVM_HOLD_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-LLVM-HOLD-THEOREMS")
    && (parseId == "PARSE-LIVE-LLVM-HOLD-THEOREMS")
    && (liveRel == "LlvmHoldTheorems.lean")
    && (liveLlvmHoldTheoremsRel
      == "src/systems/SystemsLean/LlvmHoldTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLlvmHoldTheoremsFullHost
    && !hostFrontLiveLlvmHoldTheoremsFullBackend
    && !hostFrontLiveLlvmHoldTheoremsResidualFreeClaimed
    && !hostFrontLiveLlvmHoldTheoremsProvablyUnlocked
    && kernelCheckLiveLlvmHoldTheoremsSource liveLlvmHoldTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasLlvmHoldTheoremsModule
    && liveParseHasLlvmHoldNs
    && liveParseHasLlvmHoldEnd
    && liveParseHasSelfApplyImport
    && liveParseHasLlvmHoldImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLlvmHoldTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveLlvmHoldTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LLVM-HOLD-THEOREMS =="
  IO.println s!"  host={hostId} file={liveLlvmHoldTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveLlvmHoldTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLlvmHoldTheoremsRel}"
    throw (IO.userError s!"missing {liveLlvmHoldTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLlvmHoldTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LlvmHoldTheorems.lean != liveLlvmHoldTheoremsSource"
    throw (IO.userError "dual-pin mismatch live LlvmHoldTheorems.lean")
  let r := parseLiveLlvmHoldTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LLVM-HOLD-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LLVM-HOLD-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LLVM-HOLD-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LlvmHoldTheorems parse false"
      throw (IO.userError "kernelCheck live LlvmHoldTheorems parse false")
    unless hostFrontLiveLlvmHoldTheoremsReady do
      IO.eprintln "error: hostFrontLiveLlvmHoldTheoremsReady false"
      throw (IO.userError "hostFrontLiveLlvmHoldTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty LlvmHoldTheorems source was accepted"
      throw (IO.userError "empty LlvmHoldTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLlvmHoldTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLlvmHoldTheorems
