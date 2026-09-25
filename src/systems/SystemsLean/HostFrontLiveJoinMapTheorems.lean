/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/JoinMapTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveJoinMapTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveJoinMapSource. Not occupancy leftover JoinMapTerm.
  Not live HostModuleCheckJoinMapTerm.lean.
  Not HostFrontLiveJoinMap (that wrap parses JoinMap.lean).
  Prefix: import SystemsLean.HostFrontLiveJoinMap is a prefix of
  import SystemsLean.HostFrontLiveJoinMapTheorems; dest needles need a
  trailing newline.

  Spec (readable):
  - parseLiveJoinMapTheoremsSource turns live JoinMapTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.JoinMapTheorems even without a module line.
  - kernelCheckLiveJoinMapTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes the kernel cannot type, private IrNode struct-lits) are
    skip-folded. Kernelable string/Nat defs plus import / namespace / end
    remain. Skip-head still sees theorem stageId_eq or hostJoinMapId_eq.
    private is not isCmdKw: drop the private token then skip/drop the
    following def via cmdBodyKnown or skipUntilCmd.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear.lean / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-JOIN-MAP-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_JOIN_MAP_THEOREMS_V0,
  PARSE-LIVE-JOIN-MAP-THEOREMS,
  parseLiveJoinMapTheoremsSource,
  kernelCheckLiveJoinMapTheoremsSource,
  hostFrontLiveJoinMapTheoremsReady, liveJoinMapTheoremsSource,
  liveRel, liveJoinMapTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveJoinMapTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveJoinMapTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveJoinMapTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveJoinMapTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_JOIN_MAP_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-JOIN-MAP-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-JOIN-MAP-THEOREMS"

/-- Bare product basename. No slash. -/
def liveRel : String := "JoinMapTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveJoinMapTheoremsRel : String :=
  "src/systems/SystemsLean/JoinMapTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveJoinMapTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveJoinMapTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveJoinMapTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveJoinMapTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveJoinMapTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . JoinMap`. -/
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
def cmdAddsJoinMapTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownJoinMapTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveJoinMapTheoremsParseFuel body
        && termNoAppN liveJoinMapTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveJoinMapTheoremsParseFuel body
        && termNoAppN liveJoinMapTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdJoinMapTheorems (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / open / private /
    un-kernelable. private is not isCmdKw. -/
def parseCmdsJoinMapTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdJoinMapTheorems liveJoinMapTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveJoinMapTheoremsSkipFuel rest
      if cmdBodyKnownJoinMapTheorems kn c then
        parseCmdsJoinMapTheorems n rest2
          (kn ++ cmdAddsJoinMapTheorems c) (acc ++ [c])
      else
        parseCmdsJoinMapTheorems n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsJoinMapTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveJoinMapTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsJoinMapTheorems n rest2 kn acc
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

/-- Parse live JoinMapTheorems.lean text.
    Greppable: parseLiveJoinMapTheoremsSource,
    PARSE-LIVE-JOIN-MAP-THEOREMS. -/
def parseLiveJoinMapTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsJoinMapTheorems liveJoinMapTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.JoinMapTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live JoinMapTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveJoinMapTheoremsSource,
    PARSE-LIVE-JOIN-MAP-THEOREMS. -/
def kernelCheckLiveJoinMapTheoremsSource (src : String) : Bool :=
  match parseLiveJoinMapTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveJoinMapTheoremsParsed? : Option Module :=
  match parseLiveJoinMapTheoremsSource liveJoinMapTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveJoinMapTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Eleven dotted imports plus namespace plus end. Two kernelable string
    defs may be kept. -/
def liveParseCmdCountOk : Bool :=
  match liveJoinMapTheoremsParsed? with
  | some m => m.commands.length >= 13
  | none => false

/-- Wrap module lastSeg is JoinMapTheorems (no module line in the live file). -/
def liveParseHasJoinMapTheoremsModule : Bool :=
  match liveJoinMapTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "JoinMapTheorems"

/-- Live parse has the living JoinMap namespace command. -/
def liveParseHasJoinMapNs : Bool :=
  match liveJoinMapTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "JoinMap"
      | _ => false

/-- Skip-head: theorem stageId_eq or hostJoinMapId_eq is in the live text.
    Do not require kept Cmd.def_ (private IrNode defs are dropped). -/
def liveParseHasCoreDefs : Bool :=
  match liveJoinMapTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveJoinMapTheoremsSource)
    toksHaveTheoremNamed liveJoinMapTheoremsSkipFuel toks "stageId_eq"
      || toksHaveTheoremNamed liveJoinMapTheoremsSkipFuel toks
        "hostJoinMapId_eq"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveJoinMapTheoremsReady,
    PARSE-LIVE-JOIN-MAP-THEOREMS,
    HOST-FRONT-LIVE-JOIN-MAP-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveJoinMapTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_JOIN_MAP_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-JOIN-MAP-THEOREMS")
    && (parseId == "PARSE-LIVE-JOIN-MAP-THEOREMS")
    && (liveRel == "JoinMapTheorems.lean")
    && (liveJoinMapTheoremsRel
      == "src/systems/SystemsLean/JoinMapTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveJoinMapTheoremsFullHost
    && !hostFrontLiveJoinMapTheoremsResidualFreeClaimed
    && !hostFrontLiveJoinMapTheoremsProvablyUnlocked
    && kernelCheckLiveJoinMapTheoremsSource liveJoinMapTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasJoinMapNs
    && liveParseHasJoinMapTheoremsModule
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveJoinMapTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveJoinMapTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-JOIN-MAP-THEOREMS =="
  IO.println s!"  host={hostId} file={liveJoinMapTheoremsRel}"
  let path := root / liveJoinMapTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveJoinMapTheoremsRel}"
    throw (IO.userError s!"missing {liveJoinMapTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveJoinMapTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk JoinMapTheorems.lean != liveJoinMapTheoremsSource"
    throw (IO.userError "dual-pin mismatch live JoinMapTheorems.lean")
  let r := parseLiveJoinMapTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-JOIN-MAP-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-JOIN-MAP-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-JOIN-MAP-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live JoinMapTheorems parse false"
      throw (IO.userError "kernelCheck live JoinMapTheorems parse false")
    unless hostFrontLiveJoinMapTheoremsReady do
      IO.eprintln "error: hostFrontLiveJoinMapTheoremsReady false"
      throw (IO.userError "hostFrontLiveJoinMapTheoremsReady false")
    IO.println s!"GREEN {stageId}: live JoinMapTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveJoinMapTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveJoinMapTheorems
