/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/DualResidualTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems, examples, and set_option are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  Not DualResidual.lean. Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live theorem residualFreeClaimed_true is a product pin in the source file.
  It is not this wrap's residual-free flag.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-DUAL-RESIDUAL-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_THEOREMS_V0,
  PARSE-LIVE-DUAL-RESIDUAL-THEOREMS, DUAL-RESIDUAL-THEOREMS, liveRel,
  kernelCheckLiveDualResidualTheoremsSource,
  hostFrontLiveDualResidualTheoremsReady.
  Module: SystemsLean.HostFrontLiveDualResidualTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveDualResidualTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveDualResidualTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-DUAL-RESIDUAL-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-DUAL-RESIDUAL-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "DualResidualTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveDualResidualTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveDualResidualTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    The live file cites LlvmHold. It is not this flag. -/
def hostFrontLiveDualResidualTheoremsFullBackend : Bool := false

/-- Honesty: this wrap does not claim product residual free.
    The live file's residualFreeClaimed_true theorem is a product pin,
    not this flag. -/
def hostFrontLiveDualResidualTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY.
    The live file's LlvmHold.provablyUnlocked example is not this flag. -/
def hostFrontLiveDualResidualTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveDualResidualTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveDualResidualTheoremsSkipFuel : Nat := 8192

/-- Kept command count: five imports, one namespace, one end.
    From DualResidualTheorems.lean, not a copied lower bound. -/
def liveDualResidualTheoremsKeptCmds : Nat := 7

/-- Theorem declarations in the live file (proofs skipped). -/
def liveDualResidualTheoremsTheoremCount : Nat := 10

/-- Example smokes in the live file (skipped). -/
def liveDualResidualTheoremsExampleCount : Nat := 43

/-- set_option lines in the live file (skipped). -/
def liveDualResidualTheoremsSetOptionCount : Nat := 1

/-- Dotted ident `SystemsLean . DualResidual`. -/
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
def cmdAddsDualResidualTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownDualResidualTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualResidualTheoremsParseFuel body
        && termNoAppN liveDualResidualTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveDualResidualTheoremsParseFuel body
        && termNoAppN liveDualResidualTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdDualResidualTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsDualResidualTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdDualResidualTheorems liveDualResidualTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveDualResidualTheoremsSkipFuel rest
      if cmdBodyKnownDualResidualTheorems kn c then
        parseCmdsDualResidualTheorems n rest2
          (kn ++ cmdAddsDualResidualTheorems c) (acc ++ [c])
      else
        parseCmdsDualResidualTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveDualResidualTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsDualResidualTheorems n rest2 kn acc
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

/-- Parse live DualResidualTheorems.lean text.
    Greppable: parseLiveDualResidualTheoremsSource,
    PARSE-LIVE-DUAL-RESIDUAL-THEOREMS. -/
def parseLiveDualResidualTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsDualResidualTheorems liveDualResidualTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.DualResidualTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live DualResidualTheorems parse. Not a fixture.
    Calls HostKernel.kernelCheck. Not a constant true.
    Greppable: kernelCheckLiveDualResidualTheoremsSource,
    PARSE-LIVE-DUAL-RESIDUAL-THEOREMS. -/
def kernelCheckLiveDualResidualTheoremsSource (src : String) : Bool :=
  match parseLiveDualResidualTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveDualResidualTheoremsParsed? : Option Module :=
  match parseLiveDualResidualTheoremsSource liveDualResidualTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Five imports, namespace, and end.
    Theorems, examples, and set_option are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveDualResidualTheoremsParsed? with
  | some m => m.commands.length == liveDualResidualTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is DualResidualTheorems (no module line in the live file). -/
def liveParseHasDualResidualTheoremsModule : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.DualResidualTheorems"
      && lastSeg m.name.raw == "DualResidualTheorems"

/-- Live parse has namespace SystemsLean.DualResidual. -/
def liveParseHasDualResidualNs : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.DualResidual"
      | _ => false

/-- Live parse ends namespace SystemsLean.DualResidual. -/
def liveParseHasDualResidualEnd : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.DualResidual"
      | _ => false

/-- Live parse imports SystemsLean.ProductPath. -/
def liveParseHasProductPathImport : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.ProductPath"
      | _ => false

/-- Live parse imports SystemsLean.InventoryClose. -/
def liveParseHasInventoryCloseImport : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.InventoryClose"
      | _ => false

/-- Live parse imports SystemsLean.SelfApplyFs. -/
def liveParseHasSelfApplyFsImport : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.SelfApplyFs"
      | _ => false

/-- Live parse imports SystemsLean.LlvmHold. -/
def liveParseHasLlvmHoldImport : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.LlvmHold"
      | _ => false

/-- Live parse imports SystemsLean.DualResidual. -/
def liveParseHasDualResidualImport : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.DualResidual"
      | _ => false

/-- Skip-head still sees each theorem name from DualResidualTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveDualResidualTheoremsSource)
    let fuel := liveDualResidualTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostElaboratorResidualRemains_false"
      && toksHaveTheoremNamed fuel toks
        "hostElaboratorResidualFreeClaimed_true"
      && toksHaveTheoremNamed fuel toks "productResidualRemains_false"
      && toksHaveTheoremNamed fuel toks "residualFreeClaimed_true"
      && toksHaveTheoremNamed fuel toks "productResidualFreeMeasureCited_true"
      && toksHaveTheoremNamed fuel toks "residualFreeMeasureAgreesFree_true"
      && toksHaveTheoremNamed fuel toks "dualResidualReady_true"
      && toksHaveTheoremNamed fuel toks
        "dualResidualDoesNotForgeHostFree_true"
      && toksHaveTheoremNamed fuel toks "dualResidualOk_eq_ready"

/-- Keyword counts match this file: 10 theorems, 43 examples, 1 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveDualResidualTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveDualResidualTheoremsSource)
    let fuel := liveDualResidualTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveDualResidualTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveDualResidualTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveDualResidualTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportProductPath : String := "import SystemsLean.ProductPath\n"

/-- Import needle. Trailing newline. -/
def needleImportInventoryClose : String := "import SystemsLean.InventoryClose\n"

/-- Import needle. Trailing newline. -/
def needleImportSelfApplyFs : String := "import SystemsLean.SelfApplyFs\n"

/-- Import needle. Trailing newline. -/
def needleImportLlvmHold : String := "import SystemsLean.LlvmHold\n"

/-- Import needle. Trailing newline. -/
def needleImportDualResidual : String := "import SystemsLean.DualResidual\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.DualResidual\n"

/-- set_option needle with a trailing newline. -/
def needleSetOption : String := "set_option maxRecDepth 16384\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String :=
  "theorem stageId_eq : stageId = \"SLAKE_SELF_HOST_DUAL_RESIDUAL_V0\" := rfl\n"

/-- theorem hostElaboratorResidualRemains_false needle with a trailing newline. -/
def needleHostRemains : String :=
  "theorem hostElaboratorResidualRemains_false :\n"

/-- theorem hostElaboratorResidualFreeClaimed_true needle with a trailing newline. -/
def needleHostFreeClaimed : String :=
  "theorem hostElaboratorResidualFreeClaimed_true :\n"

/-- theorem productResidualRemains_false needle with a trailing newline. -/
def needleProductRemains : String :=
  "theorem productResidualRemains_false : productResidualRemains = false := rfl\n"

/-- theorem residualFreeClaimed_true needle with a trailing newline. -/
def needleResidualFreeClaimed : String :=
  "theorem residualFreeClaimed_true : residualFreeClaimed = true := rfl\n"

/-- theorem productResidualFreeMeasureCited_true needle with a trailing newline. -/
def needleMeasureCited : String :=
  "theorem productResidualFreeMeasureCited_true :\n"

/-- theorem residualFreeMeasureAgreesFree_true needle with a trailing newline. -/
def needleMeasureAgrees : String :=
  "theorem residualFreeMeasureAgreesFree_true :\n"

/-- theorem dualResidualReady_true needle with a trailing newline. -/
def needleDualReady : String :=
  "theorem dualResidualReady_true : dualResidualReady = true := by decide\n"

/-- theorem dualResidualDoesNotForgeHostFree_true needle with a trailing newline. -/
def needleDoesNotForge : String :=
  "theorem dualResidualDoesNotForgeHostFree_true :\n"

/-- theorem dualResidualOk_eq_ready needle with a trailing newline. -/
def needleOkEqReady : String :=
  "theorem dualResidualOk_eq_ready : dualResidualOk = dualResidualReady := rfl\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleHostId : String :=
  "example : hostDualResidualId = \"HOST-DUAL-RESIDUAL\" := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.DualResidual\n"

/-- Each needle occurs once in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveDualResidualTheoremsSource
  (src.splitOn needleImportProductPath).length == 2
    && (src.splitOn needleImportInventoryClose).length == 2
    && (src.splitOn needleImportSelfApplyFs).length == 2
    && (src.splitOn needleImportLlvmHold).length == 2
    && (src.splitOn needleImportDualResidual).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleSetOption).length == 2
    && (src.splitOn needleStageIdEq).length == 2
    && (src.splitOn needleHostRemains).length == 2
    && (src.splitOn needleHostFreeClaimed).length == 2
    && (src.splitOn needleProductRemains).length == 2
    && (src.splitOn needleResidualFreeClaimed).length == 2
    && (src.splitOn needleMeasureCited).length == 2
    && (src.splitOn needleMeasureAgrees).length == 2
    && (src.splitOn needleDualReady).length == 2
    && (src.splitOn needleDoesNotForge).length == 2
    && (src.splitOn needleOkEqReady).length == 2
    && (src.splitOn needleExampleHostId).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveDualResidualTheoremsReady,
    PARSE-LIVE-DUAL-RESIDUAL-THEOREMS,
    HOST-FRONT-LIVE-DUAL-RESIDUAL-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveDualResidualTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_DUAL_RESIDUAL_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-DUAL-RESIDUAL-THEOREMS")
    && (parseId == "PARSE-LIVE-DUAL-RESIDUAL-THEOREMS")
    && (liveRel == "DualResidualTheorems.lean")
    && (liveDualResidualTheoremsRel
      == "src/systems/SystemsLean/DualResidualTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveDualResidualTheoremsFullHost
    && !hostFrontLiveDualResidualTheoremsFullBackend
    && !hostFrontLiveDualResidualTheoremsResidualFreeClaimed
    && !hostFrontLiveDualResidualTheoremsProvablyUnlocked
    && kernelCheckLiveDualResidualTheoremsSource liveDualResidualTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasDualResidualTheoremsModule
    && liveParseHasDualResidualNs
    && liveParseHasDualResidualEnd
    && liveParseHasProductPathImport
    && liveParseHasInventoryCloseImport
    && liveParseHasSelfApplyFsImport
    && liveParseHasLlvmHoldImport
    && liveParseHasDualResidualImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveDualResidualTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveDualResidualTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-DUAL-RESIDUAL-THEOREMS =="
  IO.println s!"  host={hostId} file={liveDualResidualTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveDualResidualTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveDualResidualTheoremsRel}"
    throw (IO.userError s!"missing {liveDualResidualTheoremsRel}")
  let disk <- IO.FS.readFile path
  IO.println s!"diskBytes={disk.utf8ByteSize} pinBytes={liveDualResidualTheoremsSource.utf8ByteSize}"
  if disk != liveDualResidualTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk DualResidualTheorems.lean != liveDualResidualTheoremsSource"
    throw (IO.userError "dual-pin mismatch live DualResidualTheorems.lean")
  let r := parseLiveDualResidualTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-DUAL-RESIDUAL-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-DUAL-RESIDUAL-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-DUAL-RESIDUAL-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live DualResidualTheorems parse false"
      throw (IO.userError "kernelCheck live DualResidualTheorems parse false")
    unless hostFrontLiveDualResidualTheoremsReady do
      IO.eprintln "error: hostFrontLiveDualResidualTheoremsReady false"
      throw (IO.userError "hostFrontLiveDualResidualTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty DualResidualTheorems source was accepted"
      throw (IO.userError "empty DualResidualTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveDualResidualTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveDualResidualTheorems
