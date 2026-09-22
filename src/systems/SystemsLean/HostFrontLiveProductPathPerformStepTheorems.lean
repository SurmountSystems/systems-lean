/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/ProductPathPerformStepTheorems.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is ProductPathPerformStepTheorems.lean.
  It is not ProductPathPerformStep.lean.
  Literal defs stay when present. This live file has no def.
  theorem and example commands are skipped. Their keyword counts are
  checked. set_option count is 0.
  Not a backend. FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  These PERFORM-STEP theorems do not flip llvm or PROVABLY.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_THEOREMS_V0,
  PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS,
  PRODUCT-PATH-PERFORM-STEP-THEOREMS-THEOREM,
  PERFORM-STEP-THEOREM, liveRel,
  kernelCheckLiveProductPathPerformStepTheoremsSource,
  hostFrontLiveProductPathPerformStepTheoremsReady.
  Module: SystemsLean.HostFrontLiveProductPathPerformStepTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveProductPathPerformStepTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveProductPathPerformStepTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "ProductPathPerformStepTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveProductPathPerformStepTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveProductPathPerformStepTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not a backend. FullBackend stays false. -/
def hostFrontLiveProductPathPerformStepTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveProductPathPerformStepTheoremsResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveProductPathPerformStepTheoremsProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold). -/
def liveProductPathPerformStepTheoremsParseFuel : Nat := 256

/-- Skip fuel for commands whose bodies are not kernel-checkable. -/
def liveProductPathPerformStepTheoremsSkipFuel : Nat := 8192

/-- Kept commands: one import, namespace, and end.
    Theorems and examples are skipped. From
    ProductPathPerformStepTheorems.lean. -/
def liveProductPathPerformStepTheoremsKeptCmds : Nat := 3

/-- theorem keyword count. Ten theorems in the live file. -/
def liveProductPathPerformStepTheoremsTheoremCount : Nat := 10

/-- example keyword count. Nine examples in the live file. -/
def liveProductPathPerformStepTheoremsExampleCount : Nat := 9

/-- set_option keyword count. The live file has no set_option. -/
def liveProductPathPerformStepTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . ProductPathPerformStep`. -/
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
def cmdAddsProductPathPerformStepTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownProductPathPerformStepTheorems (kn : List String) :
    Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathPerformStepTheoremsParseFuel body
        && termNoAppN liveProductPathPerformStepTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveProductPathPerformStepTheoremsParseFuel body
        && termNoAppN liveProductPathPerformStepTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdProductPathPerformStepTheorems (fuel : Nat)
    (toks : List String) : Option (Prod Cmd (List String)) :=
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
def parseCmdsProductPathPerformStepTheorems : Nat -> List String ->
    List String -> List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdProductPathPerformStepTheorems
        liveProductPathPerformStepTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveProductPathPerformStepTheoremsSkipFuel rest
      if cmdBodyKnownProductPathPerformStepTheorems kn c then
        parseCmdsProductPathPerformStepTheorems n rest2
          (kn ++ cmdAddsProductPathPerformStepTheorems c) (acc ++ [c])
      else
        parseCmdsProductPathPerformStepTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t || t == "theorem" || t == "example"
            || t == "set_option" then
          let rest2 :=
            skipUntilCmd liveProductPathPerformStepTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsProductPathPerformStepTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live ProductPathPerformStepTheorems.lean text.
    Greppable: parseLiveProductPathPerformStepTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS. -/
def parseLiveProductPathPerformStepTheoremsSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsProductPathPerformStepTheorems
        liveProductPathPerformStepTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.ProductPathPerformStep"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live ProductPathPerformStepTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveProductPathPerformStepTheoremsSource,
    PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS. -/
def kernelCheckLiveProductPathPerformStepTheoremsSource (src : String) :
    Bool :=
  match parseLiveProductPathPerformStepTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveProductPathPerformStepTheoremsParsed? : Option Module :=
  match parseLiveProductPathPerformStepTheoremsSource
      liveProductPathPerformStepTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Import, namespace, and end.
    Theorems and examples are not kept. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | some m =>
    m.commands.length == liveProductPathPerformStepTheoremsKeptCmds
  | none => false

/-- This live file has no literal def. Theorems are skipped, not kept
    as defs. -/
def liveParseHasNoKeptDef : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Wrap module lastSeg is ProductPathPerformStep
    (namespace in the live file; no module line). -/
def liveParseHasProductPathPerformStepModule : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.ProductPathPerformStep"
      && lastSeg m.name.raw == "ProductPathPerformStep"

/-- Live parse has namespace SystemsLean.ProductPathPerformStep. -/
def liveParseHasProductPathPerformStepNs : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.ProductPathPerformStep"
      | _ => false

/-- Live parse ends namespace SystemsLean.ProductPathPerformStep. -/
def liveParseHasProductPathPerformStepEnd : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x =>
        x.raw == "SystemsLean.ProductPathPerformStep"
      | _ => false

/-- Live parse imports SystemsLean.ProductPathPerformStep. -/
def liveParseHasPerformStepImport : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x =>
        x.raw == "SystemsLean.ProductPathPerformStep"
      | _ => false

/-- Keyword counts: ten theorem, nine example, and set_option is 0. -/
def liveParseKwCountsOk : Bool :=
  match liveProductPathPerformStepTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveProductPathPerformStepTheoremsSource)
    let fuel := liveProductPathPerformStepTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0
        == liveProductPathPerformStepTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0
        == liveProductPathPerformStepTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveProductPathPerformStepTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportPerformStep : String :=
  "import SystemsLean.ProductPathPerformStep\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String :=
  "namespace SystemsLean.ProductPathPerformStep\n"

/-- stageId theorem needle with a trailing newline. -/
def needleStageIdThm : String := "theorem stageId_eq :\n"

/-- hostId theorem needle with a trailing newline. -/
def needleHostIdThm : String := "theorem hostId_eq :\n"

/-- Ok theorem needle with a trailing newline. -/
def needleOkThm : String := "theorem productPathPerformStepOk_true :\n"

/-- PartialReady theorem needle with a trailing newline. -/
def needlePartialReadyThm : String :=
  "theorem productPathPerformStepPartialReady_true :\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.ProductPathPerformStep\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import SystemsLean.ProductPathPerformStepTheorems.
    No set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveProductPathPerformStepTheoremsSource
  (src.splitOn needleImportPerformStep).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdThm).length > 1
    && (src.splitOn needleHostIdThm).length > 1
    && (src.splitOn needleOkThm).length > 1
    && (src.splitOn needlePartialReadyThm).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveProductPathPerformStepTheoremsReady,
    PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS,
    HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveProductPathPerformStepTheoremsReady : Bool :=
  (stageId
    == "SLAKE_HOST_FRONT_LIVE_PRODUCT_PATH_PERFORM_STEP_THEOREMS_V0")
    && (hostId
      == "HOST-FRONT-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS")
    && (parseId == "PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS")
    && (liveRel == "ProductPathPerformStepTheorems.lean")
    && (liveProductPathPerformStepTheoremsRel
      == "src/systems/SystemsLean/ProductPathPerformStepTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveProductPathPerformStepTheoremsFullHost
    && !hostFrontLiveProductPathPerformStepTheoremsFullBackend
    && !hostFrontLiveProductPathPerformStepTheoremsResidualFreeClaimed
    && !hostFrontLiveProductPathPerformStepTheoremsProvablyUnlocked
    && kernelCheckLiveProductPathPerformStepTheoremsSource
      liveProductPathPerformStepTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasNoKeptDef
    && liveParseHasProductPathPerformStepModule
    && liveParseHasProductPathPerformStepNs
    && liveParseHasProductPathPerformStepEnd
    && liveParseHasPerformStepImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveProductPathPerformStepTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveProductPathPerformStepTheorems (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS =="
  IO.println s!"  host={hostId} file={liveProductPathPerformStepTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveProductPathPerformStepTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveProductPathPerformStepTheoremsRel}"
    throw (IO.userError s!"missing {liveProductPathPerformStepTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveProductPathPerformStepTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk ProductPathPerformStepTheorems.lean != liveProductPathPerformStepTheoremsSource"
    throw (IO.userError "dual-pin mismatch live ProductPathPerformStepTheorems.lean")
  let r := parseLiveProductPathPerformStepTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-PRODUCT-PATH-PERFORM-STEP-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live ProductPathPerformStepTheorems parse false"
      throw (IO.userError "kernelCheck live ProductPathPerformStepTheorems parse false")
    unless hostFrontLiveProductPathPerformStepTheoremsReady do
      IO.eprintln "error: hostFrontLiveProductPathPerformStepTheoremsReady false"
      let toks := tokenizeHostTerm
        (stripComments liveProductPathPerformStepTheoremsSource)
      let fuel := liveProductPathPerformStepTheoremsSkipFuel
      IO.eprintln s!"diag theoremTok={toksCountKw fuel toks "theorem" 0} exampleTok={toksCountKw fuel toks "example" 0} setoptTok={toksCountKw fuel toks "set_option" 0}"
      match liveProductPathPerformStepTheoremsParsed? with
      | none => IO.eprintln "diag parsed=none"
      | some pm => IO.eprintln s!"diag parsedCmds={pm.commands.length}"
      IO.eprintln s!"diag cmdCount={liveParseCmdCountOk} noDef={liveParseHasNoKeptDef} module={liveParseHasProductPathPerformStepModule} ns={liveParseHasProductPathPerformStepNs} endNs={liveParseHasProductPathPerformStepEnd} import={liveParseHasPerformStepImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveProductPathPerformStepTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty ProductPathPerformStepTheorems source was accepted"
      throw (IO.userError "empty ProductPathPerformStepTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveProductPathPerformStepTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveProductPathPerformStepTheorems
