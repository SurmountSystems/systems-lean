/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckComposeSubsetEmitTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckComposeSubsetEmitTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckComposeSubsetEmitTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostFrontLiveHostModuleCheckCompilePathTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETEMITTERM,
  liveHostModuleCheckComposeSubsetEmitTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKCOMPOSESUBSETEMITTERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTerm

/-- Dual-pinned live HostModuleCheckComposeSubsetEmitTerm.lean bytes.
    One part. Not split. 271 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckComposeSubsetEmitTermSource,
    PARSE-LIVE-HOSTMODULECHECKCOMPOSESUBSETEMITTERM. -/
def liveHostModuleCheckComposeSubsetEmitTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ComposeSubsetEmit L2 term-surface (ComposeSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: ComposeSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  ComposeSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Compose emit dialect body matches product (emitComposeReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - composeSubsetEmitReady compose matches product (CompilePathCompose chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckComposeSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckComposeSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - ComposeSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - LinearSubsetEmit TERM-SURFACE dual-ok unchanged.
  - TypesSubsetEmit TERM-SURFACE dual-ok unchanged.
  - ProgramSubsetEmit TERM-SURFACE dual-ok unchanged.
  - GraphSubsetEmit TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckComposeSubsetEmitTerm, TERM-SURFACE, ComposeSubsetEmit-only,
  ILL-TYPED-TERM, checkComposeSubsetEmitTermDialect,
  hostModuleCheckComposeSubsetEmitTermDialectOk,
  hostModuleCheckComposeSubsetEmitTermSurfaceDualOk,
  hostModuleCheckComposeSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckComposeSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckComposeSubsetEmitTerm;
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

/-! ### ComposeSubsetEmit L2 term-surface dual-ok pins (ComposeSubsetEmit-only) -/

def checkDepthComposeSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthComposeSubsetEmitTermSurfaceScope : String := "ComposeSubsetEmit-only"
def hostModuleCheckComposeSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product composeSubsetEmitReady fold (Compose fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk ComposeSubsetEmit match. -/
def composeSubsetEmitReadyTermBody : String :=
  "composeSubsetEmitInputReady && composeSubsetEmitComposeDialectOk && composeSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !composeSubsetEmitResidualFreeClaimed && !composeSubsetEmitProductSelfHostCompleteClaimed && !composeSubsetEmitProofCompleteClaimed && !composeSubsetEmitLlvmUnlocked && !composeSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_COMPOSE_SUBSET_EMIT_V0\") && (hostId == \"HOST-COMPOSE-SUBSET-EMIT\") && (surfaceId == \"COMPOSE-SUBSET-EMIT\") && (composeSubsetEmitInputId == \"SLAKE_COMPOSE_SUBSET_COMPOSE\") && (lakeExeName == \"slake-compose-subset-emit\") && (justRecipe == \"compose-subset-emit\")"

def composeSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetEmitComposeDialectOk" with
  | none => false
  | some body => body == "emitComposeReady"

def composeSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def composeSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def composeSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "composeSubsetEmitReady" with
  | none => false
  | some body => body == composeSubsetEmitReadyTermBody

def checkComposeSubsetEmitTermDialect (content : String) : Option String :=
  if !composeSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !composeSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !composeSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !composeSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineComposeSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkComposeSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckComposeSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathCompose\n" ++
  "import SystemsLean.EmitCompose\n" ++
  "namespace SystemsLean.ComposeSubsetEmit\n"

def hostModuleCheckComposeSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.ComposeSubsetEmit\n"

def hostModuleCheckComposeSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  "def composeSubsetEmitReady : Bool := " ++ composeSubsetEmitReadyTermBody ++ "\n" ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodComposeSubsetEmitTermText : String :=
  hostModuleCheckComposeSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckComposeSubsetEmitTermGoodMid
    ++ hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetEmitResidualText : String :=
  hostModuleCheckComposeSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  "def composeSubsetEmitReady : Bool := " ++ composeSubsetEmitReadyTermBody ++ "\n" ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetEmitEmitText : String :=
  hostModuleCheckComposeSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := true\n" ++
  "def composeSubsetEmitReady : Bool := " ++ composeSubsetEmitReadyTermBody ++ "\n" ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetEmitReadyText : String :=
  hostModuleCheckComposeSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  "def composeSubsetEmitReady : Bool := true\n" ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadComposeSubsetEmitCompleteText : String :=
  hostModuleCheckComposeSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_COMPOSE_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-COMPOSE-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"compose-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_compose_subset.h\"\n" ++
  "def composeSubsetEmitComposeDialectOk : Bool := emitComposeReady\n" ++
  "def composeSubsetEmitReady : Bool := " ++ composeSubsetEmitReadyTermBody ++ "\n" ++
  "def composeSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def composeSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckComposeSubsetEmitTermSkeletonSuffix

def composeSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.ComposeSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadComposeSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (composeSubsetEmitTermSurfaceFrom
      hostModuleCheckBadComposeSubsetEmitResidualText)
    composeSubsetEmitExpectedNamespace composeSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathCompose")).isAccept

def hostModuleCheckBadComposeSubsetEmitResidualDialectReject : Bool :=
  match checkComposeSubsetEmitTermDialect hostModuleCheckBadComposeSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadComposeSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (composeSubsetEmitTermSurfaceFrom
      hostModuleCheckBadComposeSubsetEmitEmitText)
    composeSubsetEmitExpectedNamespace composeSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathCompose")).isAccept

def hostModuleCheckBadComposeSubsetEmitEmitDialectReject : Bool :=
  match checkComposeSubsetEmitTermDialect hostModuleCheckBadComposeSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadComposeSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (composeSubsetEmitTermSurfaceFrom
      hostModuleCheckBadComposeSubsetEmitReadyText)
    composeSubsetEmitExpectedNamespace composeSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathCompose")).isAccept

def hostModuleCheckBadComposeSubsetEmitReadyDialectReject : Bool :=
  match checkComposeSubsetEmitTermDialect hostModuleCheckBadComposeSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadComposeSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (composeSubsetEmitTermSurfaceFrom
      hostModuleCheckBadComposeSubsetEmitCompleteText)
    composeSubsetEmitExpectedNamespace composeSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathCompose")).isAccept

def hostModuleCheckBadComposeSubsetEmitCompleteDialectReject : Bool :=
  match checkComposeSubsetEmitTermDialect hostModuleCheckBadComposeSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckComposeSubsetEmitTermDialectOk : Bool :=
  (checkComposeSubsetEmitTermDialect hostModuleCheckGoodComposeSubsetEmitTermText).isNone

/-- On-disk ComposeSubsetEmit composeSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodComposeSubsetEmitReadyMultilineText : String :=
  "def composeSubsetEmitReady : Bool :=\n" ++
  "  composeSubsetEmitInputReady\n" ++
  "    && composeSubsetEmitComposeDialectOk\n" ++
  "    && composeSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !composeSubsetEmitResidualFreeClaimed\n" ++
  "    && !composeSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !composeSubsetEmitProofCompleteClaimed\n" ++
  "    && !composeSubsetEmitLlvmUnlocked\n" ++
  "    && !composeSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_COMPOSE_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-COMPOSE-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"COMPOSE-SUBSET-EMIT\")\n" ++
  "    && (composeSubsetEmitInputId == \"SLAKE_COMPOSE_SUBSET_COMPOSE\")\n" ++
  "    && (lakeExeName == \"slake-compose-subset-emit\")\n" ++
  "    && (justRecipe == \"compose-subset-emit\")\n"

/-- Collapse of the on-disk multi-line composeSubsetEmitReady body. -/
def hostModuleCheckComposeSubsetEmitReadyMultilineOk : Bool :=
  composeSubsetEmitReadyBodyOk hostModuleCheckGoodComposeSubsetEmitReadyMultilineText

def hostModuleCheckComposeSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckComposeSubsetEmitTermSurfaceDualOk
    && (checkDepthComposeSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthComposeSubsetEmitTermSurfaceScope == "ComposeSubsetEmit-only")
    && hostModuleCheckComposeSubsetEmitTermDialectOk
    && hostModuleCheckBadComposeSubsetEmitResidualDialectReject
    && hostModuleCheckBadComposeSubsetEmitEmitDialectReject
    && hostModuleCheckBadComposeSubsetEmitReadyDialectReject
    && hostModuleCheckBadComposeSubsetEmitCompleteDialectReject
    && hostModuleCheckBadComposeSubsetEmitResidualL0Accept
    && hostModuleCheckBadComposeSubsetEmitEmitL0Accept
    && hostModuleCheckBadComposeSubsetEmitReadyL0Accept
    && hostModuleCheckBadComposeSubsetEmitCompleteL0Accept
    && hostModuleCheckComposeSubsetEmitReadyMultilineOk

theorem hostModuleCheckComposeSubsetEmitTermSurfaceOk_true :
    hostModuleCheckComposeSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckComposeSubsetEmitReadyMultilineOk_true :
    hostModuleCheckComposeSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_composeSubsetEmit_term_surface_ids_eq :
    checkDepthComposeSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthComposeSubsetEmitTermSurfaceScope = "ComposeSubsetEmit-only"
      && hostModuleCheckComposeSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckComposeSubsetEmitTerm
