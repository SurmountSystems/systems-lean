/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmLinearSsa.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmLinearSsaSource. Not occupancy name 50.
  Not mill 62 remill. Mill stays 69 of 69.
  This wrap parses the library LlvmLinearSsa.lean. Not the mill entry
  LlvmLinearSsaMain.lean. Not Linear.lean (QTT Linear module).
  Not IrGraph.lean. Not ComposeSubsetEmit.lean.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not write out/llvm-ir. Dests skipped. Not a mill remill.
  Unique needles (trailing newline, each once in the library):
  import SystemsLean.KernelLinear
  namespace SystemsLean.LlvmLinearSsa
  def stageId : String := "SLAKE_LLVM_LINEAR_SSA_V0"
  def hostId : String := "HOST-LLVM-LINEAR-SSA"
  def llvmLinearSsaFullBackendClaimed : Bool := false
  end SystemsLean.LlvmLinearSsa
  PARSE-LIVE-LLVM-LINEAR-SSA
  HOST-FRONT-LIVE-LLVM-LINEAR-SSA
  LLVM-LINEAR-SSA
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmLinearSsaSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmLinearSsaSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmLinearSsa

/-- Dual-pinned live LlvmLinearSsa.lean bytes (must match on-disk file).
    Greppable: liveLlvmLinearSsaSource, PARSE-LIVE-LLVM-LINEAR-SSA. -/
def liveLlvmLinearSsaSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LLVM Linear SSA lower (one Linear program-graph
  band to SSA-shaped IR under out/llvm-ir). Generator-owned Linear-band SSA
  form from KernelLinear lower + Linear SSOT. Composes LlvmHold: living
  llvmUnlocked true after unlock residual; local unlock pin false.
  Composes LlvmLinearText unit IR peer + LlvmMultSsa Mult SSA peer +
  LlvmEmitPath design+stub.
  Not production LLVM backend. Not full CFG/dominance pipeline.
  Not Rust-native link success. Not freestanding residual free re-open.
  Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-LINEAR-SSA, SLAKE_LLVM_LINEAR_SSA,
  SLAKE_LLVM_LINEAR_SSA_V0, HOST-HOST-LLVM-LINEAR-SSA, llvmLinearSsaReady,
  llvmLinearSsaFinishedClaimed, llvmLinearSsaPackageOk, llvmLinearSsaWroteExpected,
  llvmLinearSsaKeepsLlvmLocked, llvmLinearSsaDoesNotUnlockLlvm,
  llvmLinearSsaLlvmUnlocked, llvmLinearSsaLocalUnlockFalse,
  llvmLinearSsaPartialClaimed, llvmLinearSsaFullBackendClaimed,
  justRecipeLlvmLinearSsa, llvm-linear-ssa, out/llvm-ir, slake_linear_ssa.ll,
  linearSsaPackage, llvmLinearSsaWrite, IO.FS.writeFile, Linear, MULT-1,
  LINEAR-EXACT-ONCE, KernelLinear, SELF-HOST-KERNEL-LINEAR, lowerLinearKernel,
  ORDERED-IR-PROGRAM, SSA-SHAPED, phi, LlvmHold, llvmUnlocked, LlvmEmitPath,
  LlvmLinearText, LlvmMultSsa, HOST-LLVM-EMIT-PATH, HOST-LLVM-LINEAR-TEXT,
  HOST-LLVM-LINEAR-SSA-SMOKE, HOST-LLVM-LINEAR-SSA-THEOREM, UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmLinearSsa
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-linear-ssa
  greps of out/llvm-ir/slake_linear_ssa.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmLinearSsa; lake exe slake-llvm-linear-ssa;
  just llvm-linear-ssa; just systems-llvm-ir.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock claim.
  Host elaborator residual remains. Linear SSA partial only (not full backend).
-/

import SystemsLean.Mult
import SystemsLean.Linear
import SystemsLean.KernelLinear
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmLinearText
import SystemsLean.LlvmMultSsa

namespace SystemsLean.LlvmLinearSsa

open SystemsLean.Mult
open SystemsLean.KernelLinear (linearKernelReady linearKernelOk lowerLinearKernel)

/-! ### HOST-LLVM-LINEAR-SSA / SLAKE_LLVM_LINEAR_SSA

  Linear program-graph band lowered to SSA-shaped LLVM IR from KernelLinear
  (one MULT-1 linear node) plus Linear SSOT honesty. Written under
  out/llvm-ir/slake_linear_ssa.ll. Partial SSA form (block labels + phi +
  ordered SSA defs). Does not unlock llvm. Does not claim full CFG/dominance.
-/

/-- Greppable primary stage id (LLVM Linear SSA lower gate). -/
def stageId : String := "SLAKE_LLVM_LINEAR_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-LINEAR-SSA"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-LINEAR-SSA"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-LINEAR-SSA"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmLinearSsa, llvm-linear-ssa. -/
def justRecipeLlvmLinearSsa : String := "llvm-linear-ssa"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmLinearSsa

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-linear-ssa. -/
def lakeExeName : String := "slake-llvm-linear-ssa"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Linear SSA IR artifact basename under out/llvm-ir.
    Greppable: linearSsaBasename, slake_linear_ssa.ll. -/
def linearSsaBasename : String := "slake_linear_ssa.ll"

/-- Linear host SSOT module path cite.
    Greppable: linearModuleCite, Linear.lean. -/
def linearModuleCite : String := "src/systems/SystemsLean/Linear.lean"

/-- Kernel Linear program-graph cite (one-node Linear band).
    Greppable: kernelLinearModuleCite, KernelLinear.lean. -/
def kernelLinearModuleCite : String :=
  "src/systems/SystemsLean/KernelLinear.lean"

/-- Linear unit IR peer module cite.
    Greppable: llvmLinearTextModuleCite, LlvmLinearText. -/
def llvmLinearTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmLinearText.lean"

/-- Mult SSA peer module cite.
    Greppable: llvmMultSsaModuleCite, LlvmMultSsa. -/
def llvmMultSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmMultSsa.lean"

/-- Emit path module cite.
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Linear SSA partial).
    Greppable: llvmLinearSsaFinishedClaimed. -/
def llvmLinearSsaFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmLinearSsaLlvmUnlocked, llvmLinearSsaLocalUnlockFalse. -/
def llvmLinearSsaLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmLinearSsaLocalUnlockFalse. -/
def llvmLinearSsaLocalUnlockFalse : Bool := !llvmLinearSsaLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmLinearSsaKeepsLlvmLocked. -/
def llvmLinearSsaKeepsLlvmLocked : Bool :=
  !llvmLinearSsaLlvmUnlocked

/-- Linear SSA lower does not unlock llvm (fail-closed).
    Greppable: llvmLinearSsaDoesNotUnlockLlvm. -/
def llvmLinearSsaDoesNotUnlockLlvm : Bool :=
  llvmLinearSsaKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmLinearText.llvmLinearTextKeepsLlvmLocked
    && LlvmMultSsa.llvmMultSsaKeepsLlvmLocked

/-- This residual claims Linear-band SSA-shaped IR partial only.
    Greppable: llvmLinearSsaPartialClaimed, SSA-SHAPED. -/
def llvmLinearSsaPartialClaimed : Bool := true

/-- Full production LLVM backend claim -- MUST stay false.
    Greppable: llvmLinearSsaFullBackendClaimed. -/
def llvmLinearSsaFullBackendClaimed : Bool := false

/-- Full CFG/dominance production pipeline claim -- MUST stay false.
    Greppable: llvmLinearSsaCfgProductionClaimed. -/
def llvmLinearSsaCfgProductionClaimed : Bool := false

/-- Local honesty: not freestanding residual free re-open. -/
def llvmLinearSsaResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmLinearSsaProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmLinearSsaProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY unlock work claim. -/
def llvmLinearSsaProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmLinearSsaProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmLinearSsaRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmLinearSsaLlvmAsClaimed : Bool := false

/-- MULT-1 grade name from Mult SSOT.
    Greppable: multGrade1Name, MULT-1. -/
def multGrade1Name : String := Mult.name Mult.mult1

/-- Linear exact-once honesty id.
    Greppable: linearExactOnceId, LINEAR-EXACT-ONCE. -/
def linearExactOnceId : String := "LINEAR-EXACT-ONCE"

