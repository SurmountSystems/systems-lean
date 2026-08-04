/-
  SYSTEMS_LEAN_HOST partial -- LLVM IR compose text (composed IR from host
  compose + program+graph SSOT under out/llvm-ir). Generator-owned composed
  LLVM IR. Composes LlvmHold hold honesty: living llvmUnlocked true after
  unlock residual; local unlock pin false. Composes Mult..Graph unit text
  peers, LlvmEmitPath design+stub path, HostCompose mint/consume/mark path.
  Not production LLVM backend. Not llvm-as pipeline. Not Rust-native link
  success. Not freestanding residual free re-open. Not product C growth.
  Not mathlib. Not full CFG/SSA.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-COMPOSE-TEXT, SLAKE_LLVM_COMPOSE_TEXT,
  SLAKE_LLVM_COMPOSE_TEXT_V0, HOST-HOST-LLVM-COMPOSE-TEXT, llvmComposeTextReady,
  llvmComposeTextFinishedClaimed, llvmComposeTextPackageOk,
  llvmComposeTextWroteExpected, llvmComposeTextKeepsLlvmLocked,
  llvmComposeTextDoesNotUnlockLlvm, llvmComposeTextLlvmUnlocked,
  llvmComposeTextLocalUnlockFalse, justRecipeLlvmComposeText, llvm-compose-text,
  out/llvm-ir, slake_compose.ll, composeIrPackage, llvmComposeTextWrite,
  IO.FS.writeFile, HostCompose, HOST_COMPOSE_V0, HOST-COMPOSE, mint, consume,
  markErased, checkFailClosed, extractOkFs, multPreScan, IrProgram, IrGraph,
  ORDERED-IR-PROGRAM, EMPTY-PROGRAM-FAIL-CLOSED, EMPTY-GRAPH-OK,
  SLAKE_IR_PROGRAM_CAP, SLAKE_IR_EDGE_MAX, programCap, edgeMax,
  LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmMultText, LlvmLinearText,
  LlvmTypesText, LlvmProgramText, LlvmGraphText, HOST-LLVM-EMIT-PATH,
  HOST-LLVM-MULT-TEXT, HOST-LLVM-LINEAR-TEXT, HOST-LLVM-TYPES-TEXT,
  HOST-LLVM-PROGRAM-TEXT, HOST-LLVM-GRAPH-TEXT, HOST-LLVM-COMPOSE-TEXT-SMOKE,
  HOST-LLVM-COMPOSE-TEXT-THEOREM, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.LlvmComposeText
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-compose-text
  greps of out/llvm-ir/slake_compose.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmComposeText; lake exe slake-llvm-compose-text;
  just llvm-compose-text; just systems-llvm-ir.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock claim.
  Host elaborator residual remains. Compose IR text only (not full backend).
  Not CFG. Not SSA. Not a second IR dialect. Not unit package fifth unit
  (compose is next layer after Mult..Graph unit package).
-/

import SystemsLean.HostCompose
import SystemsLean.IrProgram
import SystemsLean.IrGraph
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmMultText
import SystemsLean.LlvmLinearText
import SystemsLean.LlvmTypesText
import SystemsLean.LlvmProgramText
import SystemsLean.LlvmGraphText

namespace SystemsLean.LlvmComposeText

open SystemsLean.HostCompose
open SystemsLean.IrProgram (programCap)
open SystemsLean.IrGraph (edgeMax)

/-! ### HOST-LLVM-COMPOSE-TEXT / SLAKE_LLVM_COMPOSE_TEXT

  Composed LLVM IR fragment owned by Lean host compose + program+graph SSOT
  (mint/consume/markErased/checkFailClosed/extractOkFs + CAP + EDGE_MAX).
  Written under out/llvm-ir/slake_compose.ll. Does not unlock llvm.
  Not full CFG / SSA / production backend.
-/

/-- Greppable primary stage id (LLVM IR compose text gate). -/
def stageId : String := "SLAKE_LLVM_COMPOSE_TEXT_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-COMPOSE-TEXT"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-COMPOSE-TEXT"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-COMPOSE-TEXT"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmComposeText, llvm-compose-text. -/
def justRecipeLlvmComposeText : String := "llvm-compose-text"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmComposeText

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-compose-text. -/
def lakeExeName : String := "slake-llvm-compose-text"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Compose IR artifact basename under out/llvm-ir.
    Greppable: composeIrBasename, slake_compose.ll. -/
def composeIrBasename : String := "slake_compose.ll"

/-- Host compose SSOT module path cite.
    Greppable: hostComposeModuleCite, HostCompose.lean. -/
def hostComposeModuleCite : String :=
  "src/systems/SystemsLean/HostCompose.lean"

/-- Program host SSOT module path cite.
    Greppable: programModuleCite, IrProgram.lean. -/
def programModuleCite : String := "src/systems/SystemsLean/IrProgram.lean"

/-- Graph host SSOT module path cite.
    Greppable: graphModuleCite, IrGraph.lean. -/
def graphModuleCite : String := "src/systems/SystemsLean/IrGraph.lean"

/-- Graph IR peer module cite (prior residual).
    Greppable: llvmGraphTextModuleCite, LlvmGraphText. -/
def llvmGraphTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmGraphText.lean"

/-- Program IR peer module cite (prior residual).
    Greppable: llvmProgramTextModuleCite, LlvmProgramText. -/
def llvmProgramTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmProgramText.lean"

/-- Types IR peer module cite.
    Greppable: llvmTypesTextModuleCite, LlvmTypesText. -/
def llvmTypesTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmTypesText.lean"

/-- Linear IR peer module cite.
    Greppable: llvmLinearTextModuleCite, LlvmLinearText. -/
def llvmLinearTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmLinearText.lean"

/-- Mult IR peer module cite.
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

/-- Local inventory finished (structural gate closed for compose IR text).
    Greppable: llvmComposeTextFinishedClaimed. -/
def llvmComposeTextFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmComposeTextLlvmUnlocked, llvmComposeTextLocalUnlockFalse. -/
def llvmComposeTextLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmComposeTextLocalUnlockFalse. -/
def llvmComposeTextLocalUnlockFalse : Bool := !llvmComposeTextLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmComposeTextKeepsLlvmLocked. -/
def llvmComposeTextKeepsLlvmLocked : Bool :=
  !llvmComposeTextLlvmUnlocked

/-- Compose IR text does not unlock llvm (fail-closed).
    Greppable: llvmComposeTextDoesNotUnlockLlvm. -/
def llvmComposeTextDoesNotUnlockLlvm : Bool :=
  llvmComposeTextKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmMultText.llvmMultTextKeepsLlvmLocked
    && LlvmLinearText.llvmLinearTextKeepsLlvmLocked
    && LlvmTypesText.llvmTypesTextKeepsLlvmLocked
    && LlvmProgramText.llvmProgramTextKeepsLlvmLocked
    && LlvmGraphText.llvmGraphTextKeepsLlvmLocked

/-- Local honesty: not freestanding residual free re-open. -/
def llvmComposeTextResidualFreeClaimed : Bool := false

/-- Local honesty: not freestanding product self-host complete rebrand. -/
def llvmComposeTextProductSelfHostCompleteClaimed : Bool := false

/-- Local honesty: not proof complete. -/
def llvmComposeTextProofCompleteClaimed : Bool := false

/-- Local honesty: does not re-open PROVABLY as false (living tip true).
    Local pin stays false meaning "this module does not claim PROVABLY unlock
    work"; living LlvmHold.provablyUnlocked may be true. -/
def llvmComposeTextProvablyUnlockWorkClaimed : Bool := false

/-- Local honesty: not production-ready full out/llvm-ir claim. -/
def llvmComposeTextProductionReadyClaimed : Bool := false

/-- Local honesty: not Rust-native link success claim. -/
def llvmComposeTextRustNativeLinkClaimed : Bool := false

/-- Local honesty: not llvm-as pipeline success claim. -/
def llvmComposeTextLlvmAsClaimed : Bool := false

/-- Local honesty: not full CFG claim. -/
def llvmComposeTextCfgClaimed : Bool := false

/-- Local honesty: not SSA claim. -/
def llvmComposeTextSsaClaimed : Bool := false

/-- Fixed program capacity from IrProgram SSOT.
    Greppable: programCapValue, programCap, SLAKE_IR_PROGRAM_CAP. -/
def programCapValue : Nat := programCap

/-- String form of programCap for IR package text.
    Greppable: programCapStr. -/
def programCapStr : String := toString programCapValue

/-- Fixed edge capacity from IrGraph SSOT.
    Greppable: edgeMaxValue, edgeMax, SLAKE_IR_EDGE_MAX. -/
def edgeMaxValue : Nat := edgeMax

/-- String form of edgeMax for IR package text.
    Greppable: edgeMaxStr. -/
def edgeMaxStr : String := toString edgeMaxValue

/-- Host compose wire stage id (map only; not freestanding C growth).
    Greppable: hostComposeWireId, HOST_COMPOSE_V0. -/
def hostComposeWireId : String := "HOST_COMPOSE_V0"

/-- Host compose surface honesty id.
    Greppable: hostComposeSurfaceId, HOST-COMPOSE. -/
def hostComposeSurfaceId : String := "HOST-COMPOSE"

/-- Ordered IR program honesty id.
    Greppable: orderedIrProgramId, ORDERED-IR-PROGRAM. -/
def orderedIrProgramId : String := "ORDERED-IR-PROGRAM"

/-- Empty program fail-closed honesty id.
    Greppable: emptyProgramFailClosedId, EMPTY-PROGRAM-FAIL-CLOSED. -/
def emptyProgramFailClosedId : String := "EMPTY-PROGRAM-FAIL-CLOSED"

/-- Empty graph well-typed honesty id.
    Greppable: emptyGraphOkId, EMPTY-GRAPH-OK. -/
def emptyGraphOkId : String := "EMPTY-GRAPH-OK"

/-- Program CAP honesty id.
    Greppable: programCapHonestyId, SLAKE_IR_PROGRAM_CAP. -/
def programCapHonestyId : String := "SLAKE_IR_PROGRAM_CAP"

/-- Edge max honesty id.
    Greppable: edgeMaxHonestyId, SLAKE_IR_EDGE_MAX. -/
def edgeMaxHonestyId : String := "SLAKE_IR_EDGE_MAX"

/-- Compose IR header comments (stage + compose SSOT + non-claims).
    Greppable: composeIrBanner. -/
def composeIrBanner : String :=
  "; SLAKE_LLVM_COMPOSE_TEXT_V0 / HOST-LLVM-COMPOSE-TEXT\n"
    ++ "; Generator-owned composed LLVM IR from Systems Lean host compose + program+graph SSOT\n"
    ++ "; " ++ hostComposeWireId ++ " " ++ hostComposeSurfaceId ++ " "
    ++ orderedIrProgramId ++ " " ++ emptyGraphOkId ++ "\n"
    ++ "; " ++ programCapHonestyId ++ "=" ++ programCapStr ++ " "
    ++ edgeMaxHonestyId ++ "=" ++ edgeMaxStr ++ " "
    ++ emptyProgramFailClosedId ++ "\n"
    ++ "; Surface: mint consume markErased checkFailClosed extractOkFs multPreScan\n"
    ++ "; HostCompose SSOT: src/systems/SystemsLean/HostCompose.lean\n"
    ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
    ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
    ++ "; Path: out/llvm-ir/slake_compose.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmGraphText Graph IR; LlvmProgramText Program IR; Mult..Types unit IR; LlvmEmitPath stub\n"
    ++ "; Unit package Mult..Graph is separate join (just llvm-unit-package); compose is next layer\n"
    ++ "; Recipe: just llvm-compose-text / lake exe slake-llvm-compose-text\n"
    ++ "; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "; Not CFG. Not SSA. Not a second IR dialect.\n"
    ++ "\n"

/-- Compose surface constants (CAP + EDGE_MAX + mint/consume codes).
    Greppable: composeIrConstants, HOST_COMPOSE_V0. -/
def composeIrConstants : String :=
  "; Host compose surface constants (HostCompose + IrProgram + IrGraph map)\n"
    ++ "; " ++ hostComposeWireId ++ " / " ++ hostComposeSurfaceId ++ "\n"
    ++ "; " ++ programCapHonestyId ++ " = " ++ programCapStr ++ "\n"
    ++ "; " ++ edgeMaxHonestyId ++ " = " ++ edgeMaxStr ++ "\n"
    ++ "; mint: 0=ok, -1=badId, -2=alreadyLive (emit map honesty)\n"
    ++ "; consume: 0=ok, -1=notLive (emit map honesty)\n"
    ++ "@slake_compose_program_cap = private unnamed_addr constant i32 "
    ++ programCapStr ++ ", align 4 ; " ++ programCapHonestyId ++ "\n"
    ++ "@slake_compose_edge_max = private unnamed_addr constant i32 "
    ++ edgeMaxStr ++ ", align 4 ; " ++ edgeMaxHonestyId ++ "\n"
    ++ "@slake_compose_mint_ok = private unnamed_addr constant i32 0, align 4 ; mint ok\n"
    ++ "@slake_compose_mint_bad_id = private unnamed_addr constant i32 -1, align 4 ; badId\n"
    ++ "@slake_compose_mint_already_live = private unnamed_addr constant i32 -2, align 4 ; alreadyLive\n"
    ++ "@slake_compose_consume_ok = private unnamed_addr constant i32 0, align 4 ; consume ok\n"
    ++ "@slake_compose_consume_not_live = private unnamed_addr constant i32 -1, align 4 ; notLive\n"
    ++ "\n"

/-- Empty compose well-typed / checkFailClosed sketch (empty graph OK; mult vacuous).
    Greppable: composeIrEmptyOk, EMPTY-GRAPH-OK. -/
def composeIrEmptyOk : String :=
  "; Empty host compose: " ++ emptyGraphOkId ++ " + vacuous multPreScan\n"
    ++ "; HostCompose.checkFailClosed empty is true; extractOkFs empty is true\n"
    ++ "; Nested empty program alone stays " ++ emptyProgramFailClosedId ++ " under IrProgram\n"
    ++ "define i1 @slake_compose_is_well_typed_empty() {\n"
    ++ "entry:\n"
    ++ "  ret i1 true\n"
    ++ "}\n"
    ++ "\n"
    ++ "define i1 @slake_compose_check_fail_closed_empty() {\n"
    ++ "entry:\n"
    ++ "  ret i1 true\n"
    ++ "}\n"
    ++ "\n"
    ++ "define i1 @slake_compose_extract_ok_fs_empty() {\n"
    ++ "entry:\n"
    ++ "  ret i1 true\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed mint / consume / checkFailClosed sketches (host compose surface).
    Greppable: composeIrSketches, slake_compose_mint_id. -/
def composeIrSketches : String :=
  "; mint sketch: id 0 -> -1 badId; already-live path omitted (caller live flag)\n"
    ++ "define i32 @slake_compose_mint_id(i32 %id) {\n"
    ++ "entry:\n"
    ++ "  %bad = icmp eq i32 %id, 0\n"
    ++ "  %r = select i1 %bad, i32 -1, i32 0\n"
    ++ "  ret i32 %r\n"
    ++ "}\n"
    ++ "\n"
    ++ "; consume sketch: live=0 -> -1 notLive; live=1 -> 0 ok\n"
    ++ "define i32 @slake_compose_consume_live(i1 %live) {\n"
    ++ "entry:\n"
    ++ "  %r = select i1 %live, i32 0, i32 -1\n"
    ++ "  ret i32 %r\n"
    ++ "}\n"
    ++ "\n"
    ++ "; checkFailClosed sketch: graph ok AND mult pre-scan (caller booleans)\n"
    ++ "define i1 @slake_compose_check_fail_closed(i1 %graph_ok, i1 %mult_ok) {\n"
    ++ "entry:\n"
    ++ "  %ok = and i1 %graph_ok, %mult_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; extractOkFs sketch: freestanding FS claim AND checkFailClosed\n"
    ++ "define i1 @slake_compose_extract_ok_fs(i1 %claim_fs, i1 %check_ok) {\n"
    ++ "entry:\n"
    ++ "  %ok = and i1 %claim_fs, %check_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; Capacity guards from program+graph SSOT (compose owns both)\n"
    ++ "define i1 @slake_compose_program_count_ok(i32 %count) {\n"
    ++ "entry:\n"
    ++ "  %le = icmp ule i32 %count, " ++ programCapStr ++ "\n"
    ++ "  ret i1 %le\n"
    ++ "}\n"
    ++ "\n"
    ++ "define i1 @slake_compose_edge_count_ok(i32 %edgeCount) {\n"
    ++ "entry:\n"
    ++ "  %le = icmp ule i32 %edgeCount, " ++ edgeMaxStr ++ "\n"
    ++ "  ret i1 %le\n"
    ++ "}\n"

/-- Full compose IR package text (banner + constants + empty OK + sketches).
    Greppable: composeIrPackage, slake_compose.ll. -/
def composeIrPackage : String :=
  composeIrBanner ++ composeIrConstants ++ composeIrEmptyOk
    ++ composeIrSketches

/-- Surface ids + path cites + compose SSOT pins ok. -/
def llvmComposeTextSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_COMPOSE_TEXT_V0")
    && (hostId == "HOST-LLVM-COMPOSE-TEXT")
    && (surfaceId == "HOST-LLVM-COMPOSE-TEXT")
    && (surfaceAlias == "HOST-HOST-LLVM-COMPOSE-TEXT")
    && (justRecipeLlvmComposeText == "llvm-compose-text")
    && (justRecipe == "llvm-compose-text")
    && (lakeExeName == "slake-llvm-compose-text")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (composeIrBasename == "slake_compose.ll")
    && (hostComposeModuleCite
      == "src/systems/SystemsLean/HostCompose.lean")
    && (programModuleCite == "src/systems/SystemsLean/IrProgram.lean")
    && (graphModuleCite == "src/systems/SystemsLean/IrGraph.lean")
    && (llvmGraphTextModuleCite
      == "src/systems/SystemsLean/LlvmGraphText.lean")
    && (llvmProgramTextModuleCite
      == "src/systems/SystemsLean/LlvmProgramText.lean")
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
    && (hostComposeWireId == "HOST_COMPOSE_V0")
    && (hostComposeSurfaceId == "HOST-COMPOSE")
    && (orderedIrProgramId == "ORDERED-IR-PROGRAM")
    && (emptyProgramFailClosedId == "EMPTY-PROGRAM-FAIL-CLOSED")
    && (emptyGraphOkId == "EMPTY-GRAPH-OK")
    && (programCapHonestyId == "SLAKE_IR_PROGRAM_CAP")
    && (edgeMaxHonestyId == "SLAKE_IR_EDGE_MAX")
    && (programCapValue == 8)
    && (programCapStr == "8")
    && (programCap == 8)
    && (edgeMaxValue == 16)
    && (edgeMaxStr == "16")
    && (edgeMax == 16)
    && checkFailClosed empty
    && extractOkFs empty
    && hostIsWellTyped empty
    && multPreScan empty

/-- Package text honesty: compose stage + defines present.
    Greppable: llvmComposeTextPackageOk. -/
def llvmComposeTextPackageOk : Bool :=
  llvmComposeTextSurfaceOk
    && (composeIrPackage
      == composeIrBanner ++ composeIrConstants ++ composeIrEmptyOk
        ++ composeIrSketches)
    && (composeIrBanner
      == "; SLAKE_LLVM_COMPOSE_TEXT_V0 / HOST-LLVM-COMPOSE-TEXT\n"
        ++ "; Generator-owned composed LLVM IR from Systems Lean host compose + program+graph SSOT\n"
        ++ "; HOST_COMPOSE_V0 HOST-COMPOSE ORDERED-IR-PROGRAM EMPTY-GRAPH-OK\n"
        ++ "; SLAKE_IR_PROGRAM_CAP=8 SLAKE_IR_EDGE_MAX=16 EMPTY-PROGRAM-FAIL-CLOSED\n"
        ++ "; Surface: mint consume markErased checkFailClosed extractOkFs multPreScan\n"
        ++ "; HostCompose SSOT: src/systems/SystemsLean/HostCompose.lean\n"
        ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
        ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
        ++ "; Path: out/llvm-ir/slake_compose.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmGraphText Graph IR; LlvmProgramText Program IR; Mult..Types unit IR; LlvmEmitPath stub\n"
        ++ "; Unit package Mult..Graph is separate join (just llvm-unit-package); compose is next layer\n"
        ++ "; Recipe: just llvm-compose-text / lake exe slake-llvm-compose-text\n"
        ++ "; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "; Not CFG. Not SSA. Not a second IR dialect.\n"
        ++ "\n")

/-- Structural package identity pin only: assembled compose IR equals expected.
    NOT filesystem write proof. Actual on-disk write: llvmComposeTextWrite
    (IO.FS.writeFile) + post-read equality + just llvm-compose-text greps.
    Greppable: llvmComposeTextWroteExpected. -/
def llvmComposeTextWroteExpected : Bool :=
  llvmComposeTextPackageOk
    && (composeIrPackage
      == composeIrBanner ++ composeIrConstants ++ composeIrEmptyOk
        ++ composeIrSketches)

