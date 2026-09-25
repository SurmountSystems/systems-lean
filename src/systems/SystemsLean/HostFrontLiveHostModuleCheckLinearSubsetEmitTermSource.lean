/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckLinearSubsetEmitTerm.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckLinearSubsetEmitTerm.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckLinearSubsetEmitTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-LINEAR-SUBSET-EMIT-TERM.
  Module: SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckLinearSubsetEmitTerm.lean"

/-- Pinned live HostModuleCheckLinearSubsetEmitTerm.lean bytes. -/
def liveHostModuleCheckLinearSubsetEmitTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LinearSubsetEmit L2 term-surface (LinearSubsetEmit TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: LinearSubsetEmit dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  LinearSubsetEmit L2 dialect subset (documented; not full Lean 4 elaborator):
  - Linear emit dialect body matches product (emitLinearReady).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - linearSubsetEmitReady compose matches product (CompilePathLinear chain).

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckLinearSubsetEmitTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckLinearSubsetEmitTermSurfaceOk.

  Intentional non-claims:
  - LinearSubsetEmit pilot only -- not package elaborate, not FullHost re-true.
  - Mult..Extract TERM-SURFACE dual-ok unchanged.
  - FirstSurface TERM-SURFACE dual-ok unchanged.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckLinearSubsetEmitTerm, TERM-SURFACE, LinearSubsetEmit-only,
  ILL-TYPED-TERM, checkLinearSubsetEmitTermDialect,
  hostModuleCheckLinearSubsetEmitTermDialectOk,
  hostModuleCheckLinearSubsetEmitTermSurfaceDualOk,
  hostModuleCheckLinearSubsetEmitTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckLinearSubsetEmitTerm
  Red/green: lake build SystemsLean.HostModuleCheckLinearSubsetEmitTerm;
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

/-! ### LinearSubsetEmit L2 term-surface dual-ok pins (LinearSubsetEmit-only) -/

def checkDepthLinearSubsetEmitTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthLinearSubsetEmitTermSurfaceScope : String := "LinearSubsetEmit-only"
def hostModuleCheckLinearSubsetEmitTermSurfaceDualOk : Bool := true

/-- Product linearSubsetEmitReady fold (Linear fixture + dialect + honesty). Same string
    as the collapsed real-module body so L0 fixtures and on-disk LinearSubsetEmit match. -/
def linearSubsetEmitReadyTermBody : String :=
  "linearSubsetEmitInputReady && linearSubsetEmitLinearDialectOk && linearSubsetEmitPackageOk && stillUsesLake && dependsOnLake && !linearSubsetEmitResidualFreeClaimed && !linearSubsetEmitProductSelfHostCompleteClaimed && !linearSubsetEmitProofCompleteClaimed && !linearSubsetEmitLlvmUnlocked && !linearSubsetEmitProvablyUnlocked && (stageId == \"SLAKE_LINEAR_SUBSET_EMIT_V0\") && (hostId == \"HOST-LINEAR-SUBSET-EMIT\") && (surfaceId == \"LINEAR-SUBSET-EMIT\") && (linearSubsetEmitInputId == \"SLAKE_LINEAR_SUBSET_LINEAR\") && (lakeExeName == \"slake-linear-subset-emit\") && (justRecipe == \"linear-subset-emit\")"

def linearSubsetEmitEmitBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetEmitLinearDialectOk" with
  | none => false
  | some body => body == "emitLinearReady"

def linearSubsetEmitResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetEmitResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def linearSubsetEmitCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetEmitProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def linearSubsetEmitReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "linearSubsetEmitReady" with
  | none => false
  | some body => body == linearSubsetEmitReadyTermBody

def checkLinearSubsetEmitTermDialect (content : String) : Option String :=
  if !linearSubsetEmitEmitBodyOk content then some reasonIllTypedTerm
  else if !linearSubsetEmitResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !linearSubsetEmitCompleteBodyOk content then some reasonIllTypedTerm
  else if !linearSubsetEmitReadyBodyOk content then some reasonIllTypedTerm
  else none

def refineLinearSubsetEmitWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkLinearSubsetEmitTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckLinearSubsetEmitTermSkeletonPrefix : String :=
  "import SystemsLean.CompilePathLinear\n" ++
  "import SystemsLean.EmitLinear\n" ++
  "namespace SystemsLean.LinearSubsetEmit\n"

def hostModuleCheckLinearSubsetEmitTermSkeletonSuffix : String :=
  "end SystemsLean.LinearSubsetEmit\n"

def hostModuleCheckLinearSubsetEmitTermGoodMid : String :=
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  "def linearSubsetEmitReady : Bool := " ++ linearSubsetEmitReadyTermBody ++ "\n" ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n"

def hostModuleCheckGoodLinearSubsetEmitTermText : String :=
  hostModuleCheckLinearSubsetEmitTermSkeletonPrefix
    ++ hostModuleCheckLinearSubsetEmitTermGoodMid
    ++ hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetEmitResidualText : String :=
  hostModuleCheckLinearSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  "def linearSubsetEmitReady : Bool := " ++ linearSubsetEmitReadyTermBody ++ "\n" ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := true\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetEmitEmitText : String :=
  hostModuleCheckLinearSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := true\n" ++
  "def linearSubsetEmitReady : Bool := " ++ linearSubsetEmitReadyTermBody ++ "\n" ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetEmitReadyText : String :=
  hostModuleCheckLinearSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  "def linearSubsetEmitReady : Bool := true\n" ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := false\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

def hostModuleCheckBadLinearSubsetEmitCompleteText : String :=
  hostModuleCheckLinearSubsetEmitTermSkeletonPrefix ++
  "def stageId : String := \"SLAKE_LINEAR_SUBSET_EMIT_V0\"\n" ++
  "def hostId : String := \"HOST-LINEAR-SUBSET-EMIT\"\n" ++
  "def justRecipe : String := \"linear-subset-emit\"\n" ++
  "def emitHeaderBase : String := \"slake_linear_subset.h\"\n" ++
  "def linearSubsetEmitLinearDialectOk : Bool := emitLinearReady\n" ++
  "def linearSubsetEmitReady : Bool := " ++ linearSubsetEmitReadyTermBody ++ "\n" ++
  "def linearSubsetEmitResidualFreeClaimed : Bool := false\n" ++
  "def linearSubsetEmitProductSelfHostCompleteClaimed : Bool := true\n" ++
  hostModuleCheckLinearSubsetEmitTermSkeletonSuffix

def linearSubsetEmitTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.LinearSubsetEmit"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def hostModuleCheckBadLinearSubsetEmitResidualL0Accept : Bool :=
  (checkNamedSurface (linearSubsetEmitTermSurfaceFrom
      hostModuleCheckBadLinearSubsetEmitResidualText)
    linearSubsetEmitExpectedNamespace linearSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathLinear")).isAccept

def hostModuleCheckBadLinearSubsetEmitResidualDialectReject : Bool :=
  match checkLinearSubsetEmitTermDialect hostModuleCheckBadLinearSubsetEmitResidualText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLinearSubsetEmitEmitL0Accept : Bool :=
  (checkNamedSurface (linearSubsetEmitTermSurfaceFrom
      hostModuleCheckBadLinearSubsetEmitEmitText)
    linearSubsetEmitExpectedNamespace linearSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathLinear")).isAccept

def hostModuleCheckBadLinearSubsetEmitEmitDialectReject : Bool :=
  match checkLinearSubsetEmitTermDialect hostModuleCheckBadLinearSubsetEmitEmitText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLinearSubsetEmitReadyL0Accept : Bool :=
  (checkNamedSurface (linearSubsetEmitTermSurfaceFrom
      hostModuleCheckBadLinearSubsetEmitReadyText)
    linearSubsetEmitExpectedNamespace linearSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathLinear")).isAccept

def hostModuleCheckBadLinearSubsetEmitReadyDialectReject : Bool :=
  match checkLinearSubsetEmitTermDialect hostModuleCheckBadLinearSubsetEmitReadyText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadLinearSubsetEmitCompleteL0Accept : Bool :=
  (checkNamedSurface (linearSubsetEmitTermSurfaceFrom
      hostModuleCheckBadLinearSubsetEmitCompleteText)
    linearSubsetEmitExpectedNamespace linearSubsetEmitRequiredDecls
    (some "SystemsLean.CompilePathLinear")).isAccept

def hostModuleCheckBadLinearSubsetEmitCompleteDialectReject : Bool :=
  match checkLinearSubsetEmitTermDialect hostModuleCheckBadLinearSubsetEmitCompleteText with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckLinearSubsetEmitTermDialectOk : Bool :=
  (checkLinearSubsetEmitTermDialect hostModuleCheckGoodLinearSubsetEmitTermText).isNone

/-- On-disk LinearSubsetEmit linearSubsetEmitReady is multi-line. Collapse must accept
    that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodLinearSubsetEmitReadyMultilineText : String :=
  "def linearSubsetEmitReady : Bool :=\n" ++
  "  linearSubsetEmitInputReady\n" ++
  "    && linearSubsetEmitLinearDialectOk\n" ++
  "    && linearSubsetEmitPackageOk\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !linearSubsetEmitResidualFreeClaimed\n" ++
  "    && !linearSubsetEmitProductSelfHostCompleteClaimed\n" ++
  "    && !linearSubsetEmitProofCompleteClaimed\n" ++
  "    && !linearSubsetEmitLlvmUnlocked\n" ++
  "    && !linearSubsetEmitProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_LINEAR_SUBSET_EMIT_V0\")\n" ++
  "    && (hostId == \"HOST-LINEAR-SUBSET-EMIT\")\n" ++
  "    && (surfaceId == \"LINEAR-SUBSET-EMIT\")\n" ++
  "    && (linearSubsetEmitInputId == \"SLAKE_LINEAR_SUBSET_LINEAR\")\n" ++
  "    && (lakeExeName == \"slake-linear-subset-emit\")\n" ++
  "    && (justRecipe == \"linear-subset-emit\")\n"

/-- Collapse of the on-disk multi-line linearSubsetEmitReady body. -/
def hostModuleCheckLinearSubsetEmitReadyMultilineOk : Bool :=
  linearSubsetEmitReadyBodyOk hostModuleCheckGoodLinearSubsetEmitReadyMultilineText

def hostModuleCheckLinearSubsetEmitTermSurfaceOk : Bool :=
  hostModuleCheckLinearSubsetEmitTermSurfaceDualOk
    && (checkDepthLinearSubsetEmitTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthLinearSubsetEmitTermSurfaceScope == "LinearSubsetEmit-only")
    && hostModuleCheckLinearSubsetEmitTermDialectOk
    && hostModuleCheckBadLinearSubsetEmitResidualDialectReject
    && hostModuleCheckBadLinearSubsetEmitEmitDialectReject
    && hostModuleCheckBadLinearSubsetEmitReadyDialectReject
    && hostModuleCheckBadLinearSubsetEmitCompleteDialectReject
    && hostModuleCheckBadLinearSubsetEmitResidualL0Accept
    && hostModuleCheckBadLinearSubsetEmitEmitL0Accept
    && hostModuleCheckBadLinearSubsetEmitReadyL0Accept
    && hostModuleCheckBadLinearSubsetEmitCompleteL0Accept
    && hostModuleCheckLinearSubsetEmitReadyMultilineOk

theorem hostModuleCheckLinearSubsetEmitTermSurfaceOk_true :
    hostModuleCheckLinearSubsetEmitTermSurfaceOk = true := by native_decide

theorem hostModuleCheckLinearSubsetEmitReadyMultilineOk_true :
    hostModuleCheckLinearSubsetEmitReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_linearSubsetEmit_term_surface_ids_eq :
    checkDepthLinearSubsetEmitTermSurfaceBar = "TERM-SURFACE"
      && checkDepthLinearSubsetEmitTermSurfaceScope = "LinearSubsetEmit-only"
      && hostModuleCheckLinearSubsetEmitTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckLinearSubsetEmitTermSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckLinearSubsetEmitTermSourceReady : Bool :=
  liveRel == "HostModuleCheckLinearSubsetEmitTerm.lean"
    && kernelCheckLiveHostModuleCheckLinearSubsetEmitTermSource liveHostModuleCheckLinearSubsetEmitTermSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckLinearSubsetEmitTermSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckLinearSubsetEmitTerm.lean")
  let k := kernelCheckLiveHostModuleCheckLinearSubsetEmitTermSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckLinearSubsetEmitTerm parse false")
  unless hostFrontLiveHostModuleCheckLinearSubsetEmitTermSourceReady do
    throw (IO.userError "ready false")

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLive root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveHostModuleCheckLinearSubsetEmitTermSource
