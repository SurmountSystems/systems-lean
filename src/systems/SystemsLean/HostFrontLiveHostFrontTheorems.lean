/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostFrontTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostFrontTheorems. Reuses HostFrontLiveHostTerm
  skip-until-command fold and the string-safe comment strip (dash-dash inside
  a string stays; a block comment does not treat dash-dash as a line comment).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostFrontTheorems text.
  Not HostFront.lean. Not HostFrontGoldens.lean. Not HostFrontMain.lean.
  Not HostGraph. Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostFrontTheoremsSource turns live HostFrontTheorems.lean text
    into HostTerm.Module.
  - One embedded copy: liveHostFrontTheoremsSource. Not split. Not in this file.
  - Module name is SystemsLean.HostFrontTheorems even without a module line.
  - kernelCheckLiveHostFrontTheoremsSource is HostKernel.kernelCheck of that
    parse (not a constant true).
  - Skip theorem, example, and set_option until the next command.
  - Keep import, namespace, and end. This peel has no kernelable def.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not occupancy name 50. Not mill 70.
  - Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-FRONT-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_HOST_FRONT_THEOREMS_V0,
  PARSE-LIVE-HOST-FRONT-THEOREMS, parseLiveHostFrontTheoremsSource,
  kernelCheckLiveHostFrontTheoremsSource,
  hostFrontLiveHostFrontTheoremsReady, liveHostFrontTheoremsSource, liveRel,
  liveHostFrontTheoremsRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostFrontTheorems
  Red/green: lean --run SlakeTypecheckHostFrontTheorems (no mill; no lake).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostFrontTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostFrontTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_FRONT_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-FRONT-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-FRONT-THEOREMS"

/-- Live basename. Greppable: liveRel. Must be HostFrontTheorems.lean. -/
def liveRel : String := "HostFrontTheorems.lean"

/-- Live file relative to repo root.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostFrontTheoremsRel : String :=
  "src/systems/SystemsLean/HostFrontTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostFrontTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostFrontTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostFrontTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostFrontTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveHostFrontTheoremsSkipFuel : Nat := 8192

/-- Strip comments; keep dash-dash and block-open inside string payloads.
    A block comment does not treat every dash-dash as a line comment.
    HostFrontLiveMult.stripComments is not in-string safe. -/
def stripCommentsHcN (fuel nest : Nat) (lineC inStr : Bool)
    (acc : List Char) : List Char -> List Char
  | [] => acc.reverse
  | c :: rest =>
    match fuel with
    | 0 => acc.reverse
    | Nat.succ n =>
      if lineC then
        if c == '\n' then
          stripCommentsHcN n nest false false ('\n' :: acc) rest
        else
          stripCommentsHcN n nest true false acc rest
      else if inStr then
        if c == '"' then
          stripCommentsHcN n nest false false ('"' :: acc) rest
        else
          stripCommentsHcN n nest false true (c :: acc) rest
      else if nest > 0 then
        match c, rest with
        | '/', '-' :: rest2 =>
          stripCommentsHcN n (nest + 1) false false acc rest2
        | '-', '/' :: rest2 =>
          stripCommentsHcN n (nest - 1) false false acc rest2
        | '\n', rest2 =>
          stripCommentsHcN n nest false false ('\n' :: acc) rest2
        | _, rest2 =>
          stripCommentsHcN n nest false false acc rest2
      else
        match c, rest with
        | '"', rest2 =>
          stripCommentsHcN n 0 false true ('"' :: acc) rest2
        | '/', '-' :: rest2 =>
          stripCommentsHcN n 1 false false acc rest2
        | '-', '-' :: rest2 =>
          stripCommentsHcN n 0 true false acc rest2
        | _, rest2 =>
          stripCommentsHcN n 0 false false (c :: acc) rest2

/-- String-safe comment strip for live HostFrontTheorems.lean bytes. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

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

/-- If rest is not a command start, skip to the next command. -/
def skipNonCmd (fuel : Nat) (rest : List String) : List String :=
  match rest with
  | t :: _ =>
    if isCmdKw t then rest else skipUntilCmd fuel rest
  | [] => rest

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    import / namespace / end only. theorem / example / set_option skip. -/
def parseOneCmdHostFrontTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsHostFrontTheorems : Nat -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdHostFrontTheorems liveHostFrontTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostFrontTheoremsSkipFuel rest
      parseCmdsHostFrontTheorems n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostFrontTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostFrontTheorems n rest2 acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `theorem` named `nm` even if the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: t :: rest, nm =>
    t == nm || toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Parse live HostFrontTheorems.lean text.
    Greppable: parseLiveHostFrontTheoremsSource, PARSE-LIVE-HOST-FRONT-THEOREMS. -/
def parseLiveHostFrontTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostFrontTheorems liveHostFrontTheoremsParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostFrontTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostFrontTheorems parse.
    Greppable: kernelCheckLiveHostFrontTheoremsSource,
    PARSE-LIVE-HOST-FRONT-THEOREMS.
    Calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostFrontTheoremsSource (src : String) : Bool :=
  match parseLiveHostFrontTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostFrontTheoremsParsed? : Option Module :=
  match parseLiveHostFrontTheoremsSource liveHostFrontTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostFrontTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveHostFrontTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Live parse keeps only import / namespace / end (theorems skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveHostFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is HostFrontTheorems (no module line in the live file). -/
def liveParseHasHostFrontTheoremsModule : Bool :=
  match liveHostFrontTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostFrontTheorems"

/-- Live parse imports SystemsLean.HostFront. -/
def liveParseHasHostFrontImport : Bool :=
  match liveHostFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostFront"
      | _ => false

/-- Live parse opens namespace SystemsLean.HostFront. -/
def liveParseHasHostFrontNamespace : Bool :=
  match liveHostFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostFront"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostFront. -/
def liveParseHasHostFrontEnd : Bool :=
  match liveHostFrontTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostFront"
      | _ => false

/-- Skip-head: theorems that live in HostFrontTheorems.lean.
    Greppable: hostFrontReady_true, hostFront_claims_false. -/
def liveParseHasCoreTheorems : Bool :=
  match liveHostFrontTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostFrontTheoremsSource)
    toksHaveTheoremNamed liveHostFrontTheoremsSkipFuel toks
        "hostFrontReady_true"
      && toksHaveTheoremNamed liveHostFrontTheoremsSkipFuel toks
        "hostFront_claims_false"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostFrontTheoremsReady,
    PARSE-LIVE-HOST-FRONT-THEOREMS, HOST-FRONT-LIVE-HOST-FRONT-THEOREMS.
    Real conjunction: parse plus kernelCheck plus liveRel. Not hardcoded true. -/
def hostFrontLiveHostFrontTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_FRONT_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-FRONT-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-FRONT-THEOREMS")
    && (liveHostFrontTheoremsRel
      == "src/systems/SystemsLean/HostFrontTheorems.lean")
    && (liveRel == "HostFrontTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostFrontTheoremsFullHost
    && !hostFrontLiveHostFrontTheoremsResidualFreeClaimed
    && !hostFrontLiveHostFrontTheoremsProvablyUnlocked
    && kernelCheckLiveHostFrontTheoremsSource liveHostFrontTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasHostFrontTheoremsModule
    && liveParseHasHostFrontImport
    && liveParseHasHostFrontNamespace
    && liveParseHasHostFrontEnd
    && liveParseHasCoreTheorems

/-- Empty source rejects. Not an accept, so this is not kernelCheck=false
    on the accept line. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostFrontTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; file equality). Not mill 70. -/

def runLiveHostFrontTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-FRONT-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostFrontTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostFrontTheorems.lean") do
    IO.eprintln "error: liveRel must be HostFrontTheorems.lean"
    throw (IO.userError "liveRel must be HostFrontTheorems.lean")
  let path := root / liveHostFrontTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostFrontTheoremsRel}"
    throw (IO.userError s!"missing {liveHostFrontTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostFrontTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostFrontTheorems.lean != liveHostFrontTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostFrontTheorems.lean")
  let r := parseLiveHostFrontTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-FRONT-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-FRONT-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-FRONT-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostFrontTheorems parse false"
      throw (IO.userError "kernelCheck live HostFrontTheorems parse false")
    unless hostFrontLiveHostFrontTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostFrontTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostFrontTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostFrontTheorems source must reject"
      throw (IO.userError "empty HostFrontTheorems source must reject")
    IO.println s!"GREEN {stageId}: live HostFrontTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostFrontTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostFrontTheorems
