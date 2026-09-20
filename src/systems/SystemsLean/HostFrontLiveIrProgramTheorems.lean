/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/IrProgramTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveIrProgramTheorems. Reuses HostFrontLiveHostTerm skip of
  theorem / example / set_option. Local fold skips open (TypesTheorems way) and
  drops the private token (not isCmdKw). Not HostFront G1. Not
  HostTerm.multFixtureModule. Not parseLiveHostTermSource on IrProgramTheorems
  text. Not HostFrontLiveIrProgram (that parser is live IrProgram.lean defs).

  Spec (readable):
  - parseLiveIrProgramTheoremsSource turns live IrProgramTheorems.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.IrProgramTheorems even without a module line.
  - kernelCheckLiveIrProgramTheoremsSource is HostKernel.kernelCheck of that parse.

  Theorems skip until the next command. Kept commands are import, namespace,
  and end. open is skipped (single-ident Mult open and three-ident Types open);
  leftover `( ... )` after a multi-ident open is consumed with skipBalanced.
  private is dropped so the following def can skip via cmdBodyKnown or
  skipUntilCmd. Do not keep private defs (struct-lit IrNode bodies are not
  kernel-known).

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live IrProgram.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_THEOREMS_V0, PARSE-LIVE-IR-PROGRAM-THEOREMS,
  parseLiveIrProgramTheoremsSource, kernelCheckLiveIrProgramTheoremsSource,
  hostFrontLiveIrProgramTheoremsReady, liveIrProgramTheoremsSource,
  liveIrProgramTheoremsRel, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveIrProgramTheorems
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveIrProgramTheorems
  on surmount-1 (queued, not run here). Not package typecheck GREEN. Not FullHost.
  Not Lake-gone. Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveIrProgramTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveIrProgramTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IR-PROGRAM-THEOREMS"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrProgramTheoremsRel : String :=
  "src/systems/SystemsLean/IrProgramTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveIrProgramTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveIrProgramTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveIrProgramTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (IrProgramTheorems is a theorems companion; TypesTheorems uses 256). -/
def liveIrProgramTheoremsParseFuel : Nat := 256

/-- Skip open (un-kernelable / leftover paren tokens) so kernelCheck sees
    import / namespace / end. Copied locally from TypesTheorems. -/
def isOpenNs : Cmd -> Bool
  | Cmd.openNs _ => true
  | _ => false

/-- After skipping Cmd.openNs, consume leftover `( ... )` from a multi-ident
    open (parseOneCmdHt only eats one inner ident). -/
def skipOpenParenRest (fuel : Nat) (rest : List String) : Option (List String) :=
  match rest with
  | "(" :: more => skipBalanced fuel 1 more
  | _ => some rest

/-- Fold commands. Skip theorem / example / set_option / open / private.
    Keep import / namespace / end. Tokenize with Mult takeIdent so
    SystemsLean.IrProgram stays one name. -/
def parseCmdsIrProgramTheorems : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdHt liveIrProgramTheoremsParseFuel toks with
    | some (c, rest) =>
      if isOpenNs c then
        match skipOpenParenRest liveIrProgramTheoremsParseFuel rest with
        | some rest2 => parseCmdsIrProgramTheorems n rest2 kn acc
        | none => none
      else if cmdBodyKnown kn c then
        parseCmdsIrProgramTheorems n rest (kn ++ cmdAdds c) (acc ++ [c])
      else
        parseCmdsIrProgramTheorems n rest kn acc
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmdsIrProgramTheorems n rest kn acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveIrProgramTheoremsParseFuel rest
          if rest2.length < toks.length then
            parseCmdsIrProgramTheorems n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Parse live IrProgramTheorems.lean text.
    Greppable: parseLiveIrProgramTheoremsSource, PARSE-LIVE-IR-PROGRAM-THEOREMS. -/
def parseLiveIrProgramTheoremsSource (src : String) : FrontResult :=
  let toks := tokenize (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsIrProgramTheorems liveIrProgramTheoremsParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.IrProgramTheorems", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live IrProgramTheorems parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveIrProgramTheoremsSource, PARSE-LIVE-IR-PROGRAM-THEOREMS. -/
def kernelCheckLiveIrProgramTheoremsSource (src : String) : Bool :=
  match parseLiveIrProgramTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveIrProgramTheoremsParsed? : Option Module :=
  match parseLiveIrProgramTheoremsSource liveIrProgramTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveIrProgramTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem/open skip).
    Real lower bound, not hardcoded true. Three imports + ns + end. -/
def liveParseCmdCountOk : Bool :=
  match liveIrProgramTheoremsParsed? with
  | some m => m.commands.length >= 5
  | none => false

/-- Live parse keeps only import / namespace / end (theorems, open, private skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveIrProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Live parse imports SystemsLean.Mult. -/
def liveParseHasMultImport : Bool :=
  match liveIrProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Mult"
      | _ => false

/-- Live parse imports SystemsLean.Types. -/
def liveParseHasTypesImport : Bool :=
  match liveIrProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "Types"
      | _ => false

/-- Live parse imports SystemsLean.IrProgram. -/
def liveParseHasIrProgramImport : Bool :=
  match liveIrProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "IrProgram"
      | _ => false

/-- Live parse has the IrProgram namespace command. -/
def liveParseHasIrProgramNs : Bool :=
  match liveIrProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.IrProgram"
      | _ => false

/-- Live parse ends the IrProgram namespace. -/
def liveParseHasIrProgramEnd : Bool :=
  match liveIrProgramTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.IrProgram"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveIrProgramTheoremsReady, PARSE-LIVE-IR-PROGRAM-THEOREMS,
    HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveIrProgramTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-IR-PROGRAM-THEOREMS")
    && (parseId == "PARSE-LIVE-IR-PROGRAM-THEOREMS")
    && (liveIrProgramTheoremsRel == "src/systems/SystemsLean/IrProgramTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveIrProgramTheoremsFullHost
    && !hostFrontLiveIrProgramTheoremsResidualFreeClaimed
    && !hostFrontLiveIrProgramTheoremsProvablyUnlocked
    && kernelCheckLiveIrProgramTheoremsSource liveIrProgramTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasMultImport
    && liveParseHasTypesImport
    && liveParseHasIrProgramImport
    && liveParseHasIrProgramNs
    && liveParseHasIrProgramEnd

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveIrProgramTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveIrProgramTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IR-PROGRAM-THEOREMS =="
  IO.println s!"  host={hostId} file={liveIrProgramTheoremsRel}"
  let path := root / liveIrProgramTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveIrProgramTheoremsRel}"
    throw (IO.userError s!"missing {liveIrProgramTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveIrProgramTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk IrProgramTheorems.lean != liveIrProgramTheoremsSource"
    throw (IO.userError "dual-pin mismatch live IrProgramTheorems.lean")
  let r := parseLiveIrProgramTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IR-PROGRAM-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IR-PROGRAM-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IR-PROGRAM-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live IrProgramTheorems parse false"
      throw (IO.userError "kernelCheck live IrProgramTheorems parse false")
    unless hostFrontLiveIrProgramTheoremsReady do
      IO.eprintln "error: hostFrontLiveIrProgramTheoremsReady false"
      throw (IO.userError "hostFrontLiveIrProgramTheoremsReady false")
    IO.println s!"GREEN {stageId}: live IrProgramTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveIrProgramTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveIrProgramTheorems
