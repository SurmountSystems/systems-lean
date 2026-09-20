/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live HostImportGraphMods.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveImportModsSource. Not occupancy name 50. Not mill 70.
  Greppable: SYSTEMS_LEAN_HOST, PARSE-LIVE-IMPORT-MODS, liveImportModsSource,
  HOST-FRONT-LIVE-IMPORT-MODS, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveImportModsSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveImportMods

/-- Dual-pinned live HostImportGraphMods.lean bytes (must match on-disk file).
    Greppable: liveImportModsSource, PARSE-LIVE-IMPORT-MODS. -/
def liveImportModsSource : String := r#"/-
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

/-- ProductPathOwnershipInputs leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathOwnershipInputsMod. -/
def productPathOwnershipInputsMod : RealMod :=
  { name := "SystemsLean.ProductPathOwnershipInputs", imports := [] }

/-- ProductPathOwnershipInputsTheorems (imports ProductPathOwnershipInputs only).
    Greppable: productPathOwnershipInputsTheoremsMod. -/
def productPathOwnershipInputsTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathOwnershipInputsTheorems"
    imports := ["SystemsLean.ProductPathOwnershipInputs"] }

/-- ProductPathPerform leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathPerformMod. -/
def productPathPerformMod : RealMod :=
  { name := "SystemsLean.ProductPathPerform", imports := [] }

/-- ProductPathPerformTheorems (imports ProductPathPerform only).
    Greppable: productPathPerformTheoremsMod. -/
def productPathPerformTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathPerformTheorems"
    imports := ["SystemsLean.ProductPathPerform"] }

/-- ProductPathPerformStep leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathPerformStepMod. -/
def productPathPerformStepMod : RealMod :=
  { name := "SystemsLean.ProductPathPerformStep", imports := [] }

/-- ProductPathPerformStepTheorems (imports ProductPathPerformStep only).
    Greppable: productPathPerformStepTheoremsMod. -/
def productPathPerformStepTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathPerformStepTheorems"
    imports := ["SystemsLean.ProductPathPerformStep"] }

/-- ProductPathReadSsot leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathReadSsotMod. -/
def productPathReadSsotMod : RealMod :=
  { name := "SystemsLean.ProductPathReadSsot", imports := [] }

/-- ProductPathReadSsotTheorems (imports ProductPathReadSsot only).
    Greppable: productPathReadSsotTheoremsMod. -/
def productPathReadSsotTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathReadSsotTheorems"
    imports := ["SystemsLean.ProductPathReadSsot"] }

/-- ProductPathComposePlan leaf (SelfApplyFs ProductPath pure leaf).
    Greppable: productPathComposePlanMod. -/
def productPathComposePlanMod : RealMod :=
  { name := "SystemsLean.ProductPathComposePlan", imports := [] }

/-- ProductPathComposePlanTheorems (imports ProductPathComposePlan only).
    Greppable: productPathComposePlanTheoremsMod. -/
def productPathComposePlanTheoremsMod : RealMod :=
  { name := "SystemsLean.ProductPathComposePlanTheorems"
    imports := ["SystemsLean.ProductPathComposePlan"] }

/-- Capable leaf (SelfApplyFs freestanding-capable gap pure leaf).
    Greppable: capableMod. -/
def capableMod : RealMod :=
  { name := "SystemsLean.Capable", imports := [] }

/-- CapableTheorems (imports Capable only).
    Greppable: capableTheoremsMod. -/
def capableTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableTheorems"
    imports := ["SystemsLean.Capable"] }

/-- CapableStepContract leaf (SelfApplyFs pure leaf).
    Greppable: capableStepContractMod. -/
def capableStepContractMod : RealMod :=
  { name := "SystemsLean.CapableStepContract", imports := [] }

/-- CapableStepContractTheorems (imports CapableStepContract only).
    Greppable: capableStepContractTheoremsMod. -/
def capableStepContractTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableStepContractTheorems"
    imports := ["SystemsLean.CapableStepContract"] }

/-- InstallOut leaf (SelfApplyFs pure leaf).
    Greppable: installOutMod. -/
def installOutMod : RealMod :=
  { name := "SystemsLean.InstallOut", imports := [] }

/-- InstallOutTheorems (imports InstallOut only).
    Greppable: installOutTheoremsMod. -/
def installOutTheoremsMod : RealMod :=
  { name := "SystemsLean.InstallOutTheorems"
    imports := ["SystemsLean.InstallOut"] }

/-- OfficialPath leaf (SelfApplyFs pure leaf).
    Greppable: officialPathMod. -/
def officialPathMod : RealMod :=
  { name := "SystemsLean.OfficialPath", imports := [] }

/-- OfficialPathTheorems (imports OfficialPath only).
    Greppable: officialPathTheoremsMod. -/
def officialPathTheoremsMod : RealMod :=
  { name := "SystemsLean.OfficialPathTheorems"
    imports := ["SystemsLean.OfficialPath"] }

/-- PerformEvidence leaf (SelfApplyFs pure leaf).
    Greppable: performEvidenceMod. -/
def performEvidenceMod : RealMod :=
  { name := "SystemsLean.PerformEvidence", imports := [] }

/-- PerformEvidenceTheorems (imports PerformEvidence only).
    Greppable: performEvidenceTheoremsMod. -/
def performEvidenceTheoremsMod : RealMod :=
  { name := "SystemsLean.PerformEvidenceTheorems"
    imports := ["SystemsLean.PerformEvidence"] }

/-- CapableRead leaf (SelfApplyFs pure leaf).
    Greppable: capableReadMod. -/
def capableReadMod : RealMod :=
  { name := "SystemsLean.CapableRead", imports := [] }

/-- CapableReadTheorems (imports CapableRead only).
    Greppable: capableReadTheoremsMod. -/
def capableReadTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableReadTheorems"
    imports := ["SystemsLean.CapableRead"] }

/-- CapableCompose leaf (SelfApplyFs pure leaf).
    Greppable: capableComposeMod. -/
def capableComposeMod : RealMod :=
  { name := "SystemsLean.CapableCompose", imports := [] }

/-- CapableComposeTheorems (imports CapableCompose only).
    Greppable: capableComposeTheoremsMod. -/
def capableComposeTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableComposeTheorems"
    imports := ["SystemsLean.CapableCompose"] }

/-- CapableFullBar leaf (SelfApplyFs pure leaf).
    Greppable: capableFullBarMod. -/
def capableFullBarMod : RealMod :=
  { name := "SystemsLean.CapableFullBar", imports := [] }

/-- CapableFullBarTheorems (imports CapableFullBar only).
    Greppable: capableFullBarTheoremsMod. -/
def capableFullBarTheoremsMod : RealMod :=
  { name := "SystemsLean.CapableFullBarTheorems"
    imports := ["SystemsLean.CapableFullBar"] }

/-- DualEqWriteCapableGap leaf (SelfApplyFs DualEqWrite pure leaf).
    Greppable: dualEqWriteCapableGapMod. -/
def dualEqWriteCapableGapMod : RealMod :=
  { name := "SystemsLean.DualEqWriteCapableGap", imports := [] }

/-- DualEqWriteCapableGapTheorems (imports DualEqWriteCapableGap only).
    Greppable: dualEqWriteCapableGapTheoremsMod. -/
def dualEqWriteCapableGapTheoremsMod : RealMod :=
  { name := "SystemsLean.DualEqWriteCapableGapTheorems"
    imports := ["SystemsLean.DualEqWriteCapableGap"] }

/-- DualEqWriteClosePath leaf (SelfApplyFs DualEqWrite pure leaf).
    Greppable: dualEqWriteClosePathMod. -/
def dualEqWriteClosePathMod : RealMod :=
  { name := "SystemsLean.DualEqWriteClosePath", imports := [] }

/-- DualEqWriteClosePathTheorems (imports DualEqWriteClosePath only).
    Greppable: dualEqWriteClosePathTheoremsMod. -/
def dualEqWriteClosePathTheoremsMod : RealMod :=
  { name := "SystemsLean.DualEqWriteClosePathTheorems"
    imports := ["SystemsLean.DualEqWriteClosePath"] }

/-- DualEqWriteParity leaf (SelfApplyFs DualEqWrite pure leaf).
    Greppable: dualEqWriteParityMod. -/
def dualEqWriteParityMod : RealMod :=
  { name := "SystemsLean.DualEqWriteParity", imports := [] }

/-- DualEqWriteParityTheorems (imports DualEqWriteParity only).
    Greppable: dualEqWriteParityTheoremsMod. -/
def dualEqWriteParityTheoremsMod : RealMod :=
  { name := "SystemsLean.DualEqWriteParityTheorems"
    imports := ["SystemsLean.DualEqWriteParity"] }


/-- OfficialRetire leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: officialRetireMod. -/
def officialRetireMod : RealMod :=
  { name := "SystemsLean.OfficialRetire", imports := [] }

/-- OfficialRetireTheorems (imports OfficialRetire only).
    Greppable: officialRetireTheoremsMod. -/
def officialRetireTheoremsMod : RealMod :=
  { name := "SystemsLean.OfficialRetireTheorems"
    imports := ["SystemsLean.OfficialRetire"] }

/-- OwnershipClaimed leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: ownershipClaimedMod. -/
def ownershipClaimedMod : RealMod :=
  { name := "SystemsLean.OwnershipClaimed", imports := [] }

/-- OwnershipClaimedTheorems (imports OwnershipClaimed only).
    Greppable: ownershipClaimedTheoremsMod. -/
def ownershipClaimedTheoremsMod : RealMod :=
  { name := "SystemsLean.OwnershipClaimedTheorems"
    imports := ["SystemsLean.OwnershipClaimed"] }

/-- PerformClaimed leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: performClaimedMod. -/
def performClaimedMod : RealMod :=
  { name := "SystemsLean.PerformClaimed", imports := [] }

/-- PerformClaimedTheorems (imports PerformClaimed only).
    Greppable: performClaimedTheoremsMod. -/
def performClaimedTheoremsMod : RealMod :=
  { name := "SystemsLean.PerformClaimedTheorems"
    imports := ["SystemsLean.PerformClaimed"] }

/-- StepContractFull leaf (SelfApplyFs claim-tip pure leaf).
    Greppable: stepContractFullMod. -/
def stepContractFullMod : RealMod :=
  { name := "SystemsLean.StepContractFull", imports := [] }

/-- StepContractFullTheorems (imports StepContractFull only).
    Greppable: stepContractFullTheoremsMod. -/
def stepContractFullTheoremsMod : RealMod :=
  { name := "SystemsLean.StepContractFullTheorems"
    imports := ["SystemsLean.StepContractFull"] }
end SystemsLean.HostImportGraph
"#

end SystemsLean.HostFrontLiveImportMods
