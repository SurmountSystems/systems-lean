/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckErasureSubsetEmitTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckErasureSubsetEmitTerm.
  Reuses HostFrontLiveHostTerm skip-un-kernelable fold and the
  string-safe comment fold HostFrontLiveHostCheck.stripCommentsHc.
  Not HostFrontLiveMult.stripComments, which treats dash-dash as a
  comment even inside a string. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not HostModuleCheckCheckersLater.lean.
  Not HostKernel.lean.
  Not HostModuleCheckCompilePathApplyTerm.lean.
  Not HostModuleCheckCompilePathBodyTerm.lean.
  Not HostModuleCheckCompilePathComposeTerm.lean.
  Not HostModuleCheckCompilePathErasureTerm.lean.
  Not HostModuleCheckCompilePathExtractTerm.lean.
  Not HostModuleCheckCompilePathGraphTerm.lean.
  Not HostModuleCheckCompilePathLinearTerm.lean.
  Not HostModuleCheckCompilePathMultTerm.lean.
  Not HostModuleCheckCompilePathPlanTerm.lean.
  Not HostModuleCheckCompilePathProgramTerm.lean.
  Not HostModuleCheckCompilePathTerm.lean.
  Not a fifth-4 file. Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostModuleCheckErasureSubsetEmitTermSource turns live
    HostModuleCheckErasureSubsetEmitTerm.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckErasureSubsetEmitTerm
    even without a module line.
  - liveRel is the exact basename HostModuleCheckErasureSubsetEmitTerm.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckErasureSubsetEmitTermSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - The embedded bytes are one part,
    liveHostModuleCheckErasureSubsetEmitTermSource. Not split.
  - Five dotted imports, namespace SystemsLean.HostModuleCheck,
    three literal defs (two String, one Bool), the skeleton suffix
    String literal, and end are kept. Every other def has a binder
    or a body that is not one literal followed by a command, so it
    is skip-folded. Three theorems are skip-folded. Kept command count
    is 11. Skipped command count is 30. Kept plus skipped is 41.
    kernelFuel is 64. 11 does not pass 64.
  - Two dash-dash lines sit inside the header block comment.
    stripCommentsHc strips that block. It does not treat dash-dash
    inside a string as a comment.
  - Some string payloads contain a backslash before a quote.
    stripCommentsHc does not treat that as an escaped quote. The text
    that then sits outside the string state has no dash-dash and no
    block comment, so the strip does not delete a live token.
  - Skip-head still sees def checkErasureSubsetEmitTermDialect and
    def hostModuleCheckErasureSubsetEmitTermSurfaceOk in the live text.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckErasureSubsetEmitTerm
  PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM
  HOST-FRONT-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKERASURESUBSETEMITTERM_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckErasureSubsetEmitTermSource,
  kernelCheckLiveHostModuleCheckErasureSubsetEmitTermSource,
  hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady,
  liveHostModuleCheckErasureSubsetEmitTermSource,
  liveRel, liveHostModuleCheckErasureSubsetEmitTermRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKERASURESUBSETEMITTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckErasureSubsetEmitTerm.lean"

/-- Live file relative to repo root. Dual-pin path.
    liveHostModuleCheckErasureSubsetEmitTermSource is the one embedded copy
    from HostFrontLiveHostModuleCheckErasureSubsetEmitTermSource. Not split. -/
def liveHostModuleCheckErasureSubsetEmitTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckErasureSubsetEmitTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckErasureSubsetEmitTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckErasureSubsetEmitTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 32768

/-- Kept-command count: five imports, namespace, two String literals,
    one Bool literal, the skeleton suffix String literal, and end.
    Other defs are skip-folded. Three theorems are skip-folded.
    Skipped count is 30. Kept plus skipped is 41. kernelFuel is 64.
    11 does not pass 64. -/
def liveKeptCmds : Nat := 11

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckErasureSubsetEmitTerm has dash-dash in the header block
    comment. Some payloads also use a backslash before a quote.
    This fold does not treat that as an escaped quote. The text that
    then sits outside the string state has no dash-dash and no block
    comment, so the strip does not delete a live token. -/
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

/-- String-safe comment strip for live HostModuleCheckErasureSubsetEmitTerm.lean
    bytes. Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostModuleCheckErasureSubsetEmitTerm`. -/
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

/-- One String, Bool, or Nat literal, and the next token is a command.
    A longer body is not kept. Returning none lets the caller skipUntilCmd
    so a later `end` is not swallowed as an application argument. -/
def parseDefLiteral (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    if !bs.isEmpty then none
    else
      match rest2 with
      | ":" :: rest3 =>
        match splitDefBody rest3 with
        | none => none
        | some (kind, (tyToks, bodyToks)) =>
          match kind with
          | DefBodyKind.equation => none
          | DefBodyKind.assign =>
            match bodyToks with
            | t :: rest4 =>
              let stopped :=
                match rest4 with
                | [] => true
                | u :: _ => isCmdKw u
              if !stopped then none
              else
                match parseHostTypeAllHt tyToks with
                | none => none
                | some ty =>
                  let dn := HostTerm.n dname
                  match ty, t with
                  | HostType.string, _ =>
                    if isStringLit t then
                      some (Cmd.def_ dn (some ty)
                        (Term.litString (stripStringLit t)), rest4)
                    else none
                  | HostType.bool, "true" =>
                    some (Cmd.def_ dn (some ty) (Term.litBool true), rest4)
                  | HostType.bool, "false" =>
                    some (Cmd.def_ dn (some ty) (Term.litBool false), rest4)
                  | HostType.nat, _ =>
                    if isNatLit t then
                      match ofNatLit? t with
                      | some k =>
                        some (Cmd.def_ dn (some ty) (Term.litNat k), rest4)
                      | none => none
                    else none
                  | _, _ => none
            | [] => none
      | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd). -/
def parseOneCmd (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLiteral fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip theorem / example / set_option / open / private /
    un-kernelable defs. private is not isCmdKw. -/
def parseCmds : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmd liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      parseCmds n rest2 (acc ++ [c])
    | none =>
      match toks with
      | "private" :: rest =>
        parseCmds n rest acc
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSkipFuel rest
          if rest2.length < toks.length then
            parseCmds n rest2 acc
          else none
        else none
      | [] => some acc

/-- Token walk: live text has `def` named `nm` even if the body was skipped. -/
def toksHaveDefNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "def" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveDefNamed n rest2 nm
    | none => toksHaveDefNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveDefNamed n rest nm

/-- Parse live HostModuleCheckErasureSubsetEmitTerm.lean text.
    Greppable: parseLiveHostModuleCheckErasureSubsetEmitTermSource,
    PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM. -/
def parseLiveHostModuleCheckErasureSubsetEmitTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmds liveParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckErasureSubsetEmitTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckErasureSubsetEmitTermSource,
    PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM. -/
def kernelCheckLiveHostModuleCheckErasureSubsetEmitTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckErasureSubsetEmitTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckErasureSubsetEmitTermSource
      liveHostModuleCheckErasureSubsetEmitTermSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Import command names, in order. -/
def importNames : List Cmd -> List String
  | [] => []
  | Cmd.importModule x :: rest => x.raw :: importNames rest
  | _ :: rest => importNames rest

/-- Five imports. Not zero. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckSurface",
      "SystemsLean.HostModuleCheckEmitPlanTerm",
      "SystemsLean.HostModuleCheckRequiredDecls",
      "SystemsLean.HostModuleCheckRequiredDeclsProduct",
      "SystemsLean.HostModuleCheckRequiredDeclsLater"
    ]

/-- Live parse command count is liveKeptCmds and does not pass kernelFuel. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Wrap module lastSeg is HostModuleCheckErasureSubsetEmitTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckErasureSubsetEmitTerm"
      && lastSeg m.name.raw == "HostModuleCheckErasureSubsetEmitTerm"

/-- Live parse has namespace SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Live parse ends namespace SystemsLean.HostModuleCheck. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Skip-head: the dialect def and the surface-ok def are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripCommentsHc liveHostModuleCheckErasureSubsetEmitTermSource)
    toksHaveDefNamed liveSkipFuel toks "checkErasureSubsetEmitTermDialect"
      && toksHaveDefNamed liveSkipFuel toks
        "hostModuleCheckErasureSubsetEmitTermSurfaceOk"

/-- Import SystemsLean.HostModuleCheckSurface. -/
def needleImportSurface : String :=
  "import SystemsLean.HostModuleCheckSurface\n"

/-- Import SystemsLean.HostModuleCheckEmitPlanTerm.
    The trailing newline keeps a longer import from counting as this needle. -/
def needleImportEmitPlan : String :=
  "import SystemsLean.HostModuleCheckEmitPlanTerm\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- First kept String literal def. -/
def needleCheckBar : String :=
  "def checkDepthErasureSubsetEmitTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Dialect def. The body is not a kernel literal, so the def is skip-folded. -/
def needleCheckDialect : String :=
  "def checkErasureSubsetEmitTermDialect (content : String) : Option String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs once in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckErasureSubsetEmitTermSource
  (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleImportEmitPlan).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleCheckBar).length == 2
    && (src.splitOn needleCheckDialect).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady,
    PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKERASURESUBSETEMITTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM")
    && (liveRel == "HostModuleCheckErasureSubsetEmitTerm.lean")
    && (liveHostModuleCheckErasureSubsetEmitTermRel ==
        "src/systems/SystemsLean/HostModuleCheckErasureSubsetEmitTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckErasureSubsetEmitTermFullHost
    && !hostFrontLiveHostModuleCheckErasureSubsetEmitTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckErasureSubsetEmitTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckErasureSubsetEmitTermSource
        liveHostModuleCheckErasureSubsetEmitTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasModule
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. An empty command list is not an accept. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckErasureSubsetEmitTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckErasureSubsetEmitTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckErasureSubsetEmitTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckErasureSubsetEmitTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckErasureSubsetEmitTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckErasureSubsetEmitTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckErasureSubsetEmitTerm.lean != liveHostModuleCheckErasureSubsetEmitTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckErasureSubsetEmitTerm.lean")
  let r := parseLiveHostModuleCheckErasureSubsetEmitTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckErasureSubsetEmitTerm parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckErasureSubsetEmitTerm parse false")
    unless hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckErasureSubsetEmitTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckErasureSubsetEmitTerm source was accepted"
      throw (IO.userError
        "empty HostModuleCheckErasureSubsetEmitTerm source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckErasureSubsetEmitTerm.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm
