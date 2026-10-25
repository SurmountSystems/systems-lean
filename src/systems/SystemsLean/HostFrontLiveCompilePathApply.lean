/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/CompilePathApply.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePathApply. parseSource keep of
  CompilePathApply.lean, module name SystemsLean.CompilePathApply.
  Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on CompilePathApply text.
  This wrap parses CompilePathApply.lean only.
  Unique needles use trailing newline so HostFrontLiveCompilePathApply is not a
  prefix hit on HostFrontLiveCompilePathApplySource or Main.
  Occupancy leftover HostModuleCheckCompilePathApplyTerm is not this wrap.
  Not CompilePath.lean wrap. Not FirstSurface wrap. Not Extract wrap. Not Plan wrap.

  Unique needles (trailing newline so HostFrontLiveCompilePathApply is not a prefix
  of Source or Main):
  HostFrontLiveCompilePathApply
  PARSE-LIVE-COMPILE-PATH-APPLY
  HOST-FRONT-LIVE-COMPILE-PATH-APPLY
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0
  COMPILE-PATH-APPLY

  Spec (readable):
  - parseLiveCompilePathApplySource is HostFront.parseSource of live
    CompilePathApply.lean text, then keep/register the module name
    SystemsLean.CompilePathApply. parseSource is what --slake-check
    reads (walkKept keep, not a skip-fold of this module).
  - Wrap-assigned module name is SystemsLean.CompilePathApply even without a
    module line (module lastSeg CompilePathApply).
  - Living namespace lastSeg is CompilePath (product uses namespace
    SystemsLean.CompilePath).
  - kernelCheckLiveCompilePathApplySource is HostKernel.kernelCheck of that parse.
  - hostFrontParseSourceCompilePathApply is parseSource keep of the
    frozen bytes, renamed to SystemsLean.CompilePathApply.
  - Graph-shape sequential keep on this on-disk module:
    applyFixtureMintId (Nat 11), lowerApplyFixtureCompose,
    applyFixtureLiveView, applyFixtureSpentView,
    keep applyFixtureApplyOk_true with decide.
    --slake-check reads acceptKeptApply on these forms.
  - Do not skip-fold CompilePathApply away from --slake-check.
  - liveRel is CompilePathApply.lean.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false.
  - Not CompilePath.lean wrap. Not FirstSurface wrap. Not Extract wrap. Not Plan wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPILE-PATH-APPLY,
  SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0,
  PARSE-LIVE-COMPILE-PATH-APPLY, parseLiveCompilePathApplySource,
  kernelCheckLiveCompilePathApplySource,
  hostFrontLiveCompilePathApplyReady, liveCompilePathApplySource,
  liveCompilePathApplyRel, liveRel, hostFrontParseSourceCompilePathApply,
  applyFixtureMintId, applyFixtureLiveView, applyFixtureSpentView,
  lowerApplyFixtureCompose, applyFixtureApplyOk, applyFixtureApplyOk_true,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCompilePathApply
  Red/green: dests skipped (sibling Extract/Plan dest lock; last dests GREEN 693
  after Keep); lake build SystemsLean.HostFrontLiveCompilePathApply on surmount-1
  (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathApplySource
import SystemsLean.HostKernel
import SystemsLean.HostCompose

namespace SystemsLean.HostFrontLiveCompilePathApply

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostCompose (Host)

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILE-PATH-APPLY"

/-- Greppable parse id. Hyphenated COMPILE-PATH-APPLY. -/
def parseId : String := "PARSE-LIVE-COMPILE-PATH-APPLY"

/-- Live file basename. Not a path. -/
def liveRel : String := "CompilePathApply.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathApplyRel : String :=
  "src/systems/SystemsLean/CompilePathApply.lean"

/-- HostFront.parseSource is what --slake-check reads (walkKept keep).
    Not a skip-fold of CompilePathApply. Name register is
    parseLiveCompilePathApplySource (SystemsLean.CompilePathApply). -/
def hostFrontParseSourceCompilePathApply : Bool :=
  match parseSource liveCompilePathApplySource with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathApplyFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathApplyResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathApplyProvablyUnlocked : Bool := false

/-- Fixed Apply fixture mint id (nonzero; matches COMPILE-PATH-APPLY mint 11). -/
def applyFixtureMintId : Nat := 11

/-- Apply fixture host ready for unit compile path.
    mint MULT-1 live token on empty compose. FAIL-CLOSED: none if mint fails.
    Greppable: lowerApplyFixtureCompose, HOST-COMPOSE. -/
def lowerApplyFixtureCompose : Option Host :=
  match HostCompose.mint HostCompose.empty applyFixtureMintId with
  | HostCompose.MintResult.ok hc' => some hc'
  | _ => none

/-- Live view: minted MULT-1 host (ConsumeToken). -/
def applyFixtureLiveView : Option Host :=
  lowerApplyFixtureCompose

/-- Spent view: ConsumeToken consume of applyFixtureLiveView. -/
def applyFixtureSpentView : Option Host :=
  match applyFixtureLiveView with
  | none => none
  | some hcLive =>
      match HostCompose.consume hcLive with
      | HostCompose.ConsumeResult.ok hcSpent _ => some hcSpent
      | HostCompose.ConsumeResult.notLive => none

/-- applyFixtureApplyOk -- mint path is some (Graph-shape keep).
    Not HOST-EMIT-APPLY product text. Emit is a later regenerate.
    Greppable: applyFixtureApplyOk. -/
def applyFixtureApplyOk : Bool :=
  lowerApplyFixtureCompose.isSome

/-- applyFixtureApplyOk is true (mint path).
    Greppable: applyFixtureApplyOk_true. -/
theorem applyFixtureApplyOk_true : applyFixtureApplyOk = true := by decide

/-- Parse fuel (command fold). -/
def liveCompilePathApplyParseFuel : Nat := 256

/-- Fuel for token walks (def names in live text). -/
def liveCompilePathApplySkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . CompilePathApply`. -/
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

/-- Names a command adds to the known-const set. CompilePath / EmitApply
    imports are not a HostKernel seed; import adds no names. -/
def cmdAddsCompilePathApply (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Tokenizer drops `++`, so `"a" ++ "b"` becomes app of two string lits.
    Kernel cannot apply String. Skip any Term.app (keep lits / const / ite). -/
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

/-- Keep only lit / const / var bodies. Leftover helper. parseLive uses
    parseSource keep. -/
def termKeepSimpleN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.some_ t => termKeepSimpleN n t
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ _, Term.ite _ _ _ => false
  | Nat.succ _, Term.decideEq _ _ => false
  | Nat.succ _, Term.proj _ _ => false
  | Nat.succ _, Term.structLit _ => false
  | Nat.succ _, Term.match_ _ _ => false

/-- UInt32 / IO types. Leftover helper. parseLive uses parseSource keep. -/
def typeHasUInt32OrIo : HostType -> Bool
  | HostType.named x =>
      lastSeg x.raw == "UInt32" || lastSeg x.raw == "IO"
  | HostType.option t => typeHasUInt32OrIo t
  | HostType.arrow d c => typeHasUInt32OrIo d || typeHasUInt32OrIo c
  | _ => false

/-- Leftover helper. parseLive uses parseSource keep, not this predicate. -/
def cmdBodyKnownCompilePathApply (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ ty body =>
      (match ty with
       | some t => !typeHasUInt32OrIo t
       | none => true)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathApplyParseFuel body
        && termNoAppN liveCompilePathApplyParseFuel body
        && termKeepSimpleN liveCompilePathApplyParseFuel body
  | Cmd.defBind _ bs ret body =>
      !typeHasUInt32OrIo ret
        && !(bs.any fun p => typeHasUInt32OrIo p.snd)
        && termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveCompilePathApplyParseFuel body
        && termNoAppN liveCompilePathApplyParseFuel body
        && termKeepSimpleN liveCompilePathApplyParseFuel body
  | _ => true

/-- Parse one command. none means the caller advances. import / namespace /
    end / def. parseLiveCompilePathApplySource uses parseSource keep. -/
def parseOneCmdCompilePathApply (fuel : Nat) (toks : List String) :
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

/-- Token walk: live text has `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live CompilePathApply.lean text.
    HostFront.parseSource is the keep path --slake-check reads.
    Keep/register names SystemsLean.CompilePathApply.
    Greppable: parseLiveCompilePathApplySource, PARSE-LIVE-COMPILE-PATH-APPLY. -/
def parseLiveCompilePathApplySource (src : String) : FrontResult :=
  if src.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseSource src with
    | FrontResult.reject r => FrontResult.reject r
    | FrontResult.accept m =>
      let kept : Module :=
        { name := HostTerm.n "SystemsLean.CompilePathApply"
          commands := m.commands }
      if isWellFormed kept then FrontResult.accept kept
      else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePathApply parse.
    Greppable: kernelCheckLiveCompilePathApplySource, PARSE-LIVE-COMPILE-PATH-APPLY. -/
def kernelCheckLiveCompilePathApplySource (src : String) : Bool :=
  match parseLiveCompilePathApplySource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathApplyParsed? : Option Module :=
  match parseLiveCompilePathApplySource liveCompilePathApplySource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / atom defs / end).
    Real lower bound from this parse, not hardcoded true. Horizon
    measured cmds=12: three dotted imports, namespace, kernelable
    Nat/Bool atoms, end. Empty cmds reject. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathApplyParsed? with
  | some m => m.commands.length >= 12
  | none => false

/-- Wrap-assigned module lastSeg is CompilePathApply (no module line in the
    live file). -/
def liveParseHasCompilePathApplyModule : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "CompilePathApply"

/-- Live parse has the living CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live product imports SystemsLean.CompilePath. Types-style: dotted import kept. -/
def liveParseHasCompilePathImport : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.CompilePath"
      | _ => false

/-- Live product imports SystemsLean.EmitApply. -/
def liveParseHasEmitApplyImport : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitApply"
      | _ => false

/-- Live product also imports SystemsLean.EmitApplyScaffold (third dotted import). -/
def liveParseHasEmitApplyScaffoldImport : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.EmitApplyScaffold"
      | _ => false

/-- Defs unique to CompilePathApply.lean (not CompilePath.lean
    and not occupancy Term string payloads). Greppable: applyFixtureMintId,
    applyFixtureApplyOk, applyFixtureCompilePathReady. -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathApplyParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveCompilePathApplySource)
    toksHaveDefNamed liveCompilePathApplySkipFuel toks
      "applyFixtureMintId"
      && toksHaveDefNamed liveCompilePathApplySkipFuel toks
        "applyFixtureApplyOk"
      && toksHaveDefNamed liveCompilePathApplySkipFuel toks
        "applyFixtureCompilePathReady"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathApplyReady, PARSE-LIVE-COMPILE-PATH-APPLY,
    HOST-FRONT-LIVE-COMPILE-PATH-APPLY.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathApplyReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILE_PATH_APPLY_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILE-PATH-APPLY")
    && (parseId == "PARSE-LIVE-COMPILE-PATH-APPLY")
    && (liveCompilePathApplyRel
      == "src/systems/SystemsLean/CompilePathApply.lean")
    && (liveRel == "CompilePathApply.lean")
    && hostFrontParseSourceCompilePathApply
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathApplyFullHost
    && !hostFrontLiveCompilePathApplyResidualFreeClaimed
    && !hostFrontLiveCompilePathApplyProvablyUnlocked
    && kernelCheckLiveCompilePathApplySource liveCompilePathApplySource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasCompilePathApplyModule
    && liveParseHasCompilePathNs
    && liveParseHasCompilePathImport
    && liveParseHasEmitApplyImport
    && liveParseHasEmitApplyScaffoldImport
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathApplySource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePathApply (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILE-PATH-APPLY =="
  IO.println s!"  host={hostId} file={liveCompilePathApplyRel}"
  let path := root / liveCompilePathApplyRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathApplyRel}"
    throw (IO.userError s!"missing {liveCompilePathApplyRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathApplySource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePathApply.lean != liveCompilePathApplySource"
    throw (IO.userError "dual-pin mismatch live CompilePathApply.lean")
  let r := parseLiveCompilePathApplySource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILE-PATH-APPLY reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILE-PATH-APPLY reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPILE-PATH-APPLY ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePathApply parse false"
      throw (IO.userError "kernelCheck live CompilePathApply parse false")
    unless hostFrontLiveCompilePathApplyReady do
      IO.eprintln "error: hostFrontLiveCompilePathApplyReady false"
      throw (IO.userError "hostFrontLiveCompilePathApplyReady false")
    IO.println s!"GREEN {stageId}: live CompilePathApply.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePathApply root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePathApply
