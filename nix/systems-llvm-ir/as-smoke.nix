# SPDX-License-Identifier: Unlicense
# Optional llvm-as smoke (Track 2e): honesty-only pure Nix presence for the
# just recipe. Does not require the llvm-as binary. Does not shell out.
# Execution is thin just process glue (skip-if-missing / RED when present).
# Greppable: HOST-LLVM-AS-SMOKE, SLAKE_LLVM_AS_SMOKE_V0, llvm-as-smoke.
{
  requiredFiles = [
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "just/llvm.just";
      all = [
        "llvm-as-smoke:"
        "HOST-LLVM-AS-SMOKE"
        "SLAKE_LLVM_AS_SMOKE_V0"
        "command -v llvm-as"
        "skip llvm-as-smoke"
        "skip-if-missing"
        "not production backend"
        "slake_compose.ll"
        "slake_mult.ll"
        "slake_linear.ll"
        "slake_types.ll"
        "slake_program.ll"
        "slake_graph.ll"
        "slake_compose_ssa.ll"
        "slake_mult_ssa.ll"
        "slake_linear_ssa.ll"
        "slake_types_ssa.ll"
        "slake_program_ssa.ll"
        "slake_graph_ssa.ll"
      ];
    }
  ];
}
