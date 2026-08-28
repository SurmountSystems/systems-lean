# SPDX-License-Identifier: Unlicense
# Mult layout/IR consumer success partial: advances past Mult link readiness by
# requiring freestanding Mult API symbols, Mult unit IR + Mult SSA kernel/is_valid
# tags, and layout fixture size/align agreement on one named target. Still
# Slake-owned (Lean / Nix / freestanding). Not Rust-native / foreign link success.
# Not full Graph/Program layout. Not full interop without classic FFI.
# Not product Rust crate. Greppable: HOST-MULT-LAYOUT-IR-SUCCESS,
# SLAKE_MULT_LAYOUT_IR_SUCCESS_V0, mult-layout-ir-success,
# MULT-LAYOUT-IR-CONSUMER-SUCCESS-PARTIAL.
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
        "SSA-SHAPED"
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
        "mult-layout-ir-success:"
        "HOST-MULT-LAYOUT-IR-SUCCESS"
        "SLAKE_MULT_LAYOUT_IR_SUCCESS_V0"
        "MULT-LAYOUT-IR-CONSUMER-SUCCESS-PARTIAL"
        "not Rust-native link success"
        "not full Graph layout"
        "not full interop"
      ];
    }
  ];
}
