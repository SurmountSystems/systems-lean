/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphMods.lean bytes, first half.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveHostImportGraphModsSource. Not occupancy name 50.
  Not mill remill. Mill stays 69 of 69.
  This wrap dual-pins HostImportGraphMods.lean only, first half.
  Do not steal HostFrontLiveHostImportGraphModel (liveRel is
  HostImportGraphModel.lean).
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-HOST-IMPORT-GRAPH-MODS,
  liveHostImportGraphModsSource0, HOST-FRONT-LIVE-HOST-IMPORT-GRAPH-MODS,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveHostImportGraphModsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveHostImportGraphMods

/-- Dual-pinned live HostImportGraphMods.lean bytes, first half.
    Concatenate liveHostImportGraphModsSource0 then liveHostImportGraphModsSource1
    before parse. Greppable: liveHostImportGraphModsSource0,
    PARSE-LIVE-HOST-IMPORT-GRAPH-MODS. -/
def liveHostImportGraphModsSource0 : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- HostImportGraph RealMod fixtures Mult..StepContractFull.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Long-file peel companion. Namespace SystemsLean.HostImportGraph.
  Non-claims: PARTIAL-STRUCTURAL; Not freestanding residual free; Not PROVABLY;
  Host elaborator residual remains.
  Greppable: SYSTEMS_LEAN_HOST, HOST-IMPORT-GRAPH, HostImportGraphMods, multLeafMod,
  hostComposeMod, emitMultMod, parityMultMod, stepContractFullTheoremsMod.
  Module: SystemsLean.HostImportGraphMods
  UNIT_SURFACE host surface, MULT-0, MULT-1, MULT-OMEGA (peer Mult-first cite).
  Red/green: lake build SystemsLean.HostImportGraphMods; just systems-host.
  Not freestanding residual free. Not freestanding emit. Not PROVABLY. Host elaborator residual remains.
-/
import SystemsLean.HostImportGraphModel
namespace SystemsLean.HostImportGraph

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

"#

end SystemsLean.HostFrontLiveHostImportGraphMods
