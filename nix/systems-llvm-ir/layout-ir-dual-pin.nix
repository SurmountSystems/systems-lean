# SPDX-License-Identifier: Unlicense
# Layout IR tag dual-pin: fail-closed pure Nix that Mult IR tag constants and
# layout fixture rows stay dual-pinned (0/1/2, i32 align 4). Distinct from
# abi-parity (header + fixture + IR agreement): this slice requires explicit
# dual-pin greppable token LAYOUT-IR-TAG-DUAL-PIN and full IR constant lines.
# Mult is primary this residual. Linear/Types use analogous i32 class/kind
# constants (different symbol shape) -- Mult-only dual-pin required; Linear/Types
# when in scope later. Not Rust-native link. Not full Graph/Program layout.
# Greppable: HOST-LAYOUT-IR-TAG-DUAL-PIN, SLAKE_LAYOUT_IR_TAG_DUAL_PIN_V0,
# layout-ir-dual-pin, LAYOUT-IR-TAG-DUAL-PIN.
{
  requiredFiles = [
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "out/llvm-ir/slake_mult.ll"
    "src/systems/SystemsLean/Mult.lean"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "doc/dev/research/layout-size-align-fixture-2026-08-03.md";
      all = [
        "LAYOUT-SIZE-ALIGN-FIXTURE"
        "LAYOUT-IR-TAG-DUAL-PIN"
        "slake_mult_tag_"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "align 4"
        "size 4"
        "not Rust-native link"
        "not full Graph/Program layout"
      ];
    }
    {
      rel = "out/llvm-ir/slake_mult.ll";
      all = [
        "@slake_mult_tag_0 = private unnamed_addr constant i32 0, align 4"
        "@slake_mult_tag_1 = private unnamed_addr constant i32 1, align 4"
        "@slake_mult_tag_omega = private unnamed_addr constant i32 2, align 4"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
      ];
    }
    {
      rel = "src/systems/SystemsLean/Mult.lean";
      all = [
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "def name"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "layout-ir-dual-pin:"
        "HOST-LAYOUT-IR-TAG-DUAL-PIN"
        "SLAKE_LAYOUT_IR_TAG_DUAL_PIN_V0"
        "not Rust-native link"
        "not full Graph/Program layout"
      ];
    }
  ];
}
