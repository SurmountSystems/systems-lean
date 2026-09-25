/-
  SYSTEMS_LEAN_HOST partial -- live HostModuleCheckMultFsDeepenTerm.lean.
  Pinned text only. This module does not import the product module.
  The product bytes stay inside the string. Not a compile of that file.
  liveRel is HostModuleCheckMultFsDeepenTerm.lean. Not a path.
  Greppable: liveRel, kernelCheckLiveHostModuleCheckMultFsDeepenTermSource,
  PARSE-LIVE-HOST-MODULE-CHECK-MULT-FS-DEEPEN-TERM.
  Module: SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource
  Not FullHost. FullBackend stays false. Not a backend.
  Occupancy stays 49. Mill stays 69 of 69.
  slakeOwnsPackageTypecheck stays false.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveLlvmComposeTextMainSource
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource

open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveLlvmComposeTextMain

/-- Live basename. Filename only, not a path. -/
def liveRel : String := "HostModuleCheckMultFsDeepenTerm.lean"

/-- Pinned live HostModuleCheckMultFsDeepenTerm.lean bytes. -/
def liveHostModuleCheckMultFsDeepenTermSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- Mult freestanding deepen L2 term-surface
  (MultFsDeepen TERM).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file split role: MultFsDeepen dialect term checks only. Same namespace
  SystemsLean.HostModuleCheck.

  Mult freestanding deepen L2 dialect subset (documented; not full Lean 4
  elaborator):
  - multFsDeepenReady compose matches product (partial + dialect + package
    surface + without-Lake finished + not-prebuilt-only + keeps host Lake +
    Lake + living false residual-free / complete / proof / llvm / PROVABLY
    + ids).
  - residual-free honesty pin false.
  - product-complete honesty pin false.
  - proof / llvm / PROVABLY honesty pins false.
  - stillUsesLake / dependsOnLake true.
  - Not HostFront dialect. Not rebuild / self-apply. Not emit*Ready.
  - Not LLVM IR text. Not llvm-as / rust-link / production backend.
  - Not MultFsWriteTool writer dialect.

  Dual-ok honesty (E-bad, not bare pin):
  - hostModuleCheckMultFsDeepenTermSurfaceDualOk is the named claim pin.
  - Gate truth is hostModuleCheckMultFsDeepenTermSurfaceOk.

  Intentional non-claims:
  - Mult freestanding deepen only -- not fragment front-end, not package
    elaborate, not FullHost re-true.
  - Not rebuild / self-apply. Not emit*Ready. Not ExtractSubsetRebuild.
  - Not full elaborator typecheck. Not freestanding residual free. Not PROVABLY.
  - Product StillUsesLake / DependsOnLake remain. Not llvm unlock.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK,
  HostModuleCheckMultFsDeepenTerm, TERM-SURFACE, MultFsDeepen-only,
  ILL-TYPED-TERM, checkMultFsDeepenTermDialect,
  hostModuleCheckMultFsDeepenTermDialectOk,
  hostModuleCheckMultFsDeepenTermSurfaceDualOk,
  hostModuleCheckMultFsDeepenTermSurfaceOk,
  PARTIAL-STRUCTURAL, FOUNDATION-KIND-SURFACE, UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Module: SystemsLean.HostModuleCheckMultFsDeepenTerm
  Red/green: lake build SystemsLean.HostModuleCheckMultFsDeepenTerm;
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

/-! ### MultFsDeepen L2 term-surface dual-ok pins (MultFsDeepen-only) -/

def checkDepthMultFsDeepenTermSurfaceBar : String := "TERM-SURFACE"
def checkDepthMultFsDeepenTermSurfaceScope : String := "MultFsDeepen-only"
def hostModuleCheckMultFsDeepenTermSurfaceDualOk : Bool := true

/-- Product multFsDeepenReady fold (partial + dialect + package + without-Lake
    + not-prebuilt + host Lake + living false claims + ids). Same string as the
    collapsed on-disk MultFsDeepen body so L0 fixtures and product match. -/
def multFsDeepenReadyTermBody : String :=
  "freestandingDeepenPartial && multFsDeepenDialectShared && multFsDeepenPackageSurfaceOk && multFsDeepenWithoutLakeFinishedOk && multFsDeepenNotPrebuiltOnly && multFsDeepenKeepsHostLake && stillUsesLake && dependsOnLake && !multFsDeepenResidualFreeClaimed && !multFsDeepenProductSelfHostCompleteClaimed && !multFsDeepenProofCompleteClaimed && !multFsDeepenLlvmUnlocked && !multFsDeepenProvablyUnlocked && (stageId == \"SLAKE_MULT_FS_DEEPEN_V0\") && (hostId == \"HOST-MULT-FS-DEEPEN\") && (surfaceId == \"MULT-FS-DEEPEN\") && (justRecipeFsDeepen == \"mult-subset-freestanding-deepen\")"

def multFsDeepenReadyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsDeepenReady" with
  | none => false
  | some body => body == multFsDeepenReadyTermBody

def multFsDeepenResidualFreeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsDeepenResidualFreeClaimed" with
  | none => false
  | some body => body == "false"

def multFsDeepenCompleteBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsDeepenProductSelfHostCompleteClaimed" with
  | none => false
  | some body => body == "false"

def multFsDeepenProofBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsDeepenProofCompleteClaimed" with
  | none => false
  | some body => body == "false"

def multFsDeepenLlvmBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsDeepenLlvmUnlocked" with
  | none => false
  | some body => body == "false"

def multFsDeepenProvablyBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "multFsDeepenProvablyUnlocked" with
  | none => false
  | some body => body == "false"

def multFsDeepenStillUsesLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "stillUsesLake" with
  | none => false
  | some body => body == "true"

def multFsDeepenDependsOnLakeBodyOk (content : String) : Bool :=
  match emitPlanDefBodyCollapsed content "dependsOnLake" with
  | none => false
  | some body => body == "true"

def checkMultFsDeepenTermDialect (content : String) : Option String :=
  if !multFsDeepenReadyBodyOk content then some reasonIllTypedTerm
  else if !multFsDeepenResidualFreeBodyOk content then some reasonIllTypedTerm
  else if !multFsDeepenCompleteBodyOk content then some reasonIllTypedTerm
  else if !multFsDeepenProofBodyOk content then some reasonIllTypedTerm
  else if !multFsDeepenLlvmBodyOk content then some reasonIllTypedTerm
  else if !multFsDeepenProvablyBodyOk content then some reasonIllTypedTerm
  else if !multFsDeepenStillUsesLakeBodyOk content then some reasonIllTypedTerm
  else if !multFsDeepenDependsOnLakeBodyOk content then some reasonIllTypedTerm
  else none

def refineMultFsDeepenWithTermSurface (structural : ModuleCheckResult)
    (content : String) : ModuleCheckResult :=
  match structural with
  | ModuleCheckResult.reject r => ModuleCheckResult.reject r
  | ModuleCheckResult.accept s =>
    match checkMultFsDeepenTermDialect content with
    | some reason => ModuleCheckResult.reject reason
    | none => ModuleCheckResult.accept s

def hostModuleCheckMultFsDeepenTermSkeletonPrefix : String :=
  "import SystemsLean.MultSubsetRebuild\n" ++
  "namespace SystemsLean.MultFsDeepen\n"

def hostModuleCheckMultFsDeepenTermSkeletonSuffix : String :=
  "end SystemsLean.MultFsDeepen\n"

/-- Honest MultFsDeepen TERM mid: required L0 decls plus living claim pins. -/
def multFsDeepenTermGoodPins (readyBody residual complete proof llvm
    provably lake : String) : String :=
  "def stageId : String := \"SLAKE_MULT_FS_DEEPEN_V0\"\n" ++
  "def hostId : String := \"HOST-MULT-FS-DEEPEN\"\n" ++
  "def surfaceId : String := \"MULT-FS-DEEPEN\"\n" ++
  "def justRecipeFsDeepen : String := \"mult-subset-freestanding-deepen\"\n" ++
  "def stillUsesLake : Bool := " ++ lake ++ "\n" ++
  "def dependsOnLake : Bool := true\n" ++
  "def multFsDeepenResidualFreeClaimed : Bool := " ++ residual ++ "\n" ++
  "def multFsDeepenProductSelfHostCompleteClaimed : Bool := " ++ complete ++ "\n" ++
  "def multFsDeepenProofCompleteClaimed : Bool := " ++ proof ++ "\n" ++
  "def multFsDeepenLlvmUnlocked : Bool := " ++ llvm ++ "\n" ++
  "def multFsDeepenProvablyUnlocked : Bool := " ++ provably ++ "\n" ++
  "def multFsDeepenReady : Bool := " ++ readyBody ++ "\n"

def hostModuleCheckMultFsDeepenTermGoodMid : String :=
  multFsDeepenTermGoodPins multFsDeepenReadyTermBody
    "false" "false" "false" "false" "false" "true"

def hostModuleCheckGoodMultFsDeepenTermText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ hostModuleCheckMultFsDeepenTermGoodMid
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def hostModuleCheckBadMultFsDeepenResidualText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ multFsDeepenTermGoodPins multFsDeepenReadyTermBody
      "true" "false" "false" "false" "false" "true"
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def hostModuleCheckBadMultFsDeepenCompleteText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ multFsDeepenTermGoodPins multFsDeepenReadyTermBody
      "false" "true" "false" "false" "false" "true"
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def hostModuleCheckBadMultFsDeepenReadyText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ multFsDeepenTermGoodPins "true"
      "false" "false" "false" "false" "false" "true"
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def hostModuleCheckBadMultFsDeepenProofText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ multFsDeepenTermGoodPins multFsDeepenReadyTermBody
      "false" "false" "true" "false" "false" "true"
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def hostModuleCheckBadMultFsDeepenLlvmText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ multFsDeepenTermGoodPins multFsDeepenReadyTermBody
      "false" "false" "false" "true" "false" "true"
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def hostModuleCheckBadMultFsDeepenProvablyText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ multFsDeepenTermGoodPins multFsDeepenReadyTermBody
      "false" "false" "false" "false" "true" "true"
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def hostModuleCheckBadMultFsDeepenLakeText : String :=
  hostModuleCheckMultFsDeepenTermSkeletonPrefix
    ++ multFsDeepenTermGoodPins multFsDeepenReadyTermBody
      "false" "false" "false" "false" "false" "false"
    ++ hostModuleCheckMultFsDeepenTermSkeletonSuffix

def multFsDeepenTermSurfaceFrom (content : String) : RealModuleSurface :=
  { name := "SystemsLean.MultFsDeepen"
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

def multFsDeepenTermL0Accept (content : String) : Bool :=
  (checkNamedSurface (multFsDeepenTermSurfaceFrom content)
    multFsDeepenExpectedNamespace multFsDeepenRequiredDecls
    (some "SystemsLean.MultSubsetRebuild")).isAccept

def multFsDeepenTermDialectReject (content : String) : Bool :=
  match checkMultFsDeepenTermDialect content with
  | some r => r == reasonIllTypedTerm
  | none => false

def hostModuleCheckBadMultFsDeepenResidualL0Accept : Bool :=
  multFsDeepenTermL0Accept hostModuleCheckBadMultFsDeepenResidualText

def hostModuleCheckBadMultFsDeepenResidualDialectReject : Bool :=
  multFsDeepenTermDialectReject hostModuleCheckBadMultFsDeepenResidualText

def hostModuleCheckBadMultFsDeepenCompleteL0Accept : Bool :=
  multFsDeepenTermL0Accept hostModuleCheckBadMultFsDeepenCompleteText

def hostModuleCheckBadMultFsDeepenCompleteDialectReject : Bool :=
  multFsDeepenTermDialectReject hostModuleCheckBadMultFsDeepenCompleteText

def hostModuleCheckBadMultFsDeepenReadyL0Accept : Bool :=
  multFsDeepenTermL0Accept hostModuleCheckBadMultFsDeepenReadyText

def hostModuleCheckBadMultFsDeepenReadyDialectReject : Bool :=
  multFsDeepenTermDialectReject hostModuleCheckBadMultFsDeepenReadyText

def hostModuleCheckBadMultFsDeepenProofL0Accept : Bool :=
  multFsDeepenTermL0Accept hostModuleCheckBadMultFsDeepenProofText

def hostModuleCheckBadMultFsDeepenProofDialectReject : Bool :=
  multFsDeepenTermDialectReject hostModuleCheckBadMultFsDeepenProofText

def hostModuleCheckBadMultFsDeepenLlvmL0Accept : Bool :=
  multFsDeepenTermL0Accept hostModuleCheckBadMultFsDeepenLlvmText

def hostModuleCheckBadMultFsDeepenLlvmDialectReject : Bool :=
  multFsDeepenTermDialectReject hostModuleCheckBadMultFsDeepenLlvmText

def hostModuleCheckBadMultFsDeepenProvablyL0Accept : Bool :=
  multFsDeepenTermL0Accept hostModuleCheckBadMultFsDeepenProvablyText

def hostModuleCheckBadMultFsDeepenProvablyDialectReject : Bool :=
  multFsDeepenTermDialectReject hostModuleCheckBadMultFsDeepenProvablyText

def hostModuleCheckBadMultFsDeepenLakeL0Accept : Bool :=
  multFsDeepenTermL0Accept hostModuleCheckBadMultFsDeepenLakeText

def hostModuleCheckBadMultFsDeepenLakeDialectReject : Bool :=
  multFsDeepenTermDialectReject hostModuleCheckBadMultFsDeepenLakeText

def hostModuleCheckMultFsDeepenTermDialectOk : Bool :=
  (checkMultFsDeepenTermDialect hostModuleCheckGoodMultFsDeepenTermText).isNone

/-- On-disk MultFsDeepen multFsDeepenReady is multi-line. Collapse must
    accept that shape, not only the single-line TERM fixture. -/
def hostModuleCheckGoodMultFsDeepenReadyMultilineText : String :=
  "def multFsDeepenReady : Bool :=\n" ++
  "  freestandingDeepenPartial\n" ++
  "    && multFsDeepenDialectShared\n" ++
  "    && multFsDeepenPackageSurfaceOk\n" ++
  "    && multFsDeepenWithoutLakeFinishedOk\n" ++
  "    && multFsDeepenNotPrebuiltOnly\n" ++
  "    && multFsDeepenKeepsHostLake\n" ++
  "    && stillUsesLake\n" ++
  "    && dependsOnLake\n" ++
  "    && !multFsDeepenResidualFreeClaimed\n" ++
  "    && !multFsDeepenProductSelfHostCompleteClaimed\n" ++
  "    && !multFsDeepenProofCompleteClaimed\n" ++
  "    && !multFsDeepenLlvmUnlocked\n" ++
  "    && !multFsDeepenProvablyUnlocked\n" ++
  "    && (stageId == \"SLAKE_MULT_FS_DEEPEN_V0\")\n" ++
  "    && (hostId == \"HOST-MULT-FS-DEEPEN\")\n" ++
  "    && (surfaceId == \"MULT-FS-DEEPEN\")\n" ++
  "    && (justRecipeFsDeepen == \"mult-subset-freestanding-deepen\")\n"

def hostModuleCheckMultFsDeepenReadyMultilineOk : Bool :=
  multFsDeepenReadyBodyOk hostModuleCheckGoodMultFsDeepenReadyMultilineText

def hostModuleCheckMultFsDeepenTermSurfaceOk : Bool :=
  hostModuleCheckMultFsDeepenTermSurfaceDualOk
    && (checkDepthMultFsDeepenTermSurfaceBar == "TERM-SURFACE")
    && (checkDepthMultFsDeepenTermSurfaceScope == "MultFsDeepen-only")
    && hostModuleCheckMultFsDeepenTermDialectOk
    && hostModuleCheckBadMultFsDeepenResidualDialectReject
    && hostModuleCheckBadMultFsDeepenCompleteDialectReject
    && hostModuleCheckBadMultFsDeepenReadyDialectReject
    && hostModuleCheckBadMultFsDeepenProofDialectReject
    && hostModuleCheckBadMultFsDeepenLlvmDialectReject
    && hostModuleCheckBadMultFsDeepenProvablyDialectReject
    && hostModuleCheckBadMultFsDeepenLakeDialectReject
    && hostModuleCheckBadMultFsDeepenResidualL0Accept
    && hostModuleCheckBadMultFsDeepenCompleteL0Accept
    && hostModuleCheckBadMultFsDeepenReadyL0Accept
    && hostModuleCheckBadMultFsDeepenProofL0Accept
    && hostModuleCheckBadMultFsDeepenLlvmL0Accept
    && hostModuleCheckBadMultFsDeepenProvablyL0Accept
    && hostModuleCheckBadMultFsDeepenLakeL0Accept
    && hostModuleCheckMultFsDeepenReadyMultilineOk

theorem hostModuleCheckMultFsDeepenTermSurfaceOk_true :
    hostModuleCheckMultFsDeepenTermSurfaceOk = true := by native_decide

theorem hostModuleCheckMultFsDeepenReadyMultilineOk_true :
    hostModuleCheckMultFsDeepenReadyMultilineOk = true := by native_decide

theorem hostModuleCheck_multFsDeepen_term_surface_ids_eq :
    checkDepthMultFsDeepenTermSurfaceBar = "TERM-SURFACE"
      && checkDepthMultFsDeepenTermSurfaceScope = "MultFsDeepen-only"
      && hostModuleCheckMultFsDeepenTermSurfaceDualOk = true := rfl

end SystemsLean.HostModuleCheck
"#

/-- Accepted parse calls HostKernel.kernelCheck. Not a constant true. -/
def kernelCheckLiveHostModuleCheckMultFsDeepenTermSource (src : String) : Bool :=
  match parseLiveLlvmComposeTextMainSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Ready is parse plus kernelCheck of the pinned text. -/
def hostFrontLiveHostModuleCheckMultFsDeepenTermSourceReady : Bool :=
  liveRel == "HostModuleCheckMultFsDeepenTerm.lean"
    && kernelCheckLiveHostModuleCheckMultFsDeepenTermSource liveHostModuleCheckMultFsDeepenTermSource

def runLive (root : System.FilePath) : IO Unit := do
  IO.println s!"liveRel={liveRel}"
  let path := root / "src/systems/SystemsLean" / liveRel
  unless (<- path.pathExists) do
    throw (IO.userError s!"missing {liveRel}")
  let disk <- IO.FS.readFile path
  if disk != liveHostModuleCheckMultFsDeepenTermSource then
    throw (IO.userError "dual-pin mismatch HostModuleCheckMultFsDeepenTerm.lean")
  let k := kernelCheckLiveHostModuleCheckMultFsDeepenTermSource disk
  IO.println s!"kernelCheck={k}"
  unless k do
    throw (IO.userError "kernelCheck live HostModuleCheckMultFsDeepenTerm parse false")
  unless hostFrontLiveHostModuleCheckMultFsDeepenTermSourceReady do
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

end SystemsLean.HostFrontLiveHostModuleCheckMultFsDeepenTermSource
