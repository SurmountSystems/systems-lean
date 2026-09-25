/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmProgramText.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveLlvmProgramTextSource. Not occupancy name 50. Not mill 70.
  This wrap is LlvmProgramText.lean. It is not LlvmHold.lean.
  It is not LlvmLinearText.lean. It is not LlvmMultText.lean.
  It is not LlvmTypesText.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmProgramTextSource,
  HOST-FRONT-LIVE-LLVM-PROGRAM-TEXT, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveLlvmProgramTextSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmProgramText

/-- Dual-pinned live LlvmProgramText.lean bytes (must match on-disk file).
    Greppable: liveLlvmProgramTextSource, HOST-FRONT-LIVE-LLVM-PROGRAM-TEXT. -/
def liveLlvmProgramTextSource : String := r###"/-
  SYSTEMS_LEAN_HOST partial -- LLVM IR Program text (ordered IR program unit
  IR fragment from Lean Program SSOT under out/llvm-ir). Generator-owned
  Program-related LLVM IR text. Composes LlvmHold hold honesty: living unlock true;
  local unlock pin false. Composes LlvmEmitPath design+stub path, LlvmMultText Mult IR
  peer, LlvmLinearText Linear IR peer, and LlvmTypesText Types IR peer. Not
  production LLVM backend. Not llvm-as pipeline. Not Rust-native link success.
  Not freestanding residual free re-open. Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-PROGRAM-TEXT, SLAKE_LLVM_PROGRAM_TEXT,
  SLAKE_LLVM_PROGRAM_TEXT_V0, HOST-HOST-LLVM-PROGRAM-TEXT, llvmProgramTextReady,
  llvmProgramTextFinishedClaimed, llvmProgramTextPackageOk,
  llvmProgramTextWroteExpected, llvmProgramTextKeepsLlvmLocked,
  llvmProgramTextDoesNotUnlockLlvm, llvmProgramTextLlvmUnlocked,
  llvmProgramTextLocalUnlockFalse, justRecipeLlvmProgramText, llvm-program-text,
  out/llvm-ir, slake_program.ll, programIrPackage, llvmProgramTextWrite,
  IO.FS.writeFile, IrProgram, ORDERED-IR-PROGRAM, EMPTY-PROGRAM-FAIL-CLOSED,
  SLAKE_IR_PROGRAM_CAP, programCap, push, isWellTyped, checkFailClosed,
  LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmMultText, LlvmLinearText,
  LlvmTypesText, HOST-LLVM-EMIT-PATH, HOST-LLVM-MULT-TEXT, HOST-LLVM-LINEAR-TEXT,
  HOST-LLVM-TYPES-TEXT, HOST-LLVM-PROGRAM-TEXT-SMOKE,
  HOST-LLVM-PROGRAM-TEXT-THEOREM, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.LlvmProgramText
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-program-text
  greps of out/llvm-ir/slake_program.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmProgramText; lake exe slake-llvm-program-text;
  just llvm-program-text; just systems-host when presence dual-pin staged.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock.
  Host elaborator residual remains. Program IR text only (not full backend).
  Not CFG. Not SSA. Not a second IR dialect.
-/

import SystemsLean.IrProgram
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmMultText
import SystemsLean.LlvmLinearText
import SystemsLean.LlvmTypesText

namespace SystemsLean.LlvmProgramText

open SystemsLean.IrProgram

/-! ### HOST-LLVM-PROGRAM-TEXT / SLAKE_LLVM_PROGRAM_TEXT

  Ordered IR program unit LLVM IR text fragment owned by Lean Program SSOT
  (programCap, push, isWellTyped / EMPTY-PROGRAM-FAIL-CLOSED, checkFailClosed).
  Written under out/llvm-ir/slake_program.ll. Does not unlock llvm. Not CFG/SSA.
-/

/-- Greppable primary stage id (LLVM IR Program text gate). -/
def stageId : String := "SLAKE_LLVM_PROGRAM_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-PROGRAM-TEXT"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-PROGRAM-TEXT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-PROGRAM-TEXT"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmProgramText, llvm-program-text. -/
def justRecipeLlvmProgramText : String := "llvm-program-text"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmProgramText

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-program-text. -/
def lakeExeName : String := "slake-llvm-program-text"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Program IR artifact basename under out/llvm-ir.
    Greppable: programIrBasename, slake_program.ll. -/
def programIrBasename : String := "slake_program.ll"

/-- Program host SSOT module path cite.
    Greppable: programModuleCite, IrProgram.lean. -/
def programModuleCite : String := "src/systems/SystemsLean/IrProgram.lean"

/-- Types IR peer module cite (prior residual).
    Greppable: llvmTypesTextModuleCite, LlvmTypesText. -/
def llvmTypesTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmTypesText.lean"

/-- Linear IR peer module cite (prior residual).
    Greppable: llvmLinearTextModuleCite, LlvmLinearText. -/
def llvmLinearTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmLinearText.lean"

/-- Mult IR peer module cite (prior residual).
    Greppable: llvmMultTextModuleCite, LlvmMultText. -/
def llvmMultTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmMultText.lean"

/-- Emit path module cite (design+stub residual).
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Program IR text).
    Greppable: llvmProgramTextFinishedClaimed. -/
def llvmProgramTextFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmProgramTextLlvmUnlocked, llvmProgramTextLocalUnlockFalse. -/
def llvmProgramTextLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmProgramTextLocalUnlockFalse. -/
def llvmProgramTextLocalUnlockFalse : Bool := !llvmProgramTextLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmProgramTextKeepsLlvmLocked. -/
def llvmProgramTextKeepsLlvmLocked : Bool :=
  !llvmProgramTextLlvmUnlocked

/-- Program IR text does not unlock llvm (fail-closed).
    Greppable: llvmProgramTextDoesNotUnlockLlvm. -/
def llvmProgramTextDoesNotUnlockLlvm : Bool :=
  llvmProgramTextKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmMultText.llvmMultTextKeepsLlvmLocked
    && LlvmLinearText.llvmLinearTextKeepsLlvmLocked
    && LlvmTypesText.llvmTypesTextKeepsLlvmLocked

/-- Local honesty: not freestanding residual free re-open. -/
def llvmProgramTextResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmProgramTextProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmProgramTextProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY as false (living tip true).
    Local pin stays false meaning "this module does not claim PROVABLY unlock
    work"; living LlvmHold.provablyUnlocked may be true. -/
def llvmProgramTextProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmProgramTextProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmProgramTextRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmProgramTextLlvmAsClaimed : Bool := false

/-- Local honesty: not CFG claim. -/
def llvmProgramTextCfgClaimed : Bool := false

/-- Local honesty: not SSA claim. -/
def llvmProgramTextSsaClaimed : Bool := false

/-- Fixed capacity from IrProgram SSOT (emit SLAKE_IR_PROGRAM_CAP map).
    Greppable: programCapValue, programCap, SLAKE_IR_PROGRAM_CAP. -/
def programCapValue : Nat := programCap

/-- String form of programCap for IR package text.
    Greppable: programCapStr. -/
def programCapStr : String := toString programCapValue

/-- Ordered IR program honesty id.
    Greppable: orderedIrProgramId, ORDERED-IR-PROGRAM. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"

/-- Empty program fail-closed honesty id from Program SSOT.
    Greppable: emptyProgramFailClosedId, EMPTY-PROGRAM-FAIL-CLOSED. -/
def emptyProgramFailClosedId : String := "EMPTY-PROGRAM-FAIL-CLOSED"

/-- Emit capacity map id (Program SSOT honesty).
    Greppable: programCapHonestyId, SLAKE_IR_PROGRAM_CAP. -/
def programCapHonestyId : String := "SLAKE_IR_PROGRAM_CAP"

/-- Program IR header comments (stage + Program SSOT + non-claims).
    Greppable: programIrBanner. -/
def programIrBanner : String :=
  "; SLAKE_LLVM_PROGRAM_TEXT_V0 / HOST-LLVM-PROGRAM-TEXT\n"
    ++ "; Generator-owned ordered IR program unit LLVM IR fragment from Systems Lean Program SSOT\n"
    ++ "; " ++ orderedIrProgramId ++ " " ++ programCapHonestyId ++ "="
    ++ programCapStr ++ " " ++ emptyProgramFailClosedId ++ "\n"
    ++ "; Surface: programCap push isWellTyped checkFailClosed (not CFG not SSA)\n"
    ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
    ++ "; Path: out/llvm-ir/slake_program.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmTypesText Types IR; LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub\n"
    ++ "; Recipe: just llvm-program-text / lake exe slake-llvm-program-text\n"
    ++ "; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "; Not CFG. Not SSA. Not a second IR dialect.\n"
    ++ "\n"

/-- Program surface constants (CAP + push result codes matching IrProgram map).
    Greppable: programIrConstants, SLAKE_IR_PROGRAM_CAP. -/
def programIrConstants : String :=
  "; Ordered IR program surface constants (IrProgram.programCap / push map)\n"
    ++ "; " ++ programCapHonestyId ++ " = " ++ programCapStr ++ "\n"
    ++ "; push: 0=ok, -1=badNode, -2=full (emit map)\n"
    ++ "@slake_program_cap = private unnamed_addr constant i32 "
    ++ programCapStr ++ ", align 4 ; " ++ programCapHonestyId ++ "\n"
    ++ "@slake_program_push_ok = private unnamed_addr constant i32 0, align 4 ; push ok\n"
    ++ "@slake_program_push_bad = private unnamed_addr constant i32 -1, align 4 ; badNode\n"
    ++ "@slake_program_push_full = private unnamed_addr constant i32 -2, align 4 ; full\n"
    ++ "\n"

/-- Empty program fail-closed well-typed sketch (IrProgram.isWellTyped empty = false).
    Greppable: programIrIsWellTypedEmpty, EMPTY-PROGRAM-FAIL-CLOSED. -/
def programIrIsWellTypedEmpty : String :=
  "; " ++ emptyProgramFailClosedId ++ " (IrProgram.isWellTyped empty is false)\n"
    ++ "; count 0 is not well-typed as a program (matches emit)\n"
    ++ "define i1 @slake_program_is_well_typed_empty() {\n"
    ++ "entry:\n"
    ++ "  ret i1 false\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed isWellTyped sketch: non-empty, count <= CAP, all nodes OK.
    Greppable: programIrSketches, slake_program_is_well_typed. -/
def programIrSketches : String :=
  "; isWellTyped sketch (count in 1..CAP; node checks omitted in text fragment)\n"
    ++ "; Oversize (count > CAP) and empty fail closed\n"
    ++ "define i1 @slake_program_is_well_typed(i32 %count) {\n"
    ++ "entry:\n"
    ++ "  %nz = icmp ne i32 %count, 0\n"
    ++ "  %le = icmp ule i32 %count, " ++ programCapStr ++ "\n"
    ++ "  %ok = and i1 %nz, %le\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; checkFailClosed sketch (same bar as isWellTyped on host V0)\n"
    ++ "define i1 @slake_program_check_fail_closed(i32 %count) {\n"
    ++ "entry:\n"
    ++ "  %ok = call i1 @slake_program_is_well_typed(i32 %count)\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; push capacity sketch: full when count >= CAP (returns -2)\n"
    ++ "; 0=ok path when count < CAP and node well-typed (node check omitted here)\n"
    ++ "define i32 @slake_program_push_capacity(i32 %count) {\n"
    ++ "entry:\n"
    ++ "  %full = icmp uge i32 %count, " ++ programCapStr ++ "\n"
    ++ "  %r = select i1 %full, i32 -2, i32 0\n"
    ++ "  ret i32 %r\n"
    ++ "}\n"

/-- Full Program IR package text (banner + constants + empty fail-closed + sketches).
    Greppable: programIrPackage, slake_program.ll. -/
def programIrPackage : String :=
  programIrBanner ++ programIrConstants ++ programIrIsWellTypedEmpty
    ++ programIrSketches

/-- Surface ids + path cites + Program SSOT pins ok. -/
def llvmProgramTextSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_PROGRAM_TEXT_V0")
    && (hostId == "HOST-LLVM-PROGRAM-TEXT")
    && (surfaceId == "HOST-LLVM-PROGRAM-TEXT")
    && (surfaceAlias == "HOST-HOST-LLVM-PROGRAM-TEXT")
    && (justRecipeLlvmProgramText == "llvm-program-text")
    && (justRecipe == "llvm-program-text")
    && (lakeExeName == "slake-llvm-program-text")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (programIrBasename == "slake_program.ll")
    && (programModuleCite == "src/systems/SystemsLean/IrProgram.lean")
    && (llvmTypesTextModuleCite
      == "src/systems/SystemsLean/LlvmTypesText.lean")
    && (llvmLinearTextModuleCite
      == "src/systems/SystemsLean/LlvmLinearText.lean")
    && (llvmMultTextModuleCite
      == "src/systems/SystemsLean/LlvmMultText.lean")
    && (llvmEmitPathModuleCite
      == "src/systems/SystemsLean/LlvmEmitPath.lean")
    && (llvmHoldModuleCite
      == "src/systems/SystemsLean/LlvmHold.lean")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (emptyProgramFailClosedId == "EMPTY-PROGRAM-FAIL-CLOSED")
    && (programCapHonestyId == "SLAKE_IR_PROGRAM_CAP")
    && (programCapValue == 8)
    && (programCapStr == "8")
    && (programCap == 8)
    && isEmpty empty
    && !isWellTyped empty
    && !checkFailClosed empty
    && (length empty == 0)

/-- Package text honesty: Program CAP + stage + define present.
    Greppable: llvmProgramTextPackageOk. -/
def llvmProgramTextPackageOk : Bool :=
  llvmProgramTextSurfaceOk
    && (programIrPackage
      == programIrBanner ++ programIrConstants ++ programIrIsWellTypedEmpty
        ++ programIrSketches)
    && (programIrBanner
      == "; SLAKE_LLVM_PROGRAM_TEXT_V0 / HOST-LLVM-PROGRAM-TEXT\n"
        ++ "; Generator-owned ordered IR program unit LLVM IR fragment from Systems Lean Program SSOT\n"
        ++ "; ORDERED-IR-PROGRAM SLAKE_IR_PROGRAM_CAP=8 EMPTY-PROGRAM-FAIL-CLOSED\n"
        ++ "; Surface: programCap push isWellTyped checkFailClosed (not CFG not SSA)\n"
        ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
        ++ "; Path: out/llvm-ir/slake_program.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmTypesText Types IR; LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub\n"
        ++ "; Recipe: just llvm-program-text / lake exe slake-llvm-program-text\n"
        ++ "; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "; Not CFG. Not SSA. Not a second IR dialect.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled Program IR equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmProgramTextWrite
    (IO.FS.writeFile) + post-read equality + just llvm-program-text greps.
    Greppable: llvmProgramTextWroteExpected. -/
def llvmProgramTextWroteExpected : Bool :=
  llvmProgramTextPackageOk
    && (programIrPackage
      == programIrBanner ++ programIrConstants ++ programIrIsWellTypedEmpty
        ++ programIrSketches)

/-- Structural ready for LLVM IR Program text residual.
    Greppable: llvmProgramTextReady, HOST-LLVM-PROGRAM-TEXT, SLAKE_LLVM_PROGRAM_TEXT. -/
def llvmProgramTextReady : Bool :=
  llvmProgramTextFinishedClaimed
    && llvmProgramTextPackageOk
    && llvmProgramTextWroteExpected
    && llvmProgramTextSurfaceOk
    && llvmProgramTextKeepsLlvmLocked
    && llvmProgramTextDoesNotUnlockLlvm
    && llvmProgramTextLocalUnlockFalse
    && !llvmProgramTextLlvmUnlocked
    && !llvmProgramTextResidualFreeClaimed
    && !llvmProgramTextProductSelfHostCompleteClaimed
    && !llvmProgramTextProofCompleteClaimed
    && !llvmProgramTextProvablyUnlockWorkClaimed
    && !llvmProgramTextProductionReadyClaimed
    && !llvmProgramTextRustNativeLinkClaimed
    && !llvmProgramTextLlvmAsClaimed
    && !llvmProgramTextCfgClaimed
    && !llvmProgramTextSsaClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmMultText.llvmMultTextReady
    && !LlvmMultText.llvmMultTextLlvmUnlocked
    && LlvmLinearText.llvmLinearTextReady
    && !LlvmLinearText.llvmLinearTextLlvmUnlocked
    && LlvmTypesText.llvmTypesTextReady
    && !LlvmTypesText.llvmTypesTextLlvmUnlocked

/-! ### HOST-LLVM-PROGRAM-TEXT-THEOREM (readable statements) -/

theorem llvmProgramTextFinishedClaimed_true :
    llvmProgramTextFinishedClaimed = true :=
  rfl

theorem llvmProgramTextLlvmUnlocked_false :
    llvmProgramTextLlvmUnlocked = false :=
  rfl

theorem llvmProgramTextKeepsLlvmLocked_true :
    llvmProgramTextKeepsLlvmLocked = true := by
  native_decide

theorem llvmProgramTextDoesNotUnlockLlvm_true :
    llvmProgramTextDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmProgramTextReady_true :
    llvmProgramTextReady = true := by
  native_decide

theorem justRecipeLlvmProgramText_eq :
    justRecipeLlvmProgramText = "llvm-program-text" :=
  rfl

theorem llvmProgramText_stageId_eq :
    stageId = "SLAKE_LLVM_PROGRAM_TEXT_V0" :=
  rfl

theorem llvmProgramText_hostId_eq :
    hostId = "HOST-LLVM-PROGRAM-TEXT" :=
  rfl

theorem llvmProgramText_program_surface_eq :
    orderedIrProgramId = "ORDERED-IR-PROGRAM"
      && emptyProgramFailClosedId = "EMPTY-PROGRAM-FAIL-CLOSED"
      && programCapHonestyId = "SLAKE_IR_PROGRAM_CAP"
      && programCapStr = "8"
      && programCapValue = 8 :=
  rfl

theorem llvmProgramText_claims_false :
    llvmProgramTextLlvmUnlocked = false
      && llvmProgramTextResidualFreeClaimed = false
      && llvmProgramTextProductSelfHostCompleteClaimed = false
      && llvmProgramTextProofCompleteClaimed = false
      && llvmProgramTextProvablyUnlockWorkClaimed = false
      && llvmProgramTextProductionReadyClaimed = false
      && llvmProgramTextRustNativeLinkClaimed = false
      && llvmProgramTextLlvmAsClaimed = false
      && llvmProgramTextCfgClaimed = false
      && llvmProgramTextSsaClaimed = false :=
  rfl

theorem llvmProgramTextPackageOk_true :
    llvmProgramTextPackageOk = true := by
  native_decide

theorem llvmProgramTextWroteExpected_true :
    llvmProgramTextWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-PROGRAM-TEXT-SMOKE (quick examples) -/

example : llvmProgramTextFinishedClaimed = true := rfl
example : llvmProgramTextLlvmUnlocked = false := rfl
example : llvmProgramTextKeepsLlvmLocked = true := by native_decide
example : llvmProgramTextDoesNotUnlockLlvm = true := by native_decide
example : llvmProgramTextReady = true := by native_decide
example : justRecipeLlvmProgramText = "llvm-program-text" := rfl
example : orderedIrProgramId = "ORDERED-IR-PROGRAM" := rfl
example : emptyProgramFailClosedId = "EMPTY-PROGRAM-FAIL-CLOSED" := rfl
example : programCapHonestyId = "SLAKE_IR_PROGRAM_CAP" := rfl
example : programCapStr = "8" := rfl
example : programCapValue = 8 := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmProgramTextLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmMultText.llvmMultTextReady = true := by native_decide
example : LlvmLinearText.llvmLinearTextReady = true := by native_decide
example : LlvmTypesText.llvmTypesTextReady = true := by native_decide
example : llvmProgramTextProductionReadyClaimed = false := rfl
example : llvmProgramTextLlvmAsClaimed = false := rfl
example : llvmProgramTextCfgClaimed = false := rfl
example : llvmProgramTextSsaClaimed = false := rfl
example : programIrBasename = "slake_program.ll" := rfl
example : isEmpty empty = true := rfl
example : isWellTyped empty = false := by native_decide

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Program IR lacks greppable honesty tokens. -/
def validateProgramIrPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_PROGRAM_TEXT_V0"
    , "HOST-LLVM-PROGRAM-TEXT"
    , "ORDERED-IR-PROGRAM"
    , "EMPTY-PROGRAM-FAIL-CLOSED"
    , "SLAKE_IR_PROGRAM_CAP"
    , "programCap"
    , "push"
    , "isWellTyped"
    , "checkFailClosed"
    , "slake_program_cap"
    , "slake_program_is_well_typed_empty"
    , "slake_program_is_well_typed"
    , "slake_program_check_fail_closed"
    , "slake_program_push_capacity"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_program.ll"
    , "Not production LLVM backend"
    , "Not CFG"
    , "Not SSA"
    ]
  for t in need do
    unless containsSub text t do
      IO.eprintln s!"error: {label}: missing greppable token {t}"
      throw (IO.userError s!"{label}: missing {t}")
  -- Must not claim unlock or full freestanding dialect stage.
  if containsSub text "llvmUnlocked = true" then
    IO.eprintln s!"error: {label}: unexpected llvmUnlocked true claim"
    throw (IO.userError s!"{label}: unlock forge")
  if containsSub text "SLAKE_EMIT_FREESTANDING_C_V0" then
    IO.eprintln s!"error: {label}: unexpected freestanding C emit stage"
    throw (IO.userError s!"{label}: freestanding stage")

/-- Write Program unit LLVM IR text under root/out/llvm-ir/slake_program.ll.
    Greppable: llvmProgramTextWrite, slake_program.ll, IO.FS.writeFile. -/
def llvmProgramTextWrite (root : System.FilePath) : IO Unit := do
  unless llvmProgramTextReady do
    IO.eprintln s!"error: {stageId}: llvmProgramTextReady false"
    throw (IO.userError "llvmProgramTextReady false")
  unless llvmProgramTextWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmProgramTextWroteExpected false"
    throw (IO.userError "llvmProgramTextWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / programIrBasename
  IO.println s!"== {stageId}: LLVM IR Program text =="
  IO.println s!"  readyPin={llvmProgramTextReady} llvmUnlocked={LlvmHold.llvmUnlocked}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl programIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Program IR after write: {outLl}"
    throw (IO.userError "missing Program IR")
  if written != programIrPackage then
    IO.eprintln "error: Program IR written content mismatch"
    throw (IO.userError "Program IR mismatch")
  validateProgramIrPackage programIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-PROGRAM-TEXT, ORDERED-IR-PROGRAM, CAP=8, EMPTY-PROGRAM-FAIL-CLOSED"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend; not CFG/SSA"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Program IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmProgramTextWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmProgramText
"###

end SystemsLean.HostFrontLiveLlvmProgramText
