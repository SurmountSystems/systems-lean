/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckFixtureTexts.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckFixtureTexts.
  Reuses HostFrontLiveHostTerm skip-un-kernelable fold and the
  string-safe comment fold HostFrontLiveHostCheck.stripCommentsHc.
  Not HostFrontLiveMult.stripComments, which treats dash-dash as a
  comment even inside a string. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not HostModuleCheckCheckers.lean.
  Not HostKernel.lean.
  Not HostModuleCheckDriver.lean.
  Not an ElabMeet file.

  Spec (readable):
  - parseLiveHostModuleCheckFixtureTextsSource turns live
    HostModuleCheckFixtureTexts.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckFixtureTexts
    even without a module line.
  - liveRel is the exact basename HostModuleCheckFixtureTexts.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckFixtureTextsSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - The embedded bytes are one part,
    liveHostModuleCheckFixtureTextsSource. Not split.
  - Real commands in this file: zero imports, namespace
    SystemsLean.HostModuleCheck, thirty-two defs, zero theorems, and end.
    That is 34.
  - Kept: the namespace, one literal def, and end.
    Kept count is 3.
    The literal def is hostModuleCheckFixtureTextsEmitModuleCite.
  - Skipped: thirty-one defs whose bodies are string concatenations,
    not one literal. Skipped count is 31.
    Kept plus skipped is 34.
    kernelFuel is 64. 34 does not pass 64. Fuel is not raised.
  - The longest quoted span in this file is 340 characters
    (hostModuleCheckGoodHostComposeText addHostEdge line, up to the first
    quote). That is over 256 and under 1024. liveStringFuel is 1024 so
    takeStringN does not use the 256 take from
    HostFrontLiveHostTerm.liveHostTermParseFuel.
  - Fixture strings use backslash-quote. takeStringN stops at the first
    quote character. The words def and theorem stay in the opening quote
    span, so those fixture lines are not extra command keywords.
    The text between a backslash-quote pair is a grade id, not a command
    keyword.
  - Dash-dash spellings sit inside the header block comment and doc
    comments. stripCommentsHc strips the block. Doc comments are
    slash-dash blocks.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file. Not a speed claim.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckFixtureTexts
  PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS
  HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURETEXTS
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKFIXTURETEXTS_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckFixtureTextsSource,
  kernelCheckLiveHostModuleCheckFixtureTextsSource,
  hostFrontLiveHostModuleCheckFixtureTextsReady,
  liveHostModuleCheckFixtureTextsSource,
  liveRel, liveHostModuleCheckFixtureTextsRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckFixtureTextsSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostFrontLiveTypes

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKFIXTURETEXTS_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURETEXTS"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckFixtureTexts.lean"

/-- Live file relative to repo root. Dual-pin path.
    liveHostModuleCheckFixtureTextsSource is the one embedded copy
    from HostFrontLiveHostModuleCheckFixtureTextsSource. Not split. -/
def liveHostModuleCheckFixtureTextsRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckFixtureTextsFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckFixtureTextsResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckFixtureTextsProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 32768

/-- String take fuel. The longest quoted span in this file is 340 characters.
    liveStringFuel stays 1024 so a quote is not cut at liveHostTermParseFuel 256. -/
def liveStringFuel : Nat := 1024

/-- Real command count: zero imports, namespace, thirty-two defs, and end. -/
def liveRealCmds : Nat := 34

/-- Kept-command count: namespace, one literal def, and end.
    Thirty-one concatenation defs are skip-folded.
    Skipped count is 31. Kept plus skipped is 34.
    kernelFuel is 64. 34 does not pass 64. -/
def liveKeptCmds : Nat := 3

/-- Skipped command count. -/
def liveSkippedCmds : Nat := 31

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckFixtureTexts has dash-dash in the header block comment. -/
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

/-- String-safe comment strip for live HostModuleCheckFixtureTexts.lean
    bytes. Same fold as HostFrontLiveHostCheck.stripCommentsHc. -/
def stripCommentsHc (src : String) : String :=
  String.ofList (stripCommentsHcN (src.length + 8) 0 false false [] src.toList)

/-- Tokenize stripped source. Same tokens as tokenizeHostTerm, except
    string and ident takes use liveStringFuel 1024. -/
def tokenizeLiveN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeLiveN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveStringFuel [c] rest
      tokenizeLiveN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN liveStringFuel [c] rest with
      | none => tokenizeLiveN n rest acc
      | some (rev, rest2) =>
        tokenizeLiveN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeLiveN n rest2 (":=" :: acc)
      | _ => tokenizeLiveN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeLiveN n rest2 ("=>" :: acc)
      | '=' :: rest2 => tokenizeLiveN n rest2 ("==" :: acc)
      | _ => tokenizeLiveN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeLiveN n rest2 ("->" :: acc)
      | _ => tokenizeLiveN n rest ("-" :: acc)
    else if c == '&' then
      match rest with
      | '&' :: rest2 => tokenizeLiveN n rest2 ("&&" :: acc)
      | _ => tokenizeLiveN n rest acc
    else if c == '!' then
      tokenizeLiveN n rest ("!" :: acc)
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' || c == '[' || c == ']' then
      tokenizeLiveN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveStringFuel [c] rest
      tokenizeLiveN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeLiveN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeLive (src : String) : List String :=
  tokenizeLiveN (src.length + 8) src.toList []

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

/-- Count command-start keywords. Strings keep `def` inside the quotes. -/
def countCmdKw : Nat -> List String -> Nat -> Nat
  | 0, _, acc => acc
  | _, [], acc => acc
  | Nat.succ n, t :: rest, acc =>
    countCmdKw n rest (if isCmdKw t then acc + 1 else acc)

/-- Parse live HostModuleCheckFixtureTexts.lean text.
    Greppable: parseLiveHostModuleCheckFixtureTextsSource,
    PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS. -/
def parseLiveHostModuleCheckFixtureTextsSource (src : String) : FrontResult :=
  let toks := tokenizeLive (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmds liveParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckFixtureTexts"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckFixtureTextsSource,
    PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS. -/
def kernelCheckLiveHostModuleCheckFixtureTextsSource (src : String) : Bool :=
  match parseLiveHostModuleCheckFixtureTextsSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckFixtureTextsSource
      liveHostModuleCheckFixtureTextsSource with
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

/-- Kept def names, in order. -/
def cmdDefNames : List Cmd -> List String
  | [] => []
  | Cmd.def_ x _ _ :: rest => x.raw :: cmdDefNames rest
  | _ :: rest => cmdDefNames rest

/-- Zero imports. Not a missing import list. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m => importNames m.commands == []

/-- One literal def kept. Concatenation defs are not in this list. -/
def liveParseDefsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    cmdDefNames m.commands == [
      "hostModuleCheckFixtureTextsEmitModuleCite"
    ]

/-- Live parse command count is liveKeptCmds and does not pass kernelFuel. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Command-keyword count on the live tokens is the real command count. -/
def liveCmdKwCount : Nat :=
  countCmdKw liveSkipFuel
    (tokenizeLive (stripCommentsHc liveHostModuleCheckFixtureTextsSource)) 0

/-- Real count, kept count, and skipped count. Sum does not pass 64. -/
def liveCmdBudgetOk : Bool :=
  liveCmdKwCount == liveRealCmds
    && liveKeptCmds + liveSkippedCmds == liveRealCmds
    && liveRealCmds <= 64
    && liveKeptCmds <= 64

/-- Wrap module lastSeg is HostModuleCheckFixtureTexts
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckFixtureTexts"
      && lastSeg m.name.raw == "HostModuleCheckFixtureTexts"

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

/-- Skip-head: every def in the live text, kept or skipped. -/
def liveParseHasCoreDefs : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeLive
      (stripCommentsHc liveHostModuleCheckFixtureTextsSource)
    toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodMultText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodMultTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodLinearText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodLinearTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodTypesText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodTypesTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodIrProgramText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodIrProgramTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodIrGraphText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodIrGraphTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodHostComposeText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodHostComposeTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodErasureText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodErasureTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodExtractText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodExtractTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodCompilePathText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelMultText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelLinearText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelTypesText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelProgramText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelMultTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelLinearTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelTypesTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodKernelProgramTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodJoinMapText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodJoinMapTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodSelfHostText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodSelfHostTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodSurfaceMatrixText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckGoodSurfaceMatrixTheoremsText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckFixtureTextsEmitModuleCite"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- First concatenation def, skip-folded. -/
def needleMult : String :=
  "def hostModuleCheckGoodMultText : String :=\n"

/-- Kept string literal def. -/
def needleCite : String :=
  "def hostModuleCheckFixtureTextsEmitModuleCite : String :=\n"

/-- Kept literal body. -/
def needleCiteBody : String :=
  "  \"SystemsLean.HostModuleCheckFixtureTextsEmit\"\n"

/-- Last concatenation def, skip-folded. -/
def needleSurface : String :=
  "def hostModuleCheckGoodSurfaceMatrixTheoremsText : String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs once in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckFixtureTextsSource
  (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleMult).length == 2
    && (src.splitOn needleCite).length == 2
    && (src.splitOn needleCiteBody).length == 2
    && (src.splitOn needleSurface).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckFixtureTextsReady,
    PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS,
    HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURETEXTS.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckFixtureTextsReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKFIXTURETEXTS_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURETEXTS")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS")
    && (liveRel == "HostModuleCheckFixtureTexts.lean")
    && (liveHostModuleCheckFixtureTextsRel ==
        "src/systems/SystemsLean/HostModuleCheckFixtureTexts.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckFixtureTextsFullHost
    && !hostFrontLiveHostModuleCheckFixtureTextsResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckFixtureTextsProvablyUnlocked
    && kernelCheckLiveHostModuleCheckFixtureTextsSource
        liveHostModuleCheckFixtureTextsSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveCmdBudgetOk
    && liveParseImportsOk
    && liveParseDefsOk
    && liveParseHasModule
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasCoreDefs
    && liveNeedlesOk

/-- Empty source rejects. An empty command list is not an accept.
    This helper is not the kernelCheck reject path. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckFixtureTextsSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixtureTextsRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckFixtureTextsRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckFixtureTextsRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckFixtureTextsRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckFixtureTextsSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckFixtureTexts.lean != liveHostModuleCheckFixtureTextsSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckFixtureTexts.lean")
  let r := parseLiveHostModuleCheckFixtureTextsSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKFIXTURETEXTS ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k} real={liveCmdKwCount} kept={liveKeptCmds} skipped={liveSkippedCmds}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} budget={liveCmdBudgetOk} imports={liveParseImportsOk} defs={liveParseDefsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckFixtureTexts parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckFixtureTexts parse false")
    unless hostFrontLiveHostModuleCheckFixtureTextsReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckFixtureTextsReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckFixtureTextsReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckFixtureTexts source was accepted"
      throw (IO.userError
        "empty HostModuleCheckFixtureTexts source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckFixtureTexts.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

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

end SystemsLean.HostFrontLiveHostModuleCheckFixtureTexts
