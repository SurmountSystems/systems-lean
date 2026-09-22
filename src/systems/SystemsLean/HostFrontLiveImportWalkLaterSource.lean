/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphWalkLater.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportWalkLaterSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-IMPORT-WALK-LATER, liveImportWalkLaterSource,
  HOST-FRONT-LIVE-IMPORT-WALK-LATER, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveImportWalkLaterSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveImportWalkLater

/-- Dual-pinned live HostImportGraphWalkLater.lean bytes (must match on-disk file).
    Greppable: liveImportWalkLaterSource, PARSE-LIVE-IMPORT-WALK-LATER. -/
def liveImportWalkLaterSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph later on-disk order edge walk.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion of HostImportGraphWalk. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphWalkLater,
  checkImportOrderEdgesLater.
  Module: SystemsLean.HostImportGraphWalkLater
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphWalkLater; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphModel
namespace SystemsLean.HostImportGraph
/-- Later expand-seed order edges (CapableWriteHcLoad through SelfApplyFs pack).
    Greppable: checkImportOrderEdgesLater, HOST-IMPORT-GRAPH, HostImportGraphWalkLater. -/
def checkImportOrderEdgesLater (order : List RealMod) : IO Unit := do
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableWriteHcLoad"
      && m.imports.any (fun i => i == "SystemsLean.EmitBanner")
      && m.imports.any (fun i => i == "SystemsLean.EmitBodyScaffold")) do
    IO.eprintln s!"error: {stageId} CapableWriteHcLoad must import emit product stack"
    throw (IO.userError "CapableWriteHcLoad import")
  unless order.any (fun m =>
    m.name == "SystemsLean.DualEqWriteLoad"
      && m.imports.any (fun i => i == "SystemsLean.EmitBanner")
      && m.imports.any (fun i => i == "SystemsLean.EmitBodyScaffold")) do
    IO.eprintln s!"error: {stageId} DualEqWriteLoad must import emit product stack"
    throw (IO.userError "DualEqWriteLoad import")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableWriteHc"
      && m.imports.any (fun i => i == "SystemsLean.CapableWriteHcLoad")
      && m.imports.any (fun i => i == "SystemsLean.EmitBanner")) do
    IO.eprintln s!"error: {stageId} CapableWriteHc must import CapableWriteHcLoad + emit stack"
    throw (IO.userError "CapableWriteHc import")
  unless order.any (fun m =>
    m.name == "SystemsLean.DualEqWriteApi"
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteLoad")
      && m.imports.any (fun i => i == "SystemsLean.EmitBanner")) do
    IO.eprintln s!"error: {stageId} DualEqWriteApi must import DualEqWriteLoad + emit stack"
    throw (IO.userError "DualEqWriteApi import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmHold"
      && m.imports.any (fun i => i == "SystemsLean.SelfApply")) do
    IO.eprintln s!"error: {stageId} LlvmHold must import SystemsLean.SelfApply"
    throw (IO.userError "LlvmHold import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmHoldTheorems"
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.SelfApply")) do
    IO.eprintln s!"error: {stageId} LlvmHoldTheorems must import SelfApply + LlvmHold"
    throw (IO.userError "LlvmHoldTheorems import")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableRegenerate"
      && m.imports.any (fun i => i == "SystemsLean.CapableRead")
      && m.imports.any (fun i => i == "SystemsLean.CapableCompose")
      && m.imports.any (fun i => i == "SystemsLean.CapableWriteHc")
      && m.imports.any (fun i => i == "SystemsLean.InstallOut")) do
    IO.eprintln s!"error: {stageId} CapableRegenerate must import CapableRead+Compose+WriteHc+InstallOut"
    throw (IO.userError "CapableRegenerate import")
  unless order.any (fun m =>
    m.name == "SystemsLean.CapableRegenerateTheorems"
      && m.imports.any (fun i => i == "SystemsLean.CapableRegenerate")) do
    IO.eprintln s!"error: {stageId} CapableRegenerateTheorems must import SystemsLean.CapableRegenerate"
    throw (IO.userError "CapableRegenerateTheorems import")
  unless order.any (fun m => m.name == "SystemsLean.FreestandingEmitLoad") do
    IO.eprintln s!"error: {stageId} FreestandingEmitLoad missing from order"
    throw (IO.userError "FreestandingEmitLoad missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.FreestandingEmitLoadScaffold"
      && m.imports.any (fun i => i == "SystemsLean.FreestandingEmitLoad")) do
    IO.eprintln s!"error: {stageId} FreestandingEmitLoadScaffold must import SystemsLean.FreestandingEmitLoad"
    throw (IO.userError "FreestandingEmitLoadScaffold import")
  unless order.any (fun m => m.name == "SystemsLean.LakeRetireInventory") do
    IO.eprintln s!"error: {stageId} LakeRetireInventory missing from order"
    throw (IO.userError "LakeRetireInventory missing")
  unless order.any (fun m => m.name == "SystemsLean.HostPackageRoots") do
    IO.eprintln s!"error: {stageId} HostPackageRoots missing from order"
    throw (IO.userError "HostPackageRoots missing")
  unless order.any (fun m =>
    m.name == "SystemsLean.FreestandingEmit"
      && m.imports.any (fun i => i == "SystemsLean.FreestandingEmitLoad")
      && m.imports.any (fun i => i == "SystemsLean.FreestandingEmitLoadScaffold")
      && m.imports.any (fun i => i == "SystemsLean.EmitBanner")
      && m.imports.any (fun i => i == "SystemsLean.EmitBody")) do
    IO.eprintln s!"error: {stageId} FreestandingEmit must import Load+Scaffold+emit product stack"
    throw (IO.userError "FreestandingEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathWriteHc"
      && m.imports.any (fun i => i == "SystemsLean.FreestandingEmit")) do
    IO.eprintln s!"error: {stageId} ProductPathWriteHc must import SystemsLean.FreestandingEmit"
    throw (IO.userError "ProductPathWriteHc import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathWriteHcTheorems"
      && m.imports.any (fun i => i == "SystemsLean.ProductPathWriteHc")) do
    IO.eprintln s!"error: {stageId} ProductPathWriteHcTheorems must import SystemsLean.ProductPathWriteHc"
    throw (IO.userError "ProductPathWriteHcTheorems import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductWireWriteTool"
      && m.imports.any (fun i => i == "SystemsLean.CapableWriteHc")
      && m.imports.any (fun i => i == "SystemsLean.InstallOut")) do
    IO.eprintln s!"error: {stageId} ProductWireWriteTool must import CapableWriteHc+InstallOut"
    throw (IO.userError "ProductWireWriteTool import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostTerm"
      && m.imports.any (fun i => i == "SystemsLean.Mult")) do
    IO.eprintln s!"error: {stageId} HostTerm must import SystemsLean.Mult"
    throw (IO.userError "HostTerm import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmEmitPath"
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")) do
    IO.eprintln s!"error: {stageId} LlvmEmitPath must import SystemsLean.LlvmHold"
    throw (IO.userError "LlvmEmitPath import")
  unless order.any (fun m =>
    m.name == "SystemsLean.SubsetFront"
      && m.imports.any (fun i => i == "SystemsLean.CompilePath")
      && m.imports.any (fun i => i == "SystemsLean.IrProgram")
      && m.imports.any (fun i => i == "SystemsLean.Types")
      && m.imports.any (fun i => i == "SystemsLean.Mult")) do
    IO.eprintln s!"error: {stageId} SubsetFront must import CompilePath+IrProgram+Types+Mult"
    throw (IO.userError "SubsetFront import")
  unless order.any (fun m =>
    m.name == "SystemsLean.FirstSurface"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathMult")) do
    IO.eprintln s!"error: {stageId} FirstSurface must import CompilePathMult"
    throw (IO.userError "FirstSurface import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LinearSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathLinear")
      && m.imports.any (fun i => i == "SystemsLean.EmitLinear")) do
    IO.eprintln s!"error: {stageId} LinearSubsetEmit must import CompilePathLinear+EmitLinear"
    throw (IO.userError "LinearSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.TypesSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathTypes")
      && m.imports.any (fun i => i == "SystemsLean.EmitTypes")) do
    IO.eprintln s!"error: {stageId} TypesSubsetEmit must import CompilePathTypes+EmitTypes"
    throw (IO.userError "TypesSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProgramSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathProgram")
      && m.imports.any (fun i => i == "SystemsLean.EmitProgram")) do
    IO.eprintln s!"error: {stageId} ProgramSubsetEmit must import CompilePathProgram+EmitProgram"
    throw (IO.userError "ProgramSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.GraphSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathGraph")
      && m.imports.any (fun i => i == "SystemsLean.EmitGraph")) do
    IO.eprintln s!"error: {stageId} GraphSubsetEmit must import CompilePathGraph+EmitGraph"
    throw (IO.userError "GraphSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ComposeSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathCompose")
      && m.imports.any (fun i => i == "SystemsLean.EmitCompose")) do
    IO.eprintln s!"error: {stageId} ComposeSubsetEmit must import CompilePathCompose+EmitCompose"
    throw (IO.userError "ComposeSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ErasureSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathErasure")
      && m.imports.any (fun i => i == "SystemsLean.EmitErasure")) do
    IO.eprintln s!"error: {stageId} ErasureSubsetEmit must import CompilePathErasure+EmitErasure"
    throw (IO.userError "ErasureSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ExtractSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.CompilePathExtract")
      && m.imports.any (fun i => i == "SystemsLean.EmitExtract")) do
    IO.eprintln s!"error: {stageId} ExtractSubsetEmit must import CompilePathExtract+EmitExtract"
    throw (IO.userError "ExtractSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.MultSubsetEmit"
      && m.imports.any (fun i => i == "SystemsLean.FirstSurface")
      && m.imports.any (fun i => i == "SystemsLean.EmitMult")) do
    IO.eprintln s!"error: {stageId} MultSubsetEmit must import FirstSurface+EmitMult"
    throw (IO.userError "MultSubsetEmit import")
  unless order.any (fun m =>
    m.name == "SystemsLean.MultSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.MultSubsetEmit")) do
    IO.eprintln s!"error: {stageId} MultSubsetRebuild must import MultSubsetEmit"
    throw (IO.userError "MultSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LinearSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.LinearSubsetEmit")) do
    IO.eprintln s!"error: {stageId} LinearSubsetRebuild must import LinearSubsetEmit"
    throw (IO.userError "LinearSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.TypesSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.TypesSubsetEmit")) do
    IO.eprintln s!"error: {stageId} TypesSubsetRebuild must import TypesSubsetEmit"
    throw (IO.userError "TypesSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProgramSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.ProgramSubsetEmit")) do
    IO.eprintln s!"error: {stageId} ProgramSubsetRebuild must import ProgramSubsetEmit"
    throw (IO.userError "ProgramSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.GraphSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.GraphSubsetEmit")) do
    IO.eprintln s!"error: {stageId} GraphSubsetRebuild must import GraphSubsetEmit"
    throw (IO.userError "GraphSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ComposeSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.ComposeSubsetEmit")) do
    IO.eprintln s!"error: {stageId} ComposeSubsetRebuild must import ComposeSubsetEmit"
    throw (IO.userError "ComposeSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ErasureSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.ErasureSubsetEmit")) do
    IO.eprintln s!"error: {stageId} ErasureSubsetRebuild must import ErasureSubsetEmit"
    throw (IO.userError "ErasureSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ExtractSubsetRebuild"
      && m.imports.any (fun i => i == "SystemsLean.ExtractSubsetEmit")) do
    IO.eprintln s!"error: {stageId} ExtractSubsetRebuild must import ExtractSubsetEmit"
    throw (IO.userError "ExtractSubsetRebuild import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostFront"
      && m.imports.any (fun i => i == "SystemsLean.HostTerm")
      && m.imports.any (fun i => i == "SystemsLean.Mult")) do
    IO.eprintln s!"error: {stageId} HostFront must import HostTerm+Mult"
    throw (IO.userError "HostFront import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmMultText"
      && m.imports.any (fun i => i == "SystemsLean.Mult")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.LlvmEmitPath")) do
    IO.eprintln s!"error: {stageId} LlvmMultText must import Mult+LlvmHold+LlvmEmitPath"
    throw (IO.userError "LlvmMultText import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostFrontTheorems"
      && m.imports.any (fun i => i == "SystemsLean.HostFront")) do
    IO.eprintln s!"error: {stageId} HostFrontTheorems must import HostFront"
    throw (IO.userError "HostFrontTheorems import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostCheck"
      && m.imports.any (fun i => i == "SystemsLean.HostFront")) do
    IO.eprintln s!"error: {stageId} HostCheck must import HostFront"
    throw (IO.userError "HostCheck import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostGraph"
      && m.imports.any (fun i => i == "SystemsLean.HostFront")
      && m.imports.any (fun i => i == "SystemsLean.HostTerm")) do
    IO.eprintln s!"error: {stageId} HostGraph must import HostFront+HostTerm"
    throw (IO.userError "HostGraph import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmLinearText"
      && m.imports.any (fun i => i == "SystemsLean.Linear")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.LlvmEmitPath")
      && m.imports.any (fun i => i == "SystemsLean.LlvmMultText")) do
    IO.eprintln s!"error: {stageId} LlvmLinearText must import Linear+LlvmHold+LlvmEmitPath+LlvmMultText"
    throw (IO.userError "LlvmLinearText import")
  unless order.any (fun m =>
    m.name == "SystemsLean.MultFsWriteTool"
      && m.imports.any (fun i => i == "SystemsLean.MultSubsetEmit")) do
    IO.eprintln s!"error: {stageId} MultFsWriteTool must import MultSubsetEmit"
    throw (IO.userError "MultFsWriteTool import")
  unless order.any (fun m =>
    m.name == "SystemsLean.FrontMultPackage"
      && m.imports.any (fun i => i == "SystemsLean.SubsetFront")
      && m.imports.any (fun i => i == "SystemsLean.MultSubsetEmit")
      && m.imports.any (fun i => i == "SystemsLean.MultSubsetRebuild")) do
    IO.eprintln s!"error: {stageId} FrontMultPackage must import SubsetFront+MultSubsetEmit+MultSubsetRebuild"
    throw (IO.userError "FrontMultPackage import")
  unless order.any (fun m =>
    m.name == "SystemsLean.SubsetPackageJoin"
      && m.imports.any (fun i => i == "SystemsLean.MultSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.LinearSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.TypesSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.ProgramSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.ExtractSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.ErasureSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.GraphSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.ComposeSubsetRebuild")) do
    IO.eprintln s!"error: {stageId} SubsetPackageJoin must import unit SubsetRebuild parents"
    throw (IO.userError "SubsetPackageJoin import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostGraphTheorems"
      && m.imports.any (fun i => i == "SystemsLean.HostGraph")) do
    IO.eprintln s!"error: {stageId} HostGraphTheorems must import HostGraph"
    throw (IO.userError "HostGraphTheorems import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmTypesText"
      && m.imports.any (fun i => i == "SystemsLean.Types")
      && m.imports.any (fun i => i == "SystemsLean.Mult")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.LlvmEmitPath")
      && m.imports.any (fun i => i == "SystemsLean.LlvmMultText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmLinearText")) do
    IO.eprintln s!"error: {stageId} LlvmTypesText must import Types+Mult+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText"
    throw (IO.userError "LlvmTypesText import")
  unless order.any (fun m =>
    m.name == "SystemsLean.MultFsDeepen"
      && m.imports.any (fun i => i == "SystemsLean.MultSubsetRebuild")
      && m.imports.any (fun i => i == "SystemsLean.EmitMult")
      && m.imports.any (fun i => i == "SystemsLean.MultFsWriteTool")) do
    IO.eprintln s!"error: {stageId} MultFsDeepen must import MultSubsetRebuild+EmitMult+MultFsWriteTool"
    throw (IO.userError "MultFsDeepen import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostPackageWrite"
      && m.imports.any (fun i => i == "SystemsLean.HostFront")
      && m.imports.any (fun i => i == "SystemsLean.HostGraph")
      && m.imports.any (fun i => i == "SystemsLean.MultSubsetEmit")
      && m.imports.any (fun i => i == "SystemsLean.LinearSubsetEmit")
      && m.imports.any (fun i => i == "SystemsLean.TypesSubsetEmit")
      && m.imports.any (fun i => i == "SystemsLean.ProgramSubsetEmit")
      && m.imports.any (fun i => i == "SystemsLean.GraphSubsetEmit")
      && m.imports.any (fun i => i == "SystemsLean.ComposeSubsetEmit")) do
    IO.eprintln s!"error: {stageId} HostPackageWrite must import HostFront+HostGraph+unit SubsetEmit"
    throw (IO.userError "HostPackageWrite import")
  unless order.any (fun m =>
    m.name == "SystemsLean.HostPackageWriteTheorems"
      && m.imports.any (fun i => i == "SystemsLean.HostPackageWrite")) do
    IO.eprintln s!"error: {stageId} HostPackageWriteTheorems must import HostPackageWrite"
    throw (IO.userError "HostPackageWriteTheorems import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmProgramText"
      && m.imports.any (fun i => i == "SystemsLean.IrProgram")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.LlvmEmitPath")
      && m.imports.any (fun i => i == "SystemsLean.LlvmMultText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmLinearText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmTypesText")) do
    IO.eprintln s!"error: {stageId} LlvmProgramText must import IrProgram+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText+LlvmTypesText"
    throw (IO.userError "LlvmProgramText import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmGraphText"
      && m.imports.any (fun i => i == "SystemsLean.IrGraph")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.LlvmEmitPath")
      && m.imports.any (fun i => i == "SystemsLean.LlvmMultText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmLinearText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmTypesText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmProgramText")) do
    IO.eprintln s!"error: {stageId} LlvmGraphText must import IrGraph+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText+LlvmTypesText+LlvmProgramText"
    throw (IO.userError "LlvmGraphText import")
  unless order.any (fun m =>
    m.name == "SystemsLean.LlvmComposeText"
      && m.imports.any (fun i => i == "SystemsLean.HostCompose")
      && m.imports.any (fun i => i == "SystemsLean.IrProgram")
      && m.imports.any (fun i => i == "SystemsLean.IrGraph")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.LlvmEmitPath")
      && m.imports.any (fun i => i == "SystemsLean.LlvmMultText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmLinearText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmTypesText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmProgramText")
      && m.imports.any (fun i => i == "SystemsLean.LlvmGraphText")) do
    IO.eprintln s!"error: {stageId} LlvmComposeText must import HostCompose+IrProgram+IrGraph+LlvmHold+LlvmEmitPath+LlvmMultText+LlvmLinearText+LlvmTypesText+LlvmProgramText+LlvmGraphText"
    throw (IO.userError "LlvmComposeText import")
  unless order.any (fun m =>
    m.name == "SystemsLean.SelfApplyFs"
      && m.imports.any (fun i => i == "SystemsLean.SelfApply")
      && m.imports.any (fun i => i == "SystemsLean.ParityEmit")
      && m.imports.any (fun i => i == "SystemsLean.KernelEmit")
      && m.imports.any (fun i => i == "SystemsLean.HostCompose")
      && m.imports.any (fun i => i == "SystemsLean.EmitBody")
      && m.imports.any (fun i => i == "SystemsLean.EmitMult")
      && m.imports.any (fun i => i == "SystemsLean.KernelSelfApply")
      && m.imports.any (fun i => i == "SystemsLean.ProductOutKernel")
      && m.imports.any (fun i => i == "SystemsLean.BootstrapHonesty")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathWriterSurface")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathWriterPathPlan")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathWriterPathExec")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathOwnershipInputs")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathPerform")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathPerformStep")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathReadSsot")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathComposePlan")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathWriteHc")
      && m.imports.any (fun i => i == "SystemsLean.Capable")
      && m.imports.any (fun i => i == "SystemsLean.CapableStepContract")
      && m.imports.any (fun i => i == "SystemsLean.CapableRead")
      && m.imports.any (fun i => i == "SystemsLean.CapableCompose")
      && m.imports.any (fun i => i == "SystemsLean.CapableWriteHc")
      && m.imports.any (fun i => i == "SystemsLean.CapableRegenerate")
      && m.imports.any (fun i => i == "SystemsLean.InstallOut")
      && m.imports.any (fun i => i == "SystemsLean.CapableFullBar")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathOwnershipRegenerate")
      && m.imports.any (fun i => i == "SystemsLean.PerformEvidence")
      && m.imports.any (fun i => i == "SystemsLean.OfficialPath")
      && m.imports.any (fun i => i == "SystemsLean.OfficialPathAlternate")
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteParity")
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteClosePath")
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteApi")
      && m.imports.any (fun i => i == "SystemsLean.DualEqWriteCapableGap")
      && m.imports.any (fun i => i == "SystemsLean.OfficialRetire")
      && m.imports.any (fun i => i == "SystemsLean.PerformClaimed")
      && m.imports.any (fun i => i == "SystemsLean.OwnershipClaimed")
      && m.imports.any (fun i => i == "SystemsLean.StepContractFull")
      && m.imports.any (fun i => i == "SystemsLean.SelfHostComplete")) do
    IO.eprintln s!"error: {stageId} SelfApplyFs must import full honest package set (39 edges from on-disk)"
    throw (IO.userError "SelfApplyFs import")
  unless order.any (fun m =>
    m.name == "SystemsLean.SelfApplyFsTheorems"
      && m.imports.any (fun i => i == "SystemsLean.SelfApplyFs")) do
    IO.eprintln s!"error: {stageId} SelfApplyFsTheorems must import SelfApplyFs"
    throw (IO.userError "SelfApplyFsTheorems import")
  unless order.any (fun m =>
    m.name == "SystemsLean.InventoryClose"
      && m.imports.any (fun i => i == "SystemsLean.SelfApplyFs")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")) do
    IO.eprintln s!"error: {stageId} InventoryClose must import SelfApplyFs+LlvmHold"
    throw (IO.userError "InventoryClose import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPathBars"
      && m.imports.any (fun i => i == "SystemsLean.CompilePath")
      && m.imports.any (fun i => i == "SystemsLean.KernelEmit")
      && m.imports.any (fun i => i == "SystemsLean.KernelProgram")
      && m.imports.any (fun i => i == "SystemsLean.HostCompose")
      && m.imports.any (fun i => i == "SystemsLean.IrProgram")
      && m.imports.any (fun i => i == "SystemsLean.JoinMap")
      && m.imports.any (fun i => i == "SystemsLean.SelfHost")
      && m.imports.any (fun i => i == "SystemsLean.SurfaceMatrix")
      && m.imports.any (fun i => i == "SystemsLean.SelfApplyFs")) do
    IO.eprintln s!"error: {stageId} ProductPathBars must import CompilePath+KernelEmit+KernelProgram+HostCompose+IrProgram+JoinMap+SelfHost+SurfaceMatrix+SelfApplyFs"
    throw (IO.userError "ProductPathBars import")
  unless order.any (fun m =>
    m.name == "SystemsLean.InventoryCloseTheorems"
      && m.imports.any (fun i => i == "SystemsLean.SelfApplyFs")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.InventoryClose")) do
    IO.eprintln s!"error: {stageId} InventoryCloseTheorems must import SelfApplyFs+LlvmHold+InventoryClose"
    throw (IO.userError "InventoryCloseTheorems import")
  unless order.any (fun m =>
    m.name == "SystemsLean.ProductPath"
      && m.imports.any (fun i => i == "SystemsLean.InventoryClose")
      && m.imports.any (fun i => i == "SystemsLean.SelfApplyFs")
      && m.imports.any (fun i => i == "SystemsLean.LlvmHold")
      && m.imports.any (fun i => i == "SystemsLean.ProductPathBars")) do
    IO.eprintln s!"error: {stageId} ProductPath must import InventoryClose+SelfApplyFs+LlvmHold+ProductPathBars"
    throw (IO.userError "ProductPath import")
end SystemsLean.HostImportGraph
"#

end SystemsLean.HostFrontLiveImportWalkLater
