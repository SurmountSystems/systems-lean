/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/EmitCompose.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitCompose. Reuses HostFrontLiveHostTerm skip-fold.
  Comment strip via HostFrontLiveMult.stripComments. Not HostFront G1.
  Not HostTerm.multFixtureModule. Not parseLiveHostTermSource on EmitCompose text.
  This file is a module comment, one import, a namespace, a doc comment, and end.
  It has zero definition commands. It is EmitCompose.lean.
  Do not claim this parser imports SystemsLean.EmitCompose.
  Do not import SystemsLean.EmitComposeScaffold.
  Not a remill. Not occupancy leftover HostModuleCheckCompilePathTerm.
  Not mill remill of mill 69. Not occupancy Term.

  Spec (readable):
  - parseLiveEmitComposeSource turns live EmitCompose.lean text into HostTerm.Module.
  - Module name is SystemsLean.EmitCompose even without a module line.
  - Kept commands are the one import, the namespace, and the end.
  - Definition command count is zero. An empty command list still goes through
    HostKernel.kernelCheck (not a true stub). isWellFormed rejects that empty
    list, so the live file must keep the three structural commands.
  - kernelCheckLiveEmitComposeSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70. Occupancy stays 49. Mill stays 69 of 69.
  - Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - Not Linear / Compose / IrGraph parsers. Not EmitComposeScaffold.
  - Not mill remill. Not occupancy Term wrap.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-COMPOSE,
  SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_V0, PARSE-LIVE-EMIT-COMPOSE,
  parseLiveEmitComposeSource, kernelCheckLiveEmitComposeSource,
  hostFrontLiveEmitComposeReady, liveEmitComposeSource, liveRel,
  liveEmitComposeRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveEmitCompose
  Red/green: lean --run SlakeTypecheckEmitCompose (horizon); dests skipped;
  lake build SystemsLean.SlakeTypecheckEmitCompose on surmount-1 (queued, not run here).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitComposeSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitCompose

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-COMPOSE"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-COMPOSE"

/-- Live basename. Greppable: liveRel. Must be EmitCompose.lean. -/
def liveRel : String := "EmitCompose.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitComposeRel : String := "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitComposeFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitComposeResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitComposeProvablyUnlocked : Bool := false

/-- Honesty: mill stays 69 of 69. Not mill 70. -/
def hostFrontLiveEmitComposeMillCount : Nat := 69

/-- Honesty: occupancy stays 49. Not occupancy name 50. -/
def hostFrontLiveEmitComposeOccupancy : Nat := 49

/-- Honesty: not occupancy name 50. -/
def hostFrontLiveEmitComposeNotOccupancyName50 : Bool := true

/-- Honesty: not mill 70. -/
def hostFrontLiveEmitComposeNotMill70 : Bool := true

/-- Honesty: not Lake-gone. -/
def hostFrontLiveEmitComposeLakeGone : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitComposeParseFuel : Nat := 256

/-- Skip fuel for un-kernelable tails. -/
def liveEmitComposeSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitCompose`. -/
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
def skipNonCmdEmitCompose (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Parse one structural command. none means skip this keyword.
    Kept: import / namespace / end. def / theorem / open / abbrev skip.
    This live file has zero definition commands. -/
def parseOneCmdEmitCompose (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option / open / def.
    abbrev is not isCmdKw; skipUntilCmd still advances. -/
def parseCmdsEmitCompose : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdEmitCompose liveEmitComposeParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmdEmitCompose liveEmitComposeSkipFuel rest
      parseCmdsEmitCompose n rest2 (acc ++ [c])
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveEmitComposeSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsEmitCompose n rest2 acc
        else none
      | [] => some acc

/-- Parsed module. A failed fold is an empty command list, not a stub.
    Greppable: parsedEmitComposeModule. -/
def parsedEmitComposeModule (src : String) : Module :=
  let toks := tokenizeHostTerm (stripComments src)
  let cmds :=
    match parseCmdsEmitCompose liveEmitComposeParseFuel toks [] with
    | some cs => cs
    | none => []
  { name := HostTerm.n "SystemsLean.EmitCompose", commands := cmds }

/-- Parse live EmitCompose.lean text.
    Greppable: parseLiveEmitComposeSource, PARSE-LIVE-EMIT-COMPOSE.
    Empty commands are not well-formed, so they reject. The kernel check of
    that empty list is kernelCheckLiveEmitComposeSource, which still calls
    HostKernel.kernelCheck. -/
def parseLiveEmitComposeSource (src : String) : FrontResult :=
  let m := parsedEmitComposeModule src
  if isWellFormed m then FrontResult.accept m
  else if m.commands.isEmpty then FrontResult.reject reasonEmptyModule
  else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the parsed commands, including an empty list.
    Greppable: kernelCheckLiveEmitComposeSource, PARSE-LIVE-EMIT-COMPOSE.
    This is HostKernel.kernelCheck. It is not a true stub. -/
def kernelCheckLiveEmitComposeSource (src : String) : Bool :=
  HostKernel.kernelCheck (parsedEmitComposeModule src)

/-- Empty command list still goes through HostKernel.kernelCheck.
    isWellFormed requires one command, so this result is not forced true. -/
def kernelCheckEmptyEmitComposeCommands : Bool :=
  HostKernel.kernelCheck
    { name := HostTerm.n "SystemsLean.EmitCompose", commands := [] }

/-- Accepted live module when parse succeeds. -/
def liveEmitComposeParsed? : Option Module :=
  match parseLiveEmitComposeSource liveEmitComposeSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitComposeParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- One import, SystemsLean.EmitComposeScaffold. -/
def liveParseImportOk : Bool :=
  match liveEmitComposeParsed? with
  | none => false
  | some m =>
    let imps := m.commands.filter fun c =>
      match c with
      | Cmd.importModule _ => true
      | _ => false
    match imps with
    | [Cmd.importModule x] => x.raw == "SystemsLean.EmitComposeScaffold"
    | _ => false

/-- Live parse has the EmitCompose namespace command. -/
def liveParseHasEmitComposeNs : Bool :=
  match liveEmitComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.EmitCompose"
      | _ => false

/-- Live parse has the EmitCompose end command. -/
def liveParseHasEmitComposeEnd : Bool :=
  match liveEmitComposeParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.EmitCompose"
      | _ => false

/-- Zero definition commands (no def_ / defBind). -/
def liveParseHasNoDef : Bool :=
  match liveEmitComposeParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ _ _ _ => true
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Structural command count: import, namespace, end. -/
def liveParseCmdCountOk : Bool :=
  match liveEmitComposeParsed? with
  | some m => m.commands.length == 3
  | none => false

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitComposeSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitComposeReady, PARSE-LIVE-EMIT-COMPOSE,
    HOST-FRONT-LIVE-EMIT-COMPOSE.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a true stub. -/
def hostFrontLiveEmitComposeReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_COMPOSE_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-COMPOSE")
    && (parseId == "PARSE-LIVE-EMIT-COMPOSE")
    && (liveRel == "EmitCompose.lean")
    && (liveEmitComposeRel == "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitComposeFullHost
    && !hostFrontLiveEmitComposeResidualFreeClaimed
    && !hostFrontLiveEmitComposeProvablyUnlocked
    && (hostFrontLiveEmitComposeMillCount == 69)
    && (hostFrontLiveEmitComposeOccupancy == 49)
    && hostFrontLiveEmitComposeNotOccupancyName50
    && hostFrontLiveEmitComposeNotMill70
    && !hostFrontLiveEmitComposeLakeGone
    && kernelCheckLiveEmitComposeSource liveEmitComposeSource
    && liveParseRejectsEmpty
    && liveParseHasNoCheckCmd
    && liveParseImportOk
    && liveParseHasEmitComposeNs
    && liveParseHasEmitComposeEnd
    && liveParseHasNoDef
    && liveParseCmdCountOk

/-- Short command trace for the driver banner. -/
def cmdKind : Cmd -> String
  | Cmd.importModule x => "import " ++ x.raw
  | Cmd.namespace x => "namespace " ++ x.raw
  | Cmd.endNamespace x => "end " ++ x.raw
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => "inductive " ++ x.raw
  | Cmd.def_ x _ _ => "def " ++ x.raw
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => "structure " ++ x.raw
  | Cmd.defBind x _ _ _ => "def " ++ x.raw

/-- Join command kinds. -/
def cmdTrace (cs : List Cmd) : String :=
  String.intercalate "; " (cs.map cmdKind)

/-- Definition command count. Live file is zero. -/
def defCount (cs : List Cmd) : Nat :=
  cs.foldl (fun n c =>
    match c with
    | Cmd.def_ _ _ _ => n + 1
    | Cmd.defBind _ _ _ _ => n + 1
    | _ => n) 0

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitCompose (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-COMPOSE =="
  IO.println s!"  host={hostId} file={liveEmitComposeRel}"
  let path := root / liveEmitComposeRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitComposeRel}"
    throw (IO.userError s!"missing {liveEmitComposeRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitComposeSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitCompose.lean != liveEmitComposeSource"
    throw (IO.userError "dual-pin mismatch live EmitCompose.lean")
  let r := parseLiveEmitComposeSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-COMPOSE reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-COMPOSE reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-COMPOSE ACCEPT cmds={m.commands.length} defs={defCount m.commands} kernelCheck={k}"
    IO.println s!"  kinds={cmdTrace m.commands}"
    IO.println s!"  empty command list kernelCheck={kernelCheckEmptyEmitComposeCommands}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitCompose parse false"
      throw (IO.userError "kernelCheck live EmitCompose parse false")
    unless hostFrontLiveEmitComposeReady do
      IO.eprintln s!"error: hostFrontLiveEmitComposeReady false cmds={m.commands.length} countOk={liveParseCmdCountOk} importOk={liveParseImportOk} ns={liveParseHasEmitComposeNs} endOk={liveParseHasEmitComposeEnd} noDef={liveParseHasNoDef} noCheck={liveParseHasNoCheckCmd} liveRelOk={liveRel == "EmitCompose.lean"} kernel={k}"
      throw (IO.userError "hostFrontLiveEmitComposeReady false")
    IO.println s!"GREEN {stageId}: live EmitCompose.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitCompose root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitCompose
