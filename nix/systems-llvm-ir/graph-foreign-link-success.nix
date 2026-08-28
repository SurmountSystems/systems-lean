# SPDX-License-Identifier: Unlicense
# Graph foreign link success: dual Graph add-edge layout/IR agreement.
# Host Lean GraphForeignLink dual-pins foreign consumer contract (i32 Graph
# add-edge codes 0/-1 ok/full-or-badEndpoints, size 4, align 4, EDGE_MAX=16,
# named target) against Graph SSOT + freestanding Graph subset cite + Graph unit
# IR add-edge constants + Graph SSA add-edge constants / add_edge_status honesty.
# Out-of-tree consumer recipe documented; no product Rust under src/. Last R2
# progressive after Mult/Linear/Types/Program. Mult Mult-only + Linear Mult-class
# + Types kind + Program push stay in their modules (otherBands false there).
# Not full LLVM production backend. Not free/complete/PROVABLY flip. Honest dual
# surface: addEdge status codes (not a three-tag kind enum).
# Greppable: HOST-GRAPH-FOREIGN-LINK, SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0,
# GRAPH-FOREIGN-LINK-SUCCESS, graph-foreign-link-success,
# GRAPH-FOREIGN-DUAL-AGREEMENT, FOREIGN-GRAPH-CONSUMER-CONTRACT.
{
  requiredFiles = [
    "doc/dev/research/graph-foreign-link-success-2026-08-10.md"
    "doc/dev/research/layout-size-align-fixture-2026-08-03.md"
    "doc/dev/research/rust-native-layout-design-2026-08-03.md"
    "src/systems/SystemsLean/GraphForeignLink.lean"
    "src/systems/SystemsLean/IrGraph.lean"
    "src/systems/emit/slake_graph_subset.h"
    "out/llvm-ir/slake_graph.ll"
    "out/llvm-ir/slake_graph_ssa.ll"
    "just/llvm.just"
  ];

  contentSpecs = [
    {
      rel = "src/systems/SystemsLean/GraphForeignLink.lean";
      all = [
        "HOST-GRAPH-FOREIGN-LINK"
        "SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0"
        "GRAPH-FOREIGN-LINK-SUCCESS"
        "GRAPH-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-GRAPH-CONSUMER-CONTRACT"
        "graphForeignLinkSuccessClaimed"
        "graphForeignLinkDualAgreementOk"
        "graphForeignLinkConsumerContractOk"
        "graph-foreign-link-success"
        "x86_64-unknown-linux-gnu"
        "foreignGraphTagSizeBytes"
        "foreignGraphTagAlignBytes"
        "foreignGraphAddEdgeOkCode"
        "foreignGraphAddEdgeFailCode"
        "foreignGraphEdgeMax"
        "out-of-tree"
        "IR_GRAPH_EDGES_V0"
        "EMPTY-GRAPH-OK"
        "SLAKE_IR_EDGE_MAX"
        "def graphForeignLinkSuccessClaimed : Bool := true"
        "def graphForeignLinkFullBackendClaimed : Bool := false"
        "def graphForeignLinkOtherBandsClaimed : Bool := false"
        "theorem graphForeignLinkFullBackendClaimed_false"
        "theorem graphForeignLinkOtherBandsClaimed_false"
        "llvmGraphSsaRustNativeLinkClaimed"
      ];
      forbidden = [
        "def graphForeignLinkFullBackendClaimed : Bool := true"
        "def graphForeignLinkOtherBandsClaimed : Bool := true"
      ];
    }
    {
      rel = "doc/dev/research/graph-foreign-link-success-2026-08-10.md";
      all = [
        "GRAPH-FOREIGN-LINK-SUCCESS"
        "GRAPH-FOREIGN-DUAL-AGREEMENT"
        "FOREIGN-GRAPH-CONSUMER-CONTRACT"
        "graph-foreign-link-success"
        "out-of-tree"
        "size 4"
        "align 4"
        "x86_64-unknown-linux-gnu"
        "repr(i32)"
        "GraphAddEdgeStatus"
        "Remaining bands"
        "not claimed"
        "full LLVM production backend"
        "Mult Mult-only"
        "Linear foreign"
        "Types foreign"
        "Program foreign"
        "add_edge"
        "EDGE_MAX"
      ];
    }
    {
      rel = "src/systems/emit/slake_graph_subset.h";
      all = [
        "SLAKE_IR_EDGE_MAX"
        "slake_ir_graph"
        "slake_ir_graph_add_edge"
        "slake_ir_graph_is_well_typed"
        "IR_GRAPH_EDGES_V0"
      ];
    }
    {
      rel = "out/llvm-ir/slake_graph.ll";
      all = [
        "@slake_graph_edge_max = private unnamed_addr constant i32 16, align 4"
        "@slake_graph_add_edge_ok = private unnamed_addr constant i32 0, align 4"
        "@slake_graph_add_edge_fail = private unnamed_addr constant i32 -1, align 4"
        "slake_graph_is_well_typed"
      ];
    }
    {
      rel = "out/llvm-ir/slake_graph_ssa.ll";
      all = [
        "@slake_graph_ssa_edge_max = private unnamed_addr constant i32 16, align 4"
        "@slake_graph_ssa_add_edge_ok = private unnamed_addr constant i32 0, align 4"
        "@slake_graph_ssa_add_edge_fail = private unnamed_addr constant i32 -1, align 4"
        "slake_graph_ssa_add_edge_status"
        "slake_graph_ssa_kernel_band_ready"
        "slake_graph_ssa_is_well_typed"
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
      rel = "src/systems/SystemsLean/IrGraph.lean";
      all = [
        "edgeMax"
        "AddEdgeResult"
        "badEndpoints"
        "isWellTyped"
        "IR_GRAPH_EDGES_V0"
        "EMPTY-GRAPH-OK"
      ];
    }
    {
      rel = "just/llvm.just";
      all = [
        "graph-foreign-link-success:"
        "HOST-GRAPH-FOREIGN-LINK"
        "SLAKE_GRAPH_FOREIGN_LINK_SUCCESS_V0"
        "GRAPH-FOREIGN-LINK-SUCCESS"
        "GRAPH-FOREIGN-DUAL-AGREEMENT"
        "not full backend"
      ];
    }
  ];
}
