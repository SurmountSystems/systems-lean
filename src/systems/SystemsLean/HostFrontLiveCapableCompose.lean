/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/CapableCompose.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is CapableCompose.lean. It is not CapableComposeTheorems.lean.
  Literal defs stay. Compound defs are skipped only when the body is not
  kernel-checkable. theorem, example, and set_option counts are 0.
  The live file has no import.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-CAPABLE-COMPOSE,
  SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_V0,
  PARSE-LIVE-CAPABLE-COMPOSE, COMPOSE-THEOREM, liveRel,
  kernelCheckLiveCapableComposeSource,
  hostFrontLiveCapableComposeReady.
  Module: SystemsLean.HostFrontLiveCapableCompose
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCapableComposeSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveCapableCompose

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-CAPABLE-COMPOSE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-CAPABLE-COMPOSE"

/-- Live file basename. -/
def liveRel : String := "CapableCompose.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCapableComposeRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCapableComposeFullHost : Bool := false

/-- Honesty: this wrap is not a backend. FullBackend stays false. -/
def hostFrontLiveCapableComposeFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCapableComposeResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveCapableComposeProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveCapableComposeParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveCapableComposeSkipFuel : Nat := 8192

/-- Kept commands: namespace, twelve literal defs, the Full long-name
    false pin, and end. No import. The Ok conjunction and PartialReady
    are skip-folded (not kernel-kept). From CapableCompose.lean. -/
def liveCapableComposeKeptCmds : Nat := 15

/-- theorem keyword count. CapableCompose.lean has no theorem. -/
def liveCapableComposeTheoremCount : Nat := 0

/-- example keyword count. CapableCompose.lean has no example. -/
def liveCapableComposeExampleCount : Nat := 0

/-- set_option keyword count. CapableCompose.lean has no set_option. -/
def liveCapableComposeSetOptionCount : Nat := 0

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
def cmdAddsCapableCompose (c : Cmd) : List String :=
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
def cmdBodyKnownCapableCompose (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableComposeParseFuel body
        && termNoAppN liveCapableComposeParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCapableComposeParseFuel body
        && termNoAppN liveCapableComposeParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdCapableCompose (fuel : Nat) (toks : List String) :
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
def parseCmdsCapableCompose : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdCapableCompose liveCapableComposeParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveCapableComposeSkipFuel rest
      if cmdBodyKnownCapableCompose kn c then
        parseCmdsCapableCompose n rest2
          (kn ++ cmdAddsCapableCompose c) (acc ++ [c])
      else
        parseCmdsCapableCompose n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveCapableComposeSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsCapableCompose n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live CapableCompose.lean text.
    Greppable: parseLiveCapableComposeSource,
    PARSE-LIVE-CAPABLE-COMPOSE. -/
def parseLiveCapableComposeSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsCapableCompose liveCapableComposeParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.CapableCompose"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CapableCompose parse. Not a fixture.
    Greppable: kernelCheckLiveCapableComposeSource,
    PARSE-LIVE-CAPABLE-COMPOSE. -/
def kernelCheckLiveCapableComposeSource (src : String) : Bool :=
  match parseLiveCapableComposeSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCapableComposeParsed? : Option Module :=
  match parseLiveCapableComposeSource liveCapableComposeSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCapableComposeParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Literal defs are kept.
    Namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveCapableComposeParsed? with
  | some m => m.commands.length == liveCapableComposeKeptCmds
  | none => false

/-- Literal defs the kernel must keep. Ok and PartialReady are
    skip-folded, so they are not in this list. -/
def liveParseHasLiteralDefs : Bool :=
  match liveCapableComposeParsed? with
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
      && has "contractStepCompose"
      && has "gapCompose"
      && has "writerPathStepCompose"
      && has "lakeExeName"
      && has "justRecipeName"
      && has "productPathFreestandingCapableComposeLakeFreeRecipe"
      && has "freestandingCapableComposeApi"
      && has "productPathFreestandingCapableComposeAuthorityNotEmit"
      && has "productPathFreestandingCapableComposeDependsOnLake"
      && has "productPathFreestandingCapableStepContractFullSatisfied"

/-- Wrap module lastSeg is CapableCompose (no module line in the live file). -/
def liveParseHasCapableComposeModule : Bool :=
  match liveCapableComposeParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.CapableCompose"
      && lastSeg m.name.raw == "CapableCompose"

/-- Live parse has namespace SystemsLean.CapableCompose. -/
def liveParseHasCapableComposeNs : Bool :=
  match liveCapableComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.CapableCompose"
      | _ => false

/-- Live parse ends namespace SystemsLean.CapableCompose. -/
def liveParseHasCapableComposeEnd : Bool :=
  match liveCapableComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.CapableCompose"
      | _ => false

/-- Live product has no import; parse must not invent one. -/
def liveParseHasNoImport : Bool :=
  match liveCapableComposeParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false)

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveCapableComposeParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCapableComposeSource)
    let fuel := liveCapableComposeSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveCapableComposeTheoremCount
      && toksCountKw fuel toks "example" 0 == liveCapableComposeExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveCapableComposeSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.CapableCompose\n"

/-- stageId def needle. The string literal is on the next line. -/
def needleStageId : String :=
  "def stageId : String :=\n  \"SLAKE_SELF_HOST_PRODUCT_PATH_FREESTANDING_CAPABLE_COMPOSE_V0\"\n"

/-- hostId def needle. The string literal is on the next line. -/
def needleHostId : String :=
  "def hostId : String :=\n  \"HOST-SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE\"\n"

/-- selfHostId def needle. The string literal is on the next line. -/
def needleSelfHostId : String :=
  "def selfHostId : String :=\n  \"SELF-HOST-PRODUCT-PATH-FREESTANDING-CAPABLE-COMPOSE\"\n"

/-- contractStepCompose def needle with a trailing newline. -/
def needleContractStepCompose : String :=
  "def contractStepCompose : String := \"FREESTANDING-CAPABLE-STEP-CONTRACT-COMPOSE\"\n"

/-- gapCompose def needle with a trailing newline. -/
def needleGapCompose : String :=
  "def gapCompose : String := \"FREESTANDING-PERFORM-GAP-COMPOSE\"\n"

/-- writerPathStepCompose def needle with a trailing newline. -/
def needleWriterPathStepCompose : String :=
  "def writerPathStepCompose : String := \"WRITER-PATH-STEP-COMPOSE-PLAN-APPLY-BODY\"\n"

/-- lakeExeName def needle with a trailing newline. -/
def needleLakeExeName : String :=
  "def lakeExeName : String := \"slake-freestanding-capable-compose\"\n"

/-- justRecipeName def needle with a trailing newline. -/
def needleJustRecipeName : String :=
  "def justRecipeName : String := \"freestanding-capable-compose\"\n"

/-- Authority-not-emit def needle with a trailing newline. -/
def needleAuthorityNotEmit : String :=
  "def productPathFreestandingCapableComposeAuthorityNotEmit : Bool := true\n"

/-- Depends-on-Lake def needle with a trailing newline. -/
def needleDependsOnLake : String :=
  "def productPathFreestandingCapableComposeDependsOnLake : Bool := true\n"

/-- Full step-contract long-name pin needle with a trailing newline. -/
def needleFullSatisfied : String :=
  "def productPathFreestandingCapableStepContractFullSatisfied : Bool := false\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.CapableCompose\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No import needle. No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveCapableComposeSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleStageId).length > 1
    && (src.splitOn needleHostId).length > 1
    && (src.splitOn needleSelfHostId).length > 1
    && (src.splitOn needleContractStepCompose).length > 1
    && (src.splitOn needleGapCompose).length > 1
    && (src.splitOn needleWriterPathStepCompose).length > 1
    && (src.splitOn needleLakeExeName).length > 1
    && (src.splitOn needleJustRecipeName).length > 1
    && (src.splitOn needleAuthorityNotEmit).length > 1
    && (src.splitOn needleDependsOnLake).length > 1
    && (src.splitOn needleFullSatisfied).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCapableComposeReady,
    PARSE-LIVE-CAPABLE-COMPOSE,
    HOST-FRONT-LIVE-CAPABLE-COMPOSE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveCapableComposeReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_CAPABLE_COMPOSE_V0")
    && (hostId == "HOST-FRONT-LIVE-CAPABLE-COMPOSE")
    && (parseId == "PARSE-LIVE-CAPABLE-COMPOSE")
    && (liveRel == "CapableCompose.lean")
    && (liveCapableComposeRel
      == "src/systems/SystemsLean/CapableCompose.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCapableComposeFullHost
    && !hostFrontLiveCapableComposeFullBackend
    && !hostFrontLiveCapableComposeResidualFreeClaimed
    && !hostFrontLiveCapableComposeProvablyUnlocked
    && kernelCheckLiveCapableComposeSource liveCapableComposeSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasCapableComposeModule
    && liveParseHasCapableComposeNs
    && liveParseHasCapableComposeEnd
    && liveParseHasNoImport
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCapableComposeSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- Short command tag for a failed ready line. -/
def cmdTag (c : Cmd) : String :=
  match c with
  | Cmd.importModule x => "import:" ++ x.raw
  | Cmd.namespace x => "ns:" ++ x.raw
  | Cmd.endNamespace x => "end:" ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "ind:" ++ x.raw
  | Cmd.def_ x _ _ => "def:" ++ x.raw
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => "struct:" ++ x.raw
  | Cmd.defBind x _ _ _ => "defb:" ++ x.raw

/-- Comma-joined command tags. -/
def cmdTags (cs : List Cmd) : String :=
  String.intercalate "," (cs.map cmdTag)

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveCapableCompose (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-CAPABLE-COMPOSE =="
  IO.println s!"  host={hostId} file={liveCapableComposeRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveCapableComposeRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCapableComposeRel}"
    throw (IO.userError s!"missing {liveCapableComposeRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCapableComposeSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CapableCompose.lean != liveCapableComposeSource"
    throw (IO.userError "dual-pin mismatch live CapableCompose.lean")
  let r := parseLiveCapableComposeSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-CAPABLE-COMPOSE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-CAPABLE-COMPOSE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-CAPABLE-COMPOSE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln s!"error: kernelCheck live CapableCompose parse false tags={cmdTags m.commands}"
      throw (IO.userError "kernelCheck live CapableCompose parse false")
    unless hostFrontLiveCapableComposeReady do
      IO.eprintln s!"error: hostFrontLiveCapableComposeReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} literals={liveParseHasLiteralDefs} mod={liveParseHasCapableComposeModule} ns={liveParseHasCapableComposeNs} endNs={liveParseHasCapableComposeEnd} noImport={liveParseHasNoImport} kw={liveParseKwCountsOk} needles={liveNeedlesOk} tags={cmdTags m.commands}"
      throw (IO.userError "hostFrontLiveCapableComposeReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty CapableCompose source was accepted"
      throw (IO.userError "empty CapableCompose source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCapableCompose root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCapableCompose
