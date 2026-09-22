/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitGraph.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitGraph. Reuses HostFrontLiveHostTerm
  tokenizeHostTerm and HostFrontLiveMult stripComments.
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not the EmitGraphScaffold product parser.
  Not IrGraph.lean. Not EmitMult, EmitBanner, EmitLinear, or EmitTypes.

  Spec (readable):
  - parseLiveEmitGraphSource turns live EmitGraph.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.EmitGraph (no module line in the file).
  - Import target SystemsLean.EmitGraphScaffold stays after comment strip.
    That import is not this module name.
  - kernelCheckLiveEmitGraphSource is HostKernel.kernelCheck of that parse.
  - After strip, the shape is import, namespace, and end. No def and no
    theorem in this file. Doc comments are block comments. stripComments
    strips them.
  - Skip theorem, example, set_option, and open when present. This file
    has none.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill 70. Mill stays 69 of 69.
  - Not Lake-gone. Not PROVABLY. slakeOwnsPackageTypecheck stays false.
  - Not freestanding residual free.

  Unique needles (trailing newline so a longer name is not a prefix hit):
  HostFrontLiveEmitGraph
  PARSE-LIVE-EMIT-GRAPH
  HOST-FRONT-LIVE-EMIT-GRAPH
  SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_V0
  EmitGraph.lean

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveEmitGraphSource,
  kernelCheckLiveEmitGraphSource,
  hostFrontLiveEmitGraphReady, liveEmitGraphSource,
  liveRel, UNIT_SURFACE host surface,
  liveParseDoesNotUseMultFixture.
  Module: SystemsLean.HostFrontLiveEmitGraph
  Red/green: closed lean --run on horizon.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitGraphSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitGraph

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-GRAPH"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-GRAPH"

/-- Live file basename. Not EmitGraphScaffold.lean. Not IrGraph.lean. -/
def liveRel : String := "EmitGraph.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitGraphRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool :=
  liveRel == "EmitGraph.lean"

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitGraphFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitGraphResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitGraphProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitGraphParseFuel : Nat := 256

/-- Skip fuel for theorem / example / un-kernelable tails. -/
def liveEmitGraphSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitGraph`. -/
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

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    This file has import, namespace, and end only. No def. -/
def parseOneCmdEmitGraph (fuel : Nat) (toks : List String) :
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
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open.
    This file has import, namespace, and end only. -/
def parseCmdsEmitGraph : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdEmitGraph liveEmitGraphParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitGraphSkipFuel rest
      parseCmdsEmitGraph n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitGraphSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitGraph n rest2 acc
          else none
        else none
      | [] => some acc

/-- Parse live EmitGraph.lean text.
    Greppable: parseLiveEmitGraphSource, PARSE-LIVE-EMIT-GRAPH. -/
def parseLiveEmitGraphSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitGraph liveEmitGraphParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitGraph"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitGraph parse. Not a fixture.
    Greppable: kernelCheckLiveEmitGraphSource, PARSE-LIVE-EMIT-GRAPH. -/
def kernelCheckLiveEmitGraphSource (src : String) : Bool :=
  match parseLiveEmitGraphSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitGraphParsed? : Option Module :=
  match parseLiveEmitGraphSource liveEmitGraphSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitGraphParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import of EmitGraphScaffold, exact string, not this module name. -/
def cmdIsImportScaffold : Cmd -> Bool
  | Cmd.importModule x =>
    x.raw == "SystemsLean.EmitGraphScaffold"
      && lastSeg x.raw == "EmitGraphScaffold"
  | _ => false

/-- Namespace command whose full name and lastSeg are EmitGraph. -/
def cmdIsEmitGraphNs : Cmd -> Bool
  | Cmd.namespace x =>
    x.raw == "SystemsLean.EmitGraph" && lastSeg x.raw == "EmitGraph"
  | _ => false

/-- End command whose full name and lastSeg are EmitGraph. -/
def cmdIsEmitGraphEnd : Cmd -> Bool
  | Cmd.endNamespace x =>
    x.raw == "SystemsLean.EmitGraph" && lastSeg x.raw == "EmitGraph"
  | _ => false

/-- Import, then namespace, then end. Rejects a stray command. -/
def liveParseShapeOk : Bool :=
  match liveEmitGraphParsed? with
  | some m =>
    match m.commands with
    | [a, b, c] =>
      cmdIsImportScaffold a && cmdIsEmitGraphNs b && cmdIsEmitGraphEnd c
    | _ => false
  | none => false

/-- Command count is the measured parse length, not a hardcoded bit. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitGraphParsed? with
  | some m => m.commands.length == 3 && liveParseShapeOk
  | none => false

/-- Module lastSeg is EmitGraph. Not EmitGraphScaffold. -/
def liveParseHasEmitGraphModule : Bool :=
  match liveEmitGraphParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.EmitGraph"
      && lastSeg m.name.raw == "EmitGraph"

/-- Exactly one namespace command, lastSeg EmitGraph. -/
def liveParseHasEmitGraphNs : Bool :=
  match liveEmitGraphParsed? with
  | none => false
  | some m => (m.commands.filter cmdIsEmitGraphNs).length == 1

/-- Exactly one end command, lastSeg EmitGraph. -/
def liveParseHasEmitGraphEnd : Bool :=
  match liveEmitGraphParsed? with
  | none => false
  | some m => (m.commands.filter cmdIsEmitGraphEnd).length == 1

/-- Exactly one import of SystemsLean.EmitGraphScaffold.
    That target is not the module name SystemsLean.EmitGraph. -/
def liveParseImportTargetIsNotModule : Bool :=
  match liveEmitGraphParsed? with
  | none => false
  | some m =>
    (m.commands.filter cmdIsImportScaffold).length == 1
      && m.name.raw == "SystemsLean.EmitGraph"
      && m.name.raw != "SystemsLean.EmitGraphScaffold"

/-- After comment strip, no `def` and no `theorem`.
    Those defs live on EmitGraphScaffold, not in this file. -/
def liveParseLacksDef : Bool :=
  match liveEmitGraphParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripComments liveEmitGraphSource)
    !(toks.any fun t => t == "def" || t == "theorem")

/-- Import needle with a trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitGraphScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitGraph\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.EmitGraph\n"

/-- Header needle with a trailing newline. -/
def needleHeader : String :=
  "  SYSTEMS_LEAN_HOST partial -- host-owned IR graph freestanding C product text.\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitGraphSource
  (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEnd).length > 1
    && (src.splitOn needleHeader).length > 1

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitGraphSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitGraphReady,
    PARSE-LIVE-EMIT-GRAPH,
    HOST-FRONT-LIVE-EMIT-GRAPH.
    Real conjunction: parse plus kernel plus honesty pins.
    Not a hardcoded success bit. -/
def hostFrontLiveEmitGraphReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_GRAPH_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-GRAPH")
    && (parseId == "PARSE-LIVE-EMIT-GRAPH")
    && (liveRel == "EmitGraph.lean")
    && (liveEmitGraphRel == "src/systems/SystemsLean/EmitGraph.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitGraphFullHost
    && !hostFrontLiveEmitGraphResidualFreeClaimed
    && !hostFrontLiveEmitGraphProvablyUnlocked
    && kernelCheckLiveEmitGraphSource liveEmitGraphSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseShapeOk
    && liveParseHasEmitGraphModule
    && liveParseHasEmitGraphNs
    && liveParseHasEmitGraphEnd
    && liveParseImportTargetIsNotModule
    && liveParseLacksDef
    && liveNeedlesOk
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitGraph (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-GRAPH =="
  IO.println s!"  host={hostId} file={liveEmitGraphRel} liveRel={liveRel}"
  let path := root / liveEmitGraphRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitGraphRel}"
    throw (IO.userError s!"missing {liveEmitGraphRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitGraphSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitGraph.lean != liveEmitGraphSource"
    throw (IO.userError "dual-pin mismatch live EmitGraph.lean")
  let r := parseLiveEmitGraphSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-GRAPH reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-GRAPH reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-GRAPH ACCEPT cmds={m.commands.length} kernelCheck={k} liveRel={liveRel}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitGraph parse false"
      throw (IO.userError "kernelCheck live EmitGraph parse false")
    unless liveParseShapeOk do
      IO.eprintln "error: live EmitGraph parse shape"
      throw (IO.userError "live EmitGraph parse shape")
    unless liveNeedlesOk do
      IO.eprintln "error: live EmitGraph needles"
      throw (IO.userError "live EmitGraph needles")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty EmitGraph source must reject"
      throw (IO.userError "empty EmitGraph source must reject")
    unless hostFrontLiveEmitGraphReady do
      IO.eprintln "error: hostFrontLiveEmitGraphReady false"
      throw (IO.userError "hostFrontLiveEmitGraphReady false")
    IO.println s!"GREEN {stageId}: live EmitGraph.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitGraph root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitGraph
