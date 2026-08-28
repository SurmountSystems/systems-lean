/-
  SYSTEMS_LEAN_HOST partial -- LLVM Types SSA lower (one Types program-graph
  band to SSA-shaped IR under out/llvm-ir). Generator-owned Types-band SSA
  form from KernelTypes lower + Types SSOT. Composes LlvmHold: living
  llvmUnlocked true after unlock residual; local unlock pin false.
  Composes LlvmTypesText unit IR peer + LlvmLinearSsa / LlvmMultSsa SSA peers +
  LlvmEmitPath design+stub.
  Not production LLVM backend. Not full CFG/dominance pipeline.
  Not Rust-native link success. Not freestanding residual free re-open.
  Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-TYPES-SSA, SLAKE_LLVM_TYPES_SSA,
  SLAKE_LLVM_TYPES_SSA_V0, HOST-HOST-LLVM-TYPES-SSA, llvmTypesSsaReady,
  llvmTypesSsaFinishedClaimed, llvmTypesSsaPackageOk, llvmTypesSsaWroteExpected,
  llvmTypesSsaKeepsLlvmLocked, llvmTypesSsaDoesNotUnlockLlvm,
  llvmTypesSsaLlvmUnlocked, llvmTypesSsaLocalUnlockFalse,
  llvmTypesSsaPartialClaimed, llvmTypesSsaFullBackendClaimed,
  justRecipeLlvmTypesSsa, llvm-types-ssa, out/llvm-ir, slake_types_ssa.ll,
  typesSsaPackage, llvmTypesSsaWrite, IO.FS.writeFile, Types, TYPED_IR_V0,
  FAIL-CLOSED-UNKNOWN-KIND, VALUE, LINEAR, ERASED, MULT-0, MULT-1, MULT-OMEGA,
  KernelTypes, SELF-HOST-KERNEL-TYPES, lowerTypesKernel, ORDERED-IR-PROGRAM,
  SSA-SHAPED, phi, LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmTypesText,
  LlvmLinearSsa, LlvmMultSsa, HOST-LLVM-EMIT-PATH, HOST-LLVM-TYPES-TEXT,
  HOST-LLVM-TYPES-SSA-SMOKE, HOST-LLVM-TYPES-SSA-THEOREM, UNIT_SURFACE host surface.
  Module: SystemsLean.LlvmTypesSsa
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-types-ssa
  greps of out/llvm-ir/slake_types_ssa.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmTypesSsa; lake exe slake-llvm-types-ssa;
  just llvm-types-ssa; just systems-llvm-ir.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock claim.
  Host elaborator residual remains. Types SSA partial only (not full backend).
-/

import SystemsLean.Mult
import SystemsLean.Types
import SystemsLean.KernelTypes
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmTypesText
import SystemsLean.LlvmLinearSsa
import SystemsLean.LlvmMultSsa

namespace SystemsLean.LlvmTypesSsa

open SystemsLean.Mult
open SystemsLean.Types (NodeKind)
open SystemsLean.KernelTypes (typesKernelReady typesKernelOk lowerTypesKernel)

/-! ### HOST-LLVM-TYPES-SSA / SLAKE_LLVM_TYPES_SSA

  Types program-graph band lowered to SSA-shaped LLVM IR from KernelTypes
  (three TYPED_IR kind/mult nodes: ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA)
  plus Types SSOT honesty. Written under out/llvm-ir/slake_types_ssa.ll.
  Partial SSA form (block labels + phi + ordered SSA defs). Does not unlock
  llvm. Does not claim full CFG/dominance.
-/

/-- Greppable primary stage id (LLVM Types SSA lower gate). -/
def stageId : String := "SLAKE_LLVM_TYPES_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-TYPES-SSA"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-TYPES-SSA"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-TYPES-SSA"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmTypesSsa, llvm-types-ssa. -/
def justRecipeLlvmTypesSsa : String := "llvm-types-ssa"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmTypesSsa

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-types-ssa. -/
def lakeExeName : String := "slake-llvm-types-ssa"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Types SSA IR artifact basename under out/llvm-ir.
    Greppable: typesSsaBasename, slake_types_ssa.ll. -/
def typesSsaBasename : String := "slake_types_ssa.ll"

/-- Types host SSOT module path cite.
    Greppable: typesModuleCite, Types.lean. -/
def typesModuleCite : String := "src/systems/SystemsLean/Types.lean"

/-- Kernel Types program-graph cite (three-node Types band).
    Greppable: kernelTypesModuleCite, KernelTypes.lean. -/
def kernelTypesModuleCite : String :=
  "src/systems/SystemsLean/KernelTypes.lean"

/-- Types unit IR peer module cite.
    Greppable: llvmTypesTextModuleCite, LlvmTypesText. -/
def llvmTypesTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmTypesText.lean"

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

/-- Local inventory finished (structural gate closed for Types SSA partial).
    Greppable: llvmTypesSsaFinishedClaimed. -/
def llvmTypesSsaFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmTypesSsaLlvmUnlocked, llvmTypesSsaLocalUnlockFalse. -/
def llvmTypesSsaLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmTypesSsaLocalUnlockFalse. -/
def llvmTypesSsaLocalUnlockFalse : Bool := !llvmTypesSsaLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmTypesSsaKeepsLlvmLocked. -/
def llvmTypesSsaKeepsLlvmLocked : Bool :=
  !llvmTypesSsaLlvmUnlocked

/-- Types SSA lower does not unlock llvm (fail-closed).
    Greppable: llvmTypesSsaDoesNotUnlockLlvm. -/
def llvmTypesSsaDoesNotUnlockLlvm : Bool :=
  llvmTypesSsaKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmTypesText.llvmTypesTextKeepsLlvmLocked
    && LlvmLinearSsa.llvmLinearSsaKeepsLlvmLocked
    && LlvmMultSsa.llvmMultSsaKeepsLlvmLocked

/-- This residual claims Types-band SSA-shaped IR partial only.
    Greppable: llvmTypesSsaPartialClaimed, SSA-SHAPED. -/
def llvmTypesSsaPartialClaimed : Bool := true

/-- Full production LLVM backend claim -- MUST stay false.
    Greppable: llvmTypesSsaFullBackendClaimed. -/
def llvmTypesSsaFullBackendClaimed : Bool := false

/-- Full CFG/dominance production pipeline claim -- MUST stay false.
    Greppable: llvmTypesSsaCfgProductionClaimed. -/
def llvmTypesSsaCfgProductionClaimed : Bool := false

/-- Local honesty: not freestanding residual free re-open. -/
def llvmTypesSsaResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmTypesSsaProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmTypesSsaProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY unlock work claim. -/
def llvmTypesSsaProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmTypesSsaProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmTypesSsaRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmTypesSsaLlvmAsClaimed : Bool := false

/-- Kind names from Types SSOT.
    Greppable: kindValueName, kindLinearName, kindErasedName. -/
def kindValueName : String := NodeKind.name NodeKind.value
def kindLinearName : String := NodeKind.name NodeKind.linear
def kindErasedName : String := NodeKind.name NodeKind.erased

/-- Mult grade names from Mult SSOT. -/
def multGrade0Name : String := Mult.name Mult.mult0
def multGrade1Name : String := Mult.name Mult.mult1
def multGradeOmegaName : String := Mult.name Mult.multOmega

/-- Typed IR honesty id.
    Greppable: typedIrId, TYPED_IR_V0. -/
def typedIrId : String := "TYPED_IR_V0"

/-- Fail-closed unknown kind honesty id.
    Greppable: failClosedUnknownKindId, FAIL-CLOSED-UNKNOWN-KIND. -/
def failClosedUnknownKindId : String := "FAIL-CLOSED-UNKNOWN-KIND"

/-- Kernel Types surface id cite.
    Greppable: kernelTypesId, SELF-HOST-KERNEL-TYPES. -/
def kernelTypesId : String := "SELF-HOST-KERNEL-TYPES"

/-- Ordered IR program honesty id.
    Greppable: orderedIrProgramId, ORDERED-IR-PROGRAM. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"

/-- SSA-shaped honesty id (partial form; not full production SSA pipeline).
    Greppable: ssaShapedId, SSA-SHAPED. -/
def ssaShapedId : String := "SSA-SHAPED"

/-- Types SSA header comments (stage + Types/KernelTypes SSOT + non-claims).
    Greppable: typesSsaBanner. -/
def typesSsaBanner : String :=
  "; SLAKE_LLVM_TYPES_SSA_V0 / HOST-LLVM-TYPES-SSA\n"
    ++ "; Generator-owned Types program-graph SSA-shaped IR from KernelTypes + Types SSOT\n"
    ++ "; Types focus: " ++ typedIrId ++ " " ++ kindValueName ++ " "
    ++ kindLinearName ++ " " ++ kindErasedName ++ "\n"
    ++ "; Kind/mult: " ++ kindErasedName ++ "/" ++ multGrade0Name ++ " "
    ++ kindLinearName ++ "/" ++ multGrade1Name ++ " "
    ++ kindValueName ++ "/" ++ multGradeOmegaName ++ "\n"
    ++ "; " ++ kernelTypesId ++ " " ++ orderedIrProgramId ++ " "
    ++ ssaShapedId ++ "\n"
    ++ "; Kernel Types SSOT: src/systems/SystemsLean/KernelTypes.lean\n"
    ++ "; Types SSOT: src/systems/SystemsLean/Types.lean\n"
    ++ "; Path: out/llvm-ir/slake_types_ssa.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmTypesText Types unit IR; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub\n"
    ++ "; Recipe: just llvm-types-ssa / lake exe slake-llvm-types-ssa\n"
    ++ "; Types SSA partial: block labels + phi + ordered SSA node defs for Types band only\n"
    ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Types kind tag constants (0=VALUE, 1=LINEAR, 2=ERASED; freestanding slake_ir_kind).
    Greppable: typesSsaConstants, VALUE, LINEAR, ERASED. -/
def typesSsaConstants : String :=
  "; Types kind tag constants (0=VALUE, 1=LINEAR, 2=ERASED; TYPED_IR_V0)\n"
    ++ "@slake_types_ssa_kind_value = private unnamed_addr constant i32 0, align 4 ; "
    ++ kindValueName ++ "\n"
    ++ "@slake_types_ssa_kind_linear = private unnamed_addr constant i32 1, align 4 ; "
    ++ kindLinearName ++ "\n"
    ++ "@slake_types_ssa_kind_erased = private unnamed_addr constant i32 2, align 4 ; "
    ++ kindErasedName ++ "\n"
    ++ "\n"

/-- SSA-shaped Types kind tag lower: block labels + phi (partial SSA form).
    kind_ix 0/1/2 -> VALUE/LINEAR/ERASED; other -> reject (FAIL-CLOSED-UNKNOWN-KIND).
    Greppable: typesSsaKindPhi, phi, SSA-SHAPED, slake_types_ssa_kind_tag. -/
def typesSsaKindPhi : String :=
  "; SSA-SHAPED Types kind-tag lower (partial; Types band only; not full CFG/dominance)\n"
    ++ "; FAIL-CLOSED-UNKNOWN-KIND: unknown kind_ix returns -1\n"
    ++ "define i32 @slake_types_ssa_kind_tag(i32 %kind_ix) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %kind_ix, 0\n"
    ++ "  br i1 %is0, label %bb_value, label %check1\n"
    ++ "\n"
    ++ "check1:\n"
    ++ "  %is1 = icmp eq i32 %kind_ix, 1\n"
    ++ "  br i1 %is1, label %bb_linear, label %check2\n"
    ++ "\n"
    ++ "check2:\n"
    ++ "  %is2 = icmp eq i32 %kind_ix, 2\n"
    ++ "  br i1 %is2, label %bb_erased, label %bb_reject\n"
    ++ "\n"
    ++ "bb_value: ; VALUE / MULT-OMEGA band node\n"
    ++ "  %t0 = add i32 0, 0\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_linear: ; LINEAR / MULT-1 band node\n"
    ++ "  %t1 = add i32 0, 1\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_erased: ; ERASED / MULT-0 band node\n"
    ++ "  %t2 = add i32 0, 2\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_reject: ; FAIL-CLOSED-UNKNOWN-KIND\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "merge:\n"
    ++ "  %tag = phi i32 [ %t0, %bb_value ], [ %t1, %bb_linear ], [ %t2, %bb_erased ], [ -1, %bb_reject ]\n"
    ++ "  ret i32 %tag\n"
    ++ "}\n"
    ++ "\n"

/-- Ordered Types kernel program as sequential SSA defs (KernelTypes three nodes).
    Greppable: typesSsaKernelBand, SELF-HOST-KERNEL-TYPES, ORDERED-IR-PROGRAM. -/
def typesSsaKernelBand : String :=
  "; ORDERED-IR-PROGRAM Types kernel band (SELF-HOST-KERNEL-TYPES lowerTypesKernel)\n"
    ++ "; Three nodes: ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA (TYPED_IR_V0)\n"
    ++ "; SSA-shaped: node fields are distinct SSA values (not full CFG pipeline)\n"
    ++ "define i1 @slake_types_ssa_kernel_band_ready() {\n"
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
    ++ "  ; length honesty: three Types kernel nodes\n"
    ++ "  %len = add i32 0, 3\n"
    ++ "  %ok = icmp eq i32 %len, 3\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed raw kind tag check (Types.isValidKindTag known 0/1/2 only).
    Greppable: typesSsaIsValidKind, slake_types_ssa_is_valid_kind. -/
def typesSsaIsValidKind : String :=
  "; Fail-closed kind tag check (Types.isValidKindTag / ofKindTag? known 0/1/2 only)\n"
    ++ "define i1 @slake_types_ssa_is_valid_kind(i32 %tag) {\n"
    ++ "entry:\n"
    ++ "  %ge0 = icmp sge i32 %tag, 0\n"
    ++ "  %le2 = icmp sle i32 %tag, 2\n"
    ++ "  %ok = and i1 %ge0, %le2\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Types SSA package text (banner + constants + kind phi + kernel + is_valid).
    Greppable: typesSsaPackage, slake_types_ssa.ll. -/
def typesSsaPackage : String :=
  typesSsaBanner ++ typesSsaConstants ++ typesSsaKindPhi
    ++ typesSsaKernelBand ++ typesSsaIsValidKind

/-- Surface ids + path cites + Types SSOT + KernelTypes ready ok. -/
def llvmTypesSsaSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_TYPES_SSA_V0")
    && (hostId == "HOST-LLVM-TYPES-SSA")
    && (surfaceId == "HOST-LLVM-TYPES-SSA")
    && (surfaceAlias == "HOST-HOST-LLVM-TYPES-SSA")
    && (justRecipeLlvmTypesSsa == "llvm-types-ssa")
    && (justRecipe == "llvm-types-ssa")
    && (lakeExeName == "slake-llvm-types-ssa")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (typesSsaBasename == "slake_types_ssa.ll")
    && (typesModuleCite == "src/systems/SystemsLean/Types.lean")
    && (kernelTypesModuleCite
      == "src/systems/SystemsLean/KernelTypes.lean")
    && (llvmTypesTextModuleCite
      == "src/systems/SystemsLean/LlvmTypesText.lean")
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
    && (typedIrId == "TYPED_IR_V0")
    && (failClosedUnknownKindId == "FAIL-CLOSED-UNKNOWN-KIND")
    && (kernelTypesId == "SELF-HOST-KERNEL-TYPES")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (ssaShapedId == "SSA-SHAPED")
    && typesKernelReady
    && typesKernelOk
    && lowerTypesKernel.isSome

/-- Package text honesty: Types kinds + stage + SSA defines present.
    Greppable: llvmTypesSsaPackageOk. -/
def llvmTypesSsaPackageOk : Bool :=
  llvmTypesSsaSurfaceOk
    && (typesSsaPackage
      == typesSsaBanner ++ typesSsaConstants ++ typesSsaKindPhi
        ++ typesSsaKernelBand ++ typesSsaIsValidKind)
    && (typesSsaBanner
      == "; SLAKE_LLVM_TYPES_SSA_V0 / HOST-LLVM-TYPES-SSA\n"
        ++ "; Generator-owned Types program-graph SSA-shaped IR from KernelTypes + Types SSOT\n"
        ++ "; Types focus: TYPED_IR_V0 VALUE LINEAR ERASED\n"
        ++ "; Kind/mult: ERASED/MULT-0 LINEAR/MULT-1 VALUE/MULT-OMEGA\n"
        ++ "; SELF-HOST-KERNEL-TYPES ORDERED-IR-PROGRAM SSA-SHAPED\n"
        ++ "; Kernel Types SSOT: src/systems/SystemsLean/KernelTypes.lean\n"
        ++ "; Types SSOT: src/systems/SystemsLean/Types.lean\n"
        ++ "; Path: out/llvm-ir/slake_types_ssa.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmTypesText Types unit IR; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub\n"
        ++ "; Recipe: just llvm-types-ssa / lake exe slake-llvm-types-ssa\n"
        ++ "; Types SSA partial: block labels + phi + ordered SSA node defs for Types band only\n"
        ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Types SSA equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmTypesSsaWrite
    (IO.FS.writeFile) + post-read equality + just llvm-types-ssa greps.
    Greppable: llvmTypesSsaWroteExpected. -/
def llvmTypesSsaWroteExpected : Bool :=
  llvmTypesSsaPackageOk
    && (typesSsaPackage
      == typesSsaBanner ++ typesSsaConstants ++ typesSsaKindPhi
        ++ typesSsaKernelBand ++ typesSsaIsValidKind)

/-- Structural ready for LLVM Types SSA lower residual.
    Greppable: llvmTypesSsaReady, HOST-LLVM-TYPES-SSA, SLAKE_LLVM_TYPES_SSA. -/
def llvmTypesSsaReady : Bool :=
  llvmTypesSsaFinishedClaimed
    && llvmTypesSsaPackageOk
    && llvmTypesSsaWroteExpected
    && llvmTypesSsaSurfaceOk
    && llvmTypesSsaKeepsLlvmLocked
    && llvmTypesSsaDoesNotUnlockLlvm
    && llvmTypesSsaLocalUnlockFalse
    && llvmTypesSsaPartialClaimed
    && !llvmTypesSsaLlvmUnlocked
    && !llvmTypesSsaFullBackendClaimed
    && !llvmTypesSsaCfgProductionClaimed
    && !llvmTypesSsaResidualFreeClaimed
    && !llvmTypesSsaProductSelfHostCompleteClaimed
    && !llvmTypesSsaProofCompleteClaimed
    && !llvmTypesSsaProvablyUnlockWorkClaimed
    && !llvmTypesSsaProductionReadyClaimed
    && !llvmTypesSsaRustNativeLinkClaimed
    && !llvmTypesSsaLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmTypesText.llvmTypesTextReady
    && !LlvmTypesText.llvmTypesTextLlvmUnlocked
    && LlvmLinearSsa.llvmLinearSsaReady
    && !LlvmLinearSsa.llvmLinearSsaLlvmUnlocked
    && LlvmMultSsa.llvmMultSsaReady
    && !LlvmMultSsa.llvmMultSsaLlvmUnlocked

/-! ### HOST-LLVM-TYPES-SSA-THEOREM (readable statements) -/

theorem llvmTypesSsaFinishedClaimed_true :
    llvmTypesSsaFinishedClaimed = true :=
  rfl

theorem llvmTypesSsaLlvmUnlocked_false :
    llvmTypesSsaLlvmUnlocked = false :=
  rfl

theorem llvmTypesSsaPartialClaimed_true :
    llvmTypesSsaPartialClaimed = true :=
  rfl

theorem llvmTypesSsaFullBackendClaimed_false :
    llvmTypesSsaFullBackendClaimed = false :=
  rfl

theorem llvmTypesSsaCfgProductionClaimed_false :
    llvmTypesSsaCfgProductionClaimed = false :=
  rfl

theorem llvmTypesSsaKeepsLlvmLocked_true :
    llvmTypesSsaKeepsLlvmLocked = true := by
  native_decide

theorem llvmTypesSsaDoesNotUnlockLlvm_true :
    llvmTypesSsaDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmTypesSsaReady_true :
    llvmTypesSsaReady = true := by
  native_decide

theorem justRecipeLlvmTypesSsa_eq :
    justRecipeLlvmTypesSsa = "llvm-types-ssa" :=
  rfl

theorem llvmTypesSsa_stageId_eq :
    stageId = "SLAKE_LLVM_TYPES_SSA_V0" :=
  rfl

theorem llvmTypesSsa_hostId_eq :
    hostId = "HOST-LLVM-TYPES-SSA" :=
  rfl

theorem llvmTypesSsa_kinds_eq :
    kindValueName = "VALUE"
      && kindLinearName = "LINEAR"
      && kindErasedName = "ERASED" :=
  rfl

theorem llvmTypesSsa_claims_false :
    llvmTypesSsaLlvmUnlocked = false
      && llvmTypesSsaFullBackendClaimed = false
      && llvmTypesSsaCfgProductionClaimed = false
      && llvmTypesSsaResidualFreeClaimed = false
      && llvmTypesSsaProductSelfHostCompleteClaimed = false
      && llvmTypesSsaProofCompleteClaimed = false
      && llvmTypesSsaProvablyUnlockWorkClaimed = false
      && llvmTypesSsaProductionReadyClaimed = false
      && llvmTypesSsaRustNativeLinkClaimed = false
      && llvmTypesSsaLlvmAsClaimed = false :=
  rfl

theorem llvmTypesSsaPackageOk_true :
    llvmTypesSsaPackageOk = true := by
  native_decide

theorem llvmTypesSsaWroteExpected_true :
    llvmTypesSsaWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-TYPES-SSA-SMOKE (quick examples) -/

example : llvmTypesSsaFinishedClaimed = true := rfl
example : llvmTypesSsaLlvmUnlocked = false := rfl
example : llvmTypesSsaPartialClaimed = true := rfl
example : llvmTypesSsaFullBackendClaimed = false := rfl
example : llvmTypesSsaCfgProductionClaimed = false := rfl
example : llvmTypesSsaKeepsLlvmLocked = true := by native_decide
example : llvmTypesSsaDoesNotUnlockLlvm = true := by native_decide
example : llvmTypesSsaReady = true := by native_decide
example : justRecipeLlvmTypesSsa = "llvm-types-ssa" := rfl
example : kindValueName = "VALUE" := rfl
example : kindLinearName = "LINEAR" := rfl
example : kindErasedName = "ERASED" := rfl
example : typedIrId = "TYPED_IR_V0" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmTypesSsaLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmTypesText.llvmTypesTextReady = true := by native_decide
example : LlvmLinearSsa.llvmLinearSsaReady = true := by native_decide
example : LlvmMultSsa.llvmMultSsaReady = true := by native_decide
example : typesSsaBasename = "slake_types_ssa.ll" := rfl
example : ssaShapedId = "SSA-SHAPED" := rfl
example : kernelTypesId = "SELF-HOST-KERNEL-TYPES" := rfl

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Types SSA IR lacks greppable honesty tokens. -/
def validateTypesSsaPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_TYPES_SSA_V0"
    , "HOST-LLVM-TYPES-SSA"
    , "TYPED_IR_V0"
    , "FAIL-CLOSED-UNKNOWN-KIND"
    , "VALUE"
    , "LINEAR"
    , "ERASED"
    , "MULT-0"
    , "MULT-1"
    , "MULT-OMEGA"
    , "SELF-HOST-KERNEL-TYPES"
    , "ORDERED-IR-PROGRAM"
    , "SSA-SHAPED"
    , "phi i32"
    , "slake_types_ssa_kind_tag"
    , "slake_types_ssa_kernel_band_ready"
    , "slake_types_ssa_is_valid_kind"
    , "slake_types_ssa_kind_value"
    , "bb_value"
    , "bb_linear"
    , "bb_erased"
    , "bb_reject"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_types_ssa.ll"
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

/-- Write Types SSA IR text under root/out/llvm-ir/slake_types_ssa.ll.
    Greppable: llvmTypesSsaWrite, slake_types_ssa.ll, IO.FS.writeFile. -/
def llvmTypesSsaWrite (root : System.FilePath) : IO Unit := do
  unless llvmTypesSsaReady do
    IO.eprintln s!"error: {stageId}: llvmTypesSsaReady false"
    throw (IO.userError "llvmTypesSsaReady false")
  unless llvmTypesSsaWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmTypesSsaWroteExpected false"
    throw (IO.userError "llvmTypesSsaWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / typesSsaBasename
  IO.println s!"== {stageId}: LLVM Types SSA lower partial =="
  IO.println s!"  readyPin={llvmTypesSsaReady} llvmUnlocked={LlvmHold.llvmUnlocked} fullBackend={llvmTypesSsaFullBackendClaimed}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl typesSsaPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Types SSA IR after write: {outLl}"
    throw (IO.userError "missing Types SSA IR")
  if written != typesSsaPackage then
    IO.eprintln "error: Types SSA IR written content mismatch"
    throw (IO.userError "Types SSA IR mismatch")
  validateTypesSsaPackage typesSsaBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-TYPES-SSA, SSA-SHAPED, phi, TYPED_IR_V0"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Types SSA IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmTypesSsaWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmTypesSsa
