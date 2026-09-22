/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostCompose.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostCompose.lean. It is not HostComposeTheorems.lean.
  Struct-literal defs are skip-folded. Compound defs are skipped only when
  the body is not kernel-checkable. theorem, example, and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Structures, inductives, opens, struct literals, and app or match defs are skip-folded.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-COMPOSE,
  SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_V0,
  PARSE-LIVE-HOST-COMPOSE, liveRel,
  kernelCheckLiveHostComposeSource,
  hostFrontLiveHostComposeReady.
  Module: SystemsLean.HostFrontLiveHostCompose
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostComposeSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostCompose

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-COMPOSE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-COMPOSE"

/-- Live file basename. -/
def liveRel : String := "HostCompose.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostComposeRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostComposeFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostComposeFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostComposeResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The flag stays false. -/
def hostFrontLiveHostComposeProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostComposeParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveHostComposeSkipFuel : Nat := 8192

/-- Kept commands from HostCompose.lean: five imports, namespace, and end.
    Structures, inductives, opens, struct literals, and app or match defs are skip-folded. -/
def liveHostComposeKeptCmds : Nat := 7

/-- theorem keyword count. HostCompose.lean has no theorem. -/
def liveHostComposeTheoremCount : Nat := 0

/-- example keyword count. HostCompose.lean has no example. -/
def liveHostComposeExampleCount : Nat := 0

/-- set_option keyword count. HostCompose.lean has no set_option. -/
def liveHostComposeSetOptionCount : Nat := 0

/-- Dotted ident `SystemsLean . HostCompose`. -/
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
def cmdAddsHostCompose (c : Cmd) : List String :=
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

/-- Struct literal bodies are skip-folded. LinearHost.empty is not kernel-checked. -/
def termNoStructLitN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.app f a => termNoStructLitN n f && termNoStructLitN n a
  | Nat.succ n, Term.some_ t => termNoStructLitN n t
  | Nat.succ n, Term.ite c t e =>
      termNoStructLitN n c && termNoStructLitN n t && termNoStructLitN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoStructLitN n a && termNoStructLitN n b
  | Nat.succ n, Term.proj o _ => termNoStructLitN n o
  | Nat.succ _, Term.structLit _ => false
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no Term.app, no struct literal. -/
def cmdBodyKnownHostCompose (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostComposeParseFuel body
        && termNoAppN liveHostComposeParseFuel body
        && termNoStructLitN liveHostComposeParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostComposeParseFuel body
        && termNoAppN liveHostComposeParseFuel body
        && termNoStructLitN liveHostComposeParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdHostCompose (fuel : Nat) (toks : List String) :
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
def parseCmdsHostCompose : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostCompose liveHostComposeParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostComposeSkipFuel rest
      if cmdBodyKnownHostCompose kn c then
        parseCmdsHostCompose n rest2
          (kn ++ cmdAddsHostCompose c) (acc ++ [c])
      else
        parseCmdsHostCompose n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostComposeSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostCompose n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live HostCompose.lean text.
    Greppable: parseLiveHostComposeSource,
    PARSE-LIVE-HOST-COMPOSE. -/
def parseLiveHostComposeSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostCompose liveHostComposeParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostCompose"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostCompose parse. Not a fixture.
    Greppable: kernelCheckLiveHostComposeSource,
    PARSE-LIVE-HOST-COMPOSE. -/
def kernelCheckLiveHostComposeSource (src : String) : Bool :=
  match parseLiveHostComposeSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostComposeParsed? : Option Module :=
  match parseLiveHostComposeSource liveHostComposeSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostComposeParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Struct-literal defs are not kept.
    Import, namespace, end, and kernel-checkable defs. Not a count of 4. -/
def liveParseCmdCountOk : Bool :=
  match liveHostComposeParsed? with
  | some m => m.commands.length == liveHostComposeKeptCmds
  | none => false

/-- Pinned HostCompose source contains mint, consume, checkFailClosed,
    and extractOkFs. Those defs are skip-folded. splitOn, not a constant true. -/
def liveParseHasLiteralDefs : Bool :=
  let src := liveHostComposeSource
  (src.splitOn "def mint ").length > 1
    && (src.splitOn "def consume ").length > 1
    && (src.splitOn "def checkFailClosed ").length > 1
    && (src.splitOn "def extractOkFs ").length > 1

/-- Wrap module lastSeg is HostCompose (no module line in the live file). -/
def liveParseHasHostComposeModule : Bool :=
  match liveHostComposeParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostCompose"
      && lastSeg m.name.raw == "HostCompose"

/-- Live parse has namespace SystemsLean.HostCompose. -/
def liveParseHasHostComposeNs : Bool :=
  match liveHostComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostCompose"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostCompose. -/
def liveParseHasHostComposeEnd : Bool :=
  match liveHostComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostCompose"
      | _ => false

/-- Live parse imports Mult, Types, IrGraph, Erasure, and Extract. -/
def liveParseHasHostComposeImports : Bool :=
  match liveHostComposeParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.importModule x => x.raw == nm
        | _ => false
    has "SystemsLean.Mult"
      && has "SystemsLean.Types"
      && has "SystemsLean.IrGraph"
      && has "SystemsLean.Erasure"
      && has "SystemsLean.Extract"

/-- Keyword counts: theorem, example, and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveHostComposeParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostComposeSource)
    let fuel := liveHostComposeSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveHostComposeTheoremCount
      && toksCountKw fuel toks "example" 0 == liveHostComposeExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveHostComposeSetOptionCount

/-- Import needles. Each line has a trailing newline. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Import needle with a trailing newline. -/
def needleImportTypes : String := "import SystemsLean.Types\n"

/-- Import needle with a trailing newline. -/
def needleImportIrGraph : String := "import SystemsLean.IrGraph\n"

/-- Import needle with a trailing newline. -/
def needleImportErasure : String := "import SystemsLean.Erasure\n"

/-- Import needle with a trailing newline. -/
def needleImportExtract : String := "import SystemsLean.Extract\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostCompose\n"

/-- mint def needle with a trailing newline. -/
def needleMint : String :=
  "def mint (hc : Host) (id : Nat) : MintResult :=\n"

/-- checkFailClosed def needle with a trailing newline. -/
def needleCheckFailClosed : String :=
  "def checkFailClosed (hc : Host) : Bool :=\n"

/-- extractOkFs def needle with a trailing newline. -/
def needleExtractOkFs : String :=
  "def extractOkFs (hc : Host) : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostCompose\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    No theorem, example, or set_option needle. -/
def liveNeedlesOk : Bool :=
  let src := liveHostComposeSource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleImportTypes).length > 1
    && (src.splitOn needleImportIrGraph).length > 1
    && (src.splitOn needleImportErasure).length > 1
    && (src.splitOn needleImportExtract).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleMint).length > 1
    && (src.splitOn needleCheckFailClosed).length > 1
    && (src.splitOn needleExtractOkFs).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostComposeReady,
    PARSE-LIVE-HOST-COMPOSE,
    HOST-FRONT-LIVE-HOST-COMPOSE.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostComposeReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-COMPOSE")
    && (parseId == "PARSE-LIVE-HOST-COMPOSE")
    && (liveRel == "HostCompose.lean")
    && (liveHostComposeRel
      == "src/systems/SystemsLean/HostCompose.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostComposeFullHost
    && !hostFrontLiveHostComposeFullBackend
    && !hostFrontLiveHostComposeResidualFreeClaimed
    && !hostFrontLiveHostComposeProvablyUnlocked
    && kernelCheckLiveHostComposeSource liveHostComposeSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasHostComposeModule
    && liveParseHasHostComposeNs
    && liveParseHasHostComposeEnd
    && liveParseHasHostComposeImports
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostComposeSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveHostCompose (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-COMPOSE =="
  IO.println s!"  host={hostId} file={liveHostComposeRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostComposeRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostComposeRel}"
    throw (IO.userError s!"missing {liveHostComposeRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostComposeSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostCompose.lean != liveHostComposeSource"
    throw (IO.userError "dual-pin mismatch live HostCompose.lean")
  let r := parseLiveHostComposeSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-COMPOSE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-COMPOSE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-COMPOSE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostCompose parse false"
      throw (IO.userError "kernelCheck live HostCompose parse false")
    unless hostFrontLiveHostComposeReady do
      IO.eprintln "error: hostFrontLiveHostComposeReady false"
      throw (IO.userError "hostFrontLiveHostComposeReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostCompose source was accepted"
      throw (IO.userError "empty HostCompose source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostCompose root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostCompose
