/-
  SYSTEMS_LEAN_HOST partial -- first real host module check without Lake on
  the measured step (plan-slake-replaces-lake A5 / design S3 Elaborate modules).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).

  Spec (readable):
  - Check real seed modules from disk: Mult..Compose + Erasure/Extract
    (+Theorems) + CompilePath + Kernel Mult/Linear/Types/Program + Kernel
    *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body scaffolds
    + Emit Erasure/Extract/Banner scaffolds + KernelSelfApply +
    KernelSelfApplyTheorems + EmitMult + EmitPlan + EmitApply + EmitBody +
    KernelEmit + KernelEmitTheorems + ParityMult + ParityMultTheorems
    + ParityLinear + ParityLinearTheorems + ParityTypes + ParityTypesTheorems
    + ParityProgram + ParityProgramTheorems + ParityEmit + ParityEmitTheorems
    + SelfApply + SelfApplyTheorems
    + EmitLinear + EmitTypes + EmitProgram + EmitGraph + EmitCompose
    + EmitErasure + EmitExtract + EmitBanner
    + ProductOutKernel + ProductOutKernelTheorems
    + BootstrapHonesty + BootstrapHonestyTheorems
    + ProductPathWriterSurface + ProductPathWriterSurfaceTheorems
    + ProductPathWriterPathPlan + ProductPathWriterPathPlanTheorems
    + ProductPathWriterPathExec + ProductPathWriterPathExecTheorems;
    modules=81 (Host library seed expand continue).
  - PARTIAL-STRUCTURAL: package-local imports + key decls per role. Not full
    Lean 4 elaborate/typecheck of module bodies.
  - Accept good expand seed; reject Mult-shaped bads (missing file/decl/ns/empty).
  - Lake-built bin OK; without-Lake: host-module-check-without-lake prebuilt.
  - Foundation dialect harness (HostFront/HostCheck) stays separate and green.

  Out of scope: full ~271-module elaborate; host free; mathlib; PROVABLY/llvm
  forge; product free/complete flips. Next: further library bands; typecheck.

  Greppable: SYSTEMS_LEAN_HOST, HOST-MODULE-CHECK, SLAKE_HOST_MODULE_CHECK,
  SLAKE_HOST_MODULE_CHECK_V0, HOST-HOST-MODULE-CHECK, hostModuleCheckReady,
  hostModuleCheckFinishedClaimed, hostModuleCheckLoadOk,
  hostModuleCheckHostElaboratorResidualRemains,
  hostModuleCheckWithoutLakeFinished, hostModuleCheckWithoutLakeReady,
  hostModuleCheckWithoutLakeKeepsHostLake, justRecipeWithoutLake,
  prebuiltHostModuleCheckRel, host-module-check-without-lake,
  HOST-MODULE-CHECK-WITHOUT-LAKE, HOST-MODULE-CHECK-SMOKE,
  HOST-MODULE-CHECK-THEOREM, HostModuleCheckTheorems, HostModuleCheckFixtures,
  hostModuleCheckReady_true, slake-host-module-check, just host-module-check,
  loadMultModuleCheck, runModuleCheck, checkRealModule, extractImports,
  extractKeyDecls, RealModuleSurface, hostModuleCheckSeedModules,
  hostModuleCheckSeedRelPaths, hostModuleCheckExpandSliceName,
  Host library seed expand continue, Host real module seed expand,
  Host theorem check expand,
  Host compose module expand, Host graph module expand,
  Host program module expand, Host module set expand,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems,
  hostModuleCheckGoodMult, hostModuleCheckGoodMultTheorems,
  hostModuleCheckGoodLinear, hostModuleCheckGoodTypes,
  hostModuleCheckGoodIrProgram, hostModuleCheckGoodIrGraph,
  hostModuleCheckGoodHostCompose, hostModuleCheckGoodErasure,
  hostModuleCheckGoodExtract, hostModuleCheckGoodCompilePath,
  hostModuleCheckGoodKernelMult, hostModuleCheckGoodKernelLinear,
  hostModuleCheckGoodKernelTypes, hostModuleCheckGoodKernelProgram,
  hostModuleCheckGoodKernelMultTheorems, hostModuleCheckGoodKernelLinearTheorems,
  hostModuleCheckGoodKernelTypesTheorems, hostModuleCheckGoodKernelProgramTheorems,
  hostModuleCheckGoodJoinMap, hostModuleCheckGoodJoinMapTheorems,
  hostModuleCheckGoodSelfHost, hostModuleCheckGoodSelfHostTheorems,
  hostModuleCheckGoodSurfaceMatrix, hostModuleCheckGoodSurfaceMatrixTheorems,
  hostModuleCheckGoodEmitMultScaffold, hostModuleCheckGoodEmitLinearScaffold,
  hostModuleCheckGoodEmitTypesScaffold, hostModuleCheckGoodEmitProgramScaffold,
  hostModuleCheckGoodEmitGraphScaffold, hostModuleCheckGoodEmitComposeScaffold,
  hostModuleCheckGoodEmitPlanScaffold, hostModuleCheckGoodEmitApplyScaffold,
  hostModuleCheckGoodEmitBodyScaffold, hostModuleCheckGoodEmitErasureScaffold,
  hostModuleCheckGoodEmitExtractScaffold, hostModuleCheckGoodEmitBannerScaffold,
  hostModuleCheckGoodKernelSelfApply, hostModuleCheckGoodKernelSelfApplyTheorems,
  hostModuleCheckGoodEmitMult, hostModuleCheckGoodEmitPlan,
  hostModuleCheckGoodEmitApply, hostModuleCheckGoodEmitBody,
  hostModuleCheckGoodKernelEmit, hostModuleCheckGoodKernelEmitTheorems,
  hostModuleCheckGoodParityMult, hostModuleCheckGoodParityMultTheorems,
  hostModuleCheckGoodParityLinear, hostModuleCheckGoodParityLinearTheorems,
  hostModuleCheckGoodParityTypes, hostModuleCheckGoodParityTypesTheorems,
  hostModuleCheckGoodParityProgram, hostModuleCheckGoodParityProgramTheorems,
  hostModuleCheckGoodParityEmit, hostModuleCheckGoodParityEmitTheorems,
  hostModuleCheckGoodSelfApply, hostModuleCheckGoodSelfApplyTheorems,
  hostModuleCheckGoodEmitLinear, hostModuleCheckGoodEmitTypes,
  hostModuleCheckGoodEmitProgram, hostModuleCheckGoodEmitGraph,
  hostModuleCheckGoodEmitCompose, hostModuleCheckGoodEmitErasure,
  hostModuleCheckGoodEmitExtract, hostModuleCheckGoodEmitBanner,
  hostModuleCheckGoodProductOutKernel, hostModuleCheckGoodProductOutKernelTheorems,
  hostModuleCheckGoodBootstrapHonesty, hostModuleCheckGoodBootstrapHonestyTheorems,
  hostModuleCheckGoodProductPathWriterSurface, hostModuleCheckGoodProductPathWriterSurfaceTheorems,
  hostModuleCheckGoodProductPathWriterPathPlan, hostModuleCheckGoodProductPathWriterPathPlanTheorems,
  hostModuleCheckGoodProductPathWriterPathExec, hostModuleCheckGoodProductPathWriterPathExecTheorems,
  hostModuleCheckBadMissingInductive,
  hostModuleCheckBadMissingNamespace, hostModuleCheckBadEmpty,
  hostModuleCheckBadMissingTheorem, MISSING-FILE, MISSING-NAMESPACE,
  MISSING-DECL, EMPTY-MODULE, PARTIAL-STRUCTURAL,
  First real host module check, full-host-elaborator-design-2026-08-03,
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostModuleCheck
  Dual evidence: structural pins + on-disk walk + without-Lake greps.
  Red/green: host-module-check-without-lake; lake build once for prebuilt.
  Design: doc/dev/research/full-host-elaborator-design-2026-08-03.md (S3 / A5).
  Module must stay ASCII. Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
  Host elaborator residual remains. PARTIAL-STRUCTURAL only.
  Long-file split: fixture texts in HostModuleCheckFixtures (same namespace).
-/

import SystemsLean.HostModuleCheckFixtures

namespace SystemsLean.HostModuleCheck

/-! ### HOST-MODULE-CHECK / SLAKE_HOST_MODULE_CHECK
    First real host module structural check (Lake job L3 / design stage S3).
    PARTIAL-STRUCTURAL only (imports + key decls). -/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_MODULE_CHECK_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-MODULE-CHECK"

/-- Short surface name. -/
def surfaceId : String := "HOST-MODULE-CHECK"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-MODULE-CHECK"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-module-check"

/-- just recipe name (Lake bootstrap path). -/
def justRecipe : String := "host-module-check"

/-- just recipe for without-Lake measured real module check (prebuilt).
    Greppable: justRecipeWithoutLake, host-module-check-without-lake,
    HOST-MODULE-CHECK-WITHOUT-LAKE. -/
def justRecipeWithoutLake : String := "host-module-check-without-lake"

/-- Relative path of prebuilt binary under src/systems
    (bootstrap once: lake build slake-host-module-check).
    Greppable: prebuiltHostModuleCheckRel, slake-host-module-check. -/
def prebuiltHostModuleCheckRel : String :=
  ".lake/build/bin/slake-host-module-check"

/-- Design note path cite (not a filesystem read).
    Greppable: designNotePath, full-host-elaborator-design-2026-08-03. -/
def designNotePath : String :=
  "doc/dev/research/full-host-elaborator-design-2026-08-03.md"

/-- Residual Name this surface implements (plain English).
    Greppable: residualName, First real host module check. -/
def residualName : String := "First real host module check"

/-- Honesty depth: structural only, not full elaborator typecheck.
    Greppable: checkDepthPartial, PARTIAL-STRUCTURAL. -/
def checkDepthPartial : String := "PARTIAL-STRUCTURAL"

/-! ### Seed set (real SystemsLean Mult..Compose + Erasure/Extract + CompilePath/Kernel
    + Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds; not dialect goldens)

  A5 started Mult+MultTheorems. A6 Host module set expand grew Mult..Compose.
  Host theorem check expand (A7) deepened *Theorems required-decl corpus.
  Host real module seed expand adds Erasure + ErasureTheorems + Extract +
  ExtractTheorems. Host library seed expand continue (A12) adds CompilePath +
  KernelMult + KernelLinear + KernelTypes + KernelProgram. Same living Name
  continues (A13) with Kernel *Theorems. Same living Name continues (A14) with
  JoinMap + JoinMapTheorems + SelfHost + SelfHostTheorems. Same living Name
  continues (A15) with SurfaceMatrix + SurfaceMatrixTheorems. Same living Name
  continues (A16) with Emit Mult..Compose scaffolds. Same living Name continues
  (A17) with Emit Plan/Apply/Body scaffolds. Same living Name continues
  (A18) with Emit Erasure/Extract/Banner scaffolds. Same living Name continues
  (A19) with KernelSelfApply + KernelSelfApplyTheorems. Same living Name continues
  (A20) with EmitMult + EmitPlan + EmitApply + EmitBody product modules.
  Same living Name continues (A21) with KernelEmit + KernelEmitTheorems.
  Same living Name continues (A22) with ParityMult + ParityMultTheorems.
  Same living Name continues (A23) with ParityLinear + ParityLinearTheorems.
  Same living Name continues (A24) with ParityTypes + ParityTypesTheorems.
  Same living Name continues (A25) with ParityProgram + ParityProgramTheorems.
  Same living Name continues (A26) with ParityEmit + ParityEmitTheorems.
  Same living Name continues (A27) with SelfApply + SelfApplyTheorems.
  Same living Name continues (A28) with EmitLinear + EmitTypes + EmitProgram +
  EmitGraph + EmitCompose product shells.
  Same living Name continues (A29) with EmitErasure + EmitExtract + EmitBanner
  product shells (remaining emit product shells after Mult..Compose).
  Same living Name continues (A30) with ProductOutKernel + ProductOutKernelTheorems
  + BootstrapHonesty + BootstrapHonestyTheorems (SelfApplyFs leaf foundation).
  Same living Name continues (A31) with ProductPathWriterSurface +
  ProductPathWriterSurfaceTheorems + ProductPathWriterPathPlan +
  ProductPathWriterPathPlanTheorems + ProductPathWriterPathExec +
  ProductPathWriterPathExecTheorems (SelfApplyFs ProductPath writer pure leaves).
-/

/-- Seed module names (Lean dotted). Mult..Compose + Erasure/Extract + CompilePath/Kernel
    + Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body scaffolds
    + Emit Erasure/Extract/Banner scaffolds + KernelSelfApply + KernelSelfApplyTheorems
    + EmitMult + EmitPlan + EmitApply + EmitBody + KernelEmit + KernelEmitTheorems
    + ParityMult + ParityMultTheorems + ParityLinear + ParityLinearTheorems
    + ParityTypes + ParityTypesTheorems + ParityProgram + ParityProgramTheorems
    + ParityEmit + ParityEmitTheorems + SelfApply + SelfApplyTheorems
    + EmitLinear + EmitTypes + EmitProgram + EmitGraph + EmitCompose
    + EmitErasure + EmitExtract + EmitBanner
    + ProductOutKernel + ProductOutKernelTheorems
    + BootstrapHonesty + BootstrapHonestyTheorems
    + ProductPathWriterSurface + ProductPathWriterSurfaceTheorems
    + ProductPathWriterPathPlan + ProductPathWriterPathPlanTheorems
    + ProductPathWriterPathExec + ProductPathWriterPathExecTheorems.
    Greppable: hostModuleCheckSeedModules,
    Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems. -/
def hostModuleCheckSeedModules : List String :=
  ["SystemsLean.Mult",
   "SystemsLean.MultTheorems",
   "SystemsLean.Linear",
   "SystemsLean.LinearTheorems",
   "SystemsLean.Types",
   "SystemsLean.TypesTheorems",
   "SystemsLean.IrProgram",
   "SystemsLean.IrProgramTheorems",
   "SystemsLean.IrGraph",
   "SystemsLean.IrGraphTheorems",
   "SystemsLean.HostCompose",
   "SystemsLean.HostComposeTheorems",
   "SystemsLean.Erasure",
   "SystemsLean.ErasureTheorems",
   "SystemsLean.Extract",
   "SystemsLean.ExtractTheorems",
   "SystemsLean.CompilePath",
   "SystemsLean.KernelMult",
   "SystemsLean.KernelLinear",
   "SystemsLean.KernelTypes",
   "SystemsLean.KernelProgram",
   "SystemsLean.KernelMultTheorems",
   "SystemsLean.KernelLinearTheorems",
   "SystemsLean.KernelTypesTheorems",
   "SystemsLean.KernelProgramTheorems",
   "SystemsLean.JoinMap",
   "SystemsLean.JoinMapTheorems",
   "SystemsLean.SelfHost",
   "SystemsLean.SelfHostTheorems",
   "SystemsLean.SurfaceMatrix",
   "SystemsLean.SurfaceMatrixTheorems",
   "SystemsLean.EmitMultScaffold",
   "SystemsLean.EmitLinearScaffold",
   "SystemsLean.EmitTypesScaffold",
   "SystemsLean.EmitProgramScaffold",
   "SystemsLean.EmitGraphScaffold",
   "SystemsLean.EmitComposeScaffold",
   "SystemsLean.EmitPlanScaffold",
   "SystemsLean.EmitApplyScaffold",
   "SystemsLean.EmitBodyScaffold",
   "SystemsLean.EmitErasureScaffold",
   "SystemsLean.EmitExtractScaffold",
   "SystemsLean.EmitBannerScaffold",
   "SystemsLean.KernelSelfApply",
   "SystemsLean.KernelSelfApplyTheorems",
   "SystemsLean.EmitMult",
   "SystemsLean.EmitPlan",
   "SystemsLean.EmitApply",
   "SystemsLean.EmitBody",
   "SystemsLean.KernelEmit",
   "SystemsLean.KernelEmitTheorems",
   "SystemsLean.ParityMult",
   "SystemsLean.ParityMultTheorems",
   "SystemsLean.ParityLinear",
   "SystemsLean.ParityLinearTheorems",
   "SystemsLean.ParityTypes",
   "SystemsLean.ParityTypesTheorems",
   "SystemsLean.ParityProgram",
   "SystemsLean.ParityProgramTheorems",
   "SystemsLean.ParityEmit",
   "SystemsLean.ParityEmitTheorems",
   "SystemsLean.SelfApply",
   "SystemsLean.SelfApplyTheorems",
   "SystemsLean.EmitLinear",
   "SystemsLean.EmitTypes",
   "SystemsLean.EmitProgram",
   "SystemsLean.EmitGraph",
   "SystemsLean.EmitCompose",
   "SystemsLean.EmitErasure",
   "SystemsLean.EmitExtract",
   "SystemsLean.EmitBanner",
   "SystemsLean.ProductOutKernel",
   "SystemsLean.ProductOutKernelTheorems",
   "SystemsLean.BootstrapHonesty",
   "SystemsLean.BootstrapHonestyTheorems",
   "SystemsLean.ProductPathWriterSurface",
   "SystemsLean.ProductPathWriterSurfaceTheorems",
   "SystemsLean.ProductPathWriterPathPlan",
   "SystemsLean.ProductPathWriterPathPlanTheorems",
   "SystemsLean.ProductPathWriterPathExec",
   "SystemsLean.ProductPathWriterPathExecTheorems"]

/-- Seed paths relative to repo root.
    Greppable: hostModuleCheckSeedRelPaths. -/
def hostModuleCheckSeedRelPaths : List String :=
  ["src/systems/SystemsLean/Mult.lean",
   "src/systems/SystemsLean/MultTheorems.lean",
   "src/systems/SystemsLean/Linear.lean",
   "src/systems/SystemsLean/LinearTheorems.lean",
   "src/systems/SystemsLean/Types.lean",
   "src/systems/SystemsLean/TypesTheorems.lean",
   "src/systems/SystemsLean/IrProgram.lean",
   "src/systems/SystemsLean/IrProgramTheorems.lean",
   "src/systems/SystemsLean/IrGraph.lean",
   "src/systems/SystemsLean/IrGraphTheorems.lean",
   "src/systems/SystemsLean/HostCompose.lean",
   "src/systems/SystemsLean/HostComposeTheorems.lean",
   "src/systems/SystemsLean/Erasure.lean",
   "src/systems/SystemsLean/ErasureTheorems.lean",
   "src/systems/SystemsLean/Extract.lean",
   "src/systems/SystemsLean/ExtractTheorems.lean",
   "src/systems/SystemsLean/CompilePath.lean",
   "src/systems/SystemsLean/KernelMult.lean",
   "src/systems/SystemsLean/KernelLinear.lean",
   "src/systems/SystemsLean/KernelTypes.lean",
   "src/systems/SystemsLean/KernelProgram.lean",
   "src/systems/SystemsLean/KernelMultTheorems.lean",
   "src/systems/SystemsLean/KernelLinearTheorems.lean",
   "src/systems/SystemsLean/KernelTypesTheorems.lean",
   "src/systems/SystemsLean/KernelProgramTheorems.lean",
   "src/systems/SystemsLean/JoinMap.lean",
   "src/systems/SystemsLean/JoinMapTheorems.lean",
   "src/systems/SystemsLean/SelfHost.lean",
   "src/systems/SystemsLean/SelfHostTheorems.lean",
   "src/systems/SystemsLean/SurfaceMatrix.lean",
   "src/systems/SystemsLean/SurfaceMatrixTheorems.lean",
   "src/systems/SystemsLean/EmitMultScaffold.lean",
   "src/systems/SystemsLean/EmitLinearScaffold.lean",
   "src/systems/SystemsLean/EmitTypesScaffold.lean",
   "src/systems/SystemsLean/EmitProgramScaffold.lean",
   "src/systems/SystemsLean/EmitGraphScaffold.lean",
   "src/systems/SystemsLean/EmitComposeScaffold.lean",
   "src/systems/SystemsLean/EmitPlanScaffold.lean",
   "src/systems/SystemsLean/EmitApplyScaffold.lean",
   "src/systems/SystemsLean/EmitBodyScaffold.lean",
   "src/systems/SystemsLean/EmitErasureScaffold.lean",
   "src/systems/SystemsLean/EmitExtractScaffold.lean",
   "src/systems/SystemsLean/EmitBannerScaffold.lean",
   "src/systems/SystemsLean/KernelSelfApply.lean",
   "src/systems/SystemsLean/KernelSelfApplyTheorems.lean",
   "src/systems/SystemsLean/EmitMult.lean",
   "src/systems/SystemsLean/EmitPlan.lean",
   "src/systems/SystemsLean/EmitApply.lean",
   "src/systems/SystemsLean/EmitBody.lean",
   "src/systems/SystemsLean/KernelEmit.lean",
   "src/systems/SystemsLean/KernelEmitTheorems.lean",
   "src/systems/SystemsLean/ParityMult.lean",
   "src/systems/SystemsLean/ParityMultTheorems.lean",
   "src/systems/SystemsLean/ParityLinear.lean",
   "src/systems/SystemsLean/ParityLinearTheorems.lean",
   "src/systems/SystemsLean/ParityTypes.lean",
   "src/systems/SystemsLean/ParityTypesTheorems.lean",
   "src/systems/SystemsLean/ParityProgram.lean",
   "src/systems/SystemsLean/ParityProgramTheorems.lean",
   "src/systems/SystemsLean/ParityEmit.lean",
   "src/systems/SystemsLean/ParityEmitTheorems.lean",
   "src/systems/SystemsLean/SelfApply.lean",
   "src/systems/SystemsLean/SelfApplyTheorems.lean",
   "src/systems/SystemsLean/EmitLinear.lean",
   "src/systems/SystemsLean/EmitTypes.lean",
   "src/systems/SystemsLean/EmitProgram.lean",
   "src/systems/SystemsLean/EmitGraph.lean",
   "src/systems/SystemsLean/EmitCompose.lean",
   "src/systems/SystemsLean/EmitErasure.lean",
   "src/systems/SystemsLean/EmitExtract.lean",
   "src/systems/SystemsLean/EmitBanner.lean",
   "src/systems/SystemsLean/ProductOutKernel.lean",
   "src/systems/SystemsLean/ProductOutKernelTheorems.lean",
   "src/systems/SystemsLean/BootstrapHonesty.lean",
   "src/systems/SystemsLean/BootstrapHonestyTheorems.lean",
   "src/systems/SystemsLean/ProductPathWriterSurface.lean",
   "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean",
   "src/systems/SystemsLean/ProductPathWriterPathPlan.lean",
   "src/systems/SystemsLean/ProductPathWriterPathPlanTheorems.lean",
   "src/systems/SystemsLean/ProductPathWriterPathExec.lean",
   "src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean"]

/-- Expand slice Name (living). Greppable: hostModuleCheckExpandSliceName,
    Host library seed expand continue. Prior: Host real module seed expand. -/
def hostModuleCheckExpandSliceName : String := "Host library seed expand continue"

/-- Compact seed-unit inventory string (HostResidualShrink dual cite).
    Greppable: hostModuleCheckSeedUnitsLabel,
    Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems. -/
def hostModuleCheckSeedUnitsLabel : String :=
  "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems"

/-- Library dir relative to repo root. -/
def hostModuleCheckLibraryDirRel : String := "src/systems/SystemsLean"

/-- Host elaborator residual still remains (full elaborate still Lake).
    Greppable: hostModuleCheckHostElaboratorResidualRemains. -/
def hostModuleCheckHostElaboratorResidualRemains : Bool := true

/-- Local honesty: host develop surface still uses Lake bootstrap for this bin.
    Without-Lake measured step does not retire host develop Lake bootstrap. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostModuleCheckStillUsesLake : Bool := stillUsesLake
def hostModuleCheckDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostModuleCheckResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostModuleCheckProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostModuleCheckProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostModuleCheckLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostModuleCheckProvablyUnlocked : Bool := false

/-- Local honesty: does not claim host free. -/
def hostModuleCheckHostFreeClaimed : Bool := false

/-- Local finished pin (first real host module check surface closed).
    Greppable: hostModuleCheckFinishedClaimed. -/
def hostModuleCheckFinishedClaimed : Bool := true

/-- Without-Lake measured step finished pin.
    Greppable: hostModuleCheckWithoutLakeFinished,
    HOST-MODULE-CHECK-WITHOUT-LAKE. -/
def hostModuleCheckWithoutLakeFinished : Bool := true

/-! ### Reject reasons (greppable fail-closed tokens) -/

def reasonMissingFile : String := "MISSING-FILE"
def reasonMissingNamespace : String := "MISSING-NAMESPACE"
def reasonMissingDecl : String := "MISSING-DECL"
def reasonEmptyModule : String := "EMPTY-MODULE"
def reasonSeedMismatch : String := "SEED-MISMATCH"
def reasonMissingImport : String := "MISSING-IMPORT"

/-! ### Surface model (structural decls from real .lean text) -/

/-- One real host module surface (name + imports + key decls found).
    Greppable: RealModuleSurface. -/
structure RealModuleSurface where
  name : String
  imports : List String
  namespaceName : Option String
  keyDecls : List String
  deriving Repr, DecidableEq

/-- Module check result: accept surface, or reject with reason. -/
inductive ModuleCheckResult where
  | accept (surf : RealModuleSurface)
  | reject (reason : String)
  deriving Repr

/-- True when accept. -/
def ModuleCheckResult.isAccept : ModuleCheckResult -> Bool
  | ModuleCheckResult.accept _ => true
  | ModuleCheckResult.reject _ => false

/-- True when reject with exact reason. -/
def ModuleCheckResult.isRejectWith (r : ModuleCheckResult) (reason : String) :
    Bool :=
  match r with
  | ModuleCheckResult.reject r' => r' == reason
  | ModuleCheckResult.accept _ => false

/-! ### Line helpers (ASCII; same spirit as HostImportGraph) -/

/-- Whitespace? -/
def isWs (c : Char) : Bool := c == ' ' || c == '\t' || c == '\r'

/-- Drop leading ASCII whitespace. -/
def trimLeft (s : String) : String :=
  let rec go (cs : List Char) : List Char :=
    match cs with
    | [] => []
    | c :: rest => if isWs c then go rest else c :: rest
  String.ofList (go s.toList)

/-- Drop trailing ASCII whitespace. -/
def trimRight (s : String) : String :=
  let rec dropEnd (cs : List Char) : List Char :=
    match cs with
    | [] => []
    | c :: rest =>
      if isWs c then dropEnd rest else c :: rest
  String.ofList (dropEnd s.toList.reverse).reverse

/-- Trim both ends. -/
def trim (s : String) : String :=
  trimRight (trimLeft s)

/-- True when string starts with prefix. -/
def hasPrefix (s pref : String) : Bool :=
  s.startsWith pref

/-- Strip line comment from first `--`. -/
def stripLineComment (s : String) : String :=
  match s.splitOn "--" with
  | [] => s
  | h :: _ => h

/-- True when token is a package-local SystemsLean import target. -/
def isPackageLocalImport (name : String) : Bool :=
  hasPrefix name "SystemsLean."

/-- Parse one line for `import SystemsLean.X`.
    Greppable: parseImportLine. -/
def parseImportLine (line : String) : Option String :=
  let t := trim (stripLineComment line)
  if !(hasPrefix t "import ") then none
  else
    let rest := trim (String.Slice.toString (t.drop "import ".length))
    let name :=
      match rest.splitOn " " with
      | [] => ""
      | h :: _ =>
        match h.splitOn "\t" with
        | [] => h
        | n :: _ => n
    let name := trimRight name
    if name.isEmpty then none
    else if isPackageLocalImport name then some name
    else none

/-- Extract package-local imports from full file content (block-comment aware).
    Greppable: extractImports. -/
def extractImports (content : String) : List String :=
  let rec go (inBlock : Bool) (acc : List String) :
      List String -> List String
    | [] => acc.reverse
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false acc rest
        else
          go true acc rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false acc rest
          else
            go true acc rest
        else
          match parseImportLine line with
          | none => go false acc rest
          | some n =>
            if acc.any (fun x => x == n) then go false acc rest
            else go false (n :: acc) rest
  go false [] (content.splitOn "\n")

/-- First token after keyword on a non-comment line (def/inductive/theorem/namespace).
    Returns (kind, name) when line starts with kind. -/
def parseKindName (line : String) (kind : String) : Option String :=
  let t := trim (stripLineComment line)
  let pref := kind ++ " "
  if !(hasPrefix t pref) then none
  else
    let rest := trim (String.Slice.toString (t.drop pref.length))
    let name :=
      match rest.splitOn " " with
      | [] => ""
      | h :: _ =>
        match h.splitOn "\t" with
        | [] => h
        | n :: _ => n
    let name := trimRight name
    -- Strip trailing punctuation that may appear (e.g. where, :).
    let name :=
      match name.splitOn ":" with
      | [] => name
      | h :: _ => h
    let name := trimRight name
    if name.isEmpty then none else some name

/-- Extract first namespace name found (outside block comments).
    Greppable: extractNamespace. -/
def extractNamespace (content : String) : Option String :=
  let rec go (inBlock : Bool) : List String -> Option String
    | [] => none
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false rest
        else
          go true rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false rest
          else
            go true rest
        else
          match parseKindName line "namespace" with
          | some n => some n
          | none => go false rest
  go false (content.splitOn "\n")

/-- Extract key decl names for kinds def / inductive / theorem (unique, order of first see).
    Greppable: extractKeyDecls. -/
def extractKeyDecls (content : String) : List String :=
  let rec go (inBlock : Bool) (acc : List String) :
      List String -> List String
    | [] => acc.reverse
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false acc rest
        else
          go true acc rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false acc rest
          else
            go true acc rest
        else
          let found : Option String :=
            match parseKindName line "inductive" with
            | some n => some ("inductive:" ++ n)
            | none =>
              match parseKindName line "def" with
              | some n => some ("def:" ++ n)
              | none =>
                match parseKindName line "theorem" with
                | some n => some ("theorem:" ++ n)
                | none => none
          match found with
          | none => go false acc rest
          | some d =>
            if acc.any (fun x => x == d) then go false acc rest
            else go false (d :: acc) rest
  go false [] (content.splitOn "\n")

/-- True when keyDecls list contains exact token. -/
def hasKey (keys : List String) (tok : String) : Bool :=
  keys.any (fun k => k == tok)

/-- True when content has no non-comment non-blank lines after strip. -/
def isEffectivelyEmpty (content : String) : Bool :=
  let rec go (inBlock : Bool) : List String -> Bool
    | [] => true
    | line :: rest =>
      if inBlock then
        if (line.splitOn "-/").length > 1 then
          go false rest
        else
          go true rest
      else
        let t := trim line
        if t.isEmpty then go false rest
        else if hasPrefix t "/-" then
          if (t.splitOn "-/").length > 1 then
            go false rest
          else
            go true rest
        else if hasPrefix t "--" then
          go false rest
        else
          false
  go false (content.splitOn "\n")

/-! ### Expected Mult surface (required decl lists in HostModuleCheckFixtures)
    Greppable: multRequiredDecls, hostComposeRequiredDecls, HostModuleCheckFixtures. -/

/-- Expected namespaces for seed roles. -/
def multExpectedNamespace : String := "SystemsLean.Mult"
def linearExpectedNamespace : String := "SystemsLean.Linear"
def typesExpectedNamespace : String := "SystemsLean.Types"
def irProgramExpectedNamespace : String := "SystemsLean.IrProgram"
def irGraphExpectedNamespace : String := "SystemsLean.IrGraph"
def hostComposeExpectedNamespace : String := "SystemsLean.HostCompose"
def erasureExpectedNamespace : String := "SystemsLean.Erasure"
def extractExpectedNamespace : String := "SystemsLean.Extract"
def compilePathExpectedNamespace : String := "SystemsLean.CompilePath"
def kernelMultExpectedNamespace : String := "SystemsLean.KernelMult"
def kernelLinearExpectedNamespace : String := "SystemsLean.KernelLinear"
def kernelTypesExpectedNamespace : String := "SystemsLean.KernelTypes"
def kernelProgramExpectedNamespace : String := "SystemsLean.KernelProgram"
def joinMapExpectedNamespace : String := "SystemsLean.JoinMap"
def selfHostExpectedNamespace : String := "SystemsLean.SelfHost"
def surfaceMatrixExpectedNamespace : String := "SystemsLean.SurfaceMatrix"
def emitMultExpectedNamespace : String := "SystemsLean.EmitMult"
def emitLinearExpectedNamespace : String := "SystemsLean.EmitLinear"
def emitTypesExpectedNamespace : String := "SystemsLean.EmitTypes"
def emitProgramExpectedNamespace : String := "SystemsLean.EmitProgram"
def emitGraphExpectedNamespace : String := "SystemsLean.EmitGraph"
def emitComposeExpectedNamespace : String := "SystemsLean.EmitCompose"
def emitPlanExpectedNamespace : String := "SystemsLean.EmitPlan"
def emitApplyExpectedNamespace : String := "SystemsLean.EmitApply"
def emitBodyExpectedNamespace : String := "SystemsLean.EmitBody"
def emitErasureExpectedNamespace : String := "SystemsLean.EmitErasure"
def emitExtractExpectedNamespace : String := "SystemsLean.EmitExtract"
def emitBannerExpectedNamespace : String := "SystemsLean.EmitBanner"
def kernelSelfApplyExpectedNamespace : String := "SystemsLean.KernelSelfApply"
def kernelEmitExpectedNamespace : String := "SystemsLean.KernelEmit"
def parityMultExpectedNamespace : String := "SystemsLean.ParityMult"
def parityLinearExpectedNamespace : String := "SystemsLean.ParityLinear"
def parityTypesExpectedNamespace : String := "SystemsLean.ParityTypes"
def parityProgramExpectedNamespace : String := "SystemsLean.ParityProgram"
def parityEmitExpectedNamespace : String := "SystemsLean.ParityEmit"
def selfApplyExpectedNamespace : String := "SystemsLean.SelfApply"
def productOutKernelExpectedNamespace : String := "SystemsLean.ProductOutKernel"
def bootstrapHonestyExpectedNamespace : String := "SystemsLean.BootstrapHonesty"
def productPathWriterSurfaceExpectedNamespace : String := "SystemsLean.ProductPathWriterSurface"
def productPathWriterPathPlanExpectedNamespace : String := "SystemsLean.ProductPathWriterPathPlan"
def productPathWriterPathExecExpectedNamespace : String := "SystemsLean.ProductPathWriterPathExec"

/-- Shared surface check: expected namespace + required decls + optional import.
    Greppable: checkNamedSurface. -/
def checkNamedSurface (surf : RealModuleSurface) (expectedNs : String)
    (required : List String) (needImport : Option String) :
    ModuleCheckResult :=
  match surf.namespaceName with
  | none => ModuleCheckResult.reject reasonMissingNamespace
  | some ns =>
    if ns != expectedNs then
      ModuleCheckResult.reject reasonMissingNamespace
    else
      match needImport with
      | some imp =>
        if !(surf.imports.any (fun i => i == imp)) then
          ModuleCheckResult.reject reasonMissingImport
        else if required.any (fun d => !(hasKey surf.keyDecls d)) then
          ModuleCheckResult.reject reasonMissingDecl
        else
          ModuleCheckResult.accept surf
      | none =>
        if required.any (fun d => !(hasKey surf.keyDecls d)) then
          ModuleCheckResult.reject reasonMissingDecl
        else
          ModuleCheckResult.accept surf

/-- Check Mult surface. Greppable: checkMultSurface. -/
def checkMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multExpectedNamespace multRequiredDecls none

/-- Check MultTheorems surface. Greppable: checkMultTheoremsSurface. -/
def checkMultTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf multExpectedNamespace multTheoremsRequiredDecls
    (some "SystemsLean.Mult")

/-- Check Linear surface. Greppable: checkLinearSurface. -/
def checkLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf linearExpectedNamespace linearRequiredDecls none

/-- Check LinearTheorems surface. Greppable: checkLinearTheoremsSurface. -/
def checkLinearTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf linearExpectedNamespace linearTheoremsRequiredDecls
    (some "SystemsLean.Linear")

/-- Check Types surface. Greppable: checkTypesSurface. -/
def checkTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf typesExpectedNamespace typesRequiredDecls
    (some "SystemsLean.Mult")

/-- Check TypesTheorems surface. Greppable: checkTypesTheoremsSurface. -/
def checkTypesTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf typesExpectedNamespace typesTheoremsRequiredDecls
    (some "SystemsLean.Types")

/-- Check IrProgram surface (Program unit). Greppable: checkIrProgramSurface. -/
def checkIrProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irProgramExpectedNamespace irProgramRequiredDecls
    (some "SystemsLean.Types")

/-- Check IrProgramTheorems surface. Greppable: checkIrProgramTheoremsSurface. -/
def checkIrProgramTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irProgramExpectedNamespace irProgramTheoremsRequiredDecls
    (some "SystemsLean.IrProgram")

/-- Check IrGraph surface (Graph unit). Greppable: checkIrGraphSurface. -/
def checkIrGraphSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irGraphExpectedNamespace irGraphRequiredDecls
    (some "SystemsLean.IrProgram")

/-- Check IrGraphTheorems surface. Greppable: checkIrGraphTheoremsSurface. -/
def checkIrGraphTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf irGraphExpectedNamespace irGraphTheoremsRequiredDecls
    (some "SystemsLean.IrGraph")

/-- Check HostCompose surface (Compose unit). Greppable: checkHostComposeSurface. -/
def checkHostComposeSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf hostComposeExpectedNamespace hostComposeRequiredDecls
    (some "SystemsLean.IrGraph")

/-- Check HostComposeTheorems surface.
    Greppable: checkHostComposeTheoremsSurface. -/
def checkHostComposeTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf hostComposeExpectedNamespace
    hostComposeTheoremsRequiredDecls (some "SystemsLean.HostCompose")

/-- Check Erasure surface. Greppable: checkErasureSurface. -/
def checkErasureSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf erasureExpectedNamespace erasureRequiredDecls
    (some "SystemsLean.Mult")

/-- Check ErasureTheorems surface. Greppable: checkErasureTheoremsSurface. -/
def checkErasureTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf erasureExpectedNamespace erasureTheoremsRequiredDecls
    (some "SystemsLean.Erasure")

/-- Check Extract surface. Greppable: checkExtractSurface. -/
def checkExtractSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf extractExpectedNamespace extractRequiredDecls
    (some "SystemsLean.Erasure")

/-- Check ExtractTheorems surface. Greppable: checkExtractTheoremsSurface. -/
def checkExtractTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf extractExpectedNamespace extractTheoremsRequiredDecls
    (some "SystemsLean.Extract")

/-- Check CompilePath surface. Greppable: checkCompilePathSurface. -/
def checkCompilePathSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf compilePathExpectedNamespace compilePathRequiredDecls
    (some "SystemsLean.Mult")

/-- Check KernelMult surface. Greppable: checkKernelMultSurface. -/
def checkKernelMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelMultExpectedNamespace kernelMultRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelLinear surface. Greppable: checkKernelLinearSurface. -/
def checkKernelLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelLinearExpectedNamespace kernelLinearRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelTypes surface. Greppable: checkKernelTypesSurface. -/
def checkKernelTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelTypesExpectedNamespace kernelTypesRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelProgram surface. Greppable: checkKernelProgramSurface. -/
def checkKernelProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelProgramExpectedNamespace kernelProgramRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check KernelMultTheorems surface (parent namespace KernelMult).
    Greppable: checkKernelMultTheoremsSurface. -/
def checkKernelMultTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelMultExpectedNamespace
    kernelMultTheoremsRequiredDecls (some "SystemsLean.KernelMult")

/-- Check KernelLinearTheorems surface (parent namespace KernelLinear).
    Greppable: checkKernelLinearTheoremsSurface. -/
def checkKernelLinearTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelLinearExpectedNamespace
    kernelLinearTheoremsRequiredDecls (some "SystemsLean.KernelLinear")

/-- Check KernelTypesTheorems surface (parent namespace KernelTypes).
    Greppable: checkKernelTypesTheoremsSurface. -/
def checkKernelTypesTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelTypesExpectedNamespace
    kernelTypesTheoremsRequiredDecls (some "SystemsLean.KernelTypes")

/-- Check KernelProgramTheorems surface (parent namespace KernelProgram).
    Greppable: checkKernelProgramTheoremsSurface. -/
def checkKernelProgramTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelProgramExpectedNamespace
    kernelProgramTheoremsRequiredDecls (some "SystemsLean.KernelProgram")

/-- Check JoinMap surface. Greppable: checkJoinMapSurface. -/
def checkJoinMapSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf joinMapExpectedNamespace joinMapRequiredDecls
    (some "SystemsLean.CompilePath")

/-- Check JoinMapTheorems surface (parent namespace JoinMap).
    Greppable: checkJoinMapTheoremsSurface. -/
def checkJoinMapTheoremsSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf joinMapExpectedNamespace joinMapTheoremsRequiredDecls
    (some "SystemsLean.JoinMap")

/-- Check SelfHost surface. Greppable: checkSelfHostSurface. -/
def checkSelfHostSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf selfHostExpectedNamespace selfHostRequiredDecls
    (some "SystemsLean.JoinMap")

/-- Check SelfHostTheorems surface (parent namespace SelfHost).
    Greppable: checkSelfHostTheoremsSurface. -/
def checkSelfHostTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf selfHostExpectedNamespace selfHostTheoremsRequiredDecls
    (some "SystemsLean.SelfHost")

/-- Check SurfaceMatrix surface. Greppable: checkSurfaceMatrixSurface. -/
def checkSurfaceMatrixSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf surfaceMatrixExpectedNamespace surfaceMatrixRequiredDecls
    (some "SystemsLean.SelfHost")

/-- Check SurfaceMatrixTheorems surface (parent namespace SurfaceMatrix).
    Greppable: checkSurfaceMatrixTheoremsSurface. -/
def checkSurfaceMatrixTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf surfaceMatrixExpectedNamespace
    surfaceMatrixTheoremsRequiredDecls (some "SystemsLean.SurfaceMatrix")

/-- Check EmitMultScaffold surface (ns EmitMult; imports Mult).
    Greppable: checkEmitMultScaffoldSurface. -/
def checkEmitMultScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitMultExpectedNamespace emitMultScaffoldRequiredDecls
    (some "SystemsLean.Mult")

/-- Check EmitLinearScaffold surface (ns EmitLinear; leaf).
    Greppable: checkEmitLinearScaffoldSurface. -/
def checkEmitLinearScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitLinearExpectedNamespace
    emitLinearScaffoldRequiredDecls none

/-- Check EmitTypesScaffold surface. Greppable: checkEmitTypesScaffoldSurface. -/
def checkEmitTypesScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitTypesExpectedNamespace emitTypesScaffoldRequiredDecls
    none

/-- Check EmitProgramScaffold surface.
    Greppable: checkEmitProgramScaffoldSurface. -/
def checkEmitProgramScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitProgramExpectedNamespace
    emitProgramScaffoldRequiredDecls none

/-- Check EmitGraphScaffold surface. Greppable: checkEmitGraphScaffoldSurface. -/
def checkEmitGraphScaffoldSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitGraphExpectedNamespace emitGraphScaffoldRequiredDecls
    none

/-- Check EmitComposeScaffold surface.
    Greppable: checkEmitComposeScaffoldSurface. -/
def checkEmitComposeScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitComposeExpectedNamespace
    emitComposeScaffoldRequiredDecls none

/-- Check EmitPlanScaffold surface (ns EmitPlan; leaf).
    Greppable: checkEmitPlanScaffoldSurface. -/
def checkEmitPlanScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitPlanExpectedNamespace emitPlanScaffoldRequiredDecls
    none

/-- Check EmitApplyScaffold surface (ns EmitApply; leaf).
    Greppable: checkEmitApplyScaffoldSurface. -/
def checkEmitApplyScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitApplyExpectedNamespace
    emitApplyScaffoldRequiredDecls none

/-- Check EmitBodyScaffold surface (ns EmitBody; leaf).
    Greppable: checkEmitBodyScaffoldSurface. -/
def checkEmitBodyScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitBodyExpectedNamespace emitBodyScaffoldRequiredDecls
    none

/-- Check EmitErasureScaffold surface (ns EmitErasure; leaf).
    Greppable: checkEmitErasureScaffoldSurface. -/
def checkEmitErasureScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitErasureExpectedNamespace
    emitErasureScaffoldRequiredDecls none

/-- Check EmitExtractScaffold surface (ns EmitExtract; leaf).
    Greppable: checkEmitExtractScaffoldSurface. -/
def checkEmitExtractScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitExtractExpectedNamespace
    emitExtractScaffoldRequiredDecls none

/-- Check EmitBannerScaffold surface (ns EmitBanner; leaf).
    Greppable: checkEmitBannerScaffoldSurface. -/
def checkEmitBannerScaffoldSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf emitBannerExpectedNamespace
    emitBannerScaffoldRequiredDecls none

/-- Check KernelSelfApply surface (leaf).
    Greppable: checkKernelSelfApplySurface. -/
def checkKernelSelfApplySurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelSelfApplyExpectedNamespace
    kernelSelfApplyRequiredDecls none

/-- Check KernelSelfApplyTheorems surface (parent namespace KernelSelfApply).
    Greppable: checkKernelSelfApplyTheoremsSurface. -/
def checkKernelSelfApplyTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelSelfApplyExpectedNamespace
    kernelSelfApplyTheoremsRequiredDecls (some "SystemsLean.KernelSelfApply")

/-- Check EmitMult product shell (ns EmitMult; imports EmitMultScaffold).
    Product module is scaffold import shell (no key product defs on disk).
    Greppable: checkEmitMultSurface. -/
def checkEmitMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitMultExpectedNamespace emitMultRequiredDecls
    (some "SystemsLean.EmitMultScaffold")

/-- Check EmitLinear product shell (ns EmitLinear; imports EmitLinearScaffold).
    Scaffold-import shell (defs live on EmitLinearScaffold).
    Greppable: checkEmitLinearSurface. -/
def checkEmitLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitLinearExpectedNamespace emitLinearRequiredDecls
    (some "SystemsLean.EmitLinearScaffold")

/-- Check EmitTypes product shell (ns EmitTypes; imports EmitTypesScaffold).
    Scaffold-import shell (defs live on EmitTypesScaffold).
    Greppable: checkEmitTypesSurface. -/
def checkEmitTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitTypesExpectedNamespace emitTypesRequiredDecls
    (some "SystemsLean.EmitTypesScaffold")

/-- Check EmitProgram product shell (ns EmitProgram; imports EmitProgramScaffold).
    Scaffold-import shell (defs live on EmitProgramScaffold).
    Greppable: checkEmitProgramSurface. -/
def checkEmitProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitProgramExpectedNamespace emitProgramRequiredDecls
    (some "SystemsLean.EmitProgramScaffold")

/-- Check EmitGraph product shell (ns EmitGraph; imports EmitGraphScaffold).
    Scaffold-import shell (defs live on EmitGraphScaffold).
    Greppable: checkEmitGraphSurface. -/
def checkEmitGraphSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitGraphExpectedNamespace emitGraphRequiredDecls
    (some "SystemsLean.EmitGraphScaffold")

/-- Check EmitCompose product shell (ns EmitCompose; imports EmitComposeScaffold).
    Scaffold-import shell (defs live on EmitComposeScaffold).
    Greppable: checkEmitComposeSurface. -/
def checkEmitComposeSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitComposeExpectedNamespace emitComposeRequiredDecls
    (some "SystemsLean.EmitComposeScaffold")

/-- Check EmitErasure product shell (ns EmitErasure; imports EmitErasureScaffold).
    Scaffold-import shell (defs live on EmitErasureScaffold).
    Greppable: checkEmitErasureSurface. -/
def checkEmitErasureSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitErasureExpectedNamespace emitErasureRequiredDecls
    (some "SystemsLean.EmitErasureScaffold")

/-- Check EmitExtract product shell (ns EmitExtract; imports EmitExtractScaffold).
    Scaffold-import shell (defs live on EmitExtractScaffold).
    Greppable: checkEmitExtractSurface. -/
def checkEmitExtractSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitExtractExpectedNamespace emitExtractRequiredDecls
    (some "SystemsLean.EmitExtractScaffold")

/-- Check EmitBanner product shell (ns EmitBanner; imports EmitBannerScaffold).
    Scaffold-import shell (defs live on EmitBannerScaffold).
    Greppable: checkEmitBannerSurface. -/
def checkEmitBannerSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitBannerExpectedNamespace emitBannerRequiredDecls
    (some "SystemsLean.EmitBannerScaffold")

/-- Check ProductOutKernel leaf (SelfApplyFs dep; no package import).
    Greppable: checkProductOutKernelSurface. -/
def checkProductOutKernelSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productOutKernelExpectedNamespace
    productOutKernelRequiredDecls none

/-- Check ProductOutKernelTheorems (parent ns ProductOutKernel).
    Greppable: checkProductOutKernelTheoremsSurface. -/
def checkProductOutKernelTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productOutKernelExpectedNamespace
    productOutKernelTheoremsRequiredDecls (some "SystemsLean.ProductOutKernel")

/-- Check BootstrapHonesty leaf (SelfApplyFs dep; no package import).
    Greppable: checkBootstrapHonestySurface. -/
def checkBootstrapHonestySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf bootstrapHonestyExpectedNamespace
    bootstrapHonestyRequiredDecls none

/-- Check BootstrapHonestyTheorems (parent ns BootstrapHonesty).
    Greppable: checkBootstrapHonestyTheoremsSurface. -/
def checkBootstrapHonestyTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf bootstrapHonestyExpectedNamespace
    bootstrapHonestyTheoremsRequiredDecls (some "SystemsLean.BootstrapHonesty")

/-- Check ProductPathWriterSurface leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: checkProductPathWriterSurfaceSurface. -/
def checkProductPathWriterSurfaceSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathWriterSurfaceExpectedNamespace
    productPathWriterSurfaceRequiredDecls none

/-- Check ProductPathWriterSurfaceTheorems (parent ns ProductPathWriterSurface).
    Greppable: checkProductPathWriterSurfaceTheoremsSurface. -/
def checkProductPathWriterSurfaceTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathWriterSurfaceExpectedNamespace
    productPathWriterSurfaceTheoremsRequiredDecls (some "SystemsLean.ProductPathWriterSurface")

/-- Check ProductPathWriterPathPlan leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: checkProductPathWriterPathPlanSurface. -/
def checkProductPathWriterPathPlanSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathPlanExpectedNamespace
    productPathWriterPathPlanRequiredDecls none

/-- Check ProductPathWriterPathPlanTheorems (parent ns ProductPathWriterPathPlan).
    Greppable: checkProductPathWriterPathPlanTheoremsSurface. -/
def checkProductPathWriterPathPlanTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathPlanExpectedNamespace
    productPathWriterPathPlanTheoremsRequiredDecls (some "SystemsLean.ProductPathWriterPathPlan")

/-- Check ProductPathWriterPathExec leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: checkProductPathWriterPathExecSurface. -/
def checkProductPathWriterPathExecSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathExecExpectedNamespace
    productPathWriterPathExecRequiredDecls none

/-- Check ProductPathWriterPathExecTheorems (parent ns ProductPathWriterPathExec).
    Greppable: checkProductPathWriterPathExecTheoremsSurface. -/
def checkProductPathWriterPathExecTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf productPathWriterPathExecExpectedNamespace
    productPathWriterPathExecTheoremsRequiredDecls (some "SystemsLean.ProductPathWriterPathExec")

/-- Check EmitPlan product surface (imports EmitPlanScaffold).
    Greppable: checkEmitPlanSurface. -/
def checkEmitPlanSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitPlanExpectedNamespace emitPlanRequiredDecls
    (some "SystemsLean.EmitPlanScaffold")

/-- Check EmitApply product surface (imports EmitApplyScaffold).
    Greppable: checkEmitApplySurface. -/
def checkEmitApplySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitApplyExpectedNamespace emitApplyRequiredDecls
    (some "SystemsLean.EmitApplyScaffold")

/-- Check EmitBody product surface (imports EmitPlan).
    Greppable: checkEmitBodySurface. -/
def checkEmitBodySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf emitBodyExpectedNamespace emitBodyRequiredDecls
    (some "SystemsLean.EmitPlan")

/-- Check KernelEmit product surface (imports KernelProgram; multi-import honest
    edges enforced on HostImportGraph).
    Greppable: checkKernelEmitSurface. -/
def checkKernelEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf kernelEmitExpectedNamespace kernelEmitRequiredDecls
    (some "SystemsLean.KernelProgram")

/-- Check KernelEmitTheorems surface (parent namespace KernelEmit).
    Greppable: checkKernelEmitTheoremsSurface. -/
def checkKernelEmitTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf kernelEmitExpectedNamespace
    kernelEmitTheoremsRequiredDecls (some "SystemsLean.KernelEmit")

/-- Check ParityMult surface (imports KernelMult; multi-import honest edges
    enforced on HostImportGraph).
    Greppable: checkParityMultSurface. -/
def checkParityMultSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityMultExpectedNamespace parityMultRequiredDecls
    (some "SystemsLean.KernelMult")

/-- Check ParityMultTheorems surface (parent namespace ParityMult).
    Greppable: checkParityMultTheoremsSurface. -/
def checkParityMultTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityMultExpectedNamespace
    parityMultTheoremsRequiredDecls (some "SystemsLean.ParityMult")

/-- Check ParityLinear surface (imports KernelLinear; multi-import honest edges
    enforced on HostImportGraph).
    Greppable: checkParityLinearSurface. -/
def checkParityLinearSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityLinearExpectedNamespace parityLinearRequiredDecls
    (some "SystemsLean.KernelLinear")

/-- Check ParityLinearTheorems surface (parent namespace ParityLinear).
    Greppable: checkParityLinearTheoremsSurface. -/
def checkParityLinearTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityLinearExpectedNamespace
    parityLinearTheoremsRequiredDecls (some "SystemsLean.ParityLinear")

/-- Check ParityTypes surface (imports KernelTypes; multi-import honest edges
    enforced on HostImportGraph).
    Greppable: checkParityTypesSurface. -/
def checkParityTypesSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityTypesExpectedNamespace parityTypesRequiredDecls
    (some "SystemsLean.KernelTypes")

/-- Check ParityTypesTheorems surface (parent namespace ParityTypes).
    Greppable: checkParityTypesTheoremsSurface. -/
def checkParityTypesTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityTypesExpectedNamespace
    parityTypesTheoremsRequiredDecls (some "SystemsLean.ParityTypes")

/-- Check ParityProgram surface (imports KernelProgram; multi-import honest edges
    for seed expand). Greppable: checkParityProgramSurface. -/
def checkParityProgramSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityProgramExpectedNamespace parityProgramRequiredDecls
    (some "SystemsLean.KernelProgram")

/-- Check ParityProgramTheorems surface (parent namespace ParityProgram).
    Greppable: checkParityProgramTheoremsSurface. -/
def checkParityProgramTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityProgramExpectedNamespace
    parityProgramTheoremsRequiredDecls (some "SystemsLean.ParityProgram")

/-- Check ParityEmit surface (imports KernelEmit; multi-import honest edges
    for seed expand). Greppable: checkParityEmitSurface. -/
def checkParityEmitSurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf parityEmitExpectedNamespace parityEmitRequiredDecls
    (some "SystemsLean.KernelEmit")

/-- Check ParityEmitTheorems surface (parent namespace ParityEmit).
    Greppable: checkParityEmitTheoremsSurface. -/
def checkParityEmitTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf parityEmitExpectedNamespace
    parityEmitTheoremsRequiredDecls (some "SystemsLean.ParityEmit")

/-- Check SelfApply surface (imports ParityMult; multi-import honest edges
    for seed expand). Greppable: checkSelfApplySurface. -/
def checkSelfApplySurface (surf : RealModuleSurface) : ModuleCheckResult :=
  checkNamedSurface surf selfApplyExpectedNamespace selfApplyRequiredDecls
    (some "SystemsLean.ParityMult")

/-- Check SelfApplyTheorems surface (parent namespace SelfApply).
    Greppable: checkSelfApplyTheoremsSurface. -/
def checkSelfApplyTheoremsSurface (surf : RealModuleSurface) :
    ModuleCheckResult :=
  checkNamedSurface surf selfApplyExpectedNamespace
    selfApplyTheoremsRequiredDecls (some "SystemsLean.SelfApply")

/-- Build surface from content (no accept/reject yet).
    Greppable: surfaceFromContent. -/
def surfaceFromContent (modName : String) (content : String) :
    RealModuleSurface :=
  { name := modName
    imports := extractImports content
    namespaceName := extractNamespace content
    keyDecls := extractKeyDecls content }

/-- Structural check of one real module content against seed role.
    Greppable: checkRealModule. -/
def checkRealModule (modName : String) (content : String) :
    ModuleCheckResult :=
  if isEffectivelyEmpty content then
    ModuleCheckResult.reject reasonEmptyModule
  else
    let surf := surfaceFromContent modName content
    if modName == "SystemsLean.Mult" then
      checkMultSurface surf
    else if modName == "SystemsLean.MultTheorems" then
      checkMultTheoremsSurface surf
    else if modName == "SystemsLean.Linear" then
      checkLinearSurface surf
    else if modName == "SystemsLean.LinearTheorems" then
      checkLinearTheoremsSurface surf
    else if modName == "SystemsLean.Types" then
      checkTypesSurface surf
    else if modName == "SystemsLean.TypesTheorems" then
      checkTypesTheoremsSurface surf
    else if modName == "SystemsLean.IrProgram" then
      checkIrProgramSurface surf
    else if modName == "SystemsLean.IrProgramTheorems" then
      checkIrProgramTheoremsSurface surf
    else if modName == "SystemsLean.IrGraph" then
      checkIrGraphSurface surf
    else if modName == "SystemsLean.IrGraphTheorems" then
      checkIrGraphTheoremsSurface surf
    else if modName == "SystemsLean.HostCompose" then
      checkHostComposeSurface surf
    else if modName == "SystemsLean.HostComposeTheorems" then
      checkHostComposeTheoremsSurface surf
    else if modName == "SystemsLean.Erasure" then
      checkErasureSurface surf
    else if modName == "SystemsLean.ErasureTheorems" then
      checkErasureTheoremsSurface surf
    else if modName == "SystemsLean.Extract" then
      checkExtractSurface surf
    else if modName == "SystemsLean.ExtractTheorems" then
      checkExtractTheoremsSurface surf
    else if modName == "SystemsLean.CompilePath" then
      checkCompilePathSurface surf
    else if modName == "SystemsLean.KernelMult" then
      checkKernelMultSurface surf
    else if modName == "SystemsLean.KernelLinear" then
      checkKernelLinearSurface surf
    else if modName == "SystemsLean.KernelTypes" then
      checkKernelTypesSurface surf
    else if modName == "SystemsLean.KernelProgram" then
      checkKernelProgramSurface surf
    else if modName == "SystemsLean.KernelMultTheorems" then
      checkKernelMultTheoremsSurface surf
    else if modName == "SystemsLean.KernelLinearTheorems" then
      checkKernelLinearTheoremsSurface surf
    else if modName == "SystemsLean.KernelTypesTheorems" then
      checkKernelTypesTheoremsSurface surf
    else if modName == "SystemsLean.KernelProgramTheorems" then
      checkKernelProgramTheoremsSurface surf
    else if modName == "SystemsLean.JoinMap" then
      checkJoinMapSurface surf
    else if modName == "SystemsLean.JoinMapTheorems" then
      checkJoinMapTheoremsSurface surf
    else if modName == "SystemsLean.SelfHost" then
      checkSelfHostSurface surf
    else if modName == "SystemsLean.SelfHostTheorems" then
      checkSelfHostTheoremsSurface surf
    else if modName == "SystemsLean.SurfaceMatrix" then
      checkSurfaceMatrixSurface surf
    else if modName == "SystemsLean.SurfaceMatrixTheorems" then
      checkSurfaceMatrixTheoremsSurface surf
    else if modName == "SystemsLean.EmitMultScaffold" then
      checkEmitMultScaffoldSurface surf
    else if modName == "SystemsLean.EmitLinearScaffold" then
      checkEmitLinearScaffoldSurface surf
    else if modName == "SystemsLean.EmitTypesScaffold" then
      checkEmitTypesScaffoldSurface surf
    else if modName == "SystemsLean.EmitProgramScaffold" then
      checkEmitProgramScaffoldSurface surf
    else if modName == "SystemsLean.EmitGraphScaffold" then
      checkEmitGraphScaffoldSurface surf
    else if modName == "SystemsLean.EmitComposeScaffold" then
      checkEmitComposeScaffoldSurface surf
    else if modName == "SystemsLean.EmitPlanScaffold" then
      checkEmitPlanScaffoldSurface surf
    else if modName == "SystemsLean.EmitApplyScaffold" then
      checkEmitApplyScaffoldSurface surf
    else if modName == "SystemsLean.EmitBodyScaffold" then
      checkEmitBodyScaffoldSurface surf
    else if modName == "SystemsLean.EmitErasureScaffold" then
      checkEmitErasureScaffoldSurface surf
    else if modName == "SystemsLean.EmitExtractScaffold" then
      checkEmitExtractScaffoldSurface surf
    else if modName == "SystemsLean.EmitBannerScaffold" then
      checkEmitBannerScaffoldSurface surf
    else if modName == "SystemsLean.KernelSelfApply" then
      checkKernelSelfApplySurface surf
    else if modName == "SystemsLean.KernelSelfApplyTheorems" then
      checkKernelSelfApplyTheoremsSurface surf
    else if modName == "SystemsLean.EmitMult" then
      checkEmitMultSurface surf
    else if modName == "SystemsLean.EmitPlan" then
      checkEmitPlanSurface surf
    else if modName == "SystemsLean.EmitApply" then
      checkEmitApplySurface surf
    else if modName == "SystemsLean.EmitBody" then
      checkEmitBodySurface surf
    else if modName == "SystemsLean.KernelEmit" then
      checkKernelEmitSurface surf
    else if modName == "SystemsLean.KernelEmitTheorems" then
      checkKernelEmitTheoremsSurface surf
    else if modName == "SystemsLean.ParityMult" then
      checkParityMultSurface surf
    else if modName == "SystemsLean.ParityMultTheorems" then
      checkParityMultTheoremsSurface surf
    else if modName == "SystemsLean.ParityLinear" then
      checkParityLinearSurface surf
    else if modName == "SystemsLean.ParityLinearTheorems" then
      checkParityLinearTheoremsSurface surf
    else if modName == "SystemsLean.ParityTypes" then
      checkParityTypesSurface surf
    else if modName == "SystemsLean.ParityTypesTheorems" then
      checkParityTypesTheoremsSurface surf
    else if modName == "SystemsLean.ParityProgram" then
      checkParityProgramSurface surf
    else if modName == "SystemsLean.ParityProgramTheorems" then
      checkParityProgramTheoremsSurface surf
    else if modName == "SystemsLean.ParityEmit" then
      checkParityEmitSurface surf
    else if modName == "SystemsLean.ParityEmitTheorems" then
      checkParityEmitTheoremsSurface surf
    else if modName == "SystemsLean.SelfApply" then
      checkSelfApplySurface surf
    else if modName == "SystemsLean.SelfApplyTheorems" then
      checkSelfApplyTheoremsSurface surf
    else if modName == "SystemsLean.EmitLinear" then
      checkEmitLinearSurface surf
    else if modName == "SystemsLean.EmitTypes" then
      checkEmitTypesSurface surf
    else if modName == "SystemsLean.EmitProgram" then
      checkEmitProgramSurface surf
    else if modName == "SystemsLean.EmitGraph" then
      checkEmitGraphSurface surf
    else if modName == "SystemsLean.EmitCompose" then
      checkEmitComposeSurface surf
    else if modName == "SystemsLean.EmitErasure" then
      checkEmitErasureSurface surf
    else if modName == "SystemsLean.EmitExtract" then
      checkEmitExtractSurface surf
    else if modName == "SystemsLean.EmitBanner" then
      checkEmitBannerSurface surf
    else if modName == "SystemsLean.ProductOutKernel" then
      checkProductOutKernelSurface surf
    else if modName == "SystemsLean.ProductOutKernelTheorems" then
      checkProductOutKernelTheoremsSurface surf
    else if modName == "SystemsLean.BootstrapHonesty" then
      checkBootstrapHonestySurface surf
    else if modName == "SystemsLean.BootstrapHonestyTheorems" then
      checkBootstrapHonestyTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathWriterSurface" then
      checkProductPathWriterSurfaceSurface surf
    else if modName == "SystemsLean.ProductPathWriterSurfaceTheorems" then
      checkProductPathWriterSurfaceTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathPlan" then
      checkProductPathWriterPathPlanSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathPlanTheorems" then
      checkProductPathWriterPathPlanTheoremsSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathExec" then
      checkProductPathWriterPathExecSurface surf
    else if modName == "SystemsLean.ProductPathWriterPathExecTheorems" then
      checkProductPathWriterPathExecTheoremsSurface surf
    else
      match surf.namespaceName with
      | none => ModuleCheckResult.reject reasonMissingNamespace
      | some _ => ModuleCheckResult.accept surf

/-! ### Dual-pinned good/bad accept results (fixture texts in HostModuleCheckFixtures) -/

/-- Good Mult accepts. Greppable: hostModuleCheckGoodMult. -/
def hostModuleCheckGoodMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckGoodMultText

/-- Good MultTheorems accepts. Greppable: hostModuleCheckGoodMultTheorems. -/
def hostModuleCheckGoodMultTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultTheorems" hostModuleCheckGoodMultTheoremsText

/-- Good Linear accepts. Greppable: hostModuleCheckGoodLinear. -/
def hostModuleCheckGoodLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.Linear" hostModuleCheckGoodLinearText

/-- Good LinearTheorems accepts. Greppable: hostModuleCheckGoodLinearTheorems. -/
def hostModuleCheckGoodLinearTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.LinearTheorems" hostModuleCheckGoodLinearTheoremsText

/-- Good Types accepts. Greppable: hostModuleCheckGoodTypes. -/
def hostModuleCheckGoodTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.Types" hostModuleCheckGoodTypesText

/-- Good TypesTheorems accepts. Greppable: hostModuleCheckGoodTypesTheorems. -/
def hostModuleCheckGoodTypesTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.TypesTheorems" hostModuleCheckGoodTypesTheoremsText

/-- Good IrProgram accepts. Greppable: hostModuleCheckGoodIrProgram. -/
def hostModuleCheckGoodIrProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgram" hostModuleCheckGoodIrProgramText

/-- Good IrProgramTheorems accepts. Greppable: hostModuleCheckGoodIrProgramTheorems. -/
def hostModuleCheckGoodIrProgramTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrProgramTheorems"
    hostModuleCheckGoodIrProgramTheoremsText

/-- Good IrGraph accepts. Greppable: hostModuleCheckGoodIrGraph. -/
def hostModuleCheckGoodIrGraph : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraph" hostModuleCheckGoodIrGraphText

/-- Good IrGraphTheorems accepts. Greppable: hostModuleCheckGoodIrGraphTheorems. -/
def hostModuleCheckGoodIrGraphTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.IrGraphTheorems"
    hostModuleCheckGoodIrGraphTheoremsText

/-- Good HostCompose accepts. Greppable: hostModuleCheckGoodHostCompose. -/
def hostModuleCheckGoodHostCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostCompose" hostModuleCheckGoodHostComposeText

/-- Good HostComposeTheorems accepts.
    Greppable: hostModuleCheckGoodHostComposeTheorems. -/
def hostModuleCheckGoodHostComposeTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.HostComposeTheorems"
    hostModuleCheckGoodHostComposeTheoremsText

/-- Good Erasure accepts. Greppable: hostModuleCheckGoodErasure. -/
def hostModuleCheckGoodErasure : ModuleCheckResult :=
  checkRealModule "SystemsLean.Erasure" hostModuleCheckGoodErasureText

/-- Good ErasureTheorems accepts. Greppable: hostModuleCheckGoodErasureTheorems. -/
def hostModuleCheckGoodErasureTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ErasureTheorems"
    hostModuleCheckGoodErasureTheoremsText

/-- Good Extract accepts. Greppable: hostModuleCheckGoodExtract. -/
def hostModuleCheckGoodExtract : ModuleCheckResult :=
  checkRealModule "SystemsLean.Extract" hostModuleCheckGoodExtractText

/-- Good ExtractTheorems accepts. Greppable: hostModuleCheckGoodExtractTheorems. -/
def hostModuleCheckGoodExtractTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ExtractTheorems"
    hostModuleCheckGoodExtractTheoremsText

/-- Good CompilePath accepts. Greppable: hostModuleCheckGoodCompilePath. -/
def hostModuleCheckGoodCompilePath : ModuleCheckResult :=
  checkRealModule "SystemsLean.CompilePath" hostModuleCheckGoodCompilePathText

/-- Good KernelMult accepts. Greppable: hostModuleCheckGoodKernelMult. -/
def hostModuleCheckGoodKernelMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMult" hostModuleCheckGoodKernelMultText

/-- Good KernelLinear accepts. Greppable: hostModuleCheckGoodKernelLinear. -/
def hostModuleCheckGoodKernelLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelLinear" hostModuleCheckGoodKernelLinearText

/-- Good KernelTypes accepts. Greppable: hostModuleCheckGoodKernelTypes. -/
def hostModuleCheckGoodKernelTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelTypes" hostModuleCheckGoodKernelTypesText

/-- Good KernelProgram accepts. Greppable: hostModuleCheckGoodKernelProgram. -/
def hostModuleCheckGoodKernelProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelProgram" hostModuleCheckGoodKernelProgramText

/-- Good KernelMultTheorems accepts.
    Greppable: hostModuleCheckGoodKernelMultTheorems. -/
def hostModuleCheckGoodKernelMultTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelMultTheorems"
    hostModuleCheckGoodKernelMultTheoremsText

/-- Good KernelLinearTheorems accepts.
    Greppable: hostModuleCheckGoodKernelLinearTheorems. -/
def hostModuleCheckGoodKernelLinearTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelLinearTheorems"
    hostModuleCheckGoodKernelLinearTheoremsText

/-- Good KernelTypesTheorems accepts.
    Greppable: hostModuleCheckGoodKernelTypesTheorems. -/
def hostModuleCheckGoodKernelTypesTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelTypesTheorems"
    hostModuleCheckGoodKernelTypesTheoremsText

/-- Good KernelProgramTheorems accepts.
    Greppable: hostModuleCheckGoodKernelProgramTheorems. -/
def hostModuleCheckGoodKernelProgramTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelProgramTheorems"
    hostModuleCheckGoodKernelProgramTheoremsText

/-- Good JoinMap accepts. Greppable: hostModuleCheckGoodJoinMap. -/
def hostModuleCheckGoodJoinMap : ModuleCheckResult :=
  checkRealModule "SystemsLean.JoinMap" hostModuleCheckGoodJoinMapText

/-- Good JoinMapTheorems accepts.
    Greppable: hostModuleCheckGoodJoinMapTheorems. -/
def hostModuleCheckGoodJoinMapTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.JoinMapTheorems"
    hostModuleCheckGoodJoinMapTheoremsText

/-- Good SelfHost accepts. Greppable: hostModuleCheckGoodSelfHost. -/
def hostModuleCheckGoodSelfHost : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHost" hostModuleCheckGoodSelfHostText

/-- Good SelfHostTheorems accepts.
    Greppable: hostModuleCheckGoodSelfHostTheorems. -/
def hostModuleCheckGoodSelfHostTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfHostTheorems"
    hostModuleCheckGoodSelfHostTheoremsText

/-- Good SurfaceMatrix accepts. Greppable: hostModuleCheckGoodSurfaceMatrix. -/
def hostModuleCheckGoodSurfaceMatrix : ModuleCheckResult :=
  checkRealModule "SystemsLean.SurfaceMatrix" hostModuleCheckGoodSurfaceMatrixText

/-- Good SurfaceMatrixTheorems accepts.
    Greppable: hostModuleCheckGoodSurfaceMatrixTheorems. -/
def hostModuleCheckGoodSurfaceMatrixTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SurfaceMatrixTheorems"
    hostModuleCheckGoodSurfaceMatrixTheoremsText

/-- Good EmitMultScaffold accepts.
    Greppable: hostModuleCheckGoodEmitMultScaffold. -/
def hostModuleCheckGoodEmitMultScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitMultScaffold"
    hostModuleCheckGoodEmitMultScaffoldText

/-- Good EmitLinearScaffold accepts.
    Greppable: hostModuleCheckGoodEmitLinearScaffold. -/
def hostModuleCheckGoodEmitLinearScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitLinearScaffold"
    hostModuleCheckGoodEmitLinearScaffoldText

/-- Good EmitTypesScaffold accepts.
    Greppable: hostModuleCheckGoodEmitTypesScaffold. -/
def hostModuleCheckGoodEmitTypesScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitTypesScaffold"
    hostModuleCheckGoodEmitTypesScaffoldText

/-- Good EmitProgramScaffold accepts.
    Greppable: hostModuleCheckGoodEmitProgramScaffold. -/
def hostModuleCheckGoodEmitProgramScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitProgramScaffold"
    hostModuleCheckGoodEmitProgramScaffoldText

/-- Good EmitGraphScaffold accepts.
    Greppable: hostModuleCheckGoodEmitGraphScaffold. -/
def hostModuleCheckGoodEmitGraphScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitGraphScaffold"
    hostModuleCheckGoodEmitGraphScaffoldText

/-- Good EmitComposeScaffold accepts.
    Greppable: hostModuleCheckGoodEmitComposeScaffold. -/
def hostModuleCheckGoodEmitComposeScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitComposeScaffold"
    hostModuleCheckGoodEmitComposeScaffoldText

/-- Good EmitPlanScaffold accepts.
    Greppable: hostModuleCheckGoodEmitPlanScaffold. -/
def hostModuleCheckGoodEmitPlanScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlanScaffold"
    hostModuleCheckGoodEmitPlanScaffoldText

/-- Good EmitApplyScaffold accepts.
    Greppable: hostModuleCheckGoodEmitApplyScaffold. -/
def hostModuleCheckGoodEmitApplyScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApplyScaffold"
    hostModuleCheckGoodEmitApplyScaffoldText

/-- Good EmitBodyScaffold accepts.
    Greppable: hostModuleCheckGoodEmitBodyScaffold. -/
def hostModuleCheckGoodEmitBodyScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBodyScaffold"
    hostModuleCheckGoodEmitBodyScaffoldText

/-- Good EmitErasureScaffold accepts.
    Greppable: hostModuleCheckGoodEmitErasureScaffold. -/
def hostModuleCheckGoodEmitErasureScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitErasureScaffold"
    hostModuleCheckGoodEmitErasureScaffoldText

/-- Good EmitExtractScaffold accepts.
    Greppable: hostModuleCheckGoodEmitExtractScaffold. -/
def hostModuleCheckGoodEmitExtractScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitExtractScaffold"
    hostModuleCheckGoodEmitExtractScaffoldText

/-- Good EmitBannerScaffold accepts.
    Greppable: hostModuleCheckGoodEmitBannerScaffold. -/
def hostModuleCheckGoodEmitBannerScaffold : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBannerScaffold"
    hostModuleCheckGoodEmitBannerScaffoldText

/-- Good KernelSelfApply accepts.
    Greppable: hostModuleCheckGoodKernelSelfApply. -/
def hostModuleCheckGoodKernelSelfApply : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelSelfApply"
    hostModuleCheckGoodKernelSelfApplyText

/-- Good KernelSelfApplyTheorems accepts.
    Greppable: hostModuleCheckGoodKernelSelfApplyTheorems. -/
def hostModuleCheckGoodKernelSelfApplyTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelSelfApplyTheorems"
    hostModuleCheckGoodKernelSelfApplyTheoremsText

/-- Good EmitMult product accepts.
    Greppable: hostModuleCheckGoodEmitMult. -/
def hostModuleCheckGoodEmitMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitMult" hostModuleCheckGoodEmitMultText

/-- Good EmitPlan product accepts.
    Greppable: hostModuleCheckGoodEmitPlan. -/
def hostModuleCheckGoodEmitPlan : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitPlan" hostModuleCheckGoodEmitPlanText

/-- Good EmitApply product accepts.
    Greppable: hostModuleCheckGoodEmitApply. -/
def hostModuleCheckGoodEmitApply : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitApply" hostModuleCheckGoodEmitApplyText

/-- Good EmitBody product accepts.
    Greppable: hostModuleCheckGoodEmitBody. -/
def hostModuleCheckGoodEmitBody : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBody" hostModuleCheckGoodEmitBodyText

/-- Good KernelEmit product accepts.
    Greppable: hostModuleCheckGoodKernelEmit. -/
def hostModuleCheckGoodKernelEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelEmit" hostModuleCheckGoodKernelEmitText

/-- Good KernelEmitTheorems accepts.
    Greppable: hostModuleCheckGoodKernelEmitTheorems. -/
def hostModuleCheckGoodKernelEmitTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.KernelEmitTheorems"
    hostModuleCheckGoodKernelEmitTheoremsText

/-- Good ParityMult accepts.
    Greppable: hostModuleCheckGoodParityMult. -/
def hostModuleCheckGoodParityMult : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityMult" hostModuleCheckGoodParityMultText

/-- Good ParityMultTheorems accepts.
    Greppable: hostModuleCheckGoodParityMultTheorems. -/
def hostModuleCheckGoodParityMultTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityMultTheorems"
    hostModuleCheckGoodParityMultTheoremsText

/-- Good ParityLinear accepts.
    Greppable: hostModuleCheckGoodParityLinear. -/
def hostModuleCheckGoodParityLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityLinear" hostModuleCheckGoodParityLinearText

/-- Good ParityLinearTheorems accepts.
    Greppable: hostModuleCheckGoodParityLinearTheorems. -/
def hostModuleCheckGoodParityLinearTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityLinearTheorems"
    hostModuleCheckGoodParityLinearTheoremsText

/-- Good ParityTypes accepts.
    Greppable: hostModuleCheckGoodParityTypes. -/
def hostModuleCheckGoodParityTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityTypes" hostModuleCheckGoodParityTypesText

/-- Good ParityTypesTheorems accepts.
    Greppable: hostModuleCheckGoodParityTypesTheorems. -/
def hostModuleCheckGoodParityTypesTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityTypesTheorems"
    hostModuleCheckGoodParityTypesTheoremsText

/-- Good ParityProgram accepts.
    Greppable: hostModuleCheckGoodParityProgram. -/
def hostModuleCheckGoodParityProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityProgram" hostModuleCheckGoodParityProgramText

/-- Good ParityProgramTheorems accepts.
    Greppable: hostModuleCheckGoodParityProgramTheorems. -/
def hostModuleCheckGoodParityProgramTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityProgramTheorems"
    hostModuleCheckGoodParityProgramTheoremsText

/-- Good ParityEmit accepts.
    Greppable: hostModuleCheckGoodParityEmit. -/
def hostModuleCheckGoodParityEmit : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityEmit" hostModuleCheckGoodParityEmitText

/-- Good ParityEmitTheorems accepts.
    Greppable: hostModuleCheckGoodParityEmitTheorems. -/
def hostModuleCheckGoodParityEmitTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ParityEmitTheorems"
    hostModuleCheckGoodParityEmitTheoremsText

/-- Good SelfApply accepts.
    Greppable: hostModuleCheckGoodSelfApply. -/
def hostModuleCheckGoodSelfApply : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfApply" hostModuleCheckGoodSelfApplyText

/-- Good SelfApplyTheorems accepts.
    Greppable: hostModuleCheckGoodSelfApplyTheorems. -/
def hostModuleCheckGoodSelfApplyTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.SelfApplyTheorems"
    hostModuleCheckGoodSelfApplyTheoremsText

/-- Good EmitLinear product accepts.
    Greppable: hostModuleCheckGoodEmitLinear. -/
def hostModuleCheckGoodEmitLinear : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitLinear" hostModuleCheckGoodEmitLinearText

/-- Good EmitTypes product accepts.
    Greppable: hostModuleCheckGoodEmitTypes. -/
def hostModuleCheckGoodEmitTypes : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitTypes" hostModuleCheckGoodEmitTypesText

/-- Good EmitProgram product accepts.
    Greppable: hostModuleCheckGoodEmitProgram. -/
def hostModuleCheckGoodEmitProgram : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitProgram" hostModuleCheckGoodEmitProgramText

/-- Good EmitGraph product accepts.
    Greppable: hostModuleCheckGoodEmitGraph. -/
def hostModuleCheckGoodEmitGraph : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitGraph" hostModuleCheckGoodEmitGraphText

/-- Good EmitCompose product accepts.
    Greppable: hostModuleCheckGoodEmitCompose. -/
def hostModuleCheckGoodEmitCompose : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitCompose" hostModuleCheckGoodEmitComposeText

/-- Good EmitErasure product accepts.
    Greppable: hostModuleCheckGoodEmitErasure. -/
def hostModuleCheckGoodEmitErasure : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitErasure" hostModuleCheckGoodEmitErasureText

/-- Good EmitExtract product accepts.
    Greppable: hostModuleCheckGoodEmitExtract. -/
def hostModuleCheckGoodEmitExtract : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitExtract" hostModuleCheckGoodEmitExtractText

/-- Good EmitBanner product accepts.
    Greppable: hostModuleCheckGoodEmitBanner. -/
def hostModuleCheckGoodEmitBanner : ModuleCheckResult :=
  checkRealModule "SystemsLean.EmitBanner" hostModuleCheckGoodEmitBannerText

/-- Good ProductOutKernel accepts.
    Greppable: hostModuleCheckGoodProductOutKernel. -/
def hostModuleCheckGoodProductOutKernel : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductOutKernel"
    hostModuleCheckGoodProductOutKernelText

/-- Good ProductOutKernelTheorems accepts.
    Greppable: hostModuleCheckGoodProductOutKernelTheorems. -/
def hostModuleCheckGoodProductOutKernelTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductOutKernelTheorems"
    hostModuleCheckGoodProductOutKernelTheoremsText

/-- Good BootstrapHonesty accepts.
    Greppable: hostModuleCheckGoodBootstrapHonesty. -/
def hostModuleCheckGoodBootstrapHonesty : ModuleCheckResult :=
  checkRealModule "SystemsLean.BootstrapHonesty"
    hostModuleCheckGoodBootstrapHonestyText

/-- Good BootstrapHonestyTheorems accepts.
    Greppable: hostModuleCheckGoodBootstrapHonestyTheorems. -/
def hostModuleCheckGoodBootstrapHonestyTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.BootstrapHonestyTheorems"
    hostModuleCheckGoodBootstrapHonestyTheoremsText

/-- Good ProductPathWriterSurface accepts.
    Greppable: hostModuleCheckGoodProductPathWriterSurface. -/
def hostModuleCheckGoodProductPathWriterSurface : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterSurface"
    hostModuleCheckGoodProductPathWriterSurfaceText

/-- Good ProductPathWriterSurfaceTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathWriterSurfaceTheorems. -/
def hostModuleCheckGoodProductPathWriterSurfaceTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterSurfaceTheorems"
    hostModuleCheckGoodProductPathWriterSurfaceTheoremsText

/-- Good ProductPathWriterPathPlan accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathPlan. -/
def hostModuleCheckGoodProductPathWriterPathPlan : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathPlan"
    hostModuleCheckGoodProductPathWriterPathPlanText

/-- Good ProductPathWriterPathPlanTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathPlanTheorems. -/
def hostModuleCheckGoodProductPathWriterPathPlanTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathPlanTheorems"
    hostModuleCheckGoodProductPathWriterPathPlanTheoremsText

/-- Good ProductPathWriterPathExec accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathExec. -/
def hostModuleCheckGoodProductPathWriterPathExec : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathExec"
    hostModuleCheckGoodProductPathWriterPathExecText

/-- Good ProductPathWriterPathExecTheorems accepts.
    Greppable: hostModuleCheckGoodProductPathWriterPathExecTheorems. -/
def hostModuleCheckGoodProductPathWriterPathExecTheorems : ModuleCheckResult :=
  checkRealModule "SystemsLean.ProductPathWriterPathExecTheorems"
    hostModuleCheckGoodProductPathWriterPathExecTheoremsText

/-- Bad missing inductive rejects. Greppable: hostModuleCheckBadMissingInductive. -/
def hostModuleCheckBadMissingInductive : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadMissingInductiveText

/-- Bad missing namespace rejects. Greppable: hostModuleCheckBadMissingNamespace. -/
def hostModuleCheckBadMissingNamespace : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadMissingNamespaceText

/-- Bad empty rejects. Greppable: hostModuleCheckBadEmpty. -/
def hostModuleCheckBadEmpty : ModuleCheckResult :=
  checkRealModule "SystemsLean.Mult" hostModuleCheckBadEmptyText

/-- Bad missing theorem rejects. Greppable: hostModuleCheckBadMissingTheorem. -/
def hostModuleCheckBadMissingTheorem : ModuleCheckResult :=
  checkRealModule "SystemsLean.MultTheorems" hostModuleCheckBadMissingTheoremText

/-- Structural expand seed dual-pin holds (good accept + fail-closed bads).
    Greppable: hostModuleCheckLoadOk. -/
def hostModuleCheckLoadOk : Bool :=
  hostModuleCheckGoodMult.isAccept
    && hostModuleCheckGoodMultTheorems.isAccept
    && hostModuleCheckGoodLinear.isAccept
    && hostModuleCheckGoodLinearTheorems.isAccept
    && hostModuleCheckGoodTypes.isAccept
    && hostModuleCheckGoodTypesTheorems.isAccept
    && hostModuleCheckGoodIrProgram.isAccept
    && hostModuleCheckGoodIrProgramTheorems.isAccept
    && hostModuleCheckGoodIrGraph.isAccept
    && hostModuleCheckGoodIrGraphTheorems.isAccept
    && hostModuleCheckGoodHostCompose.isAccept
    && hostModuleCheckGoodHostComposeTheorems.isAccept
    && hostModuleCheckGoodErasure.isAccept
    && hostModuleCheckGoodErasureTheorems.isAccept
    && hostModuleCheckGoodExtract.isAccept
    && hostModuleCheckGoodExtractTheorems.isAccept
    && hostModuleCheckGoodCompilePath.isAccept
    && hostModuleCheckGoodKernelMult.isAccept
    && hostModuleCheckGoodKernelLinear.isAccept
    && hostModuleCheckGoodKernelTypes.isAccept
    && hostModuleCheckGoodKernelProgram.isAccept
    && hostModuleCheckGoodKernelMultTheorems.isAccept
    && hostModuleCheckGoodKernelLinearTheorems.isAccept
    && hostModuleCheckGoodKernelTypesTheorems.isAccept
    && hostModuleCheckGoodKernelProgramTheorems.isAccept
    && hostModuleCheckGoodJoinMap.isAccept
    && hostModuleCheckGoodJoinMapTheorems.isAccept
    && hostModuleCheckGoodSelfHost.isAccept
    && hostModuleCheckGoodSelfHostTheorems.isAccept
    && hostModuleCheckGoodSurfaceMatrix.isAccept
    && hostModuleCheckGoodSurfaceMatrixTheorems.isAccept
    && hostModuleCheckGoodEmitMultScaffold.isAccept
    && hostModuleCheckGoodEmitLinearScaffold.isAccept
    && hostModuleCheckGoodEmitTypesScaffold.isAccept
    && hostModuleCheckGoodEmitProgramScaffold.isAccept
    && hostModuleCheckGoodEmitGraphScaffold.isAccept
    && hostModuleCheckGoodEmitComposeScaffold.isAccept
    && hostModuleCheckGoodEmitPlanScaffold.isAccept
    && hostModuleCheckGoodEmitApplyScaffold.isAccept
    && hostModuleCheckGoodEmitBodyScaffold.isAccept
    && hostModuleCheckGoodEmitErasureScaffold.isAccept
    && hostModuleCheckGoodEmitExtractScaffold.isAccept
    && hostModuleCheckGoodEmitBannerScaffold.isAccept
    && hostModuleCheckGoodKernelSelfApply.isAccept
    && hostModuleCheckGoodKernelSelfApplyTheorems.isAccept
    && hostModuleCheckGoodEmitMult.isAccept
    && hostModuleCheckGoodEmitPlan.isAccept
    && hostModuleCheckGoodEmitApply.isAccept
    && hostModuleCheckGoodEmitBody.isAccept
    && hostModuleCheckGoodKernelEmit.isAccept
    && hostModuleCheckGoodKernelEmitTheorems.isAccept
    && hostModuleCheckGoodParityMult.isAccept
    && hostModuleCheckGoodParityMultTheorems.isAccept
    && hostModuleCheckGoodParityLinear.isAccept
    && hostModuleCheckGoodParityLinearTheorems.isAccept
    && hostModuleCheckGoodParityTypes.isAccept
    && hostModuleCheckGoodParityTypesTheorems.isAccept
    && hostModuleCheckGoodParityProgram.isAccept
    && hostModuleCheckGoodParityProgramTheorems.isAccept
    && hostModuleCheckGoodParityEmit.isAccept
    && hostModuleCheckGoodParityEmitTheorems.isAccept
    && hostModuleCheckGoodSelfApply.isAccept
    && hostModuleCheckGoodSelfApplyTheorems.isAccept
    && hostModuleCheckGoodEmitLinear.isAccept
    && hostModuleCheckGoodEmitTypes.isAccept
    && hostModuleCheckGoodEmitProgram.isAccept
    && hostModuleCheckGoodEmitGraph.isAccept
    && hostModuleCheckGoodEmitCompose.isAccept
    && hostModuleCheckGoodEmitErasure.isAccept
    && hostModuleCheckGoodEmitExtract.isAccept
    && hostModuleCheckGoodEmitBanner.isAccept
    && hostModuleCheckGoodProductOutKernel.isAccept
    && hostModuleCheckGoodProductOutKernelTheorems.isAccept
    && hostModuleCheckGoodBootstrapHonesty.isAccept
    && hostModuleCheckGoodBootstrapHonestyTheorems.isAccept
    && hostModuleCheckGoodProductPathWriterSurface.isAccept
    && hostModuleCheckGoodProductPathWriterSurfaceTheorems.isAccept
    && hostModuleCheckGoodProductPathWriterPathPlan.isAccept
    && hostModuleCheckGoodProductPathWriterPathPlanTheorems.isAccept
    && hostModuleCheckGoodProductPathWriterPathExec.isAccept
    && hostModuleCheckGoodProductPathWriterPathExecTheorems.isAccept
    && hostModuleCheckBadMissingInductive.isRejectWith reasonMissingDecl
    && hostModuleCheckBadMissingNamespace.isRejectWith reasonMissingNamespace
    && hostModuleCheckBadEmpty.isRejectWith reasonEmptyModule
    && hostModuleCheckBadMissingTheorem.isRejectWith reasonMissingDecl
    && (hostModuleCheckSeedModules
      == ["SystemsLean.Mult",
          "SystemsLean.MultTheorems",
          "SystemsLean.Linear",
          "SystemsLean.LinearTheorems",
          "SystemsLean.Types",
          "SystemsLean.TypesTheorems",
          "SystemsLean.IrProgram",
          "SystemsLean.IrProgramTheorems",
          "SystemsLean.IrGraph",
          "SystemsLean.IrGraphTheorems",
          "SystemsLean.HostCompose",
          "SystemsLean.HostComposeTheorems",
          "SystemsLean.Erasure",
          "SystemsLean.ErasureTheorems",
          "SystemsLean.Extract",
          "SystemsLean.ExtractTheorems",
          "SystemsLean.CompilePath",
          "SystemsLean.KernelMult",
          "SystemsLean.KernelLinear",
          "SystemsLean.KernelTypes",
          "SystemsLean.KernelProgram",
          "SystemsLean.KernelMultTheorems",
          "SystemsLean.KernelLinearTheorems",
          "SystemsLean.KernelTypesTheorems",
          "SystemsLean.KernelProgramTheorems",
          "SystemsLean.JoinMap",
          "SystemsLean.JoinMapTheorems",
          "SystemsLean.SelfHost",
          "SystemsLean.SelfHostTheorems",
          "SystemsLean.SurfaceMatrix",
          "SystemsLean.SurfaceMatrixTheorems",
          "SystemsLean.EmitMultScaffold",
          "SystemsLean.EmitLinearScaffold",
          "SystemsLean.EmitTypesScaffold",
          "SystemsLean.EmitProgramScaffold",
          "SystemsLean.EmitGraphScaffold",
          "SystemsLean.EmitComposeScaffold",
          "SystemsLean.EmitPlanScaffold",
          "SystemsLean.EmitApplyScaffold",
          "SystemsLean.EmitBodyScaffold",
          "SystemsLean.EmitErasureScaffold",
          "SystemsLean.EmitExtractScaffold",
          "SystemsLean.EmitBannerScaffold",
          "SystemsLean.KernelSelfApply",
          "SystemsLean.KernelSelfApplyTheorems",
          "SystemsLean.EmitMult",
          "SystemsLean.EmitPlan",
          "SystemsLean.EmitApply",
          "SystemsLean.EmitBody",
          "SystemsLean.KernelEmit",
          "SystemsLean.KernelEmitTheorems",
          "SystemsLean.ParityMult",
          "SystemsLean.ParityMultTheorems",
          "SystemsLean.ParityLinear",
          "SystemsLean.ParityLinearTheorems",
          "SystemsLean.ParityTypes",
          "SystemsLean.ParityTypesTheorems",
          "SystemsLean.ParityProgram",
          "SystemsLean.ParityProgramTheorems",
          "SystemsLean.ParityEmit",
          "SystemsLean.ParityEmitTheorems",
          "SystemsLean.SelfApply",
          "SystemsLean.SelfApplyTheorems",
          "SystemsLean.EmitLinear",
          "SystemsLean.EmitTypes",
          "SystemsLean.EmitProgram",
          "SystemsLean.EmitGraph",
          "SystemsLean.EmitCompose",
          "SystemsLean.EmitErasure",
          "SystemsLean.EmitExtract",
          "SystemsLean.EmitBanner",
          "SystemsLean.ProductOutKernel",
          "SystemsLean.ProductOutKernelTheorems",
          "SystemsLean.BootstrapHonesty",
          "SystemsLean.BootstrapHonestyTheorems",
          "SystemsLean.ProductPathWriterSurface",
          "SystemsLean.ProductPathWriterSurfaceTheorems",
          "SystemsLean.ProductPathWriterPathPlan",
          "SystemsLean.ProductPathWriterPathPlanTheorems",
          "SystemsLean.ProductPathWriterPathExec",
          "SystemsLean.ProductPathWriterPathExecTheorems"])
    && (hostModuleCheckSeedRelPaths
      == ["src/systems/SystemsLean/Mult.lean",
          "src/systems/SystemsLean/MultTheorems.lean",
          "src/systems/SystemsLean/Linear.lean",
          "src/systems/SystemsLean/LinearTheorems.lean",
          "src/systems/SystemsLean/Types.lean",
          "src/systems/SystemsLean/TypesTheorems.lean",
          "src/systems/SystemsLean/IrProgram.lean",
          "src/systems/SystemsLean/IrProgramTheorems.lean",
          "src/systems/SystemsLean/IrGraph.lean",
          "src/systems/SystemsLean/IrGraphTheorems.lean",
          "src/systems/SystemsLean/HostCompose.lean",
          "src/systems/SystemsLean/HostComposeTheorems.lean",
          "src/systems/SystemsLean/Erasure.lean",
          "src/systems/SystemsLean/ErasureTheorems.lean",
          "src/systems/SystemsLean/Extract.lean",
          "src/systems/SystemsLean/ExtractTheorems.lean",
          "src/systems/SystemsLean/CompilePath.lean",
          "src/systems/SystemsLean/KernelMult.lean",
          "src/systems/SystemsLean/KernelLinear.lean",
          "src/systems/SystemsLean/KernelTypes.lean",
          "src/systems/SystemsLean/KernelProgram.lean",
          "src/systems/SystemsLean/KernelMultTheorems.lean",
          "src/systems/SystemsLean/KernelLinearTheorems.lean",
          "src/systems/SystemsLean/KernelTypesTheorems.lean",
          "src/systems/SystemsLean/KernelProgramTheorems.lean",
          "src/systems/SystemsLean/JoinMap.lean",
          "src/systems/SystemsLean/JoinMapTheorems.lean",
          "src/systems/SystemsLean/SelfHost.lean",
          "src/systems/SystemsLean/SelfHostTheorems.lean",
          "src/systems/SystemsLean/SurfaceMatrix.lean",
          "src/systems/SystemsLean/SurfaceMatrixTheorems.lean",
          "src/systems/SystemsLean/EmitMultScaffold.lean",
          "src/systems/SystemsLean/EmitLinearScaffold.lean",
          "src/systems/SystemsLean/EmitTypesScaffold.lean",
          "src/systems/SystemsLean/EmitProgramScaffold.lean",
          "src/systems/SystemsLean/EmitGraphScaffold.lean",
          "src/systems/SystemsLean/EmitComposeScaffold.lean",
          "src/systems/SystemsLean/EmitPlanScaffold.lean",
          "src/systems/SystemsLean/EmitApplyScaffold.lean",
          "src/systems/SystemsLean/EmitBodyScaffold.lean",
          "src/systems/SystemsLean/EmitErasureScaffold.lean",
          "src/systems/SystemsLean/EmitExtractScaffold.lean",
          "src/systems/SystemsLean/EmitBannerScaffold.lean",
          "src/systems/SystemsLean/KernelSelfApply.lean",
          "src/systems/SystemsLean/KernelSelfApplyTheorems.lean",
          "src/systems/SystemsLean/EmitMult.lean",
          "src/systems/SystemsLean/EmitPlan.lean",
          "src/systems/SystemsLean/EmitApply.lean",
          "src/systems/SystemsLean/EmitBody.lean",
          "src/systems/SystemsLean/KernelEmit.lean",
          "src/systems/SystemsLean/KernelEmitTheorems.lean",
          "src/systems/SystemsLean/ParityMult.lean",
          "src/systems/SystemsLean/ParityMultTheorems.lean",
          "src/systems/SystemsLean/ParityLinear.lean",
          "src/systems/SystemsLean/ParityLinearTheorems.lean",
          "src/systems/SystemsLean/ParityTypes.lean",
          "src/systems/SystemsLean/ParityTypesTheorems.lean",
          "src/systems/SystemsLean/ParityProgram.lean",
          "src/systems/SystemsLean/ParityProgramTheorems.lean",
          "src/systems/SystemsLean/ParityEmit.lean",
          "src/systems/SystemsLean/ParityEmitTheorems.lean",
          "src/systems/SystemsLean/SelfApply.lean",
          "src/systems/SystemsLean/SelfApplyTheorems.lean",
          "src/systems/SystemsLean/EmitLinear.lean",
          "src/systems/SystemsLean/EmitTypes.lean",
          "src/systems/SystemsLean/EmitProgram.lean",
          "src/systems/SystemsLean/EmitGraph.lean",
          "src/systems/SystemsLean/EmitCompose.lean",
          "src/systems/SystemsLean/EmitErasure.lean",
          "src/systems/SystemsLean/EmitExtract.lean",
          "src/systems/SystemsLean/EmitBanner.lean",
          "src/systems/SystemsLean/ProductOutKernel.lean",
          "src/systems/SystemsLean/ProductOutKernelTheorems.lean",
          "src/systems/SystemsLean/BootstrapHonesty.lean",
          "src/systems/SystemsLean/BootstrapHonestyTheorems.lean",
          "src/systems/SystemsLean/ProductPathWriterSurface.lean",
          "src/systems/SystemsLean/ProductPathWriterSurfaceTheorems.lean",
          "src/systems/SystemsLean/ProductPathWriterPathPlan.lean",
          "src/systems/SystemsLean/ProductPathWriterPathPlanTheorems.lean",
          "src/systems/SystemsLean/ProductPathWriterPathExec.lean",
          "src/systems/SystemsLean/ProductPathWriterPathExecTheorems.lean"])
    && (designNotePath
      == "doc/dev/research/full-host-elaborator-design-2026-08-03.md")
    && (residualName == "First real host module check")
    && (hostModuleCheckExpandSliceName == "Host library seed expand continue")
    && (hostModuleCheckSeedUnitsLabel
      == "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems")
    && (checkDepthPartial == "PARTIAL-STRUCTURAL")
    && (multRequiredDecls.length == 6)
    && (multTheoremsRequiredDecls.length == 8)
    && (linearRequiredDecls.length == 7)
    && (linearTheoremsRequiredDecls.length == 8)
    && (typesRequiredDecls.length == 6)
    && (typesTheoremsRequiredDecls.length == 8)
    && (irProgramRequiredDecls.length == 6)
    && (irProgramTheoremsRequiredDecls.length == 6)
    && (irGraphRequiredDecls.length == 6)
    && (irGraphTheoremsRequiredDecls.length == 6)
    && (hostComposeRequiredDecls.length == 6)
    && (hostComposeTheoremsRequiredDecls.length == 8)
    && (erasureRequiredDecls.length == 6)
    && (erasureTheoremsRequiredDecls.length == 8)
    && (extractRequiredDecls.length == 6)
    && (extractTheoremsRequiredDecls.length == 8)
    && (compilePathRequiredDecls.length == 6)
    && (kernelMultRequiredDecls.length == 6)
    && (kernelLinearRequiredDecls.length == 6)
    && (kernelTypesRequiredDecls.length == 6)
    && (kernelProgramRequiredDecls.length == 6)
    && (kernelMultTheoremsRequiredDecls.length == 8)
    && (kernelLinearTheoremsRequiredDecls.length == 8)
    && (kernelTypesTheoremsRequiredDecls.length == 8)
    && (kernelProgramTheoremsRequiredDecls.length == 8)
    && (joinMapRequiredDecls.length == 6)
    && (joinMapTheoremsRequiredDecls.length == 8)
    && (selfHostRequiredDecls.length == 6)
    && (selfHostTheoremsRequiredDecls.length == 8)
    && (surfaceMatrixRequiredDecls.length == 6)
    && (surfaceMatrixTheoremsRequiredDecls.length == 8)
    && (emitMultScaffoldRequiredDecls.length == 6)
    && (emitLinearScaffoldRequiredDecls.length == 6)
    && (emitTypesScaffoldRequiredDecls.length == 6)
    && (emitProgramScaffoldRequiredDecls.length == 6)
    && (emitGraphScaffoldRequiredDecls.length == 6)
    && (emitComposeScaffoldRequiredDecls.length == 6)
    && (emitPlanScaffoldRequiredDecls.length == 6)
    && (emitApplyScaffoldRequiredDecls.length == 6)
    && (emitBodyScaffoldRequiredDecls.length == 6)
    && (emitErasureScaffoldRequiredDecls.length == 6)
    && (emitExtractScaffoldRequiredDecls.length == 6)
    && (emitBannerScaffoldRequiredDecls.length == 6)
    && (kernelSelfApplyRequiredDecls.length == 6)
    && (kernelSelfApplyTheoremsRequiredDecls.length == 1)
    && (emitMultRequiredDecls.length == 0)
    && (emitPlanRequiredDecls.length == 6)
    && (emitApplyRequiredDecls.length == 6)
    && (emitBodyRequiredDecls.length == 6)
    && (kernelEmitRequiredDecls.length == 8)
    && (kernelEmitTheoremsRequiredDecls.length == 6)
    && (parityMultRequiredDecls.length == 8)
    && (parityMultTheoremsRequiredDecls.length == 5)
    && (parityLinearRequiredDecls.length == 8)
    && (parityLinearTheoremsRequiredDecls.length == 5)
    && (parityTypesRequiredDecls.length == 8)
    && (parityTypesTheoremsRequiredDecls.length == 5)
    && (parityProgramRequiredDecls.length == 8)
    && (parityProgramTheoremsRequiredDecls.length == 5)
    && (parityEmitRequiredDecls.length == 8)
    && (parityEmitTheoremsRequiredDecls.length == 5)
    && (selfApplyRequiredDecls.length == 8)
    && (selfApplyTheoremsRequiredDecls.length == 5)
    && (emitLinearRequiredDecls.length == 0)
    && (emitTypesRequiredDecls.length == 0)
    && (emitProgramRequiredDecls.length == 0)
    && (emitGraphRequiredDecls.length == 0)
    && (emitComposeRequiredDecls.length == 0)
    && (emitErasureRequiredDecls.length == 0)
    && (emitExtractRequiredDecls.length == 0)
    && (emitBannerRequiredDecls.length == 0)
    && (productOutKernelRequiredDecls.length == 6)
    && (productOutKernelTheoremsRequiredDecls.length == 1)
    && (bootstrapHonestyRequiredDecls.length == 6)
    && (bootstrapHonestyTheoremsRequiredDecls.length == 2)
    && (productPathWriterSurfaceRequiredDecls.length == 6)
    && (productPathWriterSurfaceTheoremsRequiredDecls.length == 1)
    && (productPathWriterPathPlanRequiredDecls.length == 6)
    && (productPathWriterPathPlanTheoremsRequiredDecls.length == 1)
    && (productPathWriterPathExecRequiredDecls.length == 6)
    && (productPathWriterPathExecTheoremsRequiredDecls.length == 1)
    && hostModuleCheckTheoremCorpusOk

/-- Without-Lake keeps host Lake bootstrap honesty.
    Greppable: hostModuleCheckWithoutLakeKeepsHostLake,
    HOST-MODULE-CHECK-WITHOUT-LAKE. -/
def hostModuleCheckWithoutLakeKeepsHostLake : Bool :=
  hostModuleCheckWithoutLakeFinished
    && stillUsesLake
    && dependsOnLake
    && hostModuleCheckHostElaboratorResidualRemains
    && !hostModuleCheckHostFreeClaimed

/-- Structural ready for first real host module check surface.
    Greppable: hostModuleCheckReady, HOST-MODULE-CHECK,
    SLAKE_HOST_MODULE_CHECK. -/
def hostModuleCheckReady : Bool :=
  hostModuleCheckFinishedClaimed
    && hostModuleCheckLoadOk
    && hostModuleCheckHostElaboratorResidualRemains
    && !hostModuleCheckHostFreeClaimed
    && stillUsesLake
    && dependsOnLake
    && hostModuleCheckStillUsesLake
    && hostModuleCheckDependsOnLake
    && !hostModuleCheckResidualFreeClaimed
    && !hostModuleCheckProductSelfHostCompleteClaimed
    && !hostModuleCheckProofCompleteClaimed
    && !hostModuleCheckLlvmUnlocked
    && !hostModuleCheckProvablyUnlocked
    && (stageId == "SLAKE_HOST_MODULE_CHECK_V0")
    && (hostId == "HOST-MODULE-CHECK")
    && (surfaceId == "HOST-MODULE-CHECK")
    && (surfaceAlias == "HOST-HOST-MODULE-CHECK")
    && (lakeExeName == "slake-host-module-check")
    && (justRecipe == "host-module-check")
    && (justRecipeWithoutLake == "host-module-check-without-lake")
    && (prebuiltHostModuleCheckRel
      == ".lake/build/bin/slake-host-module-check")
    && (checkDepthPartial == "PARTIAL-STRUCTURAL")

/-- Without-Lake ready (structural + finished + keeps host Lake).
    Greppable: hostModuleCheckWithoutLakeReady,
    HOST-MODULE-CHECK-WITHOUT-LAKE. -/
def hostModuleCheckWithoutLakeReady : Bool :=
  hostModuleCheckReady
    && hostModuleCheckWithoutLakeFinished
    && hostModuleCheckWithoutLakeKeepsHostLake
    && (justRecipeWithoutLake == "host-module-check-without-lake")
    && (prebuiltHostModuleCheckRel
      == ".lake/build/bin/slake-host-module-check")

/-! ### HOST-MODULE-CHECK-THEOREM + HOST-MODULE-CHECK-SMOKE
    Long-file split to SystemsLean.HostModuleCheckTheorems (same namespace).
    Greppable: HostModuleCheckTheorems, hostModuleCheckReady_true. -/

/-! ### Driver (short banners only; AGENTS driver stdout policy) -/

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- Map seed module name to relative path under library dir. -/
def moduleNameToRel (modName : String) : Option String :=
  if hasPrefix modName "SystemsLean." then
    let rest := String.Slice.toString (modName.drop "SystemsLean.".length)
    some (hostModuleCheckLibraryDirRel ++ "/" ++ rest ++ ".lean")
  else
    none

/-- Load and check one real module from disk.
    Greppable: loadAndCheckRealModule. -/
def loadAndCheckRealModule (root : System.FilePath) (modName : String) :
    IO RealModuleSurface := do
  match moduleNameToRel modName with
  | none =>
    IO.eprintln s!"error: {stageId} not package-local module: {modName}"
    throw (IO.userError "not package-local")
  | some rel =>
    let path := root / rel
    unless (<- path.pathExists) do
      IO.eprintln s!"error: {stageId} {reasonMissingFile}: {path}"
      throw (IO.userError reasonMissingFile)
    let content <- IO.FS.readFile path
    match checkRealModule modName content with
    | ModuleCheckResult.reject reason =>
      IO.eprintln s!"error: {stageId} {modName} reject: {reason}"
      throw (IO.userError reason)
    | ModuleCheckResult.accept surf =>
      pure surf

/-- Print accepted surface summary. -/
def printSurface (surf : RealModuleSurface) : IO Unit := do
  let ns :=
    match surf.namespaceName with
    | none => "(none)"
    | some n => n
  let imps :=
    if surf.imports.isEmpty then "(none)"
    else String.intercalate ", " surf.imports
  let decls := String.intercalate ", " surf.keyDecls
  IO.println s!"    {surf.name} ns={ns} imports={imps}"
  IO.println s!"      decls={decls}"

/-- Load Mult seed modules from disk and check each (fail-closed).
    Greppable: loadMultModuleCheck, HOST-MODULE-CHECK. -/
def loadMultModuleCheck (root : System.FilePath) : IO (List RealModuleSurface) := do
  let mut surfs : List RealModuleSurface := []
  for name in hostModuleCheckSeedModules do
    let surf <- loadAndCheckRealModule root name
    surfs := surfs ++ [surf]
  unless surfs.length == hostModuleCheckSeedModules.length do
    IO.eprintln s!"error: {stageId} {reasonSeedMismatch}: count"
    throw (IO.userError reasonSeedMismatch)
  pure surfs

/-- Run measured Mult..Compose+Erasure/Extract host module check.
    Dual evidence: pins + walk.
    Greppable: runModuleCheck, loadMultModuleCheck, HOST-MODULE-CHECK,
    HOST-MODULE-CHECK-WITHOUT-LAKE, Host real module seed expand. -/
def runModuleCheck (root : System.FilePath) : IO Unit := do
  let seedLabel := hostModuleCheckSeedUnitsLabel
  IO.println s!"== {stageId}: real Mult..Compose+Erasure/Extract module check =="
  IO.println s!"  surface={surfaceId} host={hostId} residual={residualName}"
  IO.println s!"  expand={hostModuleCheckExpandSliceName} depth={checkDepthPartial}"
  IO.println s!"  seed={seedLabel}"
  IO.println s!"  structuralReady={hostModuleCheckReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  IO.println s!"  hostResidual={hostModuleCheckHostElaboratorResidualRemains} withoutLake={hostModuleCheckWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostModuleCheckWithoutLakeReady} keepsHostLake={hostModuleCheckWithoutLakeKeepsHostLake}"
  unless hostModuleCheckReady do
    IO.eprintln s!"error: {stageId} hostModuleCheckReady false"
    throw (IO.userError "hostModuleCheckReady false")
  unless hostModuleCheckFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostModuleCheckFinishedClaimed false"
    throw (IO.userError "hostModuleCheckFinishedClaimed false")
  unless hostModuleCheckWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostModuleCheckWithoutLakeFinished false"
    throw (IO.userError "hostModuleCheckWithoutLakeFinished false")
  unless hostModuleCheckWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostModuleCheckWithoutLakeReady false"
    throw (IO.userError "hostModuleCheckWithoutLakeReady false")
  -- Fail-closed structural smoke (no disk).
  unless hostModuleCheckBadMissingInductive.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing inductive"
    throw (IO.userError "bad missing inductive not fail-closed")
  unless hostModuleCheckBadMissingNamespace.isRejectWith reasonMissingNamespace do
    IO.eprintln s!"error: {stageId} expected {reasonMissingNamespace} on bad missing namespace"
    throw (IO.userError "bad missing namespace not fail-closed")
  unless hostModuleCheckBadEmpty.isRejectWith reasonEmptyModule do
    IO.eprintln s!"error: {stageId} expected {reasonEmptyModule} on bad empty"
    throw (IO.userError "bad empty not fail-closed")
  unless hostModuleCheckBadMissingTheorem.isRejectWith reasonMissingDecl do
    IO.eprintln s!"error: {stageId} expected {reasonMissingDecl} on bad missing theorem"
    throw (IO.userError "bad missing theorem not fail-closed")
  unless hostModuleCheckGoodLinear.isAccept do
    IO.eprintln s!"error: {stageId} Linear good fixture must accept"
    throw (IO.userError "Linear good")
  unless hostModuleCheckGoodTypes.isAccept do
    IO.eprintln s!"error: {stageId} Types good fixture must accept"
    throw (IO.userError "Types good")
  unless hostModuleCheckGoodIrProgram.isAccept do
    IO.eprintln s!"error: {stageId} IrProgram good fixture must accept"
    throw (IO.userError "IrProgram good")
  unless hostModuleCheckGoodIrGraph.isAccept do
    IO.eprintln s!"error: {stageId} IrGraph good fixture must accept"
    throw (IO.userError "IrGraph good")
  unless hostModuleCheckGoodHostCompose.isAccept do
    IO.eprintln s!"error: {stageId} HostCompose good fixture must accept"
    throw (IO.userError "HostCompose good")
  unless hostModuleCheckGoodErasure.isAccept do
    IO.eprintln s!"error: {stageId} Erasure good fixture must accept"
    throw (IO.userError "Erasure good")
  unless hostModuleCheckGoodExtract.isAccept do
    IO.eprintln s!"error: {stageId} Extract good fixture must accept"
    throw (IO.userError "Extract good")
  unless hostModuleCheckGoodCompilePath.isAccept do
    IO.eprintln s!"error: {stageId} CompilePath good fixture must accept"
    throw (IO.userError "CompilePath good")
  unless hostModuleCheckGoodKernelMult.isAccept do
    IO.eprintln s!"error: {stageId} KernelMult good fixture must accept"
    throw (IO.userError "KernelMult good")
  unless hostModuleCheckGoodKernelLinear.isAccept do
    IO.eprintln s!"error: {stageId} KernelLinear good fixture must accept"
    throw (IO.userError "KernelLinear good")
  unless hostModuleCheckGoodKernelTypes.isAccept do
    IO.eprintln s!"error: {stageId} KernelTypes good fixture must accept"
    throw (IO.userError "KernelTypes good")
  unless hostModuleCheckGoodKernelProgram.isAccept do
    IO.eprintln s!"error: {stageId} KernelProgram good fixture must accept"
    throw (IO.userError "KernelProgram good")
  unless hostModuleCheckGoodKernelMultTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelMultTheorems good fixture must accept"
    throw (IO.userError "KernelMultTheorems good")
  unless hostModuleCheckGoodKernelLinearTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelLinearTheorems good fixture must accept"
    throw (IO.userError "KernelLinearTheorems good")
  unless hostModuleCheckGoodKernelTypesTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelTypesTheorems good fixture must accept"
    throw (IO.userError "KernelTypesTheorems good")
  unless hostModuleCheckGoodKernelProgramTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelProgramTheorems good fixture must accept"
    throw (IO.userError "KernelProgramTheorems good")
  unless hostModuleCheckGoodJoinMap.isAccept do
    IO.eprintln s!"error: {stageId} JoinMap good fixture must accept"
    throw (IO.userError "JoinMap good")
  unless hostModuleCheckGoodJoinMapTheorems.isAccept do
    IO.eprintln s!"error: {stageId} JoinMapTheorems good fixture must accept"
    throw (IO.userError "JoinMapTheorems good")
  unless hostModuleCheckGoodSelfHost.isAccept do
    IO.eprintln s!"error: {stageId} SelfHost good fixture must accept"
    throw (IO.userError "SelfHost good")
  unless hostModuleCheckGoodSelfHostTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SelfHostTheorems good fixture must accept"
    throw (IO.userError "SelfHostTheorems good")
  unless hostModuleCheckGoodSurfaceMatrix.isAccept do
    IO.eprintln s!"error: {stageId} SurfaceMatrix good fixture must accept"
    throw (IO.userError "SurfaceMatrix good")
  unless hostModuleCheckGoodSurfaceMatrixTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SurfaceMatrixTheorems good fixture must accept"
    throw (IO.userError "SurfaceMatrixTheorems good")
  unless hostModuleCheckGoodEmitMultScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitMultScaffold good fixture must accept"
    throw (IO.userError "EmitMultScaffold good")
  unless hostModuleCheckGoodEmitLinearScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitLinearScaffold good fixture must accept"
    throw (IO.userError "EmitLinearScaffold good")
  unless hostModuleCheckGoodEmitTypesScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitTypesScaffold good fixture must accept"
    throw (IO.userError "EmitTypesScaffold good")
  unless hostModuleCheckGoodEmitProgramScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitProgramScaffold good fixture must accept"
    throw (IO.userError "EmitProgramScaffold good")
  unless hostModuleCheckGoodEmitGraphScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitGraphScaffold good fixture must accept"
    throw (IO.userError "EmitGraphScaffold good")
  unless hostModuleCheckGoodEmitComposeScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitComposeScaffold good fixture must accept"
    throw (IO.userError "EmitComposeScaffold good")
  unless hostModuleCheckGoodEmitPlanScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitPlanScaffold good fixture must accept"
    throw (IO.userError "EmitPlanScaffold good")
  unless hostModuleCheckGoodEmitApplyScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitApplyScaffold good fixture must accept"
    throw (IO.userError "EmitApplyScaffold good")
  unless hostModuleCheckGoodEmitBodyScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitBodyScaffold good fixture must accept"
    throw (IO.userError "EmitBodyScaffold good")
  unless hostModuleCheckGoodEmitErasureScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitErasureScaffold good fixture must accept"
    throw (IO.userError "EmitErasureScaffold good")
  unless hostModuleCheckGoodEmitExtractScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitExtractScaffold good fixture must accept"
    throw (IO.userError "EmitExtractScaffold good")
  unless hostModuleCheckGoodEmitBannerScaffold.isAccept do
    IO.eprintln s!"error: {stageId} EmitBannerScaffold good fixture must accept"
    throw (IO.userError "EmitBannerScaffold good")
  unless hostModuleCheckGoodKernelSelfApply.isAccept do
    IO.eprintln s!"error: {stageId} KernelSelfApply good fixture must accept"
    throw (IO.userError "KernelSelfApply good")
  unless hostModuleCheckGoodKernelSelfApplyTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelSelfApplyTheorems good fixture must accept"
    throw (IO.userError "KernelSelfApplyTheorems good")
  unless hostModuleCheckGoodEmitMult.isAccept do
    IO.eprintln s!"error: {stageId} EmitMult good fixture must accept"
    throw (IO.userError "EmitMult good")
  unless hostModuleCheckGoodEmitPlan.isAccept do
    IO.eprintln s!"error: {stageId} EmitPlan good fixture must accept"
    throw (IO.userError "EmitPlan good")
  unless hostModuleCheckGoodEmitApply.isAccept do
    IO.eprintln s!"error: {stageId} EmitApply good fixture must accept"
    throw (IO.userError "EmitApply good")
  unless hostModuleCheckGoodEmitBody.isAccept do
    IO.eprintln s!"error: {stageId} EmitBody good fixture must accept"
    throw (IO.userError "EmitBody good")
  unless hostModuleCheckGoodKernelEmit.isAccept do
    IO.eprintln s!"error: {stageId} KernelEmit good fixture must accept"
    throw (IO.userError "KernelEmit good")
  unless hostModuleCheckGoodKernelEmitTheorems.isAccept do
    IO.eprintln s!"error: {stageId} KernelEmitTheorems good fixture must accept"
    throw (IO.userError "KernelEmitTheorems good")
  unless hostModuleCheckGoodParityMult.isAccept do
    IO.eprintln s!"error: {stageId} ParityMult good fixture must accept"
    throw (IO.userError "ParityMult good")
  unless hostModuleCheckGoodParityMultTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityMultTheorems good fixture must accept"
    throw (IO.userError "ParityMultTheorems good")
  unless hostModuleCheckGoodParityLinear.isAccept do
    IO.eprintln s!"error: {stageId} ParityLinear good fixture must accept"
    throw (IO.userError "ParityLinear good")
  unless hostModuleCheckGoodParityLinearTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityLinearTheorems good fixture must accept"
    throw (IO.userError "ParityLinearTheorems good")
  unless hostModuleCheckGoodParityTypes.isAccept do
    IO.eprintln s!"error: {stageId} ParityTypes good fixture must accept"
    throw (IO.userError "ParityTypes good")
  unless hostModuleCheckGoodParityTypesTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityTypesTheorems good fixture must accept"
    throw (IO.userError "ParityTypesTheorems good")
  unless hostModuleCheckGoodParityProgram.isAccept do
    IO.eprintln s!"error: {stageId} ParityProgram good fixture must accept"
    throw (IO.userError "ParityProgram good")
  unless hostModuleCheckGoodParityProgramTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityProgramTheorems good fixture must accept"
    throw (IO.userError "ParityProgramTheorems good")
  unless hostModuleCheckGoodParityEmit.isAccept do
    IO.eprintln s!"error: {stageId} ParityEmit good fixture must accept"
    throw (IO.userError "ParityEmit good")
  unless hostModuleCheckGoodParityEmitTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ParityEmitTheorems good fixture must accept"
    throw (IO.userError "ParityEmitTheorems good")
  unless hostModuleCheckGoodSelfApply.isAccept do
    IO.eprintln s!"error: {stageId} SelfApply good fixture must accept"
    throw (IO.userError "SelfApply good")
  unless hostModuleCheckGoodSelfApplyTheorems.isAccept do
    IO.eprintln s!"error: {stageId} SelfApplyTheorems good fixture must accept"
    throw (IO.userError "SelfApplyTheorems good")
  unless hostModuleCheckGoodEmitLinear.isAccept do
    IO.eprintln s!"error: {stageId} EmitLinear good fixture must accept"
    throw (IO.userError "EmitLinear good")
  unless hostModuleCheckGoodEmitTypes.isAccept do
    IO.eprintln s!"error: {stageId} EmitTypes good fixture must accept"
    throw (IO.userError "EmitTypes good")
  unless hostModuleCheckGoodEmitProgram.isAccept do
    IO.eprintln s!"error: {stageId} EmitProgram good fixture must accept"
    throw (IO.userError "EmitProgram good")
  unless hostModuleCheckGoodEmitGraph.isAccept do
    IO.eprintln s!"error: {stageId} EmitGraph good fixture must accept"
    throw (IO.userError "EmitGraph good")
  unless hostModuleCheckGoodEmitCompose.isAccept do
    IO.eprintln s!"error: {stageId} EmitCompose good fixture must accept"
    throw (IO.userError "EmitCompose good")
  unless hostModuleCheckGoodEmitErasure.isAccept do
    IO.eprintln s!"error: {stageId} EmitErasure good fixture must accept"
    throw (IO.userError "EmitErasure good")
  unless hostModuleCheckGoodEmitExtract.isAccept do
    IO.eprintln s!"error: {stageId} EmitExtract good fixture must accept"
    throw (IO.userError "EmitExtract good")
  unless hostModuleCheckGoodEmitBanner.isAccept do
    IO.eprintln s!"error: {stageId} EmitBanner good fixture must accept"
    throw (IO.userError "EmitBanner good")
  unless hostModuleCheckGoodProductOutKernel.isAccept do
    IO.eprintln s!"error: {stageId} ProductOutKernel good fixture must accept"
    throw (IO.userError "ProductOutKernel good")
  unless hostModuleCheckGoodProductOutKernelTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductOutKernelTheorems good fixture must accept"
    throw (IO.userError "ProductOutKernelTheorems good")
  unless hostModuleCheckGoodBootstrapHonesty.isAccept do
    IO.eprintln s!"error: {stageId} BootstrapHonesty good fixture must accept"
    throw (IO.userError "BootstrapHonesty good")
  unless hostModuleCheckGoodBootstrapHonestyTheorems.isAccept do
    IO.eprintln s!"error: {stageId} BootstrapHonestyTheorems good fixture must accept"
    throw (IO.userError "BootstrapHonestyTheorems good")
  unless hostModuleCheckGoodProductPathWriterSurface.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterSurface good fixture must accept"
    throw (IO.userError "ProductPathWriterSurface good")
  unless hostModuleCheckGoodProductPathWriterSurfaceTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterSurfaceTheorems good fixture must accept"
    throw (IO.userError "ProductPathWriterSurfaceTheorems good")
  unless hostModuleCheckGoodProductPathWriterPathPlan.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathPlan good fixture must accept"
    throw (IO.userError "ProductPathWriterPathPlan good")
  unless hostModuleCheckGoodProductPathWriterPathPlanTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathPlanTheorems good fixture must accept"
    throw (IO.userError "ProductPathWriterPathPlanTheorems good")
  unless hostModuleCheckGoodProductPathWriterPathExec.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathExec good fixture must accept"
    throw (IO.userError "ProductPathWriterPathExec good")
  unless hostModuleCheckGoodProductPathWriterPathExecTheorems.isAccept do
    IO.eprintln s!"error: {stageId} ProductPathWriterPathExecTheorems good fixture must accept"
    throw (IO.userError "ProductPathWriterPathExecTheorems good")
  IO.println s!"  failClosed: {reasonMissingDecl} + {reasonMissingNamespace} + {reasonEmptyModule} ok"
  -- On-disk Mult..Compose+Erasure/Extract+CompilePath/Kernel+*Theorems seed walk.
  IO.println "  modules:"
  let surfs <- loadMultModuleCheck root
  for surf in surfs do
    printSurface surf
  unless surfs.length == hostModuleCheckSeedModules.length do
    IO.eprintln s!"error: {stageId} expected {hostModuleCheckSeedModules.length} modules got {surfs.length}"
    throw (IO.userError "seed count")
  IO.println s!"GREEN {stageId}: seed {seedLabel} modules={surfs.length}; expand={hostModuleCheckExpandSliceName}; depth={checkDepthPartial}; withoutLake finished; host residual remains"

/-- CLI: first real host module check. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runModuleCheck root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostModuleCheck
