; SLAKE_LLVM_LINEAR_SSA_V0 / HOST-LLVM-LINEAR-SSA
; Generator-owned Linear program-graph SSA-shaped IR from KernelLinear + Linear SSOT
; Linear focus: MULT-1 LINEAR-EXACT-ONCE
; SELF-HOST-KERNEL-LINEAR ORDERED-IR-PROGRAM SSA-SHAPED
; Kernel Linear SSOT: src/systems/SystemsLean/KernelLinear.lean
; Linear SSOT: src/systems/SystemsLean/Linear.lean
; Path: out/llvm-ir/slake_linear_ssa.ll (Lean IO.FS.writeFile)
; Honesty: local unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmLinearText Linear unit IR; LlvmMultSsa Mult SSA partial; LlvmEmitPath design+stub
; Recipe: just llvm-linear-ssa / lake exe slake-llvm-linear-ssa
; Linear SSA partial: block labels + phi + ordered SSA node defs for Linear band only
; Not production LLVM backend. Not full CFG/dominance. Not llvm-as success.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; Linear MULT-1 tag constant (exact-once resource band)
@slake_linear_ssa_tag_1 = private unnamed_addr constant i32 1, align 4 ; MULT-1

; SSA-SHAPED Linear live-flag lower (partial; Linear band only; not full CFG/dominance)
; LINEAR-EXACT-ONCE: only live_ix == 1 is live; else reject (-1)
define i32 @slake_linear_ssa_live_flag(i32 %live_ix) {
entry:
  %is1 = icmp eq i32 %live_ix, 1
  br i1 %is1, label %bb_live, label %bb_reject

bb_live: ; MULT-1 / LINEAR live token
  %t1 = add i32 0, 1
  br label %merge

bb_reject: ; not live / fail closed
  br label %merge

merge:
  %flag = phi i32 [ %t1, %bb_live ], [ -1, %bb_reject ]
  ret i32 %flag
}

; ORDERED-IR-PROGRAM Linear kernel band (SELF-HOST-KERNEL-LINEAR lowerLinearKernel)
; One node: MULT-1 linear exact-once
; SSA-shaped: node fields are distinct SSA values (not full CFG pipeline)
define i1 @slake_linear_ssa_kernel_band_ready() {
entry:
  ; node0: tag=1 mult=MULT-1 kind=LINEAR
  %n0_tag = add i32 0, 1
  %n0_mult = add i32 0, 1
  %n0_kind = add i32 0, 1
  ; length honesty: one Linear kernel node
  %len = add i32 0, 1
  %ok = icmp eq i32 %len, 1
  ret i1 %ok
}

; Fail-closed live check (HostCompose linear live-flag: only 1 is live)
define i1 @slake_linear_ssa_is_live(i32 %flag) {
entry:
  %ok = icmp eq i32 %flag, 1
  ret i1 %ok
}
