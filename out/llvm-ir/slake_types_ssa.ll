; SLAKE_LLVM_TYPES_SSA_V0 / HOST-LLVM-TYPES-SSA
; Generator-owned Types program-graph SSA-shaped IR from KernelTypes + Types SSOT
; Types focus: TYPED_IR_V0 VALUE LINEAR ERASED
; Kind/mult: ERASED/MULT-0 LINEAR/MULT-1 VALUE/MULT-OMEGA
; SELF-HOST-KERNEL-TYPES ORDERED-IR-PROGRAM SSA-SHAPED
; Kernel Types SSOT: src/systems/SystemsLean/KernelTypes.lean
; Types SSOT: src/systems/SystemsLean/Types.lean
; Path: out/llvm-ir/slake_types_ssa.ll (Lean IO.FS.writeFile)
; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmTypesText Types unit IR; LlvmLinearSsa Linear SSA; LlvmMultSsa Mult SSA; LlvmEmitPath design+stub
; Recipe: just llvm-types-ssa / lake exe slake-llvm-types-ssa
; Types SSA partial: block labels + phi + ordered SSA node defs for Types band only
; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; Types kind tag constants (0=VALUE, 1=LINEAR, 2=ERASED; TYPED_IR_V0)
@slake_types_ssa_kind_value = private unnamed_addr constant i32 0, align 4 ; VALUE
@slake_types_ssa_kind_linear = private unnamed_addr constant i32 1, align 4 ; LINEAR
@slake_types_ssa_kind_erased = private unnamed_addr constant i32 2, align 4 ; ERASED

; SSA-SHAPED Types kind-tag lower (partial; Types band only; not full CFG/dominance)
; FAIL-CLOSED-UNKNOWN-KIND: unknown kind_ix returns -1
define i32 @slake_types_ssa_kind_tag(i32 %kind_ix) {
entry:
  %is0 = icmp eq i32 %kind_ix, 0
  br i1 %is0, label %bb_value, label %check1

check1:
  %is1 = icmp eq i32 %kind_ix, 1
  br i1 %is1, label %bb_linear, label %check2

check2:
  %is2 = icmp eq i32 %kind_ix, 2
  br i1 %is2, label %bb_erased, label %bb_reject

bb_value: ; VALUE / MULT-OMEGA band node
  %t0 = add i32 0, 0
  br label %merge

bb_linear: ; LINEAR / MULT-1 band node
  %t1 = add i32 0, 1
  br label %merge

bb_erased: ; ERASED / MULT-0 band node
  %t2 = add i32 0, 2
  br label %merge

bb_reject: ; FAIL-CLOSED-UNKNOWN-KIND
  br label %merge

merge:
  %tag = phi i32 [ %t0, %bb_value ], [ %t1, %bb_linear ], [ %t2, %bb_erased ], [ -1, %bb_reject ]
  ret i32 %tag
}

; ORDERED-IR-PROGRAM Types kernel band (SELF-HOST-KERNEL-TYPES lowerTypesKernel)
; Three nodes: ERASED/MULT-0, LINEAR/MULT-1, VALUE/MULT-OMEGA (TYPED_IR_V0)
; SSA-shaped: node fields are distinct SSA values (not full CFG pipeline)
define i1 @slake_types_ssa_kernel_band_ready() {
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
  ; length honesty: three Types kernel nodes
  %len = add i32 0, 3
  %ok = icmp eq i32 %len, 3
  ret i1 %ok
}

; Fail-closed kind tag check (Types.isValidKindTag / ofKindTag? known 0/1/2 only)
define i1 @slake_types_ssa_is_valid_kind(i32 %tag) {
entry:
  %ge0 = icmp sge i32 %tag, 0
  %le2 = icmp sle i32 %tag, 2
  %ok = and i1 %ge0, %le2
  ret i1 %ok
}
