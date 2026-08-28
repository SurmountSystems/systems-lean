/-
  SYSTEMS_LEAN_HOST partial -- TypesSubsetEmit L2 term-surface (TypesSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: TypesSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  TypesSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Types emit dialect body matches product (emitTypesReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - typesSubsetEmitReady compose matches product (CompilePathTypes chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckTypesSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckTypesSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - TypesSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckTypesSubsetEmitTerm, TERM-SURFACE, TypesSubsetEmit-only,
  ILL-TYPED-TERM, checkTypesSubsetEmitTermDialect,
  hostModuleCheckTypesSubsetEmitTermDialectOk,
  hostModuleCheckTypesSubsetEmitTermSurfaceDualOk,
  hostModuleCheckTypesSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckTypesSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckTypesSubsetEmitTerm;
  lake build SystemsLean.HostModuleCheck; just host-module-check-without-lake.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
-/

import SystemsLean.HostModuleCheckSurface
import SystemsLean.HostModuleCheckEmitPlanTerm
import SystemsLean.HostModuleCheckRequiredDecls
import SystemsLean.HostModuleCheckRequiredDeclsProduct
import SystemsLean.HostModuleCheckRequiredDeclsLater

namespace SystemsLean.HostModuleCheck

/-! ### TypesSubsetEmit L2 term-surface dual-ok pins (TypesSubsetEmit-only) -/

def checkDepthTypesSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthTypesSubsetEmitTermSurfaceScope : String := "TypesSubsetEmit-only"
def hostModuleCheckTypesSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product typesSubsetEmitReady fold (Types fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk TypesSubsetEmit match. -/
def typesSubsetEmitReadyTermBody : String :=
  "typesSubsetEmitInputReady && typesSubsetEmitTypesDialectOk && typesSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !typesSubsetEmitResidualFreeClaimed && !typesSubsetEmitProductSelfHostCompleteClaimed && !typesSubsetEmitProofCompleteClaimed && !typesSubsetEmitLlvmUnlocked && !typesSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_TYPES_SUBSET_EMIT_V0\") && (hostId == \"HOST-TYPES-SUBSET-EMIT\") && (surfaceId == \"TYPES-SUBSET-EMIT\") && (typesSubsetEmitInputId == \"SLAKE_TYPES_SUBSET_TYPES\") && (lakeExeName == \"slake-types-subset-emit\") && (justRecipe == \"types-subset-emit\")"

def typesSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitTypesDialectOk" with
  | none => false
  | some body => body == "emitTypesReady"

def typesSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def typesSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def typesSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "typesSubsetEmitReady" with
  | none => false
  | some body => body == typesSubsetEmitReadyTermBody

def checkTypesSubsetEmitTermDialect (content : String) : Option String :=
  if !typesSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !typesSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineTypesSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkTypesSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckTypesSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathTypes\n" ++
  "import SystemsLean.EmitTypes\n" ++
  "namespace SystemsLean.TypesSubsetEmit\n"

def hostModuleCheckTypesSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.TypesSubsetEmit\n"

def hostModuleCheckTypesSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodTypesSubsetEmitTermText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckTypesSubsetEmitTermGoodMid
    ++ hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitResidualText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitEmitText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := true\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitReadyText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := true\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadTypesSubsetEmitCompleteText : String :=
  hostModuleCheckTypesSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_TYPES_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-TYPES-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"types-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_types_subset.h\"\n" ++
  "def typesSubsetEmitTypesDialectOk : Bool := emitTypesReady\n" ++
  "def typesSubsetEmitReady : Bool := " ++ typesSubsetEmitReadyTermBody ++ "\n" ++
  "def typesSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def typesSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckTypesSubsetEmitTermSkeletonSuffix

def typesSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.TypesSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadTypesSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitResidualText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitResidualDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitEmitText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitEmitDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitReadyText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitReadyDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadTypesSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (typesSubsetEmitTermSurfaceFrom
      hostModuleCheckBadTypesSubsetEmitCompleteText)
    typesSubsetEmitExpectedNamespace typesSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathTypes")).isAccept

def hostModuleCheckBadTypesSubsetEmitCompleteDialectReject : Bool :=
  match checkTypesSubsetEmitTermDialect hostModuleCheckBadTypesSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckTypesSubsetEmitTermDialectOk : Bool :=
  (checkTypesSubsetEmitTermDialect hostModuleCheckGoodTypesSubsetEmitTermText).isNone

/-- On-disk TypesSubsetEmit typesSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodTypesSubsetEmitReadyMultilineText : String :=
  "def typesSubsetEmitReady : Bool :=\n" ++
  "  typesSubsetEmitInputReady\n" ++
  "    && typesSubsetEmitTypesDialectOk\n" ++
  "    && typesSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !typesSubsetEmitResidualFreeClaimed\n" ++
  "    && !typesSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !typesSubsetEmitProofCompleteClaimed\n" ++
  "    && !typesSubsetEmitLlvmUnlocked\n" ++
  "    && !typesSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_TYPES_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-TYPES-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"TYPES-SUBSET-EMIT\")\n" ++
  "    && (typesSubsetEmitInputId == \"SLAKE_TYPES_SUBSET_TYPES\")\n" ++
  "    && (lakeExeName == \"slake-types-subset-emit\")\n" ++
  "    && (justRecipe == \"types-subset-emit\")\n"

/-- Collapse of the on-disk multi-line typesSubsetEmitReady body. -/
def hostModuleCheckTypesSubsetEmitReadyMultilineOk : Bool :=
  typesSubsetEmitReadyBodyOk hostModuleCheckGoodTypesSubsetEmitReadyMultilineText

def hostModuleCheckTypesSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckTypesSubsetEmitTermSurfaceDualOk
    && (checkDepthTypesSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthTypesSubsetEmitTermSurfaceScope == "TypesSubsetEmit-only")
    && hostModuleCheckTypesSubsetEmitTermDialectOk
    && hostModuleCheckBadTypesSubsetEmitResidualDialectReject
    && hostModuleCheckBadTypesSubsetEmitEmitDialectReject
    && hostModuleCheckBadTypesSubsetEmitReadyDialectReject
    && hostModuleCheckBadTypesSubsetEmitCompleteDialectReject
    && hostModuleCheckBadTypesSubsetEmitResidualL0Accept
    && hostModuleCheckBadTypesSubsetEmitEmitL0Accept
    && hostModuleCheckBadTypesSubsetEmitReadyL0Accept
    && hostModuleCheckBadTypesSubsetEmitCompleteL0Accept
    && hostModuleCheckTypesSubsetEmitReadyMultilineOk

theorem hostModuleCheckTypesSubsetEmitTermSurfaceOk_true :
    hostModuleCheckTypesSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckTypesSubsetEmitReadyMultilineOk_true :
    hostModuleCheckTypesSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_typesSubsetEmit_term_surface_ids_eq :
    checkDepthTypesSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthTypesSubsetEmitTermSurfaceScope = "TypesSubsetEmit-only"
      && hostModuleCheckTypesSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
