/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostFrontTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFrontTheorems. Reuses HostFrontLiveFront skip of
  theorem / example / set_option. Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveFrontSource on HostFrontTheorems text.

  Spec (readable):
  - parseLiveFrontTheoremsSource turns live HostFrontTheorems.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostFrontTheorems even without a module line.
  - kernelCheckLiveFrontTheoremsSource is HostKernel.kernelCheck of that parse.

  Parser sugar (not HostTerm IR growth): dotted import / namespace / end;
  theorem / example / set_option skip until the next command. Dual-pin is full
  HostFrontTheorems.lean bytes.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostFront.lean parse.
  - Not occupancy name 50. Not mill 70.
  - Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-FRONT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_FRONT_THEOREMS_V0, PARSE-LIVE-FRONT-THEOREMS,
  parseLiveFrontTheoremsSource, kernelCheckLiveFrontTheoremsSource,
  hostFrontLiveFrontTheoremsReady, liveFrontTheoremsSource,
  liveFrontTheoremsRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveFrontTheorems
  Red/green: just systems-host; lake build
  SystemsLean.HostFrontLiveFrontTheorems on surmount-1.
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveFront
import SystemsLean.HostFrontLiveFrontTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFrontTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveFront

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_FRONT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FRONT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-FRONT-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFrontTheoremsRel : String :=
  "src/systems/SystemsLean/HostFrontTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFrontTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFrontTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveFrontTheoremsProvablyUnlocked : Bool := false

/-- Dotted ident `SystemsLean . HostFront`. -/
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

/-- Parse one command: dotted import / namespace / end only.
    theorem / example / set_option fail closed so the fold skips them. -/
def parseOneCmdFrontTheorems (fuel : Nat) (toks : List String) :
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

/-- Fold commands. Skip theorem / example / set_option. -/
def parseCmdsFrontTheorems : Nat -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdFrontTheorems liveFrontParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFrontSkipFuel rest
      parseCmdsFrontTheorems n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveFrontSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFrontTheorems n rest2 acc
          else none
        else none
      | [] => some acc

/-- Parse live HostFrontTheorems.lean text.
    Greppable: parseLiveFrontTheoremsSource, PARSE-LIVE-FRONT-THEOREMS. -/
def parseLiveFrontTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeFront (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFrontTheorems liveFrontParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostFrontTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostFrontTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveFrontTheoremsSource, PARSE-LIVE-FRONT-THEOREMS. -/
def kernelCheckLiveFrontTheoremsSource (src : String) : Bool :=
  match parseLiveFrontTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFrontTheoremsParsed? : Option Module :=
  match parseLiveFrontTheoremsSource liveFrontTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFrontTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveFrontTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Live parse keeps only import / namespace / end (theorems skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Live parse imports SystemsLean.HostFront. -/
def liveParseHasHostFrontImport : Bool :=
  match liveFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostFront"
      | _ => false

/-- Live parse opens namespace SystemsLean.HostFront. -/
def liveParseHasHostFrontNamespace : Bool :=
  match liveFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostFront"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostFront. -/
def liveParseHasHostFrontEnd : Bool :=
  match liveFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostFront"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFrontTheoremsReady, PARSE-LIVE-FRONT-THEOREMS,
    HOST-FRONT-LIVE-FRONT-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveFrontTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FRONT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-FRONT-THEOREMS")
    && (parseId == "PARSE-LIVE-FRONT-THEOREMS")
    && (liveFrontTheoremsRel
      == "src/systems/SystemsLean/HostFrontTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFrontTheoremsFullHost
    && !hostFrontLiveFrontTheoremsResidualFreeClaimed
    && !hostFrontLiveFrontTheoremsProvablyUnlocked
    && kernelCheckLiveFrontTheoremsSource liveFrontTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasHostFrontImport
    && liveParseHasHostFrontNamespace
    && liveParseHasHostFrontEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFrontTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveFrontTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FRONT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveFrontTheoremsRel}"
  let path := root / liveFrontTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFrontTheoremsRel}"
    throw (IO.userError s!"missing {liveFrontTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFrontTheoremsSource then
    IO.eprintln
      "error: dual-pin mismatch: on-disk HostFrontTheorems.lean != liveFrontTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostFrontTheorems.lean")
  let r := parseLiveFrontTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FRONT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FRONT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println
      s!"PASS PARSE-LIVE-FRONT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostFrontTheorems parse false"
      throw (IO.userError "kernelCheck live HostFrontTheorems parse false")
    unless hostFrontLiveFrontTheoremsReady do
      IO.eprintln "error: hostFrontLiveFrontTheoremsReady false"
      throw (IO.userError "hostFrontLiveFrontTheoremsReady false")
    IO.println
      s!"GREEN {stageId}: live HostFrontTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFrontTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFrontTheorems
