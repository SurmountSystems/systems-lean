/-
  SYSTEMS_LEAN_HOST partial -- real Mult import graph without Lake on the
  measured step (plan-slake-replaces-lake A4 / design S2 Import graph).
  Side: classic Lean elaborator under src/systems/ (not freestanding C).

  Spec (readable):
  - Seed: Mult..Compose + Erasure/Extract (+Theorems) + CompilePath + Kernel
    Mult/Linear/Types/Program + Kernel *Theorems + JoinMap/SelfHost (+Theorems)
    + SurfaceMatrix (+Theorems) + Emit Mult..Compose scaffolds
    + Emit Plan/Apply/Body scaffolds + Emit Erasure/Extract/Banner scaffolds
    + KernelSelfApply + KernelSelfApplyTheorems
    + EmitMult + EmitPlan + EmitApply + EmitBody
    + KernelEmit + KernelEmitTheorems
    + ParityMult + ParityMultTheorems
    + ParityLinear + ParityLinearTheorems
    + ParityTypes + ParityTypesTheorems
    + ParityProgram + ParityProgramTheorems
    + ParityEmit + ParityEmitTheorems
    + SelfApply + SelfApplyTheorems
    + EmitLinear + EmitTypes + EmitProgram + EmitGraph + EmitCompose
    + EmitErasure + EmitExtract + EmitBanner
    + ProductOutKernel + ProductOutKernelTheorems
    + BootstrapHonesty + BootstrapHonestyTheorems
    + ProductPathWriterSurface + ProductPathWriterSurfaceTheorems
    + ProductPathWriterPathPlan + ProductPathWriterPathPlanTheorems
    + ProductPathWriterPathExec + ProductPathWriterPathExecTheorems;
    modules=81 living set
    (Host library seed expand continue). Not HostGraph dialect goldens.
  - Load each seed .lean; extract package-local import edges; keep seed-local
    via filterSeedImports; resolve fail-closed MISSING-IMPORT / IMPORT-CYCLE.
  - Edges mirror on-disk: leaves Mult/Linear; Erasure<-Mult; Extract<-Mult+Erasure;
    HostCompose<-Mult+Types+IrGraph+Erasure+Extract; CompilePath<-seed units;
    Kernel*<-CompilePath + unit imports; Kernel*Theorems import Kernel parents;
    JoinMap<-Mult+Linear+IrProgram+Erasure+HostCompose+CompilePath;
    SelfHost<-IrProgram+HostCompose+CompilePath+JoinMap;
    SurfaceMatrix<-Mult+Types+IrProgram+Erasure+HostCompose+CompilePath+JoinMap+SelfHost;
    EmitMultScaffold<-Mult; Emit Linear/Types/Program/Graph/Compose scaffolds leaf;
    Emit Plan/Apply/Body scaffolds leaf; Emit Erasure/Extract/Banner scaffolds leaf;
    KernelSelfApply leaf; KernelSelfApplyTheorems<-KernelSelfApply;
    EmitMult<-EmitMultScaffold; EmitPlan<-Mult+Types+HostCompose+EmitPlanScaffold;
    EmitApply<-Mult+Types+HostCompose+EmitApplyScaffold;
    EmitBody<-Mult+Types+HostCompose+EmitPlan+EmitApply+EmitBodyScaffold;
    KernelEmit<-HostCompose+EmitPlan+EmitApply+EmitBody+EmitMult+KernelProgram;
    KernelEmitTheorems<-same + KernelEmit;
    ParityMult<-Mult+KernelMult+EmitMult;
    ParityMultTheorems<-Mult+KernelMult+EmitMult+ParityMult;
    ParityLinear<-KernelLinear+ParityMult;
    ParityLinearTheorems<-KernelLinear+ParityMult+ParityLinear;
    ParityTypes<-KernelTypes+ParityLinear;
    ParityTypesTheorems<-KernelTypes+ParityLinear+ParityTypes;
    ParityProgram<-KernelProgram+ParityTypes;
    ParityProgramTheorems<-KernelProgram+ParityTypes+ParityProgram;
    ParityEmit<-KernelEmit+ParityProgram+EmitMult;
    ParityEmitTheorems<-KernelEmit+ParityProgram+EmitMult+ParityEmit;
    SelfApply<-ParityMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit;
    SelfApplyTheorems<-ParityMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit+SelfApply;
    EmitLinear<-EmitLinearScaffold; EmitTypes<-EmitTypesScaffold;
    EmitProgram<-EmitProgramScaffold; EmitGraph<-EmitGraphScaffold;
    EmitCompose<-EmitComposeScaffold; EmitErasure<-EmitErasureScaffold;
    EmitExtract<-EmitExtractScaffold; EmitBanner<-EmitBannerScaffold;
    ProductOutKernel leaf; ProductOutKernelTheorems<-ProductOutKernel;
    BootstrapHonesty leaf; BootstrapHonestyTheorems<-BootstrapHonesty;
    ProductPathWriterSurface leaf; ProductPathWriterSurfaceTheorems<-ProductPathWriterSurface;
    ProductPathWriterPathPlan leaf; ProductPathWriterPathPlanTheorems<-ProductPathWriterPathPlan;
    ProductPathWriterPathExec leaf; ProductPathWriterPathExecTheorems<-ProductPathWriterPathExec.
  - Lake-built bin OK; without-Lake: host-import-graph-without-lake prebuilt.

  Out of scope: full ~271-module graph; full elaborator typecheck; host free;
  mathlib; PROVABLY/llvm forge; product free/complete flips. Next: library bands.

  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, SLAKE_HOST_IMPORT_GRAPH,
  SLAKE_HOST_IMPORT_GRAPH_V0, HOST-HOST-IMPORT-GRAPH, hostImportGraphReady,
  hostImportGraphFinishedClaimed, hostImportGraphLoadOk,
  hostImportGraphHostElaboratorResidualRemains,
  hostImportGraphWithoutLakeFinished, hostImportGraphWithoutLakeReady,
  hostImportGraphWithoutLakeKeepsHostLake, justRecipeWithoutLake,
  prebuiltHostImportGraphRel, host-import-graph-without-lake,
  HOST-IMPORT-GRAPH-WITHOUT-LAKE, HOST-IMPORT-GRAPH-SMOKE,
  HOST-IMPORT-GRAPH-THEOREM, hostImportGraphReady_true,
  slake-host-import-graph, just host-import-graph, loadMultImportGraph,
  runImportGraph, resolveImportGraph, extractImports, filterSeedImports,
  RealMod, hostImportGraphSeedModules, hostImportGraphSeedRelPaths,
  hostImportGraphGoodMultSeed, hostImportGraphGoodExpandSeed,
  hostImportGraphBadMissing, hostImportGraphBadCycle,
  hostImportGraphExpandSliceName, Host library seed expand continue,
  Host real module seed expand, Host theorem check expand,
  Host compose module expand, Host graph module expand, Host program module expand,
  Host module set expand,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems,
  Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems,
  MISSING-IMPORT, IMPORT-CYCLE, Real Mult import graph,
  full-host-elaborator-design-2026-08-03, UNIT_SURFACE host surface,
  MULT-0, MULT-1, MULT-OMEGA.
  Module: SystemsLean.HostImportGraph
  Dual evidence: structural seed pins + on-disk walk + without-Lake greps.
  Red/green: host-import-graph-without-lake; lake build once for prebuilt.
  Design: doc/dev/research/full-host-elaborator-design-2026-08-03.md (S2 / A4).
  Module must stay ASCII. Not freestanding residual free. Not freestanding emit residual free. Not PROVABLY.
  Host elaborator residual remains (Lake host develop bootstrap remains).
-/

namespace SystemsLean.HostImportGraph

/-! ### HOST-IMPORT-GRAPH / SLAKE_HOST_IMPORT_GRAPH
    Real Mult seed import graph (Lake job L2 / design stage S2). -/

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_IMPORT_GRAPH_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-IMPORT-GRAPH"

/-- Short surface name. -/
def surfaceId : String := "HOST-IMPORT-GRAPH"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-IMPORT-GRAPH"

/-- Lake exe name. -/
def lakeExeName : String := "slake-host-import-graph"

/-- just recipe name (Lake bootstrap path). -/
def justRecipe : String := "host-import-graph"

/-- just recipe for without-Lake measured real Mult import graph (prebuilt).
    Greppable: justRecipeWithoutLake, host-import-graph-without-lake,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE. -/
def justRecipeWithoutLake : String := "host-import-graph-without-lake"

/-- Relative path of prebuilt binary under src/systems
    (bootstrap once: lake build slake-host-import-graph).
    Greppable: prebuiltHostImportGraphRel, slake-host-import-graph. -/
def prebuiltHostImportGraphRel : String :=
  ".lake/build/bin/slake-host-import-graph"

/-- Design note path cite (not a filesystem read).
    Greppable: designNotePath, full-host-elaborator-design-2026-08-03. -/
def designNotePath : String :=
  "doc/dev/research/full-host-elaborator-design-2026-08-03.md"

/-- Residual Name this surface implements (plain English).
    Greppable: residualName, Real Mult import graph. -/
def residualName : String := "Real Mult import graph"

/-! ### Seed set (real SystemsLean Mult..Compose + Erasure/Extract + CompilePath/Kernel
    + Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds; not dialect goldens)

  A4 started Mult+MultTheorems. A6 Host module set expand grew Mult..Compose.
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
  EmitGraph + EmitCompose product shells (Mult..Compose remaining emit products).
  Same living Name continues (A29) with EmitErasure + EmitExtract + EmitBanner
  product shells (remaining emit product shells after Mult..Compose).
  Same living Name continues (A30) with ProductOutKernel + ProductOutKernelTheorems
  + BootstrapHonesty + BootstrapHonestyTheorems (SelfApplyFs leaf foundation;
  ProductOutKernel/BootstrapHonesty are direct SelfApplyFs imports with no package
  imports; theorems companions import parents only).
  Same living Name continues (A31) with ProductPathWriterSurface +
  ProductPathWriterSurfaceTheorems + ProductPathWriterPathPlan +
  ProductPathWriterPathPlanTheorems + ProductPathWriterPathExec +
  ProductPathWriterPathExecTheorems (SelfApplyFs ProductPath writer pure leaves
  B5-B7; no package imports; theorems companions import parents only).
-/

/-- Seed module names (Lean dotted). Mult..Compose + Erasure/Extract + CompilePath/Kernel
    + Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body scaffolds
    + Emit Erasure/Extract/Banner scaffolds + KernelSelfApply + KernelSelfApplyTheorems
    + Emit product Mult/Plan/Apply/Body + KernelEmit + KernelEmitTheorems
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
    Greppable: hostImportGraphSeedModules,
    Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems. -/
def hostImportGraphSeedModules : List String :=
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
    Greppable: hostImportGraphSeedRelPaths. -/
def hostImportGraphSeedRelPaths : List String :=
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
/-- Expand slice Name (living). Greppable: hostImportGraphExpandSliceName,
    Host library seed expand continue. Prior: Host real module seed expand. -/
def hostImportGraphExpandSliceName : String := "Host library seed expand continue"

/-- Compact seed-unit inventory string (HostResidualShrink dual cite).
    Greppable: hostImportGraphSeedUnitsLabel,
    Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems. -/
def hostImportGraphSeedUnitsLabel : String :=
  "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems"

/-- Library dir relative to repo root (path join for seed files). -/
def hostImportGraphLibraryDirRel : String := "src/systems/SystemsLean"

/-- Host elaborator residual still remains (full elaborate still Lake).
    Greppable: hostImportGraphHostElaboratorResidualRemains. -/
def hostImportGraphHostElaboratorResidualRemains : Bool := true

/-- Local honesty: host develop surface still uses Lake bootstrap for this bin.
    Without-Lake measured step does not retire host develop Lake bootstrap. -/
def stillUsesLake : Bool := true
def dependsOnLake : Bool := true
def hostImportGraphStillUsesLake : Bool := stillUsesLake
def hostImportGraphDependsOnLake : Bool := dependsOnLake

/-- Local honesty: does not claim product residual free flip. -/
def hostImportGraphResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def hostImportGraphProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: does not claim proof complete. -/
def hostImportGraphProofCompleteClaimed : Bool := false

/-- Local honesty: does not unlock llvm. -/
def hostImportGraphLlvmUnlocked : Bool := false

/-- Local honesty: does not unlock PROVABLY. -/
def hostImportGraphProvablyUnlocked : Bool := false

/-- Local honesty: does not claim host free. -/
def hostImportGraphHostFreeClaimed : Bool := false

/-- Local finished pin (real Mult import graph surface closed).
    Greppable: hostImportGraphFinishedClaimed. -/
def hostImportGraphFinishedClaimed : Bool := true

/-- Without-Lake measured step finished pin.
    Greppable: hostImportGraphWithoutLakeFinished,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE. -/
def hostImportGraphWithoutLakeFinished : Bool := true

/-! ### Reject reasons (greppable fail-closed tokens) -/

def reasonMissingImport : String := "MISSING-IMPORT"
def reasonImportCycle : String := "IMPORT-CYCLE"
def reasonEmptyGraph : String := "EMPTY-GRAPH"
def reasonDupModule : String := "DUP-MODULE"
def reasonMissingFile : String := "MISSING-FILE"
def reasonSeedMismatch : String := "SEED-MISMATCH"

/-- One real host module node (name + package-local imports).
    Greppable: RealMod. -/
structure RealMod where
  name : String
  imports : List String
  deriving Repr, DecidableEq

/-- Graph check result: accept ordered modules, or reject with reason. -/
inductive ImportGraphResult where
  | accept (order : List RealMod)
  | reject (reason : String)
  deriving Repr

/-- True when accept. -/
def ImportGraphResult.isAccept : ImportGraphResult -> Bool
  | ImportGraphResult.accept _ => true
  | ImportGraphResult.reject _ => false

/-- True when reject with exact reason. -/
def ImportGraphResult.isRejectWith (r : ImportGraphResult) (reason : String) :
    Bool :=
  match r with
  | ImportGraphResult.reject r' => r' == reason
  | ImportGraphResult.accept _ => false

/-- Accepted module count when accept; 0 on reject. -/
def ImportGraphResult.acceptCount : ImportGraphResult -> Nat
  | ImportGraphResult.accept xs => xs.length
  | ImportGraphResult.reject _ => 0

/-! ### Import extraction (real .lean line scan; package-local only) -/

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

/-- Strip line comment from first `--` not inside this simple scanner. -/
def stripLineComment (s : String) : String :=
  match s.splitOn "--" with
  | [] => s
  | h :: _ => h

/-- True when token is a package-local SystemsLean import target. -/
def isPackageLocalImport (name : String) : Bool :=
  hasPrefix name "SystemsLean."

/-- Parse one line for `import SystemsLean.X` (optional leading ws).
    Returns package-local module name only. Greppable: parseImportLine. -/
def parseImportLine (line : String) : Option String :=
  let t := trim (stripLineComment line)
  if !(hasPrefix t "import ") then none
  else
    let rest := trim (String.Slice.toString (t.drop "import ".length))
    -- Take first token (module name); stop at space or end.
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
        -- End block when line contains "-/" (simple; enough for seed files).
        if (line.splitOn "-/").length > 1 then
          go false acc rest
        else
          go true acc rest
      else
        let t := trim line
        if hasPrefix t "/-" then
          -- Same-line open+close or open only.
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

/-- Keep only package-local imports that are also seed members.
    After Host real module seed expand, Erasure/Extract are seed members so
    HostCompose seed-local edges include Erasure + Extract (and
    HostComposeTheorems includes Erasure / ErasureTheorems / Extract).
    Greppable: filterSeedImports. -/
def filterSeedImports (seed : List String) (imps : List String) : List String :=
  imps.filter (fun i => seed.any (fun s => s == i))

/-! ### Graph resolve (fail-closed MISSING-IMPORT / IMPORT-CYCLE) -/

/-- Find module by exact name. -/
def findByName (mods : List RealMod) (name : String) : Option RealMod :=
  let rec go : List RealMod -> Option RealMod
    | [] => none
    | m :: rest => if m.name == name then some m else go rest
  go mods

/-- True when name appears in list. -/
def nameIn (names : List String) (name : String) : Bool :=
  names.any (fun n => n == name)

/-- True when every package-local import of every module is present. -/
def importsPresent (mods : List RealMod) : Bool :=
  mods.all fun m =>
    m.imports.all fun imp => (findByName mods imp).isSome

/-- True when module names are unique. -/
def namesUnique (mods : List RealMod) : Bool :=
  let rec go (seen : List String) : List RealMod -> Bool
    | [] => true
    | m :: rest =>
      if nameIn seen m.name then false
      else go (m.name :: seen) rest
  go [] mods

/-- Indegree = number of package-local imports (importer depends on importee). -/
def indegrees (mods : List RealMod) : List Nat :=
  mods.map fun m => m.imports.length

/-- When module `done` finishes, decrement indegree of modules that import it. -/
def decIndegrees (mods : List RealMod) (degs : List Nat) (done : String) :
    List Nat :=
  let rec go (ms : List RealMod) (ds : List Nat) : List Nat :=
    match ms, ds with
    | [], _ => []
    | _, [] => []
    | m :: mrest, d :: drest =>
      let d' :=
        if m.imports.any (fun n => n == done) then
          if d == 0 then 0 else d - 1
        else
          d
      d' :: go mrest drest
  go mods degs

/-- First module with indegree 0 not yet done. -/
def pickReady (mods : List RealMod) (degs : List Nat) (done : List String) :
    Option String :=
  let rec go (ms : List RealMod) (ds : List Nat) : Option String :=
    match ms, ds with
    | [], _ => none
    | _, [] => none
    | m :: mrest, d :: drest =>
      if d == 0 && !(nameIn done m.name) then some m.name
      else go mrest drest
  go mods degs

/-- Kahn topo sort with fuel. -/
def topoOrderN (fuel : Nat) (mods : List RealMod) (degs : List Nat)
    (done : List String) (order : List RealMod) : Option (List RealMod) :=
  match fuel with
  | 0 => none
  | Nat.succ f =>
    if done.length == mods.length then some order.reverse
    else
      match pickReady mods degs done with
      | none => none
      | some name =>
        match findByName mods name with
        | none => none
        | some m =>
          let degs' := decIndegrees mods degs name
          topoOrderN f mods degs' (name :: done) (m :: order)

/-- Resolve real-module list: unique names, imports present, topo no cycle.
    Greppable: resolveImportGraph, MISSING-IMPORT, IMPORT-CYCLE. -/
def resolveImportGraph (mods : List RealMod) : ImportGraphResult :=
  if mods.isEmpty then
    ImportGraphResult.reject reasonEmptyGraph
  else if !namesUnique mods then
    ImportGraphResult.reject reasonDupModule
  else if !importsPresent mods then
    ImportGraphResult.reject reasonMissingImport
  else
    match topoOrderN (mods.length + 1) mods (indegrees mods) [] [] with
    | none => ImportGraphResult.reject reasonImportCycle
    | some order =>
      if order.length == mods.length then
        ImportGraphResult.accept order
      else
        ImportGraphResult.reject reasonImportCycle

/-! ### Dual-pinned Mult+Linear+Types+Program+Graph+Compose seed graph
    (structural; seed-local edges mirror on-disk after filterSeedImports) -/

/-- Mult leaf (no package-local imports). Greppable: multLeafMod. -/
def multLeafMod : RealMod :=
  { name := "SystemsLean.Mult", imports := [] }

/-- MultTheorems companion (imports Mult). Greppable: multTheoremsMod. -/
def multTheoremsMod : RealMod :=
  { name := "SystemsLean.MultTheorems", imports := ["SystemsLean.Mult"] }

/-- Linear leaf (no package-local imports). Greppable: linearLeafMod. -/
def linearLeafMod : RealMod :=
  { name := "SystemsLean.Linear", imports := [] }

/-- LinearTheorems companion (imports Linear). Greppable: linearTheoremsMod. -/
def linearTheoremsMod : RealMod :=
  { name := "SystemsLean.LinearTheorems", imports := ["SystemsLean.Linear"] }

/-- Types module (imports Mult). Greppable: typesMod. -/
def typesMod : RealMod :=
  { name := "SystemsLean.Types", imports := ["SystemsLean.Mult"] }

/-- TypesTheorems companion (imports Mult + MultTheorems + Types).
    Greppable: typesTheoremsMod. -/
def typesTheoremsMod : RealMod :=
  { name := "SystemsLean.TypesTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.MultTheorems", "SystemsLean.Types"] }

/-- IrProgram (Program unit; imports Types). Greppable: irProgramMod. -/
def irProgramMod : RealMod :=
  { name := "SystemsLean.IrProgram", imports := ["SystemsLean.Types"] }

/-- IrProgramTheorems companion (imports Mult + Types + IrProgram).
    Greppable: irProgramTheoremsMod. -/
def irProgramTheoremsMod : RealMod :=
  { name := "SystemsLean.IrProgramTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"] }

/-- IrGraph (Graph unit; imports Mult + Types + IrProgram). Greppable: irGraphMod. -/
def irGraphMod : RealMod :=
  { name := "SystemsLean.IrGraph"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"] }

/-- IrGraphTheorems companion (imports Mult + Types + IrProgram + IrGraph).
    Greppable: irGraphTheoremsMod. -/
def irGraphTheoremsMod : RealMod :=
  { name := "SystemsLean.IrGraphTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.IrGraph"] }

/-- Erasure (imports Mult). Greppable: erasureMod. -/
def erasureMod : RealMod :=
  { name := "SystemsLean.Erasure", imports := ["SystemsLean.Mult"] }

/-- ErasureTheorems companion (imports Mult + Erasure).
    Greppable: erasureTheoremsMod. -/
def erasureTheoremsMod : RealMod :=
  { name := "SystemsLean.ErasureTheorems"
    imports := ["SystemsLean.Mult", "SystemsLean.Erasure"] }

/-- Extract (imports Mult + Erasure). Greppable: extractMod. -/
def extractMod : RealMod :=
  { name := "SystemsLean.Extract"
    imports := ["SystemsLean.Mult", "SystemsLean.Erasure"] }

/-- ExtractTheorems companion (imports Mult + Erasure + Extract).
    Greppable: extractTheoremsMod. -/
def extractTheoremsMod : RealMod :=
  { name := "SystemsLean.ExtractTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Erasure", "SystemsLean.Extract"] }

/-- HostCompose (Compose unit; seed-local Mult + Types + IrGraph + Erasure +
    Extract after real module seed expand). Greppable: hostComposeMod. -/
def hostComposeMod : RealMod :=
  { name := "SystemsLean.HostCompose"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrGraph",
       "SystemsLean.Erasure", "SystemsLean.Extract"] }

/-- HostComposeTheorems companion (seed-local Mult + Types + IrGraph +
    IrGraphTheorems + Erasure + ErasureTheorems + Extract + HostCompose).
    Greppable: hostComposeTheoremsMod. -/
def hostComposeTheoremsMod : RealMod :=
  { name := "SystemsLean.HostComposeTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrGraph",
       "SystemsLean.IrGraphTheorems", "SystemsLean.Erasure",
       "SystemsLean.ErasureTheorems", "SystemsLean.Extract",
       "SystemsLean.HostCompose"] }

/-- CompilePath (imports Mult + Types + IrProgram + IrGraph + Erasure +
    HostCompose + Extract). Greppable: compilePathMod. -/
def compilePathMod : RealMod :=
  { name := "SystemsLean.CompilePath"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.IrGraph", "SystemsLean.Erasure", "SystemsLean.HostCompose",
       "SystemsLean.Extract"] }

/-- KernelMult (imports Mult + Types + IrProgram + CompilePath).
    Greppable: kernelMultMod. -/
def kernelMultMod : RealMod :=
  { name := "SystemsLean.KernelMult"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.CompilePath"] }

/-- KernelLinear (imports Mult + Types + IrProgram + HostCompose + CompilePath).
    Greppable: kernelLinearMod. -/
def kernelLinearMod : RealMod :=
  { name := "SystemsLean.KernelLinear"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.HostCompose", "SystemsLean.CompilePath"] }

/-- KernelTypes (imports Mult + Types + IrProgram + CompilePath).
    Greppable: kernelTypesMod. -/
def kernelTypesMod : RealMod :=
  { name := "SystemsLean.KernelTypes"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.CompilePath"] }

/-- KernelProgram (imports Mult + Types + IrProgram + IrGraph + HostCompose +
    CompilePath). Greppable: kernelProgramMod. -/
def kernelProgramMod : RealMod :=
  { name := "SystemsLean.KernelProgram"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.IrGraph", "SystemsLean.HostCompose",
       "SystemsLean.CompilePath"] }

/-- KernelMultTheorems companion (seed-local Mult + Types + IrProgram +
    CompilePath + KernelMult). Greppable: kernelMultTheoremsMod. -/
def kernelMultTheoremsMod : RealMod :=
  { name := "SystemsLean.KernelMultTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.CompilePath", "SystemsLean.KernelMult"] }

/-- KernelLinearTheorems companion (seed-local Mult + Types + IrProgram +
    HostCompose + CompilePath + KernelLinear).
    Greppable: kernelLinearTheoremsMod. -/
def kernelLinearTheoremsMod : RealMod :=
  { name := "SystemsLean.KernelLinearTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.HostCompose", "SystemsLean.CompilePath",
       "SystemsLean.KernelLinear"] }

/-- KernelTypesTheorems companion (seed-local Mult + Types + IrProgram +
    CompilePath + KernelTypes). Greppable: kernelTypesTheoremsMod. -/
def kernelTypesTheoremsMod : RealMod :=
  { name := "SystemsLean.KernelTypesTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.CompilePath", "SystemsLean.KernelTypes"] }

/-- KernelProgramTheorems companion (seed-local Mult + Types + IrProgram +
    IrGraph + HostCompose + CompilePath + KernelProgram).
    Greppable: kernelProgramTheoremsMod. -/
def kernelProgramTheoremsMod : RealMod :=
  { name := "SystemsLean.KernelProgramTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.IrGraph", "SystemsLean.HostCompose",
       "SystemsLean.CompilePath", "SystemsLean.KernelProgram"] }

/-- JoinMap (imports Mult + Linear + IrProgram + Erasure + HostCompose +
    CompilePath). Greppable: joinMapMod. -/
def joinMapMod : RealMod :=
  { name := "SystemsLean.JoinMap"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Linear", "SystemsLean.IrProgram",
       "SystemsLean.Erasure", "SystemsLean.HostCompose",
       "SystemsLean.CompilePath"] }

/-- JoinMapTheorems companion (seed-local Mult + Linear + Types + IrProgram +
    Erasure + HostCompose + CompilePath + JoinMap).
    Greppable: joinMapTheoremsMod. -/
def joinMapTheoremsMod : RealMod :=
  { name := "SystemsLean.JoinMapTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Linear", "SystemsLean.Types",
       "SystemsLean.IrProgram", "SystemsLean.Erasure", "SystemsLean.HostCompose",
       "SystemsLean.CompilePath", "SystemsLean.JoinMap"] }

/-- SelfHost (imports IrProgram + HostCompose + CompilePath + JoinMap).
    Greppable: selfHostMod. -/
def selfHostMod : RealMod :=
  { name := "SystemsLean.SelfHost"
    imports :=
      ["SystemsLean.IrProgram", "SystemsLean.HostCompose",
       "SystemsLean.CompilePath", "SystemsLean.JoinMap"] }

/-- SelfHostTheorems companion (seed-local Mult + Types + IrProgram + Erasure +
    HostCompose + JoinMap + SelfHost). Greppable: selfHostTheoremsMod. -/
def selfHostTheoremsMod : RealMod :=
  { name := "SystemsLean.SelfHostTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.JoinMap",
       "SystemsLean.SelfHost"] }

/-- SurfaceMatrix (imports Mult + Types + IrProgram + Erasure + HostCompose +
    CompilePath + JoinMap + SelfHost). Greppable: surfaceMatrixMod. -/
def surfaceMatrixMod : RealMod :=
  { name := "SystemsLean.SurfaceMatrix"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.CompilePath",
       "SystemsLean.JoinMap", "SystemsLean.SelfHost"] }

/-- SurfaceMatrixTheorems companion (seed-local Mult + Types + IrProgram +
    Erasure + HostCompose + CompilePath + JoinMap + SelfHost + SurfaceMatrix).
    Greppable: surfaceMatrixTheoremsMod. -/
def surfaceMatrixTheoremsMod : RealMod :=
  { name := "SystemsLean.SurfaceMatrixTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
       "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.CompilePath",
       "SystemsLean.JoinMap", "SystemsLean.SelfHost", "SystemsLean.SurfaceMatrix"] }

/-- EmitMultScaffold (imports Mult only). Greppable: emitMultScaffoldMod. -/
def emitMultScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitMultScaffold"
    imports := ["SystemsLean.Mult"] }

/-- EmitLinearScaffold leaf (no package-local import).
    Greppable: emitLinearScaffoldMod. -/
def emitLinearScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitLinearScaffold", imports := [] }

/-- EmitTypesScaffold leaf. Greppable: emitTypesScaffoldMod. -/
def emitTypesScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitTypesScaffold", imports := [] }

/-- EmitProgramScaffold leaf. Greppable: emitProgramScaffoldMod. -/
def emitProgramScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitProgramScaffold", imports := [] }

/-- EmitGraphScaffold leaf. Greppable: emitGraphScaffoldMod. -/
def emitGraphScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitGraphScaffold", imports := [] }

/-- EmitComposeScaffold leaf. Greppable: emitComposeScaffoldMod. -/
def emitComposeScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitComposeScaffold", imports := [] }

/-- EmitPlanScaffold leaf. Greppable: emitPlanScaffoldMod. -/
def emitPlanScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitPlanScaffold", imports := [] }

/-- EmitApplyScaffold leaf. Greppable: emitApplyScaffoldMod. -/
def emitApplyScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitApplyScaffold", imports := [] }

/-- EmitBodyScaffold leaf. Greppable: emitBodyScaffoldMod. -/
def emitBodyScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitBodyScaffold", imports := [] }

/-- EmitErasureScaffold leaf. Greppable: emitErasureScaffoldMod. -/
def emitErasureScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitErasureScaffold", imports := [] }

/-- EmitExtractScaffold leaf. Greppable: emitExtractScaffoldMod. -/
def emitExtractScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitExtractScaffold", imports := [] }

/-- EmitBannerScaffold leaf. Greppable: emitBannerScaffoldMod. -/
def emitBannerScaffoldMod : RealMod :=
  { name := "SystemsLean.EmitBannerScaffold", imports := [] }

/-- KernelSelfApply leaf (no package-local import).
    Greppable: kernelSelfApplyMod. -/
def kernelSelfApplyMod : RealMod :=
  { name := "SystemsLean.KernelSelfApply", imports := [] }

/-- KernelSelfApplyTheorems companion (seed-local KernelSelfApply).
    Greppable: kernelSelfApplyTheoremsMod. -/
def kernelSelfApplyTheoremsMod : RealMod :=
  { name := "SystemsLean.KernelSelfApplyTheorems"
    imports := ["SystemsLean.KernelSelfApply"] }

/-- EmitMult product shell (imports EmitMultScaffold only).
    Greppable: emitMultMod. -/
def emitMultMod : RealMod :=
  { name := "SystemsLean.EmitMult"
    imports := ["SystemsLean.EmitMultScaffold"] }

/-- EmitPlan product (Mult + Types + HostCompose + EmitPlanScaffold).
    Greppable: emitPlanMod. -/
def emitPlanMod : RealMod :=
  { name := "SystemsLean.EmitPlan"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
       "SystemsLean.EmitPlanScaffold"] }

/-- EmitApply product (Mult + Types + HostCompose + EmitApplyScaffold).
    Greppable: emitApplyMod. -/
def emitApplyMod : RealMod :=
  { name := "SystemsLean.EmitApply"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
       "SystemsLean.EmitApplyScaffold"] }

/-- EmitBody product (Mult + Types + HostCompose + EmitPlan + EmitApply +
    EmitBodyScaffold). Greppable: emitBodyMod. -/
def emitBodyMod : RealMod :=
  { name := "SystemsLean.EmitBody"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
       "SystemsLean.EmitPlan", "SystemsLean.EmitApply",
       "SystemsLean.EmitBodyScaffold"] }

/-- KernelEmit product (HostCompose + EmitPlan + EmitApply + EmitBody +
    EmitMult + KernelProgram). Greppable: kernelEmitMod. -/
def kernelEmitMod : RealMod :=
  { name := "SystemsLean.KernelEmit"
    imports :=
      ["SystemsLean.HostCompose", "SystemsLean.EmitPlan",
       "SystemsLean.EmitApply", "SystemsLean.EmitBody", "SystemsLean.EmitMult",
       "SystemsLean.KernelProgram"] }

/-- KernelEmitTheorems companion (seed-local KernelEmit + emit path deps).
    Greppable: kernelEmitTheoremsMod. -/
def kernelEmitTheoremsMod : RealMod :=
  { name := "SystemsLean.KernelEmitTheorems"
    imports :=
      ["SystemsLean.HostCompose", "SystemsLean.EmitPlan",
       "SystemsLean.EmitApply", "SystemsLean.EmitBody", "SystemsLean.EmitMult",
       "SystemsLean.KernelProgram", "SystemsLean.KernelEmit"] }

/-- ParityMult closed-loop (Mult + KernelMult + EmitMult).
    Greppable: parityMultMod. -/
def parityMultMod : RealMod :=
  { name := "SystemsLean.ParityMult"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.KernelMult", "SystemsLean.EmitMult"] }

/-- ParityMultTheorems companion (same deps + ParityMult; namespace ParityMult).
    Greppable: parityMultTheoremsMod. -/
def parityMultTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityMultTheorems"
    imports :=
      ["SystemsLean.Mult", "SystemsLean.KernelMult", "SystemsLean.EmitMult",
       "SystemsLean.ParityMult"] }

/-- ParityLinear freestanding path (KernelLinear + ParityMult).
    Greppable: parityLinearMod. -/
def parityLinearMod : RealMod :=
  { name := "SystemsLean.ParityLinear"
    imports :=
      ["SystemsLean.KernelLinear", "SystemsLean.ParityMult"] }

/-- ParityLinearTheorems companion (same deps + ParityLinear; namespace ParityLinear).
    Greppable: parityLinearTheoremsMod. -/
def parityLinearTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityLinearTheorems"
    imports :=
      ["SystemsLean.KernelLinear", "SystemsLean.ParityMult",
       "SystemsLean.ParityLinear"] }

/-- ParityTypes freestanding path (KernelTypes + ParityLinear).
    Greppable: parityTypesMod. -/
def parityTypesMod : RealMod :=
  { name := "SystemsLean.ParityTypes"
    imports :=
      ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear"] }

/-- ParityTypesTheorems companion (same deps + ParityTypes; namespace ParityTypes).
    Greppable: parityTypesTheoremsMod. -/
def parityTypesTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityTypesTheorems"
    imports :=
      ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear",
       "SystemsLean.ParityTypes"] }

/-- ParityProgram freestanding path (KernelProgram + ParityTypes).
    Greppable: parityProgramMod. -/
def parityProgramMod : RealMod :=
  { name := "SystemsLean.ParityProgram"
    imports :=
      ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes"] }

/-- ParityProgramTheorems companion (same deps + ParityProgram; namespace ParityProgram).
    Greppable: parityProgramTheoremsMod. -/
def parityProgramTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityProgramTheorems"
    imports :=
      ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes",
       "SystemsLean.ParityProgram"] }

/-- ParityEmit freestanding path (KernelEmit + ParityProgram + EmitMult).
    Greppable: parityEmitMod. -/
def parityEmitMod : RealMod :=
  { name := "SystemsLean.ParityEmit"
    imports :=
      ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
       "SystemsLean.EmitMult"] }

/-- ParityEmitTheorems companion (same deps + ParityEmit; namespace ParityEmit).
    Greppable: parityEmitTheoremsMod. -/
def parityEmitTheoremsMod : RealMod :=
  { name := "SystemsLean.ParityEmitTheorems"
    imports :=
      ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
       "SystemsLean.EmitMult", "SystemsLean.ParityEmit"] }

/-- SelfApply host structural SH5 path (ParityMult + KernelLinear + KernelTypes +
    KernelProgram + KernelEmit). Not freestanding product (that is SelfApplyFs).
    Greppable: selfApplyMod. -/
def selfApplyMod : RealMod :=
  { name := "SystemsLean.SelfApply"
    imports :=
      ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
       "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
       "SystemsLean.KernelEmit"] }

/-- SelfApplyTheorems companion (same deps + SelfApply; namespace SelfApply).
    Greppable: selfApplyTheoremsMod. -/
def selfApplyTheoremsMod : RealMod :=
  { name := "SystemsLean.SelfApplyTheorems"
    imports :=
      ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
       "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
       "SystemsLean.KernelEmit", "SystemsLean.SelfApply"] }

/-- EmitLinear product shell (imports EmitLinearScaffold only).
    Greppable: emitLinearMod. -/
def emitLinearMod : RealMod :=
  { name := "SystemsLean.EmitLinear"
    imports := ["SystemsLean.EmitLinearScaffold"] }

/-- EmitTypes product shell (imports EmitTypesScaffold only).
    Greppable: emitTypesMod. -/
def emitTypesMod : RealMod :=
  { name := "SystemsLean.EmitTypes"
    imports := ["SystemsLean.EmitTypesScaffold"] }

/-- EmitProgram product shell (imports EmitProgramScaffold only).
    Greppable: emitProgramMod. -/
def emitProgramMod : RealMod :=
  { name := "SystemsLean.EmitProgram"
    imports := ["SystemsLean.EmitProgramScaffold"] }

/-- EmitGraph product shell (imports EmitGraphScaffold only).
    Greppable: emitGraphMod. -/
def emitGraphMod : RealMod :=
  { name := "SystemsLean.EmitGraph"
    imports := ["SystemsLean.EmitGraphScaffold"] }

/-- EmitCompose product shell (imports EmitComposeScaffold only).
    Greppable: emitComposeMod. -/
def emitComposeMod : RealMod :=
  { name := "SystemsLean.EmitCompose"
    imports := ["SystemsLean.EmitComposeScaffold"] }

/-- EmitErasure product shell (imports EmitErasureScaffold only).
    Greppable: emitErasureMod. -/
def emitErasureMod : RealMod :=
  { name := "SystemsLean.EmitErasure"
    imports := ["SystemsLean.EmitErasureScaffold"] }

/-- EmitExtract product shell (imports EmitExtractScaffold only).
    Greppable: emitExtractMod. -/
def emitExtractMod : RealMod :=
  { name := "SystemsLean.EmitExtract"
    imports := ["SystemsLean.EmitExtractScaffold"] }

/-- EmitBanner product shell (imports EmitBannerScaffold only).
    Greppable: emitBannerMod. -/
def emitBannerMod : RealMod :=
  { name := "SystemsLean.EmitBanner"
    imports := ["SystemsLean.EmitBannerScaffold"] }

/-- ProductOutKernel leaf (SelfApplyFs direct dep; no package imports).
    Greppable: productOutKernelMod. -/
def productOutKernelMod : RealMod :=
  { name := "SystemsLean.ProductOutKernel", imports := [] }

/-- ProductOutKernelTheorems (imports ProductOutKernel only).
    Greppable: productOutKernelTheoremsMod. -/
def productOutKernelTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductOutKernelTheorems"
    imports := ["SystemsLean.ProductOutKernel"] }

/-- BootstrapHonesty leaf (SelfApplyFs direct dep; no package imports).
    Greppable: bootstrapHonestyMod. -/
def bootstrapHonestyMod : RealMod :=
  { name := "SystemsLean.BootstrapHonesty", imports := [] }

/-- BootstrapHonestyTheorems (imports BootstrapHonesty only).
    Greppable: bootstrapHonestyTheoremsMod. -/
def bootstrapHonestyTheoremsMod : RealMod :=
  { name := "SystemsLean.BootstrapHonestyTheorems"
    imports := ["SystemsLean.BootstrapHonesty"] }

/-- ProductPathWriterSurface leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterSurfaceMod. -/
def productPathWriterSurfaceMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterSurface", imports := [] }

/-- ProductPathWriterSurfaceTheorems (imports ProductPathWriterSurface only).
    Greppable: productPathWriterSurfaceTheoremsMod. -/
def productPathWriterSurfaceTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterSurfaceTheorems"
    imports := ["SystemsLean.ProductPathWriterSurface"] }

/-- ProductPathWriterPathPlan leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathPlanMod. -/
def productPathWriterPathPlanMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathPlan", imports := [] }

/-- ProductPathWriterPathPlanTheorems (imports ProductPathWriterPathPlan only).
    Greppable: productPathWriterPathPlanTheoremsMod. -/
def productPathWriterPathPlanTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathPlanTheorems"
    imports := ["SystemsLean.ProductPathWriterPathPlan"] }

/-- ProductPathWriterPathExec leaf (SelfApplyFs ProductPath writer pure leaf).
    Greppable: productPathWriterPathExecMod. -/
def productPathWriterPathExecMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathExec", imports := [] }

/-- ProductPathWriterPathExecTheorems (imports ProductPathWriterPathExec only).
    Greppable: productPathWriterPathExecTheoremsMod. -/
def productPathWriterPathExecTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathWriterPathExecTheorems"
    imports := ["SystemsLean.ProductPathWriterPathExec"] }

/-- Good Mult-only subset (A4 regression). Greppable: hostImportGraphGoodMultSeed. -/
def hostImportGraphGoodMultSeed : ImportGraphResult :=
  resolveImportGraph [multLeafMod, multTheoremsMod]

/-- Good expand seed (Mult..Compose + Erasure/Extract + CompilePath/Kernel +
    Kernel *Theorems + JoinMap/SelfHost (+Theorems) + SurfaceMatrix (+Theorems)
    + Emit Mult..Compose scaffolds + Emit Plan/Apply/Body scaffolds
    + Emit Erasure/Extract/Banner scaffolds + KernelSelfApply +
    KernelSelfApplyTheorems + EmitMult + EmitPlan + EmitApply + EmitBody +
    KernelEmit + KernelEmitTheorems + ParityMult + ParityMultTheorems +
    ParityLinear + ParityLinearTheorems + ParityTypes + ParityTypesTheorems +
    ParityProgram + ParityProgramTheorems + ParityEmit + ParityEmitTheorems +
    SelfApply + SelfApplyTheorems + EmitLinear + EmitTypes + EmitProgram +
    EmitGraph + EmitCompose + EmitErasure + EmitExtract + EmitBanner +
    ProductOutKernel + ProductOutKernelTheorems + BootstrapHonesty +
    BootstrapHonestyTheorems + ProductPathWriterSurface +
    ProductPathWriterSurfaceTheorems + ProductPathWriterPathPlan +
    ProductPathWriterPathPlanTheorems + ProductPathWriterPathExec +
    ProductPathWriterPathExecTheorems).
    Greppable: hostImportGraphGoodExpandSeed. -/
def hostImportGraphGoodExpandSeed : ImportGraphResult :=
  resolveImportGraph
    [multLeafMod, multTheoremsMod, linearLeafMod, linearTheoremsMod,
     typesMod, typesTheoremsMod, irProgramMod, irProgramTheoremsMod,
     irGraphMod, irGraphTheoremsMod, hostComposeMod, hostComposeTheoremsMod,
     erasureMod, erasureTheoremsMod, extractMod, extractTheoremsMod,
     compilePathMod, kernelMultMod, kernelLinearMod, kernelTypesMod,
     kernelProgramMod, kernelMultTheoremsMod, kernelLinearTheoremsMod,
     kernelTypesTheoremsMod, kernelProgramTheoremsMod, joinMapMod,
     joinMapTheoremsMod, selfHostMod, selfHostTheoremsMod, surfaceMatrixMod,
     surfaceMatrixTheoremsMod, emitMultScaffoldMod, emitLinearScaffoldMod,
     emitTypesScaffoldMod, emitProgramScaffoldMod, emitGraphScaffoldMod,
     emitComposeScaffoldMod, emitPlanScaffoldMod, emitApplyScaffoldMod,
     emitBodyScaffoldMod, emitErasureScaffoldMod, emitExtractScaffoldMod,
     emitBannerScaffoldMod, kernelSelfApplyMod, kernelSelfApplyTheoremsMod,
     emitMultMod, emitPlanMod, emitApplyMod, emitBodyMod, kernelEmitMod,
     kernelEmitTheoremsMod, parityMultMod, parityMultTheoremsMod,
     parityLinearMod, parityLinearTheoremsMod, parityTypesMod,
     parityTypesTheoremsMod, parityProgramMod, parityProgramTheoremsMod,
     parityEmitMod, parityEmitTheoremsMod, selfApplyMod, selfApplyTheoremsMod,
     emitLinearMod, emitTypesMod, emitProgramMod, emitGraphMod, emitComposeMod,
     emitErasureMod, emitExtractMod, emitBannerMod, productOutKernelMod,
     productOutKernelTheoremsMod, bootstrapHonestyMod,
     bootstrapHonestyTheoremsMod, productPathWriterSurfaceMod,
     productPathWriterSurfaceTheoremsMod, productPathWriterPathPlanMod,
     productPathWriterPathPlanTheoremsMod, productPathWriterPathExecMod,
     productPathWriterPathExecTheoremsMod]

/-- Bad: MultTheorems without Mult present. Greppable: hostImportGraphBadMissing. -/
def hostImportGraphBadMissing : ImportGraphResult :=
  resolveImportGraph [multTheoremsMod]

/-- Bad: two-module cycle. Greppable: hostImportGraphBadCycle. -/
def hostImportGraphBadCycle : ImportGraphResult :=
  resolveImportGraph
    [ { name := "SystemsLean.A", imports := ["SystemsLean.B"] },
      { name := "SystemsLean.B", imports := ["SystemsLean.A"] } ]

/-- Structural expand seed dual-pin holds (good accept + fail-closed missing/cycle).
    Greppable: hostImportGraphLoadOk. -/
def hostImportGraphLoadOk : Bool :=
  hostImportGraphGoodMultSeed.isAccept
    && (hostImportGraphGoodMultSeed.acceptCount == 2)
    && hostImportGraphGoodExpandSeed.isAccept
    && (hostImportGraphGoodExpandSeed.acceptCount == 81)
    && hostImportGraphBadMissing.isRejectWith reasonMissingImport
    && hostImportGraphBadCycle.isRejectWith reasonImportCycle
    && (hostImportGraphSeedModules
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
    && (hostImportGraphSeedRelPaths
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
    && (residualName == "Real Mult import graph")
    && (hostImportGraphExpandSliceName == "Host library seed expand continue")
    && (hostImportGraphSeedUnitsLabel
      == "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems")
    && (multLeafMod.imports == [])
    && (multTheoremsMod.imports == ["SystemsLean.Mult"])
    && (linearLeafMod.imports == [])
    && (linearTheoremsMod.imports == ["SystemsLean.Linear"])
    && (typesMod.imports == ["SystemsLean.Mult"])
    && (typesTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.MultTheorems", "SystemsLean.Types"])
    && (irProgramMod.imports == ["SystemsLean.Types"])
    && (irProgramTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"])
    && (irGraphMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram"])
    && (irGraphTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph"])
    && (erasureMod.imports == ["SystemsLean.Mult"])
    && (erasureTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Erasure"])
    && (extractMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Erasure"])
    && (extractTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Erasure", "SystemsLean.Extract"])
    && (hostComposeMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrGraph",
          "SystemsLean.Erasure", "SystemsLean.Extract"])
    && (hostComposeTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrGraph",
          "SystemsLean.IrGraphTheorems", "SystemsLean.Erasure",
          "SystemsLean.ErasureTheorems", "SystemsLean.Extract",
          "SystemsLean.HostCompose"])
    && (compilePathMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph", "SystemsLean.Erasure", "SystemsLean.HostCompose",
          "SystemsLean.Extract"])
    && (kernelMultMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath"])
    && (kernelLinearMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.HostCompose", "SystemsLean.CompilePath"])
    && (kernelTypesMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath"])
    && (kernelProgramMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath"])
    && (kernelMultTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath", "SystemsLean.KernelMult"])
    && (kernelLinearTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.HostCompose", "SystemsLean.CompilePath",
          "SystemsLean.KernelLinear"])
    && (kernelTypesTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.CompilePath", "SystemsLean.KernelTypes"])
    && (kernelProgramTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.IrGraph", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath", "SystemsLean.KernelProgram"])
    && (joinMapMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Linear", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath"])
    && (joinMapTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Linear", "SystemsLean.Types",
          "SystemsLean.IrProgram", "SystemsLean.Erasure", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath", "SystemsLean.JoinMap"])
    && (selfHostMod.imports
      == ["SystemsLean.IrProgram", "SystemsLean.HostCompose",
          "SystemsLean.CompilePath", "SystemsLean.JoinMap"])
    && (selfHostTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.JoinMap",
          "SystemsLean.SelfHost"])
    && (surfaceMatrixMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.CompilePath",
          "SystemsLean.JoinMap", "SystemsLean.SelfHost"])
    && (surfaceMatrixTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.IrProgram",
          "SystemsLean.Erasure", "SystemsLean.HostCompose", "SystemsLean.CompilePath",
          "SystemsLean.JoinMap", "SystemsLean.SelfHost", "SystemsLean.SurfaceMatrix"])
    && (emitMultScaffoldMod.imports == ["SystemsLean.Mult"])
    && (emitLinearScaffoldMod.imports == [])
    && (emitTypesScaffoldMod.imports == [])
    && (emitProgramScaffoldMod.imports == [])
    && (emitGraphScaffoldMod.imports == [])
    && (emitComposeScaffoldMod.imports == [])
    && (emitPlanScaffoldMod.imports == [])
    && (emitApplyScaffoldMod.imports == [])
    && (emitBodyScaffoldMod.imports == [])
    && (emitErasureScaffoldMod.imports == [])
    && (emitExtractScaffoldMod.imports == [])
    && (emitBannerScaffoldMod.imports == [])
    && (kernelSelfApplyMod.imports == [])
    && (kernelSelfApplyTheoremsMod.imports == ["SystemsLean.KernelSelfApply"])
    && (emitMultMod.imports == ["SystemsLean.EmitMultScaffold"])
    && (emitPlanMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
          "SystemsLean.EmitPlanScaffold"])
    && (emitApplyMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
          "SystemsLean.EmitApplyScaffold"])
    && (emitBodyMod.imports
      == ["SystemsLean.Mult", "SystemsLean.Types", "SystemsLean.HostCompose",
          "SystemsLean.EmitPlan", "SystemsLean.EmitApply",
          "SystemsLean.EmitBodyScaffold"])
    && (kernelEmitMod.imports
      == ["SystemsLean.HostCompose", "SystemsLean.EmitPlan",
          "SystemsLean.EmitApply", "SystemsLean.EmitBody", "SystemsLean.EmitMult",
          "SystemsLean.KernelProgram"])
    && (kernelEmitTheoremsMod.imports
      == ["SystemsLean.HostCompose", "SystemsLean.EmitPlan",
          "SystemsLean.EmitApply", "SystemsLean.EmitBody", "SystemsLean.EmitMult",
          "SystemsLean.KernelProgram", "SystemsLean.KernelEmit"])
    && (parityMultMod.imports
      == ["SystemsLean.Mult", "SystemsLean.KernelMult", "SystemsLean.EmitMult"])
    && (parityMultTheoremsMod.imports
      == ["SystemsLean.Mult", "SystemsLean.KernelMult", "SystemsLean.EmitMult",
          "SystemsLean.ParityMult"])
    && (parityLinearMod.imports
      == ["SystemsLean.KernelLinear", "SystemsLean.ParityMult"])
    && (parityLinearTheoremsMod.imports
      == ["SystemsLean.KernelLinear", "SystemsLean.ParityMult",
          "SystemsLean.ParityLinear"])
    && (parityTypesMod.imports
      == ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear"])
    && (parityTypesTheoremsMod.imports
      == ["SystemsLean.KernelTypes", "SystemsLean.ParityLinear",
          "SystemsLean.ParityTypes"])
    && (parityProgramMod.imports
      == ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes"])
    && (parityProgramTheoremsMod.imports
      == ["SystemsLean.KernelProgram", "SystemsLean.ParityTypes",
          "SystemsLean.ParityProgram"])
    && (parityEmitMod.imports
      == ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
          "SystemsLean.EmitMult"])
    && (parityEmitTheoremsMod.imports
      == ["SystemsLean.KernelEmit", "SystemsLean.ParityProgram",
          "SystemsLean.EmitMult", "SystemsLean.ParityEmit"])
    && (selfApplyMod.imports
      == ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
          "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
          "SystemsLean.KernelEmit"])
    && (selfApplyTheoremsMod.imports
      == ["SystemsLean.ParityMult", "SystemsLean.KernelLinear",
          "SystemsLean.KernelTypes", "SystemsLean.KernelProgram",
          "SystemsLean.KernelEmit", "SystemsLean.SelfApply"])
    && (emitLinearMod.imports == ["SystemsLean.EmitLinearScaffold"])
    && (emitTypesMod.imports == ["SystemsLean.EmitTypesScaffold"])
    && (emitProgramMod.imports == ["SystemsLean.EmitProgramScaffold"])
    && (emitGraphMod.imports == ["SystemsLean.EmitGraphScaffold"])
    && (emitComposeMod.imports == ["SystemsLean.EmitComposeScaffold"])
    && (emitErasureMod.imports == ["SystemsLean.EmitErasureScaffold"])
    && (emitExtractMod.imports == ["SystemsLean.EmitExtractScaffold"])
    && (emitBannerMod.imports == ["SystemsLean.EmitBannerScaffold"])
    && (productOutKernelMod.imports == [])
    && (productOutKernelTheoremsMod.imports
      == ["SystemsLean.ProductOutKernel"])
    && (bootstrapHonestyMod.imports == [])
    && (bootstrapHonestyTheoremsMod.imports
      == ["SystemsLean.BootstrapHonesty"])
    && (productPathWriterSurfaceMod.imports == [])
    && (productPathWriterSurfaceTheoremsMod.imports
      == ["SystemsLean.ProductPathWriterSurface"])
    && (productPathWriterPathPlanMod.imports == [])
    && (productPathWriterPathPlanTheoremsMod.imports
      == ["SystemsLean.ProductPathWriterPathPlan"])
    && (productPathWriterPathExecMod.imports == [])
    && (productPathWriterPathExecTheoremsMod.imports
      == ["SystemsLean.ProductPathWriterPathExec"])

/-- Without-Lake keeps host Lake bootstrap honesty.
    Greppable: hostImportGraphWithoutLakeKeepsHostLake,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE. -/
def hostImportGraphWithoutLakeKeepsHostLake : Bool :=
  hostImportGraphWithoutLakeFinished
    && stillUsesLake
    && dependsOnLake
    && hostImportGraphHostElaboratorResidualRemains
    && !hostImportGraphHostFreeClaimed

/-- Structural ready for real Mult import graph surface.
    Greppable: hostImportGraphReady, HOST-IMPORT-GRAPH,
    SLAKE_HOST_IMPORT_GRAPH. -/
def hostImportGraphReady : Bool :=
  hostImportGraphFinishedClaimed
    && hostImportGraphLoadOk
    && hostImportGraphHostElaboratorResidualRemains
    && !hostImportGraphHostFreeClaimed
    && stillUsesLake
    && dependsOnLake
    && hostImportGraphStillUsesLake
    && hostImportGraphDependsOnLake
    && !hostImportGraphResidualFreeClaimed
    && !hostImportGraphProductSelfHostCompleteClaimed
    && !hostImportGraphProofCompleteClaimed
    && !hostImportGraphLlvmUnlocked
    && !hostImportGraphProvablyUnlocked
    && (stageId == "SLAKE_HOST_IMPORT_GRAPH_V0")
    && (hostId == "HOST-IMPORT-GRAPH")
    && (surfaceId == "HOST-IMPORT-GRAPH")
    && (surfaceAlias == "HOST-HOST-IMPORT-GRAPH")
    && (lakeExeName == "slake-host-import-graph")
    && (justRecipe == "host-import-graph")
    && (justRecipeWithoutLake == "host-import-graph-without-lake")
    && (prebuiltHostImportGraphRel
      == ".lake/build/bin/slake-host-import-graph")

/-- Without-Lake ready (structural + finished + keeps host Lake).
    Greppable: hostImportGraphWithoutLakeReady,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE. -/
def hostImportGraphWithoutLakeReady : Bool :=
  hostImportGraphReady
    && hostImportGraphWithoutLakeFinished
    && hostImportGraphWithoutLakeKeepsHostLake
    && (justRecipeWithoutLake == "host-import-graph-without-lake")
    && (prebuiltHostImportGraphRel
      == ".lake/build/bin/slake-host-import-graph")

/-! ### HOST-IMPORT-GRAPH-THEOREM (readable statements) -/

/-- Mult seed dual-pin + fail-closed holds.
    Greppable: hostImportGraphLoadOk_true, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphLoadOk_true : hostImportGraphLoadOk = true := by
  native_decide

/-- Structural ready.
    Greppable: hostImportGraphReady_true, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphReady_true : hostImportGraphReady = true := by
  native_decide

/-- Without-Lake ready.
    Greppable: hostImportGraphWithoutLakeReady_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphWithoutLakeReady_true :
    hostImportGraphWithoutLakeReady = true := by
  native_decide

/-- Finished claimed.
    Greppable: hostImportGraphFinishedClaimed_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphFinishedClaimed_true :
    hostImportGraphFinishedClaimed = true :=
  rfl

/-- Host residual remains (local mirror).
    Greppable: hostImportGraphHostElaboratorResidualRemains_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphHostElaboratorResidualRemains_true :
    hostImportGraphHostElaboratorResidualRemains = true :=
  rfl

/-- Host free not claimed.
    Greppable: hostImportGraphHostFreeClaimed_false,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphHostFreeClaimed_false :
    hostImportGraphHostFreeClaimed = false :=
  rfl

/-- Without-Lake finished.
    Greppable: hostImportGraphWithoutLakeFinished_true,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphWithoutLakeFinished_true :
    hostImportGraphWithoutLakeFinished = true :=
  rfl

/-- Good Mult seed accepts with count 2.
    Greppable: hostImportGraphGoodMultSeed_accept,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphGoodMultSeed_accept :
    hostImportGraphGoodMultSeed.isAccept = true
      && hostImportGraphGoodMultSeed.acceptCount = 2 := by
  native_decide

/-- Good expand seed accepts with count 75 (Mult..Compose+Erasure/Extract+
    CompilePath/Kernel+Kernel *Theorems+JoinMap/SelfHost+SurfaceMatrix+
    Emit Mult..Compose scaffolds+Emit Plan/Apply/Body scaffolds+
    Emit Erasure/Extract/Banner scaffolds+KernelSelfApply+
    KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+
    KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+
    ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+
    ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+
    SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+
    EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+
    ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+
    BootstrapHonestyTheorems).
    Greppable: hostImportGraphGoodExpandSeed_accept, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphGoodExpandSeed_accept :
    hostImportGraphGoodExpandSeed.isAccept = true
      && hostImportGraphGoodExpandSeed.acceptCount = 81 := by
  native_decide

/-- Missing Mult fails closed.
    Greppable: hostImportGraphBadMissing_missing,
    HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphBadMissing_missing :
    hostImportGraphBadMissing.isRejectWith reasonMissingImport = true := by
  native_decide

/-- Cycle fails closed.
    Greppable: hostImportGraphBadCycle_cycle, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraphBadCycle_cycle :
    hostImportGraphBadCycle.isRejectWith reasonImportCycle = true := by
  native_decide

/-- Stage / host / recipe ids.
    Greppable: hostImportGraph_ids_eq, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraph_ids_eq :
    stageId = "SLAKE_HOST_IMPORT_GRAPH_V0"
      && hostId = "HOST-IMPORT-GRAPH"
      && lakeExeName = "slake-host-import-graph"
      && justRecipe = "host-import-graph"
      && justRecipeWithoutLake = "host-import-graph-without-lake"
      && prebuiltHostImportGraphRel
        = ".lake/build/bin/slake-host-import-graph"
      && residualName = "Real Mult import graph" :=
  rfl

/-- Local free/complete/proof/llvm/PROVABLY/host-free non-claims false.
    Greppable: hostImportGraph_claims_false, HOST-IMPORT-GRAPH-THEOREM. -/
theorem hostImportGraph_claims_false :
    hostImportGraphResidualFreeClaimed = false
      && hostImportGraphProductSelfHostCompleteClaimed = false
      && hostImportGraphProofCompleteClaimed = false
      && hostImportGraphLlvmUnlocked = false
      && hostImportGraphProvablyUnlocked = false
      && hostImportGraphHostFreeClaimed = false
      && stillUsesLake = true
      && dependsOnLake = true :=
  rfl

/-! ### HOST-IMPORT-GRAPH-SMOKE (quick examples) -/

example : hostImportGraphLoadOk = true := by native_decide
example : hostImportGraphReady = true := by native_decide
example : hostImportGraphWithoutLakeReady = true := by native_decide
example : hostImportGraphFinishedClaimed = true := rfl
example : hostImportGraphWithoutLakeFinished = true := rfl
example : hostImportGraphHostElaboratorResidualRemains = true := rfl
example : hostImportGraphHostFreeClaimed = false := rfl
example : stillUsesLake = true := rfl
example : dependsOnLake = true := rfl
example : lakeExeName = "slake-host-import-graph" := rfl
example : justRecipe = "host-import-graph" := rfl
example : justRecipeWithoutLake = "host-import-graph-without-lake" := rfl
example :
    prebuiltHostImportGraphRel =
      ".lake/build/bin/slake-host-import-graph" :=
  rfl
example : residualName = "Real Mult import graph" := rfl
example : hostImportGraphExpandSliceName = "Host library seed expand continue" :=
  rfl
example :
    hostImportGraphSeedUnitsLabel =
      "Mult+MultTheorems+Linear+LinearTheorems+Types+TypesTheorems+IrProgram+IrProgramTheorems+IrGraph+IrGraphTheorems+HostCompose+HostComposeTheorems+Erasure+ErasureTheorems+Extract+ExtractTheorems+CompilePath+KernelMult+KernelLinear+KernelTypes+KernelProgram+KernelMultTheorems+KernelLinearTheorems+KernelTypesTheorems+KernelProgramTheorems+JoinMap+JoinMapTheorems+SelfHost+SelfHostTheorems+SurfaceMatrix+SurfaceMatrixTheorems+EmitMultScaffold+EmitLinearScaffold+EmitTypesScaffold+EmitProgramScaffold+EmitGraphScaffold+EmitComposeScaffold+EmitPlanScaffold+EmitApplyScaffold+EmitBodyScaffold+EmitErasureScaffold+EmitExtractScaffold+EmitBannerScaffold+KernelSelfApply+KernelSelfApplyTheorems+EmitMult+EmitPlan+EmitApply+EmitBody+KernelEmit+KernelEmitTheorems+ParityMult+ParityMultTheorems+ParityLinear+ParityLinearTheorems+ParityTypes+ParityTypesTheorems+ParityProgram+ParityProgramTheorems+ParityEmit+ParityEmitTheorems+SelfApply+SelfApplyTheorems+EmitLinear+EmitTypes+EmitProgram+EmitGraph+EmitCompose+EmitErasure+EmitExtract+EmitBanner+ProductOutKernel+ProductOutKernelTheorems+BootstrapHonesty+BootstrapHonestyTheorems+ProductPathWriterSurface+ProductPathWriterSurfaceTheorems+ProductPathWriterPathPlan+ProductPathWriterPathPlanTheorems+ProductPathWriterPathExec+ProductPathWriterPathExecTheorems" :=
  rfl
example : hostImportGraphGoodMultSeed.isAccept = true := by native_decide
example : hostImportGraphGoodExpandSeed.isAccept = true := by native_decide
example :
    hostImportGraphBadMissing.isRejectWith reasonMissingImport = true := by
  native_decide
example :
    hostImportGraphBadCycle.isRejectWith reasonImportCycle = true := by
  native_decide

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
    -- Dotted remainder becomes path segments; seed uses single segment only.
    some (hostImportGraphLibraryDirRel ++ "/" ++ rest ++ ".lean")
  else
    none

/-- Load one real module from disk (parse package-local imports; seed-local filter). -/
def loadRealMod (root : System.FilePath) (modName : String) : IO RealMod := do
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
    let imps :=
      filterSeedImports hostImportGraphSeedModules (extractImports content)
    pure { name := modName, imports := imps }

/-- Load Mult seed set from disk and resolve.
    Greppable: loadMultImportGraph, HOST-IMPORT-GRAPH. -/
def loadMultImportGraph (root : System.FilePath) : IO (List RealMod) := do
  let mut mods : List RealMod := []
  for name in hostImportGraphSeedModules do
    let m <- loadRealMod root name
    mods := mods ++ [m]
  -- Dual-pin seed size honesty.
  unless mods.length == hostImportGraphSeedModules.length do
    IO.eprintln s!"error: {stageId} {reasonSeedMismatch}: count"
    throw (IO.userError reasonSeedMismatch)
  pure mods

/-- Print ordered module names and their imports. -/
def printOrder (order : List RealMod) : IO Unit := do
  IO.println "  order:"
  for m in order do
    let imps :=
      if m.imports.isEmpty then "(none)"
      else String.intercalate ", " m.imports
    IO.println s!"    {m.name} <- {imps}"

/-- Run measured real Mult..Compose+Erasure/Extract import graph.
    Dual evidence: pins + walk.
    Greppable: runImportGraph, HOST-IMPORT-GRAPH,
    HOST-IMPORT-GRAPH-WITHOUT-LAKE, Host real module seed expand. -/
def runImportGraph (root : System.FilePath) : IO Unit := do
  let seedLabel := hostImportGraphSeedUnitsLabel
  IO.println s!"== {stageId}: real Mult..Compose+Erasure/Extract import graph =="
  IO.println s!"  surface={surfaceId} host={hostId} residual={residualName}"
  IO.println s!"  expand={hostImportGraphExpandSliceName} seed={seedLabel}"
  IO.println s!"  structuralReady={hostImportGraphReady} stillUsesLake={stillUsesLake} dependsOnLake={dependsOnLake}"
  IO.println s!"  hostResidual={hostImportGraphHostElaboratorResidualRemains} withoutLake={hostImportGraphWithoutLakeFinished}"
  IO.println s!"  withoutLakeReady={hostImportGraphWithoutLakeReady} keepsHostLake={hostImportGraphWithoutLakeKeepsHostLake}"
  unless hostImportGraphReady do
    IO.eprintln s!"error: {stageId} hostImportGraphReady false"
    throw (IO.userError "hostImportGraphReady false")
  unless hostImportGraphFinishedClaimed do
    IO.eprintln s!"error: {stageId} hostImportGraphFinishedClaimed false"
    throw (IO.userError "hostImportGraphFinishedClaimed false")
  unless hostImportGraphWithoutLakeFinished do
    IO.eprintln s!"error: {stageId} hostImportGraphWithoutLakeFinished false"
    throw (IO.userError "hostImportGraphWithoutLakeFinished false")
  unless hostImportGraphWithoutLakeReady do
    IO.eprintln s!"error: {stageId} hostImportGraphWithoutLakeReady false"
    throw (IO.userError "hostImportGraphWithoutLakeReady false")
  -- Fail-closed structural smoke (no disk).
  unless hostImportGraphBadMissing.isRejectWith reasonMissingImport do
    IO.eprintln s!"error: {stageId} expected {reasonMissingImport} on bad missing"
    throw (IO.userError "bad missing not fail-closed")
  unless hostImportGraphBadCycle.isRejectWith reasonImportCycle do
    IO.eprintln s!"error: {stageId} expected {reasonImportCycle} on bad cycle"
    throw (IO.userError "bad cycle not fail-closed")
  unless hostImportGraphGoodExpandSeed.isAccept do
    IO.eprintln s!"error: {stageId} expand seed structural accept failed"
    throw (IO.userError "expand seed")
  IO.println s!"  failClosed: {reasonMissingImport} + {reasonImportCycle} ok"
  -- On-disk Mult..Compose+Erasure/Extract expand seed walk.
  let mods <- loadMultImportGraph root
  match resolveImportGraph mods with
  | ImportGraphResult.reject reason =>
    IO.eprintln s!"error: {stageId} resolve reject: {reason}"
    for m in mods do
      IO.eprintln s!"  loaded {m.name} imports={m.imports}"
    throw (IO.userError reason)
  | ImportGraphResult.accept order =>
    unless order.length == hostImportGraphSeedModules.length do
      IO.eprintln s!"error: {stageId} expected order length {hostImportGraphSeedModules.length} got {order.length}"
      throw (IO.userError "order length")
    -- Required nodes and edges for expand seed.
    unless order.any (fun m => m.name == "SystemsLean.Mult") do
      IO.eprintln s!"error: {stageId} Mult missing from order"
      throw (IO.userError "Mult missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.MultTheorems"
        && m.imports.any (fun i => i == "SystemsLean.Mult")) do
      IO.eprintln s!"error: {stageId} MultTheorems must import SystemsLean.Mult"
      throw (IO.userError "MultTheorems import")
    unless order.any (fun m => m.name == "SystemsLean.Linear") do
      IO.eprintln s!"error: {stageId} Linear missing from order"
      throw (IO.userError "Linear missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.LinearTheorems"
        && m.imports.any (fun i => i == "SystemsLean.Linear")) do
      IO.eprintln s!"error: {stageId} LinearTheorems must import SystemsLean.Linear"
      throw (IO.userError "LinearTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.Types"
        && m.imports.any (fun i => i == "SystemsLean.Mult")) do
      IO.eprintln s!"error: {stageId} Types must import SystemsLean.Mult"
      throw (IO.userError "Types import")
    unless order.any (fun m =>
      m.name == "SystemsLean.TypesTheorems"
        && m.imports.any (fun i => i == "SystemsLean.Types")) do
      IO.eprintln s!"error: {stageId} TypesTheorems must import SystemsLean.Types"
      throw (IO.userError "TypesTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.IrProgram"
        && m.imports.any (fun i => i == "SystemsLean.Types")) do
      IO.eprintln s!"error: {stageId} IrProgram must import SystemsLean.Types"
      throw (IO.userError "IrProgram import")
    unless order.any (fun m =>
      m.name == "SystemsLean.IrProgramTheorems"
        && m.imports.any (fun i => i == "SystemsLean.IrProgram")) do
      IO.eprintln s!"error: {stageId} IrProgramTheorems must import SystemsLean.IrProgram"
      throw (IO.userError "IrProgramTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.IrGraph"
        && m.imports.any (fun i => i == "SystemsLean.IrProgram")) do
      IO.eprintln s!"error: {stageId} IrGraph must import SystemsLean.IrProgram"
      throw (IO.userError "IrGraph import")
    unless order.any (fun m =>
      m.name == "SystemsLean.IrGraphTheorems"
        && m.imports.any (fun i => i == "SystemsLean.IrGraph")) do
      IO.eprintln s!"error: {stageId} IrGraphTheorems must import SystemsLean.IrGraph"
      throw (IO.userError "IrGraphTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.Erasure"
        && m.imports.any (fun i => i == "SystemsLean.Mult")) do
      IO.eprintln s!"error: {stageId} Erasure must import SystemsLean.Mult"
      throw (IO.userError "Erasure import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ErasureTheorems"
        && m.imports.any (fun i => i == "SystemsLean.Erasure")) do
      IO.eprintln s!"error: {stageId} ErasureTheorems must import SystemsLean.Erasure"
      throw (IO.userError "ErasureTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.Extract"
        && m.imports.any (fun i => i == "SystemsLean.Erasure")) do
      IO.eprintln s!"error: {stageId} Extract must import SystemsLean.Erasure"
      throw (IO.userError "Extract import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ExtractTheorems"
        && m.imports.any (fun i => i == "SystemsLean.Extract")) do
      IO.eprintln s!"error: {stageId} ExtractTheorems must import SystemsLean.Extract"
      throw (IO.userError "ExtractTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.HostCompose"
        && m.imports.any (fun i => i == "SystemsLean.IrGraph")
        && m.imports.any (fun i => i == "SystemsLean.Erasure")
        && m.imports.any (fun i => i == "SystemsLean.Extract")) do
      IO.eprintln s!"error: {stageId} HostCompose must import IrGraph+Erasure+Extract"
      throw (IO.userError "HostCompose import")
    unless order.any (fun m =>
      m.name == "SystemsLean.HostComposeTheorems"
        && m.imports.any (fun i => i == "SystemsLean.HostCompose")
        && m.imports.any (fun i => i == "SystemsLean.Erasure")) do
      IO.eprintln s!"error: {stageId} HostComposeTheorems must import HostCompose+Erasure"
      throw (IO.userError "HostComposeTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.KernelMultTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelMult")) do
      IO.eprintln s!"error: {stageId} KernelMultTheorems must import SystemsLean.KernelMult"
      throw (IO.userError "KernelMultTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.KernelLinearTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelLinear")) do
      IO.eprintln s!"error: {stageId} KernelLinearTheorems must import SystemsLean.KernelLinear"
      throw (IO.userError "KernelLinearTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.KernelTypesTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelTypes")) do
      IO.eprintln s!"error: {stageId} KernelTypesTheorems must import SystemsLean.KernelTypes"
      throw (IO.userError "KernelTypesTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.KernelProgramTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelProgram")) do
      IO.eprintln s!"error: {stageId} KernelProgramTheorems must import SystemsLean.KernelProgram"
      throw (IO.userError "KernelProgramTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.JoinMap"
        && m.imports.any (fun i => i == "SystemsLean.CompilePath")
        && m.imports.any (fun i => i == "SystemsLean.HostCompose")) do
      IO.eprintln s!"error: {stageId} JoinMap must import CompilePath+HostCompose"
      throw (IO.userError "JoinMap import")
    unless order.any (fun m =>
      m.name == "SystemsLean.JoinMapTheorems"
        && m.imports.any (fun i => i == "SystemsLean.JoinMap")) do
      IO.eprintln s!"error: {stageId} JoinMapTheorems must import SystemsLean.JoinMap"
      throw (IO.userError "JoinMapTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.SelfHost"
        && m.imports.any (fun i => i == "SystemsLean.JoinMap")) do
      IO.eprintln s!"error: {stageId} SelfHost must import SystemsLean.JoinMap"
      throw (IO.userError "SelfHost import")
    unless order.any (fun m =>
      m.name == "SystemsLean.SelfHostTheorems"
        && m.imports.any (fun i => i == "SystemsLean.SelfHost")) do
      IO.eprintln s!"error: {stageId} SelfHostTheorems must import SystemsLean.SelfHost"
      throw (IO.userError "SelfHostTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.SurfaceMatrix"
        && m.imports.any (fun i => i == "SystemsLean.SelfHost")
        && m.imports.any (fun i => i == "SystemsLean.JoinMap")) do
      IO.eprintln s!"error: {stageId} SurfaceMatrix must import SelfHost+JoinMap"
      throw (IO.userError "SurfaceMatrix import")
    unless order.any (fun m =>
      m.name == "SystemsLean.SurfaceMatrixTheorems"
        && m.imports.any (fun i => i == "SystemsLean.SurfaceMatrix")) do
      IO.eprintln s!"error: {stageId} SurfaceMatrixTheorems must import SystemsLean.SurfaceMatrix"
      throw (IO.userError "SurfaceMatrixTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitMultScaffold"
        && m.imports.any (fun i => i == "SystemsLean.Mult")) do
      IO.eprintln s!"error: {stageId} EmitMultScaffold must import SystemsLean.Mult"
      throw (IO.userError "EmitMultScaffold import")
    unless order.any (fun m => m.name == "SystemsLean.EmitLinearScaffold") do
      IO.eprintln s!"error: {stageId} EmitLinearScaffold missing from order"
      throw (IO.userError "EmitLinearScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitTypesScaffold") do
      IO.eprintln s!"error: {stageId} EmitTypesScaffold missing from order"
      throw (IO.userError "EmitTypesScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitProgramScaffold") do
      IO.eprintln s!"error: {stageId} EmitProgramScaffold missing from order"
      throw (IO.userError "EmitProgramScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitGraphScaffold") do
      IO.eprintln s!"error: {stageId} EmitGraphScaffold missing from order"
      throw (IO.userError "EmitGraphScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitComposeScaffold") do
      IO.eprintln s!"error: {stageId} EmitComposeScaffold missing from order"
      throw (IO.userError "EmitComposeScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitPlanScaffold") do
      IO.eprintln s!"error: {stageId} EmitPlanScaffold missing from order"
      throw (IO.userError "EmitPlanScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitApplyScaffold") do
      IO.eprintln s!"error: {stageId} EmitApplyScaffold missing from order"
      throw (IO.userError "EmitApplyScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitBodyScaffold") do
      IO.eprintln s!"error: {stageId} EmitBodyScaffold missing from order"
      throw (IO.userError "EmitBodyScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitErasureScaffold") do
      IO.eprintln s!"error: {stageId} EmitErasureScaffold missing from order"
      throw (IO.userError "EmitErasureScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitExtractScaffold") do
      IO.eprintln s!"error: {stageId} EmitExtractScaffold missing from order"
      throw (IO.userError "EmitExtractScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.EmitBannerScaffold") do
      IO.eprintln s!"error: {stageId} EmitBannerScaffold missing from order"
      throw (IO.userError "EmitBannerScaffold missing")
    unless order.any (fun m => m.name == "SystemsLean.KernelSelfApply") do
      IO.eprintln s!"error: {stageId} KernelSelfApply missing from order"
      throw (IO.userError "KernelSelfApply missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.KernelSelfApplyTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelSelfApply")) do
      IO.eprintln s!"error: {stageId} KernelSelfApplyTheorems must import SystemsLean.KernelSelfApply"
      throw (IO.userError "KernelSelfApplyTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitMult"
        && m.imports.any (fun i => i == "SystemsLean.EmitMultScaffold")) do
      IO.eprintln s!"error: {stageId} EmitMult must import SystemsLean.EmitMultScaffold"
      throw (IO.userError "EmitMult import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitPlan"
        && m.imports.any (fun i => i == "SystemsLean.EmitPlanScaffold")
        && m.imports.any (fun i => i == "SystemsLean.HostCompose")) do
      IO.eprintln s!"error: {stageId} EmitPlan must import EmitPlanScaffold+HostCompose"
      throw (IO.userError "EmitPlan import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitApply"
        && m.imports.any (fun i => i == "SystemsLean.EmitApplyScaffold")
        && m.imports.any (fun i => i == "SystemsLean.HostCompose")) do
      IO.eprintln s!"error: {stageId} EmitApply must import EmitApplyScaffold+HostCompose"
      throw (IO.userError "EmitApply import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitBody"
        && m.imports.any (fun i => i == "SystemsLean.EmitPlan")
        && m.imports.any (fun i => i == "SystemsLean.EmitApply")
        && m.imports.any (fun i => i == "SystemsLean.EmitBodyScaffold")) do
      IO.eprintln s!"error: {stageId} EmitBody must import EmitPlan+EmitApply+EmitBodyScaffold"
      throw (IO.userError "EmitBody import")
    unless order.any (fun m =>
      m.name == "SystemsLean.KernelEmit"
        && m.imports.any (fun i => i == "SystemsLean.HostCompose")
        && m.imports.any (fun i => i == "SystemsLean.EmitPlan")
        && m.imports.any (fun i => i == "SystemsLean.EmitApply")
        && m.imports.any (fun i => i == "SystemsLean.EmitBody")
        && m.imports.any (fun i => i == "SystemsLean.EmitMult")
        && m.imports.any (fun i => i == "SystemsLean.KernelProgram")) do
      IO.eprintln s!"error: {stageId} KernelEmit must import HostCompose+EmitPlan+EmitApply+EmitBody+EmitMult+KernelProgram"
      throw (IO.userError "KernelEmit import")
    unless order.any (fun m =>
      m.name == "SystemsLean.KernelEmitTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelEmit")) do
      IO.eprintln s!"error: {stageId} KernelEmitTheorems must import SystemsLean.KernelEmit"
      throw (IO.userError "KernelEmitTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityMult"
        && m.imports.any (fun i => i == "SystemsLean.Mult")
        && m.imports.any (fun i => i == "SystemsLean.KernelMult")
        && m.imports.any (fun i => i == "SystemsLean.EmitMult")) do
      IO.eprintln s!"error: {stageId} ParityMult must import Mult+KernelMult+EmitMult"
      throw (IO.userError "ParityMult import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityMultTheorems"
        && m.imports.any (fun i => i == "SystemsLean.Mult")
        && m.imports.any (fun i => i == "SystemsLean.KernelMult")
        && m.imports.any (fun i => i == "SystemsLean.EmitMult")
        && m.imports.any (fun i => i == "SystemsLean.ParityMult")) do
      IO.eprintln s!"error: {stageId} ParityMultTheorems must import Mult+KernelMult+EmitMult+ParityMult"
      throw (IO.userError "ParityMultTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityLinear"
        && m.imports.any (fun i => i == "SystemsLean.KernelLinear")
        && m.imports.any (fun i => i == "SystemsLean.ParityMult")) do
      IO.eprintln s!"error: {stageId} ParityLinear must import KernelLinear+ParityMult"
      throw (IO.userError "ParityLinear import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityLinearTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelLinear")
        && m.imports.any (fun i => i == "SystemsLean.ParityMult")
        && m.imports.any (fun i => i == "SystemsLean.ParityLinear")) do
      IO.eprintln s!"error: {stageId} ParityLinearTheorems must import KernelLinear+ParityMult+ParityLinear"
      throw (IO.userError "ParityLinearTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityTypes"
        && m.imports.any (fun i => i == "SystemsLean.KernelTypes")
        && m.imports.any (fun i => i == "SystemsLean.ParityLinear")) do
      IO.eprintln s!"error: {stageId} ParityTypes must import KernelTypes+ParityLinear"
      throw (IO.userError "ParityTypes import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityTypesTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelTypes")
        && m.imports.any (fun i => i == "SystemsLean.ParityLinear")
        && m.imports.any (fun i => i == "SystemsLean.ParityTypes")) do
      IO.eprintln s!"error: {stageId} ParityTypesTheorems must import KernelTypes+ParityLinear+ParityTypes"
      throw (IO.userError "ParityTypesTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityProgram"
        && m.imports.any (fun i => i == "SystemsLean.KernelProgram")
        && m.imports.any (fun i => i == "SystemsLean.ParityTypes")) do
      IO.eprintln s!"error: {stageId} ParityProgram must import KernelProgram+ParityTypes"
      throw (IO.userError "ParityProgram import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityProgramTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelProgram")
        && m.imports.any (fun i => i == "SystemsLean.ParityTypes")
        && m.imports.any (fun i => i == "SystemsLean.ParityProgram")) do
      IO.eprintln s!"error: {stageId} ParityProgramTheorems must import KernelProgram+ParityTypes+ParityProgram"
      throw (IO.userError "ParityProgramTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityEmit"
        && m.imports.any (fun i => i == "SystemsLean.KernelEmit")
        && m.imports.any (fun i => i == "SystemsLean.ParityProgram")
        && m.imports.any (fun i => i == "SystemsLean.EmitMult")) do
      IO.eprintln s!"error: {stageId} ParityEmit must import KernelEmit+ParityProgram+EmitMult"
      throw (IO.userError "ParityEmit import")
    unless order.any (fun m =>
      m.name == "SystemsLean.ParityEmitTheorems"
        && m.imports.any (fun i => i == "SystemsLean.KernelEmit")
        && m.imports.any (fun i => i == "SystemsLean.ParityProgram")
        && m.imports.any (fun i => i == "SystemsLean.EmitMult")
        && m.imports.any (fun i => i == "SystemsLean.ParityEmit")) do
      IO.eprintln s!"error: {stageId} ParityEmitTheorems must import KernelEmit+ParityProgram+EmitMult+ParityEmit"
      throw (IO.userError "ParityEmitTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.SelfApply"
        && m.imports.any (fun i => i == "SystemsLean.ParityMult")
        && m.imports.any (fun i => i == "SystemsLean.KernelLinear")
        && m.imports.any (fun i => i == "SystemsLean.KernelTypes")
        && m.imports.any (fun i => i == "SystemsLean.KernelProgram")
        && m.imports.any (fun i => i == "SystemsLean.KernelEmit")) do
      IO.eprintln s!"error: {stageId} SelfApply must import ParityMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit"
      throw (IO.userError "SelfApply import")
    unless order.any (fun m =>
      m.name == "SystemsLean.SelfApplyTheorems"
        && m.imports.any (fun i => i == "SystemsLean.ParityMult")
        && m.imports.any (fun i => i == "SystemsLean.KernelLinear")
        && m.imports.any (fun i => i == "SystemsLean.KernelTypes")
        && m.imports.any (fun i => i == "SystemsLean.KernelProgram")
        && m.imports.any (fun i => i == "SystemsLean.KernelEmit")
        && m.imports.any (fun i => i == "SystemsLean.SelfApply")) do
      IO.eprintln s!"error: {stageId} SelfApplyTheorems must import ParityMult+KernelLinear+KernelTypes+KernelProgram+KernelEmit+SelfApply"
      throw (IO.userError "SelfApplyTheorems import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitLinear"
        && m.imports.any (fun i => i == "SystemsLean.EmitLinearScaffold")) do
      IO.eprintln s!"error: {stageId} EmitLinear must import SystemsLean.EmitLinearScaffold"
      throw (IO.userError "EmitLinear import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitTypes"
        && m.imports.any (fun i => i == "SystemsLean.EmitTypesScaffold")) do
      IO.eprintln s!"error: {stageId} EmitTypes must import SystemsLean.EmitTypesScaffold"
      throw (IO.userError "EmitTypes import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitProgram"
        && m.imports.any (fun i => i == "SystemsLean.EmitProgramScaffold")) do
      IO.eprintln s!"error: {stageId} EmitProgram must import SystemsLean.EmitProgramScaffold"
      throw (IO.userError "EmitProgram import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitGraph"
        && m.imports.any (fun i => i == "SystemsLean.EmitGraphScaffold")) do
      IO.eprintln s!"error: {stageId} EmitGraph must import SystemsLean.EmitGraphScaffold"
      throw (IO.userError "EmitGraph import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitCompose"
        && m.imports.any (fun i => i == "SystemsLean.EmitComposeScaffold")) do
      IO.eprintln s!"error: {stageId} EmitCompose must import SystemsLean.EmitComposeScaffold"
      throw (IO.userError "EmitCompose import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitErasure"
        && m.imports.any (fun i => i == "SystemsLean.EmitErasureScaffold")) do
      IO.eprintln s!"error: {stageId} EmitErasure must import SystemsLean.EmitErasureScaffold"
      throw (IO.userError "EmitErasure import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitExtract"
        && m.imports.any (fun i => i == "SystemsLean.EmitExtractScaffold")) do
      IO.eprintln s!"error: {stageId} EmitExtract must import SystemsLean.EmitExtractScaffold"
      throw (IO.userError "EmitExtract import")
    unless order.any (fun m =>
      m.name == "SystemsLean.EmitBanner"
        && m.imports.any (fun i => i == "SystemsLean.EmitBannerScaffold")) do
      IO.eprintln s!"error: {stageId} EmitBanner must import SystemsLean.EmitBannerScaffold"
      throw (IO.userError "EmitBanner import")
    unless order.any (fun m => m.name == "SystemsLean.ProductOutKernel") do
      IO.eprintln s!"error: {stageId} ProductOutKernel missing from order"
      throw (IO.userError "ProductOutKernel missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.ProductOutKernelTheorems"
        && m.imports.any (fun i => i == "SystemsLean.ProductOutKernel")) do
      IO.eprintln s!"error: {stageId} ProductOutKernelTheorems must import SystemsLean.ProductOutKernel"
      throw (IO.userError "ProductOutKernelTheorems import")
    unless order.any (fun m => m.name == "SystemsLean.BootstrapHonesty") do
      IO.eprintln s!"error: {stageId} BootstrapHonesty missing from order"
      throw (IO.userError "BootstrapHonesty missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.BootstrapHonestyTheorems"
        && m.imports.any (fun i => i == "SystemsLean.BootstrapHonesty")) do
      IO.eprintln s!"error: {stageId} BootstrapHonestyTheorems must import SystemsLean.BootstrapHonesty"
      throw (IO.userError "BootstrapHonestyTheorems import")
    unless order.any (fun m => m.name == "SystemsLean.ProductPathWriterSurface") do
      IO.eprintln s!"error: {stageId} ProductPathWriterSurface missing from order"
      throw (IO.userError "ProductPathWriterSurface missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.ProductPathWriterSurfaceTheorems"
        && m.imports.any (fun i => i == "SystemsLean.ProductPathWriterSurface")) do
      IO.eprintln s!"error: {stageId} ProductPathWriterSurfaceTheorems must import SystemsLean.ProductPathWriterSurface"
      throw (IO.userError "ProductPathWriterSurfaceTheorems import")
    unless order.any (fun m => m.name == "SystemsLean.ProductPathWriterPathPlan") do
      IO.eprintln s!"error: {stageId} ProductPathWriterPathPlan missing from order"
      throw (IO.userError "ProductPathWriterPathPlan missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.ProductPathWriterPathPlanTheorems"
        && m.imports.any (fun i => i == "SystemsLean.ProductPathWriterPathPlan")) do
      IO.eprintln s!"error: {stageId} ProductPathWriterPathPlanTheorems must import SystemsLean.ProductPathWriterPathPlan"
      throw (IO.userError "ProductPathWriterPathPlanTheorems import")
    unless order.any (fun m => m.name == "SystemsLean.ProductPathWriterPathExec") do
      IO.eprintln s!"error: {stageId} ProductPathWriterPathExec missing from order"
      throw (IO.userError "ProductPathWriterPathExec missing")
    unless order.any (fun m =>
      m.name == "SystemsLean.ProductPathWriterPathExecTheorems"
        && m.imports.any (fun i => i == "SystemsLean.ProductPathWriterPathExec")) do
      IO.eprintln s!"error: {stageId} ProductPathWriterPathExecTheorems must import SystemsLean.ProductPathWriterPathExec"
      throw (IO.userError "ProductPathWriterPathExecTheorems import")
    printOrder order
    IO.println s!"GREEN {stageId}: seed {seedLabel} modules={order.length}; expand={hostImportGraphExpandSliceName}; withoutLake finished; host residual remains"

/-- CLI: real Mult import graph. Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runImportGraph root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostImportGraph
