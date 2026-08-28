/-
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
