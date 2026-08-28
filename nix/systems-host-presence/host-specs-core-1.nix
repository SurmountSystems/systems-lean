# SPDX-License-Identifier: Unlicense
# Host presence specs slice (hostSpecsCore). Joined by parent. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsCore1 = [
    {
      # Mult dialect: Mult / name / isValid / ofNat? / isValidTag. Theorems
      # split to MultTheorems (same namespace). Header keeps MULT-THEOREM name list.
      rel = "src/systems/SystemsLean/Mult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "MULT-THEOREM"
        "HOST-MULT-THEOREM"
        "ofNat?_fail_closed"
        "isValidTag_fail_closed"
        "ofNat?_zero"
        "ofNat?_one"
        "ofNat?_two"
        "isValid_true"
        "isValidTag_eq_ofNat?_isSome"
        "name_mult0"
        "name_mult1"
        "name_multOmega"
        "ofNat?_some_implies_isValidTag"
        "ofNat?_name_zero"
        "ofNat?_name_one"
        "ofNat?_name_two"
        "ofNat?_name_fail_closed"
        "MultTheorems"
        "SystemsLean.Mult"
      ];
      anyGroups = [
        [
          "isValid"
          "multIsValid"
        ]
      ];
    }
    {
      # MultTheorems: MULT-THEOREM + HOST-MULT-THEOREM long-file split
      # (same namespace SystemsLean.Mult).
      rel = "src/systems/SystemsLean/MultTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "MultTheorems"
        "SystemsLean.MultTheorems"
        "import SystemsLean.Mult"
        "MULT-THEOREM"
        "HOST-MULT-THEOREM"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "ofNat?_fail_closed"
        "isValidTag_fail_closed"
        "ofNat?_zero"
        "ofNat?_one"
        "ofNat?_two"
        "isValid_true"
        "isValidTag_eq_ofNat?_isSome"
        "name_mult0"
        "name_mult1"
        "name_multOmega"
        "ofNat?_some_implies_isValidTag"
        "ofNat?_name_zero"
        "ofNat?_name_one"
        "ofNat?_name_two"
        "ofNat?_name_fail_closed"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem ofNat?_fail_closed"
        "theorem isValidTag_fail_closed"
        "theorem name_mult0"
        "theorem ofNat?_some_implies_isValidTag"
        "theorem ofNat?_name_zero"
        "theorem ofNat?_name_one"
        "theorem ofNat?_name_two"
        "theorem ofNat?_name_fail_closed"
        "SystemsLean.Mult"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Linear dialect: Token / mkToken / consume / roundTrip / shareNat / polyId.
      # Theorems split to LinearTheorems (same namespace). Header keeps
      # LINEAR-THEOREM name list.
      rel = "src/systems/SystemsLean/Linear.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "JOIN-ALG"
        "ConsumeToken"
        "MULT-1"
        "LINEAR-EXACT-ONCE"
        "LINEAR-THEOREM"
        "HOST-LINEAR-THEOREM"
        "shareNat_eq"
        "shareNat_zero"
        "shareNat_succ"
        "polyId_id"
        "roundTrip_eq"
        "LinearTheorems"
        "SystemsLean.Linear"
      ];
    }
    {
      # LinearTheorems: LINEAR-THEOREM + HOST-LINEAR-THEOREM long-file split
      # (same namespace SystemsLean.Linear).
      rel = "src/systems/SystemsLean/LinearTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "LinearTheorems"
        "SystemsLean.LinearTheorems"
        "import SystemsLean.Linear"
        "JOIN-ALG"
        "ConsumeToken"
        "MULT-1"
        "LINEAR-EXACT-ONCE"
        "LINEAR-THEOREM"
        "HOST-LINEAR-THEOREM"
        "shareNat_eq"
        "shareNat_zero"
        "shareNat_succ"
        "polyId_id"
        "roundTrip_eq"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem shareNat_eq"
        "theorem shareNat_zero"
        "theorem shareNat_succ"
        "theorem polyId_id"
        "theorem roundTrip_eq"
        "SystemsLean.Linear"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Types dialect: TypeTag / NodeKind / IrNode / mkNode?. Theorems split to
      # TypesTheorems (same namespace). Header keeps TYPES-THEOREM name list.
      rel = "src/systems/SystemsLean/Types.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "COMMON-UNIVERSE"
        "HOST-RESIDUAL"
        "PRODUCT-WIRE-RESIDUAL"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "TYPES-THEOREM"
        "HOST-TYPES-THEOREM"
        "ofKindTag?_fail_closed"
        "isValidKindTag_fail_closed"
        "ofKindTag?_zero"
        "ofKindTag?_one"
        "ofKindTag?_two"
        "isValidKindTag_eq_ofKindTag?_isSome"
        "isValidKindTag_zero"
        "isValidKindTag_one"
        "isValidKindTag_two"
        "kindMultOk_value_omega"
        "kindMultOk_linear_one"
        "kindMultOk_erased_zero"
        "kindMultOk_value_not_one"
        "kindMultOk_value_not_zero"
        "kindMultOk_linear_not_omega"
        "kindMultOk_linear_not_zero"
        "kindMultOk_erased_not_omega"
        "kindMultOk_erased_not_one"
        "mkNode?_mismatch_none"
        "expectedMult_value"
        "expectedMult_linear"
        "expectedMult_erased"
        "isWellTyped_eq_kindMultOk"
        "mkNode?_ok"
        "mkNodeFromTags?_unknown_mult"
        "mkNodeFromTags?_unknown_kind"
        "mkNodeFromTags?_value_omega_some"
        "mkNodeFromTags?_linear_one_some"
        "mkNodeFromTags?_erased_zero_some"
        "TypesTheorems"
        "SystemsLean.Types"
      ];
      anyGroups = [
        [
          "kindMultOk"
          "isWellTyped"
        ]
      ];
    }
    {
      # TypesTheorems: TYPES-THEOREM + HOST-TYPES-THEOREM long-file split
      # (same namespace SystemsLean.Types).
      rel = "src/systems/SystemsLean/TypesTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "TypesTheorems"
        "SystemsLean.TypesTheorems"
        "import SystemsLean.Types"
        "TYPES-THEOREM"
        "HOST-TYPES-THEOREM"
        "ofKindTag?_fail_closed"
        "isValidKindTag_fail_closed"
        "ofKindTag?_zero"
        "ofKindTag?_one"
        "ofKindTag?_two"
        "isValidKindTag_eq_ofKindTag?_isSome"
        "kindMultOk_value_omega"
        "kindMultOk_linear_one"
        "kindMultOk_erased_zero"
        "kindMultOk_value_not_one"
        "mkNode?_mismatch_none"
        "expectedMult_value"
        "isWellTyped_eq_kindMultOk"
        "mkNode?_ok"
        "mkNodeFromTags?_unknown_mult"
        "mkNodeFromTags?_unknown_kind"
        "mkNodeFromTags?_value_omega_some"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem ofKindTag?_fail_closed"
        "theorem isValidKindTag_fail_closed"
        "theorem kindMultOk_value_not_one"
        "theorem mkNode?_mismatch_none"
        "theorem mkNode?_ok"
        "theorem expectedMult_value"
        "theorem isWellTyped_eq_kindMultOk"
        "theorem mkNodeFromTags?_unknown_mult"
        "SystemsLean.Types"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Ordered IR program core surface.
      # Long-file split: theorems live in IrProgramTheorems (same namespace).
      rel = "src/systems/SystemsLean/IrProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "IR-PROGRAM-THEOREM"
        "HOST-IR-PROGRAM-THEOREM"
        "isWellTyped_empty_false"
        "empty_not_well_typed"
        "empty_isEmpty"
        "empty_length_zero"
        "checkFailClosed_eq_isWellTyped"
        "foldWellTyped_empty_none"
        "foldWellTyped_ill_typed_none"
        "push_bad_node"
        "programCap_eq_eight"
        "push_value_one_ok"
        "length_single_value"
        "isWellTyped_single_value"
        "foldWellTyped_single_value_some"
        "isWellTyped_two_values"
        "length_two_values"
        "foldWellTyped_two_values_some"
        "push_second_value_ok"
        "push_full_at_cap"
        "isWellTyped_mixed_kinds"
        "length_mixed_kinds"
        "foldWellTyped_mixed_kinds_some"
        "isWellTyped_mixed_bad_false"
        "IrProgramTheorems"
        "SystemsLean.IrProgram"
      ];
      anyGroups = [
        [
          "push"
          "foldWellTyped"
          "isWellTyped"
        ]
      ];
    }
    {
      # IrProgramTheorems: IR-PROGRAM-THEOREM peel (same namespace).
      rel = "src/systems/SystemsLean/IrProgramTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "IrProgramTheorems"
        "SystemsLean.IrProgramTheorems"
        "import SystemsLean.IrProgram"
        "ORDERED-IR-PROGRAM"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "IR-PROGRAM-THEOREM"
        "HOST-IR-PROGRAM-THEOREM"
        "isWellTyped_empty_false"
        "empty_not_well_typed"
        "empty_isEmpty"
        "empty_length_zero"
        "checkFailClosed_eq_isWellTyped"
        "foldWellTyped_empty_none"
        "foldWellTyped_ill_typed_none"
        "push_bad_node"
        "programCap_eq_eight"
        "push_value_one_ok"
        "length_single_value"
        "isWellTyped_single_value"
        "foldWellTyped_single_value_some"
        "isWellTyped_two_values"
        "length_two_values"
        "foldWellTyped_two_values_some"
        "push_second_value_ok"
        "push_full_at_cap"
        "isWellTyped_mixed_kinds"
        "length_mixed_kinds"
        "foldWellTyped_mixed_kinds_some"
        "isWellTyped_mixed_bad_false"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem isWellTyped_empty_false"
        "theorem empty_not_well_typed"
        "theorem foldWellTyped_ill_typed_none"
        "theorem push_bad_node"
        "theorem push_value_one_ok"
        "theorem isWellTyped_single_value"
        "theorem foldWellTyped_single_value_some"
        "theorem isWellTyped_two_values"
        "theorem length_two_values"
        "theorem foldWellTyped_two_values_some"
        "theorem push_second_value_ok"
        "theorem push_full_at_cap"
        "theorem isWellTyped_mixed_kinds"
        "theorem length_mixed_kinds"
        "theorem foldWellTyped_mixed_kinds_some"
        "theorem isWellTyped_mixed_bad_false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Erasure dialect. Long-file split: ERASURE-THEOREM + HOST-ERASURE-THEOREM
      # live in ErasureTheorems (same namespace).
      rel = "src/systems/SystemsLean/Erasure.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "EDGE-PROP"
        "ERASE-PROP"
        "SystemsLean.Erasure"
        "ERASURE-THEOREM"
        "HOST-ERASURE-THEOREM"
        "ErasureTheorems"
        "isRuntimeAbsent_unmarked_false"
        "markForGrade?_mult1_none"
        "checkFailClosed_unmarked_false"
        "checkFailClosed_eq"
        "markForGrade?_some_implies_isErasureGrade"
        "markForGrade?_some_is_mark"
        "isRuntimeAbsent_eq_marked"
        "markForGrade?_mult0_isRuntimeAbsent"
        # Greppable theorem cite (live def in Theorems module).
        "theorem isRuntimeAbsent_unmarked_false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
      anyGroups = [
        [
          "isRuntimeAbsent"
          "mark"
        ]
      ];
    }
    {
      # ErasureTheorems: ERASURE-THEOREM + HOST-ERASURE-THEOREM (same namespace).
      rel = "src/systems/SystemsLean/ErasureTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ErasureTheorems"
        "SystemsLean.ErasureTheorems"
        "import SystemsLean.Erasure"
        "ERASURE-THEOREM"
        "HOST-ERASURE-THEOREM"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "isRuntimeAbsent_unmarked_false"
        "markForGrade?_mult1_none"
        "checkFailClosed_unmarked_false"
        "checkFailClosed_eq"
        "markForGrade?_some_implies_isErasureGrade"
        "markForGrade?_some_is_mark"
        "isRuntimeAbsent_eq_marked"
        "markForGrade?_mult0_isRuntimeAbsent"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem isRuntimeAbsent_unmarked_false"
        "theorem markForGrade?_mult1_none"
        "theorem checkFailClosed_unmarked_false"
        "theorem checkFailClosed_eq"
        "theorem markForGrade?_some_implies_isErasureGrade"
        "theorem markForGrade?_some_is_mark"
        "theorem isRuntimeAbsent_eq_marked"
        "theorem markForGrade?_mult0_isRuntimeAbsent"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Extract / emit boundary dialect. Long-file split: EXTRACT-THEOREM +
      # HOST-EXTRACT-THEOREM live in ExtractTheorems (same namespace).
      rel = "src/systems/SystemsLean/Extract.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "EDGE-RUNTIME"
        "RUNTIME-CLASSIC"
        "SystemsLean.Extract"
        "EXTRACT-THEOREM"
        "HOST-EXTRACT-THEOREM"
        "ExtractTheorems"
        "isFreestandingGoal_runtimeFs"
        "extractOk_classic_reject"
        "ofRuntimeTag?_fail_closed"
        "ofRuntimeTag?_some_implies_isValidRuntimeTag"
        "isValidRuntimeTag_zero"
        "extractOkFromTags?_mult1_fs_false"
        "extractOkFromTags?_mult0_marked_fs_true"
        # Greppable theorem cite (live def in Theorems module).
        "theorem isFreestandingGoal_runtimeFs"
        "FAIL-CLOSED"
        "FAIL_CLOSED_CHECKER_V1"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
      anyGroups = [
        [
          "extractOk"
          "checkFailClosed"
        ]
      ];
    }
    {
      # ExtractTheorems: EXTRACT-THEOREM + HOST-EXTRACT-THEOREM (same namespace).
      rel = "src/systems/SystemsLean/ExtractTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ExtractTheorems"
        "SystemsLean.ExtractTheorems"
        "import SystemsLean.Extract"
        "EXTRACT-THEOREM"
        "HOST-EXTRACT-THEOREM"
        "isFreestandingGoal_runtimeFs"
        "extractOk_classic_reject"
        "ofRuntimeTag?_fail_closed"
        "ofRuntimeTag?_some_implies_isValidRuntimeTag"
        "isValidRuntimeTag_zero"
        "isValidRuntimeTag_one"
        "isValidRuntimeTag_two"
        "extractOkFromTags?_mult1_fs_false"
        "extractOkFromTags?_omega_fs_true"
        "extractOkFromTags?_mult0_marked_fs_true"
        "extractOkFromTags?_mult0_unmarked_fs_false"
        "extractOkFromTags?_classic_reject"
        "extractOkFromTags?_edge_reject"
        "extractOkFromTags?_both_unknown_none"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem isFreestandingGoal_runtimeFs"
        "theorem extractOk_classic_reject"
        "theorem ofRuntimeTag?_fail_closed"
        "theorem ofRuntimeTag?_some_implies_isValidRuntimeTag"
        "theorem isValidRuntimeTag_zero"
        "theorem isValidRuntimeTag_one"
        "theorem isValidRuntimeTag_two"
        "theorem extractOkFromTags?_mult1_fs_false"
        "theorem extractOkFromTags?_omega_fs_true"
        "theorem extractOkFromTags?_mult0_marked_fs_true"
        "theorem extractOkFromTags?_mult0_unmarked_fs_false"
        "theorem extractOkFromTags?_classic_reject"
        "theorem extractOkFromTags?_edge_reject"
        "theorem extractOkFromTags?_both_unknown_none"
        "UNIT_SURFACE"
        "RUNTIME-FS"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      rel = "src/systems/SystemsLean/IrGraph.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "IR_GRAPH_EDGES_V0"
        "IR-GRAPH-EDGES"
        "EMPTY-GRAPH-OK"
        "SLAKE_IR_EDGE_MAX"
        "edgesSound"
        "IR-GRAPH-THEOREM"
        "HOST-IR-GRAPH-THEOREM"
        "IrGraphTheorems"
        "SystemsLean.IrGraph"
        "FAIL-CLOSED"
      ];
      anyGroups = [
        [
          "addEdge"
          "pushNode"
          "isWellTyped"
        ]
      ];
    }
    {
      # IrGraphTheorems: IR-GRAPH-THEOREM + IR-GRAPH-SMOKE peel (same namespace).
      rel = "src/systems/SystemsLean/IrGraphTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "IrGraphTheorems"
        "SystemsLean.IrGraphTheorems"
        "import SystemsLean.IrGraph"
        "IR-GRAPH-THEOREM"
        "HOST-IR-GRAPH-THEOREM"
        "IR-GRAPH-SMOKE"
        "example"
        "EMPTY-GRAPH-OK"
        "isWellTyped_empty_true"
        "empty_well_typed"
        "checkFailClosed_eq_isWellTyped"
        "empty_isEmpty"
        "edgeMax_eq_sixteen"
        "addEdge_empty_badEndpoints"
        "edgesSound_empty"
        "isWellTyped_one_node_empty_edges"
        "pushNode_value_one_ok"
        "addEdge_one_node_self_ok"
        "addEdge_one_node_badEndpoints"
        "edgesSound_one_edge"
        "isWellTyped_two_nodes_one_edge"
        "addEdge_two_nodes_ok"
        "edgesSound_two_edges"
        "isWellTyped_two_nodes_two_edges"
        "addEdge_two_nodes_second_ok"
        "addEdge_two_nodes_badEndpoints"
        "edgesSound_oversize_false"
        "edgesSound_at_edgeMax"
        "isWellTyped_at_edgeMax"
        "addEdge_full_at_edgeMax"
        "isWellTyped_oversize_false"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem isWellTyped_empty_true"
        "theorem empty_well_typed"
        "theorem addEdge_empty_badEndpoints"
        "theorem edgesSound_empty"
        "theorem isWellTyped_one_node_empty_edges"
        "theorem pushNode_value_one_ok"
        "theorem addEdge_one_node_self_ok"
        "theorem addEdge_one_node_badEndpoints"
        "theorem edgesSound_one_edge"
        "theorem isWellTyped_two_nodes_one_edge"
        "theorem addEdge_two_nodes_ok"
        "theorem edgesSound_two_edges"
        "theorem isWellTyped_two_nodes_two_edges"
        "theorem addEdge_two_nodes_second_ok"
        "theorem addEdge_two_nodes_badEndpoints"
        "theorem edgesSound_oversize_false"
        "theorem edgesSound_at_edgeMax"
        "theorem isWellTyped_at_edgeMax"
        "theorem addEdge_full_at_edgeMax"
        "theorem isWellTyped_oversize_false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      rel = "src/systems/SystemsLean/HostCompose.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "HOST_COMPOSE_V0"
        "HOST-COMPOSE"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "SystemsLean.HostCompose"
        "HostComposeTheorems"
        "COMPOSE-THEOREM"
        "HOST-COMPOSE-THEOREM"
        "FAIL-CLOSED"
        "JOIN-ALG"
        "ConsumeToken"
      ];
      anyGroups = [
        [
          "extractOk"
          "checkFailClosed"
        ]
        [
          "mint"
          "consume"
          "markErased"
        ]
        [
          "pushHostNode"
          "addHostEdge"
          "hostIsWellTyped"
        ]
        [
          "multPreScan"
          "nodeMultOk"
        ]
      ];
    }
    {
      # HostComposeTheorems: COMPOSE-THEOREM + HOST-SMOKE peel (same namespace).
      rel = "src/systems/SystemsLean/HostComposeTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "HostComposeTheorems"
        "SystemsLean.HostComposeTheorems"
        "import SystemsLean.HostCompose"
        "COMPOSE-THEOREM"
        "HOST-COMPOSE-THEOREM"
        "HOST-SMOKE"
        "example"
        "multPreScan_empty_true"
        "mint_zero_badId"
        "consume_empty_notLive"
        "nodeMultOk_mult1_eq_live"
        "double_consume_notLive"
        "checkFailClosed_eq"
        "multPreScan_mult1_unminted_false"
        "extractOkFs_mult1_unminted_false"
        "multPreScan_mult1_minted_true"
        "extractOkFs_mult1_minted_true"
        "consume_mult1_minted"
        "multPreScan_mult1_spent_false"
        "extractOkFs_mult1_spent_false"
        "checkFailClosed_mult1_spent_false"
        "mult1_spent_scrub"
        "consume_mult1_spent_reject"
        "multPreScan_mult0_unmarked_false"
        "multPreScan_mult0_marked_true"
        "multPreScan_joint_minted_marked_true"
        "extractOkFs_joint_minted_marked_true"
        "checkFailClosed_joint_minted_marked_true"
        "multPreScan_joint_unminted_marked_false"
        "extractOkFs_joint_unminted_marked_false"
        "checkFailClosed_joint_unminted_marked_false"
        "multPreScan_joint_minted_unmarked_false"
        "extractOkFs_joint_minted_unmarked_false"
        "checkFailClosed_joint_minted_unmarked_false"
        "joint_mult1_mult0_extract_ok"
        "joint_mult1_mult0_either_side_fail_closed"
        "markErased_idempotent"
        "multPreScan_omega_only_true"
        "extractOkFs_omega_only_true"
        "consume_live_payload"
        "mint_nonzero_ok"
        "mint_consume_roundtrip"
        "pushHostNode_bad_node"
        "pushHostNode_value_one_ok"
        "addHostEdge_empty_badEndpoints"
        "addHostEdge_two_values_ok"
        "addHostEdge_one_node_badEndpoints"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem multPreScan_empty_true"
        "theorem mint_zero_badId"
        "theorem consume_empty_notLive"
        "theorem nodeMultOk_mult1_eq_live"
        "theorem double_consume_notLive"
        "theorem checkFailClosed_eq"
        "theorem multPreScan_mult1_unminted_false"
        "theorem extractOkFs_mult1_unminted_false"
        "theorem multPreScan_mult1_minted_true"
        "theorem consume_mult1_minted"
        "theorem multPreScan_mult1_spent_false"
        "theorem extractOkFs_mult1_spent_false"
        "theorem checkFailClosed_mult1_spent_false"
        "theorem mult1_spent_scrub"
        "theorem consume_mult1_spent_reject"
        "theorem multPreScan_joint_minted_marked_true"
        "theorem extractOkFs_joint_minted_marked_true"
        "theorem checkFailClosed_joint_minted_marked_true"
        "theorem multPreScan_joint_unminted_marked_false"
        "theorem extractOkFs_joint_unminted_marked_false"
        "theorem checkFailClosed_joint_unminted_marked_false"
        "theorem multPreScan_joint_minted_unmarked_false"
        "theorem extractOkFs_joint_minted_unmarked_false"
        "theorem checkFailClosed_joint_minted_unmarked_false"
        "theorem joint_mult1_mult0_extract_ok"
        "theorem joint_mult1_mult0_either_side_fail_closed"
        "theorem markErased_idempotent"
        "theorem multPreScan_omega_only_true"
        "theorem mint_consume_roundtrip"
        "theorem pushHostNode_bad_node"
        "theorem pushHostNode_value_one_ok"
        "theorem addHostEdge_empty_badEndpoints"
        "theorem addHostEdge_two_values_ok"
        "theorem addHostEdge_one_node_badEndpoints"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # HOST-COST Nat step accounting (Track L L1-L9; not wall-clock / not PROVABLY speed).
      rel = "src/systems/SystemsLean/HostCost.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "HOST-COST"
        "HOST-COST-STEP"
        "HOST-COST-THEOREM"
        "HOST-COST-CAP"
        "HOST-COST-FUSE"
        "HOST-COST-AUTOMATON"
        "HOST-COST-OPT-PRESERVE"
        "HOST-COST-NO-HEAP"
        "HOST-COST-DIFF-FUSE"
        "HOST-COST-MULT-TABLE"
        "HOST-COST-STEP-TWIN"
        "SystemsLean.HostCost"
        "HostCostTheorems"
        "costMintStep"
        "costConsumeStep"
        "costMintConsumeSequential"
        "costMintConsumeExactOnceAutomaton"
        "costMultPreScan"
        "costCheckFailClosed"
        "costExtractOkFs"
        "costMintConsumeSequential_eq"
        "costExtractOkFs_eq"
        "costExtractOkFs_ge_check"
        "costExtractOkFs_eq_check_plus_one"
        "costMultPreScanAtCap_eq"
        "costMultPreScan_le_atCap"
        "costCheckFailClosed_le_atCap"
        "costEdgeWalk_le_atCap"
        "hostCost_exact_once_sequential_ref"
        "hostCost_double_consume_notLive_ref"
        "costFused_le_naive"
        "hostCost_fuse_preserves_fail_closed"
        "hostCost_opt_preserves_spent_mult1_reject"
        "hostCost_linearHost_fields_bool_nat"
        "cost_diff_fuse_vs_double"
        "costFuseNatSavings_eq"
        "costNodeMultByGrade_eq_one"
        "costStepTwinMintConsume_eq"
        "hostCostSurfaceOk"
        "hostCostSurfaceOk_true"
        "costMultPreScan_eq_live_nodes"
        "hostCost_spent_mult1_rejects_check"
        "hostCost_spent_mult1_rejects_extractFs"
        "hostCost_omega_share_vs_mult1_exact_once"
        "hostCost_thin_extract_mult1_agrees_compose"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
      anyGroups = [
        [
          "costMintStep"
          "costConsumeStep"
        ]
        [
          "costCheckFailClosed"
          "costExtractOkFs"
        ]
        [
          "HOST-COST-CAP"
          "HOST-COST-FUSE"
          "HOST-COST-AUTOMATON"
        ]
        [
          "HOST-COST-OPT-PRESERVE"
          "HOST-COST-NO-HEAP"
          "HOST-COST-DIFF-FUSE"
        ]
        [
          "HOST-COST-MULT-TABLE"
          "HOST-COST-STEP-TWIN"
        ]
      ];
    }
    {
      # HostCostTheorems: HOST-COST-THEOREM L1-L9 split (same namespace).
      rel = "src/systems/SystemsLean/HostCostTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "HostCostTheorems"
        "SystemsLean.HostCostTheorems"
        "import SystemsLean.HostCost"
        "HOST-COST-THEOREM"
        "theorem costMintConsumeSequential_eq"
        "theorem costExtractOkFs_eq"
        "theorem costExtractOkFs_ge_check"
        "theorem costExtractOkFs_eq_check_plus_one"
        "theorem costMultPreScanAtCap_eq"
        "theorem costMultPreScan_le_atCap"
        "theorem costCheckFailClosed_le_atCap"
        "theorem costEdgeWalk_le_atCap"
        "theorem hostCost_exact_once_sequential_ref"
        "theorem hostCost_double_consume_notLive_ref"
        "theorem costFused_le_naive"
        "theorem hostCost_fuse_preserves_fail_closed"
        "theorem hostCost_opt_preserves_spent_mult1_reject"
        "theorem hostCost_linearHost_fields_bool_nat"
        "theorem cost_diff_fuse_vs_double"
        "theorem costFuseNatSavings_eq"
        "theorem costNodeMultByGrade_eq_one"
        "theorem costStepTwinMintConsume_eq"
        "theorem hostCostSurfaceOk_true"
        "theorem costMultPreScan_eq_live_nodes"
        "theorem hostCost_spent_mult1_rejects_check"
        "theorem hostCost_spent_mult1_rejects_extractFs"
        "theorem hostCost_omega_share_vs_mult1_exact_once"
        "theorem hostCost_thin_extract_mult1_agrees_compose"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      rel = "src/systems/SystemsLean/EmitPlan.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EMIT_PLAN_V0"
        "EMIT-PLAN"
        "planFromCompose"
        "isReady"
        "checkFailClosed"
        "SystemsLean.EmitPlan"
        "EmitPlanScaffold"
        "import SystemsLean.EmitPlanScaffold"
        "EMIT-PLAN-SMOKE"
        "example"
        "EMIT-PLAN-THEOREM"
        "HOST-EMIT-PLAN-THEOREM"
        "planOk_empty_true"
        "planFromCompose_empty_counts_zero"
        "isReady_empty_plan"
        "planOk_mult1_unminted_false"
        "planOk_mult1_minted_true"
        "planOk_mult1_spent_false"
        "planFromCompose_mult1_spent_failClosed"
        "planOk_mult1_spent_reject"
        "planFromCompose_two_values_edge"
        "planFromCompose_linear_and_erased"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem planOk_empty_true"
        "theorem planFromCompose_empty_counts_zero"
        "theorem isReady_empty_plan"
        "theorem planOk_mult1_unminted_false"
        "theorem planOk_mult1_minted_true"
        "theorem planOk_mult1_spent_false"
        "theorem planFromCompose_mult1_spent_failClosed"
        "theorem planOk_mult1_spent_reject"
        "theorem planFromCompose_two_values_edge"
        "theorem planFromCompose_linear_and_erased"
        # Host-owned freestanding emit plan scaffolding (HOST-EMIT-PLAN).
        "SLAKE_SELF_HOST_EMIT_PLAN_V0"
        "HOST-EMIT-PLAN"
        "SELF-HOST-EMIT-PLAN"
        "planHeaderFragment"
        "planBodyFragment"
        "emitPlanReady"
        "EMIT-PLAN-PRODUCT-SMOKE"
        "HOST-EMIT-PLAN-SMOKE"
        "planSsotArtifactPath"
        "src/systems/emit/host_emit_plan.ssot.txt"
        "NON-SSOT"
        "theorem emitPlanReady_true"
      ];
      anyGroups = [
        [
          "emitPlanOk"
          "planHeaderHonestyOk"
        ]
      ];
    }
    {
      # EmitPlanScaffold: HOST-EMIT-PLAN product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitPlanScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitPlanScaffold"
        "SystemsLean.EmitPlanScaffold"
        "SLAKE_SELF_HOST_EMIT_PLAN_V0"
        "HOST-EMIT-PLAN"
        "SELF-HOST-EMIT-PLAN"
        "def planHeaderFragment : String :="
        "def planBodyFragment : String :="
        "def emitPlanReady : Bool :="
        "def emitPlanOk : Bool :="
        "def planHeaderHonestyOk : Bool :="
        "def planBodyHonestyOk : Bool :="
        "def emitPlanSurfaceOk : Bool :="
        "EMIT-PLAN-PRODUCT-SMOKE"
        "HOST-EMIT-PLAN-SMOKE"
        "planSsotArtifactPath"
        "src/systems/emit/host_emit_plan.ssot.txt"
        "NON-SSOT"
        "theorem emitPlanReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      rel = "src/systems/SystemsLean/EmitApply.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EMIT_APPLY_V0"
        "EMIT-APPLY"
        "applyFromCompose"
        "applyIsValid"
        "checkFailClosed"
        "SystemsLean.EmitApply"
        "EmitApplyScaffold"
        "import SystemsLean.EmitApplyScaffold"
        "applyCap"
        "packTag"
        "EMIT-APPLY-SMOKE"
        "example"
        "EMIT-APPLY-THEOREM"
        "HOST-EMIT-APPLY-THEOREM"
        "applyCap_eq_32"
        "applyOk_empty_true"
        "applyOk_linear_without_mint_false"
        "packTag_linear"
        "applyFromCompose_mult1_minted_tags"
        "applyFromCompose_linear_and_erased_order"
        "applyIsValid_count_tags_desync_false"
        "applyIsValid_oversize_count_false"
        "applyFromCompose_sound_inventory"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem applyCap_eq_32"
        "theorem applyOk_empty_true"
        "theorem applyOk_linear_without_mint_false"
        "theorem packTag_linear"
        "theorem applyFromCompose_mult1_minted_tags"
        "theorem applyFromCompose_linear_and_erased_order"
        "theorem applyIsValid_count_tags_desync_false"
        "theorem applyIsValid_oversize_count_false"
        "theorem applyFromCompose_sound_inventory"
        # Host-owned freestanding emit apply scaffolding (HOST-EMIT-APPLY).
        "SLAKE_SELF_HOST_EMIT_APPLY_V0"
        "HOST-EMIT-APPLY"
        "SELF-HOST-EMIT-APPLY"
        "applyHeaderFragment"
        "applyBodyFragment"
        "emitApplyReady"
        "EMIT-APPLY-PRODUCT-SMOKE"
        "HOST-EMIT-APPLY-SMOKE"
        "applySsotArtifactPath"
        "src/systems/emit/host_emit_apply.ssot.txt"
        "NON-SSOT"
        "theorem emitApplyReady_true"
      ];
      anyGroups = [
        [
          "APPLY_CAP"
          "SLAKE_EMIT_APPLY_CAP"
        ]
        [
          "emitApplyOk"
          "applyHeaderHonestyOk"
        ]
      ];
    }
    {
      # EmitApplyScaffold: HOST-EMIT-APPLY product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitApplyScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitApplyScaffold"
        "SystemsLean.EmitApplyScaffold"
        "SLAKE_SELF_HOST_EMIT_APPLY_V0"
        "HOST-EMIT-APPLY"
        "SELF-HOST-EMIT-APPLY"
        "def applyHeaderFragment : String :="
        "def applyBodyFragment : String :="
        "def emitApplyReady : Bool :="
        "def emitApplyOk : Bool :="
        "def applyHeaderHonestyOk : Bool :="
        "def applyBodyHonestyOk : Bool :="
        "def emitApplySurfaceOk : Bool :="
        "EMIT-APPLY-PRODUCT-SMOKE"
        "HOST-EMIT-APPLY-SMOKE"
        "applySsotArtifactPath"
        "src/systems/emit/host_emit_apply.ssot.txt"
        "NON-SSOT"
        "theorem emitApplyReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
  ];
}
