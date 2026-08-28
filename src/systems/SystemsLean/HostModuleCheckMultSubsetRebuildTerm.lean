/-
  SYSTEMS_LEAN_HOST partial -- MultSubsetRebuild L2 term-surface (MultSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: MultSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  MultSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Mult rebuild self-apply body matches product (multSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && multSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - multSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckMultSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckMultSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - MultSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - GraphSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ComposeSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ErasureSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ExtractSubsetEmit TERM-SURFACE dual-ok unchanged.
  - MultSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitMultReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckMultSubsetRebuildTerm, TERM-SURFACE, MultSubsetRebuild-only,
  ILL-TYPED-TERM, checkMultSubsetRebuildTermDialect,
  hostModuleCheckMultSubsetRebuildTermDialectOk,
  hostModuleCheckMultSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckMultSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckMultSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckMultSubsetRebuildTerm;
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

/-! ### MultSubsetRebuild L2 term-surface dual-ok pins (MultSubsetRebuild-only) -/

def checkDepthMultSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthMultSubsetRebuildTermSurfaceScope : String := "MultSubsetRebuild-only"
def hostModuleCheckMultSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product multSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    MultSubsetRebuild match. Not emitMultReady. -/
def multSubsetRebuildSelfApplyOkTermBody : String :=
  "multSubsetRebuildInputReady && multSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_mult_subset.h\") && (emitSourceBase == \"slake_mult_subset.c\") && (multSubsetRebuildInputId == \"SLAKE_MULT_SUBSET_EMIT_V0\") && multSubsetEmitWroteExpected && (multSubsetHeaderPackage.length > 0) && (multSubsetSourcePackage.length > 0)"

/-- Product multSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def multSubsetRebuildWroteExpectedTermBody : String :=
  "multSubsetRebuildSelfApplyOk && multSubsetEmitWroteExpected"

/-- Product multSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    MultSubsetRebuild match. -/
def multSubsetRebuildReadyTermBody : String :=
  "multSubsetRebuildInputReady && multSubsetRebuildPackagePinOk && multSubsetRebuildSelfApplyOk && multSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !multSubsetRebuildResidualFreeClaimed && !multSubsetRebuildProductSelfHostCompleteClaimed && !multSubsetRebuildProofCompleteClaimed && !multSubsetRebuildLlvmUnlocked && !multSubsetRebuildProvablyUnlocked && (stageId == \"SLAKE_MULT_SUBSET_REBUILD_V0\") && (hostId == \"HOST-MULT-SUBSET-REBUILD\") && (surfaceId == \"MULT-SUBSET-REBUILD\") && (multSubsetRebuildInputId == \"SLAKE_MULT_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-mult-subset-rebuild\") && (justRecipe == \"mult-subset-rebuild\") && (justRecipeWithoutLake == \"mult-subset-rebuild-without-lake\") && (prebuiltMultRebuildRel == \".lake/build/bin/slake-mult-subset-rebuild\") && (emitHeaderBase == \"slake_mult_subset.h\") && (emitSourceBase == \"slake_mult_subset.c\")"

def multSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == multSubsetRebuildSelfApplyOkTermBody

def multSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == multSubsetRebuildWroteExpectedTermBody

def multSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def multSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def multSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multSubsetRebuildReady" with
  | none => false
  | some body => body == multSubsetRebuildReadyTermBody

def checkMultSubsetRebuildTermDialect (content : String) : Option String :=
  if !multSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !multSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !multSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !multSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !multSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineMultSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkMultSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckMultSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.MultSubsetEmit\n" ++
  "namespace SystemsLean.MultSubsetRebuild\n"

def hostModuleCheckMultSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.MultSubsetRebuild\n"

def hostModuleCheckMultSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"mult-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetRebuildSelfApplyOk : Bool := " ++ multSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def multSubsetRebuildWroteExpected : Bool := " ++ multSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def multSubsetRebuildReady : Bool := " ++ multSubsetRebuildReadyTermBody ++ "\n" ++
  "def multSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodMultSubsetRebuildTermText : String :=
  hostModuleCheckMultSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckMultSubsetRebuildTermGoodMid
    ++ hostModuleCheckMultSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadMultSubsetRebuildResidualText : String :=
  hostModuleCheckMultSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"mult-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetRebuildSelfApplyOk : Bool := " ++ multSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def multSubsetRebuildWroteExpected : Bool := " ++ multSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def multSubsetRebuildReady : Bool := " ++ multSubsetRebuildReadyTermBody ++ "\n" ++
  "def multSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadMultSubsetRebuildSelfApplyText : String :=
  hostModuleCheckMultSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"mult-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def multSubsetRebuildWroteExpected : Bool := " ++ multSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def multSubsetRebuildReady : Bool := " ++ multSubsetRebuildReadyTermBody ++ "\n" ++
  "def multSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadMultSubsetRebuildReadyText : String :=
  hostModuleCheckMultSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"mult-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetRebuildSelfApplyOk : Bool := " ++ multSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def multSubsetRebuildWroteExpected : Bool := " ++ multSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def multSubsetRebuildReady : Bool := true\n" ++
  "def multSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckMultSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadMultSubsetRebuildCompleteText : String :=
  hostModuleCheckMultSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_MULT_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"mult-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_mult_subset.h\"\n" ++
  "def multSubsetRebuildSelfApplyOk : Bool := " ++ multSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def multSubsetRebuildWroteExpected : Bool := " ++ multSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def multSubsetRebuildReady : Bool := " ++ multSubsetRebuildReadyTermBody ++ "\n" ++
  "def multSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def multSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckMultSubsetRebuildTermSkeletonSuffix

def multSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.MultSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadMultSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (multSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadMultSubsetRebuildResidualText)
    multSubsetRebuildExpectedNamespace multSubsetRebuildRequiredDecls
    (some "SystemsLean.MultSubsetEmit")).isAccept

def hostModuleCheckBadMultSubsetRebuildResidualDialectReject : Bool :=
  match checkMultSubsetRebuildTermDialect hostModuleCheckBadMultSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (multSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadMultSubsetRebuildSelfApplyText)
    multSubsetRebuildExpectedNamespace multSubsetRebuildRequiredDecls
    (some "SystemsLean.MultSubsetEmit")).isAccept

def hostModuleCheckBadMultSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkMultSubsetRebuildTermDialect hostModuleCheckBadMultSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (multSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadMultSubsetRebuildReadyText)
    multSubsetRebuildExpectedNamespace multSubsetRebuildRequiredDecls
    (some "SystemsLean.MultSubsetEmit")).isAccept

def hostModuleCheckBadMultSubsetRebuildReadyDialectReject : Bool :=
  match checkMultSubsetRebuildTermDialect hostModuleCheckBadMultSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (multSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadMultSubsetRebuildCompleteText)
    multSubsetRebuildExpectedNamespace multSubsetRebuildRequiredDecls
    (some "SystemsLean.MultSubsetEmit")).isAccept

def hostModuleCheckBadMultSubsetRebuildCompleteDialectReject : Bool :=
  match checkMultSubsetRebuildTermDialect hostModuleCheckBadMultSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckMultSubsetRebuildTermDialectOk : Bool :=
  (checkMultSubsetRebuildTermDialect hostModuleCheckGoodMultSubsetRebuildTermText).isNone

/-- On-disk MultSubsetRebuild multSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodMultSubsetRebuildReadyMultilineText : String :=
  "def multSubsetRebuildReady : Bool :=\n" ++
  "  multSubsetRebuildInputReady\n" ++
  "    && multSubsetRebuildPackagePinOk\n" ++
  "    && multSubsetRebuildSelfApplyOk\n" ++
  "    && multSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !multSubsetRebuildResidualFreeClaimed\n" ++
  "    && !multSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !multSubsetRebuildProofCompleteClaimed\n" ++
  "    && !multSubsetRebuildLlvmUnlocked\n" ++
  "    && !multSubsetRebuildProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_MULT_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-MULT-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"MULT-SUBSET-REBUILD\")\n" ++
  "    && (multSubsetRebuildInputId == \"SLAKE_MULT_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-mult-subset-rebuild\")\n" ++
  "    && (justRecipe == \"mult-subset-rebuild\")\n" ++
  "    && (justRecipeWithoutLake == \"mult-subset-rebuild-without-lake\")\n" ++
  "    && (prebuiltMultRebuildRel == \".lake/build/bin/slake-mult-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_mult_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_mult_subset.c\")\n"

/-- Collapse of the on-disk multi-line multSubsetRebuildReady body. -/
def hostModuleCheckMultSubsetRebuildReadyMultilineOk : Bool :=
  multSubsetRebuildReadyBodyOk hostModuleCheckGoodMultSubsetRebuildReadyMultilineText

def hostModuleCheckMultSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckMultSubsetRebuildTermSurfaceDualOk
    && (checkDepthMultSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthMultSubsetRebuildTermSurfaceScope == "MultSubsetRebuild-only")
    && hostModuleCheckMultSubsetRebuildTermDialectOk
    && hostModuleCheckBadMultSubsetRebuildResidualDialectReject
    && hostModuleCheckBadMultSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadMultSubsetRebuildReadyDialectReject
    && hostModuleCheckBadMultSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadMultSubsetRebuildResidualL0Accept
    && hostModuleCheckBadMultSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadMultSubsetRebuildReadyL0Accept
    && hostModuleCheckBadMultSubsetRebuildCompleteL0Accept
    && hostModuleCheckMultSubsetRebuildReadyMultilineOk

theorem hostModuleCheckMultSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckMultSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckMultSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckMultSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_multSubsetRebuild_term_surface_ids_eq :
    checkDepthMultSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthMultSubsetRebuildTermSurfaceScope = "MultSubsetRebuild-only"
      && hostModuleCheckMultSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
