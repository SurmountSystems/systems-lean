/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitMultScaffold.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitMultScaffold. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckEmitMultScaffoldTerm.
  Not live HostModuleCheckEmitMultScaffoldTerm.lean.
  Not HostFrontLiveEmit (prefix sibling).
  Not HostFrontLiveEmitApply.
  Not HostFrontLiveEmitBannerScaffold.
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.

  Spec (readable):
  - parseLiveEmitMultScaffoldSource turns live EmitMultScaffold.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.EmitMultScaffold even without a module line.
  - liveRel is the exact basename EmitMultScaffold.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveEmitMultScaffoldSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes) are skip-folded. Kernelable string/Nat defs plus import /
    namespace / end remain. Skip-head still sees def multHeaderFragment.
  - Skip-fold ALL examples including emitMultReady smokes.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - private is not isCmdKw; peel private then skip or drop the def.
  - Living namespace lastSeg is EmitMult (shared with EmitMult.lean).
    Identity uses wrap lastSeg EmitMultScaffold plus live rel
    EmitMultScaffold.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not EmitMult.lean wrap. Not occupancy Term wrap.

  Unique needles (trailing newline so HostFrontLiveEmit is not a prefix):
  HostFrontLiveEmitMultScaffold
  PARSE-LIVE-EMIT-MULT-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-MULT-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_MULT_SCAFFOLD_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitMultScaffoldSource,
  kernelCheckLiveEmitMultScaffoldSource,
  hostFrontLiveEmitMultScaffoldReady, liveEmitMultScaffoldSource,
  liveRel, liveEmitMultScaffoldRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture, EMIT-MULT-SCAFFOLD.
  Module: SystemsLean.HostFrontLiveEmitMultScaffold
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveEmitMultScaffold on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitMultScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitMultScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_MULT_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-MULT-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-MULT-SCAFFOLD"

/-- Live file basename. -/
def liveRel : String := "EmitMultScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitMultScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitMultScaffoldFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitMultScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitMultScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitMultScaffoldParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitMultScaffoldSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitMultScaffold`. -/
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
def cmdAddsEmitMultScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitMultScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitMultScaffoldParseFuel body
        && termNoAppN liveEmitMultScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitMultScaffoldParseFuel body
        && termNoAppN liveEmitMultScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitMultScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitMultScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitMultScaffold liveEmitMultScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitMultScaffoldSkipFuel rest
      if cmdBodyKnownEmitMultScaffold kn c then
        parseCmdsEmitMultScaffold n rest2
          (kn ++ cmdAddsEmitMultScaffold c) (acc ++ [c])
      else
        parseCmdsEmitMultScaffold n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitMultScaffold n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitMultScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitMultScaffold n rest2 kn acc
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

/-- Parse live EmitMultScaffold.lean text.
    Greppable: parseLiveEmitMultScaffoldSource,
    PARSE-LIVE-EMIT-MULT-SCAFFOLD. -/
def parseLiveEmitMultScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitMultScaffold liveEmitMultScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitMultScaffold"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitMultScaffold parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveEmitMultScaffoldSource,
    PARSE-LIVE-EMIT-MULT-SCAFFOLD. -/
def kernelCheckLiveEmitMultScaffoldSource (src : String) : Bool :=
  match parseLiveEmitMultScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitMultScaffoldParsed? : Option Module :=
  match parseLiveEmitMultScaffoldSource liveEmitMultScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitMultScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end plus kernelable
    string defs). Real lower bound, not hardcoded true. Un-kernelable
    string-concat defs and examples skipped. Horizon lean --run measured
    cmds=13: one dotted import plus namespace plus end plus ten kernelable
    stage/path/enum/surface defs. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitMultScaffoldParsed? with
  | some m => m.commands.length >= 13
  | none => false

/-- Wrap module lastSeg is EmitMultScaffold (no module line in the live file). -/
def liveParseHasEmitMultScaffoldModule : Bool :=
  match liveEmitMultScaffoldParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitMultScaffold"

/-- Live parse has the living EmitMult namespace command. -/
def liveParseHasEmitMultNs : Bool :=
  match liveEmitMultScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "EmitMult"
      | _ => false

/-- Live parse imports SystemsLean.Mult (kept marker). -/
def liveParseHasMultImport : Bool :=
  match liveEmitMultScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Skip-head: def multHeaderFragment is in the live text.
    Unique to EmitMultScaffold.lean (not a def in sibling Emit* scaffolds).
    selfHostEmitMultId is the kernelable sibling unique def. -/
def liveParseHasCoreDefs : Bool :=
  match liveEmitMultScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitMultScaffoldSource)
    toksHaveDefNamed liveEmitMultScaffoldSkipFuel toks
      "multHeaderFragment"
      && toksHaveDefNamed liveEmitMultScaffoldSkipFuel toks
        "selfHostEmitMultId"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitMultScaffoldReady,
    PARSE-LIVE-EMIT-MULT-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-MULT-SCAFFOLD.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveEmitMultScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_MULT_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-MULT-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-MULT-SCAFFOLD")
    && (liveRel == "EmitMultScaffold.lean")
    && (liveEmitMultScaffoldRel
      == "src/systems/SystemsLean/EmitMultScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitMultScaffoldFullHost
    && !hostFrontLiveEmitMultScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitMultScaffoldProvablyUnlocked
    && kernelCheckLiveEmitMultScaffoldSource liveEmitMultScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitMultScaffoldModule
    && liveParseHasEmitMultNs
    && liveParseHasMultImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitMultScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitMultScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-MULT-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitMultScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitMultScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitMultScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitMultScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitMultScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitMultScaffold.lean != liveEmitMultScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitMultScaffold.lean")
  let r := parseLiveEmitMultScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-MULT-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-MULT-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-MULT-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitMultScaffold parse false"
      throw (IO.userError "kernelCheck live EmitMultScaffold parse false")
    unless hostFrontLiveEmitMultScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitMultScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitMultScaffoldReady false")
    IO.println s!"GREEN {stageId}: live EmitMultScaffold.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitMultScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitMultScaffold
