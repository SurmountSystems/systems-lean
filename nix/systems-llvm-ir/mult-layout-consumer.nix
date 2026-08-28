# SPDX-License-Identifier: Unlicense
# Mult layout consumer fixture (B1): pure Nix agreement that freestanding Mult
# header, Mult IR tags, and layout fixture share size/align/discriminants on a
# named target. Not Rust-native link success. Not full Graph layout.
# Greppable: HOST-MULT-LAYOUT-CONSUMER, SLAKE_MULT_LAYOUT_CONSUMER_V0,
# mult-layout-consumer.
{
  requiredFiles = [
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
    "src/systems/emit/slake_mult_subset.h"
    "out/llvm-ir/slake_mult.ll"
    "src/systems/SystemsLean/Mult.lean"
    "just/llvm.just"
  ];

  contentSpecs = [
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
        "slake_mult_tag_"
      ];
    }
    {
      rel = "doc/dev/research/rust-native-layout-design-2026-08-03.md";
      all = [
        "Rust-native layout design"
        "without classic FFI"
        "Not Rust-native link success"
        "Layout size/align fixture"
      ];
    }
    {
      rel = "src/systems/emit/slake_mult_subset.h";
      all = [
        "enum slake_mult"
        "SLAKE_MULT_0 = 0"
        "SLAKE_MULT_1 = 1"
        "SLAKE_MULT_OMEGA = 2"
      ];
    }
    {
      rel = "out/llvm-ir/slake_mult.ll";
      all = [
        "@slake_mult_tag_0 = private unnamed_addr constant i32 0, align 4"
        "@slake_mult_tag_1 = private unnamed_addr constant i32 1, align 4"
        "@slake_mult_tag_omega = private unnamed_addr constant i32 2, align 4"
      ];
    }
    {
      rel = "src/systems/SystemsLean/Mult.lean";
      all = [
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "mult-layout-consumer:"
        "HOST-MULT-LAYOUT-CONSUMER"
        "SLAKE_MULT_LAYOUT_CONSUMER_V0"
        "not Rust-native link success"
        "not full Graph layout"
      ];
    }
  ];
}
