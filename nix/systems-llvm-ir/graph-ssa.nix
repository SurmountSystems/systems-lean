# SPDX-License-Identifier: Unlicense
# LLVM Graph SSA lower partial: Lean module + Main + just recipe +
# generator-owned out/llvm-ir/slake_graph_ssa.ll. Local unlock pin false;
# living hold unlock true (hold.nix). Full backend claim stays false.
# Graph-band SSA-shaped IR only (block labels + phi + ordered edge defs).
# Greppable: HOST-LLVM-GRAPH-SSA, SLAKE_LLVM_GRAPH_SSA_V0, SSA-SHAPED.
{
  requiredFiles = [
    "src/systems/SystemsLean/LlvmGraphSsa.lean"
    "src/systems/SystemsLean/LlvmGraphSsaMain.lean"
    "out/llvm-ir/slake_graph_ssa.ll"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/LlvmGraphSsa.lean";
      all = [
        "llvmGraphSsaReady"
        "llvmGraphSsaFinishedClaimed"
        "llvmGraphSsaPackageOk"
        "llvmGraphSsaWroteExpected"
        "llvmGraphSsaKeepsLlvmLocked"
        "llvmGraphSsaDoesNotUnlockLlvm"
        "llvmGraphSsaLlvmUnlocked"
        "llvmGraphSsaLocalUnlockFalse"
        "llvmGraphSsaPartialClaimed"
        "llvmGraphSsaFullBackendClaimed"
        "justRecipeLlvmGraphSsa"
        "llvm-graph-ssa"
        "HOST-LLVM-GRAPH-SSA"
        "SLAKE_LLVM_GRAPH_SSA_V0"
        "HOST-HOST-LLVM-GRAPH-SSA"
        "slake_graph_ssa.ll"
        "graphSsaPackage"
        "llvmGraphSsaWrite"
        "IO.FS.writeFile"
        "SSA-SHAPED"
        "SELF-HOST-KERNEL-PROGRAM"
        "ORDERED-IR-PROGRAM"
        "EMPTY-GRAPH-OK"
        "IR-GRAPH-EDGES"
        "SLAKE_IR_EDGE_MAX"
        "KernelProgram"
        "out/llvm-ir"
        "LlvmHold"
        "llvmUnlocked"
        "LlvmEmitPath"
        "LlvmGraphText"
        "LlvmProgramSsa"
        "LlvmTypesSsa"
        "LlvmLinearSsa"
        "LlvmMultSsa"
        "def llvmGraphSsaFinishedClaimed : Bool := true"
        "def llvmGraphSsaLlvmUnlocked : Bool := false"
        "def llvmGraphSsaPartialClaimed : Bool := true"
        "def llvmGraphSsaFullBackendClaimed : Bool := false"
      ];
      forbidden = [
        "def llvmGraphSsaLlvmUnlocked : Bool := true"
        "def llvmGraphSsaFullBackendClaimed : Bool := true"
        "def llvmGraphSsaCfgProductionClaimed : Bool := true"
      ];
    }
    {
      rel = "out/llvm-ir/slake_graph_ssa.ll";
      all = [
        "SLAKE_LLVM_GRAPH_SSA_V0"
        "HOST-LLVM-GRAPH-SSA"
        "EMPTY-GRAPH-OK"
        "SLAKE_IR_EDGE_MAX"
        "IR-GRAPH-EDGES"
        "VALUE"
        "LINEAR"
        "ERASED"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "SELF-HOST-KERNEL-PROGRAM"
        "ORDERED-IR-PROGRAM"
        "SSA-SHAPED"
        "phi i32"
        "slake_graph_ssa_add_edge_status"
        "slake_graph_ssa_kernel_band_ready"
        "slake_graph_ssa_is_well_typed"
        "slake_graph_ssa_edge_max"
        "bb_ok"
        "bb_fail"
        "bb_reject"
        "SystemsLean/KernelProgram.lean"
        "SystemsLean/IrGraph.lean"
        "llvmUnlocked"
        "Not production LLVM backend"
        "Not full CFG/dominance"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "llvm-graph-ssa:"
        "HOST-LLVM-GRAPH-SSA"
        "SLAKE_LLVM_GRAPH_SSA_V0"
      ];
    }
  ];
}
