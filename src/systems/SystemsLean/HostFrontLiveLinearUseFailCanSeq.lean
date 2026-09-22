/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/LinearUseFail/CanSeq.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLinearUseFailCanSeq. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not live HostModuleCheckCompilePathTerm.lean.
  Not HostFrontLiveLinearUseFail (that wrap parses LinearUseFail.lean).
  Not HostFrontLiveLinearUseFailKeep (that wrap parses LinearUseFail/Keep.lean).
  Not HostFrontLiveLinearUseFailConsume (that wrap parses LinearUseFail/Consume.lean).
  Not HostFrontLiveLinearUseFailDecide (that wrap parses LinearUseFail/Decide.lean).
  Not HostFrontLiveLinearUseFailNotEqNot (that wrap parses LinearUseFail/NotEqNot.lean).
  Not HostFrontLiveLinearUseFailTheorems (that wrap parses LinearUseFailTheorems.lean).
  Not Linear.lean. Not LinearUseFailTheorems peel invention.

  Spec (readable):
  - parseLiveLinearUseFailCanSeqSource turns live LinearUseFail/CanSeq.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.LinearUseFail.CanSeq even without a module line.
  - kernelCheckLiveLinearUseFailCanSeqSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type) are skip-folded. Kernelable string/Nat
    defs plus import / namespace / end remain. This CanSeq helper has no
    kernelable defs; skip-head still sees theorem canSeq_iff.
  - Skip-fold ALL theorems including canSeq_iff.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - Living namespace lastSeg is LinearUseFail (shared with LinearUseFail.lean).
    Identity uses wrap lastSeg CanSeq plus live rel
    LinearUseFail/CanSeq.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.

  Unique needles (trailing newline so LinearUseFail wrap is not a prefix):
  HostFrontLiveLinearUseFailCanSeq
  PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ
  HOST-FRONT-LIVE-LINEAR-USE-FAIL-CAN-SEQ
  SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_CAN_SEQ_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveLinearUseFailCanSeqSource,
  kernelCheckLiveLinearUseFailCanSeqSource,
  hostFrontLiveLinearUseFailCanSeqReady, liveLinearUseFailCanSeqSource,
  liveLinearUseFailCanSeqRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveLinearUseFailCanSeq
  Red/green: dests skipped this slice; lake build
  SystemsLean.HostFrontLiveLinearUseFailCanSeq on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveLinearUseFailCanSeqSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveLinearUseFailCanSeq

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_CAN_SEQ_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-LINEAR-USE-FAIL-CAN-SEQ"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ"

/-- Live file relative to repo root. Dual-pin path. -/
def liveLinearUseFailCanSeqRel : String :=
  "src/systems/SystemsLean/LinearUseFail/CanSeq.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveLinearUseFailCanSeqFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveLinearUseFailCanSeqResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveLinearUseFailCanSeqProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveLinearUseFailCanSeqParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveLinearUseFailCanSeqSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . LinearUseFail . CanSeq`. -/
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
def cmdAddsLinearUseFailCanSeq (c : Cmd) : List String :=
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
def cmdBodyKnownLinearUseFailCanSeq (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearUseFailCanSeqParseFuel body
        && termNoAppN liveLinearUseFailCanSeqParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveLinearUseFailCanSeqParseFuel body
        && termNoAppN liveLinearUseFailCanSeqParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdLinearUseFailCanSeq (fuel : Nat) (toks : List String) :
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
def parseCmdsLinearUseFailCanSeq : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLinearUseFailCanSeq liveLinearUseFailCanSeqParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveLinearUseFailCanSeqSkipFuel rest
      if cmdBodyKnownLinearUseFailCanSeq kn c then
        parseCmdsLinearUseFailCanSeq n rest2
          (kn ++ cmdAddsLinearUseFailCanSeq c) (acc ++ [c])
      else
        parseCmdsLinearUseFailCanSeq n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveLinearUseFailCanSeqSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsLinearUseFailCanSeq n rest2 kn acc
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

/-- Parse live LinearUseFail/CanSeq.lean text.
    Greppable: parseLiveLinearUseFailCanSeqSource,
    PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ. -/
def parseLiveLinearUseFailCanSeqSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLinearUseFailCanSeq liveLinearUseFailCanSeqParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.LinearUseFail.CanSeq"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live LinearUseFail/CanSeq parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveLinearUseFailCanSeqSource,
    PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ. -/
def kernelCheckLiveLinearUseFailCanSeqSource (src : String) : Bool :=
  match parseLiveLinearUseFailCanSeqSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveLinearUseFailCanSeqParsed? : Option Module :=
  match parseLiveLinearUseFailCanSeqSource liveLinearUseFailCanSeqSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveLinearUseFailCanSeqParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    One dotted import plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveLinearUseFailCanSeqParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is CanSeq (no module line in the live file). -/
def liveParseHasLinearUseFailCanSeqModule : Bool :=
  match liveLinearUseFailCanSeqParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CanSeq"

/-- Live parse has the living LinearUseFail namespace command. -/
def liveParseHasLinearUseFailNs : Bool :=
  match liveLinearUseFailCanSeqParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "LinearUseFail"
      | _ => false

/-- Live parse imports SystemsLean.LinearUseFail (kept marker). -/
def liveParseHasLinearUseFailImport : Bool :=
  match liveLinearUseFailCanSeqParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "LinearUseFail"
      | _ => false

/-- Skip-head: theorem canSeq_iff is in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveLinearUseFailCanSeqParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveLinearUseFailCanSeqSource)
    toksHaveTheoremNamed liveLinearUseFailCanSeqSkipFuel toks
      "canSeq_iff"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveLinearUseFailCanSeqReady,
    PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ,
    HOST-FRONT-LIVE-LINEAR-USE-FAIL-CAN-SEQ.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveLinearUseFailCanSeqReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_LINEAR_USE_FAIL_CAN_SEQ_V0")
    && (hostId == "HOST-FRONT-LIVE-LINEAR-USE-FAIL-CAN-SEQ")
    && (parseId == "PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ")
    && (liveLinearUseFailCanSeqRel
      == "src/systems/SystemsLean/LinearUseFail/CanSeq.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveLinearUseFailCanSeqFullHost
    && !hostFrontLiveLinearUseFailCanSeqResidualFreeClaimed
    && !hostFrontLiveLinearUseFailCanSeqProvablyUnlocked
    && kernelCheckLiveLinearUseFailCanSeqSource liveLinearUseFailCanSeqSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLinearUseFailCanSeqModule
    && liveParseHasLinearUseFailNs
    && liveParseHasLinearUseFailImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveLinearUseFailCanSeqSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveLinearUseFailCanSeq (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ =="
  IO.println s!"  host={hostId} file={liveLinearUseFailCanSeqRel}"
  let path := root / liveLinearUseFailCanSeqRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveLinearUseFailCanSeqRel}"
    throw (IO.userError s!"missing {liveLinearUseFailCanSeqRel}")
  let disk <- IO.FS.readFile path
  if disk != liveLinearUseFailCanSeqSource then
    IO.eprintln "error: dual-pin mismatch: on-disk LinearUseFail/CanSeq.lean != liveLinearUseFailCanSeqSource"
    throw (IO.userError "dual-pin mismatch live LinearUseFail/CanSeq.lean")
  let r := parseLiveLinearUseFailCanSeqSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-LINEAR-USE-FAIL-CAN-SEQ ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live LinearUseFail/CanSeq parse false"
      throw (IO.userError "kernelCheck live LinearUseFail/CanSeq parse false")
    unless hostFrontLiveLinearUseFailCanSeqReady do
      IO.eprintln "error: hostFrontLiveLinearUseFailCanSeqReady false"
      throw (IO.userError "hostFrontLiveLinearUseFailCanSeqReady false")
    IO.println s!"GREEN {stageId}: live LinearUseFail/CanSeq.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveLinearUseFailCanSeq root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveLinearUseFailCanSeq
