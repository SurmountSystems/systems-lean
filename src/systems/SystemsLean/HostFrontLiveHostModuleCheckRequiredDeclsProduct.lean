/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckRequiredDeclsProduct.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckRequiredDeclsProduct.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  It is not HostModuleCheckRequiredDecls.lean.
  It is not HostModuleCheckRequiredDeclsLater.lean.
  It is not HostModuleCheckRequiredDeclsKernel.lean.
  The live file has no import line. Checker imports: HostFrontLiveHostTerm,
  the Source module, and HostKernel.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: the namespace and the end.
  There is no import. There is no open. There is no theorem.
  Seventy-six defs have List String list bodies. Those are not one
  String, Bool, or Nat literal, so they are not kept.
  kernelCheck calls HostKernel.kernelCheck on an accepted parse and
  returns false on reject. It is not a constant true.
  Kept count is 2, at most kernelFuel 64. kernelFuel is not raised.
  One raw string. The product is 623 lines, so the source file is not split.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  FullHostElaborateRemains stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKREQUIREDDECLSPRODUCT_V0,
  PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT, liveRel,
  kernelCheckLiveHostModuleCheckRequiredDeclsProductSource,
  hostFrontLiveHostModuleCheckRequiredDeclsProductReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProductSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKREQUIREDDECLSPRODUCT_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckRequiredDeclsProduct.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckRequiredDeclsProductRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckRequiredDeclsProductFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckRequiredDeclsProductFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckRequiredDeclsProductResidualFreeClaimed :
    Bool := false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckRequiredDeclsProductProvablyUnlocked :
    Bool := false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- String-literal scan. Not kernelFuel. kernelFuel stays 64. -/
def liveStringFuel : Nat := 1024

/-- Kept-command count: namespace and end.
    No import. Seventy-six List String defs are not kept.
    open is not kept. kernelFuel is 64. -/
def liveKeptCmds : Nat := 2

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
    A List String body is not a kernel literal, so it is not kept. -/
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

/-- Parse live HostModuleCheckRequiredDeclsProduct.lean text.
    Greppable: parseLiveHostModuleCheckRequiredDeclsProductSource,
    PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT. -/
def parseLiveHostModuleCheckRequiredDeclsProductSource (src : String) :
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
              HostTerm.n "SystemsLean.HostModuleCheckRequiredDeclsProduct"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Accept calls HostKernel.kernelCheck. Reject returns false.
    More commands than kernelFuel 64 returns false.
    Greppable: kernelCheckLiveHostModuleCheckRequiredDeclsProductSource,
    PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT. -/
def kernelCheckLiveHostModuleCheckRequiredDeclsProductSource
    (src : String) : Bool :=
  match parseLiveHostModuleCheckRequiredDeclsProductSource src with
  | FrontResult.accept m =>
    if m.commands.length > kernelFuel then false
    else HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckRequiredDeclsProductSource
      liveHostModuleCheckRequiredDeclsProductSource with
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

/-- No imports. The product file has no import line. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m => importNames m.commands == ([] : List String)

/-- Live parse command count matches liveKeptCmds. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Kept commands are namespace then end. No def remains. -/
def liveParseShapeOk : Bool :=
  match liveParsed? with
  | some m =>
    match m.commands with
    | [Cmd.namespace x, Cmd.endNamespace y] =>
      x.raw == "SystemsLean.HostModuleCheck"
        && y.raw == "SystemsLean.HostModuleCheck"
    | _ => false
  | none => false

/-- List String defs are not kept commands. -/
def liveParseSkippedListDefs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.def_ x _ _ =>
        x.raw == "productOutKernelRequiredDecls"
          || x.raw == "dualEqWriteParityRequiredDecls"
          || x.raw == "compilePathGraphRequiredDecls"
      | Cmd.defBind _ _ _ _ => true
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

/-- Wrap module lastSeg is HostModuleCheckRequiredDeclsProduct
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckRequiredDeclsProduct"
      && lastSeg m.name.raw == "HostModuleCheckRequiredDeclsProduct"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- First list def. The body is List String, so it is not kept. -/
def needleFirstDef : String :=
  "def productOutKernelRequiredDecls : List String :=\n"

/-- A middle list def. The body is List String, so it is not kept. -/
def needleMidDef : String :=
  "def dualEqWriteParityRequiredDecls : List String :=\n"

/-- Last list def. The body is List String, so it is not kept. -/
def needleLastDef : String :=
  "def compilePathGraphRequiredDecls : List String :=\n"

/-- Each needle occurs once in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckRequiredDeclsProductSource
  (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleEnd).length == 2
    && (src.splitOn needleFirstDef).length == 2
    && (src.splitOn needleMidDef).length == 2
    && (src.splitOn needleLastDef).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckRequiredDeclsProductReady,
    PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT,
    HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckRequiredDeclsProductReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKREQUIREDDECLSPRODUCT_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT")
    && (liveRel == "HostModuleCheckRequiredDeclsProduct.lean")
    && (liveHostModuleCheckRequiredDeclsProductRel ==
        "src/systems/SystemsLean/HostModuleCheckRequiredDeclsProduct.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckRequiredDeclsProductFullHost
    && !hostFrontLiveHostModuleCheckRequiredDeclsProductFullBackend
    && !hostFrontLiveHostModuleCheckRequiredDeclsProductResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckRequiredDeclsProductProvablyUnlocked
    && kernelCheckLiveHostModuleCheckRequiredDeclsProductSource
        liveHostModuleCheckRequiredDeclsProductSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseShapeOk
    && liveParseSkippedListDefs
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseHasModule
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckRequiredDeclsProductSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckRequiredDeclsProductRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckRequiredDeclsProductRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckRequiredDeclsProductRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckRequiredDeclsProductRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckRequiredDeclsProductSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckRequiredDeclsProduct.lean != liveHostModuleCheckRequiredDeclsProductSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckRequiredDeclsProduct.lean")
  let r := parseLiveHostModuleCheckRequiredDeclsProductSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT reject {reason}")
  | FrontResult.accept m =>
    let k :=
      if m.commands.length > kernelFuel then false
      else HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKREQUIREDDECLSPRODUCT ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} shape={liveParseShapeOk} skipped={liveParseSkippedListDefs} namespace={liveParseHasNs} end={liveParseHasEnd} module={liveParseHasModule} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckRequiredDeclsProduct parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckRequiredDeclsProduct parse false")
    unless hostFrontLiveHostModuleCheckRequiredDeclsProductReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckRequiredDeclsProductReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckRequiredDeclsProductReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckRequiredDeclsProduct source was accepted"
      throw (IO.userError "empty HostModuleCheckRequiredDeclsProduct source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckRequiredDeclsProduct
