/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckTypesSubsetRebuildTerm.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckTypesSubsetRebuildTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckTheorems.lean.
  It is not HostModuleCheckRequiredDeclsProduct.lean.
  The live file has five imports. Those imports stay inside the
  embedded source bytes. This checker does not import them.
  Checker imports: HostFrontLiveHostTerm, the Source module, and HostKernel.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: those five imports, the namespace, five literal
  defs, and the end.
  example is not kept. set_option is not kept.
  There is no open. Three theorems are not kept.
  A concatenation or && body is not a kept atom.
  It is not a license to make kernelCheck a constant true.
  kernelCheck calls HostKernel.kernelCheck on an accepted parse and
  returns false on reject. It is not a constant true.
  Kept count is 12, at most kernelFuel 64. kernelFuel is not raised.
  liveStringFuel is 8192. That is not kernelFuel.
  One raw string. The product is 304 lines, so the source file is not split.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  FullHostElaborateRemains stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKTYPESSUBSETREBUILDTERM_V0,
  PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM, liveRel,
  kernelCheckLiveHostModuleCheckTypesSubsetRebuildTermSource,
  hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKTYPESSUBSETREBUILDTERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckTypesSubsetRebuildTerm.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckTypesSubsetRebuildTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckTypesSubsetRebuildTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckTypesSubsetRebuildTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckTypesSubsetRebuildTermResidualFreeClaimed : Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckTypesSubsetRebuildTermProvablyUnlocked : Bool := false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- String-literal scan. Not kernelFuel. kernelFuel stays 64.
    One kept String literal is long. It is not a command count.
    8192 covers that quote. -/
def liveStringFuel : Nat := 8192

/-- Kept-command count: five imports, the namespace, five literal defs,
    and the end. example, set_option, open, and theorem are not kept.
    Concatenation and && bodies are not kept. kernelFuel is 64. -/
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

/-- Parse live HostModuleCheckTypesSubsetRebuildTerm.lean text.
    Greppable: parseLiveHostModuleCheckTypesSubsetRebuildTermSource,
    PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM. -/
def parseLiveHostModuleCheckTypesSubsetRebuildTermSource (src : String) : FrontResult :=
  let toks := tokenizeLive (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLive liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckTypesSubsetRebuildTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    More commands than kernelFuel 64 returns false.
    Greppable: kernelCheckLiveHostModuleCheckTypesSubsetRebuildTermSource,
    PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM. -/
def kernelCheckLiveHostModuleCheckTypesSubsetRebuildTermSource (src : String) : Bool :=
  match parseLiveHostModuleCheckTypesSubsetRebuildTermSource src with
  | FrontResult.accept m =>
    if m.commands.length > kernelFuel then false
    else HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckTypesSubsetRebuildTermSource liveHostModuleCheckTypesSubsetRebuildTermSource with
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

/-- Five column-0 imports, in order.
    The product module is not an import of this checker. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands ==
      ["SystemsLean.HostModuleCheckSurface",
       "SystemsLean.HostModuleCheckEmitPlanTerm",
       "SystemsLean.HostModuleCheckRequiredDecls",
       "SystemsLean.HostModuleCheckRequiredDeclsProduct",
       "SystemsLean.HostModuleCheckRequiredDeclsLater"]

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

/-- Three theorems are in the live text and are not kept.
    Kept commands are the five imports, the namespace, literal defs, and the end.
    There is no example and no set_option. A Bool literal def is a kept atom.
    It is not this checker's kernelCheck. -/
def liveParseExamplesNotKept : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    (m.commands.all fun c =>
      match c with
      | Cmd.importModule _ => true
      | Cmd.namespace _ => true
      | Cmd.endNamespace _ => true
      | Cmd.def_ _ _ _ => bodyIsKernelLit c
      | _ => false)
      && (liveHostModuleCheckTypesSubsetRebuildTermSource.splitOn "\ntheorem ").length == 4
      && (liveHostModuleCheckTypesSubsetRebuildTermSource.splitOn "\nexample").length == 1
      && (liveHostModuleCheckTypesSubsetRebuildTermSource.splitOn "\nset_option ").length == 1

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

/-- Wrap module lastSeg is HostModuleCheckTypesSubsetRebuildTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckTypesSubsetRebuildTerm"
      && lastSeg m.name.raw == "HostModuleCheckTypesSubsetRebuildTerm"

/-- Import needles, column 0, once each.
    RequiredDecls is not a prefix of the Product or Later lines. -/
def needleImportSurface : String :=
  "\nimport SystemsLean.HostModuleCheckSurface\n"
def needleImportEmitPlanTerm : String :=
  "\nimport SystemsLean.HostModuleCheckEmitPlanTerm\n"
def needleImportRequiredDecls : String :=
  "\nimport SystemsLean.HostModuleCheckRequiredDecls\n"
def needleImportRequiredDeclsProduct : String :=
  "\nimport SystemsLean.HostModuleCheckRequiredDeclsProduct\n"
def needleImportRequiredDeclsLater : String :=
  "\nimport SystemsLean.HostModuleCheckRequiredDeclsLater\n"

/-- Namespace needle, column 0, once.
    A comment mentions the same namespace mid-line. That is not this needle. -/
def needleNamespace : String := "\nnamespace SystemsLean.HostModuleCheck\n"

/-- End needle, column 0, once. -/
def needleEnd : String := "\nend SystemsLean.HostModuleCheck\n"

/-- Three theorem lines are present. They are not kept commands. -/
def needleTheorem : String := "\ntheorem "

/-- Each import needle occurs once. Three theorems. No examples.
    splitOn, not a prefix check. Five imports. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckTypesSubsetRebuildTermSource
  (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleImportEmitPlanTerm).length == 2
    && (src.splitOn needleImportRequiredDecls).length == 2
    && (src.splitOn needleImportRequiredDeclsProduct).length == 2
    && (src.splitOn needleImportRequiredDeclsLater).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleEnd).length == 2
    && (src.splitOn needleTheorem).length == 4

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady,
    PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKTYPESSUBSETREBUILDTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM")
    && (liveRel == "HostModuleCheckTypesSubsetRebuildTerm.lean")
    && (liveHostModuleCheckTypesSubsetRebuildTermRel ==
        "src/systems/SystemsLean/HostModuleCheckTypesSubsetRebuildTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckTypesSubsetRebuildTermFullHost
    && !hostFrontLiveHostModuleCheckTypesSubsetRebuildTermFullBackend
    && !hostFrontLiveHostModuleCheckTypesSubsetRebuildTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckTypesSubsetRebuildTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckTypesSubsetRebuildTermSource liveHostModuleCheckTypesSubsetRebuildTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseShapeOk
    && liveParseExamplesNotKept
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasModule
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckTypesSubsetRebuildTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckTypesSubsetRebuildTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckTypesSubsetRebuildTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckTypesSubsetRebuildTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckTypesSubsetRebuildTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckTypesSubsetRebuildTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckTypesSubsetRebuildTerm.lean != liveHostModuleCheckTypesSubsetRebuildTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckTypesSubsetRebuildTerm.lean")
  let r := parseLiveHostModuleCheckTypesSubsetRebuildTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM reject {reason}")
  | FrontResult.accept m =>
    let k :=
      if m.commands.length > kernelFuel then false
      else HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKTYPESSUBSETREBUILDTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} shape={liveParseShapeOk} examples={liveParseExamplesNotKept} namespace={liveParseHasNs} end={liveParseHasEnd} module={liveParseHasModule} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckTypesSubsetRebuildTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckTypesSubsetRebuildTerm parse false")
    unless hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckTypesSubsetRebuildTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckTypesSubsetRebuildTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckTypesSubsetRebuildTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckTypesSubsetRebuildTerm
