/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckProgramSubsetEmitTerm.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckProgramSubsetEmitTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  The live file has five imports. Those imports stay inside the
  embedded source bytes. This checker does not import them.
  Checker imports: HostFrontLiveHostTerm, the Source module, HostKernel.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: those five imports, the namespace, end, and
  defs whose bodies are one String or Bool literal.
  A Bool literal inside the product
  (hostModuleCheckProgramSubsetEmitTermSurfaceDualOk)
  is not this checker's kernelCheck. kernelCheck calls HostKernel.kernelCheck
  on an accepted parse and returns false on reject.
  Match, application, concatenation, and && bodies stay in the source text
  (needles). Their bodies are not kernel terms.
  No fixture line starts with "import ", so no extra import is kept.
  programSubsetEmitReadyTermBody has escaped quotes, so that string
  splits and the def is not one literal. Kept count is 11, at most
  kernelFuel 64.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  FullHostElaborateRemains stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPROGRAMSUBSETEMITTERM_V0,
  PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM, liveRel,
  kernelCheckLiveHostModuleCheckProgramSubsetEmitTermSource,
  hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPROGRAMSUBSETEMITTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckProgramSubsetEmitTerm.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckProgramSubsetEmitTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckProgramSubsetEmitTermFullHost :
    Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckProgramSubsetEmitTermFullBackend :
    Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckProgramSubsetEmitTermResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckProgramSubsetEmitTermProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- String-literal scan. Not kernelFuel. kernelFuel stays 64.
    Skeleton strings are short. Escaped quotes split a fixture
    string into more than one token; 1024 covers each piece. -/
def liveStringFuel : Nat := 1024

/-- Kept-command count: five imports, namespace, end, and four
    literal defs (bar, scope, dual-ok Bool, suffix).
    programSubsetEmitReadyTermBody is not kept: escaped quotes split
    the string, so the body is not one literal.
    The skeleton prefix is string concatenation, so it is not kept. -/
def liveKeptCmds : Nat := 11

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
    An application or `&&` body is not a kernel literal, so it is not kept. -/
def bodyIsKernelLit (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.string) (Term.litString _) => true
  | Cmd.def_ _ (some HostType.bool) (Term.litBool _) => true
  | Cmd.def_ _ (some HostType.nat) (Term.litNat _) => true
  | _ => false

/-- Parse `def` only when the body is one complete term.
    A leftover that is not the next command means the body used syntax
    HostTerm does not keep (`match`, `let`, list lit).
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

/-- Parse live HostModuleCheckProgramSubsetEmitTerm.lean text.
    Greppable: parseLiveHostModuleCheckProgramSubsetEmitTermSource,
    PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM. -/
def parseLiveHostModuleCheckProgramSubsetEmitTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeLive (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLive liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name :=
              HostTerm.n "SystemsLean.HostModuleCheckProgramSubsetEmitTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    More commands than kernelFuel 64 returns false.
    Greppable: kernelCheckLiveHostModuleCheckProgramSubsetEmitTermSource,
    PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM. -/
def kernelCheckLiveHostModuleCheckProgramSubsetEmitTermSource
    (src : String) : Bool :=
  match parseLiveHostModuleCheckProgramSubsetEmitTermSource src with
  | FrontResult.accept m =>
    if m.commands.length > kernelFuel then false
    else HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckProgramSubsetEmitTermSource
      liveHostModuleCheckProgramSubsetEmitTermSource with
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

/-- Kept String def checkDepthProgramSubsetEmitTermSurfaceBar is TERM-SURFACE. -/
def liveParseHasBarLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthProgramSubsetEmitTermSurfaceBar"
          && s == "TERM-SURFACE"
      | _ => false

/-- Kept String def checkDepthProgramSubsetEmitTermSurfaceScope is
    ProgramSubsetEmit-only. -/
def liveParseHasScopeLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthProgramSubsetEmitTermSurfaceScope"
          && s == "ProgramSubsetEmit-only"
      | _ => false

/-- Kept Bool def hostModuleCheckProgramSubsetEmitTermSurfaceDualOk is true.
    That atom is not this checker's kernelCheck. -/
def liveParseHasDualOkLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.bool) (Term.litBool b) =>
        x.raw == "hostModuleCheckProgramSubsetEmitTermSurfaceDualOk"
          && b == true
      | _ => false

/-- Kept String def hostModuleCheckProgramSubsetEmitTermSkeletonSuffix.
    The body keeps the source backslash-n, not a real newline. -/
def liveParseHasSuffixLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "hostModuleCheckProgramSubsetEmitTermSkeletonSuffix"
          && s == "end SystemsLean.ProgramSubsetEmit\\n"
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

/-- Wrap module lastSeg is HostModuleCheckProgramSubsetEmitTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckProgramSubsetEmitTerm"
      && lastSeg m.name.raw == "HostModuleCheckProgramSubsetEmitTerm"

/-- Import HostModuleCheckSurface, once, with a trailing newline. -/
def needleImportSurface : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Import HostModuleCheckEmitPlanTerm, once, with a trailing newline. -/
def needleImportEmitPlanTerm : String :=
  "import SystemsLean.HostModuleCheckEmitPlanTerm\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Bar def name. The body string is TERM-SURFACE. -/
def needleBarDef : String := "def checkDepthProgramSubsetEmitTermSurfaceBar"

/-- Ready-body def name is in the source text.
    Escaped quotes split that literal, so the def is not kept. -/
def needleReadyBodyDef : String :=
  "def programSubsetEmitReadyTermBody"

/-- Suffix def name. One String literal. -/
def needleSuffixDef : String :=
  "def hostModuleCheckProgramSubsetEmitTermSkeletonSuffix"

/-- RequiredDecls import, once. The newline keeps Product and Later apart. -/
def needleImportRequiredDecls : String :=
  "import SystemsLean.HostModuleCheckRequiredDecls\n"

/-- RequiredDeclsProduct import, once. -/
def needleImportRequiredDeclsProduct : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsProduct\n"

/-- RequiredDeclsLater import, once. -/
def needleImportRequiredDeclsLater : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsLater\n"

/-- Combined ok def name. Not this checker's kernelCheck. -/
def needleOkDef : String :=
  "def hostModuleCheckProgramSubsetEmitTermSurfaceOk"

/-- Bar string in the live source. -/
def needleBar : String := "TERM-SURFACE"

/-- Scope string in the live source. -/
def needleScope : String := "ProgramSubsetEmit-only"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Five imports. Bar is TERM-SURFACE. Scope is ProgramSubsetEmit-only. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckProgramSubsetEmitTermSource
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
    && (src.splitOn needleOkDef).length == 2
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleScope).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady,
    PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPROGRAMSUBSETEMITTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM")
    && (liveRel == "HostModuleCheckProgramSubsetEmitTerm.lean")
    && (liveHostModuleCheckProgramSubsetEmitTermRel ==
        "src/systems/SystemsLean/HostModuleCheckProgramSubsetEmitTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckProgramSubsetEmitTermFullHost
    && !hostFrontLiveHostModuleCheckProgramSubsetEmitTermFullBackend
    && !hostFrontLiveHostModuleCheckProgramSubsetEmitTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckProgramSubsetEmitTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckProgramSubsetEmitTermSource
        liveHostModuleCheckProgramSubsetEmitTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasBarLit
    && liveParseHasScopeLit
    && liveParseHasDualOkLit
    && liveParseHasSuffixLit
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasModule
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckProgramSubsetEmitTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckProgramSubsetEmitTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckProgramSubsetEmitTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckProgramSubsetEmitTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckProgramSubsetEmitTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckProgramSubsetEmitTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckProgramSubsetEmitTerm.lean != liveHostModuleCheckProgramSubsetEmitTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckProgramSubsetEmitTerm.lean")
  let r := parseLiveHostModuleCheckProgramSubsetEmitTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM reject {reason}")
  | FrontResult.accept m =>
    let k :=
      if m.commands.length > kernelFuel then false
      else HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKPROGRAMSUBSETEMITTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} bar={liveParseHasBarLit} scope={liveParseHasScopeLit} dual={liveParseHasDualOkLit} suffix={liveParseHasSuffixLit} namespace={liveParseHasNs} end={liveParseHasEnd} module={liveParseHasModule} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckProgramSubsetEmitTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckProgramSubsetEmitTerm parse false")
    unless hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckProgramSubsetEmitTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckProgramSubsetEmitTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckProgramSubsetEmitTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckProgramSubsetEmitTerm
