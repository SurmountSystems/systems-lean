/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostResidualShrinkTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostResidualShrinkTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not live HostModuleCheck*Term.lean.
  Not HostFrontLiveHostResidualShrink (that wrap parses HostResidualShrink.lean).
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.
  Not EmitComposeScaffold.lean. Not EmitLinearScaffold.lean.

  Unique needles (trailing newline so HostFrontLiveHostResidualShrink is not a prefix
  and PARSE-LIVE-HOST-RESIDUAL-SHRINK is not a prefix of this peel):
  HostFrontLiveHostResidualShrinkTheorems
  PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS
  HOST-FRONT-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_RESIDUAL_SHRINK_THEOREMS_V0
  HOST-RESIDUAL-SHRINK-THEOREMS

  Spec (readable):
  - parseLiveHostResidualShrinkTheoremsSource turns live
    HostResidualShrinkTheorems.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostResidualShrinkTheorems even without a
    module line.
  - kernelCheckLiveHostResidualShrinkTheoremsSource is HostKernel.kernelCheck
    of that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, private
    IrNode / Host struct-lits) are skip-folded. Kernelable string/Nat defs
    plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem
    hostResidualShrinkFinishedClaimed_true and theorem
    hostResidualPartialShrinkClaimed_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - private is not isCmdKw; peel private then skip or drop the def.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not HostResidualShrink.lean wrap. Not occupancy Term wrap.

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostResidualShrinkTheoremsSource,
  kernelCheckLiveHostResidualShrinkTheoremsSource,
  hostFrontLiveHostResidualShrinkTheoremsReady,
  liveRel, liveHostResidualShrinkTheoremsSource,
  liveHostResidualShrinkTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostResidualShrinkTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveHostResidualShrinkTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostResidualShrinkTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostResidualShrinkTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_RESIDUAL_SHRINK_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS"

/-- Bare basename. No slash. The path string below stays repo-relative. -/
def liveRel : String := "HostResidualShrinkTheorems.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostResidualShrinkTheoremsRel : String :=
  "src/systems/SystemsLean/HostResidualShrinkTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostResidualShrinkTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostResidualShrinkTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostResidualShrinkTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). 98 theorems plus 204 examples need more than 256. -/
def liveHostResidualShrinkTheoremsParseFuel : Nat := 512

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostResidualShrinkTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . HostResidualShrinkTheorems`. -/
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
def cmdAddsHostResidualShrinkTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownHostResidualShrinkTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostResidualShrinkTheoremsParseFuel body
        && termNoAppN liveHostResidualShrinkTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostResidualShrinkTheoremsParseFuel body
        && termNoAppN liveHostResidualShrinkTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdHostResidualShrinkTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsHostResidualShrinkTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostResidualShrinkTheorems
        liveHostResidualShrinkTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostResidualShrinkTheoremsSkipFuel rest
      if cmdBodyKnownHostResidualShrinkTheorems kn c then
        parseCmdsHostResidualShrinkTheorems n rest2
          (kn ++ cmdAddsHostResidualShrinkTheorems c) (acc ++ [c])
      else
        parseCmdsHostResidualShrinkTheorems n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsHostResidualShrinkTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostResidualShrinkTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostResidualShrinkTheorems n rest2 kn acc
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

/-- Parse live HostResidualShrinkTheorems.lean text.
    Greppable: parseLiveHostResidualShrinkTheoremsSource,
    PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS. -/
def parseLiveHostResidualShrinkTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostResidualShrinkTheorems
        liveHostResidualShrinkTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostResidualShrinkTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostResidualShrinkTheorems parse. Not a fixture.
    Not occupancy Term. Greppable:
    kernelCheckLiveHostResidualShrinkTheoremsSource,
    PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS. -/
def kernelCheckLiveHostResidualShrinkTheoremsSource (src : String) : Bool :=
  match parseLiveHostResidualShrinkTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostResidualShrinkTheoremsParsed? : Option Module :=
  match parseLiveHostResidualShrinkTheoremsSource
      liveHostResidualShrinkTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostResidualShrinkTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Horizon measured cmds=3: one dotted import plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveHostResidualShrinkTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Wrap module lastSeg is HostResidualShrinkTheorems (no module line). -/
def liveParseHasHostResidualShrinkTheoremsModule : Bool :=
  match liveHostResidualShrinkTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostResidualShrinkTheorems"

/-- Live parse has the living HostResidualShrink namespace command. -/
def liveParseHasHostResidualShrinkNs : Bool :=
  match liveHostResidualShrinkTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostResidualShrink"
      | _ => false

/-- Live parse imports SystemsLean.HostResidualShrink (kept marker). -/
def liveParseHasHostResidualShrinkImport : Bool :=
  match liveHostResidualShrinkTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostResidualShrink"
      | _ => false

/-- Skip-head: theorems unique to HostResidualShrinkTheorems.lean.
    Greppable: hostResidualShrinkFinishedClaimed_true,
    hostResidualPartialShrinkClaimed_true. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostResidualShrinkTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveHostResidualShrinkTheoremsSource)
    toksHaveTheoremNamed liveHostResidualShrinkTheoremsSkipFuel toks
      "hostResidualShrinkFinishedClaimed_true"
      && toksHaveTheoremNamed liveHostResidualShrinkTheoremsSkipFuel toks
        "hostResidualPartialShrinkClaimed_true"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostResidualShrinkTheoremsReady,
    PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS,
    HOST-FRONT-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostResidualShrinkTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_RESIDUAL_SHRINK_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS")
    && (liveRel == "HostResidualShrinkTheorems.lean")
    && (liveHostResidualShrinkTheoremsRel
      == "src/systems/SystemsLean/HostResidualShrinkTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostResidualShrinkTheoremsFullHost
    && !hostFrontLiveHostResidualShrinkTheoremsResidualFreeClaimed
    && !hostFrontLiveHostResidualShrinkTheoremsProvablyUnlocked
    && kernelCheckLiveHostResidualShrinkTheoremsSource
      liveHostResidualShrinkTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostResidualShrinkTheoremsModule
    && liveParseHasHostResidualShrinkNs
    && liveParseHasHostResidualShrinkImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostResidualShrinkTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostResidualShrinkTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostResidualShrinkTheoremsRel}"
  let path := root / liveHostResidualShrinkTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostResidualShrinkTheoremsRel}"
    throw (IO.userError s!"missing {liveHostResidualShrinkTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostResidualShrinkTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostResidualShrinkTheorems.lean != liveHostResidualShrinkTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostResidualShrinkTheorems.lean")
  let r := parseLiveHostResidualShrinkTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-RESIDUAL-SHRINK-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostResidualShrinkTheorems parse false"
      throw (IO.userError "kernelCheck live HostResidualShrinkTheorems parse false")
    unless hostFrontLiveHostResidualShrinkTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostResidualShrinkTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostResidualShrinkTheoremsReady false")
    IO.println s!"GREEN {stageId}: live HostResidualShrinkTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostResidualShrinkTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostResidualShrinkTheorems
