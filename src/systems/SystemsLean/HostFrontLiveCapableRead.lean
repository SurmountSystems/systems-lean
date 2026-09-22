/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableRead.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is CapableRead.lean. It is not CapableReadTheorems.lean.
  It is not CapableReadMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  There is no import in CapableRead.lean.
  FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Hyphenated stage id CAPABLE-READ.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-READ,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_V0,
  PARSE-LIVE-CAPABLE-READ, CAPABLE-READ, liveRel,
  kernelCheckLiveCapableReadSource,
  hostFrontLiveCapableReadReady.
  Module: SystemsLean.HostFrontLiveCapableRead
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableReadSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableRead

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-READ"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-READ"

/-- Hyphenated stage id. -/
def capableReadStage : String := "CAPABLE-READ"

/-- Live file basename. -/
def liveRel : String := "CapableRead.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableReadRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableReadFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableReadResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableReadProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableReadParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveCapableReadSkipFuel : Nat := 8192

/-- Kept commands: the accepted parse keeps 14 commands.
    CapableRead.lean has no import. A count of 2 would drop the literal defs.
    From CapableRead.lean. -/
def liveCapableReadKeptCmds : Nat := 14

/-- theorem keyword count. CapableRead.lean has no theorem. -/
def liveCapableReadTheoremCount : Nat := 0

/-- example keyword count. CapableRead.lean has no example. -/
def liveCapableReadExampleCount : Nat := 0

/-- set_option keyword count. CapableRead.lean has no set_option. -/
def liveCapableReadSetOptionCount : Nat := 0

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
def cmdAddsCapableRead (c : Cmd) : List String :=
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
def cmdBodyKnownCapableRead (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableReadParseFuel body
        && termNoAppN liveCapableReadParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableReadParseFuel body
        && termNoAppN liveCapableReadParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and structure are not parsed here. -/
def parseOneCmdCapableRead (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, structure,
    and un-kernelable defs. -/
def parseCmdsCapableRead : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableRead liveCapableReadParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableReadSkipFuel rest
      if cmdBodyKnownCapableRead kn c then
        parseCmdsCapableRead n rest2
          (kn ++ cmdAddsCapableRead c) (acc ++ [c])
      else
        parseCmdsCapableRead n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableReadSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableRead n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live CapableRead.lean text.
    Greppable: parseLiveCapableReadSource,
    PARSE-LIVE-CAPABLE-READ. -/
def parseLiveCapableReadSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableRead liveCapableReadParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableRead"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableRead parse. Not a fixture.
    Greppable: kernelCheckLiveCapableReadSource,
    PARSE-LIVE-CAPABLE-READ. -/
def kernelCheckLiveCapableReadSource (src : String) : Bool :=
  match parseLiveCapableReadSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableReadParsed? : Option Module :=
  match parseLiveCapableReadSource liveCapableReadSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableReadParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable defs. Not a count of 2. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableReadParsed? with
  | some m => m.commands.length == liveCapableReadKeptCmds
  | none => false

/-- Literal defs the kernel must keep.
    productPathFreestandingCapableReadOk and
    productPathFreestandingCapableReadPartialReady are compound and skip-folded. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCapableReadParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "stageId"
      && has "hostId"
      && has "contractStepRead"
      && has "freestandingCapableReadApi"
      && has "productPathFreestandingCapableReadAuthorityNotEmit"
      && has "productPathFreestandingCapableReadDependsOnLake"
      && has "productPathFreestandingCapableStepContractFullSatisfied"

/-- Wrap module lastSeg is CapableRead (no module line in the live file). -/
def liveParseHasCapableReadModule : Bool :=
  match liveCapableReadParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableRead"
      && lastSeg m.name.raw == "CapableRead"

/-- Live parse has namespace SystemsLean.CapableRead. -/
def liveParseHasCapableReadNs : Bool :=
  match liveCapableReadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableRead"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableRead. -/
def liveParseHasCapableReadEnd : Bool :=
  match liveCapableReadParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableRead"
      | _ => false

/-- CapableRead.lean has no import. -/
def liveParseHasNoImport : Bool :=
  match liveCapableReadParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableReadParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableReadSource)
    let fuel := liveCapableReadSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableReadTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableReadExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableReadSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableRead\n"

/-- stageId def needle with a trailing newline. -/
def needleStageId : String := "def stageId : String :=\n"

/-- contractStepRead def needle with a trailing newline. -/
def needleContractStepRead : String :=
  "def contractStepRead : String := \"FREESTANDING-CAPABLE-STEP-CONTRACT-READ\"\n"

/-- gapReadSsot def needle with a trailing newline. -/
def needleGapReadSsot : String :=
  "def gapReadSsot : String := \"FREESTANDING-PERFORM-GAP-READ-SSOT\"\n"

/-- freestandingCapableReadApi def needle with a trailing newline. -/
def needleApi : String :=
  "def freestandingCapableReadApi : String := \"freestandingCapableReadDualSsot\"\n"

/-- Authority-not-emit def needle with a trailing newline. -/
def needleAuthorityNotEmit : String :=
  "def productPathFreestandingCapableReadAuthorityNotEmit : Bool := true\n"

/-- Depends-on-Lake def needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "def productPathFreestandingCapableReadDependsOnLake : Bool := true\n"

/-- Full step-contract def needle with a trailing newline. -/
def needleFullSatisfied : String :=
  "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableRead\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableReadSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleContractStepRead).length > 1
    && (src.splitOn needleGapReadSsot).length > 1
    && (src.splitOn needleApi).length > 1
    && (src.splitOn needleAuthorityNotEmit).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleFullSatisfied).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableReadReady,
    PARSE-LIVE-CAPABLE-READ,
    HOST-FRONT-LIVE-CAPABLE-READ, CAPABLE-READ.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableReadReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_READ_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-READ")
    && (parseId == "PARSE-LIVE-CAPABLE-READ")
    && (capableReadStage == "CAPABLE-READ")
    && (liveRel == "CapableRead.lean")
    && (liveCapableReadRel
      == "src/systems/SystemsLean/CapableRead.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableReadFullHost
    && !hostFrontLiveCapableReadResidualFreeClaimed
    && !hostFrontLiveCapableReadProvablyUnlocked
    && kernelCheckLiveCapableReadSource liveCapableReadSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasCapableReadModule
    && liveParseHasCapableReadNs
    && liveParseHasCapableReadEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableReadSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableRead (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-READ =="
  IO.println s!"  host={hostId} file={liveCapableReadRel}"
  IO.println s!"  stage={capableReadStage}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableReadRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableReadRel}"
    throw (IO.userError s!"missing {liveCapableReadRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableReadSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableRead.lean != liveCapableReadSource"
    throw (IO.userError "dual-pin mismatch live CapableRead.lean")
  let r := parseLiveCapableReadSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-READ reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-READ reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-READ ACCEPT cmds={m.commands.length} kernelCheck={k}"
    for c in m.commands do
      match c with
      | Cmd.def_ x _ _ => IO.println s!"KEPT def {x.raw}"
      | Cmd.defBind x _ _ _ => IO.println s!"KEPT bind {x.raw}"
      | Cmd.namespace x => IO.println s!"KEPT ns {x.raw}"
      | Cmd.endNamespace x => IO.println s!"KEPT end {x.raw}"
      | Cmd.importModule x => IO.println s!"KEPT import {x.raw}"
      | _ => IO.println "KEPT other"
    IO.println s!"flags count={liveParseCmdCountOk} lits={liveParseHasLiteralDefs} mod={liveParseHasCapableReadModule} ns={liveParseHasCapableReadNs} endn={liveParseHasCapableReadEnd} noimp={liveParseHasNoImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableRead parse false"
      throw (IO.userError "kernelCheck live CapableRead parse false")
    unless hostFrontLiveCapableReadReady do
      IO.eprintln "error: hostFrontLiveCapableReadReady false"
      throw (IO.userError "hostFrontLiveCapableReadReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableRead source was accepted"
      throw (IO.userError "empty CapableRead source was accepted")
    IO.println s!"GREEN {stageId} {capableReadStage}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableRead root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableRead
