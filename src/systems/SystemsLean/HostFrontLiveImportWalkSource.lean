/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphWalk.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportWalkSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-IMPORT-WALK, liveImportWalkSource,
  HOST-FRONT-LIVE-IMPORT-WALK, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveImportWalkSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveImportWalk

/-- Dual-pinned live HostImportGraphWalk.lean bytes (must match on-disk file).
    Greppable: liveImportWalkSource, PARSE-LIVE-IMPORT-WALK. -/
def liveImportWalkSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph on-disk order edge walk.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphWalk,
  HostImportGraphWalkLater, checkImportOrderEdges, checkImportOrderEdgesLater.
  Module: SystemsLean.HostImportGraphWalk
  Long-file peel: later edges in HostImportGraphWalkLater (same namespace).
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphWalk; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphModel
import SystemsLean.HostImportGraphWalkLater
namespace SystemsLean.HostImportGraph
/-- Expand-seed order edges. Greppable: checkImportOrderEdges, HOST-IMPORT-GRAPH. -/
def checkImportOrderEdges (order : List RealMod) : IO Unit := do
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
  unless order.any (fun m => m.name == "SystemsLean.ProductPathOwnershipInputs") do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipInputs missing from order"
    throw (IO.userError "ProductPathOwnershipInputs missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathOwnershipInputsTheorems"
      && m.imports.any (fun i => i == "SystemsLean.ProductPathOwnershipInputs")) do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipInputsTheorems must import SystemsLean.ProductPathOwnershipInputs"
    throw (IO.userError "ProductPathOwnershipInputsTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.ProductPathPerform") do
    IO.eprintln s!"error: {stageId} ProductPathPerform missing from order"
    throw (IO.userError "ProductPathPerform missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathPerformTheorems"
      && m.imports.any (fun i => i == "SystemsLean.ProductPathPerform")) do
    IO.eprintln s!"error: {stageId} ProductPathPerformTheorems must import SystemsLean.ProductPathPerform"
    throw (IO.userError "ProductPathPerformTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.ProductPathPerformStep") do
    IO.eprintln s!"error: {stageId} ProductPathPerformStep missing from order"
    throw (IO.userError "ProductPathPerformStep missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathPerformStepTheorems"
      && m.imports.any (fun i => i == "SystemsLean.ProductPathPerformStep")) do
    IO.eprintln s!"error: {stageId} ProductPathPerformStepTheorems must import SystemsLean.ProductPathPerformStep"
    throw (IO.userError "ProductPathPerformStepTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.ProductPathReadSsot") do
    IO.eprintln s!"error: {stageId} ProductPathReadSsot missing from order"
    throw (IO.userError "ProductPathReadSsot missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathReadSsotTheorems"
      && m.imports.any (fun i => i == "SystemsLean.ProductPathReadSsot")) do
    IO.eprintln s!"error: {stageId} ProductPathReadSsotTheorems must import SystemsLean.ProductPathReadSsot"
    throw (IO.userError "ProductPathReadSsotTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.ProductPathComposePlan") do
    IO.eprintln s!"error: {stageId} ProductPathComposePlan missing from order"
    throw (IO.userError "ProductPathComposePlan missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathComposePlanTheorems"
      && m.imports.any (fun i => i == "SystemsLean.ProductPathComposePlan")) do
    IO.eprintln s!"error: {stageId} ProductPathComposePlanTheorems must import SystemsLean.ProductPathComposePlan"
    throw (IO.userError "ProductPathComposePlanTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.Capable") do
    IO.eprintln s!"error: {stageId} Capable missing from order"
    throw (IO.userError "Capable missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableTheorems"
      && m.imports.any (fun i => i == "SystemsLean.Capable")) do
    IO.eprintln s!"error: {stageId} CapableTheorems must import SystemsLean.Capable"
    throw (IO.userError "CapableTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.CapableStepContract") do
    IO.eprintln s!"error: {stageId} CapableStepContract missing from order"
    throw (IO.userError "CapableStepContract missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableStepContractTheorems"
      && m.imports.any (fun i => i == "SystemsLean.CapableStepContract")) do
    IO.eprintln s!"error: {stageId} CapableStepContractTheorems must import SystemsLean.CapableStepContract"
    throw (IO.userError "CapableStepContractTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.InstallOut") do
    IO.eprintln s!"error: {stageId} InstallOut missing from order"
    throw (IO.userError "InstallOut missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.InstallOutTheorems"
      && m.imports.any (fun i => i == "SystemsLean.InstallOut")) do
    IO.eprintln s!"error: {stageId} InstallOutTheorems must import SystemsLean.InstallOut"
    throw (IO.userError "InstallOutTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.OfficialPath") do
    IO.eprintln s!"error: {stageId} OfficialPath missing from order"
    throw (IO.userError "OfficialPath missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.OfficialPathTheorems"
      && m.imports.any (fun i => i == "SystemsLean.OfficialPath")) do
    IO.eprintln s!"error: {stageId} OfficialPathTheorems must import SystemsLean.OfficialPath"
    throw (IO.userError "OfficialPathTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.PerformEvidence") do
    IO.eprintln s!"error: {stageId} PerformEvidence missing from order"
    throw (IO.userError "PerformEvidence missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.PerformEvidenceTheorems"
      && m.imports.any (fun i => i == "SystemsLean.PerformEvidence")) do
    IO.eprintln s!"error: {stageId} PerformEvidenceTheorems must import SystemsLean.PerformEvidence"
    throw (IO.userError "PerformEvidenceTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.CapableRead") do
    IO.eprintln s!"error: {stageId} CapableRead missing from order"
    throw (IO.userError "CapableRead missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableReadTheorems"
      && m.imports.any (fun i => i == "SystemsLean.CapableRead")) do
    IO.eprintln s!"error: {stageId} CapableReadTheorems must import SystemsLean.CapableRead"
    throw (IO.userError "CapableReadTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.CapableCompose") do
    IO.eprintln s!"error: {stageId} CapableCompose missing from order"
    throw (IO.userError "CapableCompose missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableComposeTheorems"
      && m.imports.any (fun i => i == "SystemsLean.CapableCompose")) do
    IO.eprintln s!"error: {stageId} CapableComposeTheorems must import SystemsLean.CapableCompose"
    throw (IO.userError "CapableComposeTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.CapableFullBar") do
    IO.eprintln s!"error: {stageId} CapableFullBar missing from order"
    throw (IO.userError "CapableFullBar missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableFullBarTheorems"
      && m.imports.any (fun i => i == "SystemsLean.CapableFullBar")) do
    IO.eprintln s!"error: {stageId} CapableFullBarTheorems must import SystemsLean.CapableFullBar"
    throw (IO.userError "CapableFullBarTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.DualEqWriteCapableGap") do
    IO.eprintln s!"error: {stageId} DualEqWriteCapableGap missing from order"
    throw (IO.userError "DualEqWriteCapableGap missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.DualEqWriteCapableGapTheorems"
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteCapableGap")) do
    IO.eprintln s!"error: {stageId} DualEqWriteCapableGapTheorems must import SystemsLean.DualEqWriteCapableGap"
    throw (IO.userError "DualEqWriteCapableGapTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.DualEqWriteClosePath") do
    IO.eprintln s!"error: {stageId} DualEqWriteClosePath missing from order"
    throw (IO.userError "DualEqWriteClosePath missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.DualEqWriteClosePathTheorems"
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteClosePath")) do
    IO.eprintln s!"error: {stageId} DualEqWriteClosePathTheorems must import SystemsLean.DualEqWriteClosePath"
    throw (IO.userError "DualEqWriteClosePathTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.DualEqWriteParity") do
    IO.eprintln s!"error: {stageId} DualEqWriteParity missing from order"
    throw (IO.userError "DualEqWriteParity missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.DualEqWriteParityTheorems"
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteParity")) do
    IO.eprintln s!"error: {stageId} DualEqWriteParityTheorems must import SystemsLean.DualEqWriteParity"
    throw (IO.userError "DualEqWriteParityTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.OfficialRetire") do
    IO.eprintln s!"error: {stageId} OfficialRetire missing from order"
    throw (IO.userError "OfficialRetire missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.OfficialRetireTheorems"
      && m.imports.any (fun i => i == "SystemsLean.OfficialRetire")) do
    IO.eprintln s!"error: {stageId} OfficialRetireTheorems must import SystemsLean.OfficialRetire"
    throw (IO.userError "OfficialRetireTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.OwnershipClaimed") do
    IO.eprintln s!"error: {stageId} OwnershipClaimed missing from order"
    throw (IO.userError "OwnershipClaimed missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.OwnershipClaimedTheorems"
      && m.imports.any (fun i => i == "SystemsLean.OwnershipClaimed")) do
    IO.eprintln s!"error: {stageId} OwnershipClaimedTheorems must import SystemsLean.OwnershipClaimed"
    throw (IO.userError "OwnershipClaimedTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.PerformClaimed") do
    IO.eprintln s!"error: {stageId} PerformClaimed missing from order"
    throw (IO.userError "PerformClaimed missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.PerformClaimedTheorems"
      && m.imports.any (fun i => i == "SystemsLean.PerformClaimed")) do
    IO.eprintln s!"error: {stageId} PerformClaimedTheorems must import SystemsLean.PerformClaimed"
    throw (IO.userError "PerformClaimedTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.StepContractFull") do
    IO.eprintln s!"error: {stageId} StepContractFull missing from order"
    throw (IO.userError "StepContractFull missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.StepContractFullTheorems"
      && m.imports.any (fun i => i == "SystemsLean.StepContractFull")) do
    IO.eprintln s!"error: {stageId} StepContractFullTheorems must import SystemsLean.StepContractFull"
    throw (IO.userError "StepContractFullTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.SelfHostComplete") do
    IO.eprintln s!"error: {stageId} SelfHostComplete missing from order"
    throw (IO.userError "SelfHostComplete missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.SelfHostCompleteTheorems"
      && m.imports.any (fun i => i == "SystemsLean.SelfHostComplete")) do
    IO.eprintln s!"error: {stageId} SelfHostCompleteTheorems must import SystemsLean.SelfHostComplete"
    throw (IO.userError "SelfHostCompleteTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.OfficialPathAlternate") do
    IO.eprintln s!"error: {stageId} OfficialPathAlternate missing from order"
    throw (IO.userError "OfficialPathAlternate missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.OfficialPathAlternateTheorems"
      && m.imports.any (fun i => i == "SystemsLean.OfficialPathAlternate")) do
    IO.eprintln s!"error: {stageId} OfficialPathAlternateTheorems must import SystemsLean.OfficialPathAlternate"
    throw (IO.userError "OfficialPathAlternateTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.ProductPathOwnershipRegenerate") do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipRegenerate missing from order"
    throw (IO.userError "ProductPathOwnershipRegenerate missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathOwnershipRegenerateTheorems"
      && m.imports.any (fun i => i == "SystemsLean.ProductPathOwnershipRegenerate")) do
    IO.eprintln s!"error: {stageId} ProductPathOwnershipRegenerateTheorems must import SystemsLean.ProductPathOwnershipRegenerate"
    throw (IO.userError "ProductPathOwnershipRegenerateTheorems import")
  checkImportOrderEdgesLater order
end SystemsLean.HostImportGraph
"#

end SystemsLean.HostFrontLiveImportWalk
