; SLAKE_LLVM_MULT_TEXT_V0 / HOST-LLVM-MULT-TEXT
; Generator-owned Mult unit LLVM IR fragment from Systems Lean Mult SSOT
; Mult grades: MULT-0 MULT-1 MULT-OMEGA
; Mult SSOT: src/systems/SystemsLean/Mult.lean
; Path: out/llvm-ir/slake_mult.ll (Lean IO.FS.writeFile)
; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmEmitPath design+stub (HOST-LLVM-EMIT-PATH)
; Recipe: just llvm-mult-text / lake exe slake-llvm-mult-text
; Not production LLVM backend. Not llvm-as success. Not unlock residual.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; Mult grade tag constants (0=MULT-0, 1=MULT-1, 2=MULT-OMEGA)
@slake_mult_tag_0 = private unnamed_addr constant i32 0, align 4 ; MULT-0
@slake_mult_tag_1 = private unnamed_addr constant i32 1, align 4 ; MULT-1
@slake_mult_tag_omega = private unnamed_addr constant i32 2, align 4 ; MULT-OMEGA

; Fail-closed raw tag check (Mult.isValidTag / ofNat? known 0/1/2 only)
define i1 @slake_mult_is_valid_tag(i32 %tag) {
entry:
  %is0 = icmp eq i32 %tag, 0
  %is1 = icmp eq i32 %tag, 1
  %is2 = icmp eq i32 %tag, 2
  %t01 = or i1 %is0, %is1
  %ok = or i1 %t01, %is2
  ret i1 %ok
}