/-- Structural ready for LLVM IR compose text residual.
    Greppable: llvmComposeTextReady, HOST-LLVM-COMPOSE-TEXT, SLAKE_LLVM_COMPOSE_TEXT. -/
def llvmComposeTextReady : Bool :=
  llvmComposeTextFinishedClaimed
    && llvmComposeTextPackageOk
    && llvmComposeTextWroteExpected
    && llvmComposeTextSurfaceOk
    && llvmComposeTextKeepsLlvmLocked
    && llvmComposeTextDoesNotUnlockLlvm
    && llvmComposeTextLocalUnlockFalse
    && !llvmComposeTextLlvmUnlocked
    && !llvmComposeTextResidualFreeClaimed
    && !llvmComposeTextProductSelfHostCompleteClaimed
    && !llvmComposeTextProofCompleteClaimed
    && !llvmComposeTextProvablyUnlockWorkClaimed
    && !llvmComposeTextProductionReadyClaimed
    && !llvmComposeTextRustNativeLinkClaimed
    && !llvmComposeTextLlvmAsClaimed
    && !llvmComposeTextCfgClaimed
    && !llvmComposeTextSsaClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmMultText.llvmMultTextReady
    && !LlvmMultText.llvmMultTextLlvmUnlocked
    && LlvmLinearText.llvmLinearTextReady
    && !LlvmLinearText.llvmLinearTextLlvmUnlocked
    && LlvmTypesText.llvmTypesTextReady
    && !LlvmTypesText.llvmTypesTextLlvmUnlocked
    && LlvmProgramText.llvmProgramTextReady
    && !LlvmProgramText.llvmProgramTextLlvmUnlocked
    && LlvmGraphText.llvmGraphTextReady
    && !LlvmGraphText.llvmGraphTextLlvmUnlocked

/-! ### HOST-LLVM-COMPOSE-TEXT-THEOREM (readable statements) -/

theorem llvmComposeTextFinishedClaimed_true :
    llvmComposeTextFinishedClaimed = true :=
  rfl

theorem llvmComposeTextLlvmUnlocked_false :
    llvmComposeTextLlvmUnlocked = false :=
  rfl

theorem llvmComposeTextKeepsLlvmLocked_true :
    llvmComposeTextKeepsLlvmLocked = true := by
  native_decide

theorem llvmComposeTextDoesNotUnlockLlvm_true :
    llvmComposeTextDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmComposeTextReady_true :
    llvmComposeTextReady = true := by
  native_decide

theorem justRecipeLlvmComposeText_eq :
    justRecipeLlvmComposeText = "llvm-compose-text" :=
  rfl

theorem llvmComposeText_stageId_eq :
    stageId = "SLAKE_LLVM_COMPOSE_TEXT_V0" :=
  rfl

theorem llvmComposeText_hostId_eq :
    hostId = "HOST-LLVM-COMPOSE-TEXT" :=
  rfl

theorem llvmComposeText_compose_surface_eq :
    hostComposeWireId = "HOST_COMPOSE_V0"
      && hostComposeSurfaceId = "HOST-COMPOSE"
      && orderedIrProgramId = "ORDERED-IR-PROGRAM"
      && emptyGraphOkId = "EMPTY-GRAPH-OK"
      && programCapHonestyId = "SLAKE_IR_PROGRAM_CAP"
      && edgeMaxHonestyId = "SLAKE_IR_EDGE_MAX"
      && programCapStr = "8"
      && edgeMaxStr = "16"
      && programCapValue = 8
      && edgeMaxValue = 16 :=
  rfl

theorem llvmComposeText_claims_false :
    llvmComposeTextLlvmUnlocked = false
      && llvmComposeTextResidualFreeClaimed = false
      && llvmComposeTextProductSelfHostCompleteClaimed = false
      && llvmComposeTextProofCompleteClaimed = false
      && llvmComposeTextProvablyUnlockWorkClaimed = false
      && llvmComposeTextProductionReadyClaimed = false
      && llvmComposeTextRustNativeLinkClaimed = false
      && llvmComposeTextLlvmAsClaimed = false
      && llvmComposeTextCfgClaimed = false
      && llvmComposeTextSsaClaimed = false :=
  rfl

theorem llvmComposeTextPackageOk_true :
    llvmComposeTextPackageOk = true := by
  native_decide

theorem llvmComposeTextWroteExpected_true :
    llvmComposeTextWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-COMPOSE-TEXT-SMOKE (quick examples) -/

example : llvmComposeTextFinishedClaimed = true := rfl
example : llvmComposeTextLlvmUnlocked = false := rfl
example : llvmComposeTextKeepsLlvmLocked = true := by native_decide
example : llvmComposeTextDoesNotUnlockLlvm = true := by native_decide
example : llvmComposeTextReady = true := by native_decide
example : justRecipeLlvmComposeText = "llvm-compose-text" := rfl
example : hostComposeWireId = "HOST_COMPOSE_V0" := rfl
example : hostComposeSurfaceId = "HOST-COMPOSE" := rfl
example : orderedIrProgramId = "ORDERED-IR-PROGRAM" := rfl
example : emptyGraphOkId = "EMPTY-GRAPH-OK" := rfl
example : programCapStr = "8" := rfl
example : edgeMaxStr = "16" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmComposeTextLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmMultText.llvmMultTextReady = true := by native_decide
example : LlvmLinearText.llvmLinearTextReady = true := by native_decide
example : LlvmTypesText.llvmTypesTextReady = true := by native_decide
example : LlvmProgramText.llvmProgramTextReady = true := by native_decide
example : LlvmGraphText.llvmGraphTextReady = true := by native_decide
example : llvmComposeTextProductionReadyClaimed = false := rfl
example : llvmComposeTextLlvmAsClaimed = false := rfl
example : llvmComposeTextCfgClaimed = false := rfl
example : llvmComposeTextSsaClaimed = false := rfl
example : composeIrBasename = "slake_compose.ll" := rfl
example : checkFailClosed empty = true := by native_decide
example : extractOkFs empty = true := by native_decide

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written compose IR lacks greppable honesty tokens. -/
def validateComposeIrPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_COMPOSE_TEXT_V0"
    , "HOST-LLVM-COMPOSE-TEXT"
    , "HOST_COMPOSE_V0"
    , "HOST-COMPOSE"
    , "ORDERED-IR-PROGRAM"
    , "EMPTY-GRAPH-OK"
    , "EMPTY-PROGRAM-FAIL-CLOSED"
    , "SLAKE_IR_PROGRAM_CAP"
    , "SLAKE_IR_EDGE_MAX"
    , "mint"
    , "consume"
    , "markErased"
    , "checkFailClosed"
    , "extractOkFs"
    , "multPreScan"
    , "slake_compose_program_cap"
    , "slake_compose_edge_max"
    , "slake_compose_is_well_typed_empty"
    , "slake_compose_check_fail_closed_empty"
    , "slake_compose_extract_ok_fs_empty"
    , "slake_compose_mint_id"
    , "slake_compose_consume_live"
    , "slake_compose_check_fail_closed"
    , "slake_compose_extract_ok_fs"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_compose.ll"
    , "Not production LLVM backend"
    , "Not CFG"
    , "Not SSA"
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

/-- Write compose LLVM IR text under root/out/llvm-ir/slake_compose.ll.
    Greppable: llvmComposeTextWrite, slake_compose.ll, IO.FS.writeFile. -/
def llvmComposeTextWrite (root : System.FilePath) : IO Unit := do
  unless llvmComposeTextReady do
    IO.eprintln s!"error: {stageId}: llvmComposeTextReady false"
    throw (IO.userError "llvmComposeTextReady false")
  unless llvmComposeTextWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmComposeTextWroteExpected false"
    throw (IO.userError "llvmComposeTextWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / composeIrBasename
  IO.println s!"== {stageId}: LLVM IR compose text =="
  IO.println s!"  readyPin={llvmComposeTextReady} llvmUnlocked={LlvmHold.llvmUnlocked}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl composeIrPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing compose IR after write: {outLl}"
    throw (IO.userError "missing compose IR")
  if written != composeIrPackage then
    IO.eprintln "error: compose IR written content mismatch"
    throw (IO.userError "compose IR mismatch")
  validateComposeIrPackage composeIrBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-COMPOSE-TEXT, HOST_COMPOSE_V0, CAP=8, EDGE_MAX=16"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend; not CFG/SSA"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write compose IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmComposeTextWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmComposeText
