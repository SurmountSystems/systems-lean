# SPDX-License-Identifier: Unlicense
# Program foreign link success: dual Program push-status layout/IR agreement.
# Host Lean ProgramForeignLink dual-pins foreign consumer contract (i32 Program
# push codes 0/-1/-2 ok/badNode/full, size 4, align 4, CAP=8, named target)
# against Program SSOT + freestanding Program subset cite + Program unit IR
# push constants + Program SSA push constants / push_status honesty. Out-of-tree
# consumer recipe documented; no product Rust under src/. Not Graph foreign
# link. Mult Mult-only + Linear Mult-class + Types kind tags stay in their
# modules (otherBands false there). Not full LLVM production backend. Not
# free/complete/PROVABLY flip. Honest dual surface: push status codes (not a
# three-tag kind enum).
# Greppable: HOST-PROGRAM-FOREIGN-LINK, SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0,
# PROGRAM-FOREIGN-LINK-SUCCESS, program-foreign-link-success,
# PROGRAM-FOREIGN-DUAL-AGREEMENT, FOREIGN-PROGRAM-CONSUMER-CONTRACT.
{
  requiredFiles = [
    "doc/dev/research/program-foreign-link-success-2026-08-10.md"
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
    "src/systems/SystemsLean/ProgramForeignLink.lean"
    "src/systems/SystemsLean/IrProgram.lean"
    "src/systems/emit/slake_program_subset.h"
    "out/llvm-ir/slake_program.ll"
    "out/llvm-ir/slake_program_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/ProgramForeignLink.lean";
      all = [
        "HOST-PROGRAM-FOREIGN-LINK"
        "SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0"
        "PROGRAM-FOREIGN-LINK-SUCCESS"
        "PROGRAM-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-PROGRAM-CONSUMER-CONTRACT"
        "programForeignLinkSuccessClaimed"
        "programForeignLinkDualAgreementOk"
        "programForeignLinkConsumerContractOk"
        "program-foreign-link-success"
        "x86_64-unknown-linux-gnu"
        "foreignProgramTagSizeBytes"
        "foreignProgramTagAlignBytes"
        "foreignProgramPushOkCode"
        "foreignProgramPushBadCode"
        "foreignProgramPushFullCode"
        "foreignProgramCap"
        "out-of-tree"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "def programForeignLinkSuccessClaimed : Bool := true"
        "def programForeignLinkFullBackendClaimed : Bool := false"
        "def programForeignLinkOtherBandsClaimed : Bool := false"
        "theorem programForeignLinkFullBackendClaimed_false"
        "theorem programForeignLinkOtherBandsClaimed_false"
        "llvmProgramSsaRustNativeLinkClaimed"
      ];
      forbidden = [
        "def programForeignLinkFullBackendClaimed : Bool := true"
        "def programForeignLinkOtherBandsClaimed : Bool := true"
      ];
    }
    {
      rel = "doc/dev/research/program-foreign-link-success-2026-08-10.md";
      all = [
        "PROGRAM-FOREIGN-LINK-SUCCESS"
        "PROGRAM-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-PROGRAM-CONSUMER-CONTRACT"
        "program-foreign-link-success"
        "out-of-tree"
        "size 4"
        "align 4"
        "x86_64-unknown-linux-gnu"
        "repr(i32)"
        "ProgramPushStatus"
        "Remaining bands"
        "not claimed"
        "full LLVM production backend"
        "Mult Mult-only"
        "Linear foreign"
        "Types foreign"
        "push"
      ];
    }
    {
      rel = "src/systems/emit/slake_program_subset.h";
      all = [
        "SLAKE_IR_PROGRAM_CAP"
        "slake_ir_program"
        "slake_ir_program_push"
        "slake_ir_program_is_well_typed"
        "IR_PROGRAM_V0"
      ];
    }
    {
      rel = "out/llvm-ir/slake_program.ll";
      all = [
        "@slake_program_cap = private unnamed_addr constant i32 8, align 4"
        "@slake_program_push_ok = private unnamed_addr constant i32 0, align 4"
        "@slake_program_push_bad = private unnamed_addr constant i32 -1, align 4"
        "@slake_program_push_full = private unnamed_addr constant i32 -2, align 4"
        "slake_program_is_well_typed"
      ];
    }
    {
      rel = "out/llvm-ir/slake_program_ssa.ll";
      all = [
        "@slake_program_ssa_cap = private unnamed_addr constant i32 8, align 4"
        "@slake_program_ssa_push_ok = private unnamed_addr constant i32 0, align 4"
        "@slake_program_ssa_push_bad = private unnamed_addr constant i32 -1, align 4"
        "@slake_program_ssa_push_full = private unnamed_addr constant i32 -2, align 4"
        "slake_program_ssa_push_status"
        "slake_program_ssa_kernel_band_ready"
        "slake_program_ssa_is_well_typed"
      ];
    }
    {
      rel = "doc/dev/research/layout-size-align-fixture-2026-08-03.md";
      all = [
        "LAYOUT-SIZE-ALIGN-FIXTURE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "size 4"
        "align 4"
        "x86_64-unknown-linux-gnu"
      ];
    }
    {
      rel = "src/systems/SystemsLean/IrProgram.lean";
      all = [
        "programCap"
        "PushResult"
        "badNode"
        "isWellTyped"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "program-foreign-link-success:"
        "HOST-PROGRAM-FOREIGN-LINK"
        "SLAKE_PROGRAM_FOREIGN_LINK_SUCCESS_V0"
        "PROGRAM-FOREIGN-LINK-SUCCESS"
        "PROGRAM-FOREIGN-DUAL-AGREEMENT"
        "not Graph foreign link"
        "not full backend"
      ];
    }
  ];
}
