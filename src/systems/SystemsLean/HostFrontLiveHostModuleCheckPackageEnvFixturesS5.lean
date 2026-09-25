/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckPackageEnvFixturesS5.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckPackageEnvFixturesS5.
  Reuses HostFrontLiveHostTerm skip-fold. Not HostFront G1.
  Not HostTerm.multFixtureModule.
  Not parseLiveHostTermSource on this text.
  Not compose text.

  Spec (readable):
  - parseLiveHostModuleCheckPackageEnvFixturesS5Source turns live
    HostModuleCheckPackageEnvFixturesS5.lean text into HostTerm.Module.
  - Module name is SystemsLean.HostModuleCheckPackageEnvFixturesS5
    even without a module line.
  - Imports are this product's twenty-seven column-0
    SystemsLean.HostModuleCheck* imports.
  - A fixture line whose trimmed text starts with a quoted import can be
    tokenized as a real import. String concatenation defs are not kept.
  - kernelCheckLiveHostModuleCheckPackageEnvFixturesS5Source is
    HostKernel.kernelCheck of that parse. On reject it is false.
  - String concatenation defs are not single kernel literals.
    They stay in the source text. A literal String, Bool, or Nat
    def would be kept. This file's concatenation defs are skipped.
  - Namespace and end remain. An extra end whose raw name is == is not
    a failure when any end still matches SystemsLean.HostModuleCheck.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live HostTerm.lean / HostFront.lean.
  - Not occupancy name 50. Host tools stay 69 of 69.
  - Not an LLVM backend. Not Lake-gone. Not PROVABLY.
  - Not freestanding residual free.
  - Not the package walk. slakeOwnsPackageTypecheck stays false.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5,
  SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPACKAGEENVFIXTURESS5_V0,
  PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5,
  parseLiveHostModuleCheckPackageEnvFixturesS5Source,
  kernelCheckLiveHostModuleCheckPackageEnvFixturesS5Source,
  hostFrontLiveHostModuleCheckPackageEnvFixturesS5Ready,
  liveHostModuleCheckPackageEnvFixturesS5Source, liveRel,
  UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5
  Red/green: lean --run of the SlakeTypecheck driver (no lake; no mill).
  Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5Source
import SystemsLean.HostKernel

set_option maxRecDepth 131072
set_option maxHeartbeats 100000000

namespace SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPACKAGEENVFIXTURESS5_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckPackageEnvFixturesS5FullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckPackageEnvFixturesS5FullBackend : Bool :=
  false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckPackageEnvFixturesS5ResidualFreeClaimed :
    Bool := false

/-- Honesty: not PROVABLY. -/
def hostFrontLiveHostModuleCheckPackageEnvFixturesS5ProvablyUnlocked :
    Bool := false

/-- Parse fuel for the command fold. -/
def liveParseFuel : Nat := 512

/-- Fuel for one literal def body. Non-literals are not parsed. -/
def liveTermFuel : Nat := 64

/-- Skip fuel for defs whose bodies are not kernel literals. -/
def liveSkipFuel : Nat := 65536

/-- Kept commands from the accepted parse. Twenty-nine is under kernelFuel 64. -/
def liveKeptCmds : Nat := 29

/-- Dotted ident `SystemsLean . HostModuleCheckPackageEnvFixturesS5`. -/
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

/-- Names a command adds to the known-const set. Imports do not. -/
def cmdAddsLive (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- A typed def whose body is one String, Bool, or Nat literal. -/
def bodyIsKernelLit (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ (some HostType.string) (Term.litString _) => true
  | Cmd.def_ _ (some HostType.bool) (Term.litBool _) => true
  | Cmd.def_ _ (some HostType.nat) (Term.litNat _) => true
  | _ => false

/-- True when the body token can be one kernel literal.
    Match, application, and && chains are not literals. -/
def bodyTokIsLit (t : String) : Bool :=
  t == "true" || t == "false" || isStringLit t || isNatLit t

/-- Parse `def` only when the body is one literal term.
    Anything else returns none so the caller skipUntilCmd.
    Do not keep a prefix of a match or && body. -/
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
          match bodyToks with
          | t :: _ =>
            if !bodyTokIsLit t then none
            else
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
                    | u :: _ => isCmdKw u
                  if !complete then none
                  else
                    let rest5 := skipNonCmd liveSkipFuel rest4
                    if bs.isEmpty then
                      some (Cmd.def_ dn (some ty) body, rest5)
                    else
                      let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                      some (Cmd.defBind dn nbs retTy body, rest5)
          | [] => none
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
    | some (dname, rest2) => parseDefLive liveTermFuel dname rest2
    | none => none
  | _ => none

/-- Keep imports, namespace, end, and literal defs.
    Drop defBind and non-literal defs. -/
def keepParsed (kn : List String) (c : Cmd) : Bool :=
  match c with
  | Cmd.def_ _ _ _ => bodyIsKernelLit c && cmdBodyKnown kn c
  | Cmd.defBind _ _ _ _ => false
  | _ => true

/-- Fold commands. Skip defs whose bodies are not kernel literals. -/
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

/-- Parse live HostModuleCheckPackageEnvFixturesS5.lean text.
    Greppable: parseLiveHostModuleCheckPackageEnvFixturesS5Source,
    PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5. -/
def parseLiveHostModuleCheckPackageEnvFixturesS5Source (src : String) :
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
          { name :=
              HostTerm.n "SystemsLean.HostModuleCheckPackageEnvFixturesS5"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture. Not a hardcoded true.
    On accept this is HostKernel.kernelCheck. On reject this is false.
    Greppable: kernelCheckLiveHostModuleCheckPackageEnvFixturesS5Source. -/
def kernelCheckLiveHostModuleCheckPackageEnvFixturesS5Source (src : String) :
    Bool :=
  match parseLiveHostModuleCheckPackageEnvFixturesS5Source src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckPackageEnvFixturesS5Source
      liveHostModuleCheckPackageEnvFixturesS5Source with
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

/-- Twenty-seven column-0 imports. Not zero. -/
def liveParseImportsOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    importNames m.commands == [
      "SystemsLean.HostModuleCheckPackageEnvFixturesU2",
      "SystemsLean.HostModuleCheckCompilePathTerm",
      "SystemsLean.HostModuleCheckJoinMapTerm",
      "SystemsLean.HostModuleCheckSelfHostTerm",
      "SystemsLean.HostModuleCheckSurfaceMatrixTerm",
      "SystemsLean.HostModuleCheckSpecProofTerm",
      "SystemsLean.HostModuleCheckDualResidualTerm",
      "SystemsLean.HostModuleCheckProductPathTerm",
      "SystemsLean.HostModuleCheckProbeWireTerm",
      "SystemsLean.HostModuleCheckCompilePathMultTerm",
      "SystemsLean.HostModuleCheckCompilePathLinearTerm",
      "SystemsLean.HostModuleCheckCompilePathTypesTerm",
      "SystemsLean.HostModuleCheckCompilePathProgramTerm",
      "SystemsLean.HostModuleCheckCompilePathGraphTerm",
      "SystemsLean.HostModuleCheckCompilePathComposeTerm",
      "SystemsLean.HostModuleCheckCompilePathErasureTerm",
      "SystemsLean.HostModuleCheckCompilePathExtractTerm",
      "SystemsLean.HostModuleCheckCompilePathPlanTerm",
      "SystemsLean.HostModuleCheckCompilePathApplyTerm",
      "SystemsLean.HostModuleCheckCompilePathBodyTerm",
      "SystemsLean.HostModuleCheckFirstSurfaceTerm",
      "SystemsLean.HostModuleCheckLinearSubsetEmitTerm",
      "SystemsLean.HostModuleCheckTypesSubsetEmitTerm",
      "SystemsLean.HostModuleCheckProgramSubsetEmitTerm",
      "SystemsLean.HostModuleCheckGraphSubsetEmitTerm",
      "SystemsLean.HostModuleCheckComposeSubsetEmitTerm",
      "SystemsLean.HostModuleCheckErasureSubsetEmitTerm"
    ]

/-- Live parse command count matches liveKeptCmds. Under kernelFuel 64. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds && m.commands.length <= 64
  | none => false

/-- Namespace is SystemsLean.HostModuleCheck. -/
def liveParseHasNs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.namespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- End of namespace SystemsLean.HostModuleCheck.
    An extra end whose raw name is == still leaves this true. -/
def liveParseHasEnd : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.endNamespace x => x.raw == "SystemsLean.HostModuleCheck"
      | _ => false

/-- Module name is this product. There is no module line in the live file. -/
def liveParseModuleNameOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckPackageEnvFixturesS5"
      && lastSeg m.name.raw == "HostModuleCheckPackageEnvFixturesS5"

/-- The twenty-seven import lines. Each must occur once. -/
def needleImports : List String :=
  [ "import SystemsLean.HostModuleCheckPackageEnvFixturesU2\n"
  , "import SystemsLean.HostModuleCheckCompilePathTerm\n"
  , "import SystemsLean.HostModuleCheckJoinMapTerm\n"
  , "import SystemsLean.HostModuleCheckSelfHostTerm\n"
  , "import SystemsLean.HostModuleCheckSurfaceMatrixTerm\n"
  , "import SystemsLean.HostModuleCheckSpecProofTerm\n"
  , "import SystemsLean.HostModuleCheckDualResidualTerm\n"
  , "import SystemsLean.HostModuleCheckProductPathTerm\n"
  , "import SystemsLean.HostModuleCheckProbeWireTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathMultTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathLinearTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathTypesTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathProgramTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathGraphTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathComposeTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathErasureTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathExtractTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathPlanTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathApplyTerm\n"
  , "import SystemsLean.HostModuleCheckCompilePathBodyTerm\n"
  , "import SystemsLean.HostModuleCheckFirstSurfaceTerm\n"
  , "import SystemsLean.HostModuleCheckLinearSubsetEmitTerm\n"
  , "import SystemsLean.HostModuleCheckTypesSubsetEmitTerm\n"
  , "import SystemsLean.HostModuleCheckProgramSubsetEmitTerm\n"
  , "import SystemsLean.HostModuleCheckGraphSubsetEmitTerm\n"
  , "import SystemsLean.HostModuleCheckComposeSubsetEmitTerm\n"
  , "import SystemsLean.HostModuleCheckErasureSubsetEmitTerm\n"
  ]

/-- Namespace line. The comment form with a trailing dot is a different string. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Good S5 package-env text def. Not a single kernel literal. -/
def needleS5 : String :=
  "def hostModuleCheckGoodPackageEnvS5Text : String :=\n"

/-- Ill-typed CompilePath text def. Not a single kernel literal. -/
def needleCompilePath : String :=
  "def hostModuleCheckBadPackageEnvIllTypedCompilePathText : String :=\n"

/-- Comment token present in the live source, not a kernel atom. -/
def needlePartial : String := "PARTIAL-STRUCTURAL"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each kept needle occurs once in the pinned live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckPackageEnvFixturesS5Source
  needleImports.all (fun n => (src.splitOn n).length == 2)
    && (src.splitOn needleNamespace).length == 2
    && (src.splitOn needleS5).length == 2
    && (src.splitOn needleCompilePath).length == 2
    && (src.splitOn needlePartial).length == 2
    && (src.splitOn needleEnd).length == 2

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckPackageEnvFixturesS5Ready.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckPackageEnvFixturesS5Ready : Bool :=
  (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOSTMODULECHECKPACKAGEENVFIXTURESS5_V0")
    && (hostId == "HOST-FRONT-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5")
    && (parseId == "PARSE-LIVE-HOSTMODULECHECKPACKAGEENVFIXTURESS5")
    && (liveRel == "HostModuleCheckPackageEnvFixturesS5.lean")
    && (liveHostModuleCheckPackageEnvFixturesS5Rel ==
        "src/systems/SystemsLean/" ++ liveRel)
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckPackageEnvFixturesS5FullHost
    && !hostFrontLiveHostModuleCheckPackageEnvFixturesS5FullBackend
    && !hostFrontLiveHostModuleCheckPackageEnvFixturesS5ResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckPackageEnvFixturesS5ProvablyUnlocked
    && kernelCheckLiveHostModuleCheckPackageEnvFixturesS5Source
        liveHostModuleCheckPackageEnvFixturesS5Source
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseImportsOk
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseModuleNameOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckPackageEnvFixturesS5Source "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not a mill row. -/

def runLiveHostModuleCheckPackageEnvFixturesS5 (root : System.FilePath) :
    IO Unit := do
  IO.println s!"== {stageId}: {parseId} =="
  IO.println s!"liveRel={liveRel}"
  IO.println s!"  host={hostId} file={liveHostModuleCheckPackageEnvFixturesS5Rel}"
  let path := root / liveHostModuleCheckPackageEnvFixturesS5Rel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckPackageEnvFixturesS5Rel}"
    throw (IO.userError s!"missing {liveHostModuleCheckPackageEnvFixturesS5Rel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckPackageEnvFixturesS5Source then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckPackageEnvFixturesS5.lean != liveHostModuleCheckPackageEnvFixturesS5Source"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckPackageEnvFixturesS5.lean")
  let r := parseLiveHostModuleCheckPackageEnvFixturesS5Source disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let n := m.commands.length
    if n > 64 then
      IO.println s!"cmds={n}"
      IO.eprintln s!"error: command count {n} past kernelFuel 64"
      throw (IO.userError s!"command count {n} past kernelFuel 64")
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={n} kernelCheck={k}"
    IO.println s!"kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckPackageEnvFixturesS5 parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckPackageEnvFixturesS5 parse false")
    unless hostFrontLiveHostModuleCheckPackageEnvFixturesS5Ready do
      IO.eprintln s!"error: hostFrontLiveHostModuleCheckPackageEnvFixturesS5Ready false cmdCount={liveParseCmdCountOk} imports={liveParseImportsOk} ns={liveParseHasNs} end={liveParseHasEnd} module={liveParseModuleNameOk} needles={liveNeedlesOk} noCheck={liveParseHasNoCheckCmd}"
      throw (IO.userError "hostFrontLiveHostModuleCheckPackageEnvFixturesS5Ready false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty source must reject"
      throw (IO.userError "empty source must reject")
    IO.println s!"GREEN {stageId}: live HostModuleCheckPackageEnvFixturesS5.lean parse kernelCheck; host tools stay 69 of 69"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveHostModuleCheckPackageEnvFixturesS5 root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckPackageEnvFixturesS5
