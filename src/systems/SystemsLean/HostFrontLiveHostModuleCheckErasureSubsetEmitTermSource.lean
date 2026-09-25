/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckErasureSubsetEmitTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckErasureSubsetEmitTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckErasureSubsetEmitTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckErasureSubsetEmitTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM,
  liveHostModuleCheckErasureSubsetEmitTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm

/-- Dual-pinned live HostModuleCheckErasureSubsetEmitTerm.lean bytes.
    One part. Not split. 272 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckErasureSubsetEmitTermSource,
    PARSE-LIVE-HOSTMODULECHECKERASURESUBSETEMITTERM. -/
def liveHostModuleCheckErasureSubsetEmitTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ErasureSubsetEmit L2 term-surface (ErasureSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ErasureSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ErasureSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Erasure emit dialect body matches product (emitErasureReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - erasureSubsetEmitReady compose matches product (CompilePathErasure chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckErasureSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckErasureSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - ErasureSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - GraphSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ComposeSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckErasureSubsetEmitTerm, TERM-SURFACE, ErasureSubsetEmit-only,
  ILL-TYPED-TERM, checkErasureSubsetEmitTermDialect,
  hostModuleCheckErasureSubsetEmitTermDialectOk,
  hostModuleCheckErasureSubsetEmitTermSurfaceDualOk,
  hostModuleCheckErasureSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckErasureSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckErasureSubsetEmitTerm;
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

/-! ### ErasureSubsetEmit L2 term-surface dual-ok pins (ErasureSubsetEmit-only) -/

def checkDepthErasureSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthErasureSubsetEmitTermSurfaceScope : String := "ErasureSubsetEmit-only"
def hostModuleCheckErasureSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product erasureSubsetEmitReady fold (Erasure fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk ErasureSubsetEmit match. -/
def erasureSubsetEmitReadyTermBody : String :=
  "erasureSubsetEmitInputReady && erasureSubsetEmitErasureDialectOk && erasureSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !erasureSubsetEmitResidualFreeClaimed && !erasureSubsetEmitProductSelfHostCompleteClaimed && !erasureSubsetEmitProofCompleteClaimed && !erasureSubsetEmitLlvmUnlocked && !erasureSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_ERASURE_SUBSET_EMIT_V0\") && (hostId == \"HOST-ERASURE-SUBSET-EMIT\") && (surfaceId == \"ERASURE-SUBSET-EMIT\") && (erasureSubsetEmitInputId == \"SLAKE_ERASURE_SUBSET_ERASURE\") && (lakeExeName == \"slake-erasure-subset-emit\") && (justRecipe == \"erasure-subset-emit\")"

def erasureSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetEmitErasureDialectOk" with
  | none => false
  | some body => body == "emitErasureReady"

def erasureSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def erasureSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def erasureSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "erasureSubsetEmitReady" with
  | none => false
  | some body => body == erasureSubsetEmitReadyTermBody

def checkErasureSubsetEmitTermDialect (content : String) : Option String :=
  if !erasureSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !erasureSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !erasureSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !erasureSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineErasureSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkErasureSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckErasureSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathErasure\n" ++
  "import SystemsLean.EmitErasure\n" ++
  "namespace SystemsLean.ErasureSubsetEmit\n"

def hostModuleCheckErasureSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.ErasureSubsetEmit\n"

def hostModuleCheckErasureSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  "def erasureSubsetEmitReady : Bool := " ++ erasureSubsetEmitReadyTermBody ++ "\n" ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodErasureSubsetEmitTermText : String :=
  hostModuleCheckErasureSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckErasureSubsetEmitTermGoodMid
    ++ hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetEmitResidualText : String :=
  hostModuleCheckErasureSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  "def erasureSubsetEmitReady : Bool := " ++ erasureSubsetEmitReadyTermBody ++ "\n" ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetEmitEmitText : String :=
  hostModuleCheckErasureSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := true\n" ++
  "def erasureSubsetEmitReady : Bool := " ++ erasureSubsetEmitReadyTermBody ++ "\n" ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetEmitReadyText : String :=
  hostModuleCheckErasureSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  "def erasureSubsetEmitReady : Bool := true\n" ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadErasureSubsetEmitCompleteText : String :=
  hostModuleCheckErasureSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_ERASURE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-ERASURE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"erasure-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_erasure_subset.h\"\n" ++
  "def erasureSubsetEmitErasureDialectOk : Bool := emitErasureReady\n" ++
  "def erasureSubsetEmitReady : Bool := " ++ erasureSubsetEmitReadyTermBody ++ "\n" ++
  "def erasureSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def erasureSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckErasureSubsetEmitTermSkeletonSuffix

def erasureSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ErasureSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadErasureSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetEmitTermSurfaceFrom
      hostModuleCheckBadErasureSubsetEmitResidualText)
    erasureSubsetEmitExpectedNamespace erasureSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathErasure")).isAccept

def hostModuleCheckBadErasureSubsetEmitResidualDialectReject : Bool :=
  match checkErasureSubsetEmitTermDialect hostModuleCheckBadErasureSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadErasureSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetEmitTermSurfaceFrom
      hostModuleCheckBadErasureSubsetEmitEmitText)
    erasureSubsetEmitExpectedNamespace erasureSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathErasure")).isAccept

def hostModuleCheckBadErasureSubsetEmitEmitDialectReject : Bool :=
  match checkErasureSubsetEmitTermDialect hostModuleCheckBadErasureSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadErasureSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetEmitTermSurfaceFrom
      hostModuleCheckBadErasureSubsetEmitReadyText)
    erasureSubsetEmitExpectedNamespace erasureSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathErasure")).isAccept

def hostModuleCheckBadErasureSubsetEmitReadyDialectReject : Bool :=
  match checkErasureSubsetEmitTermDialect hostModuleCheckBadErasureSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadErasureSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (erasureSubsetEmitTermSurfaceFrom
      hostModuleCheckBadErasureSubsetEmitCompleteText)
    erasureSubsetEmitExpectedNamespace erasureSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathErasure")).isAccept

def hostModuleCheckBadErasureSubsetEmitCompleteDialectReject : Bool :=
  match checkErasureSubsetEmitTermDialect hostModuleCheckBadErasureSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckErasureSubsetEmitTermDialectOk : Bool :=
  (checkErasureSubsetEmitTermDialect hostModuleCheckGoodErasureSubsetEmitTermText).isNone

/-- On-disk ErasureSubsetEmit erasureSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodErasureSubsetEmitReadyMultilineText : String :=
  "def erasureSubsetEmitReady : Bool :=\n" ++
  "  erasureSubsetEmitInputReady\n" ++
  "    && erasureSubsetEmitErasureDialectOk\n" ++
  "    && erasureSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !erasureSubsetEmitResidualFreeClaimed\n" ++
  "    && !erasureSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !erasureSubsetEmitProofCompleteClaimed\n" ++
  "    && !erasureSubsetEmitLlvmUnlocked\n" ++
  "    && !erasureSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_ERASURE_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-ERASURE-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"ERASURE-SUBSET-EMIT\")\n" ++
  "    && (erasureSubsetEmitInputId == \"SLAKE_ERASURE_SUBSET_ERASURE\")\n" ++
  "    && (lakeExeName == \"slake-erasure-subset-emit\")\n" ++
  "    && (justRecipe == \"erasure-subset-emit\")\n"

/-- Collapse of the on-disk multi-line erasureSubsetEmitReady body. -/
def hostModuleCheckErasureSubsetEmitReadyMultilineOk : Bool :=
  erasureSubsetEmitReadyBodyOk hostModuleCheckGoodErasureSubsetEmitReadyMultilineText

def hostModuleCheckErasureSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckErasureSubsetEmitTermSurfaceDualOk
    && (checkDepthErasureSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthErasureSubsetEmitTermSurfaceScope == "ErasureSubsetEmit-only")
    && hostModuleCheckErasureSubsetEmitTermDialectOk
    && hostModuleCheckBadErasureSubsetEmitResidualDialectReject
    && hostModuleCheckBadErasureSubsetEmitEmitDialectReject
    && hostModuleCheckBadErasureSubsetEmitReadyDialectReject
    && hostModuleCheckBadErasureSubsetEmitCompleteDialectReject
    && hostModuleCheckBadErasureSubsetEmitResidualL0Accept
    && hostModuleCheckBadErasureSubsetEmitEmitL0Accept
    && hostModuleCheckBadErasureSubsetEmitReadyL0Accept
    && hostModuleCheckBadErasureSubsetEmitCompleteL0Accept
    && hostModuleCheckErasureSubsetEmitReadyMultilineOk

theorem hostModuleCheckErasureSubsetEmitTermSurfaceOk_true :
    hostModuleCheckErasureSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckErasureSubsetEmitReadyMultilineOk_true :
    hostModuleCheckErasureSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_erasureSubsetEmit_term_surface_ids_eq :
    checkDepthErasureSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthErasureSubsetEmitTermSurfaceScope = "ErasureSubsetEmit-only"
      && hostModuleCheckErasureSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckErasureSubsetEmitTerm
