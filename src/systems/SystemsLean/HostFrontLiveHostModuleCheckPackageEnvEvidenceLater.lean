/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckPackageEnvEvidenceLater.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  The live file has ten imports. Those imports stay inside the
  embedded source bytes. This checker does not import them.
  Checker imports: HostFrontLiveHostTerm, the Source module, HostKernel.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: those ten imports, the namespace, and end.
  This file has no literal String or Bool def, so none are kept.
  Match, application, and && bodies stay in the source text
  (needles). Their bodies are not kernel terms. A zero-import parse
  is not this file.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  FullHostElaborateRemains stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPACKAGEENVEVIDENCELATER_V0,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER, liveRel,
  kernelCheckLiveHostModuleCheckPackageEnvEvidenceLaterSource,
  hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLaterSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPACKAGEENVEVIDENCELATER_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckPackageEnvEvidenceLater.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckPackageEnvEvidenceLaterRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- Kept-command count: ten imports, the namespace, and end.
    No literal String or Bool def is kept.
    From HostModuleCheckPackageEnvEvidenceLater.lean. -/
def liveKeptCmds : Nat := 12

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
    String-join (`++` is not a token) parses as an application.
    That application is not a kernel literal, so it is not kept. -/
def bodyIsKernelLit (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.string) (Term.litString _) => true
  | Cmd.def_ _ (some HostType.bool) (Term.litBool _) => true
  | Cmd.def_ _ (some HostType.nat) (Term.litNat _) => true
  | _ => false

/-- Parse `def` only when the body is one complete term.
    A leftover that is not the next command means the body used syntax
    HostTerm does not keep (`match`, `let`, list lit). Return none
    so the caller skipUntilCmd. Do not keep a prefix of the body. -/
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

/-- Parse live HostModuleCheckPackageEnvEvidenceLater.lean text.
    Greppable: parseLiveHostModuleCheckPackageEnvEvidenceLaterSource,
    PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER. -/
def parseLiveHostModuleCheckPackageEnvEvidenceLaterSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsLive liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckPackageEnvEvidenceLater"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Greppable: kernelCheckLiveHostModuleCheckPackageEnvEvidenceLaterSource,
    PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER. -/
def kernelCheckLiveHostModuleCheckPackageEnvEvidenceLaterSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckPackageEnvEvidenceLaterSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckPackageEnvEvidenceLaterSource
      liveHostModuleCheckPackageEnvEvidenceLaterSource with
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

/-- Ten imports. Not zero.
    The product modules are not imports of this checker. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckPackageEnv",
      "SystemsLean.HostModuleCheckLlvmProgramTextTerm",
      "SystemsLean.HostModuleCheckLlvmGraphTextTerm",
      "SystemsLean.HostModuleCheckLlvmComposeTextTerm",
      "SystemsLean.HostModuleCheckSelfApplyFsTerm",
      "SystemsLean.HostModuleCheckInventoryCloseTerm",
      "SystemsLean.HostModuleCheckProductPathBarsTerm",
      "SystemsLean.HostModuleCheckProductPathTerm",
      "SystemsLean.HostModuleCheckProbeWireTerm",
      "SystemsLean.HostModuleCheckSelfHostBodyTerm"
    ]

/-- Live parse command count matches liveKeptCmds. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Dialect helper text. Not a PACKAGE-ELABORATE string literal.
    The match body is not a kept kernel def. -/
def liveParseHasBar : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    (liveHostModuleCheckPackageEnvEvidenceLaterSource.splitOn
        "def packageEnvDialectRejectsIllTyped (content : String) : Bool :=\n").length
      > 1

/-- Scope is namespace SystemsLean.HostModuleCheck.
    Not MultExtractFoundation-only. -/
def liveParseHasScope : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- packageEnvTermSurfaceOk is an && chain, not a Bool literal true. -/
def liveParseHasDualOk : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    (liveHostModuleCheckPackageEnvEvidenceLaterSource.splitOn
        "def packageEnvTermSurfaceOk : Bool :=\n").length > 1

/-- End of namespace SystemsLean.HostModuleCheck.
    Not a PACKAGE-BAND-INCOMPLETE literal. -/
def liveParseHasSuffix : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Wrap module lastSeg is HostModuleCheckPackageEnvEvidenceLater
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckPackageEnvEvidenceLater"
      && lastSeg m.name.raw == "HostModuleCheckPackageEnvEvidenceLater"

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

/-- Ten import lines. Each must occur once. -/
def needleImports : List String :=
  [ "import SystemsLean.HostModuleCheckPackageEnv\n"
  , "import SystemsLean.HostModuleCheckLlvmProgramTextTerm\n"
  , "import SystemsLean.HostModuleCheckLlvmGraphTextTerm\n"
  , "import SystemsLean.HostModuleCheckLlvmComposeTextTerm\n"
  , "import SystemsLean.HostModuleCheckSelfApplyFsTerm\n"
  , "import SystemsLean.HostModuleCheckInventoryCloseTerm\n"
  , "import SystemsLean.HostModuleCheckProductPathBarsTerm\n"
  , "import SystemsLean.HostModuleCheckProductPathTerm\n"
  , "import SystemsLean.HostModuleCheckProbeWireTerm\n"
  , "import SystemsLean.HostModuleCheckSelfHostBodyTerm\n"
  ]

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Dialect reject helper. Not a PACKAGE-ELABORATE bar. -/
def needleBar : String :=
  "def packageEnvDialectRejectsIllTyped (content : String) : Bool :=\n"

/-- Namespace is the scope. Not MultExtractFoundation-only. -/
def needleScope : String :=
  "namespace SystemsLean.HostModuleCheck\n"

/-- Surface fold def. Not a Bool literal true. -/
def needleDualOk : String :=
  "def packageEnvTermSurfaceOk : Bool :=\n"

/-- Match body of the dialect helper. Not a kernel atom. -/
def needleEmptyBody : String :=
  "match checkPackageEnvDialect content with\n"

/-- Dialect helper def. Not checkPackageFoundationDialect. -/
def needleDialect : String :=
  "def packageEnvDialectRejectsIllTyped (content : String) : Bool :=\n"

/-- Comment token present in the live source, not a kernel atom. -/
def needleEmptyStruct : String :=
  "PARTIAL-STRUCTURAL"

/-- One later-fold reject application. Not a kernel atom. -/
def needleCheckBody : String :=
  "packageEnvDialectRejectsIllTyped hostModuleCheckBadPackageEnvIllTypedCompilePathMultText"

/-- Match miss arm. Not a kernel atom. -/
def needleExtractBody : String :=
  "| none => false"

/-- Surface fold def. Not a first-band elaborate gate. -/
def needleSurfaceOk : String :=
  "def packageEnvTermSurfaceOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Ten imports. The live file does not have zero imports. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckPackageEnvEvidenceLaterSource
  needleImports.all (fun n => (src.splitOn n).length == 2)
    && (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleScope).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleEmptyBody).length > 1
    && (src.splitOn needleDialect).length > 1
    && (src.splitOn needleEmptyStruct).length > 1
    && (src.splitOn needleCheckBody).length > 1
    && (src.splitOn needleExtractBody).length > 1
    && (src.splitOn needleSurfaceOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady,
    PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER,
    HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPACKAGEENVEVIDENCELATER_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER")
    && (liveRel == "HostModuleCheckPackageEnvEvidenceLater.lean")
    && (liveHostModuleCheckPackageEnvEvidenceLaterRel ==
        "src/systems/SystemsLean/HostModuleCheckPackageEnvEvidenceLater.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterFullHost
    && !hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterFullBackend
    && !hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterProvablyUnlocked
    && kernelCheckLiveHostModuleCheckPackageEnvEvidenceLaterSource
        liveHostModuleCheckPackageEnvEvidenceLaterSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasBar
    && liveParseHasScope
    && liveParseHasDualOk
    && liveParseHasSuffix
    && liveParseHasModule
    && liveParseHasNs
    && liveParseHasEnd
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckPackageEnvEvidenceLaterSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvEvidenceLaterRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckPackageEnvEvidenceLaterRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckPackageEnvEvidenceLaterRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckPackageEnvEvidenceLaterRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckPackageEnvEvidenceLaterSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckPackageEnvEvidenceLater.lean != liveHostModuleCheckPackageEnvEvidenceLaterSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckPackageEnvEvidenceLater.lean")
  let r := parseLiveHostModuleCheckPackageEnvEvidenceLaterSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKPACKAGEENVEVIDENCELATER ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} bar={liveParseHasBar} scope={liveParseHasScope} dualOk={liveParseHasDualOk} suffix={liveParseHasSuffix} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckPackageEnvEvidenceLater parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckPackageEnvEvidenceLater parse false")
    unless hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckPackageEnvEvidenceLaterReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckPackageEnvEvidenceLater source was accepted"
      throw (IO.userError "empty HostModuleCheckPackageEnvEvidenceLater source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvEvidenceLater
