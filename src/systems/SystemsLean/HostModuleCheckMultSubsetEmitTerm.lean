/-
  SYSTEMS_LEAN_HOST partial -- MultSubsetEmit L2 term-surface (MultSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: MultSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  MultSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Mult emit dialect body matches product (emitMultReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - multSubsetEmitReady compose matches product (FirstSurface + EmitMult chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckMultSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckMultSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - MultSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - GraphSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ComposeSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ErasureSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ExtractSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckMultSubsetEmitTerm, TERM-SURFACE, MultSubsetEmit-only,
  ILL-TYPED-TERM, checkMultSubsetEmitTermDialect,
  hostModuleCheckMultSubsetEmitTermDialectOk,
  hostModuleCheckMultSubsetEmitTermSurfaceDualOk,
  hostModuleCheckMultSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckMultSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckMultSubsetEmitTerm;
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

/-! ### MultSubsetEmit L2 term-surface dual-ok pins (MultSubsetEmit-only) -/

def checkDepthMultSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthMultSubsetEmitTermSurfaceScope : String := "MultSubsetEmit-only"
def hostModuleCheckMultSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product multSubsetEmitReady fold (Mult fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk MultSubsetEmit match. -/
def multSubsetEmitReadyTermBody : String :=
  "multSubsetEmitInputReady && multSubsetEmitMultDialectOk && multSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !multSubsetEmitResidualFreeClaimed && !multSubsetEmitProductSelfHostCompleteClaimed && !multSubsetEmitProofCompleteClaimed && !multSubsetEmitLlvmUnlocked && !multSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_MULT_SUBSET_EMIT_V0\") && (hostId == \"HOST-MULT-SUBSET-EMIT\") && (surfaceId == \"MULT-SUBSET-EMIT\") && (multSubsetEmitInputId == \"SLAKE_FIRST_SURFACE_MULT\") && (lakeExeName == \"slake-mult-subset-emit\") && (justRecipe == \"mult-subset-emit\")"

def multSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetEmitMultDialectOk" with
  | none => false
  | some body => body == "emitMultReady"

def multSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def multSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def multSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetEmitReady" with
  | none => false
  | some body => body == multSubsetEmitReadyTermBody

def checkMultSubsetEmitTermDialect (content : String) : Option String :=
  if !multSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !multSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !multSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !multSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineMultSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkMultSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckMultSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.FirstSurface\n" ++
  "import SystemsLean.EmitMult\n" ++
  "namespace SystemsLean.MultSubsetEmit\n"

def hostModuleCheckMultSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.MultSubsetEmit\n"

def hostModuleCheckMultSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"mult-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetEmitMultDialectOk : Bool := emitMultReady\n" ++
  "def multSubsetEmitReady : Bool := " ++ multSubsetEmitReadyTermBody ++ "\n" ++
  "def multSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodMultSubsetEmitTermText : String :=
  hostModuleCheckMultSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckMultSubsetEmitTermGoodMid
    ++ hostModuleCheckMultSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadMultSubsetEmitResidualText : String :=
  hostModuleCheckMultSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"mult-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetEmitMultDialectOk : Bool := emitMultReady\n" ++
  "def multSubsetEmitReady : Bool := " ++ multSubsetEmitReadyTermBody ++ "\n" ++
  "def multSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def multSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadMultSubsetEmitEmitText : String :=
  hostModuleCheckMultSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"mult-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetEmitMultDialectOk : Bool := true\n" ++
  "def multSubsetEmitReady : Bool := " ++ multSubsetEmitReadyTermBody ++ "\n" ++
  "def multSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadMultSubsetEmitReadyText : String :=
  hostModuleCheckMultSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"mult-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetEmitMultDialectOk : Bool := emitMultReady\n" ++
  "def multSubsetEmitReady : Bool := true\n" ++
  "def multSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadMultSubsetEmitCompleteText : String :=
  hostModuleCheckMultSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"mult-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetEmitMultDialectOk : Bool := emitMultReady\n" ++
  "def multSubsetEmitReady : Bool := " ++ multSubsetEmitReadyTermBody ++ "\n" ++
  "def multSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckMultSubsetEmitTermSkeletonSuffix

def multSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.MultSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadMultSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (multSubsetEmitTermSurfaceFrom
      hostModuleCheckBadMultSubsetEmitResidualText)
    multSubsetEmitExpectedNamespace multSubsetEmitRequiredDecls
    (some "SystemsLean.FirstSurface")).isAccept

def hostModuleCheckBadMultSubsetEmitResidualDialectReject : Bool :=
  match checkMultSubsetEmitTermDialect hostModuleCheckBadMultSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (multSubsetEmitTermSurfaceFrom
      hostModuleCheckBadMultSubsetEmitEmitText)
    multSubsetEmitExpectedNamespace multSubsetEmitRequiredDecls
    (some "SystemsLean.FirstSurface")).isAccept

def hostModuleCheckBadMultSubsetEmitEmitDialectReject : Bool :=
  match checkMultSubsetEmitTermDialect hostModuleCheckBadMultSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (multSubsetEmitTermSurfaceFrom
      hostModuleCheckBadMultSubsetEmitReadyText)
    multSubsetEmitExpectedNamespace multSubsetEmitRequiredDecls
    (some "SystemsLean.FirstSurface")).isAccept

def hostModuleCheckBadMultSubsetEmitReadyDialectReject : Bool :=
  match checkMultSubsetEmitTermDialect hostModuleCheckBadMultSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (multSubsetEmitTermSurfaceFrom
      hostModuleCheckBadMultSubsetEmitCompleteText)
    multSubsetEmitExpectedNamespace multSubsetEmitRequiredDecls
    (some "SystemsLean.FirstSurface")).isAccept

def hostModuleCheckBadMultSubsetEmitCompleteDialectReject : Bool :=
  match checkMultSubsetEmitTermDialect hostModuleCheckBadMultSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckMultSubsetEmitTermDialectOk : Bool :=
  (checkMultSubsetEmitTermDialect hostModuleCheckGoodMultSubsetEmitTermText).isNone

/-- On-disk MultSubsetEmit multSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodMultSubsetEmitReadyMultilineText : String :=
  "def multSubsetEmitReady : Bool :=\n" ++
  "  multSubsetEmitInputReady\n" ++
  "    && multSubsetEmitMultDialectOk\n" ++
  "    && multSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !multSubsetEmitResidualFreeClaimed\n" ++
  "    && !multSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !multSubsetEmitProofCompleteClaimed\n" ++
  "    && !multSubsetEmitLlvmUnlocked\n" ++
  "    && !multSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_MULT_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-MULT-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"MULT-SUBSET-EMIT\")\n" ++
  "    && (multSubsetEmitInputId == \"SLAKE_FIRST_SURFACE_MULT\")\n" ++
  "    && (lakeExeName == \"slake-mult-subset-emit\")\n" ++
  "    && (justRecipe == \"mult-subset-emit\")\n"

/-- Collapse of the on-disk multi-line multSubsetEmitReady body. -/
def hostModuleCheckMultSubsetEmitReadyMultilineOk : Bool :=
  multSubsetEmitReadyBodyOk hostModuleCheckGoodMultSubsetEmitReadyMultilineText

def hostModuleCheckMultSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckMultSubsetEmitTermSurfaceDualOk
    && (checkDepthMultSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthMultSubsetEmitTermSurfaceScope == "MultSubsetEmit-only")
    && hostModuleCheckMultSubsetEmitTermDialectOk
    && hostModuleCheckBadMultSubsetEmitResidualDialectReject
    && hostModuleCheckBadMultSubsetEmitEmitDialectReject
    && hostModuleCheckBadMultSubsetEmitReadyDialectReject
    && hostModuleCheckBadMultSubsetEmitCompleteDialectReject
    && hostModuleCheckBadMultSubsetEmitResidualL0Accept
    && hostModuleCheckBadMultSubsetEmitEmitL0Accept
    && hostModuleCheckBadMultSubsetEmitReadyL0Accept
    && hostModuleCheckBadMultSubsetEmitCompleteL0Accept
    && hostModuleCheckMultSubsetEmitReadyMultilineOk

theorem hostModuleCheckMultSubsetEmitTermSurfaceOk_true :
    hostModuleCheckMultSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckMultSubsetEmitReadyMultilineOk_true :
    hostModuleCheckMultSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_multSubsetEmit_term_surface_ids_eq :
    checkDepthMultSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthMultSubsetEmitTermSurfaceScope = "MultSubsetEmit-only"
      && hostModuleCheckMultSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
