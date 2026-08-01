/-
  SYSTEMS_LEAN_HOST partial -- Systems Lean package root (classic elaborator).
  Imports Mult + MultTheorems + Linear + LinearTheorems + Types + TypesTheorems + ordered IR program + IrProgramTheorems + Erasure + ErasureTheorems + Extract +
  ExtractTheorems +
  IrGraph + IrGraphTheorems + HostCompose + HostComposeTheorems + EmitPlan + EmitPlanScaffold + EmitApply + EmitApplyScaffold + EmitBody + EmitBanner + EmitBannerScaffold + CompilePath + CompilePathBody + CompilePathErasure + CompilePathPlan + CompilePathApply + CompilePathGraph + CompilePathCompose + CompilePathMult + FirstSurface + MultSubsetEmit + MultSubsetRebuild + MultFsDeepen + CompilePathLinear + LinearSubsetEmit + LinearSubsetRebuild + CompilePathTypes + TypesSubsetEmit + TypesSubsetRebuild + CompilePathProgram + ProgramSubsetEmit + ProgramSubsetRebuild + CompilePathExtract + ExtractSubsetEmit + ExtractSubsetRebuild + ErasureSubsetEmit + ErasureSubsetRebuild + GraphSubsetEmit + GraphSubsetRebuild + ComposeSubsetEmit + ComposeSubsetRebuild +
  JoinMap + JoinMapTheorems + SelfHost + SelfHostTheorems + SurfaceMatrix + SurfaceMatrixTheorems + KernelMult + KernelMultTheorems + EmitMult + EmitMultScaffold + EmitLinear + EmitLinearScaffold +
  EmitErasure + EmitErasureScaffold + EmitExtract + EmitExtractScaffold + EmitTypes + EmitTypesScaffold + EmitProgram + EmitProgramScaffold + EmitGraph + EmitGraphScaffold + EmitCompose + EmitComposeScaffold +
  ParityMult + ParityMultTheorems +
  KernelLinear + KernelLinearTheorems + ParityLinear + ParityLinearTheorems + KernelTypes + KernelTypesTheorems + ParityTypes + ParityTypesTheorems + KernelProgram +
  KernelProgramTheorems +
  ParityProgram + ParityProgramTheorems + KernelEmit + KernelEmitTheorems + ParityEmit + ParityEmitTheorems + SelfApply + SelfApplyTheorems + SelfApplyFs + LlvmHold + LlvmHoldTheorems +

  InventoryClose + InventoryCloseTheorems + ProductPath + ProductPathTheorems + DualResidual +
  DualResidualTheorems + ProbeWire + ProbeWireTheorems +
  SpecProof + SpecProofTheorems + SelfHostBody + SelfHostBodyTheorems host modules
  (unit-surface markers live on those files).
  SKELETON package root only (import shell; not freestanding residual free).
  Not freestanding residual free. Not product C. Not PROVABLY.
  Not freestanding emit residual free. Not llvm unlocked (SH6 hold).
  Inventory close is readiness only (not residual free).
  Product path is readiness only (not freestanding product self-host complete).
  Dual residual honesty only (host elaborator residual vs product residual;
  neither forged free).
  Probe-vs-wire honesty only (hosted behavioral probe smoke debt vs product
  freestanding wire; probe green is not residual free).
  Spec-proof separation honesty only (readable specs stated; proof complete
  not forged; proofs do not retire tests).
  Self-host body path only (defined freestanding compile step; complete stays
  false; residual free stays false).
  Module: SystemsLean
-/

import SystemsLean.Mult
import SystemsLean.MultTheorems
import SystemsLean.Linear
import SystemsLean.LinearTheorems
import SystemsLean.Types
import SystemsLean.TypesTheorems
import SystemsLean.IrProgram
import SystemsLean.IrProgramTheorems
import SystemsLean.IrGraph
import SystemsLean.IrGraphTheorems
import SystemsLean.Erasure
import SystemsLean.ErasureTheorems
import SystemsLean.Extract
import SystemsLean.ExtractTheorems
import SystemsLean.HostCompose
import SystemsLean.HostComposeTheorems
import SystemsLean.EmitPlan
import SystemsLean.EmitPlanScaffold
import SystemsLean.EmitApply
import SystemsLean.EmitApplyScaffold
import SystemsLean.EmitBody
import SystemsLean.EmitBodyScaffold
import SystemsLean.EmitBanner
import SystemsLean.EmitBannerScaffold
import SystemsLean.CompilePath
import SystemsLean.CompilePathBody
import SystemsLean.CompilePathErasure
import SystemsLean.CompilePathPlan
import SystemsLean.CompilePathApply
import SystemsLean.CompilePathGraph
import SystemsLean.CompilePathCompose
import SystemsLean.CompilePathMult
import SystemsLean.FirstSurface
import SystemsLean.MultSubsetEmit
import SystemsLean.MultSubsetRebuild
import SystemsLean.MultFsDeepen
import SystemsLean.CompilePathLinear
import SystemsLean.LinearSubsetEmit
import SystemsLean.LinearSubsetRebuild
import SystemsLean.CompilePathTypes
import SystemsLean.TypesSubsetEmit
import SystemsLean.TypesSubsetRebuild
import SystemsLean.CompilePathProgram
import SystemsLean.ProgramSubsetEmit
import SystemsLean.ProgramSubsetRebuild
import SystemsLean.CompilePathExtract
import SystemsLean.ExtractSubsetEmit
import SystemsLean.ExtractSubsetRebuild
import SystemsLean.ErasureSubsetEmit
import SystemsLean.ErasureSubsetRebuild
import SystemsLean.GraphSubsetEmit
import SystemsLean.GraphSubsetRebuild
import SystemsLean.ComposeSubsetEmit
import SystemsLean.ComposeSubsetRebuild
import SystemsLean.JoinMap
import SystemsLean.JoinMapTheorems
import SystemsLean.SelfHost
import SystemsLean.SelfHostTheorems
import SystemsLean.SurfaceMatrix
import SystemsLean.SurfaceMatrixTheorems
import SystemsLean.KernelMult
import SystemsLean.KernelMultTheorems
import SystemsLean.EmitMult
import SystemsLean.EmitMultScaffold
import SystemsLean.EmitLinear
import SystemsLean.EmitLinearScaffold
import SystemsLean.EmitErasure
import SystemsLean.EmitErasureScaffold
import SystemsLean.EmitExtract
import SystemsLean.EmitExtractScaffold
import SystemsLean.EmitTypes
import SystemsLean.EmitTypesScaffold
import SystemsLean.EmitProgram
import SystemsLean.EmitProgramScaffold
import SystemsLean.EmitGraph
import SystemsLean.EmitGraphScaffold
import SystemsLean.EmitCompose
import SystemsLean.EmitComposeScaffold
import SystemsLean.ParityMult
import SystemsLean.ParityMultTheorems
import SystemsLean.KernelLinear
import SystemsLean.KernelLinearTheorems
import SystemsLean.ParityLinear
import SystemsLean.ParityLinearTheorems
import SystemsLean.KernelTypes
import SystemsLean.KernelTypesTheorems
import SystemsLean.ParityTypes
import SystemsLean.ParityTypesTheorems
import SystemsLean.KernelProgram
import SystemsLean.KernelProgramTheorems
import SystemsLean.ParityProgram
import SystemsLean.ParityProgramTheorems
import SystemsLean.KernelEmit
import SystemsLean.KernelEmitTheorems
import SystemsLean.ParityEmit
import SystemsLean.ParityEmitTheorems
import SystemsLean.SelfApply
import SystemsLean.SelfApplyTheorems
import SystemsLean.SelfApplyFs
import SystemsLean.LlvmHold
import SystemsLean.LlvmHoldTheorems
import SystemsLean.InventoryClose
import SystemsLean.InventoryCloseTheorems
import SystemsLean.ProductPath
import SystemsLean.ProductPathTheorems
import SystemsLean.DualResidual
import SystemsLean.DualResidualTheorems
import SystemsLean.ProbeWire
import SystemsLean.ProbeWireTheorems
import SystemsLean.SpecProof
import SystemsLean.SpecProofTheorems
import SystemsLean.SelfHostBody
import SystemsLean.SelfHostBodyTheorems
