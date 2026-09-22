/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostComposeTheorems.lean with the HostFrontLiveHostTerm
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
  Not PROVABLY. Not LlvmHold.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-COMPOSE-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_THEOREMS_V0,
  PARSE-LIVE-HOST-COMPOSE-THEOREMS, HOST-COMPOSE-THEOREM, liveRel,
  kernelCheckLiveHostComposeTheoremsSource,
  hostFrontLiveHostComposeTheoremsReady.
  Module: SystemsLean.HostFrontLiveHostComposeTheorems
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostComposeTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostComposeTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-COMPOSE-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-COMPOSE-THEOREMS"

/-- Live file basename. -/
def liveRel : String := "HostComposeTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostComposeTheoremsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostComposeTheoremsFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false.
    Not LlvmHold. -/
def hostFrontLiveHostComposeTheoremsFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostComposeTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostComposeTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). HostComposeTheorems has about 100 declarations. -/
def liveHostComposeTheoremsParseFuel : Nat := 1024

/-- Skip fuel for theorem / example / private tails and token walks. -/
def liveHostComposeTheoremsSkipFuel : Nat := 65536

/-- Kept command count: eight imports, one namespace, one end.
    Three open lines are skipped. From HostComposeTheorems.lean. -/
def liveHostComposeTheoremsKeptCmds : Nat := 10

/-- Theorem declarations in the live file (proofs skipped). -/
def liveHostComposeTheoremsTheoremCount : Nat := 58

/-- Example smokes in the live file (skipped). -/
def liveHostComposeTheoremsExampleCount : Nat := 11

/-- set_option lines in the live file. HostComposeTheorems.lean has none. -/
def liveHostComposeTheoremsSetOptionCount : Nat := 0

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
def cmdAddsHostComposeTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownHostComposeTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostComposeTheoremsParseFuel body
        && termNoAppN liveHostComposeTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostComposeTheoremsParseFuel body
        && termNoAppN liveHostComposeTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, and set_option are not parsed here. -/
def parseOneCmdHostComposeTheorems (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem, example, set_option, and un-kernelable defs.
    example is already isCmdKw, so this fold skips it.
    private is not isCmdKw. Drop that token and re-enter so the following
    def is accepted the same way as a declaration keyword. -/
def parseCmdsHostComposeTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostComposeTheorems liveHostComposeTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostComposeTheoremsSkipFuel rest
      if cmdBodyKnownHostComposeTheorems kn c then
        parseCmdsHostComposeTheorems n rest2
          (kn ++ cmdAddsHostComposeTheorems c) (acc ++ [c])
      else
        parseCmdsHostComposeTheorems n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsHostComposeTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostComposeTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostComposeTheorems n rest2 kn acc
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

/-- Parse live HostComposeTheorems.lean text.
    Greppable: parseLiveHostComposeTheoremsSource,
    PARSE-LIVE-HOST-COMPOSE-THEOREMS. -/
def parseLiveHostComposeTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostComposeTheorems liveHostComposeTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostComposeTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostComposeTheorems parse. Not a fixture.
    Greppable: kernelCheckLiveHostComposeTheoremsSource,
    PARSE-LIVE-HOST-COMPOSE-THEOREMS. -/
def kernelCheckLiveHostComposeTheoremsSource (src : String) : Bool :=
  match parseLiveHostComposeTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostComposeTheoremsParsed? : Option Module :=
  match parseLiveHostComposeTheoremsSource liveHostComposeTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count. Eight imports, namespace, and end.
    Opens, theorems, private defs, and examples are not kept. -/
def liveParseCmdCountOk : Bool :=
  match liveHostComposeTheoremsParsed? with
  | some m => m.commands.length == liveHostComposeTheoremsKeptCmds
  | none => false

/-- Live parse keeps only import / namespace / end. -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is HostComposeTheorems (no module line in the live file). -/
def liveParseHasHostComposeTheoremsModule : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostComposeTheorems"
      && lastSeg m.name.raw == "HostComposeTheorems"

/-- Live parse has namespace SystemsLean.HostCompose. -/
def liveParseHasHostComposeNs : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostCompose"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostCompose. -/
def liveParseHasHostComposeEnd : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostCompose"
      | _ => false

/-- Live parse imports SystemsLean.HostCompose. -/
def liveParseHasHostComposeImport : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.HostCompose"
      | _ => false

/-- Skip-head still sees theorem names from HostComposeTheorems.lean. -/
def liveParseHasCoreTheorems : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostComposeTheoremsSource)
    let fuel := liveHostComposeTheoremsSkipFuel
    toksHaveTheoremNamed fuel toks "multPreScan_empty_true"
      && toksHaveTheoremNamed fuel toks "checkFailClosed_empty_true"
      && toksHaveTheoremNamed fuel toks "extractOkFs_empty_true"
      && toksHaveTheoremNamed fuel toks "extractOk_classic_empty_false"
      && toksHaveTheoremNamed fuel toks "extractOk_edge_empty_false"
      && toksHaveTheoremNamed fuel toks "extractOk_eq"
      && toksHaveTheoremNamed fuel toks "extractOkFs_eq"
      && toksHaveTheoremNamed fuel toks "mint_zero_badId"

/-- Keyword counts: 58 theorems, 11 examples, no set_option. -/
def liveParseKwCountsOk : Bool :=
  match liveHostComposeTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostComposeTheoremsSource)
    let fuel := liveHostComposeTheoremsSkipFuel
    toksCountKw fuel toks "theorem" 0 == liveHostComposeTheoremsTheoremCount
      && toksCountKw fuel toks "example" 0 == liveHostComposeTheoremsExampleCount
      && toksCountKw fuel toks "set_option" 0
        == liveHostComposeTheoremsSetOptionCount

/-- Import needle. Trailing newline. -/
def needleImportMult : String := "import SystemsLean.Mult\n"

/-- Import needle. Trailing newline. -/
def needleImportHostCompose : String := "import SystemsLean.HostCompose\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostCompose\n"

/-- theorem multPreScan_empty_true needle with a trailing newline. -/
def needleMultPreScanEmpty : String :=
  "theorem multPreScan_empty_true : multPreScan empty = true := rfl\n"

/-- theorem checkFailClosed_empty_true needle with a trailing newline. -/
def needleCheckFailClosedEmpty : String :=
  "theorem checkFailClosed_empty_true : checkFailClosed empty = true := rfl\n"

/-- theorem extractOkFs_empty_true needle with a trailing newline. -/
def needleExtractOkFsEmpty : String :=
  "theorem extractOkFs_empty_true : extractOkFs empty = true := rfl\n"

/-- theorem mint_zero_badId needle with a trailing newline. -/
def needleMintZeroBadId : String :=
  "theorem mint_zero_badId (hc : Host) : mint hc 0 = MintResult.badId := rfl\n"

/-- theorem consume_empty_notLive needle with a trailing newline. -/
def needleConsumeEmptyNotLive : String :=
  "theorem consume_empty_notLive : consume empty = ConsumeResult.notLive := rfl\n"

/-- private def needle with a trailing newline. -/
def needlePrivateLinearNode : String :=
  "private def thmLinearNode : IrNode :=\n"

/-- Example smoke needle with a trailing newline. -/
def needleExampleEmptyExtract : String :=
  "example : extractOkFs empty = true := by decide\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostCompose\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveHostComposeTheoremsSource
  (src.splitOn needleImportMult).length > 1
    && (src.splitOn needleImportHostCompose).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleMultPreScanEmpty).length > 1
    && (src.splitOn needleCheckFailClosedEmpty).length > 1
    && (src.splitOn needleExtractOkFsEmpty).length > 1
    && (src.splitOn needleMintZeroBadId).length > 1
    && (src.splitOn needleConsumeEmptyNotLive).length > 1
    && (src.splitOn needlePrivateLinearNode).length > 1
    && (src.splitOn needleExampleEmptyExtract).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostComposeTheoremsReady,
    PARSE-LIVE-HOST-COMPOSE-THEOREMS,
    HOST-FRONT-LIVE-HOST-COMPOSE-THEOREMS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostComposeTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_COMPOSE_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-COMPOSE-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-COMPOSE-THEOREMS")
    && (liveRel == "HostComposeTheorems.lean")
    && (liveHostComposeTheoremsRel
      == "src/systems/SystemsLean/HostComposeTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostComposeTheoremsFullHost
    && !hostFrontLiveHostComposeTheoremsFullBackend
    && !hostFrontLiveHostComposeTheoremsResidualFreeClaimed
    && !hostFrontLiveHostComposeTheoremsProvablyUnlocked
    && kernelCheckLiveHostComposeTheoremsSource liveHostComposeTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasHostComposeTheoremsModule
    && liveParseHasHostComposeNs
    && liveParseHasHostComposeEnd
    && liveParseHasHostComposeImport
    && liveParseHasCoreTheorems
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostComposeTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLiveHostComposeTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-COMPOSE-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostComposeTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostComposeTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostComposeTheoremsRel}"
    throw (IO.userError s!"missing {liveHostComposeTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostComposeTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostComposeTheorems.lean != liveHostComposeTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostComposeTheorems.lean")
  let r := parseLiveHostComposeTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-COMPOSE-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-COMPOSE-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-COMPOSE-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostComposeTheorems parse false"
      throw (IO.userError "kernelCheck live HostComposeTheorems parse false")
    unless hostFrontLiveHostComposeTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostComposeTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostComposeTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostComposeTheorems source was accepted"
      throw (IO.userError "empty HostComposeTheorems source was accepted")
    IO.println s!"GREEN {stageId}"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostComposeTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostComposeTheorems
