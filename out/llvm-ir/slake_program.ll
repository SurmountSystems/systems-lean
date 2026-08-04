; SLAKE_LLVM_PROGRAM_TEXT_V0 / HOST-LLVM-PROGRAM-TEXT
; Generator-owned ordered IR program unit LLVM IR fragment from Systems Lean Program SSOT
; ORDERED-IR-PROGRAM SLAKE_IR_PROGRAM_CAP=8 EMPTY-PROGRAM-FAIL-CLOSED
; Surface: programCap push isWellTyped checkFailClosed (not CFG not SSA)
; Program SSOT: src/systems/SystemsLean/IrProgram.lean
; Path: out/llvm-ir/slake_program.ll (Lean IO.FS.writeFile)
; Honesty: local text module unlock pin false; living LlvmHold.llvmUnlocked true after unlock residual; not full backend
; Prior: LlvmTypesText Types IR; LlvmLinearText Linear IR; LlvmMultText Mult IR; LlvmEmitPath stub
; Recipe: just llvm-program-text / lake exe slake-llvm-program-text
; Not production LLVM backend. Not llvm-as success. Not full CFG/SSA.
; Not Rust-native link. Not freestanding residual free re-open.
; Not product freestanding C growth. Host elaborator residual remains.
; Not CFG. Not SSA. Not a second IR dialect.

; Ordered IR program surface constants (IrProgram.programCap / push map)
; SLAKE_IR_PROGRAM_CAP = 8
; push: 0=ok, -1=badNode, -2=full (emit map)
@slake_program_cap = private unnamed_addr constant i32 8, align 4 ; SLAKE_IR_PROGRAM_CAP
@slake_program_push_ok = private unnamed_addr constant i32 0, align 4 ; push ok
@slake_program_push_bad = private unnamed_addr constant i32 -1, align 4 ; badNode
@slake_program_push_full = private unnamed_addr constant i32 -2, align 4 ; full

; EMPTY-PROGRAM-FAIL-CLOSED (IrProgram.isWellTyped empty is false)
; count 0 is not well-typed as a program (matches emit)
define i1 @slake_program_is_well_typed_empty() {
entry:
  ret i1 false
}

; isWellTyped sketch (count in 1..CAP; node checks omitted in text fragment)
; Oversize (count > CAP) and empty fail closed
define i1 @slake_program_is_well_typed(i32 %count) {
entry:
  %nz = icmp ne i32 %count, 0
  %le = icmp ule i32 %count, 8
  %ok = and i1 %nz, %le
  ret i1 %ok
}

; checkFailClosed sketch (same bar as isWellTyped on host V0)
define i1 @slake_program_check_fail_closed(i32 %count) {
entry:
  %ok = call i1 @slake_program_is_well_typed(i32 %count)
  ret i1 %ok
}

; push capacity sketch: full when count >= CAP (returns -2)
; 0=ok path when count < CAP and node well-typed (node check omitted here)
define i32 @slake_program_push_capacity(i32 %count) {
entry:
  %full = icmp uge i32 %count, 8
  %r = select i1 %full, i32 -2, i32 0
  ret i32 %r
}