/-- Kernel Linear surface id cite.
    Greppable: kernelLinearId, SELF-HOST-KERNEL-LINEAR. -/
def kernelLinearId : String := "SELF-HOST-KERNEL-LINEAR"

/-- Ordered IR program honesty id.
    Greppable: orderedIrProgramId, ORDERED-IR-PROGRAM. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"

/-- SSA-shaped honesty id (partial form; not full production SSA pipeline).
    Greppable: ssaShapedId, SSA-SHAPED. -/
def ssaShapedId : String := "SSA-SHAPED"

/-- Linear SSA header comments (stage + Linear/KernelLinear SSOT + non-claims).
    Greppable: linearSsaBanner. -/
def linearSsaBanner : String :=
  "; SLAKE_LLVM_LINEAR_SSA_V0 / HOST-LLVM-LINEAR-SSA\n"
    ++ "; Generator-owned Linear program-graph SSA-shaped IR from KernelLinear + Linear SSOT\n"
    ++ "; Linear focus: " ++ multGrade1Name ++ " " ++ linearExactOnceId ++ "\n"
    ++ "; " ++ kernelLinearId ++ " " ++ orderedIrProgramId ++ " "
    ++ ssaShapedId ++ "\n"
    ++ "; Kernel Linear SSOT: src/systems/SystemsLean/KernelLinear.lean\n"
    ++ "; Linear SSOT: src/systems/SystemsLean/Linear.lean\n"
    ++ "; Path: out/llvm-ir/slake_linear_ssa.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmLinearText Linear unit IR; LlvmMultSsa Mult SSA partial; LlvmEmitPath design+stub\n"
    ++ "; Recipe: just llvm-linear-ssa / lake exe slake-llvm-linear-ssa\n"
    ++ "; Linear SSA partial: block labels + phi + ordered SSA node defs for Linear band only\n"
    ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Linear MULT-1 tag constant.
    Greppable: linearSsaConstants, MULT-1. -/
def linearSsaConstants : String :=
  "; Linear MULT-1 tag constant (exact-once resource band)\n"
    ++ "@slake_linear_ssa_tag_1 = private unnamed_addr constant i32 1, align 4 ; "
    ++ multGrade1Name ++ "\n"
    ++ "\n"

/-- SSA-shaped Linear live flag lower: block labels + phi (partial SSA form).
    live_ix 1 -> mint/live path; other -> reject (LINEAR-EXACT-ONCE fail-closed).
    Greppable: linearSsaLivePhi, phi, SSA-SHAPED, slake_linear_ssa_live_flag. -/
def linearSsaLivePhi : String :=
  "; SSA-SHAPED Linear live-flag lower (partial; Linear band only; not full CFG/dominance)\n"
    ++ "; LINEAR-EXACT-ONCE: only live_ix == 1 is live; else reject (-1)\n"
    ++ "define i32 @slake_linear_ssa_live_flag(i32 %live_ix) {\n"
    ++ "entry:\n"
    ++ "  %is1 = icmp eq i32 %live_ix, 1\n"
    ++ "  br i1 %is1, label %bb_live, label %bb_reject\n"
    ++ "\n"
    ++ "bb_live: ; " ++ multGrade1Name ++ " / LINEAR live token\n"
    ++ "  %t1 = add i32 0, 1\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_reject: ; not live / fail closed\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "merge:\n"
    ++ "  %flag = phi i32 [ %t1, %bb_live ], [ -1, %bb_reject ]\n"
    ++ "  ret i32 %flag\n"
    ++ "}\n"
    ++ "\n"

/-- Ordered Linear kernel program as sequential SSA defs (KernelLinear one node).
    Greppable: linearSsaKernelBand, SELF-HOST-KERNEL-LINEAR, ORDERED-IR-PROGRAM. -/
def linearSsaKernelBand : String :=
  "; ORDERED-IR-PROGRAM Linear kernel band (SELF-HOST-KERNEL-LINEAR lowerLinearKernel)\n"
    ++ "; One node: MULT-1 linear exact-once\n"
    ++ "; SSA-shaped: node fields are distinct SSA values (not full CFG pipeline)\n"
    ++ "define i1 @slake_linear_ssa_kernel_band_ready() {\n"
    ++ "entry:\n"
    ++ "  ; node0: tag=1 mult=MULT-1 kind=LINEAR\n"
    ++ "  %n0_tag = add i32 0, 1\n"
    ++ "  %n0_mult = add i32 0, 1\n"
    ++ "  %n0_kind = add i32 0, 1\n"
    ++ "  ; length honesty: one Linear kernel node\n"
    ++ "  %len = add i32 0, 1\n"
    ++ "  %ok = icmp eq i32 %len, 1\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed Linear live validity (1 = live only).
    Greppable: linearSsaIsLive, slake_linear_ssa_is_live. -/
def linearSsaIsLive : String :=
  "; Fail-closed live check (HostCompose linear live-flag: only 1 is live)\n"
    ++ "define i1 @slake_linear_ssa_is_live(i32 %flag) {\n"
    ++ "entry:\n"
    ++ "  %ok = icmp eq i32 %flag, 1\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Linear SSA package text (banner + constants + live phi + kernel + is_live).
    Greppable: linearSsaPackage, slake_linear_ssa.ll. -/
def linearSsaPackage : String :=
  linearSsaBanner ++ linearSsaConstants ++ linearSsaLivePhi
    ++ linearSsaKernelBand ++ linearSsaIsLive

/-- Surface ids + path cites + Linear SSOT + KernelLinear ready ok. -/
def llvmLinearSsaSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_LINEAR_SSA_V0")
    && (hostId == "HOST-LLVM-LINEAR-SSA")
    && (surfaceId == "HOST-LLVM-LINEAR-SSA")
    && (surfaceAlias == "HOST-HOST-LLVM-LINEAR-SSA")
    && (justRecipeLlvmLinearSsa == "llvm-linear-ssa")
    && (justRecipe == "llvm-linear-ssa")
    && (lakeExeName == "slake-llvm-linear-ssa")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (linearSsaBasename == "slake_linear_ssa.ll")
    && (linearModuleCite == "src/systems/SystemsLean/Linear.lean")
    && (kernelLinearModuleCite
      == "src/systems/SystemsLean/KernelLinear.lean")
    && (llvmLinearTextModuleCite
      == "src/systems/SystemsLean/LlvmLinearText.lean")
    && (llvmMultSsaModuleCite
      == "src/systems/SystemsLean/LlvmMultSsa.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (multGrade1Name == "MULT-1")
    && (linearExactOnceId == "LINEAR-EXACT-ONCE")
    && (kernelLinearId == "SELF-HOST-KERNEL-LINEAR")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (ssaShapedId == "SSA-SHAPED")
    && linearKernelReady
    && linearKernelOk
    && lowerLinearKernel.isSome

/-- Package text honesty: Linear grade + stage + SSA defines present.
    Greppable: llvmLinearSsaPackageOk. -/
def llvmLinearSsaPackageOk : Bool :=
  llvmLinearSsaSurfaceOk
    && (linearSsaPackage
      == linearSsaBanner ++ linearSsaConstants ++ linearSsaLivePhi
        ++ linearSsaKernelBand ++ linearSsaIsLive)
    && (linearSsaBanner
      == "; SLAKE_LLVM_LINEAR_SSA_V0 / HOST-LLVM-LINEAR-SSA\n"
        ++ "; Generator-owned Linear program-graph SSA-shaped IR from KernelLinear + Linear SSOT\n"
        ++ "; Linear focus: MULT-1 LINEAR-EXACT-ONCE\n"
        ++ "; SELF-HOST-KERNEL-LINEAR ORDERED-IR-PROGRAM SSA-SHAPED\n"
        ++ "; Kernel Linear SSOT: src/systems/SystemsLean/KernelLinear.lean\n"
        ++ "; Linear SSOT: src/systems/SystemsLean/Linear.lean\n"
        ++ "; Path: out/llvm-ir/slake_linear_ssa.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmLinearText Linear unit IR; LlvmMultSsa Mult SSA partial; LlvmEmitPath design+stub\n"
        ++ "; Recipe: just llvm-linear-ssa / lake exe slake-llvm-linear-ssa\n"
        ++ "; Linear SSA partial: block labels + phi + ordered SSA node defs for Linear band only\n"
        ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Linear SSA equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmLinearSsaWrite
    (IO.FS.writeFile) + post-read equality + just llvm-linear-ssa greps.
    Greppable: llvmLinearSsaWroteExpected. -/
def llvmLinearSsaWroteExpected : Bool :=
  llvmLinearSsaPackageOk
    && (linearSsaPackage
      == linearSsaBanner ++ linearSsaConstants ++ linearSsaLivePhi
        ++ linearSsaKernelBand ++ linearSsaIsLive)

/-- Structural ready for LLVM Linear SSA lower residual.
    Greppable: llvmLinearSsaReady, HOST-LLVM-LINEAR-SSA, SLAKE_LLVM_LINEAR_SSA. -/
def llvmLinearSsaReady : Bool :=
  llvmLinearSsaFinishedClaimed
    && llvmLinearSsaPackageOk
    && llvmLinearSsaWroteExpected
    && llvmLinearSsaSurfaceOk
    && llvmLinearSsaKeepsLlvmLocked
    && llvmLinearSsaDoesNotUnlockLlvm
    && llvmLinearSsaLocalUnlockFalse
    && llvmLinearSsaPartialClaimed
    && !llvmLinearSsaLlvmUnlocked
    && !llvmLinearSsaFullBackendClaimed
    && !llvmLinearSsaCfgProductionClaimed
    && !llvmLinearSsaResidualFreeClaimed
    && !llvmLinearSsaProductSelfHostCompleteClaimed
    && !llvmLinearSsaProofCompleteClaimed
    && !llvmLinearSsaProvablyUnlockWorkClaimed
    && !llvmLinearSsaProductionReadyClaimed
    && !llvmLinearSsaRustNativeLinkClaimed
    && !llvmLinearSsaLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmLinearText.llvmLinearTextReady
    && !LlvmLinearText.llvmLinearTextLlvmUnlocked
    && LlvmMultSsa.llvmMultSsaReady
    && !LlvmMultSsa.llvmMultSsaLlvmUnlocked

/-! ### HOST-LLVM-LINEAR-SSA-THEOREM (readable statements) -/

theorem llvmLinearSsaFinishedClaimed_true :
    llvmLinearSsaFinishedClaimed = true :=
  rfl

theorem llvmLinearSsaLlvmUnlocked_false :
    llvmLinearSsaLlvmUnlocked = false :=
  rfl

theorem llvmLinearSsaPartialClaimed_true :
    llvmLinearSsaPartialClaimed = true :=
  rfl

theorem llvmLinearSsaFullBackendClaimed_false :
    llvmLinearSsaFullBackendClaimed = false :=
  rfl

theorem llvmLinearSsaCfgProductionClaimed_false :
    llvmLinearSsaCfgProductionClaimed = false :=
  rfl

theorem llvmLinearSsaKeepsLlvmLocked_true :
    llvmLinearSsaKeepsLlvmLocked = true := by
  native_decide

theorem llvmLinearSsaDoesNotUnlockLlvm_true :
    llvmLinearSsaDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmLinearSsaReady_true :
    llvmLinearSsaReady = true := by
  native_decide

theorem justRecipeLlvmLinearSsa_eq :
    justRecipeLlvmLinearSsa = "llvm-linear-ssa" :=
  rfl

theorem llvmLinearSsa_stageId_eq :
    stageId = "SLAKE_LLVM_LINEAR_SSA_V0" :=
  rfl

theorem llvmLinearSsa_hostId_eq :
    hostId = "HOST-LLVM-LINEAR-SSA" :=
  rfl

theorem llvmLinearSsa_mult1_eq :
    multGrade1Name = "MULT-1" :=
  rfl

theorem llvmLinearSsa_claims_false :
    llvmLinearSsaLlvmUnlocked = false
      && llvmLinearSsaFullBackendClaimed = false
      && llvmLinearSsaCfgProductionClaimed = false
      && llvmLinearSsaResidualFreeClaimed = false
      && llvmLinearSsaProductSelfHostCompleteClaimed = false
      && llvmLinearSsaProofCompleteClaimed = false
      && llvmLinearSsaProvablyUnlockWorkClaimed = false
      && llvmLinearSsaProductionReadyClaimed = false
      && llvmLinearSsaRustNativeLinkClaimed = false
      && llvmLinearSsaLlvmAsClaimed = false :=
  rfl

theorem llvmLinearSsaPackageOk_true :
    llvmLinearSsaPackageOk = true := by
  native_decide

theorem llvmLinearSsaWroteExpected_true :
    llvmLinearSsaWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-LINEAR-SSA-SMOKE (quick examples) -/

example : llvmLinearSsaFinishedClaimed = true := rfl
example : llvmLinearSsaLlvmUnlocked = false := rfl
example : llvmLinearSsaPartialClaimed = true := rfl
example : llvmLinearSsaFullBackendClaimed = false := rfl
example : llvmLinearSsaCfgProductionClaimed = false := rfl
example : llvmLinearSsaKeepsLlvmLocked = true := by native_decide
example : llvmLinearSsaDoesNotUnlockLlvm = true := by native_decide
example : llvmLinearSsaReady = true := by native_decide
example : justRecipeLlvmLinearSsa = "llvm-linear-ssa" := rfl
example : multGrade1Name = "MULT-1" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmLinearSsaLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmLinearText.llvmLinearTextReady = true := by native_decide
example : LlvmMultSsa.llvmMultSsaReady = true := by native_decide
example : linearSsaBasename = "slake_linear_ssa.ll" := rfl
example : ssaShapedId = "SSA-SHAPED" := rfl
example : kernelLinearId = "SELF-HOST-KERNEL-LINEAR" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Linear SSA IR lacks greppable honesty tokens. -/
def validateLinearSsaPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_LINEAR_SSA_V0"
    , "HOST-LLVM-LINEAR-SSA"
    , "MULT-1"
    , "LINEAR-EXACT-ONCE"
    , "SELF-HOST-KERNEL-LINEAR"
    , "ORDERED-IR-PROGRAM"
    , "SSA-SHAPED"
    , "phi i32"
    , "slake_linear_ssa_live_flag"
    , "slake_linear_ssa_kernel_band_ready"
    , "slake_linear_ssa_is_live"
    , "slake_linear_ssa_tag_1"
    , "bb_live"
    , "bb_reject"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_linear_ssa.ll"
    , "Not production LLVM backend"
    , "Not full CFG/dominance"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  if containsSub text "llvmUnlocked = true" then
    IO.eprintln s!"error: {label}: unexpected llvmUnlocked true claim"
    throw (IO.userError s!"{label}: unlock forge")
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected freestanding C emit stage"
    throw (IO.userError s!"{label}: freestanding stage")
  if containsSub text "full backend true" then
    IO.eprintln s!"error: {label}: unexpected full backend claim"
    throw (IO.userError s!"{label}: full backend forge")

/-- Write Linear SSA IR text under root/out/llvm-ir/slake_linear_ssa.ll.
    Greppable: llvmLinearSsaWrite, slake_linear_ssa.ll, IO.FS.writeFile. -/
def llvmLinearSsaWrite (root : System.FilePath) : IO Unit := do
  unless llvmLinearSsaReady do
    IO.eprintln s!"error: {stageId}: llvmLinearSsaReady false"
    throw (IO.userError "llvmLinearSsaReady false")
  unless llvmLinearSsaWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmLinearSsaWroteExpected false"
    throw (IO.userError "llvmLinearSsaWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / linearSsaBasename
  IO.println s!"== {stageId}: LLVM Linear SSA lower partial =="
  IO.println s!"  readyPin={llvmLinearSsaReady} llvmUnlocked={LlvmHold.llvmUnlocked} fullBackend={llvmLinearSsaFullBackendClaimed}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl linearSsaPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Linear SSA IR after write: {outLl}"
    throw (IO.userError "missing Linear SSA IR")
  if written != linearSsaPackage then
    IO.eprintln "error: Linear SSA IR written content mismatch"
    throw (IO.userError "Linear SSA IR mismatch")
  validateLinearSsaPackage linearSsaBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-LINEAR-SSA, SSA-SHAPED, phi, MULT-1"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Linear SSA IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmLinearSsaWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmLinearSsa
"#

end SystemsLean.HostFrontLiveLlvmLinearSsa
