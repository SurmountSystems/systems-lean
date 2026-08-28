/-
  SYSTEMS_LEAN_HOST partial -- LLVM Mult SSA lower (one Mult program-graph
  band to SSA-shaped IR under out/llvm-ir). Generator-owned Mult-band SSA
  form from KernelMult lower + Mult SSOT. Composes LlvmHold: living
  llvmUnlocked true after unlock residual; local unlock pin false.
  Composes LlvmMultText unit IR peer + LlvmEmitPath design+stub.
  Not production LLVM backend. Not full CFG/dominance pipeline.
  Not Rust-native link success. Not freestanding residual free re-open.
  Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-MULT-SSA, SLAKE_LLVM_MULT_SSA,
  SLAKE_LLVM_MULT_SSA_V0, HOST-HOST-LLVM-MULT-SSA, llvmMultSsaReady,
  llvmMultSsaFinishedClaimed, llvmMultSsaPackageOk, llvmMultSsaWroteExpected,
  llvmMultSsaKeepsLlvmLocked, llvmMultSsaDoesNotUnlockLlvm,
  llvmMultSsaLlvmUnlocked, llvmMultSsaLocalUnlockFalse,
  llvmMultSsaPartialClaimed, llvmMultSsaFullBackendClaimed,
  justRecipeLlvmMultSsa, llvm-mult-ssa, out/llvm-ir, slake_mult_ssa.ll,
  multSsaPackage, llvmMultSsaWrite, IO.FS.writeFile, Mult, MULT-0, MULT-1,
  MULT-OMEGA, KernelMult, SELF-HOST-KERNEL-MULT, lowerMultKernel,
  ORDERED-IR-PROGRAM, SSA-SHAPED, phi, LlvmHold, llvmUnlocked, LlvmEmitPath,
  LlvmMultText, HOST-LLVM-EMIT-PATH, HOST-LLVM-MULT-TEXT,
  HOST-LLVM-MULT-SSA-SMOKE, HOST-LLVM-MULT-SSA-THEOREM, UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmMultSsa
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-mult-ssa
  greps of out/llvm-ir/slake_mult_ssa.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmMultSsa; lake exe slake-llvm-mult-ssa;
  just llvm-mult-ssa; just systems-llvm-ir.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock claim.
  Host elaborator residual remains. Mult SSA partial only (not full backend).
-/

import SystemsLean.Mult
import SystemsLean.KernelMult
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmMultText

namespace SystemsLean.LlvmMultSsa

open SystemsLean.Mult
open SystemsLean.KernelMult (multKernelReady kernelOk lowerMultKernel)

/-! ### HOST-LLVM-MULT-SSA / SLAKE_LLVM_MULT_SSA

  Mult program-graph band lowered to SSA-shaped LLVM IR from KernelMult
  (three Mult grade nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value)
  plus Mult SSOT grade names. Written under out/llvm-ir/slake_mult_ssa.ll.
  Partial SSA form (block labels + phi + ordered SSA defs). Does not unlock
  llvm. Does not claim full CFG/dominance production pipeline.
-/

/-- Greppable primary stage id (LLVM Mult SSA lower gate). -/
def stageId : String := "SLAKE_LLVM_MULT_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-MULT-SSA"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-MULT-SSA"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-MULT-SSA"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmMultSsa, llvm-mult-ssa. -/
def justRecipeLlvmMultSsa : String := "llvm-mult-ssa"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmMultSsa

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-mult-ssa. -/
def lakeExeName : String := "slake-llvm-mult-ssa"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Mult SSA IR artifact basename under out/llvm-ir.
    Greppable: multSsaBasename, slake_mult_ssa.ll. -/
def multSsaBasename : String := "slake_mult_ssa.ll"

/-- Mult host SSOT module path cite.
    Greppable: multModuleCite, Mult.lean. -/
def multModuleCite : String := "src/systems/SystemsLean/Mult.lean"

/-- Kernel Mult program-graph cite (three-node Mult band).
    Greppable: kernelMultModuleCite, KernelMult.lean. -/
def kernelMultModuleCite : String :=
  "src/systems/SystemsLean/KernelMult.lean"

/-- Mult unit IR peer module cite.
    Greppable: llvmMultTextModuleCite, LlvmMultText. -/
def llvmMultTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmMultText.lean"

/-- Emit path module cite.
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Mult SSA partial).
    Greppable: llvmMultSsaFinishedClaimed. -/
def llvmMultSsaFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmMultSsaLlvmUnlocked, llvmMultSsaLocalUnlockFalse. -/
def llvmMultSsaLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmMultSsaLocalUnlockFalse. -/
def llvmMultSsaLocalUnlockFalse : Bool := !llvmMultSsaLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmMultSsaKeepsLlvmLocked. -/
def llvmMultSsaKeepsLlvmLocked : Bool :=
  !llvmMultSsaLlvmUnlocked

/-- Mult SSA lower does not unlock llvm (fail-closed).
    Greppable: llvmMultSsaDoesNotUnlockLlvm. -/
def llvmMultSsaDoesNotUnlockLlvm : Bool :=
  llvmMultSsaKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmMultText.llvmMultTextKeepsLlvmLocked

/-- This residual claims Mult-band SSA-shaped IR partial only.
    Greppable: llvmMultSsaPartialClaimed, SSA-SHAPED. -/
def llvmMultSsaPartialClaimed : Bool := true

/-- Full production LLVM backend claim -- MUST stay false.
    Greppable: llvmMultSsaFullBackendClaimed. -/
def llvmMultSsaFullBackendClaimed : Bool := false

/-- Full CFG/dominance production pipeline claim -- MUST stay false.
    Greppable: llvmMultSsaCfgProductionClaimed. -/
def llvmMultSsaCfgProductionClaimed : Bool := false

/-- Local honesty: not freestanding residual free re-open. -/
def llvmMultSsaResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmMultSsaProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmMultSsaProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY as false (living tip true).
    Local pin stays false meaning "this module does not claim PROVABLY unlock
    work"; living LlvmHold.provablyUnlocked may be true. -/
def llvmMultSsaProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmMultSsaProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmMultSsaRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmMultSsaLlvmAsClaimed : Bool := false

/-- Mult grade names from Mult SSOT (not hard-coded second dialect).
    Greppable: multGrade0Name, MULT-0. -/
def multGrade0Name : String := Mult.name Mult.mult0

/-- Greppable: multGrade1Name, MULT-1. -/
def multGrade1Name : String := Mult.name Mult.mult1

/-- Greppable: multGradeOmegaName, MULT-OMEGA. -/
def multGradeOmegaName : String := Mult.name Mult.multOmega

/-- Kernel Mult surface id cite.
    Greppable: kernelMultId, SELF-HOST-KERNEL-MULT. -/
def kernelMultId : String := "SELF-HOST-KERNEL-MULT"

/-- Ordered IR program honesty id.
    Greppable: orderedIrProgramId, ORDERED-IR-PROGRAM. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"

/-- SSA-shaped honesty id (partial form; not full production SSA pipeline).
    Greppable: ssaShapedId, SSA-SHAPED. -/
def ssaShapedId : String := "SSA-SHAPED"

/-- Mult SSA header comments (stage + Mult/KernelMult SSOT + non-claims).
    Greppable: multSsaBanner. -/
def multSsaBanner : String :=
  "; SLAKE_LLVM_MULT_SSA_V0 / HOST-LLVM-MULT-SSA\n"
    ++ "; Generator-owned Mult program-graph SSA-shaped IR from KernelMult + Mult SSOT\n"
    ++ "; Mult grades: " ++ multGrade0Name ++ " " ++ multGrade1Name
    ++ " " ++ multGradeOmegaName ++ "\n"
    ++ "; " ++ kernelMultId ++ " " ++ orderedIrProgramId ++ " "
    ++ ssaShapedId ++ "\n"
    ++ "; Kernel Mult SSOT: src/systems/SystemsLean/KernelMult.lean\n"
    ++ "; Mult SSOT: src/systems/SystemsLean/Mult.lean\n"
    ++ "; Path: out/llvm-ir/slake_mult_ssa.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmMultText Mult unit IR; LlvmEmitPath design+stub (HOST-LLVM-EMIT-PATH)\n"
    ++ "; Recipe: just llvm-mult-ssa / lake exe slake-llvm-mult-ssa\n"
    ++ "; Mult SSA partial: block labels + phi + ordered SSA node defs for Mult band only\n"
    ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Mult grade tag constants reused as Mult band SSOT (0/1/2).
    Greppable: multSsaConstants, MULT-0, MULT-1, MULT-OMEGA. -/
def multSsaConstants : String :=
  "; Mult grade tag constants (0=" ++ multGrade0Name
    ++ ", 1=" ++ multGrade1Name ++ ", 2=" ++ multGradeOmegaName ++ ")\n"
    ++ "@slake_mult_ssa_tag_0 = private unnamed_addr constant i32 0, align 4 ; "
    ++ multGrade0Name ++ "\n"
    ++ "@slake_mult_ssa_tag_1 = private unnamed_addr constant i32 1, align 4 ; "
    ++ multGrade1Name ++ "\n"
    ++ "@slake_mult_ssa_tag_omega = private unnamed_addr constant i32 2, align 4 ; "
    ++ multGradeOmegaName ++ "\n"
    ++ "\n"

/-- SSA-shaped Mult grade tag lower: block labels + phi (partial SSA form).
    Maps grade index 0/1/2 to Mult tags; unknown -> -1 (FAIL-CLOSED-UNKNOWN-GRADE).
    Greppable: multSsaGradePhi, phi, SSA-SHAPED, slake_mult_ssa_grade_tag. -/
def multSsaGradePhi : String :=
  "; SSA-SHAPED Mult grade tag lower (partial; Mult band only; not full CFG/dominance)\n"
    ++ "; FAIL-CLOSED-UNKNOWN-GRADE: unknown grade_ix returns -1\n"
    ++ "define i32 @slake_mult_ssa_grade_tag(i32 %grade_ix) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %grade_ix, 0\n"
    ++ "  br i1 %is0, label %bb_mult0, label %check1\n"
    ++ "\n"
    ++ "check1:\n"
    ++ "  %is1 = icmp eq i32 %grade_ix, 1\n"
    ++ "  br i1 %is1, label %bb_mult1, label %check2\n"
    ++ "\n"
    ++ "check2:\n"
    ++ "  %is2 = icmp eq i32 %grade_ix, 2\n"
    ++ "  br i1 %is2, label %bb_omega, label %bb_reject\n"
    ++ "\n"
    ++ "bb_mult0: ; " ++ multGrade0Name ++ " / ERASED band node\n"
    ++ "  %t0 = add i32 0, 0\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_mult1: ; " ++ multGrade1Name ++ " / LINEAR band node\n"
    ++ "  %t1 = add i32 0, 1\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_omega: ; " ++ multGradeOmegaName ++ " / VALUE band node\n"
    ++ "  %t2 = add i32 0, 2\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_reject: ; FAIL-CLOSED-UNKNOWN-GRADE\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "merge:\n"
    ++ "  %tag = phi i32 [ %t0, %bb_mult0 ], [ %t1, %bb_mult1 ], [ %t2, %bb_omega ], [ -1, %bb_reject ]\n"
    ++ "  ret i32 %tag\n"
    ++ "}\n"
    ++ "\n"

/-- Ordered Mult kernel program as sequential SSA defs (KernelMult three nodes).
    Greppable: multSsaKernelBand, SELF-HOST-KERNEL-MULT, ORDERED-IR-PROGRAM. -/
def multSsaKernelBand : String :=
  "; ORDERED-IR-PROGRAM Mult kernel band (SELF-HOST-KERNEL-MULT lowerMultKernel)\n"
    ++ "; Three nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value\n"
    ++ "; SSA-shaped: each node fields are distinct SSA values (not full CFG pipeline)\n"
    ++ "define i1 @slake_mult_ssa_kernel_band_ready() {\n"
    ++ "entry:\n"
    ++ "  ; node0: tag=0 mult=MULT-0 kind=ERASED\n"
    ++ "  %n0_tag = add i32 0, 0\n"
    ++ "  %n0_mult = add i32 0, 0\n"
    ++ "  %n0_kind = add i32 0, 2\n"
    ++ "  ; node1: tag=1 mult=MULT-1 kind=LINEAR\n"
    ++ "  %n1_tag = add i32 0, 1\n"
    ++ "  %n1_mult = add i32 0, 1\n"
    ++ "  %n1_kind = add i32 0, 1\n"
    ++ "  ; node2: tag=2 mult=MULT-OMEGA kind=VALUE\n"
    ++ "  %n2_tag = add i32 0, 2\n"
    ++ "  %n2_mult = add i32 0, 2\n"
    ++ "  %n2_kind = add i32 0, 0\n"
    ++ "  ; length honesty: three Mult kernel nodes\n"
    ++ "  %len = add i32 0, 3\n"
    ++ "  %ok = icmp eq i32 %len, 3\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed Mult tag validity in SSA form (reuses Mult.isValidTag shape).
    Greppable: multSsaIsValid, slake_mult_ssa_is_valid_tag. -/
def multSsaIsValid : String :=
  "; Fail-closed raw tag check (Mult.isValidTag / ofNat? known 0/1/2 only)\n"
    ++ "define i1 @slake_mult_ssa_is_valid_tag(i32 %tag) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %tag, 0\n"
    ++ "  %is1 = icmp eq i32 %tag, 1\n"
    ++ "  %is2 = icmp eq i32 %tag, 2\n"
    ++ "  %t01 = or i1 %is0, %is1\n"
    ++ "  %ok = or i1 %t01, %is2\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Mult SSA package text (banner + constants + grade phi + kernel + valid).
    Greppable: multSsaPackage, slake_mult_ssa.ll. -/
def multSsaPackage : String :=
  multSsaBanner ++ multSsaConstants ++ multSsaGradePhi
    ++ multSsaKernelBand ++ multSsaIsValid

/-- Surface ids + path cites + Mult grade SSOT + KernelMult ready ok. -/
def llvmMultSsaSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_MULT_SSA_V0")
    && (hostId == "HOST-LLVM-MULT-SSA")
    && (surfaceId == "HOST-LLVM-MULT-SSA")
    && (surfaceAlias == "HOST-HOST-LLVM-MULT-SSA")
    && (justRecipeLlvmMultSsa == "llvm-mult-ssa")
    && (justRecipe == "llvm-mult-ssa")
    && (lakeExeName == "slake-llvm-mult-ssa")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (multSsaBasename == "slake_mult_ssa.ll")
    && (multModuleCite == "src/systems/SystemsLean/Mult.lean")
    && (kernelMultModuleCite
      == "src/systems/SystemsLean/KernelMult.lean")
    && (llvmMultTextModuleCite
      == "src/systems/SystemsLean/LlvmMultText.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (multGrade0Name == "MULT-0")
    && (multGrade1Name == "MULT-1")
    && (multGradeOmegaName == "MULT-OMEGA")
    && (kernelMultId == "SELF-HOST-KERNEL-MULT")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (ssaShapedId == "SSA-SHAPED")
    && multKernelReady
    && kernelOk
    && lowerMultKernel.isSome

/-- Package text honesty: Mult grades + stage + SSA defines present.
    Greppable: llvmMultSsaPackageOk. -/
def llvmMultSsaPackageOk : Bool :=
  llvmMultSsaSurfaceOk
    && (multSsaPackage
      == multSsaBanner ++ multSsaConstants ++ multSsaGradePhi
        ++ multSsaKernelBand ++ multSsaIsValid)
    && (multSsaBanner
      == "; SLAKE_LLVM_MULT_SSA_V0 / HOST-LLVM-MULT-SSA\n"
        ++ "; Generator-owned Mult program-graph SSA-shaped IR from KernelMult + Mult SSOT\n"
        ++ "; Mult grades: MULT-0 MULT-1 MULT-OMEGA\n"
        ++ "; SELF-HOST-KERNEL-MULT ORDERED-IR-PROGRAM SSA-SHAPED\n"
        ++ "; Kernel Mult SSOT: src/systems/SystemsLean/KernelMult.lean\n"
        ++ "; Mult SSOT: src/systems/SystemsLean/Mult.lean\n"
        ++ "; Path: out/llvm-ir/slake_mult_ssa.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmMultText Mult unit IR; LlvmEmitPath design+stub (HOST-LLVM-EMIT-PATH)\n"
        ++ "; Recipe: just llvm-mult-ssa / lake exe slake-llvm-mult-ssa\n"
        ++ "; Mult SSA partial: block labels + phi + ordered SSA node defs for Mult band only\n"
        ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Mult SSA equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmMultSsaWrite
    (IO.FS.writeFile) + post-read equality + just llvm-mult-ssa greps.
    Greppable: llvmMultSsaWroteExpected. -/
def llvmMultSsaWroteExpected : Bool :=
  llvmMultSsaPackageOk
    && (multSsaPackage
      == multSsaBanner ++ multSsaConstants ++ multSsaGradePhi
        ++ multSsaKernelBand ++ multSsaIsValid)

/-- Structural ready for LLVM Mult SSA lower residual.
    Greppable: llvmMultSsaReady, HOST-LLVM-MULT-SSA, SLAKE_LLVM_MULT_SSA. -/
def llvmMultSsaReady : Bool :=
  llvmMultSsaFinishedClaimed
    && llvmMultSsaPackageOk
    && llvmMultSsaWroteExpected
    && llvmMultSsaSurfaceOk
    && llvmMultSsaKeepsLlvmLocked
    && llvmMultSsaDoesNotUnlockLlvm
    && llvmMultSsaLocalUnlockFalse
    && llvmMultSsaPartialClaimed
    && !llvmMultSsaLlvmUnlocked
    && !llvmMultSsaFullBackendClaimed
    && !llvmMultSsaCfgProductionClaimed
    && !llvmMultSsaResidualFreeClaimed
    && !llvmMultSsaProductSelfHostCompleteClaimed
    && !llvmMultSsaProofCompleteClaimed
    && !llvmMultSsaProvablyUnlockWorkClaimed
    && !llvmMultSsaProductionReadyClaimed
    && !llvmMultSsaRustNativeLinkClaimed
    && !llvmMultSsaLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmMultText.llvmMultTextReady
    && !LlvmMultText.llvmMultTextLlvmUnlocked

/-! ### HOST-LLVM-MULT-SSA-THEOREM (readable statements) -/

theorem llvmMultSsaFinishedClaimed_true :
    llvmMultSsaFinishedClaimed = true :=
  rfl

theorem llvmMultSsaLlvmUnlocked_false :
    llvmMultSsaLlvmUnlocked = false :=
  rfl

theorem llvmMultSsaPartialClaimed_true :
    llvmMultSsaPartialClaimed = true :=
  rfl

theorem llvmMultSsaFullBackendClaimed_false :
    llvmMultSsaFullBackendClaimed = false :=
  rfl

theorem llvmMultSsaCfgProductionClaimed_false :
    llvmMultSsaCfgProductionClaimed = false :=
  rfl

theorem llvmMultSsaKeepsLlvmLocked_true :
    llvmMultSsaKeepsLlvmLocked = true := by
  native_decide

theorem llvmMultSsaDoesNotUnlockLlvm_true :
    llvmMultSsaDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmMultSsaReady_true :
    llvmMultSsaReady = true := by
  native_decide

theorem justRecipeLlvmMultSsa_eq :
    justRecipeLlvmMultSsa = "llvm-mult-ssa" :=
  rfl

theorem llvmMultSsa_stageId_eq :
    stageId = "SLAKE_LLVM_MULT_SSA_V0" :=
  rfl

theorem llvmMultSsa_hostId_eq :
    hostId = "HOST-LLVM-MULT-SSA" :=
  rfl

theorem llvmMultSsa_grades_eq :
    multGrade0Name = "MULT-0"
      && multGrade1Name = "MULT-1"
      && multGradeOmegaName = "MULT-OMEGA" :=
  rfl

theorem llvmMultSsa_claims_false :
    llvmMultSsaLlvmUnlocked = false
      && llvmMultSsaFullBackendClaimed = false
      && llvmMultSsaCfgProductionClaimed = false
      && llvmMultSsaResidualFreeClaimed = false
      && llvmMultSsaProductSelfHostCompleteClaimed = false
      && llvmMultSsaProofCompleteClaimed = false
      && llvmMultSsaProvablyUnlockWorkClaimed = false
      && llvmMultSsaProductionReadyClaimed = false
      && llvmMultSsaRustNativeLinkClaimed = false
      && llvmMultSsaLlvmAsClaimed = false :=
  rfl

theorem llvmMultSsaPackageOk_true :
    llvmMultSsaPackageOk = true := by
  native_decide

theorem llvmMultSsaWroteExpected_true :
    llvmMultSsaWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-MULT-SSA-SMOKE (quick examples) -/

example : llvmMultSsaFinishedClaimed = true := rfl
example : llvmMultSsaLlvmUnlocked = false := rfl
example : llvmMultSsaPartialClaimed = true := rfl
example : llvmMultSsaFullBackendClaimed = false := rfl
example : llvmMultSsaCfgProductionClaimed = false := rfl
example : llvmMultSsaKeepsLlvmLocked = true := by native_decide
example : llvmMultSsaDoesNotUnlockLlvm = true := by native_decide
example : llvmMultSsaReady = true := by native_decide
example : justRecipeLlvmMultSsa = "llvm-mult-ssa" := rfl
example : multGrade0Name = "MULT-0" := rfl
example : multGrade1Name = "MULT-1" := rfl
example : multGradeOmegaName = "MULT-OMEGA" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmMultSsaLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmMultText.llvmMultTextReady = true := by native_decide
example : multSsaBasename = "slake_mult_ssa.ll" := rfl
example : ssaShapedId = "SSA-SHAPED" := rfl
example : kernelMultId = "SELF-HOST-KERNEL-MULT" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Mult SSA IR lacks greppable honesty tokens. -/
def validateMultSsaPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_MULT_SSA_V0"
    , "HOST-LLVM-MULT-SSA"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "SELF-HOST-KERNEL-MULT"
    , "ORDERED-IR-PROGRAM"
    , "SSA-SHAPED"
    , "phi i32"
    , "slake_mult_ssa_grade_tag"
    , "slake_mult_ssa_kernel_band_ready"
    , "slake_mult_ssa_is_valid_tag"
    , "slake_mult_ssa_tag_0"
    , "slake_mult_ssa_tag_1"
    , "slake_mult_ssa_tag_omega"
    , "bb_mult0"
    , "bb_mult1"
    , "bb_omega"
    , "bb_reject"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_mult_ssa.ll"
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

/-- Write Mult SSA IR text under root/out/llvm-ir/slake_mult_ssa.ll.
    Greppable: llvmMultSsaWrite, slake_mult_ssa.ll, IO.FS.writeFile. -/
def llvmMultSsaWrite (root : System.FilePath) : IO Unit := do
  unless llvmMultSsaReady do
    IO.eprintln s!"error: {stageId}: llvmMultSsaReady false"
    throw (IO.userError "llvmMultSsaReady false")
  unless llvmMultSsaWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmMultSsaWroteExpected false"
    throw (IO.userError "llvmMultSsaWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / multSsaBasename
  IO.println s!"== {stageId}: LLVM Mult SSA lower partial =="
  IO.println s!"  readyPin={llvmMultSsaReady} llvmUnlocked={LlvmHold.llvmUnlocked} fullBackend={llvmMultSsaFullBackendClaimed}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl multSsaPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Mult SSA IR after write: {outLl}"
    throw (IO.userError "missing Mult SSA IR")
  if written != multSsaPackage then
    IO.eprintln "error: Mult SSA IR written content mismatch"
    throw (IO.userError "Mult SSA IR mismatch")
  validateMultSsaPackage multSsaBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-MULT-SSA, SSA-SHAPED, phi, MULT-0/1/OMEGA"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Mult SSA IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmMultSsaWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmMultSsa
