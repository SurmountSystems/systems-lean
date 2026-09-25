/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckComposeSubsetRebuildTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm.
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
  Not HostModuleCheckComposeSubsetEmitTerm.lean.
  Not a Driver file. Not a fifth-4 file. Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostModuleCheckComposeSubsetRebuildTermSource turns live
    HostModuleCheckComposeSubsetRebuildTerm.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckComposeSubsetRebuildTerm
    even without a module line.
  - liveRel is the exact basename HostModuleCheckComposeSubsetRebuildTerm.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckComposeSubsetRebuildTermSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - The embedded bytes are one part,
    liveHostModuleCheckComposeSubsetRebuildTermSource. Not split.
  - Five dotted imports, namespace SystemsLean.HostModuleCheck,
    checkDepthComposeSubsetRebuildTermSurfaceBar (String),
    checkDepthComposeSubsetRebuildTermSurfaceScope (String),
    hostModuleCheckComposeSubsetRebuildTermSurfaceDualOk (Bool),
    composeSubsetRebuildWroteExpectedTermBody (String, no escaped quote),
    the skeleton suffix String literal, and end are kept.
    composeSubsetRebuildSelfApplyOkTermBody and
    composeSubsetRebuildReadyTermBody contain escaped quotes, so the
    body is more than one token and those defs are skip-folded.
    Every other def has a binder, a match, an application, or string
    concatenation. Three theorems are skip-folded.
    Kept command count is 12. Skipped command count is 32.
    Kept plus skipped is 44. kernelFuel is 64.
    44 does not pass 64.
  - Three dash-dash spellings sit inside the header block comment.
    stripCommentsHc strips that block. It does not treat dash-dash
    inside a string as a comment.
  - Skip-head still sees def checkComposeSubsetRebuildTermDialect and
    def hostModuleCheckComposeSubsetRebuildTermSurfaceOk in the live text.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm
  PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckComposeSubsetRebuildTermSource,
  kernelCheckLiveHostModuleCheckComposeSubsetRebuildTermSource,
  hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady,
  liveHostModuleCheckComposeSubsetRebuildTermSource,
  liveRel, liveHostModuleCheckComposeSubsetRebuildTermRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckComposeSubsetRebuildTerm.lean"

/-- Live file relative to repo root. Dual-pin path.
    liveHostModuleCheckComposeSubsetRebuildTermSource is the one embedded copy
    from HostFrontLiveHostModuleCheckComposeSubsetRebuildTermSource. Not split. -/
def liveHostModuleCheckComposeSubsetRebuildTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckComposeSubsetRebuildTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckComposeSubsetRebuildTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckComposeSubsetRebuildTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 32768

/-- Kept-command count: five imports, namespace, two short String
    pins, one Bool literal, composeSubsetRebuildWroteExpectedTermBody,
    the skeleton suffix String literal, and end.
    Escaped-quote term bodies, binders, matches, applications, string
    concatenation, and three theorems are skip-folded.
    Skipped count is 32. Kept plus skipped is 44.
    kernelFuel is 64. 44 does not pass 64. -/
def liveKeptCmds : Nat := 12

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckComposeSubsetRebuildTerm has dash-dash in the header block
    comment. Short pins and composeSubsetRebuildWroteExpectedTermBody do
    not use a quote escape. Self-apply and ready term bodies do, so those
    strings are more than one token and the defs are skip-folded. -/
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

/-- String-safe comment strip for live HostModuleCheckComposeSubsetRebuildTerm.lean
    bytes. Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Dotted ident `SystemsLean . HostModuleCheckComposeSubsetRebuildTerm`. -/
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

/-- Parse live HostModuleCheckComposeSubsetRebuildTerm.lean text.
    Greppable: parseLiveHostModuleCheckComposeSubsetRebuildTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM. -/
def parseLiveHostModuleCheckComposeSubsetRebuildTermSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckComposeSubsetRebuildTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckComposeSubsetRebuildTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM. -/
def kernelCheckLiveHostModuleCheckComposeSubsetRebuildTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckComposeSubsetRebuildTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckComposeSubsetRebuildTermSource
      liveHostModuleCheckComposeSubsetRebuildTermSource with
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

/-- Wrap module lastSeg is HostModuleCheckComposeSubsetRebuildTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckComposeSubsetRebuildTerm"
      && lastSeg m.name.raw == "HostModuleCheckComposeSubsetRebuildTerm"

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
      (stripCommentsHc liveHostModuleCheckComposeSubsetRebuildTermSource)
    toksHaveDefNamed liveSkipFuel toks "checkComposeSubsetRebuildTermDialect"
      && toksHaveDefNamed liveSkipFuel toks
        "hostModuleCheckComposeSubsetRebuildTermSurfaceOk"

/-- Import SystemsLean.HostModuleCheckSurface. -/
def needleImportSurface : String :=
  "import SystemsLean.HostModuleCheckSurface\n"

/-- Import SystemsLean.HostModuleCheckEmitPlanTerm. -/
def needleImportEmitPlan : String :=
  "import SystemsLean.HostModuleCheckEmitPlanTerm\n"

/-- Import SystemsLean.HostModuleCheckRequiredDecls.
    The trailing newline keeps RequiredDeclsProduct and RequiredDeclsLater
    from counting as this needle. -/
def needleImportRequiredDecls : String :=
  "import SystemsLean.HostModuleCheckRequiredDecls\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsProduct. -/
def needleImportRequiredDeclsProduct : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsProduct\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsLater. -/
def needleImportRequiredDeclsLater : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsLater\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- First kept String literal def. -/
def needleCheckBar : String :=
  "def checkDepthComposeSubsetRebuildTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Dialect def. The body is not a kernel literal, so the def is skip-folded. -/
def needleCheckDialect : String :=
  "def checkComposeSubsetRebuildTermDialect (content : String) : Option String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs once in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckComposeSubsetRebuildTermSource
  (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleImportEmitPlan).length == 2
    && (src.splitOn needleImportRequiredDecls).length == 2
    && (src.splitOn needleImportRequiredDeclsProduct).length == 2
    && (src.splitOn needleImportRequiredDeclsLater).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleCheckBar).length == 2
    && (src.splitOn needleCheckDialect).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady,
    PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM")
    && (liveRel == "HostModuleCheckComposeSubsetRebuildTerm.lean")
    && (liveHostModuleCheckComposeSubsetRebuildTermRel ==
        "src/systems/SystemsLean/HostModuleCheckComposeSubsetRebuildTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckComposeSubsetRebuildTermFullHost
    && !hostFrontLiveHostModuleCheckComposeSubsetRebuildTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckComposeSubsetRebuildTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckComposeSubsetRebuildTermSource
        liveHostModuleCheckComposeSubsetRebuildTermSource
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
  match parseLiveHostModuleCheckComposeSubsetRebuildTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckComposeSubsetRebuildTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckComposeSubsetRebuildTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckComposeSubsetRebuildTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckComposeSubsetRebuildTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckComposeSubsetRebuildTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckComposeSubsetRebuildTerm.lean != liveHostModuleCheckComposeSubsetRebuildTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckComposeSubsetRebuildTerm.lean")
  let r := parseLiveHostModuleCheckComposeSubsetRebuildTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETREBUILDTERM ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckComposeSubsetRebuildTerm parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckComposeSubsetRebuildTerm parse false")
    unless hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckComposeSubsetRebuildTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckComposeSubsetRebuildTerm source was accepted"
      throw (IO.userError
        "empty HostModuleCheckComposeSubsetRebuildTerm source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckComposeSubsetRebuildTerm.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

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

end SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetRebuildTerm
