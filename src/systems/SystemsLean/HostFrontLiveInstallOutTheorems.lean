/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/InstallOutTheorems.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Theorems and examples are skipped: HostTerm.Cmd has no theorem
  form, and the proofs are rfl or by decide. Import, namespace, and end stay.
  Theorem names from this file are checked on the token walk.
  This wrap is InstallOutTheorems.lean. It is not InstallOut.lean.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live file does not claim PROVABLY. This wrap's provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-INSTALL-OUT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_THEOREMS_V0,
  PARSE-LIVE-INSTALL-OUT-THEOREMS, INSTALL-OUT-THEOREM, liveRel,
  kernelCheckLiveInstallOutTheoremsSource,
  hostFrontLiveInstallOutTheoremsReady.
  Module: SystemsLean.HostFrontLiveInstallOutTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveInstallOutTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveInstallOutTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-INSTALL-OUT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-INSTALL-OUT-THEOREMS"

/-- Live file relative to repo root. Dual-pin path.
    liveRel itself is defined in the Source module. -/
def liveInstallOutTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveInstallOutTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveInstallOutTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveInstallOutTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveInstallOutTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveInstallOutTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example tails. -/
def liveInstallOutTheoremsSkipFuel : Nat := 8192

/-- Kept command count: one import, one namespace, one end.
    From InstallOutTheorems.lean, not a copied lower bound. -/
def liveInstallOutTheoremsKeptCmds : Nat := 3

/-- Theorem declarations in the live file (proofs skipped). -/
def liveInstallOutTheoremsTheoremCount : Nat := 18

/-- Example smokes in the live file (skipped). -/
def liveInstallOutTheoremsExampleCount : Nat := 18

/-- set_option lines in the live file (skipped). -/
def liveInstallOutTheoremsSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . InstallOut`. -/
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
def cmdAddsInstallOutTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownInstallOutTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInstallOutTheoremsParseFuel body
        && termNoAppN liveInstallOutTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveInstallOutTheoremsParseFuel body
        && termNoAppN liveInstallOutTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdInstallOutTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsInstallOutTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdInstallOutTheorems liveInstallOutTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveInstallOutTheoremsSkipFuel rest
      if cmdBodyKnownInstallOutTheorems kn c then
        parseCmdsInstallOutTheorems n rest2
          (kn ++ cmdAddsInstallOutTheorems c) (acc ++ [c])
      else
        parseCmdsInstallOutTheorems n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveInstallOutTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsInstallOutTheorems n rest2 kn acc
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

/-- Parse live InstallOutTheorems.lean text.
    Greppable: parseLiveInstallOutTheoremsSource,
    PARSE-LIVE-INSTALL-OUT-THEOREMS. -/
def parseLiveInstallOutTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsInstallOutTheorems liveInstallOutTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.InstallOutTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live InstallOutTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveInstallOutTheoremsSource,
    PARSE-LIVE-INSTALL-OUT-THEOREMS. -/
def kernelCheckLiveInstallOutTheoremsSource (src : String) : Bool :=
  match parseLiveInstallOutTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveInstallOutTheoremsParsed? : Option Module :=
  match parseLiveInstallOutTheoremsSource liveInstallOutTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. One import, namespace, and end.
    Theorems and examples are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveInstallOutTheoremsParsed? with
  | some m => m.commands.length == liveInstallOutTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is InstallOutTheorems (no module line in the live file). -/
def liveParseHasInstallOutTheoremsModule : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.InstallOutTheorems"
      && lastSeg m.name.raw == "InstallOutTheorems"

/-- Live parse has namespace SystemsLean.InstallOut. -/
def liveParseHasInstallOutNs : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.InstallOut"
      | _ => false

/-- Live parse ends namespace SystemsLean.InstallOut. -/
def liveParseHasInstallOutEnd : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.InstallOut"
      | _ => false

/-- Live parse imports SystemsLean.InstallOut. -/
def liveParseHasInstallOutImport : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.InstallOut"
      | _ => false

/-- Skip-head still sees each theorem name from InstallOutTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveInstallOutTheoremsSource)
    let fuel := liveInstallOutTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "stageId_eq"
      && toksHaveTheoremNamed fuel toks "hostId_eq"
      && toksHaveTheoremNamed fuel toks "selfHostId_eq"
      && toksHaveTheoremNamed fuel toks "installOutId_eq"
      && toksHaveTheoremNamed fuel toks "writerPathStepInstallOut_eq"
      && toksHaveTheoremNamed fuel toks "blockerMustOwnRegenerate_eq"
      && toksHaveTheoremNamed fuel toks "freestandingCapableInstallOutApi_eq"
      && toksHaveTheoremNamed fuel toks "lakeExeName_eq"
      && toksHaveTheoremNamed fuel toks "justRecipeName_eq"
      && toksHaveTheoremNamed fuel toks "emitHeaderBase_eq"
      && toksHaveTheoremNamed fuel toks "emitSourceBase_eq"
      && toksHaveTheoremNamed fuel toks "productOutRel_eq"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableInstallOutAuthorityNotEmit_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableInstallOutDependsOnLake_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableRegenerateInstallOutOpen_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableStepContractFullSatisfied_false"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableInstallOutOk_true"
      && toksHaveTheoremNamed fuel toks
        "productPathFreestandingCapableInstallOutPartialReady_true"

/-- Keyword counts match this file: 18 theorems, 18 examples, 0 set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveInstallOutTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveInstallOutTheoremsSource)
    let fuel := liveInstallOutTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveInstallOutTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveInstallOutTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveInstallOutTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportInstallOut : String := "import SystemsLean.InstallOut\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.InstallOut\n"

/-- theorem stageId_eq needle with a trailing newline. -/
def needleStageIdEq : String := "theorem stageId_eq :\n"

/-- installOutId equation needle with a trailing newline. -/
def needleInstallOutId : String :=
  "    installOutId = \"FREESTANDING-CAPABLE-INSTALL-OUT\" := rfl\n"

/-- lakeExeName equation needle with a trailing newline. -/
def needleLakeExe : String :=
  "    lakeExeName = \"slake-freestanding-capable-install-out\" := rfl\n"

/-- productOutRel equation needle with a trailing newline. -/
def needleProductOut : String :=
  "    productOutRel = \"out/freestanding-c/\" := rfl\n"

/-- theorem partial-ready needle with a trailing newline. -/
def needlePartialReadyThm : String :=
  "theorem productPathFreestandingCapableInstallOutPartialReady_true :\n"

/-- Example smoke needle with a trailing newline. -/
def needleExamplePartial : String :=
  "example : productPathFreestandingCapableInstallOutPartialReady = true := by\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.InstallOut\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveInstallOutTheoremsSource
  (src.splitOn needleImportInstallOut).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageIdEq).length > 1
    && (src.splitOn needleInstallOutId).length > 1
    && (src.splitOn needleLakeExe).length > 1
    && (src.splitOn needleProductOut).length > 1
    && (src.splitOn needlePartialReadyThm).length > 1
    && (src.splitOn needleExamplePartial).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveInstallOutTheoremsReady,
    PARSE-LIVE-INSTALL-OUT-THEOREMS,
    HOST-FRONT-LIVE-INSTALL-OUT-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveInstallOutTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_INSTALL_OUT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-INSTALL-OUT-THEOREMS")
    && (parseId == "PARSE-LIVE-INSTALL-OUT-THEOREMS")
    && (liveRel == "InstallOutTheorems.lean")
    && (liveInstallOutTheoremsRel
      == "src/systems/SystemsLean/InstallOutTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveInstallOutTheoremsFullHost
    && !hostFrontLiveInstallOutTheoremsFullBackend
    && !hostFrontLiveInstallOutTheoremsResidualFreeClaimed
    && !hostFrontLiveInstallOutTheoremsProvablyUnlocked
    && kernelCheckLiveInstallOutTheoremsSource liveInstallOutTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasInstallOutTheoremsModule
    && liveParseHasInstallOutNs
    && liveParseHasInstallOutEnd
    && liveParseHasInstallOutImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveInstallOutTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveInstallOutTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-INSTALL-OUT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveInstallOutTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveInstallOutTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveInstallOutTheoremsRel}"
    throw (IO.userError s!"missing {liveInstallOutTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveInstallOutTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk InstallOutTheorems.lean != liveInstallOutTheoremsSource"
    throw (IO.userError "dual-pin mismatch live InstallOutTheorems.lean")
  let r := parseLiveInstallOutTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-INSTALL-OUT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-INSTALL-OUT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-INSTALL-OUT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live InstallOutTheorems parse false"
      throw (IO.userError "kernelCheck live InstallOutTheorems parse false")
    unless hostFrontLiveInstallOutTheoremsReady do
      IO.eprintln "error: hostFrontLiveInstallOutTheoremsReady false"
      throw (IO.userError "hostFrontLiveInstallOutTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty InstallOutTheorems source was accepted"
      throw (IO.userError "empty InstallOutTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveInstallOutTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveInstallOutTheorems
