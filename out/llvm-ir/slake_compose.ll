; SLAKE_LLVM_COMPOSE_TEXT_V0 / HOST-LLVM-COMPOSE-TEXT
; Generator-owned composed LLVM IR from Systems Lean host compose + program+graph SSOT
; HOST_COMPOSE_V0 HOST-COMPOSE ORDERED-IR-PROGRAM EMPTY-GRAPH-OK
; SLAKE_IR_PROGRAM_CAP=8 SLAKE_IR_EDGE_MAX=16 EMPTY-PROGRAM-FAIL-CLOSED
; Surface: mint consume markErased checkFailClosed extractOkFs multPreScan
; HostCompose SSOT: src/systems/SystemsLean/HostCompose.lean
; Program SSOT: src/systems/SystemsLean/IrProgram.lean
; Graph SSOT: src/systems/SystemsLean/IrGraph.lean
; Path: out/llvm-ir/slake_compose.ll (Lean IO.FS.writeFile)
; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmGraphText Graph IR; LlvmProgramText Program IR; Mult..Types unit IR; LlvmEmitPath stub
; Unit package Mult..Graph is separate join (just llvm-unit-package); compose is next layer
; Recipe: just llvm-compose-text / lake exe slake-llvm-compose-text
; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.
; Not CFG. Not SSA. Not a second IR dialect.

; Host compose surface constants (HostCompose + IrProgram + IrGraph map)
; HOST_COMPOSE_V0 / HOST-COMPOSE
; SLAKE_IR_PROGRAM_CAP = 8
; SLAKE_IR_EDGE_MAX = 16
; mint: 0=ok, -1=badId, -2=alreadyLive (emit map honesty)
; consume: 0=ok, -1=notLive (emit map honesty)
@slake_compose_program_cap = private unnamed_addr constant i32 8, align 4 ; SLAKE_IR_PROGRAM_CAP
@slake_compose_edge_max = private unnamed_addr constant i32 16, align 4 ; SLAKE_IR_EDGE_MAX
@slake_compose_mint_ok = private unnamed_addr constant i32 0, align 4 ; mint ok
@slake_compose_mint_bad_id = private unnamed_addr constant i32 -1, align 4 ; badId
@slake_compose_mint_already_live = private unnamed_addr constant i32 -2, align 4 ; alreadyLive
@slake_compose_consume_ok = private unnamed_addr constant i32 0, align 4 ; consume ok
@slake_compose_consume_not_live = private unnamed_addr constant i32 -1, align 4 ; notLive

; Empty host compose: EMPTY-GRAPH-OK + vacuous multPreScan
; HostCompose.checkFailClosed empty is true; extractOkFs empty is true
; Nested empty program alone stays EMPTY-PROGRAM-FAIL-CLOSED under IrProgram
define i1 @slake_compose_is_well_typed_empty() {
entry:
  ret i1 true
}

define i1 @slake_compose_check_fail_closed_empty() {
entry:
  ret i1 true
}

define i1 @slake_compose_extract_ok_fs_empty() {
entry:
  ret i1 true
}

; mint sketch: id 0 -> -1 badId; already-live path omitted (caller live flag)
define i32 @slake_compose_mint_id(i32 %id) {
entry:
  %bad = icmp eq i32 %id, 0
  %r = select i1 %bad, i32 -1, i32 0
  ret i32 %r
}

; consume sketch: live=0 -> -1 notLive; live=1 -> 0 ok
define i32 @slake_compose_consume_live(i1 %live) {
entry:
  %r = select i1 %live, i32 0, i32 -1
  ret i32 %r
}

; checkFailClosed sketch: graph ok AND mult pre-scan (caller booleans)
define i1 @slake_compose_check_fail_closed(i1 %graph_ok, i1 %mult_ok) {
entry:
  %ok = and i1 %graph_ok, %mult_ok
  ret i1 %ok
}

; extractOkFs sketch: freestanding FS claim AND checkFailClosed
define i1 @slake_compose_extract_ok_fs(i1 %claim_fs, i1 %check_ok) {
entry:
  %ok = and i1 %claim_fs, %check_ok
  ret i1 %ok
}

; Capacity guards from program+graph SSOT (compose owns both)
define i1 @slake_compose_program_count_ok(i32 %count) {
entry:
  %le = icmp ule i32 %count, 8
  ret i1 %le
}

define i1 @slake_compose_edge_count_ok(i32 %edgeCount) {
entry:
  %le = icmp ule i32 %edgeCount, 16
  ret i1 %le
}
