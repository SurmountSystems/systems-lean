# SPDX-License-Identifier: Unlicense
# ABI parity smoke: pure Nix presence that freestanding Mult call story and
# documented layout fixture stay consistent with Mult IR tags.
# Discriminants 0/1/2 and i32/align 4 agreement across fixture + header + IR.
# Does not require llvm-as or cc. Not full Rust ABI. Not extern "Rust" stable.
# Not link without classic FFI. Greppable: HOST-ABI-PARITY-SMOKE,
# SLAKE_ABI_PARITY_SMOKE_V0, abi-parity-smoke.
{
  requiredFiles = [
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
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
        "enum slake_mult"
        "SLAKE_MULT_0"
        "SLAKE_MULT_1"
        "SLAKE_MULT_OMEGA"
        "slake_mult_tag_"
        "align 4"
        "size 4"
        "x86_64-unknown-linux-gnu"
      ];
    }
    {
      rel = "src/systems/emit/slake_mult_subset.h";
      all = [
        "enum slake_mult"
        "SLAKE_MULT_0 = 0"
        "SLAKE_MULT_1 = 1"
        "SLAKE_MULT_OMEGA = 2"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
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
        "abi-parity-smoke:"
        "HOST-ABI-PARITY-SMOKE"
        "SLAKE_ABI_PARITY_SMOKE_V0"
        "not extern Rust stable"
        "not link without classic FFI"
        "not full Rust ABI"
      ];
    }
  ];
}
