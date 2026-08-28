/-
  SYSTEMS_LEAN_HOST partial -- ProgramSubsetEmit L2 term-surface (ProgramSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ProgramSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ProgramSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Program emit dialect body matches product (emitProgramReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - programSubsetEmitReady compose matches product (CompilePathProgram chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckProgramSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckProgramSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - ProgramSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckProgramSubsetEmitTerm, TERM-SURFACE, ProgramSubsetEmit-only,
  ILL-TYPED-TERM, checkProgramSubsetEmitTermDialect,
  hostModuleCheckProgramSubsetEmitTermDialectOk,
  hostModuleCheckProgramSubsetEmitTermSurfaceDualOk,
  hostModuleCheckProgramSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckProgramSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckProgramSubsetEmitTerm;
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

/-! ### ProgramSubsetEmit L2 term-surface dual-ok pins (ProgramSubsetEmit-only) -/

def checkDepthProgramSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthProgramSubsetEmitTermSurfaceScope : String := "ProgramSubsetEmit-only"
def hostModuleCheckProgramSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product programSubsetEmitReady fold (Program fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk ProgramSubsetEmit match. -/
def programSubsetEmitReadyTermBody : String :=
  "programSubsetEmitInputReady && programSubsetEmitProgramDialectOk && programSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !programSubsetEmitResidualFreeClaimed && !programSubsetEmitProductSelfHostCompleteClaimed && !programSubsetEmitProofCompleteClaimed && !programSubsetEmitLlvmUnlocked && !programSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_PROGRAM_SUBSET_EMIT_V0\") && (hostId == \"HOST-PROGRAM-SUBSET-EMIT\") && (surfaceId == \"PROGRAM-SUBSET-EMIT\") && (programSubsetEmitInputId == \"SLAKE_PROGRAM_SUBSET_PROGRAM\") && (lakeExeName == \"slake-program-subset-emit\") && (justRecipe == \"program-subset-emit\")"

def programSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetEmitProgramDialectOk" with
  | none => false
  | some body => body == "emitProgramReady"

def programSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def programSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def programSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "programSubsetEmitReady" with
  | none => false
  | some body => body == programSubsetEmitReadyTermBody

def checkProgramSubsetEmitTermDialect (content : String) : Option String :=
  if !programSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !programSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !programSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !programSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineProgramSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkProgramSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckProgramSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathProgram\n" ++
  "import SystemsLean.EmitProgram\n" ++
  "namespace SystemsLean.ProgramSubsetEmit\n"

def hostModuleCheckProgramSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.ProgramSubsetEmit\n"

def hostModuleCheckProgramSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  "def programSubsetEmitReady : Bool := " ++ programSubsetEmitReadyTermBody ++ "\n" ++
  "def programSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodProgramSubsetEmitTermText : String :=
  hostModuleCheckProgramSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckProgramSubsetEmitTermGoodMid
    ++ hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetEmitResidualText : String :=
  hostModuleCheckProgramSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  "def programSubsetEmitReady : Bool := " ++ programSubsetEmitReadyTermBody ++ "\n" ++
  "def programSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetEmitEmitText : String :=
  hostModuleCheckProgramSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := true\n" ++
  "def programSubsetEmitReady : Bool := " ++ programSubsetEmitReadyTermBody ++ "\n" ++
  "def programSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetEmitReadyText : String :=
  hostModuleCheckProgramSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  "def programSubsetEmitReady : Bool := true\n" ++
  "def programSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadProgramSubsetEmitCompleteText : String :=
  hostModuleCheckProgramSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_PROGRAM_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-PROGRAM-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"program-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_program_subset.h\"\n" ++
  "def programSubsetEmitProgramDialectOk : Bool := emitProgramReady\n" ++
  "def programSubsetEmitReady : Bool := " ++ programSubsetEmitReadyTermBody ++ "\n" ++
  "def programSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def programSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckProgramSubsetEmitTermSkeletonSuffix

def programSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ProgramSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadProgramSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (programSubsetEmitTermSurfaceFrom
      hostModuleCheckBadProgramSubsetEmitResidualText)
    programSubsetEmitExpectedNamespace programSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathProgram")).isAccept

def hostModuleCheckBadProgramSubsetEmitResidualDialectReject : Bool :=
  match checkProgramSubsetEmitTermDialect hostModuleCheckBadProgramSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProgramSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (programSubsetEmitTermSurfaceFrom
      hostModuleCheckBadProgramSubsetEmitEmitText)
    programSubsetEmitExpectedNamespace programSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathProgram")).isAccept

def hostModuleCheckBadProgramSubsetEmitEmitDialectReject : Bool :=
  match checkProgramSubsetEmitTermDialect hostModuleCheckBadProgramSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProgramSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (programSubsetEmitTermSurfaceFrom
      hostModuleCheckBadProgramSubsetEmitReadyText)
    programSubsetEmitExpectedNamespace programSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathProgram")).isAccept

def hostModuleCheckBadProgramSubsetEmitReadyDialectReject : Bool :=
  match checkProgramSubsetEmitTermDialect hostModuleCheckBadProgramSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadProgramSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (programSubsetEmitTermSurfaceFrom
      hostModuleCheckBadProgramSubsetEmitCompleteText)
    programSubsetEmitExpectedNamespace programSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathProgram")).isAccept

def hostModuleCheckBadProgramSubsetEmitCompleteDialectReject : Bool :=
  match checkProgramSubsetEmitTermDialect hostModuleCheckBadProgramSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckProgramSubsetEmitTermDialectOk : Bool :=
  (checkProgramSubsetEmitTermDialect hostModuleCheckGoodProgramSubsetEmitTermText).isNone

/-- On-disk ProgramSubsetEmit programSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodProgramSubsetEmitReadyMultilineText : String :=
  "def programSubsetEmitReady : Bool :=\n" ++
  "  programSubsetEmitInputReady\n" ++
  "    && programSubsetEmitProgramDialectOk\n" ++
  "    && programSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !programSubsetEmitResidualFreeClaimed\n" ++
  "    && !programSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !programSubsetEmitProofCompleteClaimed\n" ++
  "    && !programSubsetEmitLlvmUnlocked\n" ++
  "    && !programSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_PROGRAM_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-PROGRAM-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"PROGRAM-SUBSET-EMIT\")\n" ++
  "    && (programSubsetEmitInputId == \"SLAKE_PROGRAM_SUBSET_PROGRAM\")\n" ++
  "    && (lakeExeName == \"slake-program-subset-emit\")\n" ++
  "    && (justRecipe == \"program-subset-emit\")\n"

/-- Collapse of the on-disk multi-line programSubsetEmitReady body. -/
def hostModuleCheckProgramSubsetEmitReadyMultilineOk : Bool :=
  programSubsetEmitReadyBodyOk hostModuleCheckGoodProgramSubsetEmitReadyMultilineText

def hostModuleCheckProgramSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckProgramSubsetEmitTermSurfaceDualOk
    && (checkDepthProgramSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthProgramSubsetEmitTermSurfaceScope == "ProgramSubsetEmit-only")
    && hostModuleCheckProgramSubsetEmitTermDialectOk
    && hostModuleCheckBadProgramSubsetEmitResidualDialectReject
    && hostModuleCheckBadProgramSubsetEmitEmitDialectReject
    && hostModuleCheckBadProgramSubsetEmitReadyDialectReject
    && hostModuleCheckBadProgramSubsetEmitCompleteDialectReject
    && hostModuleCheckBadProgramSubsetEmitResidualL0Accept
    && hostModuleCheckBadProgramSubsetEmitEmitL0Accept
    && hostModuleCheckBadProgramSubsetEmitReadyL0Accept
    && hostModuleCheckBadProgramSubsetEmitCompleteL0Accept
    && hostModuleCheckProgramSubsetEmitReadyMultilineOk

theorem hostModuleCheckProgramSubsetEmitTermSurfaceOk_true :
    hostModuleCheckProgramSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckProgramSubsetEmitReadyMultilineOk_true :
    hostModuleCheckProgramSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_programSubsetEmit_term_surface_ids_eq :
    checkDepthProgramSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthProgramSubsetEmitTermSurfaceScope = "ProgramSubsetEmit-only"
      && hostModuleCheckProgramSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
