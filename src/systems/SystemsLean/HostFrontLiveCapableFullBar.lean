/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableFullBar.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is CapableFullBar.lean. It is not CapableFullBarTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The live Full step-contract pin stays false. That pin is not FullHost.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-FULL-BAR,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_V0,
  PARSE-LIVE-CAPABLE-FULL-BAR, CAPABLE-FULL-BAR-THEOREM, liveRel,
  kernelCheckLiveCapableFullBarSource,
  hostFrontLiveCapableFullBarReady.
  Module: SystemsLean.HostFrontLiveCapableFullBar
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableFullBarSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableFullBar

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-FULL-BAR"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-FULL-BAR"

/-- Live file basename. -/
def liveRel : String := "CapableFullBar.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableFullBarRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableFullBarFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableFullBarFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableFullBarResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableFullBarProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableFullBarParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveCapableFullBarSkipFuel : Nat := 8192

/-- Kept commands: namespace, nineteen literal defs, the two boolean
    folds the kernel can check, and end. No import. IO defs are skipped.
    A count of 4 would drop the literal defs. From CapableFullBar.lean. -/
def liveCapableFullBarKeptCmds : Nat := 23

/-- theorem keyword count. CapableFullBar.lean has no theorem. -/
def liveCapableFullBarTheoremCount : Nat := 0

/-- example keyword count. CapableFullBar.lean has no example. -/
def liveCapableFullBarExampleCount : Nat := 0

/-- set_option keyword count. CapableFullBar.lean has no set_option. -/
def liveCapableFullBarSetOptionCount : Nat := 0

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
def cmdAddsCapableFullBar (c : Cmd) : List String :=
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
def cmdBodyKnownCapableFullBar (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableFullBarParseFuel body
        && termNoAppN liveCapableFullBarParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableFullBarParseFuel body
        && termNoAppN liveCapableFullBarParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableFullBar (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableFullBar : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableFullBar liveCapableFullBarParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableFullBarSkipFuel rest
      if cmdBodyKnownCapableFullBar kn c then
        parseCmdsCapableFullBar n rest2
          (kn ++ cmdAddsCapableFullBar c) (acc ++ [c])
      else
        parseCmdsCapableFullBar n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableFullBarSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableFullBar n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live CapableFullBar.lean text.
    Greppable: parseLiveCapableFullBarSource,
    PARSE-LIVE-CAPABLE-FULL-BAR. -/
def parseLiveCapableFullBarSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableFullBar liveCapableFullBarParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableFullBar"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableFullBar parse. Not a fixture.
    Greppable: kernelCheckLiveCapableFullBarSource,
    PARSE-LIVE-CAPABLE-FULL-BAR. -/
def kernelCheckLiveCapableFullBarSource (src : String) : Bool :=
  match parseLiveCapableFullBarSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableFullBarParsed? : Option Module :=
  match parseLiveCapableFullBarSource liveCapableFullBarSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableFullBarParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableFullBarParsed? with
  | some m => m.commands.length == liveCapableFullBarKeptCmds
  | none => false

/-- Literal defs the kernel must keep, plus the two boolean folds. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCapableFullBarParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "selfHostId"
      && has "productPathFreestandingCapableStepContractFullSatisfied"
      && has "productPathFreestandingCapableFullBarDependsOnLake"
      && has "productPathFreestandingCapableFullBarOk"
      && has "productPathFreestandingCapableFullBarPartialReady"

/-- Wrap module lastSeg is CapableFullBar (no module line in the live file). -/
def liveParseHasCapableFullBarModule : Bool :=
  match liveCapableFullBarParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableFullBar"
      && lastSeg m.name.raw == "CapableFullBar"

/-- Live parse has namespace SystemsLean.CapableFullBar. -/
def liveParseHasCapableFullBarNs : Bool :=
  match liveCapableFullBarParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableFullBar"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableFullBar. -/
def liveParseHasCapableFullBarEnd : Bool :=
  match liveCapableFullBarParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableFullBar"
      | _ => false

/-- Live parse has no import. CapableFullBar.lean has no import line. -/
def liveParseHasNoImport : Bool :=
  match liveCapableFullBarParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableFullBarParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableFullBarSource)
    let fuel := liveCapableFullBarSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableFullBarTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableFullBarExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableFullBarSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableFullBar\n"

/-- stageId def needle. The string literal is on the next line. -/
def needleStageId : String := "def stageId : String :=\n"

/-- hostId def needle. The string literal is on the next line. -/
def needleHostId : String := "def hostId : String :=\n"

/-- selfHostId def needle. The string literal is on the next line. -/
def needleSelfHostId : String := "def selfHostId : String :=\n"

/-- Closed step-contract literal. -/
def needleStepContractsClosed : String :=
  "def productPathFreestandingCapableFullBarStepContractsClosed : Bool := true\n"

/-- Full step-contract pin stays false. -/
def needleFullSatisfied : String :=
  "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false\n"

/-- Lake dependency honesty literal. -/
def needleDependsOnLake : String :=
  "def productPathFreestandingCapableFullBarDependsOnLake : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableFullBar\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import needle. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableFullBarSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSelfHostId).length > 1
    && (src.splitOn needleStepContractsClosed).length > 1
    && (src.splitOn needleFullSatisfied).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableFullBarReady,
    PARSE-LIVE-CAPABLE-FULL-BAR,
    HOST-FRONT-LIVE-CAPABLE-FULL-BAR.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableFullBarReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_FULL_BAR_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-FULL-BAR")
    && (parseId == "PARSE-LIVE-CAPABLE-FULL-BAR")
    && (liveRel == "CapableFullBar.lean")
    && (liveCapableFullBarRel
      == "src/systems/SystemsLean/CapableFullBar.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableFullBarFullHost
    && !hostFrontLiveCapableFullBarFullBackend
    && !hostFrontLiveCapableFullBarResidualFreeClaimed
    && !hostFrontLiveCapableFullBarProvablyUnlocked
    && kernelCheckLiveCapableFullBarSource liveCapableFullBarSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasCapableFullBarModule
    && liveParseHasCapableFullBarNs
    && liveParseHasCapableFullBarEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableFullBarSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def emitParsedCmd (c : Cmd) : IO Unit := do
  match c with
  | Cmd.importModule x => IO.println s!"  import {x.raw}"
  | Cmd.namespace x => IO.println s!"  namespace {x.raw}"
  | Cmd.endNamespace x => IO.println s!"  end {x.raw}"
  | Cmd.def_ x _ _ => IO.println s!"  def {x.raw}"
  | Cmd.defBind x _ _ _ => IO.println s!"  defBind {x.raw}"
  | Cmd.openNs _ => IO.println "  open"
  | Cmd.inductive_ x _ _ => IO.println s!"  inductive {x.raw}"
  | Cmd.structure_ x _ _ => IO.println s!"  structure {x.raw}"
  | Cmd.check _ _ => IO.println "  check"

def runLiveCapableFullBar (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-FULL-BAR =="
  IO.println s!"  host={hostId} file={liveCapableFullBarRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableFullBarRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableFullBarRel}"
    throw (IO.userError s!"missing {liveCapableFullBarRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableFullBarSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableFullBar.lean != liveCapableFullBarSource"
    throw (IO.userError "dual-pin mismatch live CapableFullBar.lean")
  let r := parseLiveCapableFullBarSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-FULL-BAR reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-FULL-BAR reject {reason}")
  | FrontResult.accept m =>
    for c in m.commands do
      emitParsedCmd c
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-FULL-BAR ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"countOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} module={liveParseHasCapableFullBarModule} ns={liveParseHasCapableFullBarNs} end={liveParseHasCapableFullBarEnd} noImport={liveParseHasNoImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk} ready={hostFrontLiveCapableFullBarReady}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableFullBar parse false"
      throw (IO.userError "kernelCheck live CapableFullBar parse false")
    unless hostFrontLiveCapableFullBarReady do
      IO.eprintln "error: hostFrontLiveCapableFullBarReady false"
      throw (IO.userError "hostFrontLiveCapableFullBarReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableFullBar source was accepted"
      throw (IO.userError "empty CapableFullBar source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableFullBar root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableFullBar
