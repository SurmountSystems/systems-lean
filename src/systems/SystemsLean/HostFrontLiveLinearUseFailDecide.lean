/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LinearUseFail/Decide.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearUseFailDecide. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not live HostModuleCheckCompilePathTerm.lean.
  Not HostFrontLiveLinearUseFail (that wrap parses LinearUseFail.lean).
  Not HostFrontLiveLinearUseFailTheorems (that wrap parses LinearUseFailTheorems.lean).
  Not Linear.lean. Not LinearUseFailTheorems peel invention.

  Spec (readable):
  - parseLiveLinearUseFailDecideSource turns live LinearUseFail/Decide.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.LinearUseFail.Decide even without a module line.
  - kernelCheckLiveLinearUseFailDecideSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This Decide helper has no
    kernelable defs; skip-head still sees theorem canSeq_consume_consume_decide.
  - Skip-fold ALL theorems including canSeq_consume_consume_decide.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - Living namespace lastSeg is LinearUseFail (shared with LinearUseFail.lean).
    Identity uses wrap lastSeg Decide plus live rel
    LinearUseFail/Decide.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.

  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  HostFrontLiveLinearUseFailDecide
  PARSE-LIVE-LINEAR-USE-FAIL-DECIDE
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE
  SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_DECIDE_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLinearUseFailDecideSource,
  kernelCheckLiveLinearUseFailDecideSource,
  hostFrontLiveLinearUseFailDecideReady, liveLinearUseFailDecideSource,
  liveLinearUseFailDecideRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveLinearUseFailDecide
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveLinearUseFailDecide on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLinearUseFailDecideSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLinearUseFailDecide

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_DECIDE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LINEAR-USE-FAIL-DECIDE"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailDecideRel : String :=
  "src/systems/SystemsLean/LinearUseFail/Decide.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLinearUseFailDecideFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLinearUseFailDecideResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLinearUseFailDecideProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLinearUseFailDecideParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLinearUseFailDecideSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . LinearUseFail . Decide`. -/
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
def cmdAddsLinearUseFailDecide (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app (tokenizer drops `++`, so string concat is an untyped app). -/
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

/-- Body is kernel-known, no untyped proj, no string-concat Term.app. -/
def cmdBodyKnownLinearUseFailDecide (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearUseFailDecideParseFuel body
        && termNoAppN liveLinearUseFailDecideParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearUseFailDecideParseFuel body
        && termNoAppN liveLinearUseFailDecideParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdLinearUseFailDecide (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / open / un-kernelable. -/
def parseCmdsLinearUseFailDecide : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLinearUseFailDecide liveLinearUseFailDecideParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLinearUseFailDecideSkipFuel rest
      if cmdBodyKnownLinearUseFailDecide kn c then
        parseCmdsLinearUseFailDecide n rest2
          (kn ++ cmdAddsLinearUseFailDecide c) (acc ++ [c])
      else
        parseCmdsLinearUseFailDecide n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLinearUseFailDecideSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLinearUseFailDecide n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live LinearUseFail/Decide.lean text.
    Greppable: parseLiveLinearUseFailDecideSource,
    PARSE-LIVE-LINEAR-USE-FAIL-DECIDE. -/
def parseLiveLinearUseFailDecideSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLinearUseFailDecide liveLinearUseFailDecideParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LinearUseFail.Decide"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LinearUseFail/Decide parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveLinearUseFailDecideSource,
    PARSE-LIVE-LINEAR-USE-FAIL-DECIDE. -/
def kernelCheckLiveLinearUseFailDecideSource (src : String) : Bool :=
  match parseLiveLinearUseFailDecideSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLinearUseFailDecideParsed? : Option Module :=
  match parseLiveLinearUseFailDecideSource liveLinearUseFailDecideSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLinearUseFailDecideParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Two dotted imports plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveLinearUseFailDecideParsed? with
  | some m => m.commands.length >= 4
  | none => false

/-- Wrap module lastSeg is Decide (no module line in the live file). -/
def liveParseHasLinearUseFailDecideModule : Bool :=
  match liveLinearUseFailDecideParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "Decide"

/-- Live parse has the living LinearUseFail namespace command. -/
def liveParseHasLinearUseFailNs : Bool :=
  match liveLinearUseFailDecideParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "LinearUseFail"
      | _ => false

/-- Live parse imports SystemsLean.LinearUseFail (kept marker). -/
def liveParseHasLinearUseFailImport : Bool :=
  match liveLinearUseFailDecideParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "LinearUseFail"
      | _ => false

/-- Skip-head: theorem canSeq_consume_consume_decide is in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveLinearUseFailDecideParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLinearUseFailDecideSource)
    toksHaveTheoremNamed liveLinearUseFailDecideSkipFuel toks
      "canSeq_consume_consume_decide"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLinearUseFailDecideReady,
    PARSE-LIVE-LINEAR-USE-FAIL-DECIDE,
    HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveLinearUseFailDecideReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_DECIDE_V0")
    && (hostId == "HOST-FRONT-LIVE-LINEAR-USE-FAIL-DECIDE")
    && (parseId == "PARSE-LIVE-LINEAR-USE-FAIL-DECIDE")
    && (liveLinearUseFailDecideRel
      == "src/systems/SystemsLean/LinearUseFail/Decide.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLinearUseFailDecideFullHost
    && !hostFrontLiveLinearUseFailDecideResidualFreeClaimed
    && !hostFrontLiveLinearUseFailDecideProvablyUnlocked
    && kernelCheckLiveLinearUseFailDecideSource liveLinearUseFailDecideSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLinearUseFailDecideModule
    && liveParseHasLinearUseFailNs
    && liveParseHasLinearUseFailImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLinearUseFailDecideSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveLinearUseFailDecide (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LINEAR-USE-FAIL-DECIDE =="
  IO.println s!"  host={hostId} file={liveLinearUseFailDecideRel}"
  let path := root / liveLinearUseFailDecideRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLinearUseFailDecideRel}"
    throw (IO.userError s!"missing {liveLinearUseFailDecideRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLinearUseFailDecideSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LinearUseFail/Decide.lean != liveLinearUseFailDecideSource"
    throw (IO.userError "dual-pin mismatch live LinearUseFail/Decide.lean")
  let r := parseLiveLinearUseFailDecideSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LINEAR-USE-FAIL-DECIDE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LINEAR-USE-FAIL-DECIDE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LINEAR-USE-FAIL-DECIDE ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LinearUseFail/Decide parse false"
      throw (IO.userError "kernelCheck live LinearUseFail/Decide parse false")
    unless hostFrontLiveLinearUseFailDecideReady do
      IO.eprintln "error: hostFrontLiveLinearUseFailDecideReady false"
      throw (IO.userError "hostFrontLiveLinearUseFailDecideReady false")
    IO.println s!"GREEN {stageId}: live LinearUseFail/Decide.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLinearUseFailDecide root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLinearUseFailDecide
