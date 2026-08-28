/-
  SYSTEMS_LEAN_HOST partial -- ExtractSubsetEmit L2 term-surface (ExtractSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ExtractSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ExtractSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Extract emit dialect body matches product (emitExtractReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - extractSubsetEmitReady compose matches product (CompilePathExtract chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckExtractSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckExtractSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - ExtractSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - GraphSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ComposeSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ErasureSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckExtractSubsetEmitTerm, TERM-SURFACE, ExtractSubsetEmit-only,
  ILL-TYPED-TERM, checkExtractSubsetEmitTermDialect,
  hostModuleCheckExtractSubsetEmitTermDialectOk,
  hostModuleCheckExtractSubsetEmitTermSurfaceDualOk,
  hostModuleCheckExtractSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckExtractSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckExtractSubsetEmitTerm;
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

/-! ### ExtractSubsetEmit L2 term-surface dual-ok pins (ExtractSubsetEmit-only) -/

def checkDepthExtractSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthExtractSubsetEmitTermSurfaceScope : String := "ExtractSubsetEmit-only"
def hostModuleCheckExtractSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product extractSubsetEmitReady fold (Extract fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk ExtractSubsetEmit match. -/
def extractSubsetEmitReadyTermBody : String :=
  "extractSubsetEmitInputReady && extractSubsetEmitExtractDialectOk && extractSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !extractSubsetEmitResidualFreeClaimed && !extractSubsetEmitProductSelfHostCompleteClaimed && !extractSubsetEmitProofCompleteClaimed && !extractSubsetEmitLlvmUnlocked && !extractSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_EXTRACT_SUBSET_EMIT_V0\") && (hostId == \"HOST-EXTRACT-SUBSET-EMIT\") && (surfaceId == \"EXTRACT-SUBSET-EMIT\") && (extractSubsetEmitInputId == \"SLAKE_EXTRACT_SUBSET_EXTRACT\") && (lakeExeName == \"slake-extract-subset-emit\") && (justRecipe == \"extract-subset-emit\")"

def extractSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetEmitExtractDialectOk" with
  | none => false
  | some body => body == "emitExtractReady"

def extractSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def extractSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def extractSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "extractSubsetEmitReady" with
  | none => false
  | some body => body == extractSubsetEmitReadyTermBody

def checkExtractSubsetEmitTermDialect (content : String) : Option String :=
  if !extractSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !extractSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !extractSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !extractSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineExtractSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkExtractSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckExtractSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathExtract\n" ++
  "import SystemsLean.EmitExtract\n" ++
  "namespace SystemsLean.ExtractSubsetEmit\n"

def hostModuleCheckExtractSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.ExtractSubsetEmit\n"

def hostModuleCheckExtractSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"extract-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetEmitExtractDialectOk : Bool := emitExtractReady\n" ++
  "def extractSubsetEmitReady : Bool := " ++ extractSubsetEmitReadyTermBody ++ "\n" ++
  "def extractSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodExtractSubsetEmitTermText : String :=
  hostModuleCheckExtractSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckExtractSubsetEmitTermGoodMid
    ++ hostModuleCheckExtractSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetEmitResidualText : String :=
  hostModuleCheckExtractSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"extract-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetEmitExtractDialectOk : Bool := emitExtractReady\n" ++
  "def extractSubsetEmitReady : Bool := " ++ extractSubsetEmitReadyTermBody ++ "\n" ++
  "def extractSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetEmitEmitText : String :=
  hostModuleCheckExtractSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"extract-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetEmitExtractDialectOk : Bool := true\n" ++
  "def extractSubsetEmitReady : Bool := " ++ extractSubsetEmitReadyTermBody ++ "\n" ++
  "def extractSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetEmitReadyText : String :=
  hostModuleCheckExtractSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"extract-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetEmitExtractDialectOk : Bool := emitExtractReady\n" ++
  "def extractSubsetEmitReady : Bool := true\n" ++
  "def extractSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckExtractSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadExtractSubsetEmitCompleteText : String :=
  hostModuleCheckExtractSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_EXTRACT_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-EXTRACT-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"extract-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_extract_subset.h\"\n" ++
  "def extractSubsetEmitExtractDialectOk : Bool := emitExtractReady\n" ++
  "def extractSubsetEmitReady : Bool := " ++ extractSubsetEmitReadyTermBody ++ "\n" ++
  "def extractSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def extractSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckExtractSubsetEmitTermSkeletonSuffix

def extractSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ExtractSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadExtractSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (extractSubsetEmitTermSurfaceFrom
      hostModuleCheckBadExtractSubsetEmitResidualText)
    extractSubsetEmitExpectedNamespace extractSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathExtract")).isAccept

def hostModuleCheckBadExtractSubsetEmitResidualDialectReject : Bool :=
  match checkExtractSubsetEmitTermDialect hostModuleCheckBadExtractSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadExtractSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (extractSubsetEmitTermSurfaceFrom
      hostModuleCheckBadExtractSubsetEmitEmitText)
    extractSubsetEmitExpectedNamespace extractSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathExtract")).isAccept

def hostModuleCheckBadExtractSubsetEmitEmitDialectReject : Bool :=
  match checkExtractSubsetEmitTermDialect hostModuleCheckBadExtractSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadExtractSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (extractSubsetEmitTermSurfaceFrom
      hostModuleCheckBadExtractSubsetEmitReadyText)
    extractSubsetEmitExpectedNamespace extractSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathExtract")).isAccept

def hostModuleCheckBadExtractSubsetEmitReadyDialectReject : Bool :=
  match checkExtractSubsetEmitTermDialect hostModuleCheckBadExtractSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadExtractSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (extractSubsetEmitTermSurfaceFrom
      hostModuleCheckBadExtractSubsetEmitCompleteText)
    extractSubsetEmitExpectedNamespace extractSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathExtract")).isAccept

def hostModuleCheckBadExtractSubsetEmitCompleteDialectReject : Bool :=
  match checkExtractSubsetEmitTermDialect hostModuleCheckBadExtractSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckExtractSubsetEmitTermDialectOk : Bool :=
  (checkExtractSubsetEmitTermDialect hostModuleCheckGoodExtractSubsetEmitTermText).isNone

/-- On-disk ExtractSubsetEmit extractSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodExtractSubsetEmitReadyMultilineText : String :=
  "def extractSubsetEmitReady : Bool :=\n" ++
  "  extractSubsetEmitInputReady\n" ++
  "    && extractSubsetEmitExtractDialectOk\n" ++
  "    && extractSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !extractSubsetEmitResidualFreeClaimed\n" ++
  "    && !extractSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !extractSubsetEmitProofCompleteClaimed\n" ++
  "    && !extractSubsetEmitLlvmUnlocked\n" ++
  "    && !extractSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_EXTRACT_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-EXTRACT-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"EXTRACT-SUBSET-EMIT\")\n" ++
  "    && (extractSubsetEmitInputId == \"SLAKE_EXTRACT_SUBSET_EXTRACT\")\n" ++
  "    && (lakeExeName == \"slake-extract-subset-emit\")\n" ++
  "    && (justRecipe == \"extract-subset-emit\")\n"

/-- Collapse of the on-disk multi-line extractSubsetEmitReady body. -/
def hostModuleCheckExtractSubsetEmitReadyMultilineOk : Bool :=
  extractSubsetEmitReadyBodyOk hostModuleCheckGoodExtractSubsetEmitReadyMultilineText

def hostModuleCheckExtractSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckExtractSubsetEmitTermSurfaceDualOk
    && (checkDepthExtractSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthExtractSubsetEmitTermSurfaceScope == "ExtractSubsetEmit-only")
    && hostModuleCheckExtractSubsetEmitTermDialectOk
    && hostModuleCheckBadExtractSubsetEmitResidualDialectReject
    && hostModuleCheckBadExtractSubsetEmitEmitDialectReject
    && hostModuleCheckBadExtractSubsetEmitReadyDialectReject
    && hostModuleCheckBadExtractSubsetEmitCompleteDialectReject
    && hostModuleCheckBadExtractSubsetEmitResidualL0Accept
    && hostModuleCheckBadExtractSubsetEmitEmitL0Accept
    && hostModuleCheckBadExtractSubsetEmitReadyL0Accept
    && hostModuleCheckBadExtractSubsetEmitCompleteL0Accept
    && hostModuleCheckExtractSubsetEmitReadyMultilineOk

theorem hostModuleCheckExtractSubsetEmitTermSurfaceOk_true :
    hostModuleCheckExtractSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckExtractSubsetEmitReadyMultilineOk_true :
    hostModuleCheckExtractSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_extractSubsetEmit_term_surface_ids_eq :
    checkDepthExtractSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthExtractSubsetEmitTermSurfaceScope = "ExtractSubsetEmit-only"
      && hostModuleCheckExtractSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
