/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmProgramSsa.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmProgramSsaSource. Not occupancy name 50.
  Not mill 62 remill. Mill stays 69 of 69.
  This wrap parses the library LlvmProgramSsa.lean. Not the mill entry
  LlvmProgramSsaMain.lean. Not Linear.lean (QTT Linear module).
  Not IrGraph.lean. Not LlvmTypesSsa.lean. Not a mill remill.
  This wrap is not an LLVM backend claim. FullBackend stays false.
  Do not write out/llvm-ir. Dests skipped. Not a mill remill.
  Unique needles (trailing newline, each once in the library):
  namespace SystemsLean.LlvmProgramSsa
  def stageId : String := "SLAKE_LLVM_PROGRAM_SSA_V0"
  def hostId : String := "HOST-LLVM-PROGRAM-SSA"
  def llvmProgramSsaFullBackendClaimed : Bool := false
  def programSsaBasename : String := "slake_program_ssa.ll"
  def ssaShapedId : String := "SSA-SHAPED"
  end SystemsLean.LlvmProgramSsa
  PARSE-LIVE-LLVM-PROGRAM-SSA
  HOST-FRONT-LIVE-LLVM-PROGRAM-SSA
  LLVM-PROGRAM-SSA
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmProgramSsaSource,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmProgramSsaSource
  Not FullHost. Not FullBackend. Not freestanding residual free. Not PROVABLY.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmProgramSsa

/-- Dual-pinned live LlvmProgramSsa.lean bytes (must match on-disk file).
    Greppable: liveLlvmProgramSsaSource, PARSE-LIVE-LLVM-PROGRAM-SSA. -/
def liveLlvmProgramSsaSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LLVM Program SSA lower (one Program ordered-IR
  band to SSA-shaped IR under out/llvm-ir). Generator-owned Program-band SSA
  form from KernelProgram lower + IrProgram SSOT. Composes LlvmHold: living
  llvmUnlocked true after unlock residual; local unlock pin false.
  Composes LlvmProgramText unit IR peer + LlvmTypesSsa / LlvmLinearSsa /
  LlvmMultSsa SSA peers + LlvmEmitPath design+stub.
  Not production LLVM backend. Not full CFG/dominance pipeline.
  Not Rust-native link success. Not freestanding residual free re-open.
  Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-PROGRAM-SSA, SLAKE_LLVM_PROGRAM_SSA,
  SLAKE_LLVM_PROGRAM_SSA_V0, HOST-HOST-LLVM-PROGRAM-SSA, llvmProgramSsaReady,
  llvmProgramSsaFinishedClaimed, llvmProgramSsaPackageOk, llvmProgramSsaWroteExpected,
  llvmProgramSsaKeepsLlvmLocked, llvmProgramSsaDoesNotUnlockLlvm,
  llvmProgramSsaLlvmUnlocked, llvmProgramSsaLocalUnlockFalse,
  llvmProgramSsaPartialClaimed, llvmProgramSsaFullBackendClaimed,
  justRecipeLlvmProgramSsa, llvm-program-ssa, out/llvm-ir, slake_program_ssa.ll,
  programSsaPackage, llvmProgramSsaWrite, IO.FS.writeFile, Program,
  EMPTY-PROGRAM-FAIL-CLOSED, SLAKE_IR_PROGRAM_CAP, ORDERED-IR-PROGRAM,
  SELF-HOST-KERNEL-PROGRAM, KernelProgram, lowerProgramKernel, SSA-SHAPED, phi,
  LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmProgramText, LlvmTypesSsa,
  LlvmLinearSsa, LlvmMultSsa, HOST-LLVM-EMIT-PATH, HOST-LLVM-PROGRAM-TEXT,
  HOST-LLVM-PROGRAM-SSA-SMOKE, HOST-LLVM-PROGRAM-SSA-THEOREM, UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmProgramSsa
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-program-ssa
  greps of out/llvm-ir/slake_program_ssa.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmProgramSsa; lake exe slake-llvm-program-ssa;
  just llvm-program-ssa; just systems-llvm-ir.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock claim.
  Host elaborator residual remains. Program SSA partial only (not full backend).
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.IrProgram
import SystemsLean.KernelProgram
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmProgramText
import SystemsLean.LlvmTypesSsa
import SystemsLean.LlvmLinearSsa
import SystemsLean.LlvmMultSsa

namespace SystemsLean.LlvmProgramSsa

open SystemsLean.Mult
open SystemsLean.Types (NodeKind)
open SystemsLean.IrProgram (programCap)
open SystemsLean.KernelProgram (programKernelReady programKernelOk lowerProgramKernel)

/-! ### HOST-LLVM-PROGRAM-SSA / SLAKE_LLVM_PROGRAM_SSA

  Program ordered-IR band lowered to SSA-shaped LLVM IR from KernelProgram
  (three nodes: ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA) plus IrProgram
  SSOT honesty (cap, empty fail-closed, push codes). Written under
  out/llvm-ir/slake_program_ssa.ll. Partial SSA form (block labels + phi +
  ordered SSA defs). Does not unlock llvm. Does not claim full CFG/dominance.
-/

/-- Greppable primary stage id (LLVM Program SSA lower gate). -/
def stageId : String := "SLAKE_LLVM_PROGRAM_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-PROGRAM-SSA"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-PROGRAM-SSA"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-PROGRAM-SSA"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmProgramSsa, llvm-program-ssa. -/
def justRecipeLlvmProgramSsa : String := "llvm-program-ssa"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmProgramSsa

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-program-ssa. -/
def lakeExeName : String := "slake-llvm-program-ssa"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Program SSA IR artifact basename under out/llvm-ir.
    Greppable: programSsaBasename, slake_program_ssa.ll. -/
def programSsaBasename : String := "slake_program_ssa.ll"

/-- IrProgram host SSOT module path cite.
    Greppable: irProgramModuleCite, IrProgram.lean. -/
def irProgramModuleCite : String := "src/systems/SystemsLean/IrProgram.lean"

/-- Kernel Program path cite (three-node Program band).
    Greppable: kernelProgramModuleCite, KernelProgram.lean. -/
def kernelProgramModuleCite : String :=
  "src/systems/SystemsLean/KernelProgram.lean"

/-- Program unit IR peer module cite.
    Greppable: llvmProgramTextModuleCite, LlvmProgramText. -/
def llvmProgramTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmProgramText.lean"

/-- Types SSA peer module cite.
    Greppable: llvmTypesSsaModuleCite, LlvmTypesSsa. -/
def llvmTypesSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmTypesSsa.lean"

/-- Linear SSA peer module cite.
    Greppable: llvmLinearSsaModuleCite, LlvmLinearSsa. -/
def llvmLinearSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmLinearSsa.lean"

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

/-- Local inventory finished (structural gate closed for Program SSA partial).
    Greppable: llvmProgramSsaFinishedClaimed. -/
def llvmProgramSsaFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmProgramSsaLlvmUnlocked, llvmProgramSsaLocalUnlockFalse. -/
def llvmProgramSsaLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmProgramSsaLocalUnlockFalse. -/
def llvmProgramSsaLocalUnlockFalse : Bool := !llvmProgramSsaLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmProgramSsaKeepsLlvmLocked. -/
def llvmProgramSsaKeepsLlvmLocked : Bool :=
  !llvmProgramSsaLlvmUnlocked

/-- Program SSA lower does not unlock llvm (fail-closed).
    Greppable: llvmProgramSsaDoesNotUnlockLlvm. -/
def llvmProgramSsaDoesNotUnlockLlvm : Bool :=
  llvmProgramSsaKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmProgramText.llvmProgramTextKeepsLlvmLocked
    && LlvmTypesSsa.llvmTypesSsaKeepsLlvmLocked
    && LlvmLinearSsa.llvmLinearSsaKeepsLlvmLocked
    && LlvmMultSsa.llvmMultSsaKeepsLlvmLocked

/-- This residual claims Program-band SSA-shaped IR partial only.
    Greppable: llvmProgramSsaPartialClaimed, SSA-SHAPED. -/
def llvmProgramSsaPartialClaimed : Bool := true

/-- Full production LLVM backend claim -- MUST stay false.
    Greppable: llvmProgramSsaFullBackendClaimed. -/
def llvmProgramSsaFullBackendClaimed : Bool := false

/-- Full CFG/dominance production pipeline claim -- MUST stay false.
    Greppable: llvmProgramSsaCfgProductionClaimed. -/
def llvmProgramSsaCfgProductionClaimed : Bool := false

/-- Local honesty: not freestanding residual free re-open. -/
def llvmProgramSsaResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmProgramSsaProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmProgramSsaProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY unlock work claim. -/
def llvmProgramSsaProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmProgramSsaProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmProgramSsaRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmProgramSsaLlvmAsClaimed : Bool := false

/-- Kind names from Types SSOT (Program kernel node kinds). -/
def kindValueName : String := NodeKind.name NodeKind.value
def kindLinearName : String := NodeKind.name NodeKind.linear
def kindErasedName : String := NodeKind.name NodeKind.erased

/-- Mult grade names from Mult SSOT. -/
def multGrade0Name : String := Mult.name Mult.mult0
def multGrade1Name : String := Mult.name Mult.mult1
def multGradeOmegaName : String := Mult.name Mult.multOmega

/-- Program capacity from IrProgram SSOT.
    Greppable: programCapValue, SLAKE_IR_PROGRAM_CAP. -/
def programCapValue : Nat := programCap

/-- Empty program fail-closed honesty id.
    Greppable: emptyProgramFailClosedId, EMPTY-PROGRAM-FAIL-CLOSED. -/
def emptyProgramFailClosedId : String := "EMPTY-PROGRAM-FAIL-CLOSED"

/-- Kernel Program surface id cite.
    Greppable: kernelProgramId, SELF-HOST-KERNEL-PROGRAM. -/
def kernelProgramId : String := "SELF-HOST-KERNEL-PROGRAM"

/-- Ordered IR program honesty id.
    Greppable: orderedIrProgramId, ORDERED-IR-PROGRAM. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"

/-- SSA-shaped honesty id (partial form; not full production SSA pipeline).
    Greppable: ssaShapedId, SSA-SHAPED. -/
def ssaShapedId : String := "SSA-SHAPED"

/-- Program SSA header comments (stage + KernelProgram/IrProgram SSOT + non-claims).
    Greppable: programSsaBanner. -/
def programSsaBanner : String :=
  "; SLAKE_LLVM_PROGRAM_SSA_V0 / HOST-LLVM-PROGRAM-SSA\n"
    ++ "; Generator-owned Program ordered-IR SSA-shaped IR from KernelProgram + IrProgram SSOT\n"
    ++ "; Program focus: " ++ orderedIrProgramId ++ " "
    ++ emptyProgramFailClosedId ++ " CAP=" ++ toString programCapValue ++ "\n"
    ++ "; Kind/mult: " ++ kindErasedName ++ "/" ++ multGrade0Name ++ " "
    ++ kindLinearName ++ "/" ++ multGrade1Name ++ " "
    ++ kindValueName ++ "/" ++ multGradeOmegaName ++ "\n"
    ++ "; " ++ kernelProgramId ++ " " ++ orderedIrProgramId ++ " "
    ++ ssaShapedId ++ "\n"
    ++ "; Kernel Program SSOT: src/systems/SystemsLean/KernelProgram.lean\n"
    ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
    ++ "; Path: out/llvm-ir/slake_program_ssa.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmProgramText Program unit IR; LlvmTypesSsa Types SSA; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub\n"
    ++ "; Recipe: just llvm-program-ssa / lake exe slake-llvm-program-ssa\n"
    ++ "; Program SSA partial: block labels + phi + ordered SSA node defs for Program band only\n"
    ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Program surface constants (cap + push result codes).
    Greppable: programSsaConstants, SLAKE_IR_PROGRAM_CAP. -/
def programSsaConstants : String :=
  "; Ordered IR program surface constants (IrProgram.programCap / push map)\n"
    ++ "; SLAKE_IR_PROGRAM_CAP = " ++ toString programCapValue ++ "\n"
    ++ "; push: 0=ok, -1=badNode, -2=full (emit map)\n"
    ++ "@slake_program_ssa_cap = private unnamed_addr constant i32 "
    ++ toString programCapValue ++ ", align 4 ; SLAKE_IR_PROGRAM_CAP\n"
    ++ "@slake_program_ssa_push_ok = private unnamed_addr constant i32 0, align 4 ; push ok\n"
    ++ "@slake_program_ssa_push_bad = private unnamed_addr constant i32 -1, align 4 ; badNode\n"
    ++ "@slake_program_ssa_push_full = private unnamed_addr constant i32 -2, align 4 ; full\n"
    ++ "\n"

/-- SSA-shaped Program push-status lower: block labels + phi (partial SSA form).
    status_ix 0/1/2 -> ok/bad/full; other -> reject (-3 fail-closed).
    Greppable: programSsaPushPhi, phi, SSA-SHAPED, slake_program_ssa_push_status. -/
def programSsaPushPhi : String :=
  "; SSA-SHAPED Program push-status lower (partial; Program band only; not full CFG/dominance)\n"
    ++ "; status_ix: 0=ok, 1=badNode, 2=full; other -> reject (-3)\n"
    ++ "define i32 @slake_program_ssa_push_status(i32 %status_ix) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %status_ix, 0\n"
    ++ "  br i1 %is0, label %bb_ok, label %check1\n"
    ++ "\n"
    ++ "check1:\n"
    ++ "  %is1 = icmp eq i32 %status_ix, 1\n"
    ++ "  br i1 %is1, label %bb_bad, label %check2\n"
    ++ "\n"
    ++ "check2:\n"
    ++ "  %is2 = icmp eq i32 %status_ix, 2\n"
    ++ "  br i1 %is2, label %bb_full, label %bb_reject\n"
    ++ "\n"
    ++ "bb_ok: ; push ok\n"
    ++ "  %t0 = add i32 0, 0\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_bad: ; push badNode\n"
    ++ "  %t1 = add i32 0, -1\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_full: ; push full (at CAP)\n"
    ++ "  %t2 = add i32 0, -2\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_reject: ; unknown status fail-closed\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "merge:\n"
    ++ "  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_bad ], [ %t2, %bb_full ], [ -3, %bb_reject ]\n"
    ++ "  ret i32 %code\n"
    ++ "}\n"
    ++ "\n"

/-- Ordered Program kernel band as sequential SSA defs (KernelProgram three nodes).
    Greppable: programSsaKernelBand, SELF-HOST-KERNEL-PROGRAM, ORDERED-IR-PROGRAM. -/
def programSsaKernelBand : String :=
  "; ORDERED-IR-PROGRAM Program kernel band (SELF-HOST-KERNEL-PROGRAM lowerProgramKernel)\n"
    ++ "; Three nodes: ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA\n"
    ++ "; SSA-shaped: node fields are distinct SSA values (not full CFG pipeline)\n"
    ++ "define i1 @slake_program_ssa_kernel_band_ready() {\n"
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
    ++ "  ; length honesty: three Program kernel nodes\n"
    ++ "  %len = add i32 0, 3\n"
    ++ "  %ok = icmp eq i32 %len, 3\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed well-typed count check (EMPTY-PROGRAM-FAIL-CLOSED + CAP).
    Greppable: programSsaIsWellTyped, slake_program_ssa_is_well_typed. -/
def programSsaIsWellTyped : String :=
  "; EMPTY-PROGRAM-FAIL-CLOSED + CAP well-typed sketch (IrProgram.isWellTyped)\n"
    ++ "; count 0 fails; count > CAP fails; count in 1..CAP ok (node checks omitted)\n"
    ++ "define i1 @slake_program_ssa_is_well_typed(i32 %count) {\n"
    ++ "entry:\n"
    ++ "  %nz = icmp ne i32 %count, 0\n"
    ++ "  %le = icmp ule i32 %count, " ++ toString programCapValue ++ "\n"
    ++ "  %ok = and i1 %nz, %le\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Program SSA package text (banner + constants + push phi + kernel + well-typed).
    Greppable: programSsaPackage, slake_program_ssa.ll. -/
def programSsaPackage : String :=
  programSsaBanner ++ programSsaConstants ++ programSsaPushPhi
    ++ programSsaKernelBand ++ programSsaIsWellTyped

/-- Surface ids + path cites + Program SSOT + KernelProgram ready ok. -/
def llvmProgramSsaSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_PROGRAM_SSA_V0")
    && (hostId == "HOST-LLVM-PROGRAM-SSA")
    && (surfaceId == "HOST-LLVM-PROGRAM-SSA")
    && (surfaceAlias == "HOST-HOST-LLVM-PROGRAM-SSA")
    && (justRecipeLlvmProgramSsa == "llvm-program-ssa")
    && (justRecipe == "llvm-program-ssa")
    && (lakeExeName == "slake-llvm-program-ssa")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (programSsaBasename == "slake_program_ssa.ll")
    && (irProgramModuleCite == "src/systems/SystemsLean/IrProgram.lean")
    && (kernelProgramModuleCite
      == "src/systems/SystemsLean/KernelProgram.lean")
    && (llvmProgramTextModuleCite
      == "src/systems/SystemsLean/LlvmProgramText.lean")
    && (llvmTypesSsaModuleCite
      == "src/systems/SystemsLean/LlvmTypesSsa.lean")
    && (llvmLinearSsaModuleCite
      == "src/systems/SystemsLean/LlvmLinearSsa.lean")
    && (llvmMultSsaModuleCite
      == "src/systems/SystemsLean/LlvmMultSsa.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (kindValueName == "VALUE")
    && (kindLinearName == "LINEAR")
    && (kindErasedName == "ERASED")
    && (multGrade0Name == "MULT-0")
    && (multGrade1Name == "MULT-1")
    && (multGradeOmegaName == "MULT-OMEGA")
    && (programCapValue == 8)
    && (emptyProgramFailClosedId == "EMPTY-PROGRAM-FAIL-CLOSED")
    && (kernelProgramId == "SELF-HOST-KERNEL-PROGRAM")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (ssaShapedId == "SSA-SHAPED")
    && programKernelReady
    && programKernelOk
    && lowerProgramKernel.isSome

/-- Package text honesty: Program surface + stage + SSA defines present.
    Greppable: llvmProgramSsaPackageOk. -/
def llvmProgramSsaPackageOk : Bool :=
  llvmProgramSsaSurfaceOk
    && (programSsaPackage
      == programSsaBanner ++ programSsaConstants ++ programSsaPushPhi
        ++ programSsaKernelBand ++ programSsaIsWellTyped)
    && (programSsaBanner
      == "; SLAKE_LLVM_PROGRAM_SSA_V0 / HOST-LLVM-PROGRAM-SSA\n"
        ++ "; Generator-owned Program ordered-IR SSA-shaped IR from KernelProgram + IrProgram SSOT\n"
        ++ "; Program focus: ORDERED-IR-PROGRAM EMPTY-PROGRAM-FAIL-CLOSED CAP=8\n"
        ++ "; Kind/mult: ERASED/MULT-0 LINEAR/MULT-1 VALUE/MULT-OMEGA\n"
        ++ "; SELF-HOST-KERNEL-PROGRAM ORDERED-IR-PROGRAM SSA-SHAPED\n"
        ++ "; Kernel Program SSOT: src/systems/SystemsLean/KernelProgram.lean\n"
        ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
        ++ "; Path: out/llvm-ir/slake_program_ssa.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmProgramText Program unit IR; LlvmTypesSsa Types SSA; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub\n"
        ++ "; Recipe: just llvm-program-ssa / lake exe slake-llvm-program-ssa\n"
        ++ "; Program SSA partial: block labels + phi + ordered SSA node defs for Program band only\n"
        ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Program SSA equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmProgramSsaWrite
    (IO.FS.writeFile) + post-read equality + just llvm-program-ssa greps.
    Greppable: llvmProgramSsaWroteExpected. -/
def llvmProgramSsaWroteExpected : Bool :=
  llvmProgramSsaPackageOk
    && (programSsaPackage
      == programSsaBanner ++ programSsaConstants ++ programSsaPushPhi
        ++ programSsaKernelBand ++ programSsaIsWellTyped)

/-- Structural ready for LLVM Program SSA lower residual.
    Greppable: llvmProgramSsaReady, HOST-LLVM-PROGRAM-SSA, SLAKE_LLVM_PROGRAM_SSA. -/
def llvmProgramSsaReady : Bool :=
  llvmProgramSsaFinishedClaimed
    && llvmProgramSsaPackageOk
    && llvmProgramSsaWroteExpected
    && llvmProgramSsaSurfaceOk
    && llvmProgramSsaKeepsLlvmLocked
    && llvmProgramSsaDoesNotUnlockLlvm
    && llvmProgramSsaLocalUnlockFalse
    && llvmProgramSsaPartialClaimed
    && !llvmProgramSsaLlvmUnlocked
    && !llvmProgramSsaFullBackendClaimed
    && !llvmProgramSsaCfgProductionClaimed
    && !llvmProgramSsaResidualFreeClaimed
    && !llvmProgramSsaProductSelfHostCompleteClaimed
    && !llvmProgramSsaProofCompleteClaimed
    && !llvmProgramSsaProvablyUnlockWorkClaimed
    && !llvmProgramSsaProductionReadyClaimed
    && !llvmProgramSsaRustNativeLinkClaimed
    && !llvmProgramSsaLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmProgramText.llvmProgramTextReady
    && !LlvmProgramText.llvmProgramTextLlvmUnlocked
    && LlvmTypesSsa.llvmTypesSsaReady
    && !LlvmTypesSsa.llvmTypesSsaLlvmUnlocked
    && LlvmLinearSsa.llvmLinearSsaReady
    && !LlvmLinearSsa.llvmLinearSsaLlvmUnlocked
    && LlvmMultSsa.llvmMultSsaReady
    && !LlvmMultSsa.llvmMultSsaLlvmUnlocked

/-! ### HOST-LLVM-PROGRAM-SSA-THEOREM (readable statements) -/

theorem llvmProgramSsaFinishedClaimed_true :
    llvmProgramSsaFinishedClaimed = true :=
  rfl

theorem llvmProgramSsaLlvmUnlocked_false :
    llvmProgramSsaLlvmUnlocked = false :=
  rfl

theorem llvmProgramSsaPartialClaimed_true :
    llvmProgramSsaPartialClaimed = true :=
  rfl

theorem llvmProgramSsaFullBackendClaimed_false :
    llvmProgramSsaFullBackendClaimed = false :=
  rfl

theorem llvmProgramSsaCfgProductionClaimed_false :
    llvmProgramSsaCfgProductionClaimed = false :=
  rfl

theorem llvmProgramSsaKeepsLlvmLocked_true :
    llvmProgramSsaKeepsLlvmLocked = true := by
  native_decide

theorem llvmProgramSsaDoesNotUnlockLlvm_true :
    llvmProgramSsaDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmProgramSsaReady_true :
    llvmProgramSsaReady = true := by
  native_decide

theorem justRecipeLlvmProgramSsa_eq :
    justRecipeLlvmProgramSsa = "llvm-program-ssa" :=
  rfl

theorem llvmProgramSsa_stageId_eq :
    stageId = "SLAKE_LLVM_PROGRAM_SSA_V0" :=
  rfl

theorem llvmProgramSsa_hostId_eq :
    hostId = "HOST-LLVM-PROGRAM-SSA" :=
  rfl

theorem llvmProgramSsa_cap_eq :
    programCapValue = 8 :=
  rfl

theorem llvmProgramSsa_claims_false :
    llvmProgramSsaLlvmUnlocked = false
      && llvmProgramSsaFullBackendClaimed = false
      && llvmProgramSsaCfgProductionClaimed = false
      && llvmProgramSsaResidualFreeClaimed = false
      && llvmProgramSsaProductSelfHostCompleteClaimed = false
      && llvmProgramSsaProofCompleteClaimed = false
      && llvmProgramSsaProvablyUnlockWorkClaimed = false
      && llvmProgramSsaProductionReadyClaimed = false
      && llvmProgramSsaRustNativeLinkClaimed = false
      && llvmProgramSsaLlvmAsClaimed = false :=
  rfl

theorem llvmProgramSsaPackageOk_true :
    llvmProgramSsaPackageOk = true := by
  native_decide

theorem llvmProgramSsaWroteExpected_true :
    llvmProgramSsaWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-PROGRAM-SSA-SMOKE (quick examples) -/

example : llvmProgramSsaFinishedClaimed = true := rfl
example : llvmProgramSsaLlvmUnlocked = false := rfl
example : llvmProgramSsaPartialClaimed = true := rfl
example : llvmProgramSsaFullBackendClaimed = false := rfl
example : llvmProgramSsaCfgProductionClaimed = false := rfl
example : llvmProgramSsaKeepsLlvmLocked = true := by native_decide
example : llvmProgramSsaDoesNotUnlockLlvm = true := by native_decide
example : llvmProgramSsaReady = true := by native_decide
example : justRecipeLlvmProgramSsa = "llvm-program-ssa" := rfl
example : programCapValue = 8 := rfl
example : emptyProgramFailClosedId = "EMPTY-PROGRAM-FAIL-CLOSED" := rfl
example : kernelProgramId = "SELF-HOST-KERNEL-PROGRAM" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmProgramSsaLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmProgramText.llvmProgramTextReady = true := by native_decide
example : LlvmTypesSsa.llvmTypesSsaReady = true := by native_decide
example : LlvmLinearSsa.llvmLinearSsaReady = true := by native_decide
example : LlvmMultSsa.llvmMultSsaReady = true := by native_decide
example : programSsaBasename = "slake_program_ssa.ll" := rfl
example : ssaShapedId = "SSA-SHAPED" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Program SSA IR lacks greppable honesty tokens. -/
def validateProgramSsaPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_PROGRAM_SSA_V0"
    , "HOST-LLVM-PROGRAM-SSA"
    , "EMPTY-PROGRAM-FAIL-CLOSED"
    , "SLAKE_IR_PROGRAM_CAP"
    , "VALUE"
    , "LINEAR"
    , "ERASED"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "SELF-HOST-KERNEL-PROGRAM"
    , "ORDERED-IR-PROGRAM"
    , "SSA-SHAPED"
    , "phi i32"
    , "slake_program_ssa_push_status"
    , "slake_program_ssa_kernel_band_ready"
    , "slake_program_ssa_is_well_typed"
    , "slake_program_ssa_cap"
    , "bb_ok"
    , "bb_bad"
    , "bb_full"
    , "bb_reject"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_program_ssa.ll"
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

/-- Write Program SSA IR text under root/out/llvm-ir/slake_program_ssa.ll.
    Greppable: llvmProgramSsaWrite, slake_program_ssa.ll, IO.FS.writeFile. -/
def llvmProgramSsaWrite (root : System.FilePath) : IO Unit := do
  unless llvmProgramSsaReady do
    IO.eprintln s!"error: {stageId}: llvmProgramSsaReady false"
    throw (IO.userError "llvmProgramSsaReady false")
  unless llvmProgramSsaWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmProgramSsaWroteExpected false"
    throw (IO.userError "llvmProgramSsaWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / programSsaBasename
  IO.println s!"== {stageId}: LLVM Program SSA lower partial =="
  IO.println s!"  readyPin={llvmProgramSsaReady} llvmUnlocked={LlvmHold.llvmUnlocked} fullBackend={llvmProgramSsaFullBackendClaimed}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl programSsaPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Program SSA IR after write: {outLl}"
    throw (IO.userError "missing Program SSA IR")
  if written != programSsaPackage then
    IO.eprintln "error: Program SSA IR written content mismatch"
    throw (IO.userError "Program SSA IR mismatch")
  validateProgramSsaPackage programSsaBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-PROGRAM-SSA, SSA-SHAPED, phi, EMPTY-PROGRAM-FAIL-CLOSED"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Program SSA IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmProgramSsaWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmProgramSsa
"#

end SystemsLean.HostFrontLiveLlvmProgramSsa
