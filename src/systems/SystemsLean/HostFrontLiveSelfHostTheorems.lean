/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/SelfHostTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveSelfHostTheorems. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not live HostModuleCheckSelfHostTerm.lean.
  Not HostFrontLiveSelfHost (that wrap parses SelfHost.lean).
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.

  Spec (readable):
  - parseLiveSelfHostTheoremsSource turns live SelfHostTheorems.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.SelfHostTheorems even without a module line.
  - kernelCheckLiveSelfHostTheoremsSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes, private IrNode struct lits the kernel cannot type) are
    skip-folded. Kernelable string/Nat defs plus import / namespace / end
    remain. This theorems peel has no kernelable defs; skip-head still
    sees theorem empty_host_ok_ne_empty_program_ok.
  - Skip-fold ALL theorems including hostSurfaceOk_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - private is not isCmdKw; peel private then skip or drop the def.
  - Living namespace lastSeg is SelfHost (shared with SelfHost.lean).
    Identity uses wrap lastSeg SelfHostTheorems plus live rel
    SelfHostTheorems.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not SelfHost.lean wrap.

  Unique needles (trailing newline so SelfHost wrap is not a prefix):
  HostFrontLiveSelfHostTheorems
  PARSE-LIVE-SELF-HOST-THEOREMS
  HOST-FRONT-LIVE-SELF-HOST-THEOREMS
  SLAKE_HOST_FRONT_LIVE_SELF_HOST_THEOREMS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveSelfHostTheoremsSource,
  kernelCheckLiveSelfHostTheoremsSource,
  hostFrontLiveSelfHostTheoremsReady, liveSelfHostTheoremsSource,
  liveSelfHostTheoremsRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture, SELF-HOST-THEOREMS.
  Module: SystemsLean.HostFrontLiveSelfHostTheorems
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveSelfHostTheorems on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveSelfHostTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveSelfHostTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_SELF_HOST_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-SELF-HOST-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-SELF-HOST-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveSelfHostTheoremsRel : String :=
  "src/systems/SystemsLean/SelfHostTheorems.lean"

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "SelfHostTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveSelfHostTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveSelfHostTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveSelfHostTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveSelfHostTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveSelfHostTheoremsSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . SelfHostTheorems`. -/
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
def cmdAddsSelfHostTheorems (c : Cmd) : List String :=
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
def cmdBodyKnownSelfHostTheorems (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostTheoremsParseFuel body
        && termNoAppN liveSelfHostTheoremsParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveSelfHostTheoremsParseFuel body
        && termNoAppN liveSelfHostTheoremsParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdSelfHostTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsSelfHostTheorems : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdSelfHostTheorems liveSelfHostTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSelfHostTheoremsSkipFuel rest
      if cmdBodyKnownSelfHostTheorems kn c then
        parseCmdsSelfHostTheorems n rest2
          (kn ++ cmdAddsSelfHostTheorems c) (acc ++ [c])
      else
        parseCmdsSelfHostTheorems n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsSelfHostTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSelfHostTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsSelfHostTheorems n rest2 kn acc
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

/-- Parse live SelfHostTheorems.lean text.
    Greppable: parseLiveSelfHostTheoremsSource,
    PARSE-LIVE-SELF-HOST-THEOREMS. -/
def parseLiveSelfHostTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsSelfHostTheorems liveSelfHostTheoremsParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.SelfHostTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live SelfHostTheorems parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveSelfHostTheoremsSource,
    PARSE-LIVE-SELF-HOST-THEOREMS. -/
def kernelCheckLiveSelfHostTheoremsSource (src : String) : Bool :=
  match parseLiveSelfHostTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveSelfHostTheoremsParsed? : Option Module :=
  match parseLiveSelfHostTheoremsSource liveSelfHostTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveSelfHostTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end).
    Real lower bound, not hardcoded true. Un-kernelable theorems skipped.
    Seven dotted imports plus namespace plus end. -/
def liveParseCmdCountOk : Bool :=
  match liveSelfHostTheoremsParsed? with
  | some m => m.commands.length >= 9
  | none => false

/-- Wrap module lastSeg is SelfHostTheorems (no module line in the live file). -/
def liveParseHasSelfHostTheoremsModule : Bool :=
  match liveSelfHostTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "SelfHostTheorems"

/-- Live parse has the living SelfHost namespace command. -/
def liveParseHasSelfHostNs : Bool :=
  match liveSelfHostTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "SelfHost"
      | _ => false

/-- Live parse imports SystemsLean.SelfHost (kept marker). -/
def liveParseHasSelfHostImport : Bool :=
  match liveSelfHostTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "SelfHost"
      | _ => false

/-- Skip-head: theorem empty_host_ok_ne_empty_program_ok is in the live text.
    Unique to SelfHostTheorems.lean (not a theorem in SelfHost.lean). -/
def liveParseHasCoreDefs : Bool :=
  match liveSelfHostTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveSelfHostTheoremsSource)
    toksHaveTheoremNamed liveSelfHostTheoremsSkipFuel toks
      "empty_host_ok_ne_empty_program_ok"
      && toksHaveDefNamed liveSelfHostTheoremsSkipFuel toks "thmValueNode"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveSelfHostTheoremsReady,
    PARSE-LIVE-SELF-HOST-THEOREMS,
    HOST-FRONT-LIVE-SELF-HOST-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveSelfHostTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_SELF_HOST_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-SELF-HOST-THEOREMS")
    && (parseId == "PARSE-LIVE-SELF-HOST-THEOREMS")
    && (liveSelfHostTheoremsRel
      == "src/systems/SystemsLean/SelfHostTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveSelfHostTheoremsFullHost
    && !hostFrontLiveSelfHostTheoremsResidualFreeClaimed
    && !hostFrontLiveSelfHostTheoremsProvablyUnlocked
    && kernelCheckLiveSelfHostTheoremsSource liveSelfHostTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasSelfHostTheoremsModule
    && liveParseHasSelfHostNs
    && liveParseHasSelfHostImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveSelfHostTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveSelfHostTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-SELF-HOST-THEOREMS =="
  IO.println s!"  host={hostId} file={liveSelfHostTheoremsRel}"
  let path := root / liveSelfHostTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveSelfHostTheoremsRel}"
    throw (IO.userError s!"missing {liveSelfHostTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveSelfHostTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk SelfHostTheorems.lean != liveSelfHostTheoremsSource"
    throw (IO.userError "dual-pin mismatch live SelfHostTheorems.lean")
  let r := parseLiveSelfHostTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-SELF-HOST-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-SELF-HOST-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-SELF-HOST-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live SelfHostTheorems parse false"
      throw (IO.userError "kernelCheck live SelfHostTheorems parse false")
    unless hostFrontLiveSelfHostTheoremsReady do
      IO.eprintln "error: hostFrontLiveSelfHostTheoremsReady false"
      throw (IO.userError "hostFrontLiveSelfHostTheoremsReady false")
    IO.println s!"GREEN {stageId}: live SelfHostTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveSelfHostTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveSelfHostTheorems
