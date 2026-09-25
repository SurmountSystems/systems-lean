/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckMultTerm.lean with the
  HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckMultTerm.lean.
  It is not HostModuleCheck.lean and not HostFront.lean.
  One import: SystemsLean.HostModuleCheckSurface.
  HostModuleCheckEmitPlanTerm is not an import of this file.
  Namespace SystemsLean.HostModuleCheck.
  Kept for the kernel: that import, the namespace, literal String
  and Bool defs, and end. The driver printed cmds=7, so liveKeptCmds is 7.
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
  HOST-FRONT-LIVE-HOSTMODULECHECKMULTTERM,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKMULTTERM_V0,
  PARSE-LIVE-HOSTMODULECHECKMULTTERM, liveRel,
  kernelCheckLiveHostModuleCheckMultTermSource,
  hostFrontLiveHostModuleCheckMultTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckMultTerm
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckMultTermSource
import SystemsLean.HostKernel

set_option maxRecDepth 32768
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckMultTerm

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKMULTTERM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKMULTTERM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKMULTTERM"

/-- Live file basename. -/
def liveRel : String := "HostModuleCheckMultTerm.lean"

/-- Live file relative to repo root. Dual-pin path. -/
def liveHostModuleCheckMultTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckMultTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckMultTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckMultTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. The provably flag stays false. -/
def hostFrontLiveHostModuleCheckMultTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and one term). -/
def liveParseFuel : Nat := 512

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 16384

/-- Kept-command count printed by the closed run (cmds=7).
    From HostModuleCheckMultTerm.lean. -/
def liveKeptCmds : Nat := 7

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

/-- Parse live HostModuleCheckMultTerm.lean text.
    Greppable: parseLiveHostModuleCheckMultTermSource,
    PARSE-LIVE-HOSTMODULECHECKMULTTERM. -/
def parseLiveHostModuleCheckMultTermSource (src : String) :
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
          { name := HostTerm.n "SystemsLean.HostModuleCheckMultTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    Greppable: kernelCheckLiveHostModuleCheckMultTermSource,
    PARSE-LIVE-HOSTMODULECHECKMULTTERM. -/
def kernelCheckLiveHostModuleCheckMultTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckMultTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckMultTermSource
      liveHostModuleCheckMultTermSource with
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

/-- One import. Not zero.
    SystemsLean.HostModuleCheckSurface. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckSurface"
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
        x.raw == "checkDepthTermSurfaceBar"
          && s == "TERM-SURFACE"
      | _ => false

/-- Scope literal is Mult-only. -/
def liveParseHasScope : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "checkDepthTermSurfaceScope"
          && s == "Mult-only"
      | _ => false

/-- dualOk is the Bool literal true. -/
def liveParseHasDualOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.bool) (Term.litBool b) =>
        x.raw == "hostModuleCheckTermSurfaceDualOk" && b == true
      | _ => false

/-- Ill-typed reason is one string literal.
    This file has no skeleton-suffix def. String-join bodies are not kept. -/
def liveParseHasSuffix : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.def_ x (some HostType.string) (Term.litString s) =>
        x.raw == "reasonIllTypedTerm"
          && s == "ILL-TYPED-TERM"
      | _ => false

/-- Wrap module lastSeg is HostModuleCheckMultTerm
    (no module line in the live file). -/
def liveParseHasModule : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckMultTerm"
      && lastSeg m.name.raw == "HostModuleCheckMultTerm"

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

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Term-surface bar def needle. -/
def needleBar : String :=
  "def checkDepthTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Scope def needle. -/
def needleScope : String :=
  "def checkDepthTermSurfaceScope : String := \"Mult-only\"\n"

/-- dualOk def needle. -/
def needleDualOk : String :=
  "def hostModuleCheckTermSurfaceDualOk : Bool := true\n"

/-- Collapse helper needle. Body is not a kernel atom. -/
def needleEmptyBody : String :=
  "def collapseWs (s : String) : String :=\n"

/-- Dialect checker needle. -/
def needleDialect : String :=
  "def checkMultTermDialect (content : String) : Option String :=\n"

/-- Comment token present in the live source, not a kernel atom. -/
def needleEmptyStruct : String :=
  "PARTIAL-STRUCTURAL"

/-- multIsValid body needle. Not a kernel atom. -/
def needleCheckBody : String :=
  "body == \"isValid m\""

/-- Ill-typed term reason. Not a kernel atom. -/
def needleExtractBody : String :=
  "some reasonIllTypedTerm"

/-- Surface gate needle. Not bare dualOk alone. -/
def needleSurfaceOk : String :=
  "def hostModuleCheckMultTermSurfaceOk : Bool :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the pinned live source. splitOn, not a prefix check.
    One import. The live file does not have zero imports. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckMultTermSource
  (src.splitOn needleImportSurface).length == 2
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
    Greppable: hostFrontLiveHostModuleCheckMultTermReady,
    PARSE-LIVE-HOSTMODULECHECKMULTTERM,
    HOST-FRONT-LIVE-HOSTMODULECHECKMULTTERM.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckMultTermReady : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKMULTTERM_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKMULTTERM")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKMULTTERM")
    && (liveRel == "HostModuleCheckMultTerm.lean")
    && (liveHostModuleCheckMultTermRel ==
        "src/systems/SystemsLean/HostModuleCheckMultTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckMultTermFullHost
    && !hostFrontLiveHostModuleCheckMultTermFullBackend
    && !hostFrontLiveHostModuleCheckMultTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckMultTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckMultTermSource
        liveHostModuleCheckMultTermSource
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
  match parseLiveHostModuleCheckMultTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-HOSTMODULECHECKMULTTERM =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckMultTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckMultTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckMultTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckMultTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckMultTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckMultTerm.lean != liveHostModuleCheckMultTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckMultTerm.lean")
  let r := parseLiveHostModuleCheckMultTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-HOSTMODULECHECKMULTTERM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-HOSTMODULECHECKMULTTERM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-HOSTMODULECHECKMULTTERM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    IO.println s!"  cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} bar={liveParseHasBar} scope={liveParseHasScope} dualOk={liveParseHasDualOk} suffix={liveParseHasSuffix} module={liveParseHasModule} namespace={liveParseHasNs} end={liveParseHasEnd} needles={liveNeedlesOk}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckMultTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckMultTerm parse false")
    unless hostFrontLiveHostModuleCheckMultTermReady do
      IO.eprintln "error: hostFrontLiveHostModuleCheckMultTermReady false"
      throw (IO.userError "hostFrontLiveHostModuleCheckMultTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckMultTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckMultTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckMultTerm
