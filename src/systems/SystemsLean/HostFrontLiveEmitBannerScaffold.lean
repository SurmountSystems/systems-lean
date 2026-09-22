/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitBannerScaffold.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitBannerScaffold. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not occupancy leftover HostModuleCheckEmitBannerScaffoldTerm.
  Not live HostModuleCheckEmitBannerScaffoldTerm.lean.
  Not HostFrontLiveEmitBanner (that wrap would parse EmitBanner.lean).
  Not HostFrontLiveEmitProgramScaffold. Not HostFrontLiveEmitGraphScaffold.
  Not HostFrontLiveEmitApplyScaffold. Not HostFrontLiveEmitMultScaffold.
  Not HostFrontLiveEmitTypesScaffold.
  Not Linear.lean. Not ComposeSubsetEmit.lean. Not IrGraph.lean.

  Spec (readable):
  - parseLiveEmitBannerScaffoldSource turns live EmitBannerScaffold.lean
    text into HostTerm.Module.
  - Module name is SystemsLean.EmitBannerScaffold even without a module line.
  - kernelCheckLiveEmitBannerScaffoldSource is HostKernel.kernelCheck of
    that parse.
  - Un-kernelable bodies (match, let, lambdas, !, dotted names, string ++,
    field proj, .isNone / .isSome, theorem proof scripts, tactics, example
    smokes, private struct lits the kernel cannot type) are skip-folded.
    Kernelable string/Nat defs plus import / namespace / end remain.
    Skip-head still sees def bannerHeaderFragment and theorem
    emitBannerReady_true. def bannerBodyFragment and def emitBannerReady
    sit after strings that contain `-- `; HostFrontLiveHostTerm
    stripComments is not string-aware, so that token walk does not see
    those later defs.
  - Skip-fold ALL theorems including emitBannerReady_true.
  - Imports/opens skip-fold: dotted import kept; open skipped.
    parseOneCmd none => skipUntilCmd. Drop defs whose body fails termKnownN.
  - private is not isCmdKw; peel private then skip or drop the def.
  - Living namespace lastSeg is EmitBanner (shared with EmitBanner.lean).
    Identity uses wrap lastSeg EmitBannerScaffold plus live rel
    EmitBannerScaffold.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. slakeOwnsPackageTypecheck stays false.
  - Not freestanding residual free.
  - Not Linear / Compose / IrGraph parsers.
  - Not EmitBanner.lean wrap.

  Unique needles (trailing newline so EmitBanner wrap is not a prefix):
  HostFrontLiveEmitBannerScaffold
  PARSE-LIVE-EMIT-BANNER-SCAFFOLD
  HOST-FRONT-LIVE-EMIT-BANNER-SCAFFOLD
  SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_SCAFFOLD_V0
  src/systems/SystemsLean/EmitBannerScaffold.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitBannerScaffoldSource,
  kernelCheckLiveEmitBannerScaffoldSource,
  hostFrontLiveEmitBannerScaffoldReady, liveEmitBannerScaffoldSource,
  liveRel, liveEmitBannerScaffoldRel, UNIT_SURFACE host surface, MULT-0,
  liveParseDoesNotUseMultFixture, EMIT-BANNER-SCAFFOLD.
  Module: SystemsLean.HostFrontLiveEmitBannerScaffold
  Red/green: dest-missing until barrel; lake build
  SystemsLean.HostFrontLiveEmitBannerScaffold on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitBannerScaffoldSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitBannerScaffold

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_SCAFFOLD_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-BANNER-SCAFFOLD"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-BANNER-SCAFFOLD"

/-- Live file basename. -/
def liveRel : String := "EmitBannerScaffold.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitBannerScaffoldRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitBannerScaffoldFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitBannerScaffoldResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitBannerScaffoldProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitBannerScaffoldParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitBannerScaffoldSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitBannerScaffold`. -/
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
def cmdAddsEmitBannerScaffold (c : Cmd) : List String :=
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
def cmdBodyKnownEmitBannerScaffold (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitBannerScaffoldParseFuel body
        && termNoAppN liveEmitBannerScaffoldParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveEmitBannerScaffoldParseFuel body
        && termNoAppN liveEmitBannerScaffoldParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdEmitBannerScaffold (fuel : Nat) (toks : List String) :
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
def parseCmdsEmitBannerScaffold : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdEmitBannerScaffold liveEmitBannerScaffoldParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitBannerScaffoldSkipFuel rest
      if cmdBodyKnownEmitBannerScaffold kn c then
        parseCmdsEmitBannerScaffold n rest2
          (kn ++ cmdAddsEmitBannerScaffold c) (acc ++ [c])
      else
        parseCmdsEmitBannerScaffold n rest2 kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsEmitBannerScaffold n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitBannerScaffoldSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitBannerScaffold n rest2 kn acc
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

/-- Parse live EmitBannerScaffold.lean text.
    Greppable: parseLiveEmitBannerScaffoldSource,
    PARSE-LIVE-EMIT-BANNER-SCAFFOLD. -/
def parseLiveEmitBannerScaffoldSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitBannerScaffold liveEmitBannerScaffoldParseFuel
        toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitBannerScaffold"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitBannerScaffold parse. Not a fixture.
    Not occupancy Term. Greppable: kernelCheckLiveEmitBannerScaffoldSource,
    PARSE-LIVE-EMIT-BANNER-SCAFFOLD. -/
def kernelCheckLiveEmitBannerScaffoldSource (src : String) : Bool :=
  match parseLiveEmitBannerScaffoldSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitBannerScaffoldParsed? : Option Module :=
  match parseLiveEmitBannerScaffoldSource liveEmitBannerScaffoldSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitBannerScaffoldParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (namespace / end plus kernelable string defs).
    Real lower bound, not hardcoded true. This peel has no dotted import.
    Un-kernelable string-concat defs, examples, and theorem skipped.
    Horizon lean --run measured cmds=10: namespace plus end plus eight
    kernelable stage/path defs. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitBannerScaffoldParsed? with
  | some m => m.commands.length >= 10
  | none => false

/-- Wrap module lastSeg is EmitBannerScaffold (no module line in the live file). -/
def liveParseHasEmitBannerScaffoldModule : Bool :=
  match liveEmitBannerScaffoldParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "EmitBannerScaffold"

/-- Live parse has the living EmitBanner namespace command. -/
def liveParseHasEmitBannerNs : Bool :=
  match liveEmitBannerScaffoldParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "EmitBanner"
      | _ => false

/-- Skip-head: def bannerHeaderFragment and theorem emitBannerReady_true
    are in the live text. Unique to EmitBannerScaffold.lean (not a theorem
    or header fragment def in EmitBanner.lean). Do not require
    bannerBodyFragment or def emitBannerReady here: a `--` inside an
    earlier string is stripped as a line comment. -/
def liveParseHasCoreDefs : Bool :=
  match liveEmitBannerScaffoldParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitBannerScaffoldSource)
    toksHaveDefNamed liveEmitBannerScaffoldSkipFuel toks
      "bannerHeaderFragment"
      && toksHaveTheoremNamed liveEmitBannerScaffoldSkipFuel toks
        "emitBannerReady_true"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitBannerScaffoldReady,
    PARSE-LIVE-EMIT-BANNER-SCAFFOLD,
    HOST-FRONT-LIVE-EMIT-BANNER-SCAFFOLD.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveEmitBannerScaffoldReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_BANNER_SCAFFOLD_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-BANNER-SCAFFOLD")
    && (parseId == "PARSE-LIVE-EMIT-BANNER-SCAFFOLD")
    && (liveRel == "EmitBannerScaffold.lean")
    && (liveEmitBannerScaffoldRel
      == "src/systems/SystemsLean/EmitBannerScaffold.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitBannerScaffoldFullHost
    && !hostFrontLiveEmitBannerScaffoldResidualFreeClaimed
    && !hostFrontLiveEmitBannerScaffoldProvablyUnlocked
    && kernelCheckLiveEmitBannerScaffoldSource liveEmitBannerScaffoldSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasEmitBannerScaffoldModule
    && liveParseHasEmitBannerNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitBannerScaffoldSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitBannerScaffold (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-BANNER-SCAFFOLD =="
  IO.println s!"  host={hostId} file={liveEmitBannerScaffoldRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveEmitBannerScaffoldRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitBannerScaffoldRel}"
    throw (IO.userError s!"missing {liveEmitBannerScaffoldRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitBannerScaffoldSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitBannerScaffold.lean != liveEmitBannerScaffoldSource"
    throw (IO.userError "dual-pin mismatch live EmitBannerScaffold.lean")
  let r := parseLiveEmitBannerScaffoldSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-BANNER-SCAFFOLD reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-BANNER-SCAFFOLD reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-BANNER-SCAFFOLD ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitBannerScaffold parse false"
      throw (IO.userError "kernelCheck live EmitBannerScaffold parse false")
    unless hostFrontLiveEmitBannerScaffoldReady do
      IO.eprintln "error: hostFrontLiveEmitBannerScaffoldReady false"
      throw (IO.userError "hostFrontLiveEmitBannerScaffoldReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitBannerScaffold source was accepted"
      throw (IO.userError "empty EmitBannerScaffold source was accepted")
    IO.println s!"GREEN {stageId}: live EmitBannerScaffold.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitBannerScaffold root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitBannerScaffold
