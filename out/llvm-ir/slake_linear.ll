; SLAKE_LLVM_LINEAR_TEXT_V0 / HOST-LLVM-LINEAR-TEXT
; Generator-owned Linear unit LLVM IR fragment from Systems Lean Linear SSOT
; Linear class ids: MULT-0 (polyId) MULT-1 (LINEAR-EXACT-ONCE) MULT-OMEGA (shareNat)
; Linear honesty: LINEAR-EXACT-ONCE LINEAR-AXIOMS-REMAIN
; Linear SSOT: src/systems/SystemsLean/Linear.lean
; Path: out/llvm-ir/slake_linear.ll (Lean IO.FS.writeFile)
; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmMultText Mult IR (HOST-LLVM-MULT-TEXT); LlvmEmitPath stub
; Recipe: just llvm-linear-text / lake exe slake-llvm-linear-text
; Not production LLVM backend. Not llvm-as success. Not unlock residual.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; Linear Mult-class tag constants (0=MULT-0 polyId, 1=MULT-1 LINEAR-EXACT-ONCE, 2=MULT-OMEGA shareNat)
@slake_linear_class_0 = private unnamed_addr constant i32 0, align 4 ; MULT-0 polyId
@slake_linear_class_1 = private unnamed_addr constant i32 1, align 4 ; MULT-1 LINEAR-EXACT-ONCE
@slake_linear_class_omega = private unnamed_addr constant i32 2, align 4 ; MULT-OMEGA shareNat

; Fail-closed Linear Mult-class tag check (known 0/1/2 only)
define i1 @slake_linear_is_valid_class_tag(i32 %tag) {
entry:
  %is0 = icmp eq i32 %tag, 0
  %is1 = icmp eq i32 %tag, 1
  %is2 = icmp eq i32 %tag, 2
  %t01 = or i1 %is0, %is1
  %ok = or i1 %t01, %is2
  ret i1 %ok
}

; shareNat sketch (MULT-OMEGA unrestricted double; Linear.shareNat)
define i32 @slake_linear_share_nat(i32 %n) {
entry:
  %r = add i32 %n, %n
  ret i32 %r
}

; polyId sketch (MULT-0 erased-parameter identity; Linear.polyId)
define i32 @slake_linear_poly_id(i32 %x) {
entry:
  ret i32 %x
}

; LINEAR-EXACT-ONCE contract tag predicate (MULT-1 class only; model not elaborator)
define i1 @slake_linear_is_exact_once_tag(i32 %tag) {
entry:
  %ok = icmp eq i32 %tag, 1
  ret i1 %ok
}
