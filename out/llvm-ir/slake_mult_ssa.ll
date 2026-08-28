; SLAKE_LLVM_MULT_SSA_V0 / HOST-LLVM-MULT-SSA
; Generator-owned Mult program-graph SSA-shaped IR from KernelMult + Mult SSOT
; Mult grades: MULT-0 MULT-1 MULT-OMEGA
; SELF-HOST-KERNEL-MULT ORDERED-IR-PROGRAM SSA-SHAPED
; Kernel Mult SSOT: src/systems/SystemsLean/KernelMult.lean
; Mult SSOT: src/systems/SystemsLean/Mult.lean
; Path: out/llvm-ir/slake_mult_ssa.ll (Lean IO.FS.writeFile)
; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmMultText Mult unit IR; LlvmEmitPath design+stub (HOST-LLVM-EMIT-PATH)
; Recipe: just llvm-mult-ssa / lake exe slake-llvm-mult-ssa
; Mult SSA partial: block labels + phi + ordered SSA node defs for Mult band only
; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; Mult grade tag constants (0=MULT-0, 1=MULT-1, 2=MULT-OMEGA)
@slake_mult_ssa_tag_0 = private unnamed_addr constant i32 0, align 4 ; MULT-0
@slake_mult_ssa_tag_1 = private unnamed_addr constant i32 1, align 4 ; MULT-1
@slake_mult_ssa_tag_omega = private unnamed_addr constant i32 2, align 4 ; MULT-OMEGA

; SSA-SHAPED Mult grade tag lower (partial; Mult band only; not full CFG/dominance)
; FAIL-CLOSED-UNKNOWN-GRADE: unknown grade_ix returns -1
define i32 @slake_mult_ssa_grade_tag(i32 %grade_ix) {
entry:
  %is0 = icmp eq i32 %grade_ix, 0
  br i1 %is0, label %bb_mult0, label %check1

check1:
  %is1 = icmp eq i32 %grade_ix, 1
  br i1 %is1, label %bb_mult1, label %check2

check2:
  %is2 = icmp eq i32 %grade_ix, 2
  br i1 %is2, label %bb_omega, label %bb_reject

bb_mult0: ; MULT-0 / ERASED band node
  %t0 = add i32 0, 0
  br label %merge

bb_mult1: ; MULT-1 / LINEAR band node
  %t1 = add i32 0, 1
  br label %merge

bb_omega: ; MULT-OMEGA / VALUE band node
  %t2 = add i32 0, 2
  br label %merge

bb_reject: ; FAIL-CLOSED-UNKNOWN-GRADE
  br label %merge

merge:
  %tag = phi i32 [ %t0, %bb_mult0 ], [ %t1, %bb_mult1 ], [ %t2, %bb_omega ], [ -1, %bb_reject ]
  ret i32 %tag
}

; ORDERED-IR-PROGRAM Mult kernel band (SELF-HOST-KERNEL-MULT lowerMultKernel)
; Three nodes: MULT-0 erased, MULT-1 linear, MULT-OMEGA value
; SSA-shaped: each node fields are distinct SSA values (not full CFG pipeline)
define i1 @slake_mult_ssa_kernel_band_ready() {
entry:
  ; node0: tag=0 mult=MULT-0 kind=ERASED
  %n0_tag = add i32 0, 0
  %n0_mult = add i32 0, 0
  %n0_kind = add i32 0, 2
  ; node1: tag=1 mult=MULT-1 kind=LINEAR
  %n1_tag = add i32 0, 1
  %n1_mult = add i32 0, 1
  %n1_kind = add i32 0, 1
  ; node2: tag=2 mult=MULT-OMEGA kind=VALUE
  %n2_tag = add i32 0, 2
  %n2_mult = add i32 0, 2
  %n2_kind = add i32 0, 0
  ; length honesty: three Mult kernel nodes
  %len = add i32 0, 3
  %ok = icmp eq i32 %len, 3
  ret i1 %ok
}

; Fail-closed raw tag check (Mult.isValidTag / ofNat? known 0/1/2 only)
define i1 @slake_mult_ssa_is_valid_tag(i32 %tag) {
entry:
  %is0 = icmp eq i32 %tag, 0
  %is1 = icmp eq i32 %tag, 1
  %is2 = icmp eq i32 %tag, 2
  %t01 = or i1 %is0, %is1
  %ok = or i1 %t01, %is2
  ret i1 %ok
}
