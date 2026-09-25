/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live LlvmComposeSsa.lean bytes.
  Short role: HostFrontLiveLlvmComposeSsaSource. Not occupancy name 50.
  This wrap is LlvmComposeSsa.lean. It is not LlvmComposeSsaMain.lean.
  Not a full LLVM backend. FullBackend stays false. FullHost stays false.
  Greppable: SYSTEMS_LEAN_HOST, liveLlvmComposeSsaSource,
  HOST-FRONT-LIVE-LLVM-COMPOSE-SSA, liveRel.
  Module: SystemsLean.HostFrontLiveLlvmComposeSsaSource
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveLlvmComposeSsa

/-- Dual-pinned live LlvmComposeSsa.lean bytes.
    Greppable: liveLlvmComposeSsaSource, PARSE-LIVE-LLVM-COMPOSE-SSA. -/
def liveLlvmComposeSsaSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- LLVM Compose SSA lower (one Compose host band to
  SSA-shaped IR under out/llvm-ir). Generator-owned Compose-band SSA form from
  HostCompose mint/consume/checkFailClosed/extractOkFs + program+graph SSOT.
  Composes LlvmHold: living llvmUnlocked true after unlock residual; local
  unlock pin false. Composes LlvmComposeText compose IR peer + LlvmGraphSsa
  Graph SSA peer + LlvmEmitPath design+stub.
  Not production LLVM backend. Not full CFG/dominance pipeline.
  Not Rust-native link success. Not freestanding residual free re-open.
  Not product C growth. Not mathlib.
  Greppable: SYSTEMS_LEAN_HOST, HOST-LLVM-COMPOSE-SSA, SLAKE_LLVM_COMPOSE_SSA,
  SLAKE_LLVM_COMPOSE_SSA_V0, HOST-HOST-LLVM-COMPOSE-SSA, llvmComposeSsaReady,
  llvmComposeSsaFinishedClaimed, llvmComposeSsaPackageOk, llvmComposeSsaWroteExpected,
  llvmComposeSsaKeepsLlvmLocked, llvmComposeSsaDoesNotUnlockLlvm,
  llvmComposeSsaLlvmUnlocked, llvmComposeSsaLocalUnlockFalse,
  llvmComposeSsaPartialClaimed, llvmComposeSsaFullBackendClaimed,
  justRecipeLlvmComposeSsa, llvm-compose-ssa, out/llvm-ir, slake_compose_ssa.ll,
  composeSsaPackage, llvmComposeSsaWrite, IO.FS.writeFile, HostCompose,
  EMPTY-GRAPH-OK, EMPTY-PROGRAM-FAIL-CLOSED, SLAKE_IR_PROGRAM_CAP,
  SLAKE_IR_EDGE_MAX, HOST_COMPOSE_V0, HOST-COMPOSE, ORDERED-IR-PROGRAM,
  SSA-SHAPED, phi, mint, consume, checkFailClosed, extractOkFs, multPreScan,
  LlvmHold, llvmUnlocked, LlvmEmitPath, LlvmComposeText, LlvmGraphSsa,
  HOST-LLVM-EMIT-PATH, HOST-LLVM-COMPOSE-TEXT, HOST-LLVM-COMPOSE-SSA-SMOKE,
  HOST-LLVM-COMPOSE-SSA-THEOREM, UNIT_SURFACE host surface, MULT-0.
  Module: SystemsLean.LlvmComposeSsa
  Short role name (not ProductPath* kitchen-sink).
  Dual evidence: Lean structural pins + lake exe write + just llvm-compose-ssa
  greps of out/llvm-ir/slake_compose_ssa.ll + living LlvmHold unlock true; local pin false.
  Red/green: lake build SystemsLean.LlvmComposeSsa; lake exe slake-llvm-compose-ssa;
  just llvm-compose-ssa; just systems-llvm-ir.
  Module must stay ASCII.
  Not freestanding residual free. Not freestanding emit residual free.
  Not freestanding emit. Not PROVABLY re-open. Not llvm unlock claim.
  Host elaborator residual remains. Compose SSA partial only (not full backend).
-/

import SystemsLean.HostCompose
import SystemsLean.IrProgram
import SystemsLean.IrGraph
import SystemsLean.LlvmHold
import SystemsLean.LlvmEmitPath
import SystemsLean.LlvmComposeText
import SystemsLean.LlvmGraphSsa

namespace SystemsLean.LlvmComposeSsa

open SystemsLean.HostCompose
open SystemsLean.IrProgram (programCap)
open SystemsLean.IrGraph (edgeMax)

/-! ### HOST-LLVM-COMPOSE-SSA / SLAKE_LLVM_COMPOSE_SSA

  Compose host band lowered to SSA-shaped LLVM IR from HostCompose
  (mint / consume / checkFailClosed / extractOkFs) plus program+graph SSOT
  honesty (programCap, edgeMax, EMPTY-GRAPH-OK). Written under
  out/llvm-ir/slake_compose_ssa.ll. Partial SSA form. Does not unlock llvm.
  Does not claim full CFG/dominance.
-/

/-- Greppable primary stage id (LLVM Compose SSA lower gate). -/
def stageId : String := "SLAKE_LLVM_COMPOSE_SSA_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-LLVM-COMPOSE-SSA"

/-- Short surface name (product role). -/
def surfaceId : String := "HOST-LLVM-COMPOSE-SSA"

/-- Surface alias (same durable token). -/
def surfaceAlias : String := "HOST-HOST-LLVM-COMPOSE-SSA"

/-- just recipe for this inventory gate.
    Greppable: justRecipeLlvmComposeSsa, llvm-compose-ssa. -/
def justRecipeLlvmComposeSsa : String := "llvm-compose-ssa"

/-- Alias used by presence greps (same recipe). -/
def justRecipe : String := justRecipeLlvmComposeSsa

/-- Lake exe name.
    Greppable: lakeExeName, slake-llvm-compose-ssa. -/
def lakeExeName : String := "slake-llvm-compose-ssa"

/-- Deferred release surface path cite (not a filesystem read).
    Greppable: llvmIrOutPathCite, out/llvm-ir. -/
def llvmIrOutPathCite : String := "out/llvm-ir"

/-- Compose SSA IR artifact basename under out/llvm-ir.
    Greppable: composeSsaBasename, slake_compose_ssa.ll. -/
def composeSsaBasename : String := "slake_compose_ssa.ll"

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

/-- Compose IR text peer module cite.
    Greppable: llvmComposeTextModuleCite, LlvmComposeText. -/
def llvmComposeTextModuleCite : String :=
  "src/systems/SystemsLean/LlvmComposeText.lean"

/-- Graph SSA peer module cite.
    Greppable: llvmGraphSsaModuleCite, LlvmGraphSsa. -/
def llvmGraphSsaModuleCite : String :=
  "src/systems/SystemsLean/LlvmGraphSsa.lean"

/-- Emit path module cite.
    Greppable: llvmEmitPathModuleCite, LlvmEmitPath. -/
def llvmEmitPathModuleCite : String :=
  "src/systems/SystemsLean/LlvmEmitPath.lean"

/-- Hold module path cite (unlock SSoT remains LlvmHold).
    Greppable: llvmHoldModuleCite, LlvmHold.lean. -/
def llvmHoldModuleCite : String :=
  "src/systems/SystemsLean/LlvmHold.lean"

/-- Local inventory finished (structural gate closed for Compose SSA partial).
    Greppable: llvmComposeSsaFinishedClaimed. -/
def llvmComposeSsaFinishedClaimed : Bool := true

/-- Local unlock pin -- MUST stay false. Does not replace LlvmHold.llvmUnlocked.
    Greppable: llvmComposeSsaLlvmUnlocked, llvmComposeSsaLocalUnlockFalse. -/
def llvmComposeSsaLlvmUnlocked : Bool := false

/-- Alias of local unlock false for inventory greps.
    Greppable: llvmComposeSsaLocalUnlockFalse. -/
def llvmComposeSsaLocalUnlockFalse : Bool := !llvmComposeSsaLlvmUnlocked

/-- Local module does not own unlock (local pin false). Living SSoT is
    LlvmHold.llvmUnlocked (true after unlock residual).
    Greppable: llvmComposeSsaKeepsLlvmLocked. -/
def llvmComposeSsaKeepsLlvmLocked : Bool :=
  !llvmComposeSsaLlvmUnlocked

/-- Compose SSA lower does not unlock llvm (fail-closed).
    Greppable: llvmComposeSsaDoesNotUnlockLlvm. -/
def llvmComposeSsaDoesNotUnlockLlvm : Bool :=
  llvmComposeSsaKeepsLlvmLocked
    && LlvmHold.llvmHoldReady
    && LlvmHold.selfApplyDoesNotUnlockLlvm
    && LlvmEmitPath.llvmEmitPathKeepsLlvmLocked
    && LlvmComposeText.llvmComposeTextKeepsLlvmLocked
    && LlvmGraphSsa.llvmGraphSsaKeepsLlvmLocked

/-- This residual claims Compose-band SSA-shaped IR partial only.
    Greppable: llvmComposeSsaPartialClaimed, SSA-SHAPED. -/
def llvmComposeSsaPartialClaimed : Bool := true

/-- Full production LLVM backend claim -- MUST stay false.
    Greppable: llvmComposeSsaFullBackendClaimed. -/
def llvmComposeSsaFullBackendClaimed : Bool := false

/-- Full CFG/dominance production pipeline claim -- MUST stay false.
    Greppable: llvmComposeSsaCfgProductionClaimed. -/
def llvmComposeSsaCfgProductionClaimed : Bool := false

/-- Local honesty non-claims. -/
def llvmComposeSsaResidualFreeClaimed : Bool := false
def llvmComposeSsaProductSelfHostCompleteClaimed : Bool := false
def llvmComposeSsaProofCompleteClaimed : Bool := false
def llvmComposeSsaProvablyUnlockWorkClaimed : Bool := false
def llvmComposeSsaProductionReadyClaimed : Bool := false
def llvmComposeSsaRustNativeLinkClaimed : Bool := false
def llvmComposeSsaLlvmAsClaimed : Bool := false

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

/-- SSA-shaped honesty id (partial form; not full production SSA pipeline).
    Greppable: ssaShapedId, SSA-SHAPED. -/
def ssaShapedId : String := "SSA-SHAPED"

/-- Compose SSA header comments.
    Greppable: composeSsaBanner. -/
def composeSsaBanner : String :=
  "; SLAKE_LLVM_COMPOSE_SSA_V0 / HOST-LLVM-COMPOSE-SSA\n"
    ++ "; Generator-owned Compose SSA-shaped IR from HostCompose + program+graph SSOT\n"
    ++ "; " ++ hostComposeWireId ++ " " ++ hostComposeSurfaceId ++ " "
    ++ orderedIrProgramId ++ " " ++ emptyGraphOkId ++ "\n"
    ++ "; " ++ programCapHonestyId ++ "=" ++ programCapStr ++ " "
    ++ edgeMaxHonestyId ++ "=" ++ edgeMaxStr ++ " "
    ++ emptyProgramFailClosedId ++ " " ++ ssaShapedId ++ "\n"
    ++ "; Surface: mint consume markErased checkFailClosed extractOkFs multPreScan\n"
    ++ "; HostCompose SSOT: src/systems/SystemsLean/HostCompose.lean\n"
    ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
    ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
    ++ "; Path: out/llvm-ir/slake_compose_ssa.ll (Lean IO.FS.writeFile)\n"
    ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
    ++ "; Prior: LlvmComposeText compose IR; LlvmGraphSsa Graph SSA; Mult..Program SSA; LlvmEmitPath design+stub\n"
    ++ "; Recipe: just llvm-compose-ssa / lake exe slake-llvm-compose-ssa\n"
    ++ "; Compose SSA partial: block labels + phi + ordered SSA mint/consume defs for Compose band only\n"
    ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
    ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
    ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
    ++ "\n"

/-- Compose surface constants (CAP + EDGE_MAX + mint/consume codes).
    Greppable: composeSsaConstants, HOST_COMPOSE_V0. -/
def composeSsaConstants : String :=
  "; Host compose surface constants (HostCompose + IrProgram + IrGraph map)\n"
    ++ "; " ++ hostComposeWireId ++ " / " ++ hostComposeSurfaceId ++ "\n"
    ++ "; " ++ programCapHonestyId ++ " = " ++ programCapStr ++ "\n"
    ++ "; " ++ edgeMaxHonestyId ++ " = " ++ edgeMaxStr ++ "\n"
    ++ "; mint: 0=ok, -1=badId, -2=alreadyLive (emit map honesty)\n"
    ++ "; consume: 0=ok, -1=notLive (emit map honesty)\n"
    ++ "@slake_compose_ssa_program_cap = private unnamed_addr constant i32 "
    ++ programCapStr ++ ", align 4 ; " ++ programCapHonestyId ++ "\n"
    ++ "@slake_compose_ssa_edge_max = private unnamed_addr constant i32 "
    ++ edgeMaxStr ++ ", align 4 ; " ++ edgeMaxHonestyId ++ "\n"
    ++ "@slake_compose_ssa_mint_ok = private unnamed_addr constant i32 0, align 4 ; mint ok\n"
    ++ "@slake_compose_ssa_mint_bad_id = private unnamed_addr constant i32 -1, align 4 ; badId\n"
    ++ "@slake_compose_ssa_mint_already_live = private unnamed_addr constant i32 -2, align 4 ; alreadyLive\n"
    ++ "@slake_compose_ssa_consume_ok = private unnamed_addr constant i32 0, align 4 ; consume ok\n"
    ++ "@slake_compose_ssa_consume_not_live = private unnamed_addr constant i32 -1, align 4 ; notLive\n"
    ++ "\n"

/-- SSA-shaped Compose mint-status lower: block labels + phi (partial SSA form).
    status_ix 0 -> ok; 1 -> badId; 2 -> alreadyLive; other -> reject (-3).
    Greppable: composeSsaMintPhi, phi, SSA-SHAPED, slake_compose_ssa_mint_status. -/
def composeSsaMintPhi : String :=
  "; SSA-SHAPED Compose mint-status lower (partial; Compose band only; not full CFG/dominance)\n"
    ++ "; status_ix: 0=ok, 1=badId, 2=alreadyLive; other -> reject (-3)\n"
    ++ "define i32 @slake_compose_ssa_mint_status(i32 %status_ix) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %status_ix, 0\n"
    ++ "  br i1 %is0, label %bb_ok, label %check1\n"
    ++ "\n"
    ++ "check1:\n"
    ++ "  %is1 = icmp eq i32 %status_ix, 1\n"
    ++ "  br i1 %is1, label %bb_bad_id, label %check2\n"
    ++ "\n"
    ++ "check2:\n"
    ++ "  %is2 = icmp eq i32 %status_ix, 2\n"
    ++ "  br i1 %is2, label %bb_already_live, label %bb_reject\n"
    ++ "\n"
    ++ "bb_ok: ; mint ok\n"
    ++ "  %t0 = add i32 0, 0\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_bad_id: ; mint id==0\n"
    ++ "  %t1 = add i32 0, -1\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_already_live: ; mint already live\n"
    ++ "  %t2 = add i32 0, -2\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_reject: ; unknown status fail-closed\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "merge:\n"
    ++ "  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_bad_id ], [ %t2, %bb_already_live ], [ -3, %bb_reject ]\n"
    ++ "  ret i32 %code\n"
    ++ "}\n"
    ++ "\n"

/-- SSA-shaped Compose consume-status lower: block labels + phi.
    status_ix 0 -> ok; 1 -> notLive; other -> reject (-2).
    Greppable: composeSsaConsumePhi, slake_compose_ssa_consume_status. -/
def composeSsaConsumePhi : String :=
  "; SSA-SHAPED Compose consume-status lower (partial; Compose band only)\n"
    ++ "; status_ix: 0=ok, 1=notLive; other -> reject (-2)\n"
    ++ "define i32 @slake_compose_ssa_consume_status(i32 %status_ix) {\n"
    ++ "entry:\n"
    ++ "  %is0 = icmp eq i32 %status_ix, 0\n"
    ++ "  br i1 %is0, label %bb_ok, label %check1\n"
    ++ "\n"
    ++ "check1:\n"
    ++ "  %is1 = icmp eq i32 %status_ix, 1\n"
    ++ "  br i1 %is1, label %bb_not_live, label %bb_reject\n"
    ++ "\n"
    ++ "bb_ok: ; consume ok\n"
    ++ "  %t0 = add i32 0, 0\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_not_live: ; consume notLive\n"
    ++ "  %t1 = add i32 0, -1\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "bb_reject: ; unknown status fail-closed\n"
    ++ "  br label %merge\n"
    ++ "\n"
    ++ "merge:\n"
    ++ "  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_not_live ], [ -2, %bb_reject ]\n"
    ++ "  ret i32 %code\n"
    ++ "}\n"
    ++ "\n"

/-- Ordered Compose host band as sequential SSA defs (CAP + EDGE_MAX honesty).
    Greppable: composeSsaKernelBand, HOST_COMPOSE_V0, slake_compose_ssa_kernel_band_ready. -/
def composeSsaKernelBand : String :=
  "; ORDERED-IR-PROGRAM Compose host band (HOST_COMPOSE_V0 HostCompose surface)\n"
    ++ "; CAP + EDGE_MAX honesty as distinct SSA values (not full CFG pipeline)\n"
    ++ "define i1 @slake_compose_ssa_kernel_band_ready() {\n"
    ++ "entry:\n"
    ++ "  %cap = add i32 0, " ++ programCapStr ++ "\n"
    ++ "  %emax = add i32 0, " ++ edgeMaxStr ++ "\n"
    ++ "  %cap_ok = icmp eq i32 %cap, " ++ programCapStr ++ "\n"
    ++ "  %emax_ok = icmp eq i32 %emax, " ++ edgeMaxStr ++ "\n"
    ++ "  %ok = and i1 %cap_ok, %emax_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"

/-- Fail-closed checkFailClosed + extractOkFs + empty well-typed sketches.
    Greppable: composeSsaChecks, slake_compose_ssa_check_fail_closed. -/
def composeSsaChecks : String :=
  "; EMPTY-GRAPH-OK + vacuous multPreScan: empty compose check/extract true\n"
    ++ "define i1 @slake_compose_ssa_is_well_typed_empty() {\n"
    ++ "entry:\n"
    ++ "  ret i1 true\n"
    ++ "}\n"
    ++ "\n"
    ++ "; checkFailClosed sketch: graph ok AND mult pre-scan (caller booleans)\n"
    ++ "define i1 @slake_compose_ssa_check_fail_closed(i1 %graph_ok, i1 %mult_ok) {\n"
    ++ "entry:\n"
    ++ "  %ok = and i1 %graph_ok, %mult_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"
    ++ "\n"
    ++ "; extractOkFs sketch: freestanding FS claim AND checkFailClosed\n"
    ++ "define i1 @slake_compose_ssa_extract_ok_fs(i1 %claim_fs, i1 %check_ok) {\n"
    ++ "entry:\n"
    ++ "  %ok = and i1 %claim_fs, %check_ok\n"
    ++ "  ret i1 %ok\n"
    ++ "}\n"

/-- Full Compose SSA package text.
    Greppable: composeSsaPackage, slake_compose_ssa.ll. -/
def composeSsaPackage : String :=
  composeSsaBanner ++ composeSsaConstants ++ composeSsaMintPhi
    ++ composeSsaConsumePhi ++ composeSsaKernelBand ++ composeSsaChecks

/-- Surface ids + path cites + Compose SSOT pins ok. -/
def llvmComposeSsaSurfaceOk : Bool :=
  (stageId == "SLAKE_LLVM_COMPOSE_SSA_V0")
    && (hostId == "HOST-LLVM-COMPOSE-SSA")
    && (surfaceId == "HOST-LLVM-COMPOSE-SSA")
    && (surfaceAlias == "HOST-HOST-LLVM-COMPOSE-SSA")
    && (justRecipeLlvmComposeSsa == "llvm-compose-ssa")
    && (justRecipe == "llvm-compose-ssa")
    && (lakeExeName == "slake-llvm-compose-ssa")
    && (llvmIrOutPathCite == "out/llvm-ir")
    && (composeSsaBasename == "slake_compose_ssa.ll")
    && (hostComposeModuleCite
      == "src/systems/SystemsLean/HostCompose.lean")
    && (programModuleCite == "src/systems/SystemsLean/IrProgram.lean")
    && (graphModuleCite == "src/systems/SystemsLean/IrGraph.lean")
    && (llvmComposeTextModuleCite
      == "src/systems/SystemsLean/LlvmComposeText.lean")
    && (llvmGraphSsaModuleCite
      == "src/systems/SystemsLean/LlvmGraphSsa.lean")
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
    && (ssaShapedId == "SSA-SHAPED")
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

/-- Package text honesty.
    Greppable: llvmComposeSsaPackageOk. -/
def llvmComposeSsaPackageOk : Bool :=
  llvmComposeSsaSurfaceOk
    && (composeSsaPackage
      == composeSsaBanner ++ composeSsaConstants ++ composeSsaMintPhi
        ++ composeSsaConsumePhi ++ composeSsaKernelBand ++ composeSsaChecks)
    && (composeSsaBanner
      == "; SLAKE_LLVM_COMPOSE_SSA_V0 / HOST-LLVM-COMPOSE-SSA\n"
        ++ "; Generator-owned Compose SSA-shaped IR from HostCompose + program+graph SSOT\n"
        ++ "; HOST_COMPOSE_V0 HOST-COMPOSE ORDERED-IR-PROGRAM EMPTY-GRAPH-OK\n"
        ++ "; SLAKE_IR_PROGRAM_CAP=8 SLAKE_IR_EDGE_MAX=16 EMPTY-PROGRAM-FAIL-CLOSED SSA-SHAPED\n"
        ++ "; Surface: mint consume markErased checkFailClosed extractOkFs multPreScan\n"
        ++ "; HostCompose SSOT: src/systems/SystemsLean/HostCompose.lean\n"
        ++ "; Program SSOT: src/systems/SystemsLean/IrProgram.lean\n"
        ++ "; Graph SSOT: src/systems/SystemsLean/IrGraph.lean\n"
        ++ "; Path: out/llvm-ir/slake_compose_ssa.ll (Lean IO.FS.writeFile)\n"
        ++ "; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend\n"
        ++ "; Prior: LlvmComposeText compose IR; LlvmGraphSsa Graph SSA; Mult..Program SSA; LlvmEmitPath design+stub\n"
        ++ "; Recipe: just llvm-compose-ssa / lake exe slake-llvm-compose-ssa\n"
        ++ "; Compose SSA partial: block labels + phi + ordered SSA mint/consume defs for Compose band only\n"
        ++ "; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.\n"
        ++ "; Not Rust-native link. Not freestanding residual free re-open.\n"
        ++ "; Not product freestanding C growth. Host elaborator residual remains.\n"
        ++ "\n")

/-- Structural package identity pin only.
    Greppable: llvmComposeSsaWroteExpected. -/
def llvmComposeSsaWroteExpected : Bool :=
  llvmComposeSsaPackageOk
    && (composeSsaPackage
      == composeSsaBanner ++ composeSsaConstants ++ composeSsaMintPhi
        ++ composeSsaConsumePhi ++ composeSsaKernelBand ++ composeSsaChecks)

/-- Structural ready for LLVM Compose SSA lower residual.
    Greppable: llvmComposeSsaReady, HOST-LLVM-COMPOSE-SSA, SLAKE_LLVM_COMPOSE_SSA. -/
def llvmComposeSsaReady : Bool :=
  llvmComposeSsaFinishedClaimed
    && llvmComposeSsaPackageOk
    && llvmComposeSsaWroteExpected
    && llvmComposeSsaSurfaceOk
    && llvmComposeSsaKeepsLlvmLocked
    && llvmComposeSsaDoesNotUnlockLlvm
    && llvmComposeSsaLocalUnlockFalse
    && llvmComposeSsaPartialClaimed
    && !llvmComposeSsaLlvmUnlocked
    && !llvmComposeSsaFullBackendClaimed
    && !llvmComposeSsaCfgProductionClaimed
    && !llvmComposeSsaResidualFreeClaimed
    && !llvmComposeSsaProductSelfHostCompleteClaimed
    && !llvmComposeSsaProofCompleteClaimed
    && !llvmComposeSsaProvablyUnlockWorkClaimed
    && !llvmComposeSsaProductionReadyClaimed
    && !llvmComposeSsaRustNativeLinkClaimed
    && !llvmComposeSsaLlvmAsClaimed
    && LlvmHold.llvmHoldReady
    && LlvmEmitPath.llvmEmitPathReady
    && !LlvmEmitPath.llvmEmitPathLlvmUnlocked
    && LlvmComposeText.llvmComposeTextReady
    && !LlvmComposeText.llvmComposeTextLlvmUnlocked
    && LlvmGraphSsa.llvmGraphSsaReady
    && LlvmGraphSsa.llvmGraphSsaPartialClaimed
    && !LlvmGraphSsa.llvmGraphSsaLlvmUnlocked
    && !LlvmGraphSsa.llvmGraphSsaFullBackendClaimed

/-! ### HOST-LLVM-COMPOSE-SSA-THEOREM (readable statements) -/

theorem llvmComposeSsaFinishedClaimed_true :
    llvmComposeSsaFinishedClaimed = true :=
  rfl

theorem llvmComposeSsaLlvmUnlocked_false :
    llvmComposeSsaLlvmUnlocked = false :=
  rfl

theorem llvmComposeSsaPartialClaimed_true :
    llvmComposeSsaPartialClaimed = true :=
  rfl

theorem llvmComposeSsaFullBackendClaimed_false :
    llvmComposeSsaFullBackendClaimed = false :=
  rfl

theorem llvmComposeSsaCfgProductionClaimed_false :
    llvmComposeSsaCfgProductionClaimed = false :=
  rfl

theorem llvmComposeSsaKeepsLlvmLocked_true :
    llvmComposeSsaKeepsLlvmLocked = true := by
  native_decide

theorem llvmComposeSsaDoesNotUnlockLlvm_true :
    llvmComposeSsaDoesNotUnlockLlvm = true := by
  native_decide

theorem llvmComposeSsaReady_true :
    llvmComposeSsaReady = true := by
  native_decide

theorem justRecipeLlvmComposeSsa_eq :
    justRecipeLlvmComposeSsa = "llvm-compose-ssa" :=
  rfl

theorem llvmComposeSsa_stageId_eq :
    stageId = "SLAKE_LLVM_COMPOSE_SSA_V0" :=
  rfl

theorem llvmComposeSsa_hostId_eq :
    hostId = "HOST-LLVM-COMPOSE-SSA" :=
  rfl

theorem llvmComposeSsa_compose_surface_eq :
    hostComposeWireId = "HOST_COMPOSE_V0"
      && hostComposeSurfaceId = "HOST-COMPOSE"
      && orderedIrProgramId = "ORDERED-IR-PROGRAM"
      && emptyGraphOkId = "EMPTY-GRAPH-OK"
      && programCapHonestyId = "SLAKE_IR_PROGRAM_CAP"
      && edgeMaxHonestyId = "SLAKE_IR_EDGE_MAX"
      && programCapStr = "8"
      && edgeMaxStr = "16"
      && programCapValue = 8
      && edgeMaxValue = 16
      && ssaShapedId = "SSA-SHAPED" :=
  rfl

theorem llvmComposeSsa_claims_false :
    llvmComposeSsaLlvmUnlocked = false
      && llvmComposeSsaFullBackendClaimed = false
      && llvmComposeSsaCfgProductionClaimed = false
      && llvmComposeSsaResidualFreeClaimed = false
      && llvmComposeSsaProductSelfHostCompleteClaimed = false
      && llvmComposeSsaProofCompleteClaimed = false
      && llvmComposeSsaProvablyUnlockWorkClaimed = false
      && llvmComposeSsaProductionReadyClaimed = false
      && llvmComposeSsaRustNativeLinkClaimed = false
      && llvmComposeSsaLlvmAsClaimed = false :=
  rfl

theorem llvmComposeSsaPackageOk_true :
    llvmComposeSsaPackageOk = true := by
  native_decide

theorem llvmComposeSsaWroteExpected_true :
    llvmComposeSsaWroteExpected = true := by
  native_decide

/-! ### HOST-LLVM-COMPOSE-SSA-SMOKE (quick examples) -/

example : llvmComposeSsaFinishedClaimed = true := rfl
example : llvmComposeSsaLlvmUnlocked = false := rfl
example : llvmComposeSsaPartialClaimed = true := rfl
example : llvmComposeSsaFullBackendClaimed = false := rfl
example : llvmComposeSsaCfgProductionClaimed = false := rfl
example : llvmComposeSsaKeepsLlvmLocked = true := by native_decide
example : llvmComposeSsaDoesNotUnlockLlvm = true := by native_decide
example : llvmComposeSsaReady = true := by native_decide
example : justRecipeLlvmComposeSsa = "llvm-compose-ssa" := rfl
example : hostComposeWireId = "HOST_COMPOSE_V0" := rfl
example : hostComposeSurfaceId = "HOST-COMPOSE" := rfl
example : emptyGraphOkId = "EMPTY-GRAPH-OK" := rfl
example : programCapStr = "8" := rfl
example : edgeMaxStr = "16" := rfl
example : ssaShapedId = "SSA-SHAPED" := rfl
example : LlvmHold.llvmUnlocked = true := rfl
example : llvmComposeSsaLlvmUnlocked = false := rfl
example : LlvmEmitPath.llvmEmitPathReady = true := by native_decide
example : LlvmComposeText.llvmComposeTextReady = true := by native_decide
example : LlvmGraphSsa.llvmGraphSsaReady = true := by native_decide
example : composeSsaBasename = "slake_compose_ssa.ll" := rfl
example : checkFailClosed empty = true := by native_decide
example : extractOkFs empty = true := by native_decide

/-- True if `hay` contains substring `needle` (ASCII scan). -/
def containsSub (hay needle : String) : Bool :=
  (hay.splitOn needle).length > 1

/-- Fail closed if written Compose SSA IR lacks greppable honesty tokens. -/
def validateComposeSsaPackage (label : String) (text : String) : IO Unit := do
  let need : List String :=
    [ "SLAKE_LLVM_COMPOSE_SSA_V0"
    , "HOST-LLVM-COMPOSE-SSA"
    , "HOST_COMPOSE_V0"
    , "HOST-COMPOSE"
    , "EMPTY-GRAPH-OK"
    , "EMPTY-PROGRAM-FAIL-CLOSED"
    , "SLAKE_IR_PROGRAM_CAP"
    , "SLAKE_IR_EDGE_MAX"
    , "SSA-SHAPED"
    , "mint"
    , "consume"
    , "checkFailClosed"
    , "extractOkFs"
    , "phi i32"
    , "slake_compose_ssa_mint_status"
    , "slake_compose_ssa_consume_status"
    , "slake_compose_ssa_kernel_band_ready"
    , "slake_compose_ssa_check_fail_closed"
    , "slake_compose_ssa_extract_ok_fs"
    , "slake_compose_ssa_program_cap"
    , "slake_compose_ssa_edge_max"
    , "bb_ok"
    , "bb_reject"
    , "LlvmHold.llvmUnlocked"
    , "out/llvm-ir/slake_compose_ssa.ll"
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

/-- Write Compose SSA IR text under root/out/llvm-ir/slake_compose_ssa.ll.
    Greppable: llvmComposeSsaWrite, slake_compose_ssa.ll, IO.FS.writeFile. -/
def llvmComposeSsaWrite (root : System.FilePath) : IO Unit := do
  unless llvmComposeSsaReady do
    IO.eprintln s!"error: {stageId}: llvmComposeSsaReady false"
    throw (IO.userError "llvmComposeSsaReady false")
  unless llvmComposeSsaWroteExpected do
    IO.eprintln s!"error: {stageId}: llvmComposeSsaWroteExpected false"
    throw (IO.userError "llvmComposeSsaWroteExpected false")
  let outDir := root / "out" / "llvm-ir"
  let outLl := outDir / composeSsaBasename
  IO.println s!"== {stageId}: LLVM Compose SSA lower partial =="
  IO.println s!"  readyPin={llvmComposeSsaReady} llvmUnlocked={LlvmHold.llvmUnlocked} fullBackend={llvmComposeSsaFullBackendClaimed}"
  IO.FS.createDirAll outDir
  IO.FS.writeFile outLl composeSsaPackage
  let written <- IO.FS.readFile outLl
  unless (<- outLl.pathExists) do
    IO.eprintln s!"error: missing Compose SSA IR after write: {outLl}"
    throw (IO.userError "missing Compose SSA IR")
  if written != composeSsaPackage then
    IO.eprintln "error: Compose SSA IR written content mismatch"
    throw (IO.userError "Compose SSA IR mismatch")
  validateComposeSsaPackage composeSsaBasename written
  IO.println s!"GREEN {stageId}: wrote {outLl} ({written.length})"
  IO.println "  greppable: HOST-LLVM-COMPOSE-SSA, SSA-SHAPED, phi, HOST_COMPOSE_V0"
  IO.println "  honesty: local unlock pin false; living LlvmHold unlock true; not full backend"

/-- Drop lake/exe separators so root path is first real arg. -/
def filterArgs : List String -> List String
  | [] => []
  | "--" :: rest => filterArgs rest
  | a :: rest => a :: filterArgs rest

/-- CLI: write Compose SSA IR under repo root (default .). Fail-closed. -/
def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    llvmComposeSsaWrite root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.LlvmComposeSsa
"#

end SystemsLean.HostFrontLiveLlvmComposeSsa
