/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckFixtures.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveFixtures. Reuses HostFrontLiveHostTerm
  skip-un-kernelable fold plus HostFrontLiveGoldens string-concat.
  Not HostFront G1. Not HostTerm.multFixtureModule.

  Spec (readable):
  - parseLiveFixturesSource turns live HostModuleCheckFixtures.lean text into
    HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckFixtures even without a module
    line.
  - kernelCheckLiveFixturesSource is HostKernel.kernelCheck of that parse
    (String lit defs + import / namespace / end).
  - Skip the un-kernelable Bool corpus def; keep bad fixture String defs.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Not mill 70.
  - Not FullHost. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-FIXTURES,
  SLAKE_HOST_FRONT_LIVE_FIXTURES_V0, PARSE-LIVE-FIXTURES,
  parseLiveFixturesSource, kernelCheckLiveFixturesSource,
  hostFrontLiveFixturesReady, liveFixturesSource, liveFixturesRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveFixtures
  Red/green: just systems-host dest rows when dests can land;
  lake build SystemsLean.HostFrontLiveFixtures on surmount-1 (queued).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveFixturesSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveFixtures

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_FIXTURES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-FIXTURES"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-FIXTURES"

/-- Live file relative to repo root. Dual-pin path. -/
def liveFixturesRel : String :=
  "src/systems/SystemsLean/HostModuleCheckFixtures.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveFixturesFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveFixturesResidualFreeClaimed : Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveFixturesProvablyUnlocked : Bool := false

/-- Parse fuel (command fold). -/
def liveFixturesParseFuel : Nat := 512

/-- Skip fuel for un-kernelable Bool corpus def. -/
def liveFixturesSkipFuel : Nat := 8192

/-- Take a string literal including quotes. `\"` does not close the token. -/
def takeStringFixturesN : Nat -> List Char -> List Char ->
    Option (Prod (List Char) (List Char))
  | 0, _, _ => none
  | Nat.succ _, _, [] => none
  | Nat.succ n, acc, c :: rest =>
    if c == '\\' then
      match rest with
      | [] => none
      | d :: rest2 => takeStringFixturesN n (d :: '\\' :: acc) rest2
    else if c == '"' then
      some ('"' :: acc, rest)
    else
      takeStringFixturesN n (c :: acc) rest

/-- Tokenize stripped source; keeps `++` and escaped string lits. -/
def tokenizeFixturesN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeFixturesN n rest acc
    else if c == '"' then
      match takeStringFixturesN liveFixturesParseFuel [c] rest with
      | none => tokenizeFixturesN n rest acc
      | some (rev, rest2) =>
        tokenizeFixturesN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeFixturesN n rest2 (":=" :: acc)
      | _ => tokenizeFixturesN n rest (":" :: acc)
    else if c == '+' then
      match rest with
      | '+' :: rest2 => tokenizeFixturesN n rest2 ("++" :: acc)
      | _ => tokenizeFixturesN n rest acc
    else if c == '.' then
      tokenizeFixturesN n rest ("." :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveFixturesParseFuel [c] rest
      tokenizeFixturesN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeFixturesN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeFixtures (src : String) : List String :=
  tokenizeFixturesN (src.length + 8) src.toList []

/-- Dotted ident `SystemsLean . HostModuleCheck`. -/
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

/-- Fold `"a" ++ "b"` string lits into one payload. -/
def parseStringConcat : Nat -> List String -> Option (Prod String (List String))
  | 0, _ => none
  | Nat.succ _, [] => none
  | Nat.succ n, t :: rest =>
    if !isStringLit t then none
    else
      let s := stripStringLit t
      match rest with
      | "++" :: rest2 =>
        match parseStringConcat n rest2 with
        | some (s2, rest3) => some (s ++ s2, rest3)
        | none => none
      | _ => some (s, rest)

/-- Parse `def` body after the name (typed String assign). -/
def parseDefFixtures (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersN fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match kind with
        | DefBodyKind.equation => none
        | DefBodyKind.assign =>
          match parseHostTypeAll tyToks with
          | none => none
          | some retTy =>
            match parseStringConcat liveFixturesParseFuel bodyToks with
            | none => none
            | some (s, rest4) =>
              let ty := addBinderArrows bs retTy
              some (Cmd.def_ (HostTerm.n dname) (some ty) (Term.litString s),
                rest4)
    | _ => none

/-- Parse one command (import / namespace / end / String def).
    none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmdFixtures (fuel : Nat) (toks : List String) :
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
  | "def" :: name :: rest =>
    if liveIsIdent name then parseDefFixtures fuel name rest
    else none
  | _ => none

/-- Fold commands. Skip un-kernelable Bool corpus def. -/
def parseCmdsFixtures : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdFixtures liveFixturesParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveFixturesSkipFuel rest
      parseCmdsFixtures n rest2 (acc ++ [c])
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveFixturesSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFixtures n rest2 acc
          else none
        else none
      | [] => some acc

/-- Parse live HostModuleCheckFixtures.lean text.
    Greppable: parseLiveFixturesSource, PARSE-LIVE-FIXTURES. -/
def parseLiveFixturesSource (src : String) : FrontResult :=
  let toks := tokenizeFixtures (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFixtures liveFixturesParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckFixtures"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live HostModuleCheckFixtures parse (Goldens path).
    Greppable: kernelCheckLiveFixturesSource, PARSE-LIVE-FIXTURES. -/
def kernelCheckLiveFixturesSource (src : String) : Bool :=
  match parseLiveFixturesSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveFixturesParsed? : Option Module :=
  match parseLiveFixturesSource liveFixturesSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveFixturesParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (imports / namespace / String defs / end).
    Real lower bound, not hardcoded true. -/
def liveParseCmdCountOk : Bool :=
  match liveFixturesParsed? with
  | some m => m.commands.length >= 15
  | none => false

/-- Live parse imports SystemsLean.HostModuleCheckRequiredDecls. -/
def liveParseHasRequiredDeclsImport : Bool :=
  match liveFixturesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => lastSeg x.raw == "HostModuleCheckRequiredDecls"
      | _ => false

/-- Live parse has the HostModuleCheck namespace command. -/
def liveParseHasHostModuleCheckNs : Bool :=
  match liveFixturesParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => lastSeg x.raw == "HostModuleCheck"
      | _ => false

/-- Live parse has core bad-fixture String defs. -/
def liveParseHasCoreDefs : Bool :=
  match liveFixturesParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "hostModuleCheckBadMissingInductiveText"
      && has "hostModuleCheckBadMissingAxiomText"
      && has "hostModuleCheckBadMissingStructureText"

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveFixturesReady, PARSE-LIVE-FIXTURES,
    HOST-FRONT-LIVE-FIXTURES.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveFixturesReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_FIXTURES_V0")
    && (hostId == "HOST-FRONT-LIVE-FIXTURES")
    && (parseId == "PARSE-LIVE-FIXTURES")
    && (liveFixturesRel
      == "src/systems/SystemsLean/HostModuleCheckFixtures.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveFixturesFullHost
    && !hostFrontLiveFixturesResidualFreeClaimed
    && !hostFrontLiveFixturesProvablyUnlocked
    && kernelCheckLiveFixturesSource liveFixturesSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasRequiredDeclsImport
    && liveParseHasHostModuleCheckNs
    && liveParseHasCoreDefs

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveFixturesSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveFixtures (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-FIXTURES =="
  IO.println s!"  host={hostId} file={liveFixturesRel}"
  let path := root / liveFixturesRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveFixturesRel}"
    throw (IO.userError s!"missing {liveFixturesRel}")
  let disk <- IO.FS.readFile path
  if disk != liveFixturesSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckFixtures.lean != liveFixturesSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckFixtures.lean")
  let r := parseLiveFixturesSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-FIXTURES reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-FIXTURES reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-FIXTURES ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckFixtures parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckFixtures parse false")
    unless hostFrontLiveFixturesReady do
      IO.eprintln "error: hostFrontLiveFixturesReady false"
      throw (IO.userError "hostFrontLiveFixturesReady false")
    IO.println s!"GREEN {stageId}: live HostModuleCheckFixtures.lean parse kernelCheck; not mill 70"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveFixtures root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveFixtures
