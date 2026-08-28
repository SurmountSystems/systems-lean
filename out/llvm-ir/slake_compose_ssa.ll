; SLAKE_LLVM_COMPOSE_SSA_V0 / HOST-LLVM-COMPOSE-SSA
; Generator-owned Compose SSA-shaped IR from HostCompose + program+graph SSOT
; HOST_COMPOSE_V0 HOST-COMPOSE ORDERED-IR-PROGRAM EMPTY-GRAPH-OK
; SLAKE_IR_PROGRAM_CAP=8 SLAKE_IR_EDGE_MAX=16 EMPTY-PROGRAM-FAIL-CLOSED SSA-SHAPED
; Surface: mint consume markErased checkFailClosed extractOkFs multPreScan
; HostCompose SSOT: src/systems/SystemsLean/HostCompose.lean
; Program SSOT: src/systems/SystemsLean/IrProgram.lean
; Graph SSOT: src/systems/SystemsLean/IrGraph.lean
; Path: out/llvm-ir/slake_compose_ssa.ll (Lean IO.FS.writeFile)
; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmComposeText compose IR; LlvmGraphSsa Graph SSA; Mult..Program SSA; LlvmEmitPath design+stub
; Recipe: just llvm-compose-ssa / lake exe slake-llvm-compose-ssa
; Compose SSA partial: block labels + phi + ordered SSA mint/consume defs for Compose band only
; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; Host compose surface constants (HostCompose + IrProgram + IrGraph map)
; HOST_COMPOSE_V0 / HOST-COMPOSE
; SLAKE_IR_PROGRAM_CAP = 8
; SLAKE_IR_EDGE_MAX = 16
; mint: 0=ok, -1=badId, -2=alreadyLive (emit map honesty)
; consume: 0=ok, -1=notLive (emit map honesty)
@slake_compose_ssa_program_cap = private unnamed_addr constant i32 8, align 4 ; SLAKE_IR_PROGRAM_CAP
@slake_compose_ssa_edge_max = private unnamed_addr constant i32 16, align 4 ; SLAKE_IR_EDGE_MAX
@slake_compose_ssa_mint_ok = private unnamed_addr constant i32 0, align 4 ; mint ok
@slake_compose_ssa_mint_bad_id = private unnamed_addr constant i32 -1, align 4 ; badId
@slake_compose_ssa_mint_already_live = private unnamed_addr constant i32 -2, align 4 ; alreadyLive
@slake_compose_ssa_consume_ok = private unnamed_addr constant i32 0, align 4 ; consume ok
@slake_compose_ssa_consume_not_live = private unnamed_addr constant i32 -1, align 4 ; notLive

; SSA-SHAPED Compose mint-status lower (partial; Compose band only; not full CFG/dominance)
; status_ix: 0=ok, 1=badId, 2=alreadyLive; other -> reject (-3)
define i32 @slake_compose_ssa_mint_status(i32 %status_ix) {
entry:
  %is0 = icmp eq i32 %status_ix, 0
  br i1 %is0, label %bb_ok, label %check1

check1:
  %is1 = icmp eq i32 %status_ix, 1
  br i1 %is1, label %bb_bad_id, label %check2

check2:
  %is2 = icmp eq i32 %status_ix, 2
  br i1 %is2, label %bb_already_live, label %bb_reject

bb_ok: ; mint ok
  %t0 = add i32 0, 0
  br label %merge

bb_bad_id: ; mint id==0
  %t1 = add i32 0, -1
  br label %merge

bb_already_live: ; mint already live
  %t2 = add i32 0, -2
  br label %merge

bb_reject: ; unknown status fail-closed
  br label %merge

merge:
  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_bad_id ], [ %t2, %bb_already_live ], [ -3, %bb_reject ]
  ret i32 %code
}

; SSA-SHAPED Compose consume-status lower (partial; Compose band only)
; status_ix: 0=ok, 1=notLive; other -> reject (-2)
define i32 @slake_compose_ssa_consume_status(i32 %status_ix) {
entry:
  %is0 = icmp eq i32 %status_ix, 0
  br i1 %is0, label %bb_ok, label %check1

check1:
  %is1 = icmp eq i32 %status_ix, 1
  br i1 %is1, label %bb_not_live, label %bb_reject

bb_ok: ; consume ok
  %t0 = add i32 0, 0
  br label %merge

bb_not_live: ; consume notLive
  %t1 = add i32 0, -1
  br label %merge

bb_reject: ; unknown status fail-closed
  br label %merge

merge:
  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_not_live ], [ -2, %bb_reject ]
  ret i32 %code
}

; ORDERED-IR-PROGRAM Compose host band (HOST_COMPOSE_V0 HostCompose surface)
; CAP + EDGE_MAX honesty as distinct SSA values (not full CFG pipeline)
define i1 @slake_compose_ssa_kernel_band_ready() {
entry:
  %cap = add i32 0, 8
  %emax = add i32 0, 16
  %cap_ok = icmp eq i32 %cap, 8
  %emax_ok = icmp eq i32 %emax, 16
  %ok = and i1 %cap_ok, %emax_ok
  ret i1 %ok
}

; EMPTY-GRAPH-OK + vacuous multPreScan: empty compose check/extract true
define i1 @slake_compose_ssa_is_well_typed_empty() {
entry:
  ret i1 true
}

; checkFailClosed sketch: graph ok AND mult pre-scan (caller booleans)
define i1 @slake_compose_ssa_check_fail_closed(i1 %graph_ok, i1 %mult_ok) {
entry:
  %ok = and i1 %graph_ok, %mult_ok
  ret i1 %ok
}

; extractOkFs sketch: freestanding FS claim AND checkFailClosed
define i1 @slake_compose_ssa_extract_ok_fs(i1 %claim_fs, i1 %check_ok) {
entry:
  %ok = and i1 %claim_fs, %check_ok
  ret i1 %ok
}
