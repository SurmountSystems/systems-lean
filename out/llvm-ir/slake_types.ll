; SLAKE_LLVM_TYPES_TEXT_V0 / HOST-LLVM-TYPES-TEXT
; Generator-owned Types unit LLVM IR fragment from Systems Lean Types SSOT
; NodeKind: VALUE LINEAR ERASED
; Kind/mult pairing: VALUE<->MULT-OMEGA LINEAR<->MULT-1 ERASED<->MULT-0
; Types honesty: TYPED_IR_V0 FAIL-CLOSED-UNKNOWN-KIND kindMultOk isValidKindTag
; Types SSOT: src/systems/SystemsLean/Types.lean
; Path: out/llvm-ir/slake_types.ll (Lean IO.FS.writeFile)
; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub
; Recipe: just llvm-types-text / lake exe slake-llvm-types-text
; Not production LLVM backend. Not llvm-as success. Not unlock residual.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.

; NodeKind tag constants (0=VALUE, 1=LINEAR, 2=ERASED)
@slake_types_kind_0 = private unnamed_addr constant i32 0, align 4 ; VALUE
@slake_types_kind_1 = private unnamed_addr constant i32 1, align 4 ; LINEAR
@slake_types_kind_2 = private unnamed_addr constant i32 2, align 4 ; ERASED

; Fail-closed kind tag check (Types.isValidKindTag / ofKindTag? known 0/1/2 only)
; FAIL-CLOSED-UNKNOWN-KIND
define i1 @slake_types_is_valid_kind_tag(i32 %tag) {
entry:
  %is0 = icmp eq i32 %tag, 0
  %is1 = icmp eq i32 %tag, 1
  %is2 = icmp eq i32 %tag, 2
  %t01 = or i1 %is0, %is1
  %ok = or i1 %t01, %is2
  ret i1 %ok
}

; kindMultOk table sketch (kind tag -> expected Mult tag)
; VALUE(0)->MULT-OMEGA(2); LINEAR(1)->MULT-1(1); ERASED(2)->MULT-0(0)
define i32 @slake_types_expected_mult_tag(i32 %kind) {
entry:
  %is0 = icmp eq i32 %kind, 0
  %is1 = icmp eq i32 %kind, 1
  %r0 = select i1 %is0, i32 2, i32 0
  %r1 = select i1 %is1, i32 1, i32 %r0
  ret i32 %r1
}

; kindMultOk predicate sketch (kind tag pairs with Mult tag)
define i1 @slake_types_kind_mult_ok(i32 %kind, i32 %mult) {
entry:
  %exp = call i32 @slake_types_expected_mult_tag(i32 %kind)
  %ok = icmp eq i32 %exp, %mult
  ret i1 %ok
}

; TYPED_IR_V0 well-typed sketch (kind valid and kind/mult pairing holds)
define i1 @slake_types_is_well_typed(i32 %kind, i32 %mult) {
entry:
  %vk = call i1 @slake_types_is_valid_kind_tag(i32 %kind)
  %km = call i1 @slake_types_kind_mult_ok(i32 %kind, i32 %mult)
  %ok = and i1 %vk, %km
  ret i1 %ok
}
