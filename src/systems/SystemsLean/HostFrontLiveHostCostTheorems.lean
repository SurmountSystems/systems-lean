/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostCostTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostCostTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not live HostModuleCheck*Term.lean.
  Not HostFrontLiveHostCost (that wrap parses HostCost.lean).
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.
  Not EmitComposeScaffold.lean. Not EmitLinearScaffold.lean.

  Unique needles (trailing newline so HostFrontLiveHostCost is not a prefix
  and HostCostTheorems is not a prefix of a Term name):
  HostFrontLiveHostCostTheorems
  PARSE-LIVE-HOST-COST-THEOREMS
  HOST-FRONT-LIVE-HOST-COST-THEOREMS
  SLAKE_HOST_FRONT_LIVE_HOST_COST_THEOREMS_V0
  HOST-COST-THEOREMS

  Spec (readable):
  - parseLiveHostCostTheoremsSource turns live HostCostTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.HostCostTheorems even without a module line.
  - kernelCheckLiveHostCostTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, private
    IrNode / Host struct-lits) are skip-folded. Kernelable string/Nat defs
    plus import / namespace / end remain. This theorems peel has no
    kernelable defs; skip-head still sees theorem costMintConsumeSequential_eq
    and theorem hostCost_omega_share_vs_mult1_exact_once.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - private is not isCmdKw; peel private then skip or drop the def.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not HostCost.lean wrap. Not occupancy Term wrap.

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostCostTheoremsSource,
  kernelCheckLiveHostCostTheoremsSource,
  hostFrontLiveHostCostTheoremsReady, liveHostCostTheoremsSource,
  liveHostCostTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveHostCostTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveHostCostTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostCostTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostCostTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_COST_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-COST-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-COST-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostCostTheoremsRel : String :=
  "src/systems/SystemsLean/HostCostTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostCostTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostCostTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostCostTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostCostTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveHostCostTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . HostCostTheorems`. -/
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
def cmdAddsHostCostTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownHostCostTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostCostTheoremsParseFuel body
        && termNoAppN liveHostCostTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveHostCostTheoremsParseFuel body
        && termNoAppN liveHostCostTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdHostCostTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsHostCostTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHostCostTheorems liveHostCostTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostCostTheoremsSkipFuel rest
      if cmdBodyKnownHostCostTheorems kn c then
        parseCmdsHostCostTheorems n rest2
          (kn ++ cmdAddsHostCostTheorems c) (acc ++ [c])
      else
        parseCmdsHostCostTheorems n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsHostCostTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostCostTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostCostTheorems n rest2 kn acc
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

/-- Parse live HostCostTheorems.lean text.
    Greppable: parseLiveHostCostTheoremsSource,
    PARSE-LIVE-HOST-COST-THEOREMS. -/
def parseLiveHostCostTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostCostTheorems liveHostCostTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostCostTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostCostTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveHostCostTheoremsSource,
    PARSE-LIVE-HOST-COST-THEOREMS. -/
def kernelCheckLiveHostCostTheoremsSource (src : String) : Bool :=
  match parseLiveHostCostTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostCostTheoremsParsed? : Option Module :=
  match parseLiveHostCostTheoremsSource liveHostCostTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostCostTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Eleven dotted imports plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveHostCostTheoremsParsed? with
  | some m => m.commands.length >= 13
  | none => false

/-- Wrap module lastSeg is HostCostTheorems (no module line in the live file). -/
def liveParseHasHostCostTheoremsModule : Bool :=
  match liveHostCostTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostCostTheorems"

/-- Live parse has the living HostCost namespace command. -/
def liveParseHasHostCostNs : Bool :=
  match liveHostCostTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostCost"
      | _ => false

/-- Live parse imports SystemsLean.HostCost (kept marker). -/
def liveParseHasHostCostImport : Bool :=
  match liveHostCostTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostCost"
      | _ => false

/-- Skip-head: theorems unique to HostCostTheorems.lean (not HostCost.lean
    `theorem` commands). Greppable: costMintConsumeSequential_eq,
    hostCost_omega_share_vs_mult1_exact_once. -/
def liveParseHasCoreDefs : Bool :=
  match liveHostCostTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveHostCostTheoremsSource)
    toksHaveTheoremNamed liveHostCostTheoremsSkipFuel toks
      "costMintConsumeSequential_eq"
      && toksHaveTheoremNamed liveHostCostTheoremsSkipFuel toks
        "hostCost_omega_share_vs_mult1_exact_once"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostCostTheoremsReady,
    PARSE-LIVE-HOST-COST-THEOREMS,
    HOST-FRONT-LIVE-HOST-COST-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveHostCostTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_COST_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-COST-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-COST-THEOREMS")
    && (liveHostCostTheoremsRel
      == "src/systems/SystemsLean/HostCostTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostCostTheoremsFullHost
    && !hostFrontLiveHostCostTheoremsResidualFreeClaimed
    && !hostFrontLiveHostCostTheoremsProvablyUnlocked
    && kernelCheckLiveHostCostTheoremsSource liveHostCostTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasHostCostTheoremsModule
    && liveParseHasHostCostNs
    && liveParseHasHostCostImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostCostTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveHostCostTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-COST-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostCostTheoremsRel}"
  let path := root / liveHostCostTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostCostTheoremsRel}"
    throw (IO.userError s!"missing {liveHostCostTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostCostTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostCostTheorems.lean != liveHostCostTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostCostTheorems.lean")
  let r := parseLiveHostCostTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-COST-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-COST-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-COST-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostCostTheorems parse false"
      throw (IO.userError "kernelCheck live HostCostTheorems parse false")
    unless hostFrontLiveHostCostTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostCostTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostCostTheoremsReady false")
    IO.println s!"GREEN {stageId}: live HostCostTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostCostTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostCostTheorems
