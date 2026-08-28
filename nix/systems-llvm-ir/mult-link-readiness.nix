# SPDX-License-Identifier: Unlicense
# Mult link readiness partial (B3): pure Nix agreement that Mult freestanding
# header, Mult unit IR, Mult SSA IR tags, and layout fixture share Mult
# discriminants on a named target. Advances past Mult layout consumer by also
# requiring Mult SSA IR. Not Rust-native link success. Not full Graph layout.
# Not full interop without classic FFI. Not product Rust crate.
# Greppable: HOST-MULT-LINK-READINESS, SLAKE_MULT_LINK_READINESS_V0,
# mult-link-readiness.
{
  requiredFiles = [
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
    "src/systems/emit/slake_mult_subset.h"
    "out/llvm-ir/slake_mult.ll"
    "out/llvm-ir/slake_mult_ssa.ll"
    "src/systems/SystemsLean/Mult.lean"
    "just/llvm.just"
  ];

  contentSpecs = [
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
      rel = "out/llvm-ir/slake_mult_ssa.ll";
      all = [
        "@slake_mult_ssa_tag_0 = private unnamed_addr constant i32 0, align 4"
        "@slake_mult_ssa_tag_1 = private unnamed_addr constant i32 1, align 4"
        "@slake_mult_ssa_tag_omega = private unnamed_addr constant i32 2, align 4"
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
      rel = "doc/dev/research/rust-native-layout-design-2026-08-03.md";
      all = [
        "Rust-native layout design"
        "without classic FFI"
        "Not Rust-native link success"
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
        "mult-link-readiness:"
        "HOST-MULT-LINK-READINESS"
        "SLAKE_MULT_LINK_READINESS_V0"
        "not Rust-native link success"
        "not full Graph layout"
        "not full interop"
      ];
    }
  ];
}
