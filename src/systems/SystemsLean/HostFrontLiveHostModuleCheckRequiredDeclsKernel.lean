/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckRequiredDeclsKernel.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckRequiredDeclsKernel.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  The live file has two imports. Those imports stay inside the
  embedded source bytes. This checker does not import them.
  Checker imports: HostFrontLiveHostTerm, the Source module, HostKernel.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: those two imports, the namespace, end, and
  defs whose bodies are one String or Bool literal.
  A Bool literal inside the product
  (hostModuleCheckRequiredDeclsKernelDualOk)
  is not this checker's kernelCheck. kernelCheck calls HostKernel.kernelCheck
  on an accepted parse and returns false on reject.
  Match, application, concatenation, and && bodies stay in the source text
  (needles). Their bodies are not kernel terms.
  open is skipped. No theorem in the live file.
  Kept count is 7, at most kernelFuel 64.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  FullHostElaborateRemains stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKREQUIREDDECLSKERNEL_V0,
  PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL, liveRel,
  kernelCheckLiveHostModuleCheckRequiredDeclsKernelSource,
  hostFrontLiveHostModuleCheckRequiredDeclsKernelReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernelSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKREQUIREDDECLSKERNEL_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckRequiredDeclsKernel.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRequiredDeclsKernelRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckRequiredDeclsKernelFullHost :
    Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckRequiredDeclsKernelFullBackend :
    Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckRequiredDeclsKernelResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckRequiredDeclsKernelProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- String-literal scan. Not kernelFuel. kernelFuel stays 64. -/
def liveStringFuel : Nat := 1024

/-- Kept-command count: two imports, namespace, end, and three
    literal defs (bar, scope, dual-ok Bool).
    && bodies are not kept. open is not kept. -/
def liveKeptCmds : Nat := 7

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

/-- Parse live HostModuleCheckRequiredDeclsKernel.lean text.
    Greppable: parseLiveHostModuleCheckRequiredDeclsKernelSource,
    PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL. -/
def parseLiveHostModuleCheckRequiredDeclsKernelSource (src : String) :
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
              HostTerm.n "SystemsLean.HostModuleCheckRequiredDeclsKernel"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    More commands than kernelFuel 64 returns false.
    Greppable: kernelCheckLiveHostModuleCheckRequiredDeclsKernelSource,
    PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL. -/
def kernelCheckLiveHostModuleCheckRequiredDeclsKernelSource
    (src : String) : Bool :=
  match parseLiveHostModuleCheckRequiredDeclsKernelSource src with
  | FrontResult.accept m =>
    if m.commands.length > kernelFuel then false
    else HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckRequiredDeclsKernelSource
      liveHostModuleCheckRequiredDeclsKernelSource with
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

/-- Two imports, in source order.
    The product modules are not imports of this checker. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostKernel",
      "SystemsLean.HostFrontLiveRequiredDecls"
    ]

/-- Live parse command count matches liveKeptCmds. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Kept String def checkDepthRequiredDeclsKernelBar is KERNEL-CHECK. -/
def liveParseHasBarLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthRequiredDeclsKernelBar"
          && s == "KERNEL-CHECK"
      | _ => false

/-- Kept String def checkDepthRequiredDeclsKernelScope is
    HostModuleCheckRequiredDecls-only. -/
def liveParseHasScopeLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthRequiredDeclsKernelScope"
          && s == "HostModuleCheckRequiredDecls-only"
      | _ => false

/-- Kept Bool def hostModuleCheckRequiredDeclsKernelDualOk is true.
    That atom is not this checker's kernelCheck. -/
def liveParseHasDualOkLit : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.bool) (Term.litBool b) =>
        x.raw == "hostModuleCheckRequiredDeclsKernelDualOk"
          && b == true
      | _ => false

/-- && bodies are not kept commands. -/
def liveParseSkippedAndBodies : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ =>
        x.raw == "hostModuleCheckLiveRequiredDeclsParseOk"
          || x.raw == "checkRequiredDeclsKernel"
          || x.raw == "hostModuleCheckRequiredDeclsKernelOk"
      | _ => false)

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

/-- Wrap module lastSeg is HostModuleCheckRequiredDeclsKernel
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckRequiredDeclsKernel"
      && lastSeg m.name.raw == "HostModuleCheckRequiredDeclsKernel"

/-- Import HostKernel, once, with a trailing newline. -/
def needleImportHostKernel : String := "import SystemsLean.HostKernel\n"

/-- Import HostFrontLiveRequiredDecls, once, with a trailing newline. -/
def needleImportRequiredDecls : String :=
  "import SystemsLean.HostFrontLiveRequiredDecls\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Bar def name. The body string is KERNEL-CHECK. -/
def needleBarDef : String := "def checkDepthRequiredDeclsKernelBar"

/-- Scope def name. One String literal. -/
def needleScopeDef : String := "def checkDepthRequiredDeclsKernelScope"

/-- Dual-ok def name. One Bool literal. Not kernelCheck. -/
def needleDualOkDef : String :=
  "def hostModuleCheckRequiredDeclsKernelDualOk"

/-- Parse-ok def name. The body is &&, so it is not kept. -/
def needleParseOkDef : String :=
  "def hostModuleCheckLiveRequiredDeclsParseOk"

/-- Kernel entry def name. The body is &&, so it is not kept. -/
def needleCheckDef : String := "def checkRequiredDeclsKernel"

/-- Combined ok def name. The body is &&, so it is not kept. -/
def needleOkDef : String := "def hostModuleCheckRequiredDeclsKernelOk"

/-- Bar string in the live source. -/
def needleBar : String := "KERNEL-CHECK"

/-- Scope string in the live source. -/
def needleScope : String := "HostModuleCheckRequiredDecls-only"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Two imports. Bar is KERNEL-CHECK. Scope is HostModuleCheckRequiredDecls-only. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckRequiredDeclsKernelSource
  (src.splitOn needleImportHostKernel).length == 2
    && (src.splitOn needleImportRequiredDecls).length == 2
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleEnd).length == 2
    && (src.splitOn needleBarDef).length == 2
    && (src.splitOn needleScopeDef).length == 2
    && (src.splitOn needleDualOkDef).length == 2
    && (src.splitOn needleParseOkDef).length == 2
    && (src.splitOn needleCheckDef).length == 2
    && (src.splitOn needleOkDef).length == 2
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleScope).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckRequiredDeclsKernelReady,
    PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL,
    HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckRequiredDeclsKernelReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKREQUIREDDECLSKERNEL_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL")
    && (liveRel == "HostModuleCheckRequiredDeclsKernel.lean")
    && (liveHostModuleCheckRequiredDeclsKernelRel ==
        "src/systems/SystemsLean/HostModuleCheckRequiredDeclsKernel.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckRequiredDeclsKernelFullHost
    && !hostFrontLiveHostModuleCheckRequiredDeclsKernelFullBackend
    && !hostFrontLiveHostModuleCheckRequiredDeclsKernelResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckRequiredDeclsKernelProvablyUnlocked
    && kernelCheckLiveHostModuleCheckRequiredDeclsKernelSource
        liveHostModuleCheckRequiredDeclsKernelSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasBarLit
    && liveParseHasScopeLit
    && liveParseHasDualOkLit
    && liveParseSkippedAndBodies
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasModule
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckRequiredDeclsKernelSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckRequiredDeclsKernelRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckRequiredDeclsKernelRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckRequiredDeclsKernelRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckRequiredDeclsKernelRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckRequiredDeclsKernelSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckRequiredDeclsKernel.lean != liveHostModuleCheckRequiredDeclsKernelSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckRequiredDeclsKernel.lean")
  let r := parseLiveHostModuleCheckRequiredDeclsKernelSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL reject {reason}")
  | FrontResult.accept m =>
    let k :=
      if m.commands.length > kernelFuel then false
      else HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSKERNEL ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} bar={liveParseHasBarLit} scope={liveParseHasScopeLit} dual={liveParseHasDualOkLit} skipped={liveParseSkippedAndBodies} namespace={liveParseHasNs} end={liveParseHasEnd} module={liveParseHasModule} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckRequiredDeclsKernel parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckRequiredDeclsKernel parse false")
    unless hostFrontLiveHostModuleCheckRequiredDeclsKernelReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckRequiredDeclsKernelReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckRequiredDeclsKernelReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckRequiredDeclsKernel source was accepted"
      throw (IO.userError "empty HostModuleCheckRequiredDeclsKernel source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsKernel
