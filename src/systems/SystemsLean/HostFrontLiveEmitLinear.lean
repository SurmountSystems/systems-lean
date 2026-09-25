/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/EmitLinear.lean with the HostFrontLiveHostTerm
  skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  Not Linear.lean. Not a backend. Not EmitMult. Not EmitBanner.
  Not EmitTypes. Not EmitErasure.
  Not FullHost. Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-EMIT-LINEAR,
  SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_V0,
  PARSE-LIVE-EMIT-LINEAR, EMIT-LINEAR, liveRel,
  kernelCheckLiveEmitLinearSource,
  hostFrontLiveEmitLinearReady.
  Module: SystemsLean.HostFrontLiveEmitLinear
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveEmitLinearSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveEmitLinear

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-EMIT-LINEAR"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-EMIT-LINEAR"

/-- Live file basename. -/
def liveRel : String := "EmitLinear.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveEmitLinearRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveEmitLinearFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveEmitLinearResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveEmitLinearProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveEmitLinearParseFuel : Nat := 256

/-- Skip fuel for un-kernelable tails. The live file has no def and no theorem. -/
def liveEmitLinearSkipFuel : Nat := 8192

/-- Dotted ident `SystemsLean . EmitLinear`. -/
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

/-- Parse one command. import, namespace, and end only.
    The live file has no def and no theorem. none means skip this keyword. -/
def parseOneCmdEmitLinear (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip keywords this parser does not accept. -/
def parseCmdsEmitLinear : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdEmitLinear liveEmitLinearParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveEmitLinearSkipFuel rest
      parseCmdsEmitLinear n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveEmitLinearSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsEmitLinear n rest2 acc
          else none
        else none
      | [] => some acc

/-- Parse live EmitLinear.lean text.
    Greppable: parseLiveEmitLinearSource, PARSE-LIVE-EMIT-LINEAR. -/
def parseLiveEmitLinearSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsEmitLinear liveEmitLinearParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.EmitLinear"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live EmitLinear parse. Not a fixture.
    Not a hardcoded true. Greppable: kernelCheckLiveEmitLinearSource,
    PARSE-LIVE-EMIT-LINEAR. -/
def kernelCheckLiveEmitLinearSource (src : String) : Bool :=
  match parseLiveEmitLinearSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveEmitLinearParsed? : Option Module :=
  match parseLiveEmitLinearSource liveEmitLinearSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveEmitLinearParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import of the scaffold module. -/
def cmdImportScaffold : Cmd -> Bool
  | Cmd.importModule x => x.raw == "SystemsLean.EmitLinearScaffold"
  | _ => false

/-- Namespace SystemsLean.EmitLinear. -/
def cmdNamespaceEmitLinear : Cmd -> Bool
  | Cmd.namespace x => x.raw == "SystemsLean.EmitLinear"
  | _ => false

/-- End of namespace SystemsLean.EmitLinear. -/
def cmdEndNamespaceEmitLinear : Cmd -> Bool
  | Cmd.endNamespace x => x.raw == "SystemsLean.EmitLinear"
  | _ => false

/-- Live parse is exactly import, namespace, and end. No invented def. -/
def liveParseHasThreeCmds : Bool :=
  match liveEmitLinearParsed? with
  | none => false
  | some m =>
    m.commands.length == 3
      && m.commands.any cmdImportScaffold
      && m.commands.any cmdNamespaceEmitLinear
      && m.commands.any cmdEndNamespaceEmitLinear

/-- Wrap module name is SystemsLean.EmitLinear (no module line in the live file). -/
def liveParseHasEmitLinearModule : Bool :=
  match liveEmitLinearParsed? with
  | none => false
  | some m => m.name.raw == "SystemsLean.EmitLinear"

/-- Import needle. Trailing newline. -/
def needleImportScaffold : String := "import SystemsLean.EmitLinearScaffold\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.EmitLinear\n"

/-- End needle with a trailing newline. -/
def needleEndNamespace : String := "end SystemsLean.EmitLinear\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check. -/
def liveNeedlesOk : Bool :=
  let src := liveEmitLinearSource
  (src.splitOn needleImportScaffold).length > 1
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleEndNamespace).length > 1

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveEmitLinearSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveEmitLinearReady,
    PARSE-LIVE-EMIT-LINEAR,
    HOST-FRONT-LIVE-EMIT-LINEAR.
    Real conjunction: parse plus kernelCheck plus honesty pins.
    Not a hardcoded true. Does not require a def name. -/
def hostFrontLiveEmitLinearReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_EMIT_LINEAR_V0")
    && (hostId == "HOST-FRONT-LIVE-EMIT-LINEAR")
    && (parseId == "PARSE-LIVE-EMIT-LINEAR")
    && (liveRel == "EmitLinear.lean")
    && (liveEmitLinearRel == "src/systems/SystemsLean/EmitLinear.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveEmitLinearFullHost
    && !hostFrontLiveEmitLinearResidualFreeClaimed
    && !hostFrontLiveEmitLinearProvablyUnlocked
    && kernelCheckLiveEmitLinearSource liveEmitLinearSource
    && liveParseHasNoCheckCmd
    && liveParseHasThreeCmds
    && liveParseHasEmitLinearModule
    && liveNeedlesOk
    && liveParseRejectsEmpty

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveEmitLinear (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-EMIT-LINEAR =="
  IO.println s!"  host={hostId} file={liveEmitLinearRel} liveRel={liveRel}"
  let path := root / liveEmitLinearRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveEmitLinearRel}"
    throw (IO.userError s!"missing {liveEmitLinearRel}")
  let disk <- IO.FS.readFile path
  if disk != liveEmitLinearSource then
    IO.eprintln "error: dual-pin mismatch: on-disk EmitLinear.lean != liveEmitLinearSource"
    throw (IO.userError "dual-pin mismatch live EmitLinear.lean")
  let r := parseLiveEmitLinearSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-EMIT-LINEAR reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-EMIT-LINEAR reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-EMIT-LINEAR ACCEPT cmds={m.commands.length} kernelCheck={k} liveRel={liveRel}"
    unless k do
      IO.eprintln "error: kernelCheck live EmitLinear parse false"
      throw (IO.userError "kernelCheck live EmitLinear parse false")
    unless hostFrontLiveEmitLinearReady do
      IO.eprintln "error: hostFrontLiveEmitLinearReady false"
      throw (IO.userError "hostFrontLiveEmitLinearReady false")
    IO.println s!"GREEN {stageId}: live EmitLinear.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveEmitLinear root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveEmitLinear
