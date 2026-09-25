/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckDualResidualTerm.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckDualResidualTerm.
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
  - parseLiveHostModuleCheckDualResidualTermSource turns live
    HostModuleCheckDualResidualTerm.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckDualResidualTerm
    even without a module line.
  - liveRel is the exact basename HostModuleCheckDualResidualTerm.lean.
    Disk reads use src/systems/SystemsLean/ plus that basename.
  - kernelCheckLiveHostModuleCheckDualResidualTermSource is
    HostKernel.kernelCheck of that parse. The reject arm returns false.
  - The embedded bytes are one part,
    liveHostModuleCheckDualResidualTermSource. Not split.
  - Real commands in this file: five imports, namespace
    SystemsLean.HostModuleCheck, thirty defs, three theorems, and end.
    That is 40.
  - Kept: five imports, the namespace, five literal defs, and end.
    Kept count is 12.
    The five literal defs are checkDepthDualResidualTermSurfaceBar,
    checkDepthDualResidualTermSurfaceScope,
    hostModuleCheckDualResidualTermSurfaceDualOk,
    dualResidualReadyTermBody, and
    hostModuleCheckDualResidualTermSkeletonSuffix.
  - Skipped: twenty-five defs that have binders or are not one literal,
    plus three theorems. Skipped count is 28.
    Kept plus skipped is 40.
    kernelFuel is 64. 40 does not pass 64. Fuel is not raised.
  - dualResidualReadyTermBody is one 364-character string.
    HostFrontLiveHostTerm.liveHostTermParseFuel is 256, so this
    parser takes strings with liveStringFuel 1024. A 256 take would
    drop that quote and retokenize the rest of the file.
  - One dash-dash spelling sits inside the header block comment.
    stripCommentsHc strips the block.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Occupancy stays 49. Not mill remill.
    Mill stays 69 of 69. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not an edit of the product file. Not a speed claim.

  Unique needles (trailing newline so a shorter HostModuleCheck prefix is not a hit):
  HostFrontLiveHostModuleCheckDualResidualTerm
  PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM
  HOST-FRONT-LIVE-HOSTMODULECHECKDUALRESIDUALTERM
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKDUALRESIDUALTERM_V0

  Greppable: SYSTEMS_LEAN_HOST,
  parseLiveHostModuleCheckDualResidualTermSource,
  kernelCheckLiveHostModuleCheckDualResidualTermSource,
  hostFrontLiveHostModuleCheckDualResidualTermReady,
  liveHostModuleCheckDualResidualTermSource,
  liveRel, liveHostModuleCheckDualResidualTermRel, stripCommentsHc,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckDualResidualTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm
open SystemsLean.HostFrontLiveTypes

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKDUALRESIDUALTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKDUALRESIDUALTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckDualResidualTerm.lean"

/-- Live file relative to repo root. Dual-pin path.
    liveHostModuleCheckDualResidualTermSource is the one embedded copy
    from HostFrontLiveHostModuleCheckDualResidualTermSource. Not split. -/
def liveHostModuleCheckDualResidualTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckDualResidualTermFullHost : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckDualResidualTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckDualResidualTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for un-kernelable def tails. -/
def liveSkipFuel : Nat := 32768

/-- String take fuel. dualResidualReadyTermBody is 364 characters.
    liveHostTermParseFuel 256 would drop that opening quote. -/
def liveStringFuel : Nat := 1024

/-- Real command count: five imports, namespace, thirty defs,
    three theorems, and end. -/
def liveRealCmds : Nat := 40

/-- Kept-command count: five imports, namespace, five literal defs, and end.
    Twenty-five non-literal defs and three theorems are skip-folded.
    Skipped count is 28. Kept plus skipped is 40.
    kernelFuel is 64. 40 does not pass 64. -/
def liveKeptCmds : Nat := 12

/-- Skipped command count. -/
def liveSkippedCmds : Nat := 28

/-- String-safe comment fold from HostFrontLiveHostCheck.stripCommentsHc.
    Keep dash-dash and block-open inside string payloads. Not
    HostFrontLiveMult.stripComments, which treats dash-dash as a comment
    even inside a string and would eat the rest of that line.
    HostModuleCheckDualResidualTerm has dash-dash in the header block comment. -/
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

/-- String-safe comment strip for live HostModuleCheckDualResidualTerm.lean
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

/-- Parse live HostModuleCheckDualResidualTerm.lean text.
    Greppable: parseLiveHostModuleCheckDualResidualTermSource,
    PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM. -/
def parseLiveHostModuleCheckDualResidualTermSource (src : String) : FrontResult :=
  let toks := tokenizeLive (stripCommentsHc src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmds liveParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckDualResidualTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a constant true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    Greppable: kernelCheckLiveHostModuleCheckDualResidualTermSource,
    PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM. -/
def kernelCheckLiveHostModuleCheckDualResidualTermSource (src : String) : Bool :=
  match parseLiveHostModuleCheckDualResidualTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckDualResidualTermSource
      liveHostModuleCheckDualResidualTermSource with
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

/-- Five literal defs kept. Binders and non-literals are not in this list. -/
def liveParseDefsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    cmdDefNames m.commands == [
      "checkDepthDualResidualTermSurfaceBar",
      "checkDepthDualResidualTermSurfaceScope",
      "hostModuleCheckDualResidualTermSurfaceDualOk",
      "dualResidualReadyTermBody",
      "hostModuleCheckDualResidualTermSkeletonSuffix"
    ]

/-- Live parse command count is liveKeptCmds and does not pass kernelFuel. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Command-keyword count on the live tokens is the real command count. -/
def liveCmdKwCount : Nat :=
  countCmdKw liveSkipFuel
    (tokenizeLive (stripCommentsHc liveHostModuleCheckDualResidualTermSource)) 0

/-- Real count, kept count, and skipped count. Sum does not pass 64. -/
def liveCmdBudgetOk : Bool :=
  liveCmdKwCount == liveRealCmds
    && liveKeptCmds + liveSkippedCmds == liveRealCmds
    && liveRealCmds <= 64
    && liveKeptCmds <= 64

/-- Wrap module lastSeg is HostModuleCheckDualResidualTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckDualResidualTerm"
      && lastSeg m.name.raw == "HostModuleCheckDualResidualTerm"

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

/-- Skip-head: literal defs, binder defs, and the three theorems are in the live text. -/
def liveParseHasCoreDefs : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeLive
      (stripCommentsHc liveHostModuleCheckDualResidualTermSource)
    toksHaveDefNamed liveSkipFuel toks "checkDepthDualResidualTermSurfaceBar"
      && toksHaveDefNamed liveSkipFuel toks "checkDepthDualResidualTermSurfaceScope"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckDualResidualTermSurfaceDualOk"
      && toksHaveDefNamed liveSkipFuel toks "dualResidualReadyTermBody"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckDualResidualTermSkeletonSuffix"
      && toksHaveDefNamed liveSkipFuel toks "dualResidualReadyBodyOk"
      && toksHaveDefNamed liveSkipFuel toks "checkDualResidualTermDialect"
      && toksHaveDefNamed liveSkipFuel toks "hostModuleCheckDualResidualTermSurfaceOk"
      && toksHaveTheoremNamed liveSkipFuel toks
        "hostModuleCheckDualResidualTermSurfaceOk_true"
      && toksHaveTheoremNamed liveSkipFuel toks
        "hostModuleCheckDualResidualReadyMultilineOk_true"
      && toksHaveTheoremNamed liveSkipFuel toks
        "hostModuleCheck_dual_residual_term_surface_ids_eq"

/-- Import SystemsLean.HostModuleCheckSurface. -/
def needleImportSurface : String :=
  "import SystemsLean.HostModuleCheckSurface\n"

/-- Import SystemsLean.HostModuleCheckEmitPlanTerm. -/
def needleImportEmitPlan : String :=
  "import SystemsLean.HostModuleCheckEmitPlanTerm\n"

/-- Import SystemsLean.HostModuleCheckRequiredDecls.
    Trailing newline so RequiredDeclsProduct is not a hit. -/
def needleImportRequired : String :=
  "import SystemsLean.HostModuleCheckRequiredDecls\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsProduct. -/
def needleImportRequiredProduct : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsProduct\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsLater. -/
def needleImportRequiredLater : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsLater\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Kept string literal def. -/
def needleBar : String :=
  "def checkDepthDualResidualTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Kept Bool literal def. -/
def needleDualOk : String :=
  "def hostModuleCheckDualResidualTermSurfaceDualOk : Bool := true\n"

/-- Binder def, skip-folded. -/
def needleDialect : String :=
  "def checkDualResidualTermDialect (content : String) : Option String :=\n"

/-- Theorem, skip-folded. -/
def needleTheorem : String :=
  "theorem hostModuleCheckDualResidualTermSurfaceOk_true :\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs once in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckDualResidualTermSource
  (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleImportEmitPlan).length == 2
    && (src.splitOn needleImportRequired).length == 2
    && (src.splitOn needleImportRequiredProduct).length == 2
    && (src.splitOn needleImportRequiredLater).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleBar).length == 2
    && (src.splitOn needleDualOk).length == 2
    && (src.splitOn needleDialect).length == 2
    && (src.splitOn needleTheorem).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckDualResidualTermReady,
    PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKDUALRESIDUALTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckDualResidualTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKDUALRESIDUALTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKDUALRESIDUALTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM")
    && (liveRel == "HostModuleCheckDualResidualTerm.lean")
    && (liveHostModuleCheckDualResidualTermRel ==
        "src/systems/SystemsLean/HostModuleCheckDualResidualTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckDualResidualTermFullHost
    && !hostFrontLiveHostModuleCheckDualResidualTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckDualResidualTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckDualResidualTermSource
        liveHostModuleCheckDualResidualTermSource
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
  match parseLiveHostModuleCheckDualResidualTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill remill. Mill stays 69 of 69. -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckDualResidualTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckDualResidualTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckDualResidualTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckDualResidualTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckDualResidualTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckDualResidualTerm.lean != liveHostModuleCheckDualResidualTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckDualResidualTerm.lean")
  let r := parseLiveHostModuleCheckDualResidualTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM reject {reason}"
    throw (IO.userError
      s!"PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKDUALRESIDUALTERM ACCEPT liveRel={liveRel} cmds={m.commands.length} kernelCheck={k} real={liveCmdKwCount} kept={liveKeptCmds} skipped={liveSkippedCmds}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} budget={liveCmdBudgetOk} imports={liveParseImportsOk} defs={liveParseDefsOk} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} core={liveParseHasCoreDefs} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckDualResidualTerm parse false"
      throw (IO.userError
        "kernelCheck live HostModuleCheckDualResidualTerm parse false")
    unless hostFrontLiveHostModuleCheckDualResidualTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckDualResidualTermReady false"
      throw (IO.userError
        "hostFrontLiveHostModuleCheckDualResidualTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckDualResidualTerm source was accepted"
      throw (IO.userError
        "empty HostModuleCheckDualResidualTerm source was accepted")
    IO.println s!"GREEN {stageId}: live HostModuleCheckDualResidualTerm.lean parse kernelCheck; not mill remill; mill stays 69 of 69"

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

end SystemsLean.HostFrontLiveHostModuleCheckDualResidualTerm
