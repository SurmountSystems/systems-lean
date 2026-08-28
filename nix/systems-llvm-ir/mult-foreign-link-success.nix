# SPDX-License-Identifier: Unlicense
# Mult foreign link success: dual Mult layout/IR agreement beyond Mult layout/IR
# consumer partial and Mult link readiness partial. Host Lean MultForeignLink
# dual-pins foreign consumer contract (i32 Mult tags 0/1/2, size 4, align 4,
# named target) against Mult SSOT + freestanding Mult API + Mult unit IR + Mult
# SSA + layout fixture. Out-of-tree consumer recipe documented; no product Rust
# under src/. Not Linear/Types/Program/Graph foreign link. Not full LLVM
# production backend. Not free/complete/PROVABLY flip.
# Greppable: HOST-MULT-FOREIGN-LINK, SLAKE_MULT_FOREIGN_LINK_SUCCESS_V0,
# MULT-FOREIGN-LINK-SUCCESS, mult-foreign-link-success,
# MULT-FOREIGN-DUAL-AGREEMENT, FOREIGN-MULT-CONSUMER-CONTRACT.
{
  requiredFiles = [
    "doc/dev/research/mult-foreign-link-success-2026-08-09.md"
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
    "src/systems/SystemsLean/MultForeignLink.lean"
    "src/systems/SystemsLean/Mult.lean"
    "src/systems/emit/slake_mult_subset.h"
    "out/llvm-ir/slake_mult.ll"
    "out/llvm-ir/slake_mult_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/MultForeignLink.lean";
      all = [
        "HOST-MULT-FOREIGN-LINK"
        "SLAKE_MULT_FOREIGN_LINK_SUCCESS_V0"
        "MULT-FOREIGN-LINK-SUCCESS"
        "MULT-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-MULT-CONSUMER-CONTRACT"
        "multForeignLinkSuccessClaimed"
        "multForeignLinkDualAgreementOk"
        "multForeignLinkConsumerContractOk"
        "mult-foreign-link-success"
        "x86_64-unknown-linux-gnu"
        "foreignMultTagSizeBytes"
        "foreignMultTagAlignBytes"
        "out-of-tree"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "def multForeignLinkSuccessClaimed : Bool := true"
        "def multForeignLinkFullBackendClaimed : Bool := false"
        "def multForeignLinkOtherBandsClaimed : Bool := false"
        "theorem multForeignLinkOtherBandsClaimed_false"
        "theorem multForeignLinkFullBackendClaimed_false"
        "llvmMultSsaRustNativeLinkClaimed"
      ];
      forbidden = [
        "def multForeignLinkFullBackendClaimed : Bool := true"
        "def multForeignLinkOtherBandsClaimed : Bool := true"
      ];
    }
    {
      rel = "doc/dev/research/mult-foreign-link-success-2026-08-09.md";
      all = [
        "MULT-FOREIGN-LINK-SUCCESS"
        "MULT-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-MULT-CONSUMER-CONTRACT"
        "mult-foreign-link-success"
        "out-of-tree"
        "size 4"
        "align 4"
        "x86_64-unknown-linux-gnu"
        "repr(i32)"
        "MultTag"
        "Remaining bands"
        "not claimed"
        "full LLVM production backend"
      ];
    }
    {
      rel = "src/systems/emit/slake_mult_subset.h";
      all = [
        "enum slake_mult"
        "SLAKE_MULT_0 = 0"
        "SLAKE_MULT_1 = 1"
        "SLAKE_MULT_OMEGA = 2"
        "slake_mult_is_valid"
        "slake_mult_is_known"
        "slake_mult_name"
      ];
    }
    {
      rel = "out/llvm-ir/slake_mult.ll";
      all = [
        "@slake_mult_tag_0 = private unnamed_addr constant i32 0, align 4"
        "@slake_mult_tag_1 = private unnamed_addr constant i32 1, align 4"
        "@slake_mult_tag_omega = private unnamed_addr constant i32 2, align 4"
        "slake_mult_is_valid_tag"
      ];
    }
    {
      rel = "out/llvm-ir/slake_mult_ssa.ll";
      all = [
        "@slake_mult_ssa_tag_0 = private unnamed_addr constant i32 0, align 4"
        "@slake_mult_ssa_tag_1 = private unnamed_addr constant i32 1, align 4"
        "@slake_mult_ssa_tag_omega = private unnamed_addr constant i32 2, align 4"
        "slake_mult_ssa_grade_tag"
        "slake_mult_ssa_kernel_band_ready"
        "slake_mult_ssa_is_valid_tag"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "Not production LLVM backend"
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
      rel = "src/systems/SystemsLean/Mult.lean";
      all = [
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "ofNat?"
        "isValidTag"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "mult-foreign-link-success:"
        "HOST-MULT-FOREIGN-LINK"
        "SLAKE_MULT_FOREIGN_LINK_SUCCESS_V0"
        "MULT-FOREIGN-LINK-SUCCESS"
        "MULT-FOREIGN-DUAL-AGREEMENT"
        "not full Graph layout"
        "not full backend"
        "not Linear foreign link"
      ];
    }
  ];
}
