; SLAKE_LLVM_PROGRAM_SSA_V0 / HOST-LLVM-PROGRAM-SSA
; Generator-owned Program ordered-IR SSA-shaped IR from KernelProgram + IrProgram SSOT
; Program focus: ORDERED-IR-PROGRAM EMPTY-PROGRAM-FAIL-CLOSED CAP=8
; Kind/mult: ERASED/MULT-0 LINEAR/MULT-1 VALUE/MULT-OMEGA
; SELF-HOST-KERNEL-PROGRAM ORDERED-IR-PROGRAM SSA-SHAPED
; Kernel Program SSOT: src/systems/SystemsLean/KernelProgram.lean
; Program SSOT: src/systems/SystemsLean/IrProgram.lean
; Path: out/llvm-ir/slake_program_ssa.ll (Lean IO.FS.writeFile)
; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmProgramText Program unit IR; LlvmTypesSsa Types SSA; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub
; Recipe: just llvm-program-ssa / lake exe slake-llvm-program-ssa
; Program SSA partial: block labels + phi + ordered SSA node defs for Program band only
; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; Ordered IR program surface constants (IrProgram.programCap / push map)
; SLAKE_IR_PROGRAM_CAP = 8
; push: 0=ok, -1=badNode, -2=full (emit map)
@slake_program_ssa_cap = private unnamed_addr constant i32 8, align 4 ; SLAKE_IR_PROGRAM_CAP
@slake_program_ssa_push_ok = private unnamed_addr constant i32 0, align 4 ; push ok
@slake_program_ssa_push_bad = private unnamed_addr constant i32 -1, align 4 ; badNode
@slake_program_ssa_push_full = private unnamed_addr constant i32 -2, align 4 ; full

; SSA-SHAPED Program push-status lower (partial; Program band only; not full CFG/dominance)
; status_ix: 0=ok, 1=badNode, 2=full; other -> reject (-3)
define i32 @slake_program_ssa_push_status(i32 %status_ix) {
entry:
  %is0 = icmp eq i32 %status_ix, 0
  br i1 %is0, label %bb_ok, label %check1

check1:
  %is1 = icmp eq i32 %status_ix, 1
  br i1 %is1, label %bb_bad, label %check2

check2:
  %is2 = icmp eq i32 %status_ix, 2
  br i1 %is2, label %bb_full, label %bb_reject

bb_ok: ; push ok
  %t0 = add i32 0, 0
  br label %merge

bb_bad: ; push badNode
  %t1 = add i32 0, -1
  br label %merge

bb_full: ; push full (at CAP)
  %t2 = add i32 0, -2
  br label %merge

bb_reject: ; unknown status fail-closed
  br label %merge

merge:
  %code = phi i32 [ %t0, %bb_ok ], [ %t1, %bb_bad ], [ %t2, %bb_full ], [ -3, %bb_reject ]
  ret i32 %code
}

; ORDERED-IR-PROGRAM Program kernel band (SELF-HOST-KERNEL-PROGRAM lowerProgramKernel)
; Three nodes: ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA
; SSA-shaped: node fields are distinct SSA values (not full CFG pipeline)
define i1 @slake_program_ssa_kernel_band_ready() {
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
  ; length honesty: three Program kernel nodes
  %len = add i32 0, 3
  %ok = icmp eq i32 %len, 3
  ret i1 %ok
}

; EMPTY-PROGRAM-FAIL-CLOSED + CAP well-typed sketch (IrProgram.isWellTyped)
; count 0 fails; count > CAP fails; count in 1..CAP ok (node checks omitted)
define i1 @slake_program_ssa_is_well_typed(i32 %count) {
entry:
  %nz = icmp ne i32 %count, 0
  %le = icmp ule i32 %count, 8
  %ok = and i1 %nz, %le
  ret i1 %ok
}
