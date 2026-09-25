/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/HostGraphTheorems.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostGraphTheorems. Reuses HostFrontLiveHostTerm
  skip-until-command fold and the string-safe comment strip (dash-dash inside
  a string stays; a block comment does not treat dash-dash as a line comment).
  Not HostFront G1. Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on HostGraphTheorems text.
  Not HostGraph.lean. Not HostGraphMain.lean.
  Not HostFrontLiveHostGraphMainMain.lean.
  Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostGraphTheoremsSource turns live HostGraphTheorems.lean text
    into HostTerm.Module.
  - One embedded copy: liveHostGraphTheoremsSource. Not split. Not in this file.
  - Module name is SystemsLean.HostGraphTheorems even without a module line.
  - kernelCheckLiveHostGraphTheoremsSource is HostKernel.kernelCheck of that
    parse (not a constant true).
  - Skip theorem, example, and set_option until the next command.
  - Keep import, namespace, and end. This peel has no kernelable def.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not occupancy name 50. Not mill 70.
  - Not freestanding residual free. Not PROVABLY. Not Lake-gone.
  - slakeOwnsPackageTypecheck stays false. Host tools stay 69 of 69.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOST-GRAPH-THEOREMS,
  SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_THEOREMS_V0,
  PARSE-LIVE-HOST-GRAPH-THEOREMS, parseLiveHostGraphTheoremsSource,
  kernelCheckLiveHostGraphTheoremsSource,
  hostFrontLiveHostGraphTheoremsReady, liveHostGraphTheoremsSource, liveRel,
  liveHostGraphTheoremsRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostGraphTheorems
  Red/green: lean --run SlakeTypecheckHostGraphTheorems (no mill; no lake).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostGraphTheoremsSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostGraphTheorems

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_THEOREMS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOST-GRAPH-THEOREMS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOST-GRAPH-THEOREMS"

/-- Live basename. Greppable: liveRel. Must be HostGraphTheorems.lean. -/
def liveRel : String := "HostGraphTheorems.lean"

/-- Live file relative to repo root.
    Disk reads stay on this path. liveRel stays the bare basename. -/
def liveHostGraphTheoremsRel : String :=
  "src/systems/SystemsLean/HostGraphTheorems.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostGraphTheoremsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostGraphTheoremsResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostGraphTheoremsProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveHostGraphTheoremsParseFuel : Nat := 256

/-- Skip fuel for theorem / example / set_option tails. -/
def liveHostGraphTheoremsSkipFuel : Nat := 8192

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

/-- String-safe comment strip for live HostGraphTheorems.lean bytes. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostGraph`. -/
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
def parseOneCmdHostGraphTheorems (fuel : Nat) (toks : List String) :
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
def parseCmdsHostGraphTheorems : Nat -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdHostGraphTheorems liveHostGraphTheoremsParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveHostGraphTheoremsSkipFuel rest
      parseCmdsHostGraphTheorems n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveHostGraphTheoremsSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsHostGraphTheorems n rest2 acc
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

/-- Parse live HostGraphTheorems.lean text.
    Greppable: parseLiveHostGraphTheoremsSource, PARSE-LIVE-HOST-GRAPH-THEOREMS. -/
def parseLiveHostGraphTheoremsSource (src : String) : FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsHostGraphTheorems liveHostGraphTheoremsParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostGraphTheorems"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostGraphTheorems parse.
    Greppable: kernelCheckLiveHostGraphTheoremsSource,
    PARSE-LIVE-HOST-GRAPH-THEOREMS.
    Calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostGraphTheoremsSource (src : String) : Bool :=
  match parseLiveHostGraphTheoremsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveHostGraphTheoremsParsed? : Option Module :=
  match parseLiveHostGraphTheoremsSource liveHostGraphTheoremsSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveHostGraphTheoremsParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (import / namespace / end after theorem skip).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveHostGraphTheoremsParsed? with
  | some m => m.commands.length >= 3
  | none => false

/-- Live parse keeps only import / namespace / end (theorems skipped). -/
def liveParseOnlyImportNsEnd : Bool :=
  match liveHostGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | _ => false

/-- Wrap module lastSeg is HostGraphTheorems (no module line in the live file). -/
def liveParseHasHostGraphTheoremsModule : Bool :=
  match liveHostGraphTheoremsParsed? with
  | none => false
  | some m => lastSeg m.name.raw == "HostGraphTheorems"

/-- Live parse imports SystemsLean.HostGraph. -/
def liveParseHasHostGraphImport : Bool :=
  match liveHostGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostGraph"
      | _ => false

/-- Live parse opens namespace SystemsLean.HostGraph. -/
def liveParseHasHostGraphNamespace : Bool :=
  match liveHostGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostGraph"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostGraph. -/
def liveParseHasHostGraphEnd : Bool :=
  match liveHostGraphTheoremsParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostGraph"
      | _ => false

/-- Skip-head: theorems that live in HostGraphTheorems.lean.
    Greppable: hostGraphReady_true, hostGraph_claims_false. -/
def liveParseHasCoreTheorems : Bool :=
  match liveHostGraphTheoremsParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm (stripCommentsHc liveHostGraphTheoremsSource)
    toksHaveTheoremNamed liveHostGraphTheoremsSkipFuel toks
        "hostGraphReady_true"
      && toksHaveTheoremNamed liveHostGraphTheoremsSkipFuel toks
        "hostGraph_claims_false"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostGraphTheoremsReady,
    PARSE-LIVE-HOST-GRAPH-THEOREMS, HOST-FRONT-LIVE-HOST-GRAPH-THEOREMS.
    Real conjunction: parse plus kernelCheck plus liveRel. Not hardcoded true. -/
def hostFrontLiveHostGraphTheoremsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOST_GRAPH_THEOREMS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOST-GRAPH-THEOREMS")
    && (parseId == "PARSE-LIVE-HOST-GRAPH-THEOREMS")
    && (liveHostGraphTheoremsRel
      == "src/systems/SystemsLean/HostGraphTheorems.lean")
    && (liveRel == "HostGraphTheorems.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostGraphTheoremsFullHost
    && !hostFrontLiveHostGraphTheoremsResidualFreeClaimed
    && !hostFrontLiveHostGraphTheoremsProvablyUnlocked
    && kernelCheckLiveHostGraphTheoremsSource liveHostGraphTheoremsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseOnlyImportNsEnd
    && liveParseHasHostGraphTheoremsModule
    && liveParseHasHostGraphImport
    && liveParseHasHostGraphNamespace
    && liveParseHasHostGraphEnd
    && liveParseHasCoreTheorems

/-- Empty source rejects. Not an accept, so this is not kernelCheck=false
    on the accept line. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostGraphTheoremsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; file equality). Not mill 70. -/

def runLiveHostGraphTheorems (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOST-GRAPH-THEOREMS =="
  IO.println s!"  host={hostId} file={liveHostGraphTheoremsRel}"
  IO.println s!"liveRel={liveRel}"
  unless (liveRel == "HostGraphTheorems.lean") do
    IO.eprintln "error: liveRel must be HostGraphTheorems.lean"
    throw (IO.userError "liveRel must be HostGraphTheorems.lean")
  let path := root / liveHostGraphTheoremsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostGraphTheoremsRel}"
    throw (IO.userError s!"missing {liveHostGraphTheoremsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostGraphTheoremsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostGraphTheorems.lean != liveHostGraphTheoremsSource"
    throw (IO.userError "dual-pin mismatch live HostGraphTheorems.lean")
  let r := parseLiveHostGraphTheoremsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOST-GRAPH-THEOREMS reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOST-GRAPH-THEOREMS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOST-GRAPH-THEOREMS ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostGraphTheorems parse false"
      throw (IO.userError "kernelCheck live HostGraphTheorems parse false")
    unless hostFrontLiveHostGraphTheoremsReady do
      IO.eprintln "error: hostFrontLiveHostGraphTheoremsReady false"
      throw (IO.userError "hostFrontLiveHostGraphTheoremsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostGraphTheorems source must reject"
      throw (IO.userError "empty HostGraphTheorems source must reject")
    IO.println s!"GREEN {stageId}: live HostGraphTheorems.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostGraphTheorems root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostGraphTheorems
