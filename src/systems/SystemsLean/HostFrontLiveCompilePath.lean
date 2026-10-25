/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/CompilePath.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveCompilePath. parseSource keep of
  CompilePath.lean, module name SystemsLean.CompilePath.
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on CompilePath text. Not occupancy CompilePathTerm.
  Not HostModuleCheckCompilePathTerm.

  Spec (readable):
  - parseLiveCompilePathSource is HostFront.parseSource of live
    CompilePath.lean text, then keep/register the module name
    SystemsLean.CompilePath. parseSource is what --slake-check
    reads (walkKept keep, not a skip-fold of this module).
  - Graph-shape sequential keep on this on-disk module:
    compilePathFixtureMintId (Nat 4), lowerCompilePathFixtureCompose,
    compilePathFixtureLiveView, compilePathFixtureSpentView,
    keep lowerCompilePathFixtureCompose_isSome with decide.
    --slake-check reads acceptKeptCompilePath on these forms.
  - Module name is SystemsLean.CompilePath even without a module line.
  - kernelCheckLiveCompilePathSource is HostKernel.kernelCheck of that parse
    (not a constant true, and not kernelCheckN with a local import seed).
  - hostFrontParseSourceCompilePath is parseSource keep of the
    frozen bytes, renamed to SystemsLean.CompilePath.
  - Do not skip-fold CompilePath away from --slake-check.
  - toksHaveDefNamed still sees stageId, hostCompilePathId, gradeSurfaceOk.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Not CompilePathTerm occupancy wrap.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.
  - Not Linear / Compose / IrGraph parsers.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-COMPILEPATH,
  SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0,
  PARSE-LIVE-COMPILEPATH, parseLiveCompilePathSource, kernelCheckLiveCompilePathSource,
  hostFrontLiveCompilePathReady, liveCompilePathSource, liveCompilePathRel,
  hostFrontParseSourceCompilePath, compilePathFixtureMintId,
  compilePathFixtureLiveView, compilePathFixtureSpentView,
  lowerCompilePathFixtureCompose, lowerCompilePathFixtureCompose_isSome,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveCompilePath
  Red/green: just slake-typecheck-compilepath; just systems-host dest rows;
  lake build SystemsLean.HostFrontLiveCompilePath on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveCompilePathSource
import SystemsLean.HostKernel
import SystemsLean.HostCompose

namespace SystemsLean.HostFrontLiveCompilePath

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostCompose (Host)

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-COMPILEPATH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-COMPILEPATH"

/-- Live file basename. Not a path. -/
def liveRel : String := "CompilePath.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveCompilePathRel : String := "src/systems/SystemsLean/CompilePath.lean"

/-- HostFront.parseSource is what --slake-check reads (walkKept keep).
    Not a skip-fold of CompilePath. Name register is
    parseLiveCompilePathSource (SystemsLean.CompilePath). -/
def hostFrontParseSourceCompilePath : Bool :=
  match parseSource liveCompilePathSource with
  | FrontResult.accept m => isWellFormed m
  | FrontResult.reject _ => false

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveCompilePathFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveCompilePathResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveCompilePathProvablyUnlocked : Bool := false

/-- Fixed CompilePath fixture mint id (nonzero; matches COMPILE-PATH-SMOKE mint 4). -/
def compilePathFixtureMintId : Nat := 4

/-- CompilePath fixture host ready for unit compile path.
    mint MULT-1 live token on empty compose. FAIL-CLOSED: none if mint fails.
    Greppable: lowerCompilePathFixtureCompose, HOST-COMPOSE. -/
def lowerCompilePathFixtureCompose : Option Host :=
  match HostCompose.mint HostCompose.empty compilePathFixtureMintId with
  | HostCompose.MintResult.ok hc' => some hc'
  | _ => none

/-- Live view: minted MULT-1 host (ConsumeToken). -/
def compilePathFixtureLiveView : Option Host :=
  lowerCompilePathFixtureCompose

/-- Spent view: ConsumeToken consume of compilePathFixtureLiveView. -/
def compilePathFixtureSpentView : Option Host :=
  match compilePathFixtureLiveView with
  | none => none
  | some hcLive =>
      match HostCompose.consume hcLive with
      | HostCompose.ConsumeResult.ok hcSpent _ => some hcSpent
      | HostCompose.ConsumeResult.notLive => none

/-- lowerCompilePathFixtureCompose is some (mint path).
    Greppable: lowerCompilePathFixtureCompose_isSome. -/
theorem lowerCompilePathFixtureCompose_isSome : lowerCompilePathFixtureCompose.isSome = true := by decide

/-- Fuel for token walks (def names in live text). -/
def liveCompilePathSkipFuel : Nat := 8192

/-- Token walk: live text has `def` named `nm`. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live CompilePath.lean text.
    HostFront.parseSource is the keep path --slake-check reads.
    Keep/register names SystemsLean.CompilePath.
    Greppable: parseLiveCompilePathSource, PARSE-LIVE-COMPILEPATH. -/
def parseLiveCompilePathSource (src : String) : FrontResult :=
  if src.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseSource src with
    | FrontResult.reject r => FrontResult.reject r
    | FrontResult.accept m =>
      let kept : Module :=
        { name := HostTerm.n "SystemsLean.CompilePath"
          commands := m.commands }
      if isWellFormed kept then FrontResult.accept kept
      else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live CompilePath parse.
    Greppable: kernelCheckLiveCompilePathSource, PARSE-LIVE-COMPILEPATH. -/
def kernelCheckLiveCompilePathSource (src : String) : Bool :=
  match parseLiveCompilePathSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveCompilePathParsed? : Option Module :=
  match parseLiveCompilePathSource liveCompilePathSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / open / typed defs / end).
    Real lower bound from this parse, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveCompilePathParsed? with
  | some m => m.commands.length >= 8
  | none => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse has the CompilePath namespace command. -/
def liveParseHasCompilePathNs : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "CompilePath"
      | _ => false

/-- Live parse has core CompilePath defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveCompilePathParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    let toks := tokenizeHostTerm (stripComments liveCompilePathSource)
    has "stageId" && has "hostCompilePathId"
      && (has "gradeSurfaceOk"
        || toksHaveDefNamed liveCompilePathSkipFuel toks "gradeSurfaceOk")

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveCompilePathReady, PARSE-LIVE-COMPILEPATH,
    HOST-FRONT-LIVE-COMPILEPATH.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveCompilePathReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_COMPILEPATH_V0")
    && (hostId == "HOST-FRONT-LIVE-COMPILEPATH")
    && (parseId == "PARSE-LIVE-COMPILEPATH")
    && (liveCompilePathRel == "src/systems/SystemsLean/CompilePath.lean")
    && hostFrontParseSourceCompilePath
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveCompilePathFullHost
    && !hostFrontLiveCompilePathResidualFreeClaimed
    && !hostFrontLiveCompilePathProvablyUnlocked
    && kernelCheckLiveCompilePathSource liveCompilePathSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasMultImport
    && liveParseHasCompilePathNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveCompilePathSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveCompilePath (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-COMPILEPATH =="
  IO.println s!"  host={hostId} file={liveCompilePathRel}"
  let path := root / liveCompilePathRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveCompilePathRel}"
    throw (IO.userError s!"missing {liveCompilePathRel}")
  let disk <- IO.FS.readFile path
  if disk != liveCompilePathSource then
    IO.eprintln "error: dual-pin mismatch: on-disk CompilePath.lean != liveCompilePathSource"
    throw (IO.userError "dual-pin mismatch live CompilePath.lean")
  let r := parseLiveCompilePathSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-COMPILEPATH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-COMPILEPATH reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-COMPILEPATH ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live CompilePath parse false"
      throw (IO.userError "kernelCheck live CompilePath parse false")
    unless hostFrontLiveCompilePathReady do
      IO.eprintln "error: hostFrontLiveCompilePathReady false"
      throw (IO.userError "hostFrontLiveCompilePathReady false")
    IO.println s!"GREEN {stageId}: live CompilePath.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  IO.println s!"liveRel={liveRel}"
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveCompilePath root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveCompilePath
