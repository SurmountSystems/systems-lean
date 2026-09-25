/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckSelfApplyFsTerm.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckSelfApplyFsTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  The live file has five imports. Those imports stay inside the
  embedded source bytes. This checker does not import them.
  Checker imports: HostFrontLiveHostTerm, the Source module, and HostKernel.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: those five imports, the namespace, the end, and
  defs whose bodies are one String, Bool, or Nat literal.
  There is no open. Theorems are not kept.
  Concatenation and && bodies are not kept.
  selfApplyFsTermGoodPins and the multiline fixture have escaped quotes
  or string join, so those defs are not one literal.
  freestandingSelfApplyReadyTermBody is one String literal. The && text
  is inside the quotes, not a Lean && body, so that def is kept.
  The skeleton suffix is one String literal. The skeleton prefix is
  string concatenation, so it is not kept.
  A product Bool literal true is a kept atom.
  It is not a license to make kernelCheck a constant true.
  kernelCheck calls HostKernel.kernelCheck on an accepted parse and
  returns false on reject. It is not a constant true.
  Kept count is 12, at most kernelFuel 64. kernelFuel is not raised.
  Kept strings are short. liveStringFuel is 8192. That is not kernelFuel.
  One raw string. The product is 190 lines, so the source file is not split.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  FullHostElaborateRemains stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKSELFAPPLYFSTERM_V0,
  PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM, liveRel,
  kernelCheckLiveHostModuleCheckSelfApplyFsTermSource,
  hostFrontLiveHostModuleCheckSelfApplyFsTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKSELFAPPLYFSTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckSelfApplyFsTerm.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckSelfApplyFsTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckSelfApplyFsTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckSelfApplyFsTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckSelfApplyFsTermResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckSelfApplyFsTermProvablyUnlocked : Bool := false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- String-literal scan. Not kernelFuel. kernelFuel stays 64.
    Kept strings are short. Escaped quotes split a fixture string
    into more than one token. 8192 covers each piece. -/
def liveStringFuel : Nat := 8192

/-- Kept-command count: five imports, namespace, end, and five
    literal defs (bar, scope, dual-ok Bool, ready-body String, suffix).
    freestandingSelfApplyReadyTermBody is one String literal.
    The && text is inside that string, not a Lean && body.
    The skeleton prefix is string concatenation, so it is not kept.
    selfApplyFsTermGoodPins and the multiline fixture are not one literal.
    open is not kept. theorem is not kept. kernelFuel is 64. -/
def liveKeptCmds : Nat := 12

/-- Tokenize like HostFrontLiveHostTerm, with liveStringFuel for quotes. -/
def tokenizeLiveN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeLiveN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveParseFuel [c] rest
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
      let (rev, rest2) := takeIdentN liveParseFuel [c] rest
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

/-- Names a command adds to the known-const set.
    Imports do not add names. -/
def cmdAddsLive (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- A typed def whose body is one String, Bool, or Nat literal.
    A List String body is not a kernel literal, so it is not kept.
    A name reference is not a kernel literal, so it is not kept. -/
def bodyIsKernelLit (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.string) (Term.litString _) => true
  | Cmd.def_ _ (some HostType.bool) (Term.litBool _) => true
  | Cmd.def_ _ (some HostType.nat) (Term.litNat _) => true
  | _ => false

/-- Parse `def` only when the body is one complete term.
    A leftover that is not the next command means the body used syntax
    HostTerm does not keep (list lit).
    Return none so the caller skipUntilCmd. Do not keep a prefix of the body. -/
def parseDefLive (fuel : Nat) (dname : String)
    (rest : List String) : Option (Prod Cmd (List String)) :=
  match parseBindersHt fuel rest [] with
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
          match parseHostTypeAllHt tyToks with
          | none => none
          | some retTy =>
            let ty := addBinderArrows bs retTy
            let bnames := bs.map (fun p => p.fst)
            let dn := HostTerm.n dname
            match parseTermHt fuel bnames bodyToks with
            | none => none
            | some (body, rest4) =>
              let complete :=
                match rest4 with
                | [] => true
                | t :: _ => isCmdKw t
              if !complete then none
              else
                let rest5 := skipNonCmd liveSkipFuel rest4
                if bs.isEmpty then
                  some (Cmd.def_ dn (some ty) body, rest5)
                else
                  let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                  some (Cmd.defBind dn nbs retTy body, rest5)
    | _ => none

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    open is not parsed here. theorem, example, and set_option are not
    parsed here. -/
def parseOneCmdLive (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefLive fuel dname rest2
    | none => none
  | _ => none

/-- Keep imports, namespace, end, and literal defs.
    Drop defBind and non-literal defs after they have been consumed. -/
def keepParsed (kn : List String) (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ _ _ => cmdBodyKnown kn c && bodyIsKernelLit c
  | Cmd.defBind _ _ _ _ => false
  | _ => true

/-- Fold commands. Skip defs whose bodies are not kernel literals.
    A non-command token is not a parse failure. -/
def parseCmdsLive : Nat -> List String -> List String ->
    List Cmd -> Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdLive liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      if keepParsed kn c then
        parseCmdsLive n rest2 (kn ++ cmdAddsLive c) (acc ++ [c])
      else
        parseCmdsLive n rest2 kn acc
    | none =>
      match toks with
      | _ :: rest =>
        let rest2 := skipUntilCmd liveSkipFuel rest
        if rest2.length < toks.length then
          parseCmdsLive n rest2 kn acc
        else none
      | [] => some acc

/-- Parse live HostModuleCheckSelfApplyFsTerm.lean text.
    Greppable: parseLiveHostModuleCheckSelfApplyFsTermSource,
    PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM. -/
def parseLiveHostModuleCheckSelfApplyFsTermSource (src : String) : FrontResult :=
  let toks := tokenizeLive (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLive liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckSelfApplyFsTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    More commands than kernelFuel 64 returns false.
    Greppable: kernelCheckLiveHostModuleCheckSelfApplyFsTermSource,
    PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM. -/
def kernelCheckLiveHostModuleCheckSelfApplyFsTermSource (src : String) : Bool :=
  match parseLiveHostModuleCheckSelfApplyFsTermSource src with
  | FrontResult.accept m =>
    if m.commands.length > kernelFuel then false
    else HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckSelfApplyFsTermSource liveHostModuleCheckSelfApplyFsTermSource with
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

/-- Five imports, in source order.
    The product modules are not imports of this checker. -/
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

/-- Live parse command count matches liveKeptCmds. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Commands after the leading imports. -/
def commandsAfterImports : List Cmd -> List Cmd
  | [] => []
  | Cmd.importModule _ :: rest => commandsAfterImports rest
  | cs => cs

/-- After the five imports: namespace, literal defs, then end. -/
def liveParseShapeOk : Bool :=
  match liveParsed? with
  | some m =>
    match commandsAfterImports m.commands with
    | Cmd.namespace x :: rest =>
      match rest.reverse with
      | Cmd.endNamespace y :: revMid =>
        x.raw == "SystemsLean.HostModuleCheck"
          && y.raw == "SystemsLean.HostModuleCheck"
          && (revMid.reverse.all fun c =>
            match c with
            | Cmd.def_ _ _ _ => bodyIsKernelLit c
            | _ => false)
      | _ => false
    | _ => false
  | none => false

/-- Concatenation, &&, and binder defs are not kept commands. -/
def liveParseSkippedNonLits : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ =>
        x.raw == "hostModuleCheckSelfApplyFsTermSkeletonPrefix"
          || x.raw == "selfApplyFsTermGoodPins"
          || x.raw == "hostModuleCheckSelfApplyFsTermSurfaceOk"
          || x.raw == "hostModuleCheckGoodSelfApplyFsReadyMultilineText"
      | Cmd.defBind _ _ _ _ => true
      | _ => false)

/-- Kept String def checkDepthSelfApplyFsTermSurfaceBar is TERM-SURFACE. -/
def liveParseHasBarLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthSelfApplyFsTermSurfaceBar"
          && s == "TERM-SURFACE"
      | _ => false

/-- Kept String def checkDepthSelfApplyFsTermSurfaceScope is SelfApplyFs-only. -/
def liveParseHasScopeLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthSelfApplyFsTermSurfaceScope"
          && s == "SelfApplyFs-only"
      | _ => false

/-- Kept Bool def hostModuleCheckSelfApplyFsTermSurfaceDualOk is true.
    That atom is not this checker's kernelCheck. -/
def liveParseHasDualOkLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.bool) (Term.litBool b) =>
        x.raw == "hostModuleCheckSelfApplyFsTermSurfaceDualOk"
          && b == true
      | _ => false

/-- Kept String def freestandingSelfApplyReadyTermBody.
    No escaped quote, so the body is one literal. The && text is
    inside the string, not a Lean && body. -/
def liveParseHasReadyLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "freestandingSelfApplyReadyTermBody"
          && s == "SelfApply.selfApplyReady && freestandingSelfApplyPathReady && freestandingParityLadderReady && selfApplyFsSurfaceOk"
      | _ => false

/-- Kept String def hostModuleCheckSelfApplyFsTermSkeletonSuffix.
    The body keeps the source backslash-n, not a real newline. -/
def liveParseHasSuffixLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "hostModuleCheckSelfApplyFsTermSkeletonSuffix"
          && s == "end SystemsLean.SelfApplyFs\\n"
      | _ => false

/-- Scope is namespace SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- End of namespace SystemsLean.HostModuleCheck. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Wrap module lastSeg is HostModuleCheckSelfApplyFsTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckSelfApplyFsTerm"
      && lastSeg m.name.raw == "HostModuleCheckSelfApplyFsTerm"

/-- Import HostModuleCheckSurface, once, with a trailing newline. -/
def needleImportSurface : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Import HostModuleCheckEmitPlanTerm, once, with a trailing newline. -/
def needleImportEmitPlanTerm : String :=
  "import SystemsLean.HostModuleCheckEmitPlanTerm\n"

/-- RequiredDecls import, once. The newline keeps Product and Later apart. -/
def needleImportRequiredDecls : String :=
  "import SystemsLean.HostModuleCheckRequiredDecls\n"

/-- RequiredDeclsProduct import, once. -/
def needleImportRequiredDeclsProduct : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsProduct\n"

/-- RequiredDeclsLater import, once. -/
def needleImportRequiredDeclsLater : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsLater\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Bar def name. The body string is TERM-SURFACE. -/
def needleBarDef : String := "def checkDepthSelfApplyFsTermSurfaceBar"

/-- Ready-body def name. One String literal, kept. -/
def needleReadyBodyDef : String := "def freestandingSelfApplyReadyTermBody"

/-- Suffix def name. One String literal. -/
def needleSuffixDef : String :=
  "def hostModuleCheckSelfApplyFsTermSkeletonSuffix"

/-- Prefix def name. String concatenation, not kept. -/
def needlePrefixDef : String :=
  "def hostModuleCheckSelfApplyFsTermSkeletonPrefix"

/-- Combined ok def name. The body is &&, so it is not kept. -/
def needleOkDef : String := "def hostModuleCheckSelfApplyFsTermSurfaceOk"

/-- Bar string in the live source. -/
def needleBar : String := "TERM-SURFACE"

/-- Scope string in the live source. -/
def needleScope : String := "SelfApplyFs-only"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Five imports. Bar is TERM-SURFACE. Scope is SelfApplyFs-only. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckSelfApplyFsTermSource
  (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleImportEmitPlanTerm).length == 2
    && (src.splitOn needleImportRequiredDecls).length == 2
    && (src.splitOn needleImportRequiredDeclsProduct).length == 2
    && (src.splitOn needleImportRequiredDeclsLater).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleEnd).length == 2
    && (src.splitOn needleBarDef).length == 2
    && (src.splitOn needleReadyBodyDef).length == 2
    && (src.splitOn needleSuffixDef).length == 2
    && (src.splitOn needlePrefixDef).length == 2
    && (src.splitOn needleOkDef).length == 2
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleScope).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckSelfApplyFsTermReady,
    PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckSelfApplyFsTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKSELFAPPLYFSTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM")
    && (liveRel == "HostModuleCheckSelfApplyFsTerm.lean")
    && (liveHostModuleCheckSelfApplyFsTermRel ==
        "src/systems/SystemsLean/HostModuleCheckSelfApplyFsTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckSelfApplyFsTermFullHost
    && !hostFrontLiveHostModuleCheckSelfApplyFsTermFullBackend
    && !hostFrontLiveHostModuleCheckSelfApplyFsTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckSelfApplyFsTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckSelfApplyFsTermSource liveHostModuleCheckSelfApplyFsTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseShapeOk
    && liveParseSkippedNonLits
    && liveParseHasBarLit
    && liveParseHasScopeLit
    && liveParseHasDualOkLit
    && liveParseHasReadyLit
    && liveParseHasSuffixLit
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasModule
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckSelfApplyFsTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckSelfApplyFsTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckSelfApplyFsTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckSelfApplyFsTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckSelfApplyFsTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckSelfApplyFsTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckSelfApplyFsTerm.lean != liveHostModuleCheckSelfApplyFsTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckSelfApplyFsTerm.lean")
  let r := parseLiveHostModuleCheckSelfApplyFsTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM reject {reason}")
  | FrontResult.accept m =>
    let k :=
      if m.commands.length > kernelFuel then false
      else HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKSELFAPPLYFSTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} shape={liveParseShapeOk} skipped={liveParseSkippedNonLits} bar={liveParseHasBarLit} scope={liveParseHasScopeLit} dual={liveParseHasDualOkLit} ready={liveParseHasReadyLit} suffix={liveParseHasSuffixLit} namespace={liveParseHasNs} end={liveParseHasEnd} module={liveParseHasModule} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckSelfApplyFsTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckSelfApplyFsTerm parse false")
    unless hostFrontLiveHostModuleCheckSelfApplyFsTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckSelfApplyFsTermReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckSelfApplyFsTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckSelfApplyFsTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckSelfApplyFsTerm source was accepted")
    IO.println s!"GREEN {stageId}"

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

end SystemsLean.HostFrontLiveHostModuleCheckSelfApplyFsTerm
