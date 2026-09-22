/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableStepContract.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is CapableStepContract.lean. It is not CapableStepContractTheorems.lean.
  It is not CapableStepContractMain.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_V0,
  PARSE-LIVE-CAPABLE-STEP-CONTRACT, liveRel,
  kernelCheckLiveCapableStepContractSource,
  hostFrontLiveCapableStepContractReady.
  Module: SystemsLean.HostFrontLiveCapableStepContract
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableStepContractSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableStepContract

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-STEP-CONTRACT"

/-- Live file basename. -/
def liveRel : String := "CapableStepContract.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableStepContractRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableStepContractFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveCapableStepContractFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableStepContractResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableStepContractProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableStepContractParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveCapableStepContractSkipFuel : Nat := 8192

/-- Kept commands: namespace, kernel-checkable literal defs, and end.
    CapableStepContract.lean has no import. -/
def liveCapableStepContractKeptCmds : Nat := 28

/-- theorem keyword count. CapableStepContract.lean has no theorem. -/
def liveCapableStepContractTheoremCount : Nat := 0

/-- example keyword count. CapableStepContract.lean has no example. -/
def liveCapableStepContractExampleCount : Nat := 0

/-- set_option keyword count. CapableStepContract.lean has no set_option. -/
def liveCapableStepContractSetOptionCount : Nat := 0

/-- Dotted ident. -/
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
def cmdAddsCapableStepContract (c : Cmd) : List String :=
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
def cmdBodyKnownCapableStepContract (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableStepContractParseFuel body
        && termNoAppN liveCapableStepContractParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableStepContractParseFuel body
        && termNoAppN liveCapableStepContractParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableStepContract (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableStepContract : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableStepContract liveCapableStepContractParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableStepContractSkipFuel rest
      if cmdBodyKnownCapableStepContract kn c then
        parseCmdsCapableStepContract n rest2
          (kn ++ cmdAddsCapableStepContract c) (acc ++ [c])
      else
        parseCmdsCapableStepContract n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableStepContractSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableStepContract n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live CapableStepContract.lean text.
    Greppable: parseLiveCapableStepContractSource,
    PARSE-LIVE-CAPABLE-STEP-CONTRACT. -/
def parseLiveCapableStepContractSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableStepContract liveCapableStepContractParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableStepContract"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableStepContract parse. Not a fixture.
    Greppable: kernelCheckLiveCapableStepContractSource,
    PARSE-LIVE-CAPABLE-STEP-CONTRACT. -/
def kernelCheckLiveCapableStepContractSource (src : String) : Bool :=
  match parseLiveCapableStepContractSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableStepContractParsed? : Option Module :=
  match parseLiveCapableStepContractSource liveCapableStepContractSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableStepContractParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, kernel-checkable defs, and end. No import. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableStepContractParsed? with
  | some m => m.commands.length == liveCapableStepContractKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCapableStepContractParsed? with
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
      && has "hostLakeBootstrapRemainsForWriter"
      && has "productPathFreestandingCapableStepContractAuthorityNotEmit"

/-- Wrap module lastSeg is CapableStepContract (no module line in the live file). -/
def liveParseHasCapableStepContractModule : Bool :=
  match liveCapableStepContractParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableStepContract"
      && lastSeg m.name.raw == "CapableStepContract"

/-- Live parse has namespace SystemsLean.CapableStepContract. -/
def liveParseHasCapableStepContractNs : Bool :=
  match liveCapableStepContractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableStepContract"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableStepContract. -/
def liveParseHasCapableStepContractEnd : Bool :=
  match liveCapableStepContractParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableStepContract"
      | _ => false

/-- Live parse has no import. CapableStepContract.lean has no import. -/
def liveParseHasNoImport : Bool :=
  match liveCapableStepContractParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableStepContractParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableStepContractSource)
    let fuel := liveCapableStepContractSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableStepContractTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableStepContractExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableStepContractSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableStepContract\n"

/-- stageId def needle. Two lines, trailing newline, as in the product file. -/
def needleStageId : String :=
  "def stageId : String :=\n  \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_STEP_CONTRACT_V0\"\n"

/-- hostId def needle. Two lines, trailing newline, as in the product file. -/
def needleHostId : String :=
  "def hostId : String :=\n  \"HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT\"\n"

/-- selfHostId def needle. Two lines, trailing newline, as in the product file. -/
def needleSelfHostId : String :=
  "def selfHostId : String :=\n  \"SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-STEP-CONTRACT\"\n"

/-- hostLakeBootstrapRemainsForWriter def needle with a trailing newline. -/
def needleHostLakeBootstrap : String :=
  "def hostLakeBootstrapRemainsForWriter : Bool := true\n"

/-- AuthorityNotEmit def needle with a trailing newline. -/
def needleAuthorityNotEmit : String :=
  "def productPathFreestandingCapableStepContractAuthorityNotEmit : Bool := true\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableStepContract\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableStepContractSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSelfHostId).length > 1
    && (src.splitOn needleHostLakeBootstrap).length > 1
    && (src.splitOn needleAuthorityNotEmit).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableStepContractReady,
    PARSE-LIVE-CAPABLE-STEP-CONTRACT,
    HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableStepContractReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_STEP_CONTRACT_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-STEP-CONTRACT")
    && (parseId == "PARSE-LIVE-CAPABLE-STEP-CONTRACT")
    && (liveRel == "CapableStepContract.lean")
    && (liveCapableStepContractRel
      == "src/systems/SystemsLean/CapableStepContract.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableStepContractFullHost
    && !hostFrontLiveCapableStepContractFullBackend
    && !hostFrontLiveCapableStepContractResidualFreeClaimed
    && !hostFrontLiveCapableStepContractProvablyUnlocked
    && kernelCheckLiveCapableStepContractSource liveCapableStepContractSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasCapableStepContractModule
    && liveParseHasCapableStepContractNs
    && liveParseHasCapableStepContractEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableStepContractSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableStepContract (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-STEP-CONTRACT =="
  IO.println s!"  host={hostId} file={liveCapableStepContractRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableStepContractRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableStepContractRel}"
    throw (IO.userError s!"missing {liveCapableStepContractRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableStepContractSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableStepContract.lean != liveCapableStepContractSource"
    throw (IO.userError "dual-pin mismatch live CapableStepContract.lean")
  let r := parseLiveCapableStepContractSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-STEP-CONTRACT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-STEP-CONTRACT reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-STEP-CONTRACT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CapableStepContract parse false"
      throw (IO.userError "kernelCheck live CapableStepContract parse false")
    unless hostFrontLiveCapableStepContractReady do
      IO.eprintln "error: hostFrontLiveCapableStepContractReady false"
      throw (IO.userError "hostFrontLiveCapableStepContractReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableStepContract source was accepted"
      throw (IO.userError "empty CapableStepContract source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableStepContract root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableStepContract
