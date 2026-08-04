# SPDX-License-Identifier: Unlicense
# Mult..Graph unit IR join: require generator-owned artifacts under out/llvm-ir
# and one stable HOST token per file (defense in depth after writers run).
# Greppable: HOST-LLVM-UNIT-PACKAGE join surface via Mult..Graph HOST tokens.
{
  # Always required for unit-package join (tracked release surface).
  requiredFiles = [
    "out/llvm-ir/slake_mult.ll"
    "out/llvm-ir/slake_linear.ll"
    "out/llvm-ir/slake_types.ll"
    "out/llvm-ir/slake_program.ll"
    "out/llvm-ir/slake_graph.ll"
  ];

  contentSpecs = [
    {
      rel = "out/llvm-ir/slake_mult.ll";
      all = [
        "SLAKE_LLVM_MULT_TEXT_V0"
        "HOST-LLVM-MULT-TEXT"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_mult_is_valid_tag"
        "slake_mult_tag_0"
        "SystemsLean/Mult.lean"
        "llvmUnlocked"
      ];
    }
    {
      rel = "out/llvm-ir/slake_linear.ll";
      all = [
        "SLAKE_LLVM_LINEAR_TEXT_V0"
        "HOST-LLVM-LINEAR-TEXT"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "LINEAR-EXACT-ONCE"
        "LINEAR-AXIOMS-REMAIN"
        "shareNat"
        "polyId"
        "slake_linear_is_valid_class_tag"
        "slake_linear_share_nat"
        "slake_linear_poly_id"
        "SystemsLean/Linear.lean"
        "llvmUnlocked"
      ];
    }
    {
      rel = "out/llvm-ir/slake_types.ll";
      all = [
        "SLAKE_LLVM_TYPES_TEXT_V0"
        "HOST-LLVM-TYPES-TEXT"
        "TYPED_IR_V0"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "VALUE"
        "LINEAR"
        "ERASED"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "kindMultOk"
        "isValidKindTag"
        "slake_types_is_valid_kind_tag"
        "slake_types_expected_mult_tag"
        "slake_types_kind_mult_ok"
        "SystemsLean/Types.lean"
        "llvmUnlocked"
      ];
    }
    {
      rel = "out/llvm-ir/slake_program.ll";
      all = [
        "SLAKE_LLVM_PROGRAM_TEXT_V0"
        "HOST-LLVM-PROGRAM-TEXT"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "SLAKE_IR_PROGRAM_CAP"
        "programCap"
        "push"
        "isWellTyped"
        "checkFailClosed"
        "slake_program_cap"
        "slake_program_is_well_typed_empty"
        "slake_program_is_well_typed"
        "slake_program_check_fail_closed"
        "slake_program_push_capacity"
        "SystemsLean/IrProgram.lean"
        "llvmUnlocked"
      ];
    }
    {
      rel = "out/llvm-ir/slake_graph.ll";
      all = [
        "SLAKE_LLVM_GRAPH_TEXT_V0"
        "HOST-LLVM-GRAPH-TEXT"
        "IR-GRAPH-EDGES"
        "EMPTY-GRAPH-OK"
        "SLAKE_IR_EDGE_MAX"
        "edgeMax"
        "addEdge"
        "pushNode"
        "isWellTyped"
        "checkFailClosed"
        "slake_graph_edge_max"
        "slake_graph_is_well_typed_empty"
        "slake_graph_is_well_typed"
        "slake_graph_check_fail_closed"
        "slake_graph_add_edge_capacity"
        "slake_graph_edges_sound"
        "SystemsLean/IrGraph.lean"
        "llvmUnlocked"
      ];
    }
  ];
}
