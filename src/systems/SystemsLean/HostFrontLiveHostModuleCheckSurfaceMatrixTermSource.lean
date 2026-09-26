/-
  SYSTEMS_LEAN_HOST partial -- parse live
  src/systems/SystemsLean/HostModuleCheckSurfaceMatrixTerm.lean
  with the HostFrontLiveHostTerm skip-fold, then HostKernel.kernelCheck
  of that parse.
  Ready is that conjunction, not a hardcoded true.
  This wrap is HostModuleCheckSurfaceMatrixTerm.lean.
  It is not a neighbor product file.
  Kept: two imports, namespace SystemsLean.HostModuleCheck,
  four literal defs, and end. Open lines are absent. App bodies,
  match bodies, and theorems are skipped. theorem count is 2.
  example and set_option counts are 0.
  Not an LLVM backend.
  FullBackend stays false. FullHost stays false.
  Not Lake-gone. Not Slake typechecking src/systems as a compiler.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Greppable: SYSTEMS_LEAN_HOST,
  HOST-FRONT-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM,
  SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SURFACE_MATRIX_TERM_V0,
  PARSE-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM, liveRel,
  kernelCheckLiveHostModuleCheckSurfaceMatrixTermSource,
  hostFrontLiveHostModuleCheckSurfaceMatrixTermReady.
  Module: SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveHostTerm
import SystemsLean.HostKernel

set_option maxRecDepth 8192
set_option maxHeartbeats 2000000

namespace SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveExtract
open SystemsLean.HostFrontLiveHostTerm

/-- Greppable primary stage id. -/
def stageId : String :=
  "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SURFACE_MATRIX_TERM_V0"

/-- Greppable host map id. -/
def hostId : String :=
  "HOST-FRONT-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM"

/-- Greppable parse id. -/
def parseId : String :=
  "PARSE-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM"

/-- Live file basename. Greppable: liveRel. Must be the bare product name. -/
def liveRel : String := "HostModuleCheckSurfaceMatrixTerm.lean"

/-- Live file relative to repo root. -/
def liveHostModuleCheckSurfaceMatrixTermRel : String :=
  "src/systems/SystemsLean/" ++ liveRel

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

/-- Honesty: FullHost stays false. -/
def hostFrontLiveHostModuleCheckSurfaceMatrixTermFullHost : Bool := false

/-- Honesty: this wrap is not an LLVM backend. FullBackend stays false. -/
def hostFrontLiveHostModuleCheckSurfaceMatrixTermFullBackend : Bool := false

/-- Honesty: not product residual free. -/
def hostFrontLiveHostModuleCheckSurfaceMatrixTermResidualFreeClaimed : Bool :=
  false

/-- Honesty: this wrap is not PROVABLY. -/
def hostFrontLiveHostModuleCheckSurfaceMatrixTermProvablyUnlocked : Bool :=
  false

/-- Parse fuel (command fold and dotted names). -/
def liveParseFuel : Nat := 256

/-- Skip fuel for defs whose bodies are not kernel-checkable. -/
def liveSkipFuel : Nat := 8192

/-- Kept commands from this parse: two imports, namespace,
    four literal defs, and end. -/
def liveKeptCmds : Nat := 8

/-- theorem keyword count. Two theorem commands are skip-folded. -/
def liveTheoremCount : Nat := 2

/-- example keyword count. The live file has no example command. -/
def liveExampleCount : Nat := 0

/-- set_option keyword count. The live file has no set_option command. -/
def liveSetOptionCount : Nat := 0

/-- Import commands kept. Two import lines. -/
def liveImportCount : Nat := 2

/-- On-disk HostModuleCheckSurfaceMatrixTerm.lean bytes.
    Greppable: liveHostModuleCheckSurfaceMatrixTermSource. -/
def liveHostModuleCheckSurfaceMatrixTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- SurfaceMatrix L2 term-surface (S4 host unit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: SurfaceMatrix dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  SurfaceMatrix L2 dialect subset (documented; not full Lean 4 elaborator):
  - stageId body "SLAKE_SURFACE_MATRIX_V0".
  - hostSurfaceMatrixId body "HOST-SURFACE-MATRIX".
  - surfaceMatrixId body "SURFACE-MATRIX".
  - inventoryDocPath body "src/systems/surface-matrix.md".
  - hostModulePath body "src/systems/SystemsLean/SurfaceMatrix.lean".

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckSurfaceMatrixTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckSurfaceMatrixTermSurfaceOk.

  Intentional non-claims:
  - Surface inventory dialect only -- not mathlib, not full elaborator parity.
  - Not FullHost re-true. Not claim B re-open.
  - Mult..JoinMap + SelfHost TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckSurfaceMatrixTerm, TERM-SURFACE, SurfaceMatrix-only,
  ILL-TYPED-TERM, checkSurfaceMatrixTermDialect,
  hostModuleCheckBadSurfaceMatrixStageIdText,
  hostModuleCheckBadSurfaceMatrixHostIdText,
  hostModuleCheckBadSurfaceMatrixMapIdText,
  hostModuleCheckBadSurfaceMatrixPathText,
  hostModuleCheckSurfaceMatrixTermDialectOk,
  hostModuleCheckSurfaceMatrixTermSurfaceDualOk,
  hostModuleCheckSurfaceMatrixTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckSurfaceMatrixTerm
  Red/green: lake build SystemsLean.HostModuleCheckSurfaceMatrixTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm

namespace SystemsLean.HostModuleCheck

/-! ### SurfaceMatrix L2 term-surface dual-ok pins (SurfaceMatrix-only) -/

def checkDepthSurfaceMatrixTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthSurfaceMatrixTermSurfaceScope : String := "SurfaceMatrix-only"
def hostModuleCheckSurfaceMatrixTermSurfaceDualOk : Bool := true

def surfaceMatrixStageIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stageId" with
  | none => false
  | some body => body == "\"SLAKE_SURFACE_MATRIX_V0\""

def surfaceMatrixHostIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostSurfaceMatrixId" with
  | none => false
  | some body => body == "\"HOST-SURFACE-MATRIX\""

def surfaceMatrixMapIdBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "surfaceMatrixId" with
  | none => false
  | some body => body == "\"SURFACE-MATRIX\""

def surfaceMatrixInventoryPathBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "inventoryDocPath" with
  | none => false
  | some body => body == "\"src/systems/surface-matrix.md\""

def surfaceMatrixModulePathBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "hostModulePath" with
  | none => false
  | some body => body == "\"src/systems/SystemsLean/SurfaceMatrix.lean\""

def checkSurfaceMatrixTermDialect (content : String) : Option String :=
  if !surfaceMatrixStageIdBodyOk content then some reasonIllTypedTerm
  else if !surfaceMatrixHostIdBodyOk content then some reasonIllTypedTerm
  else if !surfaceMatrixMapIdBodyOk content then some reasonIllTypedTerm
  else if !surfaceMatrixInventoryPathBodyOk content then some reasonIllTypedTerm
  else if !surfaceMatrixModulePathBodyOk content then some reasonIllTypedTerm
  else none

def refineSurfaceMatrixWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkSurfaceMatrixTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckSurfaceMatrixTermSkeletonPrefix : String :=
  "import SystemsLean.SelfHost\n" ++
  "namespace SystemsLean.SurfaceMatrix\n"

def hostModuleCheckSurfaceMatrixTermSkeletonSuffix : String :=
  "end SystemsLean.SurfaceMatrix\n"

def hostModuleCheckSurfaceMatrixTermGoodMid : String :=
  "def stageId : String := \"SLAKE_SURFACE_MATRIX_V0\"\n" ++
  "def hostSurfaceMatrixId : String := \"HOST-SURFACE-MATRIX\"\n" ++
  "def surfaceMatrixId : String := \"SURFACE-MATRIX\"\n" ++
  "def inventoryDocPath : String := \"src/systems/surface-matrix.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SurfaceMatrix.lean\"\n" ++
  "def matrixSurfaceOk : Bool := true\n" ++
  "def matrixUnitReady (hc : Nat) : Bool := true\n" ++
  "def matrixProgramReady (p : Nat) : Bool := true\n"

def hostModuleCheckGoodSurfaceMatrixTermText : String :=
  hostModuleCheckSurfaceMatrixTermSkeletonPrefix
    ++ hostModuleCheckSurfaceMatrixTermGoodMid
    ++ hostModuleCheckSurfaceMatrixTermSkeletonSuffix

def hostModuleCheckBadSurfaceMatrixStageIdText : String :=
  hostModuleCheckSurfaceMatrixTermSkeletonPrefix ++
  "def stageId : String := \"WRONG_STAGE\"\n" ++
  "def hostSurfaceMatrixId : String := \"HOST-SURFACE-MATRIX\"\n" ++
  "def surfaceMatrixId : String := \"SURFACE-MATRIX\"\n" ++
  "def inventoryDocPath : String := \"src/systems/surface-matrix.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SurfaceMatrix.lean\"\n" ++
  "def matrixSurfaceOk : Bool := true\n" ++
  "def matrixUnitReady (hc : Nat) : Bool := true\n" ++
  "def matrixProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSurfaceMatrixTermSkeletonSuffix

def hostModuleCheckBadSurfaceMatrixHostIdText : String :=
  hostModuleCheckSurfaceMatrixTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SURFACE_MATRIX_V0\"\n" ++
  "def hostSurfaceMatrixId : String := \"WRONG_HOST\"\n" ++
  "def surfaceMatrixId : String := \"SURFACE-MATRIX\"\n" ++
  "def inventoryDocPath : String := \"src/systems/surface-matrix.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SurfaceMatrix.lean\"\n" ++
  "def matrixSurfaceOk : Bool := true\n" ++
  "def matrixUnitReady (hc : Nat) : Bool := true\n" ++
  "def matrixProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSurfaceMatrixTermSkeletonSuffix

def hostModuleCheckBadSurfaceMatrixMapIdText : String :=
  hostModuleCheckSurfaceMatrixTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SURFACE_MATRIX_V0\"\n" ++
  "def hostSurfaceMatrixId : String := \"HOST-SURFACE-MATRIX\"\n" ++
  "def surfaceMatrixId : String := \"WRONG_MAP\"\n" ++
  "def inventoryDocPath : String := \"src/systems/surface-matrix.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/SurfaceMatrix.lean\"\n" ++
  "def matrixSurfaceOk : Bool := true\n" ++
  "def matrixUnitReady (hc : Nat) : Bool := true\n" ++
  "def matrixProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSurfaceMatrixTermSkeletonSuffix

def hostModuleCheckBadSurfaceMatrixPathText : String :=
  hostModuleCheckSurfaceMatrixTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_SURFACE_MATRIX_V0\"\n" ++
  "def hostSurfaceMatrixId : String := \"HOST-SURFACE-MATRIX\"\n" ++
  "def surfaceMatrixId : String := \"SURFACE-MATRIX\"\n" ++
  "def inventoryDocPath : String := \"src/systems/surface-matrix.md\"\n" ++
  "def hostModulePath : String := \"src/systems/SystemsLean/Wrong.lean\"\n" ++
  "def matrixSurfaceOk : Bool := true\n" ++
  "def matrixUnitReady (hc : Nat) : Bool := true\n" ++
  "def matrixProgramReady (p : Nat) : Bool := true\n" ++
  hostModuleCheckSurfaceMatrixTermSkeletonSuffix

def surfaceMatrixTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.SurfaceMatrix"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadSurfaceMatrixStageIdL0Accept : Bool :=
  (checkNamedSurface (surfaceMatrixTermSurfaceFrom
      hostModuleCheckBadSurfaceMatrixStageIdText)
    surfaceMatrixExpectedNamespace surfaceMatrixRequiredDecls none).isAccept

def hostModuleCheckBadSurfaceMatrixHostIdL0Accept : Bool :=
  (checkNamedSurface (surfaceMatrixTermSurfaceFrom
      hostModuleCheckBadSurfaceMatrixHostIdText)
    surfaceMatrixExpectedNamespace surfaceMatrixRequiredDecls none).isAccept

def hostModuleCheckBadSurfaceMatrixMapIdL0Accept : Bool :=
  (checkNamedSurface (surfaceMatrixTermSurfaceFrom
      hostModuleCheckBadSurfaceMatrixMapIdText)
    surfaceMatrixExpectedNamespace surfaceMatrixRequiredDecls none).isAccept

def hostModuleCheckBadSurfaceMatrixPathL0Accept : Bool :=
  (checkNamedSurface (surfaceMatrixTermSurfaceFrom
      hostModuleCheckBadSurfaceMatrixPathText)
    surfaceMatrixExpectedNamespace surfaceMatrixRequiredDecls none).isAccept

def hostModuleCheckSurfaceMatrixTermDialectOk : Bool :=
  (checkSurfaceMatrixTermDialect hostModuleCheckGoodSurfaceMatrixTermText).isNone

def hostModuleCheckBadSurfaceMatrixStageIdDialectReject : Bool :=
  match checkSurfaceMatrixTermDialect hostModuleCheckBadSurfaceMatrixStageIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSurfaceMatrixHostIdDialectReject : Bool :=
  match checkSurfaceMatrixTermDialect hostModuleCheckBadSurfaceMatrixHostIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSurfaceMatrixMapIdDialectReject : Bool :=
  match checkSurfaceMatrixTermDialect hostModuleCheckBadSurfaceMatrixMapIdText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadSurfaceMatrixPathDialectReject : Bool :=
  match checkSurfaceMatrixTermDialect hostModuleCheckBadSurfaceMatrixPathText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckSurfaceMatrixTermSurfaceOk : Bool :=
  hostModuleCheckSurfaceMatrixTermSurfaceDualOk
    && (checkDepthSurfaceMatrixTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthSurfaceMatrixTermSurfaceScope == "SurfaceMatrix-only")
    && hostModuleCheckSurfaceMatrixTermDialectOk
    && hostModuleCheckBadSurfaceMatrixStageIdDialectReject
    && hostModuleCheckBadSurfaceMatrixHostIdDialectReject
    && hostModuleCheckBadSurfaceMatrixMapIdDialectReject
    && hostModuleCheckBadSurfaceMatrixPathDialectReject
    && hostModuleCheckBadSurfaceMatrixStageIdL0Accept
    && hostModuleCheckBadSurfaceMatrixHostIdL0Accept
    && hostModuleCheckBadSurfaceMatrixMapIdL0Accept
    && hostModuleCheckBadSurfaceMatrixPathL0Accept

theorem hostModuleCheckSurfaceMatrixTermSurfaceOk_true :
    hostModuleCheckSurfaceMatrixTermSurfaceOk = true := by native_decide

theorem hostModuleCheck_surface_matrix_term_surface_ids_eq :
    checkDepthSurfaceMatrixTermSurfaceBar = "TERM-SURFACE"
      && checkDepthSurfaceMatrixTermSurfaceScope = "SurfaceMatrix-only"
      && hostModuleCheckSurfaceMatrixTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#
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

/-- Reject field proj the kernel cannot type (keep isEmpty / isSome / length). -/
def termNoBadProjN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ n, Term.app f a => termNoBadProjN n f && termNoBadProjN n a
  | Nat.succ n, Term.some_ t => termNoBadProjN n t
  | Nat.succ n, Term.ite c t e =>
      termNoBadProjN n c && termNoBadProjN n t && termNoBadProjN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoBadProjN n a && termNoBadProjN n b
  | Nat.succ n, Term.proj o f =>
      (f.raw == "isEmpty" || f.raw == "isSome" || f.raw == "length")
        && termNoBadProjN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoBadProjN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Names a command adds to the known-const set. -/
def cmdAddsFk (c : Cmd) : List String :=
  match c with
  | Cmd.inductive_ _ ctors _ => ctors.map (fun d => d.name.raw)
  | Cmd.def_ x _ _ => [x.raw]
  | Cmd.defBind x _ _ _ => [x.raw]
  | _ => []

/-- Reject Term.app. App bodies are skip-folded. -/
def termNoAppN : Nat -> Term -> Bool
  | 0, _ => false
  | Nat.succ _, Term.var _ => true
  | Nat.succ _, Term.litNat _ => true
  | Nat.succ _, Term.litString _ => true
  | Nat.succ _, Term.litBool _ => true
  | Nat.succ _, Term.none_ => true
  | Nat.succ _, Term.const _ => true
  | Nat.succ _, Term.app _ _ => false
  | Nat.succ n, Term.some_ t => termNoAppN n t
  | Nat.succ n, Term.ite c t e =>
      termNoAppN n c && termNoAppN n t && termNoAppN n e
  | Nat.succ n, Term.decideEq a b =>
      termNoAppN n a && termNoAppN n b
  | Nat.succ n, Term.proj o _ => termNoAppN n o
  | Nat.succ n, Term.structLit fs =>
      fs.all (fun p => termNoAppN n p.snd)
  | Nat.succ _, Term.match_ _ _ => false

/-- Body is kernel-known, no untyped proj, no Term.app. -/
def cmdBodyKnownFk (kn : List String) : Cmd -> Bool
  | Cmd.def_ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | Cmd.defBind _ _ _ body =>
      termKnownN liveHostTermParseFuel kn body
        && termNoBadProjN liveParseFuel body
        && termNoAppN liveParseFuel body
  | _ => true

/-- Parse one command. none means skip this keyword (caller skipUntilCmd).
    theorem, example, set_option, and open are not parsed here. -/
def parseOneCmdFk (fuel : Nat) (toks : List String) :
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
    | some (dname, rest2) => parseDefHt fuel dname rest2
    | none => none
  | _ => none

/-- Fold commands. Skip open, theorem, example, set_option, and un-kernelable defs. -/
def parseCmdsFk : Nat -> List String -> List String -> List Cmd ->
    Option (List Cmd)
  | 0, [], _, acc => some acc
  | 0, _ :: _, _, _ => none
  | Nat.succ _, [], _, acc => some acc
  | Nat.succ n, toks, kn, acc =>
    match parseOneCmdFk liveParseFuel toks with
    | some (c, rest) =>
      let rest2 := skipNonCmd liveSkipFuel rest
      if cmdBodyKnownFk kn c then
        parseCmdsFk n rest2 (kn ++ cmdAddsFk c) (acc ++ [c])
      else
        parseCmdsFk n rest2 kn acc
    | none =>
      match toks with
      | t :: rest =>
        if isCmdKw t then
          let rest2 := skipUntilCmd liveSkipFuel rest
          if rest2.length < toks.length then
            parseCmdsFk n rest2 kn acc
          else none
        else none
      | [] => some acc

/-- Count a command keyword. Tail-recursive on the token list. -/
def toksCountKw : Nat -> List String -> String -> Nat -> Nat
  | 0, _, _, acc => acc
  | Nat.succ _, [], _, acc => acc
  | Nat.succ n, t :: rest, kw, acc =>
    toksCountKw n rest kw (if t == kw then acc + 1 else acc)

/-- Parse live HostModuleCheckSurfaceMatrixTerm.lean text.
    Greppable: parseLiveHostModuleCheckSurfaceMatrixTermSource. -/
def parseLiveHostModuleCheckSurfaceMatrixTermSource (src : String) :
    FrontResult :=
  let toks := tokenizeHostTerm (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsFk liveParseFuel toks [] [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.HostModuleCheckSurfaceMatrixTerm"
            commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check the live parse. Not a fixture.
    Greppable: kernelCheckLiveHostModuleCheckSurfaceMatrixTermSource. -/
def kernelCheckLiveHostModuleCheckSurfaceMatrixTermSource (src : String) :
    Bool :=
  match parseLiveHostModuleCheckSurfaceMatrixTermSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Accepted live module when parse succeeds. -/
def liveParsed? : Option Module :=
  match parseLiveHostModuleCheckSurfaceMatrixTermSource
      liveHostModuleCheckSurfaceMatrixTermSource with
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

/-- Live parse command count is the kept set, not a neighbor count. -/
def liveParseCmdCountOk : Bool :=
  match liveParsed? with
  | some m => m.commands.length == liveKeptCmds
  | none => false

/-- Literal defs the kernel must keep. -/
def liveParseHasLiteralDefs : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | _ => false
    has "checkDepthSurfaceMatrixTermSurfaceBar"
      && has "checkDepthSurfaceMatrixTermSurfaceScope"
      && has "hostModuleCheckSurfaceMatrixTermSurfaceDualOk"
      && has "hostModuleCheckSurfaceMatrixTermSkeletonSuffix"

/-- Parsed module name is the product module (no module line in the live file). -/
def liveParseHasModuleName : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    m.name.raw == "SystemsLean.HostModuleCheckSurfaceMatrixTerm"

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

/-- Live parse keeps the two imports. -/
def liveParseImportCountOk : Bool :=
  match liveParsed? with
  | none => false
  | some m =>
    let n := m.commands.foldl (fun acc c =>
      match c with
      | Cmd.importModule _ => acc + 1
      | _ => acc) 0
    n == liveImportCount

/-- Keyword counts: theorem is 2. example and set_option are 0. -/
def liveParseKwCountsOk : Bool :=
  match liveParsed? with
  | none => false
  | some _ =>
    let toks := tokenizeHostTerm
      (stripComments liveHostModuleCheckSurfaceMatrixTermSource)
    toksCountKw liveSkipFuel toks "theorem" 0 == liveTheoremCount
      && toksCountKw liveSkipFuel toks "example" 0 == liveExampleCount
      && toksCountKw liveSkipFuel toks "set_option" 0 == liveSetOptionCount

/-- Namespace needle with a trailing newline. -/
def needleNamespace : String := "namespace SystemsLean.HostModuleCheck\n"

/-- Import needle with a trailing newline. -/
def needleImport : String := "import SystemsLean.HostModuleCheckSurface\n"

/-- Literal bar def needle with a trailing newline. -/
def needleBar : String :=
  "def checkDepthSurfaceMatrixTermSurfaceBar : String := \"TERM-SURFACE\"\n"

/-- Literal dual-ok def needle with a trailing newline. -/
def needleDualOk : String :=
  "def hostModuleCheckSurfaceMatrixTermSurfaceDualOk : Bool := true\n"

/-- Literal body def needle with a trailing newline. -/
def needleParseOk : String :=
  "def hostModuleCheckSurfaceMatrixTermSkeletonSuffix : String :=\n"

/-- End needle with a trailing newline. -/
def needleEnd : String := "end SystemsLean.HostModuleCheck\n"

/-- Each needle occurs in the embedded live source. -/
def liveNeedlesOk : Bool :=
  let src := liveHostModuleCheckSurfaceMatrixTermSource
  (src.splitOn needleNamespace).length > 1
    && (src.splitOn needleImport).length > 1
    && (src.splitOn needleBar).length > 1
    && (src.splitOn needleDualOk).length > 1
    && (src.splitOn needleParseOk).length > 1
    && (src.splitOn needleEnd).length > 1

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveHostModuleCheckSurfaceMatrixTermReady.
    Real conjunction: parse plus kernelCheck plus this file's commands.
    Not a hardcoded true. -/
def hostFrontLiveHostModuleCheckSurfaceMatrixTermReady : Bool :=
  (stageId ==
    "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SURFACE_MATRIX_TERM_V0")
    && (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM")
    && (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM")
    && (liveRel == "HostModuleCheckSurfaceMatrixTerm.lean")
    && (liveHostModuleCheckSurfaceMatrixTermRel ==
      "src/systems/SystemsLean/HostModuleCheckSurfaceMatrixTerm.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveHostModuleCheckSurfaceMatrixTermFullHost
    && !hostFrontLiveHostModuleCheckSurfaceMatrixTermFullBackend
    && !hostFrontLiveHostModuleCheckSurfaceMatrixTermResidualFreeClaimed
    && !hostFrontLiveHostModuleCheckSurfaceMatrixTermProvablyUnlocked
    && kernelCheckLiveHostModuleCheckSurfaceMatrixTermSource
      liveHostModuleCheckSurfaceMatrixTermSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasLiteralDefs
    && liveParseHasModuleName
    && liveParseHasNs
    && liveParseHasEnd
    && liveParseImportCountOk
    && liveParseKwCountsOk
    && liveNeedlesOk

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveHostModuleCheckSurfaceMatrixTermSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-- One kept command, for a failure line. -/
def cmdTag : Cmd -> String
  | Cmd.importModule x => s!"import {x.raw}"
  | Cmd.namespace x => s!"namespace {x.raw}"
  | Cmd.endNamespace x => s!"end {x.raw}"
  | Cmd.openNs _ => "open"
  | Cmd.inductive_ x _ _ => s!"inductive {x.raw}"
  | Cmd.def_ x _ _ => s!"def {x.raw}"
  | Cmd.defBind x _ _ _ => s!"defBind {x.raw}"
  | Cmd.check _ _ => "check"
  | Cmd.structure_ x _ _ => s!"structure {x.raw}"

/-- Which ready conjuncts failed. Empty when ready holds. -/
def readyFailures : List String :=
  let bad (name : String) (ok : Bool) : List String :=
    if ok then [] else [name]
  bad "stageId" (stageId ==
      "SLAKE_HOST_FRONT_LIVE_HOST_MODULE_CHECK_SURFACE_MATRIX_TERM_V0")
    ++ bad "hostId" (hostId ==
      "HOST-FRONT-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM")
    ++ bad "parseId" (parseId ==
      "PARSE-LIVE-HOST-MODULE-CHECK-SURFACE-MATRIX-TERM")
    ++ bad "liveRel" (liveRel == "HostModuleCheckSurfaceMatrixTerm.lean")
    ++ bad "rel" (liveHostModuleCheckSurfaceMatrixTermRel ==
      "src/systems/SystemsLean/HostModuleCheckSurfaceMatrixTerm.lean")
    ++ bad "notMult" liveParseDoesNotUseMultFixture
    ++ bad "fullHost" (!hostFrontLiveHostModuleCheckSurfaceMatrixTermFullHost)
    ++ bad "fullBackend"
      (!hostFrontLiveHostModuleCheckSurfaceMatrixTermFullBackend)
    ++ bad "residual"
      (!hostFrontLiveHostModuleCheckSurfaceMatrixTermResidualFreeClaimed)
    ++ bad "provably"
      (!hostFrontLiveHostModuleCheckSurfaceMatrixTermProvablyUnlocked)
    ++ bad "kernel" (kernelCheckLiveHostModuleCheckSurfaceMatrixTermSource
      liveHostModuleCheckSurfaceMatrixTermSource)
    ++ bad "noCheck" liveParseHasNoCheckCmd
    ++ bad "count" liveParseCmdCountOk
    ++ bad "literals" liveParseHasLiteralDefs
    ++ bad "module" liveParseHasModuleName
    ++ bad "ns" liveParseHasNs
    ++ bad "endNs" liveParseHasEnd
    ++ bad "imports" liveParseImportCountOk
    ++ bad "kw" liveParseKwCountsOk
    ++ bad "needles" liveNeedlesOk

/-! ### Driver (short banners; on-disk bytes must match the embedded source). -/

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: {parseId} =="
  IO.println s!"  host={hostId} file={liveHostModuleCheckSurfaceMatrixTermRel}"
  IO.println s!"liveRel={liveRel}"
  let path := root / liveHostModuleCheckSurfaceMatrixTermRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveHostModuleCheckSurfaceMatrixTermRel}"
    throw (IO.userError s!"missing {liveHostModuleCheckSurfaceMatrixTermRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckSurfaceMatrixTermSource then
    IO.eprintln "error: dual-pin mismatch: on-disk HostModuleCheckSurfaceMatrixTerm.lean != liveHostModuleCheckSurfaceMatrixTermSource"
    throw (IO.userError "dual-pin mismatch live HostModuleCheckSurfaceMatrixTerm.lean")
  let r := parseLiveHostModuleCheckSurfaceMatrixTermSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: {parseId} reject {reason}"
    throw (IO.userError s!"{parseId} reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS {parseId} ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live HostModuleCheckSurfaceMatrixTerm parse false"
      throw (IO.userError "kernelCheck live HostModuleCheckSurfaceMatrixTerm parse false")
    unless hostFrontLiveHostModuleCheckSurfaceMatrixTermReady do
      for name in readyFailures do
        IO.eprintln s!"error: ready false {name}"
      match liveParsed? with
      | some parsed =>
        IO.eprintln s!"error: cmd count {parsed.commands.length}"
        for c in parsed.commands do
          IO.eprintln s!"error: kept {cmdTag c}"
      | none =>
        IO.eprintln "error: live parse none"
      throw (IO.userError "hostFrontLiveHostModuleCheckSurfaceMatrixTermReady false")
    unless liveParseRejectsEmpty do
      IO.eprintln "error: empty HostModuleCheckSurfaceMatrixTerm source was accepted"
      throw (IO.userError "empty HostModuleCheckSurfaceMatrixTerm source was accepted")
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

end SystemsLean.HostFrontLiveHostModuleCheckSurfaceMatrixTermSource
