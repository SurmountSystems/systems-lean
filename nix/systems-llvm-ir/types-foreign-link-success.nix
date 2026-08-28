# SPDX-License-Identifier: Unlicense
# Types foreign link success: dual Types kind-tag layout/IR agreement.
# Host Lean TypesForeignLink dual-pins foreign consumer contract (i32 Types
# kind tags 0/1/2 VALUE/LINEAR/ERASED, size 4, align 4, named target) against
# Types SSOT + freestanding Types API cite + Types unit IR kind tags + Types
# SSA kind tags / is_valid honesty. Out-of-tree consumer recipe documented; no
# product Rust under src/. Not Program/Graph foreign link. Mult Mult-only +
# Linear Mult-class tags stay in their modules (otherBands false there). Not
# full LLVM production backend. Not free/complete/PROVABLY flip.
# Greppable: HOST-TYPES-FOREIGN-LINK, SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0,
# TYPES-FOREIGN-LINK-SUCCESS, types-foreign-link-success,
# TYPES-FOREIGN-DUAL-AGREEMENT, FOREIGN-TYPES-CONSUMER-CONTRACT.
{
  requiredFiles = [
    "doc/dev/research/types-foreign-link-success-2026-08-10.md"
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
    "src/systems/SystemsLean/TypesForeignLink.lean"
    "src/systems/SystemsLean/Types.lean"
    "src/systems/emit/slake_types_subset.h"
    "out/llvm-ir/slake_types.ll"
    "out/llvm-ir/slake_types_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/TypesForeignLink.lean";
      all = [
        "HOST-TYPES-FOREIGN-LINK"
        "SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0"
        "TYPES-FOREIGN-LINK-SUCCESS"
        "TYPES-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-TYPES-CONSUMER-CONTRACT"
        "typesForeignLinkSuccessClaimed"
        "typesForeignLinkDualAgreementOk"
        "typesForeignLinkConsumerContractOk"
        "types-foreign-link-success"
        "x86_64-unknown-linux-gnu"
        "foreignTypesTagSizeBytes"
        "foreignTypesTagAlignBytes"
        "out-of-tree"
        "VALUE"
        "LINEAR"
        "ERASED"
        "TYPED_IR_V0"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "def typesForeignLinkSuccessClaimed : Bool := true"
        "def typesForeignLinkFullBackendClaimed : Bool := false"
        "def typesForeignLinkOtherBandsClaimed : Bool := false"
        "theorem typesForeignLinkFullBackendClaimed_false"
        "theorem typesForeignLinkOtherBandsClaimed_false"
        "llvmTypesSsaRustNativeLinkClaimed"
      ];
      forbidden = [
        "def typesForeignLinkFullBackendClaimed : Bool := true"
        "def typesForeignLinkOtherBandsClaimed : Bool := true"
      ];
    }
    {
      rel = "doc/dev/research/types-foreign-link-success-2026-08-10.md";
      all = [
        "TYPES-FOREIGN-LINK-SUCCESS"
        "TYPES-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-TYPES-CONSUMER-CONTRACT"
        "types-foreign-link-success"
        "out-of-tree"
        "size 4"
        "align 4"
        "x86_64-unknown-linux-gnu"
        "repr(i32)"
        "TypesKindTag"
        "Remaining bands"
        "not claimed"
        "full LLVM production backend"
        "Mult Mult-only"
        "Linear foreign"
      ];
    }
    {
      rel = "src/systems/emit/slake_types_subset.h";
      all = [
        "enum slake_ir_kind"
        "SLAKE_IR_KIND_VALUE"
        "SLAKE_IR_KIND_LINEAR"
        "SLAKE_IR_KIND_ERASED"
        "slake_ir_node"
        "TYPED_IR_V0"
      ];
    }
    {
      rel = "out/llvm-ir/slake_types.ll";
      all = [
        "@slake_types_kind_0 = private unnamed_addr constant i32 0, align 4"
        "@slake_types_kind_1 = private unnamed_addr constant i32 1, align 4"
        "@slake_types_kind_2 = private unnamed_addr constant i32 2, align 4"
        "slake_types_is_valid_kind_tag"
      ];
    }
    {
      rel = "out/llvm-ir/slake_types_ssa.ll";
      all = [
        "@slake_types_ssa_kind_value = private unnamed_addr constant i32 0, align 4"
        "@slake_types_ssa_kind_linear = private unnamed_addr constant i32 1, align 4"
        "@slake_types_ssa_kind_erased = private unnamed_addr constant i32 2, align 4"
        "slake_types_ssa_kind_tag"
        "slake_types_ssa_kernel_band_ready"
        "slake_types_ssa_is_valid_kind"
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
      rel = "src/systems/SystemsLean/Types.lean";
      all = [
        "VALUE"
        "LINEAR"
        "ERASED"
        "TYPED_IR_V0"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "ofKindTag?"
        "isValidKindTag"
        "NodeKind"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "types-foreign-link-success:"
        "HOST-TYPES-FOREIGN-LINK"
        "SLAKE_TYPES_FOREIGN_LINK_SUCCESS_V0"
        "TYPES-FOREIGN-LINK-SUCCESS"
        "TYPES-FOREIGN-DUAL-AGREEMENT"
        "not Program foreign link"
        "not full backend"
      ];
    }
  ];
}
