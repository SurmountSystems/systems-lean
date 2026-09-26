/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckFixtures.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckFixtures.
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
  - parseLiveHostModuleCheckFixturesSource turns live
    HostModuleCheckFixtures.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckFixtures
    even without a module line.
  - liveRel is the exact basename HostModuleCheckFixtures.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckFixturesSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - The embedded bytes are one part,
    liveHostModuleCheckFixturesSource. Not split.
  - Real commands in this file: eight imports, namespace
    SystemsLean.HostModuleCheck, twelve defs, and end.
    There is no theorem. That is 22.
  - Kept: eight imports, the namespace, one string literal def, and end.
    Kept count is 11.
    The literal def is hostModuleCheckBadEmptyText.
  - Skipped: eleven defs whose bodies are not one literal.
    That is hostModuleCheckTheoremCorpusOk and ten bad-text defs
    built with string concatenation. Skipped count is 11.
    Kept plus skipped is 22.
    kernelFuel is 64. 22 does not pass 64. Fuel is not raised.
  - The longest quoted span in this file is 91 characters
    (the isValidTag_fail_closed fixture line, quotes included).
    That is under 256 and under 1024. liveStringFuel is 1024 so
    takeStringN does not use the 256 take from
    HostFrontLiveHostTerm.liveHostTermParseFuel.
  - Some fixture strings use backslash-quote. takeStringN stops at the
    first quote character. The word def or theorem stays in the opening
    quote span, so those fixture lines are not extra command keywords.
  - Dash-dash spellings sit inside the header block comment and inside
    the hostModuleCheckBadEmptyText string. stripCommentsHc strips the
    block and keeps the string. Doc comments are slash-dash blocks.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file. Not a speed claim.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckFixtures
  PARSE-LIVE-HOSTMODULECHECKFIXTURES
  HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURES
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKFIXTURES_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckFixturesSource,
  kernelCheckLiveHostModuleCheckFixturesSource,
  hostFrontLiveHostModuleCheckFixturesReady,
  liveHostModuleCheckFixturesSource,
  liveRel, liveHostModuleCheckFixturesRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckFixtures
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckFixturesSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckFixtures

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostFrontLiveTypes

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKFIXTURES_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURES"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKFIXTURES"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckFixtures.lean"

/-- Live file relative to repo root. Dual-pin path.
    liveHostModuleCheckFixturesSource is the one embedded copy
    from HostFrontLiveHostModuleCheckFixturesSource. Not split. -/
def liveHostModuleCheckFixturesRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckFixturesFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckFixturesResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckFixturesProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 32768

/-- String take fuel. The longest quoted span in this file is 91 characters.
    That is under 256. liveStringFuel stays 1024 so a quote is not cut at
    liveHostTermParseFuel 256. -/
def liveStringFuel : Nat := 1024

/-- Real command count: eight imports, namespace, twelve defs, and end.
    No theorem. -/
def liveRealCmds : Nat := 22

/-- Kept-command count: eight imports, namespace, one literal def, and end.
    Eleven non-literal defs are skip-folded. No theorem.
    Skipped count is 11. Kept plus skipped is 22.
    kernelFuel is 64. 22 does not pass 64. -/
def liveKeptCmds : Nat := 11

/-- Skipped command count. -/
def liveSkippedCmds : Nat := 11

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckFixtures has dash-dash in the header block comment. -/
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

/-- String-safe comment strip for live HostModuleCheckFixtures.lean
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

/-- Token walk: live text has `theorem` named `nm` even though the proof was skipped. -/
def toksHaveTheoremNamed : Nat -> List String -> String -> Bool
  | 0, _, _ => false
  | Nat.succ _, [], _ => false
  | Nat.succ n, "theorem" :: rest, nm =>
    match parseDefHead rest with
    | some (dname, rest2) => dname == nm || toksHaveTheoremNamed n rest2 nm
    | none => toksHaveTheoremNamed n rest nm
  | Nat.succ n, _ :: rest, nm => toksHaveTheoremNamed n rest nm

/-- Count command-start keywords. Strings keep `def` inside the quotes. -/
def countCmdKw : Nat -> List String -> Nat -> Nat
  | 0, _, acc => acc
  | _, [], acc => acc
  | Nat.succ n, t :: rest, acc =>
    countCmdKw n rest (if isCmdKw t then acc + 1 else acc)

/-- Parse live HostModuleCheckFixtures.lean text.
    Greppable: parseLiveHostModuleCheckFixturesSource,
    PARSE-LIVE-HOSTMODULECHECKFIXTURES. -/
def parseLiveHostModuleCheckFixturesSource (src : String) : FrontResult :=
  let toks := tokenizeLive (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmds liveParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckFixtures"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckFixturesSource,
    PARSE-LIVE-HOSTMODULECHECKFIXTURES. -/
def kernelCheckLiveHostModuleCheckFixturesSource (src : String) : Bool :=
  match parseLiveHostModuleCheckFixturesSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckFixturesSource
      liveHostModuleCheckFixturesSource with
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

/-- Eight imports. Not zero. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckRequiredDecls",
      "SystemsLean.HostModuleCheckRequiredDeclsProduct",
      "SystemsLean.HostModuleCheckRequiredDeclsLater",
      "SystemsLean.HostModuleCheckFixtureTexts",
      "SystemsLean.HostModuleCheckFixtureTextsProduct",
      "SystemsLean.HostModuleCheckFixtureTextsLater",
      "SystemsLean.HostModuleCheckFixtureTextsSelfHost",
      "SystemsLean.HostModuleCheckFixtureTextsEmit"
    ]

/-- One literal def kept. Concatenated strings are not in this list.
    The kept def is hostModuleCheckBadEmptyText. -/
def liveParseDefsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    cmdDefNames m.commands == [
      "hostModuleCheckBadEmptyText"
    ]

/-- Live parse command count is liveKeptCmds and does not pass kernelFuel. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Command-keyword count on the live tokens is the real command count. -/
def liveCmdKwCount : Nat :=
  countCmdKw liveSkipFuel
    (tokenizeLive (stripCommentsHc liveHostModuleCheckFixturesSource)) 0

/-- Real count, kept count, and skipped count. Sum does not pass 64. -/
def liveCmdBudgetOk : Bool :=
  liveCmdKwCount == liveRealCmds
    && liveKeptCmds + liveSkippedCmds == liveRealCmds
    && liveRealCmds <= 64
    && liveKeptCmds <= 64

/-- Wrap module lastSeg is HostModuleCheckFixtures
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckFixtures"
      && lastSeg m.name.raw == "HostModuleCheckFixtures"

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

/-- Twelve defs are in the live text. There is no theorem. -/
def liveParseHasCoreDefs : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeLive
      (stripCommentsHc liveHostModuleCheckFixturesSource)
    toksHaveDefNamed liveSkipFuel toks "hostModuleCheckTheoremCorpusOk"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingInductiveText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingNamespaceText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadEmptyText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingTheoremText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingAxiomText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingStructureText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingProgramStructureText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingErasedStructureText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingKernelReadyText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingPlanStructureText"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckBadMissingParityReadyText"

/-- Import SystemsLean.HostModuleCheckRequiredDecls. -/
def needleImportRequiredDecls : String :=
  "import SystemsLean.HostModuleCheckRequiredDecls\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsProduct. -/
def needleImportRequiredDeclsProduct : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsProduct\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsLater. -/
def needleImportRequiredDeclsLater : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsLater\n"

/-- Import SystemsLean.HostModuleCheckFixtureTexts. -/
def needleImportFixtureTexts : String :=
  "import SystemsLean.HostModuleCheckFixtureTexts\n"

/-- Import SystemsLean.HostModuleCheckFixtureTextsProduct. -/
def needleImportFixtureTextsProduct : String :=
  "import SystemsLean.HostModuleCheckFixtureTextsProduct\n"

/-- Import SystemsLean.HostModuleCheckFixtureTextsLater. -/
def needleImportFixtureTextsLater : String :=
  "import SystemsLean.HostModuleCheckFixtureTextsLater\n"

/-- Import SystemsLean.HostModuleCheckFixtureTextsSelfHost. -/
def needleImportFixtureTextsSelfHost : String :=
  "import SystemsLean.HostModuleCheckFixtureTextsSelfHost\n"

/-- Import SystemsLean.HostModuleCheckFixtureTextsEmit. -/
def needleImportFixtureTextsEmit : String :=
  "import SystemsLean.HostModuleCheckFixtureTextsEmit\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Kept string literal def. -/
def needleEmpty : String :=
  "def hostModuleCheckBadEmptyText : String :=\n"

/-- Corpus def, skip-folded. There is no theorem. -/
def needleCorpus : String :=
  "def hostModuleCheckTheoremCorpusOk : Bool :=\n"

/-- Concatenated bad text, skip-folded. -/
def needleBadInductive : String :=
  "def hostModuleCheckBadMissingInductiveText : String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs once in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckFixturesSource
  (src.splitOn needleImportRequiredDecls).length == 2
    && (src.splitOn needleImportRequiredDeclsProduct).length == 2
    && (src.splitOn needleImportRequiredDeclsLater).length == 2
    && (src.splitOn needleImportFixtureTexts).length == 2
    && (src.splitOn needleImportFixtureTextsProduct).length == 2
    && (src.splitOn needleImportFixtureTextsLater).length == 2
    && (src.splitOn needleImportFixtureTextsSelfHost).length == 2
    && (src.splitOn needleImportFixtureTextsEmit).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleEmpty).length == 2
    && (src.splitOn needleCorpus).length == 2
    && (src.splitOn needleBadInductive).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckFixturesReady,
    PARSE-LIVE-HOSTMODULECHECKFIXTURES,
    HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURES.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckFixturesReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKFIXTURES_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKFIXTURES")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKFIXTURES")
    && (liveRel == "HostModuleCheckFixtures.lean")
    && (liveHostModuleCheckFixturesRel ==
        "src/systems/SystemsLean/HostModuleCheckFixtures.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckFixturesFullHost
    && !hostFrontLiveHostModuleCheckFixturesResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckFixturesProvablyUnlocked
    && kernelCheckLiveHostModuleCheckFixturesSource
        liveHostModuleCheckFixturesSource
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
  match parseLiveHostModuleCheckFixturesSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKFIXTURES =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckFixturesRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckFixturesRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckFixturesRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckFixturesRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckFixturesSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckFixtures.lean != liveHostModuleCheckFixturesSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckFixtures.lean")
  let r := parseLiveHostModuleCheckFixturesSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKFIXTURES reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKFIXTURES reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKFIXTURES ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k} real={liveCmdKwCount} kept={liveKeptCmds} skipped={liveSkippedCmds}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} budget={liveCmdBudgetOk} imports={liveParseImportsOk} defs={liveParseDefsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckFixtures parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckFixtures parse false")
    unless hostFrontLiveHostModuleCheckFixturesReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckFixturesReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckFixturesReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckFixtures source was accepted"
      throw (IO.userError
        "empty HostModuleCheckFixtures source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckFixtures.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

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

end SystemsLean.HostFrontLiveHostModuleCheckFixtures
