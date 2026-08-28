/-
  SYSTEMS_LEAN_HOST partial -- ProgramSubsetRebuild L2 term-surface (ProgramSubsetRebuild TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ProgramSubsetRebuild dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ProgramSubsetRebuild L2 dialect subset (documented; not full Lean 4 elaborator):
  - Program rebuild self-apply body matches product (programSubsetRebuildSelfApplyOk).
  - wrote-expected body matches product (self-apply && programSubsetEmitWroteExpected).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - programSubsetRebuildReady compose matches product (input + package + self-apply).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckProgramSubsetRebuildTermSurfaceOk.

  Intentional non-claims:
  - ProgramSubsetRebuild pilot only -- not package elaborate, not FullHost re-true.
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
  - MultSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - LinearSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - TypesSubsetRebuild TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Rebuild / self-apply unit -- not emitProgramReady dialect copy.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckProgramSubsetRebuildTerm, TERM-SURFACE, ProgramSubsetRebuild-only,
  ILL-TYPED-TERM, checkProgramSubsetRebuildTermDialect,
  hostModuleCheckProgramSubsetRebuildTermDialectOk,
  hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk,
  hostModuleCheckProgramSubsetRebuildTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckProgramSubsetRebuildTerm
  Red/green: lake build SystemsLean.HostModuleCheckProgramSubsetRebuildTerm;
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

/-! ### ProgramSubsetRebuild L2 term-surface dual-ok pins (ProgramSubsetRebuild-only) -/

def checkDepthProgramSubsetRebuildTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthProgramSubsetRebuildTermSurfaceScope : String := "ProgramSubsetRebuild-only"
def hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk : Bool := true

/-- Product programSubsetRebuildSelfApplyOk fold (input + package + paths + emit write).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ProgramSubsetRebuild match. Not emitProgramReady. -/
def programSubsetRebuildSelfApplyOkTermBody : String :=
  "programSubsetRebuildInputReady && programSubsetRebuildPackagePinOk && (emitHeaderBase == \"slake_program_subset.h\") && (emitSourceBase == \"slake_program_subset.c\") && (programSubsetRebuildInputId == \"SLAKE_PROGRAM_SUBSET_EMIT_V0\") && programSubsetEmitWroteExpected && (programSubsetHeaderPackage.length > 0) && (programSubsetSourcePackage.length > 0)"

/-- Product programSubsetRebuildWroteExpected fold (self-apply && S2 write pin). -/
def programSubsetRebuildWroteExpectedTermBody : String :=
  "programSubsetRebuildSelfApplyOk && programSubsetEmitWroteExpected"

/-- Product programSubsetRebuildReady fold (input + package + self-apply + honesty).
    Same string as the collapsed real-module body so L0 fixtures and on-disk
    ProgramSubsetRebuild match. -/
def programSubsetRebuildReadyTermBody : String :=
  "programSubsetRebuildInputReady && programSubsetRebuildPackagePinOk && programSubsetRebuildSelfApplyOk && programSubsetRebuildWroteExpected && stillUsesLake && dependsOnLake && !programSubsetRebuildResidualFreeClaimed && !programSubsetRebuildProductSelfHostCompleteClaimed && !programSubsetRebuildProofCompleteClaimed && !programSubsetRebuildLlvmUnlocked && !programSubsetRebuildProvablyUnlocked && !programSubsetRebuildWithoutLakeFinishedClaimed && (stageId == \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\") && (hostId == \"HOST-PROGRAM-SUBSET-REBUILD\") && (surfaceId == \"PROGRAM-SUBSET-REBUILD\") && (programSubsetRebuildInputId == \"SLAKE_PROGRAM_SUBSET_EMIT_V0\") && (lakeExeName == \"slake-program-subset-rebuild\") && (justRecipe == \"program-subset-rebuild\") && (emitHeaderBase == \"slake_program_subset.h\") && (emitSourceBase == \"slake_program_subset.c\")"

def programSubsetRebuildSelfApplyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetRebuildSelfApplyOk" with
  | none => false
  | some body => body == programSubsetRebuildSelfApplyOkTermBody

def programSubsetRebuildWroteExpectedBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetRebuildWroteExpected" with
  | none => false
  | some body => body == programSubsetRebuildWroteExpectedTermBody

def programSubsetRebuildResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetRebuildResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def programSubsetRebuildCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetRebuildProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def programSubsetRebuildReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetRebuildReady" with
  | none => false
  | some body => body == programSubsetRebuildReadyTermBody

def checkProgramSubsetRebuildTermDialect (content : String) : Option String :=
  if !programSubsetRebuildSelfApplyBodyOk content then some reasonIllTypedTerm
  else if !programSubsetRebuildWroteExpectedBodyOk content then some reasonIllTypedTerm
  else if !programSubsetRebuildResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !programSubsetRebuildCompleteBodyOk content then some reasonIllTypedTerm
  else if !programSubsetRebuildReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineProgramSubsetRebuildWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkProgramSubsetRebuildTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckProgramSubsetRebuildTermSkeletonPrefix : String :=
  "import SystemsLean.ProgramSubsetEmit\n" ++
  "namespace SystemsLean.ProgramSubsetRebuild\n"

def hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix : String :=
  "end SystemsLean.ProgramSubsetRebuild\n"

def hostModuleCheckProgramSubsetRebuildTermGoodMid : String :=
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"program-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetRebuildSelfApplyOk : Bool := " ++ programSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def programSubsetRebuildWroteExpected : Bool := " ++ programSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def programSubsetRebuildReady : Bool := " ++ programSubsetRebuildReadyTermBody ++ "\n" ++
  "def programSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodProgramSubsetRebuildTermText : String :=
  hostModuleCheckProgramSubsetRebuildTermSkeletonPrefix
    ++ hostModuleCheckProgramSubsetRebuildTermGoodMid
    ++ hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetRebuildResidualText : String :=
  hostModuleCheckProgramSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"program-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetRebuildSelfApplyOk : Bool := " ++ programSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def programSubsetRebuildWroteExpected : Bool := " ++ programSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def programSubsetRebuildReady : Bool := " ++ programSubsetRebuildReadyTermBody ++ "\n" ++
  "def programSubsetRebuildResidualFreeClaimed : Bool := true\n" ++
  "def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetRebuildSelfApplyText : String :=
  hostModuleCheckProgramSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"program-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetRebuildSelfApplyOk : Bool := true\n" ++
  "def programSubsetRebuildWroteExpected : Bool := " ++ programSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def programSubsetRebuildReady : Bool := " ++ programSubsetRebuildReadyTermBody ++ "\n" ++
  "def programSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetRebuildReadyText : String :=
  hostModuleCheckProgramSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"program-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetRebuildSelfApplyOk : Bool := " ++ programSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def programSubsetRebuildWroteExpected : Bool := " ++ programSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def programSubsetRebuildReady : Bool := true\n" ++
  "def programSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetRebuildCompleteText : String :=
  hostModuleCheckProgramSubsetRebuildTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-REBUILD\"\n" ++
  "def justRecipe : String := \"program-subset-rebuild\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetRebuildSelfApplyOk : Bool := " ++ programSubsetRebuildSelfApplyOkTermBody ++ "\n" ++
  "def programSubsetRebuildWroteExpected : Bool := " ++ programSubsetRebuildWroteExpectedTermBody ++ "\n" ++
  "def programSubsetRebuildReady : Bool := " ++ programSubsetRebuildReadyTermBody ++ "\n" ++
  "def programSubsetRebuildResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetRebuildProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckProgramSubsetRebuildTermSkeletonSuffix

def programSubsetRebuildTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ProgramSubsetRebuild"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadProgramSubsetRebuildResidualL0Accept : Bool :=
  (checkNamedSurface (programSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadProgramSubsetRebuildResidualText)
    programSubsetRebuildExpectedNamespace programSubsetRebuildRequiredDecls
    (some "SystemsLean.ProgramSubsetEmit")).isAccept

def hostModuleCheckBadProgramSubsetRebuildResidualDialectReject : Bool :=
  match checkProgramSubsetRebuildTermDialect hostModuleCheckBadProgramSubsetRebuildResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProgramSubsetRebuildSelfApplyL0Accept : Bool :=
  (checkNamedSurface (programSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadProgramSubsetRebuildSelfApplyText)
    programSubsetRebuildExpectedNamespace programSubsetRebuildRequiredDecls
    (some "SystemsLean.ProgramSubsetEmit")).isAccept

def hostModuleCheckBadProgramSubsetRebuildSelfApplyDialectReject : Bool :=
  match checkProgramSubsetRebuildTermDialect hostModuleCheckBadProgramSubsetRebuildSelfApplyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProgramSubsetRebuildReadyL0Accept : Bool :=
  (checkNamedSurface (programSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadProgramSubsetRebuildReadyText)
    programSubsetRebuildExpectedNamespace programSubsetRebuildRequiredDecls
    (some "SystemsLean.ProgramSubsetEmit")).isAccept

def hostModuleCheckBadProgramSubsetRebuildReadyDialectReject : Bool :=
  match checkProgramSubsetRebuildTermDialect hostModuleCheckBadProgramSubsetRebuildReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProgramSubsetRebuildCompleteL0Accept : Bool :=
  (checkNamedSurface (programSubsetRebuildTermSurfaceFrom
      hostModuleCheckBadProgramSubsetRebuildCompleteText)
    programSubsetRebuildExpectedNamespace programSubsetRebuildRequiredDecls
    (some "SystemsLean.ProgramSubsetEmit")).isAccept

def hostModuleCheckBadProgramSubsetRebuildCompleteDialectReject : Bool :=
  match checkProgramSubsetRebuildTermDialect hostModuleCheckBadProgramSubsetRebuildCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckProgramSubsetRebuildTermDialectOk : Bool :=
  (checkProgramSubsetRebuildTermDialect hostModuleCheckGoodProgramSubsetRebuildTermText).isNone

/-- On-disk ProgramSubsetRebuild programSubsetRebuildReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodProgramSubsetRebuildReadyMultilineText : String :=
  "def programSubsetRebuildReady : Bool :=\n" ++
  "  programSubsetRebuildInputReady\n" ++
  "    && programSubsetRebuildPackagePinOk\n" ++
  "    && programSubsetRebuildSelfApplyOk\n" ++
  "    && programSubsetRebuildWroteExpected\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !programSubsetRebuildResidualFreeClaimed\n" ++
  "    && !programSubsetRebuildProductSelfHostCompleteClaimed\n" ++
  "    && !programSubsetRebuildProofCompleteClaimed\n" ++
  "    && !programSubsetRebuildLlvmUnlocked\n" ++
  "    && !programSubsetRebuildProvablyUnlocked\n" ++
  "    && !programSubsetRebuildWithoutLakeFinishedClaimed\n" ++
  "    && (stageId == \"SLAKE_PROGRAM_SUBSET_REBUILD_V0\")\n" ++
  "    && (hostId == \"HOST-PROGRAM-SUBSET-REBUILD\")\n" ++
  "    && (surfaceId == \"PROGRAM-SUBSET-REBUILD\")\n" ++
  "    && (programSubsetRebuildInputId == \"SLAKE_PROGRAM_SUBSET_EMIT_V0\")\n" ++
  "    && (lakeExeName == \"slake-program-subset-rebuild\")\n" ++
  "    && (justRecipe == \"program-subset-rebuild\")\n" ++
  "    && (emitHeaderBase == \"slake_program_subset.h\")\n" ++
  "    && (emitSourceBase == \"slake_program_subset.c\")\n"

/-- Collapse of the on-disk multi-line programSubsetRebuildReady body. -/
def hostModuleCheckProgramSubsetRebuildReadyMultilineOk : Bool :=
  programSubsetRebuildReadyBodyOk hostModuleCheckGoodProgramSubsetRebuildReadyMultilineText

def hostModuleCheckProgramSubsetRebuildTermSurfaceOk : Bool :=
  hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk
    && (checkDepthProgramSubsetRebuildTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthProgramSubsetRebuildTermSurfaceScope == "ProgramSubsetRebuild-only")
    && hostModuleCheckProgramSubsetRebuildTermDialectOk
    && hostModuleCheckBadProgramSubsetRebuildResidualDialectReject
    && hostModuleCheckBadProgramSubsetRebuildSelfApplyDialectReject
    && hostModuleCheckBadProgramSubsetRebuildReadyDialectReject
    && hostModuleCheckBadProgramSubsetRebuildCompleteDialectReject
    && hostModuleCheckBadProgramSubsetRebuildResidualL0Accept
    && hostModuleCheckBadProgramSubsetRebuildSelfApplyL0Accept
    && hostModuleCheckBadProgramSubsetRebuildReadyL0Accept
    && hostModuleCheckBadProgramSubsetRebuildCompleteL0Accept
    && hostModuleCheckProgramSubsetRebuildReadyMultilineOk

theorem hostModuleCheckProgramSubsetRebuildTermSurfaceOk_true :
    hostModuleCheckProgramSubsetRebuildTermSurfaceOk = true := by native_decide

theorem hostModuleCheckProgramSubsetRebuildReadyMultilineOk_true :
    hostModuleCheckProgramSubsetRebuildReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_programSubsetRebuild_term_surface_ids_eq :
    checkDepthProgramSubsetRebuildTermSurfaceBar = "TERM-SURFACE"
      && checkDepthProgramSubsetRebuildTermSurfaceScope = "ProgramSubsetRebuild-only"
      && hostModuleCheckProgramSubsetRebuildTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
