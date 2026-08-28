# SPDX-License-Identifier: Unlicense
# Linear foreign link success: dual Linear Mult-class tag layout/IR agreement.
# Host Lean LinearForeignLink dual-pins foreign consumer contract (i32 Linear
# Mult-class tags 0/1/2, size 4, align 4, named target) against Linear SSOT +
# freestanding Linear API cite + Linear unit IR class tags + Linear SSA Mult-1 /
# live_flag honesty. Out-of-tree consumer recipe documented; no product Rust
# under src/. Not Types/Program/Graph foreign link. Mult Mult-only stays in
# MultForeignLink (otherBands false there). Not full LLVM production backend.
# Not free/complete/PROVABLY flip.
# Greppable: HOST-LINEAR-FOREIGN-LINK, SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0,
# LINEAR-FOREIGN-LINK-SUCCESS, linear-foreign-link-success,
# LINEAR-FOREIGN-DUAL-AGREEMENT, FOREIGN-LINEAR-CONSUMER-CONTRACT.
{
  requiredFiles = [
    "doc/dev/research/linear-foreign-link-success-2026-08-10.md"
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
    "src/systems/SystemsLean/LinearForeignLink.lean"
    "src/systems/SystemsLean/Linear.lean"
    "src/systems/emit/slake_linear_subset.h"
    "out/llvm-ir/slake_linear.ll"
    "out/llvm-ir/slake_linear_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LinearForeignLink.lean";
      all = [
        "HOST-LINEAR-FOREIGN-LINK"
        "SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0"
        "LINEAR-FOREIGN-LINK-SUCCESS"
        "LINEAR-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-LINEAR-CONSUMER-CONTRACT"
        "linearForeignLinkSuccessClaimed"
        "linearForeignLinkDualAgreementOk"
        "linearForeignLinkConsumerContractOk"
        "linear-foreign-link-success"
        "x86_64-unknown-linux-gnu"
        "foreignLinearTagSizeBytes"
        "foreignLinearTagAlignBytes"
        "out-of-tree"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "LINEAR-EXACT-ONCE"
        "def linearForeignLinkSuccessClaimed : Bool := true"
        "def linearForeignLinkFullBackendClaimed : Bool := false"
        "def linearForeignLinkOtherBandsClaimed : Bool := false"
        "theorem linearForeignLinkFullBackendClaimed_false"
        "theorem linearForeignLinkOtherBandsClaimed_false"
        "llvmLinearSsaRustNativeLinkClaimed"
      ];
      forbidden = [
        "def linearForeignLinkFullBackendClaimed : Bool := true"
        "def linearForeignLinkOtherBandsClaimed : Bool := true"
      ];
    }
    {
      rel = "doc/dev/research/linear-foreign-link-success-2026-08-10.md";
      all = [
        "LINEAR-FOREIGN-LINK-SUCCESS"
        "LINEAR-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-LINEAR-CONSUMER-CONTRACT"
        "linear-foreign-link-success"
        "out-of-tree"
        "size 4"
        "align 4"
        "x86_64-unknown-linux-gnu"
        "repr(i32)"
        "LinearClassTag"
        "Remaining bands"
        "not claimed"
        "full LLVM production backend"
        "Mult Mult-only"
      ];
    }
    {
      rel = "src/systems/emit/slake_linear_subset.h";
      all = [
        "slake_linear_token"
        "slake_linear_consume"
        "slake_linear_token_is_live"
        "LINEAR-EXACT-ONCE"
        "CONSUME_TOKEN_HOST_V0"
      ];
    }
    {
      rel = "out/llvm-ir/slake_linear.ll";
      all = [
        "@slake_linear_class_0 = private unnamed_addr constant i32 0, align 4"
        "@slake_linear_class_1 = private unnamed_addr constant i32 1, align 4"
        "@slake_linear_class_omega = private unnamed_addr constant i32 2, align 4"
        "slake_linear_is_valid_class_tag"
      ];
    }
    {
      rel = "out/llvm-ir/slake_linear_ssa.ll";
      all = [
        "@slake_linear_ssa_tag_1 = private unnamed_addr constant i32 1, align 4"
        "slake_linear_ssa_live_flag"
        "slake_linear_ssa_kernel_band_ready"
        "slake_linear_ssa_is_live"
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
      rel = "src/systems/SystemsLean/Linear.lean";
      all = [
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "LINEAR-EXACT-ONCE"
        "mult0ClassId"
        "mult1ClassId"
        "multOmegaClassId"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "linear-foreign-link-success:"
        "HOST-LINEAR-FOREIGN-LINK"
        "SLAKE_LINEAR_FOREIGN_LINK_SUCCESS_V0"
        "LINEAR-FOREIGN-LINK-SUCCESS"
        "LINEAR-FOREIGN-DUAL-AGREEMENT"
        "not Types foreign link"
        "not full backend"
      ];
    }
  ];
}
