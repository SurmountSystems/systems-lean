/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckLlvmComposeTextTerm.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckLlvmComposeTextTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  Five imports: SystemsLean.HostModuleCheckSurface,
  SystemsLean.HostModuleCheckEmitPlanTerm,
  SystemsLean.HostModuleCheckRequiredDecls,
  SystemsLean.HostModuleCheckRequiredDeclsProduct, and
  SystemsLean.HostModuleCheckRequiredDeclsLater.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: those imports, the namespace, literal String
  and Bool defs, the skeleton suffix, and end. The closed run printed
  cmds=11.
  HostKernel accepts a String or Bool literal def, so those stay.
  Match, let, if, and string-join bodies stay in the source text
  (needles). Their bodies are not kernel terms. A zero-import parse
  is not this file.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  The provably flag stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKLLVMCOMPOSETEXTTERM_V0,
  PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM, liveRel,
  kernelCheckLiveHostModuleCheckLlvmComposeTextTermSource,
  hostFrontLiveHostModuleCheckLlvmComposeTextTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKLLVMCOMPOSETEXTTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckLlvmComposeTextTerm.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckLlvmComposeTextTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckLlvmComposeTextTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckLlvmComposeTextTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckLlvmComposeTextTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckLlvmComposeTextTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- Kept-command count printed by the closed run (cmds=11).
    From HostModuleCheckLlvmComposeTextTerm.lean. -/
def liveKeptCmds : Nat := 11

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

/-- Parse live HostModuleCheckLlvmComposeTextTerm.lean text.
    Greppable: parseLiveHostModuleCheckLlvmComposeTextTermSource,
    PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM. -/
def parseLiveHostModuleCheckLlvmComposeTextTermSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckLlvmComposeTextTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Greppable: kernelCheckLiveHostModuleCheckLlvmComposeTextTermSource,
    PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM. -/
def kernelCheckLiveHostModuleCheckLlvmComposeTextTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckLlvmComposeTextTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckLlvmComposeTextTermSource
      liveHostModuleCheckLlvmComposeTextTermSource with
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

/-- Five imports. Not zero.
    Surface, EmitPlanTerm, RequiredDecls, RequiredDeclsProduct,
    and RequiredDeclsLater. -/
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

/-- Term-surface bar is the string literal TERM-SURFACE. -/
def liveParseHasBar : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthLlvmComposeTextTermSurfaceBar"
          && s == "TERM-SURFACE"
      | _ => false

/-- Scope literal is LlvmComposeText-only. -/
def liveParseHasScope : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthLlvmComposeTextTermSurfaceScope"
          && s == "LlvmComposeText-only"
      | _ => false

/-- dualOk is the Bool literal true. -/
def liveParseHasDualOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.bool) (Term.litBool b) =>
        x.raw == "hostModuleCheckLlvmComposeTextTermSurfaceDualOk" && b == true
      | _ => false

/-- Skeleton suffix is one string literal. `++` is not kept.
    The source spells a backslash and n, not a newline. -/
def liveParseHasSuffix : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "hostModuleCheckLlvmComposeTextTermSkeletonSuffix"
          && s == "end SystemsLean.LlvmComposeText\\n"
      | _ => false

/-- Wrap module lastSeg is HostModuleCheckLlvmComposeTextTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckLlvmComposeTextTerm"
      && lastSeg m.name.raw == "HostModuleCheckLlvmComposeTextTerm"

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

/-- Import SystemsLean.HostModuleCheckSurface. -/
def needleImportSurface : String :=
  "import SystemsLean.HostModuleCheckSurface\n"

/-- Import SystemsLean.HostModuleCheckEmitPlanTerm. Not dropped. -/
def needleImportEmitPlan : String :=
  "import SystemsLean.HostModuleCheckEmitPlanTerm\n"

/-- Import SystemsLean.HostModuleCheckRequiredDecls. Not dropped. -/
def needleImportRequiredDecls : String :=
  "import SystemsLean.HostModuleCheckRequiredDecls\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsProduct. Not dropped. -/
def needleImportRequiredDeclsProduct : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsProduct\n"

/-- Import SystemsLean.HostModuleCheckRequiredDeclsLater. Not dropped. -/
def needleImportRequiredDeclsLater : String :=
  "import SystemsLean.HostModuleCheckRequiredDeclsLater\n"

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Term-surface bar def needle. -/
def needleBar : String :=
  "def checkDepthLlvmComposeTextTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Scope def needle. -/
def needleScope : String :=
  "def checkDepthLlvmComposeTextTermSurfaceScope : String := \"LlvmComposeText-only\"\n"

/-- dualOk def needle. -/
def needleDualOk : String :=
  "def hostModuleCheckLlvmComposeTextTermSurfaceDualOk : Bool := true\n"

/-- Ready-body checker needle. Body is a match, not a kernel atom. -/
def needleEmptyBody : String :=
  "def llvmComposeTextReadyBodyOk (content : String) : Bool :=\n"

/-- Dialect checker needle. -/
def needleDialect : String :=
  "def checkLlvmComposeTextTermDialect (content : String) : Option String :=\n"

/-- stageId target text. Present in the live source, not a kernel atom. -/
def needleEmptyStruct : String :=
  "SLAKE_LLVM_COMPOSE_TEXT_V0"

/-- Honesty pin body needle. Match result, not a kernel atom. -/
def needleCheckBody : String :=
  "body == \"false\""

/-- Ill-typed term reason. Not a kernel atom. -/
def needleExtractBody : String :=
  "some reasonIllTypedTerm"

/-- Surface gate needle. Not bare dualOk alone. -/
def needleSurfaceOk : String :=
  "def hostModuleCheckLlvmComposeTextTermSurfaceOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    Five imports. The live file does not have zero imports. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckLlvmComposeTextTermSource
  (src.splitOn needleImportSurface).length == 2
    && (src.splitOn needleImportEmitPlan).length == 2
    && (src.splitOn needleImportRequiredDecls).length == 2
    && (src.splitOn needleImportRequiredDeclsProduct).length == 2
    && (src.splitOn needleImportRequiredDeclsLater).length == 2
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
    Greppable: hostFrontLiveHostModuleCheckLlvmComposeTextTermReady,
    PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckLlvmComposeTextTermReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKLLVMCOMPOSETEXTTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM")
    && (liveRel == "HostModuleCheckLlvmComposeTextTerm.lean")
    && (liveHostModuleCheckLlvmComposeTextTermRel ==
        "src/systems/SystemsLean/HostModuleCheckLlvmComposeTextTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckLlvmComposeTextTermFullHost
    && !hostFrontLiveHostModuleCheckLlvmComposeTextTermFullBackend
    && !hostFrontLiveHostModuleCheckLlvmComposeTextTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckLlvmComposeTextTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckLlvmComposeTextTermSource
        liveHostModuleCheckLlvmComposeTextTermSource
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
  match parseLiveHostModuleCheckLlvmComposeTextTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckLlvmComposeTextTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckLlvmComposeTextTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckLlvmComposeTextTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckLlvmComposeTextTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckLlvmComposeTextTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckLlvmComposeTextTerm.lean != liveHostModuleCheckLlvmComposeTextTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckLlvmComposeTextTerm.lean")
  let r := parseLiveHostModuleCheckLlvmComposeTextTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKLLVMCOMPOSETEXTTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} bar={liveParseHasBar} scope={liveParseHasScope} dualOk={liveParseHasDualOk} suffix={liveParseHasSuffix} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckLlvmComposeTextTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckLlvmComposeTextTerm parse false")
    unless hostFrontLiveHostModuleCheckLlvmComposeTextTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckLlvmComposeTextTermReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckLlvmComposeTextTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckLlvmComposeTextTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckLlvmComposeTextTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckLlvmComposeTextTerm
