/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostModuleCheckFirstSurfaceTerm.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostModuleCheckFirstSurfaceTermSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostModuleCheckFirstSurfaceTerm.lean only. One part.
  Do not steal a neighbor checker. Do not retarget HostModuleCheckFirstSurfaceTerm.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOSTMODULECHECKFIRSTSURFACETERM,
  liveHostModuleCheckFirstSurfaceTermSource,
  HOST-FRONT-LIVE-HOSTMODULECHECKFIRSTSURFACETERM,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTermSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTerm

/-- Dual-pinned live HostModuleCheckFirstSurfaceTerm.lean bytes.
    One part. Not split. 266 lines plus this header stay under about 780.
    Greppable: liveHostModuleCheckFirstSurfaceTermSource,
    PARSE-LIVE-HOSTMODULECHECKFIRSTSURFACETERM. -/
def liveHostModuleCheckFirstSurfaceTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- FirstSurface L2 term-surface (FirstSurface TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: FirstSurface dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  FirstSurface L2 dialect subset (documented; not full Lean 4 elaborator):
  - emit Mult path body matches product fixture (multFixtureEmitPathOk).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - firstSurfaceReady compose matches product (CompilePathMult chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckFirstSurfaceTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckFirstSurfaceTermSurfaceOk.

  Intentional non-claims:
  - FirstSurface pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckFirstSurfaceTerm, TERM-SURFACE, FirstSurface-only,
  ILL-TYPED-TERM, checkFirstSurfaceTermDialect,
  hostModuleCheckFirstSurfaceTermDialectOk,
  hostModuleCheckFirstSurfaceTermSurfaceDualOk,
  hostModuleCheckFirstSurfaceTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckFirstSurfaceTerm
  Red/green: lake build SystemsLean.HostModuleCheckFirstSurfaceTerm;
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

/-! ### FirstSurface L2 term-surface dual-ok pins (FirstSurface-only) -/

def checkDepthFirstSurfaceTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthFirstSurfaceTermSurfaceScope : String := "FirstSurface-only"
def hostModuleCheckFirstSurfaceTermSurfaceDualOk : Bool := true

/-- Product firstSurfaceReady fold (CompilePathMult + local honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk FirstSurface match. -/
def firstSurfaceReadyTermBody : String :=
  "multFixtureCompilePathReady && firstSurfaceMultInputReady && firstSurfaceUnitReady && firstSurfaceEmitMultOk && stillUsesLake && dependsOnLake && !firstSurfaceResidualFreeClaimed && !firstSurfaceProductSelfHostCompleteClaimed && !firstSurfaceProofCompleteClaimed && !firstSurfaceLlvmUnlocked && !firstSurfaceProvablyUnlocked && (stageId == \"SLAKE_FIRST_SURFACE_V0\") && (hostId == \"HOST-FIRST-SURFACE\") && (surfaceId == \"FIRST-SURFACE\") && (firstSurfaceMultInputId == \"SLAKE_FIRST_SURFACE_MULT\") && (lakeExeName == \"slake-first-surface\") && (justRecipe == \"first-surface\")"

def firstSurfaceEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "firstSurfaceEmitMultOk" with
  | none => false
  | some body => body == "multFixtureEmitPathOk"

def firstSurfaceResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "firstSurfaceResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def firstSurfaceCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "firstSurfaceProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def firstSurfaceReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "firstSurfaceReady" with
  | none => false
  | some body => body == firstSurfaceReadyTermBody

def checkFirstSurfaceTermDialect (content : String) : Option String :=
  if !firstSurfaceEmitBodyOk content then some reasonIllTypedTerm
  else if !firstSurfaceResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !firstSurfaceCompleteBodyOk content then some reasonIllTypedTerm
  else if !firstSurfaceReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineFirstSurfaceWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkFirstSurfaceTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckFirstSurfaceTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathMult\n" ++
  "namespace SystemsLean.FirstSurface\n"

def hostModuleCheckFirstSurfaceTermSkeletonSuffix : String :=
  "end SystemsLean.FirstSurface\n"

def hostModuleCheckFirstSurfaceTermGoodMid : String :=
  "def stageId : String := \"SLAKE_FIRST_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-FIRST-SURFACE\"\n" ++
  "def surfaceId : String := \"FIRST-SURFACE\"\n" ++
  "def justRecipe : String := \"first-surface\"\n" ++
  "def firstSurfaceEmitMultOk : Bool := multFixtureEmitPathOk\n" ++
  "def firstSurfaceReady : Bool := " ++ firstSurfaceReadyTermBody ++ "\n" ++
  "def firstSurfaceResidualFreeClaimed : Bool := false\n" ++
  "def firstSurfaceProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodFirstSurfaceTermText : String :=
  hostModuleCheckFirstSurfaceTermSkeletonPrefix
    ++ hostModuleCheckFirstSurfaceTermGoodMid
    ++ hostModuleCheckFirstSurfaceTermSkeletonSuffix

def hostModuleCheckBadFirstSurfaceResidualText : String :=
  hostModuleCheckFirstSurfaceTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_FIRST_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-FIRST-SURFACE\"\n" ++
  "def surfaceId : String := \"FIRST-SURFACE\"\n" ++
  "def justRecipe : String := \"first-surface\"\n" ++
  "def firstSurfaceEmitMultOk : Bool := multFixtureEmitPathOk\n" ++
  "def firstSurfaceReady : Bool := " ++ firstSurfaceReadyTermBody ++ "\n" ++
  "def firstSurfaceResidualFreeClaimed : Bool := true\n" ++
  "def firstSurfaceProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckFirstSurfaceTermSkeletonSuffix

def hostModuleCheckBadFirstSurfaceEmitText : String :=
  hostModuleCheckFirstSurfaceTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_FIRST_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-FIRST-SURFACE\"\n" ++
  "def surfaceId : String := \"FIRST-SURFACE\"\n" ++
  "def justRecipe : String := \"first-surface\"\n" ++
  "def firstSurfaceEmitMultOk : Bool := true\n" ++
  "def firstSurfaceReady : Bool := " ++ firstSurfaceReadyTermBody ++ "\n" ++
  "def firstSurfaceResidualFreeClaimed : Bool := false\n" ++
  "def firstSurfaceProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckFirstSurfaceTermSkeletonSuffix

def hostModuleCheckBadFirstSurfaceReadyText : String :=
  hostModuleCheckFirstSurfaceTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_FIRST_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-FIRST-SURFACE\"\n" ++
  "def surfaceId : String := \"FIRST-SURFACE\"\n" ++
  "def justRecipe : String := \"first-surface\"\n" ++
  "def firstSurfaceEmitMultOk : Bool := multFixtureEmitPathOk\n" ++
  "def firstSurfaceReady : Bool := true\n" ++
  "def firstSurfaceResidualFreeClaimed : Bool := false\n" ++
  "def firstSurfaceProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckFirstSurfaceTermSkeletonSuffix

def hostModuleCheckBadFirstSurfaceCompleteText : String :=
  hostModuleCheckFirstSurfaceTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_FIRST_SURFACE_V0\"\n" ++
  "def hostId : String := \"HOST-FIRST-SURFACE\"\n" ++
  "def surfaceId : String := \"FIRST-SURFACE\"\n" ++
  "def justRecipe : String := \"first-surface\"\n" ++
  "def firstSurfaceEmitMultOk : Bool := multFixtureEmitPathOk\n" ++
  "def firstSurfaceReady : Bool := " ++ firstSurfaceReadyTermBody ++ "\n" ++
  "def firstSurfaceResidualFreeClaimed : Bool := false\n" ++
  "def firstSurfaceProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckFirstSurfaceTermSkeletonSuffix

def firstSurfaceTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.FirstSurface"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadFirstSurfaceResidualL0Accept : Bool :=
  (checkNamedSurface (firstSurfaceTermSurfaceFrom
      hostModuleCheckBadFirstSurfaceResidualText)
    firstSurfaceExpectedNamespace firstSurfaceRequiredDecls
    (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadFirstSurfaceResidualDialectReject : Bool :=
  match checkFirstSurfaceTermDialect hostModuleCheckBadFirstSurfaceResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadFirstSurfaceEmitL0Accept : Bool :=
  (checkNamedSurface (firstSurfaceTermSurfaceFrom
      hostModuleCheckBadFirstSurfaceEmitText)
    firstSurfaceExpectedNamespace firstSurfaceRequiredDecls
    (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadFirstSurfaceEmitDialectReject : Bool :=
  match checkFirstSurfaceTermDialect hostModuleCheckBadFirstSurfaceEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadFirstSurfaceReadyL0Accept : Bool :=
  (checkNamedSurface (firstSurfaceTermSurfaceFrom
      hostModuleCheckBadFirstSurfaceReadyText)
    firstSurfaceExpectedNamespace firstSurfaceRequiredDecls
    (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadFirstSurfaceReadyDialectReject : Bool :=
  match checkFirstSurfaceTermDialect hostModuleCheckBadFirstSurfaceReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadFirstSurfaceCompleteL0Accept : Bool :=
  (checkNamedSurface (firstSurfaceTermSurfaceFrom
      hostModuleCheckBadFirstSurfaceCompleteText)
    firstSurfaceExpectedNamespace firstSurfaceRequiredDecls
    (some "SystemsLean.CompilePathMult")).isAccept

def hostModuleCheckBadFirstSurfaceCompleteDialectReject : Bool :=
  match checkFirstSurfaceTermDialect hostModuleCheckBadFirstSurfaceCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckFirstSurfaceTermDialectOk : Bool :=
  (checkFirstSurfaceTermDialect hostModuleCheckGoodFirstSurfaceTermText).isNone

/-- On-disk FirstSurface firstSurfaceReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodFirstSurfaceReadyMultilineText : String :=
  "def firstSurfaceReady : Bool :=\n" ++
  "  multFixtureCompilePathReady\n" ++
  "    && firstSurfaceMultInputReady\n" ++
  "    && firstSurfaceUnitReady\n" ++
  "    && firstSurfaceEmitMultOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !firstSurfaceResidualFreeClaimed\n" ++
  "    && !firstSurfaceProductSelfHostCompleteClaimed\n" ++
  "    && !firstSurfaceProofCompleteClaimed\n" ++
  "    && !firstSurfaceLlvmUnlocked\n" ++
  "    && !firstSurfaceProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_FIRST_SURFACE_V0\")\n" ++
  "    && (hostId == \"HOST-FIRST-SURFACE\")\n" ++
  "    && (surfaceId == \"FIRST-SURFACE\")\n" ++
  "    && (firstSurfaceMultInputId == \"SLAKE_FIRST_SURFACE_MULT\")\n" ++
  "    && (lakeExeName == \"slake-first-surface\")\n" ++
  "    && (justRecipe == \"first-surface\")\n"

/-- Collapse of the on-disk multi-line firstSurfaceReady body. -/
def hostModuleCheckFirstSurfaceReadyMultilineOk : Bool :=
  firstSurfaceReadyBodyOk hostModuleCheckGoodFirstSurfaceReadyMultilineText

def hostModuleCheckFirstSurfaceTermSurfaceOk : Bool :=
  hostModuleCheckFirstSurfaceTermSurfaceDualOk
    && (checkDepthFirstSurfaceTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthFirstSurfaceTermSurfaceScope == "FirstSurface-only")
    && hostModuleCheckFirstSurfaceTermDialectOk
    && hostModuleCheckBadFirstSurfaceResidualDialectReject
    && hostModuleCheckBadFirstSurfaceEmitDialectReject
    && hostModuleCheckBadFirstSurfaceReadyDialectReject
    && hostModuleCheckBadFirstSurfaceCompleteDialectReject
    && hostModuleCheckBadFirstSurfaceResidualL0Accept
    && hostModuleCheckBadFirstSurfaceEmitL0Accept
    && hostModuleCheckBadFirstSurfaceReadyL0Accept
    && hostModuleCheckBadFirstSurfaceCompleteL0Accept
    && hostModuleCheckFirstSurfaceReadyMultilineOk

theorem hostModuleCheckFirstSurfaceTermSurfaceOk_true :
    hostModuleCheckFirstSurfaceTermSurfaceOk = true := by native_decide

theorem hostModuleCheckFirstSurfaceReadyMultilineOk_true :
    hostModuleCheckFirstSurfaceReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_firstSurface_term_surface_ids_eq :
    checkDepthFirstSurfaceTermSurfaceBar = "TERM-SURFACE"
      && checkDepthFirstSurfaceTermSurfaceScope = "FirstSurface-only"
      && hostModuleCheckFirstSurfaceTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

end SystemsLean.HostFrontLiveHostModuleCheckFirstSurfaceTerm
