# SPDX-License-Identifier: Unlicense
# Kernel / emit-fixture / parity host token specs (self-host ladder cold).
# KernelMult .. ParityEmit structural wall. Cold slice (not dual-pin tip).
# Imported by ./specs.nix thin join. No bash.
{
hostSpecsKernelParity = [
    {
      # Mult self-host kernel IR fixture (SH1 start).
      # Long-file split: theorems + smoke live in KernelMultTheorems (same namespace).
      rel = "src/systems/SystemsLean/KernelMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_KERNEL_MULT_V0"
        "SELF-HOST-KERNEL-MULT"
        "SELF-HOST"
        "lowerMultKernel"
        "multKernelProgram"
        "multKernelReady"
        "kernelOk"
        "SystemsLean.KernelMult"
        "KernelMultTheorems"
        "KERNEL-MULT-SMOKE"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "ORDERED-IR-PROGRAM"
        "HOST-COMPILE-PATH"
        "src/systems/self-host.md"
        "src/systems/SystemsLean/KernelMult.lean"
        "KERNEL-MULT-THEOREM"
        "HOST-KERNEL-MULT-THEOREM"
        "multKernelReady_true"
        "kernelOk_true"
        "programCompileReady_empty_false"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "unknownTagRejected"
          "kernelSurfaceOk"
        ]
      ];
    }
    {
      # KernelMultTheorems: KERNEL-MULT-THEOREM + KERNEL-MULT-SMOKE
      # (same namespace KernelMult; long-file split).
      rel = "src/systems/SystemsLean/KernelMultTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "KernelMultTheorems"
        "SystemsLean.KernelMultTheorems"
        "import SystemsLean.KernelMult"
        "KERNEL-MULT-THEOREM"
        "HOST-KERNEL-MULT-THEOREM"
        "KERNEL-MULT-SMOKE"
        "example"
        "multKernelReady_true"
        "kernelOk_true"
        "unknownTagRejected_true"
        "lowerMultKernel_isSome"
        "programCompileReady_empty_false"
        "lowerMultKernel_length_three"
        "lowerMultKernel_isWellTyped"
        "multKernelProgram_length_three"
        "multKernelProgram_isWellTyped"
        "stageId_eq"
        "kernelMultId_eq"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem multKernelReady_true"
        "theorem kernelOk_true"
        "theorem programCompileReady_empty_false"
        "example : multKernelReady = true"
        "example : kernelOk = true"
        "example : unknownTagRejected = true"
      ];
      anyGroups = [ ];
    }
    {
      # Host-owned Mult freestanding product emit (SH2).
      # Scaffolding body lives on EmitMultScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_MULT_V0"
        "HOST-EMIT-MULT"
        "SELF-HOST-EMIT-MULT"
        "multHeaderFragment"
        "multBodyFragment"
        "emitMultReady"
        "SystemsLean.EmitMult"
        "EmitMultScaffold"
        "import SystemsLean.EmitMultScaffold"
        "EMIT-MULT-SMOKE"
        "HOST-EMIT-MULT-SMOKE"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_mult_is_valid"
        "NON-SSOT"
        "src/systems/emit/host_emit_mult.ssot.txt"
        "src/systems/SystemsLean/EmitMult.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "emitMultOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitMultScaffold: HOST-EMIT-MULT product scaffolding split (same namespace).
      rel = "src/systems/SystemsLean/EmitMultScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitMultScaffold"
        "SystemsLean.EmitMultScaffold"
        "SLAKE_SELF_HOST_EMIT_MULT_V0"
        "HOST-EMIT-MULT"
        "SELF-HOST-EMIT-MULT"
        "def multHeaderFragment : String :="
        "def multBodyFragment : String :="
        "def emitMultReady : Bool :="
        "def emitMultOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitMultSurfaceOk : Bool :="
        "EMIT-MULT-SMOKE"
        "HOST-EMIT-MULT-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_mult.ssot.txt"
        "NON-SSOT"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned Linear freestanding product emit (HOST-EMIT-LINEAR).
      # Scaffolding body lives on EmitLinearScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitLinear.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_LINEAR_V0"
        "HOST-EMIT-LINEAR"
        "SELF-HOST-EMIT-LINEAR"
        "linearHeaderFragment"
        "linearBodyFragment"
        "emitLinearReady"
        "SystemsLean.EmitLinear"
        "EmitLinearScaffold"
        "import SystemsLean.EmitLinearScaffold"
        "EMIT-LINEAR-SMOKE"
        "HOST-EMIT-LINEAR-SMOKE"
        "LINEAR-EXACT-ONCE"
        "CONSUME_TOKEN_HOST_V0"
        "JOIN-ALG"
        "slake_linear_consume"
        "slake_consume_token_consume"
        "NON-SSOT"
        "src/systems/emit/host_emit_linear.ssot.txt"
        "src/systems/SystemsLean/EmitLinear.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "emitLinearOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitLinearScaffold: HOST-EMIT-LINEAR product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitLinearScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitLinearScaffold"
        "SystemsLean.EmitLinearScaffold"
        "SLAKE_SELF_HOST_EMIT_LINEAR_V0"
        "HOST-EMIT-LINEAR"
        "SELF-HOST-EMIT-LINEAR"
        "def linearHeaderFragment : String :="
        "def linearBodyFragment : String :="
        "def emitLinearReady : Bool :="
        "def emitLinearOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitLinearSurfaceOk : Bool :="
        "EMIT-LINEAR-SMOKE"
        "HOST-EMIT-LINEAR-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_linear.ssot.txt"
        "NON-SSOT"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned Erasure freestanding product emit (HOST-EMIT-ERASURE).
      # Scaffolding body lives on EmitErasureScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitErasure.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_ERASURE_V0"
        "HOST-EMIT-ERASURE"
        "SELF-HOST-EMIT-ERASURE"
        "erasureHeaderFragment"
        "erasureBodyFragment"
        "emitErasureReady"
        "SystemsLean.EmitErasure"
        "EmitErasureScaffold"
        "import SystemsLean.EmitErasureScaffold"
        "EMIT-ERASURE-SMOKE"
        "HOST-EMIT-ERASURE-SMOKE"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "slake_erased"
        "slake_erased_mark"
        "slake_erasure_is_runtime_absent"
        "NON-SSOT"
        "src/systems/emit/host_emit_erasure.ssot.txt"
        "src/systems/SystemsLean/EmitErasure.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "emitErasureOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitErasureScaffold: HOST-EMIT-ERASURE product scaffolding split (same namespace).
      rel = "src/systems/SystemsLean/EmitErasureScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitErasureScaffold"
        "SystemsLean.EmitErasureScaffold"
        "SLAKE_SELF_HOST_EMIT_ERASURE_V0"
        "HOST-EMIT-ERASURE"
        "SELF-HOST-EMIT-ERASURE"
        "def erasureHeaderFragment : String :="
        "def erasureBodyFragment : String :="
        "def emitErasureReady : Bool :="
        "def emitErasureOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitErasureSurfaceOk : Bool :="
        "EMIT-ERASURE-SMOKE"
        "HOST-EMIT-ERASURE-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_erasure.ssot.txt"
        "NON-SSOT"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned Extract + FAIL_CLOSED freestanding product emit (HOST-EMIT-EXTRACT).
      # Scaffolding body lives on EmitExtractScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitExtract.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_EXTRACT_V0"
        "HOST-EMIT-EXTRACT"
        "SELF-HOST-EMIT-EXTRACT"
        "extractHeaderFragment"
        "extractBodyFragment"
        "emitExtractReady"
        "SystemsLean.EmitExtract"
        "EmitExtractScaffold"
        "import SystemsLean.EmitExtractScaffold"
        "EMIT-EXTRACT-SMOKE"
        "HOST-EMIT-EXTRACT-SMOKE"
        "FAIL_CLOSED_CHECKER_V1"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "slake_extract_status"
        "slake_check_bundle"
        "slake_check_fail_closed"
        "slake_extract_with_checks"
        "slake_extract_status_ok"
        "slake_extract_product_runtime"
        "NON-SSOT"
        "src/systems/emit/host_emit_extract.ssot.txt"
        "src/systems/SystemsLean/EmitExtract.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "theorem emitExtractReady_true"
      ];
      anyGroups = [
        [
          "emitExtractOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitExtractScaffold: HOST-EMIT-EXTRACT product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitExtractScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitExtractScaffold"
        "SystemsLean.EmitExtractScaffold"
        "SLAKE_SELF_HOST_EMIT_EXTRACT_V0"
        "HOST-EMIT-EXTRACT"
        "SELF-HOST-EMIT-EXTRACT"
        "def extractHeaderFragment : String :="
        "def extractBodyFragment : String :="
        "def emitExtractReady : Bool :="
        "def emitExtractOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitExtractSurfaceOk : Bool :="
        "EMIT-EXTRACT-SMOKE"
        "HOST-EMIT-EXTRACT-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_extract.ssot.txt"
        "NON-SSOT"
        "FAIL_CLOSED_CHECKER_V1"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "theorem emitExtractReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned Types freestanding product emit (HOST-EMIT-TYPES).
      # Scaffolding body lives on EmitTypesScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitTypes.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_TYPES_V0"
        "HOST-EMIT-TYPES"
        "SELF-HOST-EMIT-TYPES"
        "typesHeaderFragment"
        "typesBodyFragment"
        "emitTypesReady"
        "SystemsLean.EmitTypes"
        "EmitTypesScaffold"
        "import SystemsLean.EmitTypesScaffold"
        "EMIT-TYPES-SMOKE"
        "HOST-EMIT-TYPES-SMOKE"
        "TYPED_IR_V0"
        "COMMON-UNIVERSE"
        "slake_type_tag"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "NON-SSOT"
        "src/systems/emit/host_emit_types.ssot.txt"
        "src/systems/SystemsLean/EmitTypes.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "emitTypesOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitTypesScaffold: HOST-EMIT-TYPES product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitTypesScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitTypesScaffold"
        "SystemsLean.EmitTypesScaffold"
        "SLAKE_SELF_HOST_EMIT_TYPES_V0"
        "HOST-EMIT-TYPES"
        "SELF-HOST-EMIT-TYPES"
        "def typesHeaderFragment : String :="
        "def typesBodyFragment : String :="
        "def emitTypesReady : Bool :="
        "def emitTypesOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitTypesSurfaceOk : Bool :="
        "EMIT-TYPES-SMOKE"
        "HOST-EMIT-TYPES-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_types.ssot.txt"
        "NON-SSOT"
        "theorem emitTypesReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned IR program freestanding product emit (HOST-EMIT-PROGRAM).
      # Scaffolding body lives on EmitProgramScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_PROGRAM_V0"
        "HOST-EMIT-PROGRAM"
        "SELF-HOST-EMIT-PROGRAM"
        "programHeaderFragment"
        "programBodyFragment"
        "emitProgramReady"
        "SystemsLean.EmitProgram"
        "EmitProgramScaffold"
        "import SystemsLean.EmitProgramScaffold"
        "EMIT-PROGRAM-SMOKE"
        "HOST-EMIT-PROGRAM-SMOKE"
        "IR_PROGRAM_V0"
        "SLAKE_IR_PROGRAM_CAP"
        "slake_ir_program"
        "slake_ir_program_init"
        "slake_ir_program_push"
        "slake_ir_program_is_well_typed"
        "NON-SSOT"
        "src/systems/emit/host_emit_program.ssot.txt"
        "src/systems/SystemsLean/EmitProgram.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "emitProgramOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitProgramScaffold: HOST-EMIT-PROGRAM product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitProgramScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitProgramScaffold"
        "SystemsLean.EmitProgramScaffold"
        "SLAKE_SELF_HOST_EMIT_PROGRAM_V0"
        "HOST-EMIT-PROGRAM"
        "SELF-HOST-EMIT-PROGRAM"
        "def programHeaderFragment : String :="
        "def programBodyFragment : String :="
        "def emitProgramReady : Bool :="
        "def emitProgramOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitProgramSurfaceOk : Bool :="
        "EMIT-PROGRAM-SMOKE"
        "HOST-EMIT-PROGRAM-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_program.ssot.txt"
        "NON-SSOT"
        "theorem emitProgramReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned IR graph freestanding product emit (HOST-EMIT-GRAPH).
      # Scaffolding body lives on EmitGraphScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitGraph.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_GRAPH_V0"
        "HOST-EMIT-GRAPH"
        "SELF-HOST-EMIT-GRAPH"
        "graphHeaderFragment"
        "graphBodyFragment"
        "emitGraphReady"
        "SystemsLean.EmitGraph"
        "EmitGraphScaffold"
        "import SystemsLean.EmitGraphScaffold"
        "EMIT-GRAPH-SMOKE"
        "HOST-EMIT-GRAPH-SMOKE"
        "IR_GRAPH_EDGES_V0"
        "SLAKE_IR_EDGE_MAX"
        "slake_ir_graph"
        "slake_ir_edge"
        "slake_ir_graph_init"
        "slake_ir_graph_push_node"
        "slake_ir_graph_add_edge"
        "slake_ir_graph_is_well_typed"
        "NON-SSOT"
        "src/systems/emit/host_emit_graph.ssot.txt"
        "src/systems/SystemsLean/EmitGraph.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
      ];
      anyGroups = [
        [
          "emitGraphOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitGraphScaffold: HOST-EMIT-GRAPH product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitGraphScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitGraphScaffold"
        "SystemsLean.EmitGraphScaffold"
        "SLAKE_SELF_HOST_EMIT_GRAPH_V0"
        "HOST-EMIT-GRAPH"
        "SELF-HOST-EMIT-GRAPH"
        "def graphHeaderFragment : String :="
        "def graphBodyFragment : String :="
        "def emitGraphReady : Bool :="
        "def emitGraphOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitGraphSurfaceOk : Bool :="
        "EMIT-GRAPH-SMOKE"
        "HOST-EMIT-GRAPH-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_graph.ssot.txt"
        "NON-SSOT"
        "theorem emitGraphReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Host-owned host compose freestanding product emit (HOST-EMIT-COMPOSE).
      # Scaffolding body lives on EmitComposeScaffold (same namespace).
      rel = "src/systems/SystemsLean/EmitCompose.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_EMIT_COMPOSE_V0"
        "HOST-EMIT-COMPOSE"
        "SELF-HOST-EMIT-COMPOSE"
        "composeHeaderFragment"
        "composeBodyFragment"
        "emitComposeReady"
        "SystemsLean.EmitCompose"
        "EmitComposeScaffold"
        "import SystemsLean.EmitComposeScaffold"
        "EMIT-COMPOSE-SMOKE"
        "HOST-EMIT-COMPOSE-SMOKE"
        "HOST_COMPOSE_V0"
        "slake_host_compose"
        "slake_host_compose_init"
        "slake_host_compose_push_node"
        "slake_host_compose_add_edge"
        "slake_host_compose_mint"
        "slake_host_compose_consume"
        "slake_host_compose_mark_erased"
        "slake_host_compose_is_well_typed"
        "slake_host_compose_check_fail_closed"
        "slake_host_compose_extract"
        "NON-SSOT"
        "src/systems/emit/host_emit_compose.ssot.txt"
        "src/systems/SystemsLean/EmitCompose.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "not elaborator MULT-1"
      ];
      anyGroups = [
        [
          "emitComposeOk"
          "headerHonestyOk"
        ]
      ];
    }
    {
      # EmitComposeScaffold: HOST-EMIT-COMPOSE product scaffolding peel (same namespace).
      rel = "src/systems/SystemsLean/EmitComposeScaffold.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "EmitComposeScaffold"
        "SystemsLean.EmitComposeScaffold"
        "SLAKE_SELF_HOST_EMIT_COMPOSE_V0"
        "HOST-EMIT-COMPOSE"
        "SELF-HOST-EMIT-COMPOSE"
        "def composeHeaderFragment : String :="
        "def composeBodyFragment : String :="
        "def emitComposeReady : Bool :="
        "def emitComposeOk : Bool :="
        "def ownershipHonestyOk : Bool :="
        "def headerHonestyOk : Bool :="
        "def bodyHonestyOk : Bool :="
        "def emitComposeSurfaceOk : Bool :="
        "EMIT-COMPOSE-SMOKE"
        "HOST-EMIT-COMPOSE-SMOKE"
        "ssotArtifactPath"
        "src/systems/emit/host_emit_compose.ssot.txt"
        "NON-SSOT"
        "theorem emitComposeReady_true"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
      ];
    }
    {
      # Mult closed-loop parity host + product contracts (SH3).
      # Theorems + smoke peeled to ParityMultTheorems (same namespace).
      rel = "src/systems/SystemsLean/ParityMult.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PARITY_MULT_V0"
        "HOST-PARITY-MULT"
        "SELF-HOST-PARITY-MULT"
        "multParityReady"
        "gradeParityOk"
        "SystemsLean.ParityMult"
        "ParityMultTheorems"
        "PARITY-MULT-SMOKE"
        "HOST-PARITY-MULT-SMOKE"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_mult_is_valid"
        "slake_mult_is_known"
        "slake_mult_name"
        "SELF-HOST-KERNEL-MULT"
        "HOST-EMIT-MULT"
        "src/systems/smoke/slake_behavioral_probe.c"
        "src/systems/SystemsLean/ParityMult.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "PARITY-MULT-THEOREM"
        "HOST-PARITY-MULT-THEOREM"
      ];
      anyGroups = [
        [
          "multParityOk"
          "paritySurfaceOk"
        ]
      ];
    }
    {
      # ParityMultTheorems: PARITY-MULT-THEOREM + PARITY-MULT-SMOKE peel
      # (same namespace ParityMult).
      rel = "src/systems/SystemsLean/ParityMultTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ParityMultTheorems"
        "SystemsLean.ParityMultTheorems"
        "import SystemsLean.ParityMult"
        "PARITY-MULT-THEOREM"
        "HOST-PARITY-MULT-THEOREM"
        "PARITY-MULT-SMOKE"
        "HOST-PARITY-MULT-SMOKE"
        "example"
        "multParityReady_true"
        "gradeParityOk_true"
        "multParityOk_true"
        "multParityOk_eq_ready"
        "ofNatRoundTripOk_true"
        "isValidTagParityOk_true"
        "nameParityOk_true"
        "stageId_eq"
        "hostParityMultId_eq"
        "selfHostParityMultId_eq"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem multParityReady_true"
        "theorem gradeParityOk_true"
        "theorem ofNatRoundTripOk_true"
        "theorem multParityOk_eq_ready"
        # Content equality (parity table + product API; not pure readiness canaries).
        "ofNatRoundTrip_tag0"
        "ofNatRoundTrip_tag1"
        "ofNatRoundTrip_tagOmega"
        "ofNatRoundTrip_unknown3"
        "ofNatRoundTrip_unknown99"
        "isValidTag_tag0"
        "isValidTag_tag1"
        "isValidTag_tagOmega"
        "isValidTag_unknown3"
        "isValidTag_unknown99"
        "nameParity_mult0"
        "nameParity_mult1"
        "nameParity_multOmega"
        "enumTag_multC0"
        "enumTag_multC1"
        "enumTag_multCOmega"
        "productIsValidApi_eq"
        "productIsKnownApi_eq"
        "productNameApi_eq"
        "isValidParityOk_true"
        "enumTagParityOk_true"
        "theorem ofNatRoundTrip_tag0"
        "theorem ofNatRoundTrip_tag1"
        "theorem ofNatRoundTrip_tagOmega"
        "theorem ofNatRoundTrip_unknown3"
        "theorem ofNatRoundTrip_unknown99"
        "theorem isValidTag_tag0"
        "theorem isValidTag_tag1"
        "theorem isValidTag_tagOmega"
        "theorem isValidTag_unknown3"
        "theorem isValidTag_unknown99"
        "theorem nameParity_mult0"
        "theorem nameParity_mult1"
        "theorem nameParity_multOmega"
        "theorem enumTag_multC0"
        "theorem enumTag_multC1"
        "theorem enumTag_multCOmega"
        "theorem productIsValidApi_eq"
        "theorem productIsKnownApi_eq"
        "theorem productNameApi_eq"
        "theorem isValidParityOk_true"
        "theorem enumTagParityOk_true"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "HOST-PARITY-MULT"
        "SELF-HOST-PARITY-MULT"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "Not proof complete"
      ];
    }
    {
      # Linear self-host kernel IR + host compose path (SH4 start).
      # Theorems + smoke live in KernelLinearTheorems (same namespace; long-file split).
      rel = "src/systems/SystemsLean/KernelLinear.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_KERNEL_LINEAR_V0"
        "SELF-HOST-KERNEL-LINEAR"
        "HOST-KERNEL-LINEAR"
        "SELF-HOST"
        "lowerLinearKernel"
        "linearKernelProgram"
        "linearKernelReady"
        "linearHostPathReady"
        "linearKernelOk"
        "SystemsLean.KernelLinear"
        "KernelLinearTheorems"
        "KERNEL-LINEAR-SMOKE"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "LINEAR-EXACT-ONCE"
        "JOIN-ALG"
        "ConsumeToken"
        "MULT-1"
        "HOST-COMPOSE"
        "ORDERED-IR-PROGRAM"
        "HOST-COMPILE-PATH"
        "CONSUME_TOKEN_HOST_V0"
        "slake_linear_consume"
        "src/systems/self-host.md"
        "src/systems/SystemsLean/KernelLinear.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "KERNEL-LINEAR-THEOREM"
        "HOST-KERNEL-LINEAR-THEOREM"
      ];
      anyGroups = [
        [
          "linearSurfaceOk"
          "linearMismatchRejected"
        ]
      ];
    }
    {
      # KernelLinearTheorems: KERNEL-LINEAR-THEOREM + KERNEL-LINEAR-SMOKE
      # long-file split (same namespace).
      rel = "src/systems/SystemsLean/KernelLinearTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "KernelLinearTheorems"
        "SystemsLean.KernelLinearTheorems"
        "import SystemsLean.KernelLinear"
        "KERNEL-LINEAR-THEOREM"
        "HOST-KERNEL-LINEAR-THEOREM"
        "KERNEL-LINEAR-SMOKE"
        "example"
        "linearKernelReady_true"
        "linearKernelOk_true"
        "linearHostPathReady_true"
        "lowerLinearKernel_isSome"
        "linearMismatchRejected_true"
        "programCompileReady_empty_false"
        "lowerLinearKernel_length_one"
        "lowerLinearKernel_isWellTyped"
        "linearKernelProgram_length_one"
        "linearKernelProgram_isWellTyped"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem linearKernelReady_true"
        "theorem linearKernelOk_true"
        "theorem programCompileReady_empty_false"
      ];
    }
    {
      # Linear freestanding path parity host + product contracts (Mult+Linear deepen).
      # Theorems + smoke split to ParityLinearTheorems (same namespace).
      rel = "src/systems/SystemsLean/ParityLinear.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PARITY_LINEAR_V0"
        "HOST-PARITY-LINEAR"
        "SELF-HOST-PARITY-LINEAR"
        "linearParityReady"
        "linearContractParityOk"
        "multLinearParityReady"
        "SystemsLean.ParityLinear"
        "ParityLinearTheorems"
        "PARITY-LINEAR-SMOKE"
        "HOST-PARITY-LINEAR-SMOKE"
        "LINEAR-EXACT-ONCE"
        "JOIN-ALG"
        "ConsumeToken"
        "CONSUME_TOKEN_HOST_V0"
        "slake_linear_consume"
        "slake_linear_token_init"
        "slake_linear_token_is_live"
        "slake_linear_token_consume"
        "slake_consume_token_mint"
        "slake_consume_token_consume"
        "slake_consume_token_is_live"
        "HOST-KERNEL-LINEAR"
        "HOST-PARITY-MULT"
        "src/systems/smoke/slake_behavioral_probe.c"
        "src/systems/SystemsLean/ParityLinear.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "PARITY-LINEAR-THEOREM"
        "HOST-PARITY-LINEAR-THEOREM"
      ];
      anyGroups = [
        [
          "linearParityOk"
          "paritySurfaceOk"
          "productApiSurfaceOk"
        ]
      ];
    }
    {
      # ParityLinearTheorems: PARITY-LINEAR-THEOREM + PARITY-LINEAR-SMOKE split
      # (same namespace ParityLinear).
      rel = "src/systems/SystemsLean/ParityLinearTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ParityLinearTheorems"
        "SystemsLean.ParityLinearTheorems"
        "import SystemsLean.ParityLinear"
        "PARITY-LINEAR-THEOREM"
        "HOST-PARITY-LINEAR-THEOREM"
        "PARITY-LINEAR-SMOKE"
        "HOST-PARITY-LINEAR-SMOKE"
        "example"
        "linearParityReady_true"
        "linearParityOk_true"
        "linearContractParityOk_true"
        "multLinearParityReady_true"
        "stageId_eq"
        "hostParityLinearId_eq"
        "selfHostParityLinearId_eq"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem linearParityReady_true"
        "theorem linearContractParityOk_true"
        "theorem multLinearParityReady_true"
        # Content equality (product API surface; not pure readiness canaries).
        "productLinearConsumeApi_eq"
        "productLinearTokenInitApi_eq"
        "productLinearTokenIsLiveApi_eq"
        "productLinearTokenConsumeApi_eq"
        "productConsumeTokenMintApi_eq"
        "productConsumeTokenConsumeApi_eq"
        "productConsumeTokenIsLiveApi_eq"
        "productConsumeTokenHostId_eq"
        "productApiSurfaceOk_true"
        "theorem productLinearConsumeApi_eq"
        "theorem productLinearTokenInitApi_eq"
        "theorem productLinearTokenIsLiveApi_eq"
        "theorem productLinearTokenConsumeApi_eq"
        "theorem productConsumeTokenMintApi_eq"
        "theorem productConsumeTokenConsumeApi_eq"
        "theorem productConsumeTokenIsLiveApi_eq"
        "theorem productConsumeTokenHostId_eq"
        "theorem productApiSurfaceOk_true"
        "HOST-PARITY-LINEAR"
        "SELF-HOST-PARITY-LINEAR"
        "SLAKE_SELF_HOST_PARITY_LINEAR_V0"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "Not proof complete"
      ];
    }
    {
      # Types self-host kernel IR + program path honesty (SH4 growth).
      # Theorems + smoke peeled to KernelTypesTheorems (same namespace).
      rel = "src/systems/SystemsLean/KernelTypes.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_KERNEL_TYPES_V0"
        "SELF-HOST-KERNEL-TYPES"
        "HOST-KERNEL-TYPES"
        "SELF-HOST"
        "lowerTypesKernel"
        "typesKernelProgram"
        "typesKernelReady"
        "typesProgramPathReady"
        "typesKernelOk"
        "SystemsLean.KernelTypes"
        "KernelTypesTheorems"
        "KERNEL-TYPES-SMOKE"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "FAIL-CLOSED-UNKNOWN-KIND"
        "TYPED_IR_V0"
        "COMMON-UNIVERSE"
        "ORDERED-IR-PROGRAM"
        "HOST-COMPILE-PATH"
        "foldWellTyped"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_ir_node"
        "src/systems/self-host.md"
        "src/systems/SystemsLean/KernelTypes.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "KERNEL-TYPES-THEOREM"
        "HOST-KERNEL-TYPES-THEOREM"
      ];
      anyGroups = [
        [
          "typesSurfaceOk"
          "unknownKindRejected"
          "kindMultMismatchRejected"
        ]
      ];
    }
    {
      # KernelTypesTheorems: KERNEL-TYPES-THEOREM + KERNEL-TYPES-SMOKE peel
      # (same namespace).
      rel = "src/systems/SystemsLean/KernelTypesTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "KernelTypesTheorems"
        "SystemsLean.KernelTypesTheorems"
        "import SystemsLean.KernelTypes"
        "KERNEL-TYPES-THEOREM"
        "HOST-KERNEL-TYPES-THEOREM"
        "KERNEL-TYPES-SMOKE"
        "example"
        "typesKernelReady_true"
        "typesKernelOk_true"
        "typesProgramPathReady_true"
        "lowerTypesKernel_isSome"
        "unknownKindRejected_true"
        "kindMultMismatchRejected_true"
        "programCompileReady_empty_false"
        "lowerTypesKernel_length_three"
        "lowerTypesKernel_isWellTyped"
        "typesKernelProgram_length_three"
        "typesKernelProgram_isWellTyped"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem typesKernelReady_true"
        "theorem typesKernelOk_true"
        "theorem typesProgramPathReady_true"
        "theorem lowerTypesKernel_isSome"
        "theorem unknownKindRejected_true"
        "theorem kindMultMismatchRejected_true"
        "theorem lowerTypesKernel_length_three"
        "theorem lowerTypesKernel_isWellTyped"
        "theorem typesKernelProgram_length_three"
        "theorem typesKernelProgram_isWellTyped"
        "theorem programCompileReady_empty_false"
      ];
      anyGroups = [];
    }
    {
      # Types freestanding path parity host + product contracts (Mult+Linear+Types).
      # Theorems + smoke split to ParityTypesTheorems (same namespace).
      rel = "src/systems/SystemsLean/ParityTypes.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PARITY_TYPES_V0"
        "HOST-PARITY-TYPES"
        "SELF-HOST-PARITY-TYPES"
        "typesParityReady"
        "typesContractParityOk"
        "multLinearTypesParityReady"
        "SystemsLean.ParityTypes"
        "ParityTypesTheorems"
        "PARITY-TYPES-SMOKE"
        "HOST-PARITY-TYPES-SMOKE"
        "TYPED_IR_V0"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "slake_ir_node_check_fail_closed"
        "kindMultMismatchRejected"
        "typesProgramPathReady"
        "HOST-KERNEL-TYPES"
        "HOST-PARITY-LINEAR"
        "HOST-PARITY-MULT"
        "src/systems/smoke/slake_behavioral_probe.c"
        "src/systems/SystemsLean/ParityTypes.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "PARITY-TYPES-THEOREM"
        "HOST-PARITY-TYPES-THEOREM"
      ];
      anyGroups = [
        [
          "typesParityOk"
          "paritySurfaceOk"
          "productApiSurfaceOk"
        ]
      ];
    }
    {
      # ParityTypesTheorems: PARITY-TYPES-THEOREM + PARITY-TYPES-SMOKE split
      # (same namespace ParityTypes).
      rel = "src/systems/SystemsLean/ParityTypesTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ParityTypesTheorems"
        "SystemsLean.ParityTypesTheorems"
        "import SystemsLean.ParityTypes"
        "PARITY-TYPES-THEOREM"
        "HOST-PARITY-TYPES-THEOREM"
        "PARITY-TYPES-SMOKE"
        "HOST-PARITY-TYPES-SMOKE"
        "example"
        "typesParityReady_true"
        "typesParityOk_true"
        "typesContractParityOk_true"
        "multLinearTypesParityReady_true"
        "stageId_eq"
        "hostParityTypesId_eq"
        "selfHostParityTypesId_eq"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem typesParityReady_true"
        "theorem typesContractParityOk_true"
        "theorem multLinearTypesParityReady_true"
        # Content equality (product API surface; not pure readiness canaries).
        "productTypedIrId_eq"
        "productIrNodeApi_eq"
        "productIrNodeInitApi_eq"
        "productIrNodeIsWellTypedApi_eq"
        "productIrNodeCheckFailClosedApi_eq"
        "productApiSurfaceOk_true"
        "theorem productTypedIrId_eq"
        "theorem productIrNodeApi_eq"
        "theorem productIrNodeInitApi_eq"
        "theorem productIrNodeIsWellTypedApi_eq"
        "theorem productIrNodeCheckFailClosedApi_eq"
        "theorem productApiSurfaceOk_true"
        "HOST-PARITY-TYPES"
        "SELF-HOST-PARITY-TYPES"
        "SLAKE_SELF_HOST_PARITY_TYPES_V0"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "Not proof complete"
      ];
    }
    {
      # Program / graph / compose self-host kernel (SH4 remainder).
      # Theorems + smoke peeled to KernelProgramTheorems (same namespace).
      rel = "src/systems/SystemsLean/KernelProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_KERNEL_PROGRAM_V0"
        "SELF-HOST-KERNEL-PROGRAM"
        "HOST-KERNEL-PROGRAM"
        "SELF-HOST"
        "lowerProgramKernel"
        "programKernelProgram"
        "programKernelReady"
        "programPathReady"
        "programGraphPathReady"
        "programComposePathReady"
        "programKernelOk"
        "SystemsLean.KernelProgram"
        "KernelProgramTheorems"
        "KERNEL-PROGRAM-SMOKE"
        "EMPTY-PROGRAM-FAIL-CLOSED"
        "EMPTY-GRAPH-OK"
        "IR-GRAPH-EDGES"
        "HOST-COMPOSE"
        "ORDERED-IR-PROGRAM"
        "HOST-COMPILE-PATH"
        "foldWellTyped"
        "IR_PROGRAM_V0"
        "IR_GRAPH_EDGES_V0"
        "HOST_COMPOSE_V0"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_ir_program"
        "slake_ir_graph"
        "slake_host_compose"
        "src/systems/self-host.md"
        "src/systems/SystemsLean/KernelProgram.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "KERNEL-PROGRAM-THEOREM"
        "HOST-KERNEL-PROGRAM-THEOREM"
      ];
      anyGroups = [
        [
          "programSurfaceOk"
          "programPathReady"
          "programGraphPathReady"
          "programComposePathReady"
        ]
      ];
    }
    {
      # KernelProgramTheorems: KERNEL-PROGRAM-THEOREM + KERNEL-PROGRAM-SMOKE peel
      # (same namespace).
      rel = "src/systems/SystemsLean/KernelProgramTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "KernelProgramTheorems"
        "SystemsLean.KernelProgramTheorems"
        "import SystemsLean.KernelProgram"
        "KERNEL-PROGRAM-THEOREM"
        "HOST-KERNEL-PROGRAM-THEOREM"
        "KERNEL-PROGRAM-SMOKE"
        "example"
        "programKernelReady_true"
        "programKernelOk_true"
        "programPathReady_true"
        "programGraphPathReady_true"
        "programComposePathReady_true"
        "lowerProgramKernel_isSome"
        "programCompileReady_empty_false"
        "lowerProgramKernel_length_three"
        "lowerProgramKernel_isWellTyped"
        "programKernelProgram_length_three"
        "programKernelProgram_isWellTyped"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        # Structural readiness: real theorem forms (AND, not OR anyGroup).
        "theorem programKernelReady_true"
        "theorem programKernelOk_true"
        "theorem programPathReady_true"
        "theorem programGraphPathReady_true"
        "theorem programComposePathReady_true"
        "theorem lowerProgramKernel_isSome"
        "theorem lowerProgramKernel_length_three"
        "theorem lowerProgramKernel_isWellTyped"
        "theorem programKernelProgram_length_three"
        "theorem programKernelProgram_isWellTyped"
        "theorem programCompileReady_empty_false"
      ];
      anyGroups = [];
    }
    {
      # Program freestanding path parity host + product contracts
      # (Mult+Linear+Types+Program).
      # Theorems + smoke peeled to ParityProgramTheorems (same namespace).
      rel = "src/systems/SystemsLean/ParityProgram.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PARITY_PROGRAM_V0"
        "HOST-PARITY-PROGRAM"
        "SELF-HOST-PARITY-PROGRAM"
        "programParityReady"
        "programContractParityOk"
        "multLinearTypesProgramParityReady"
        "SystemsLean.ParityProgram"
        "ParityProgramTheorems"
        "PARITY-PROGRAM-SMOKE"
        "HOST-PARITY-PROGRAM-SMOKE"
        "IR_PROGRAM_V0"
        "IR_GRAPH_EDGES_V0"
        "HOST_COMPOSE_V0"
        "slake_ir_program"
        "slake_ir_program_init"
        "slake_ir_program_push"
        "slake_ir_program_is_well_typed"
        "slake_ir_program_check_fail_closed"
        "slake_ir_graph"
        "slake_ir_graph_init"
        "slake_ir_graph_push_node"
        "slake_ir_graph_add_edge"
        "slake_host_compose"
        "slake_host_compose_init"
        "slake_host_compose_mint"
        "slake_host_compose_consume"
        "programPathReady"
        "programGraphPathReady"
        "programComposePathReady"
        "HOST-KERNEL-PROGRAM"
        "HOST-PARITY-TYPES"
        "HOST-PARITY-LINEAR"
        "HOST-PARITY-MULT"
        "ORDERED-IR-PROGRAM"
        "src/systems/smoke/slake_behavioral_probe.c"
        "src/systems/SystemsLean/ParityProgram.lean"
        "UNIT_SURFACE"
        "Not freestanding emit"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "PARITY-PROGRAM-THEOREM"
        "HOST-PARITY-PROGRAM-THEOREM"
      ];
      anyGroups = [
        [
          "programParityOk"
          "paritySurfaceOk"
          "productApiSurfaceOk"
        ]
      ];
    }
    {
      # ParityProgramTheorems: PARITY-PROGRAM-THEOREM + PARITY-PROGRAM-SMOKE peel
      # (same namespace ParityProgram).
      rel = "src/systems/SystemsLean/ParityProgramTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ParityProgramTheorems"
        "SystemsLean.ParityProgramTheorems"
        "import SystemsLean.ParityProgram"
        "PARITY-PROGRAM-THEOREM"
        "HOST-PARITY-PROGRAM-THEOREM"
        "PARITY-PROGRAM-SMOKE"
        "HOST-PARITY-PROGRAM-SMOKE"
        "example"
        "programParityReady_true"
        "programContractParityOk_true"
        "programParityOk_true"
        "multLinearTypesProgramParityReady_true"
        "stageId_eq"
        "hostParityProgramId_eq"
        "selfHostParityProgramId_eq"
        "theorem programParityReady_true"
        "theorem programContractParityOk_true"
        "theorem multLinearTypesProgramParityReady_true"
        "productIrProgramId_eq"
        "productIrGraphId_eq"
        "productHostComposeId_eq"
        "productIrProgramApi_eq"
        "productIrProgramInitApi_eq"
        "productIrProgramPushApi_eq"
        "productIrProgramIsWellTypedApi_eq"
        "productIrProgramCheckFailClosedApi_eq"
        "productIrGraphApi_eq"
        "productIrGraphInitApi_eq"
        "productIrGraphPushNodeApi_eq"
        "productIrGraphAddEdgeApi_eq"
        "productHostComposeApi_eq"
        "productHostComposeInitApi_eq"
        "productHostComposeMintApi_eq"
        "productHostComposeConsumeApi_eq"
        "productApiSurfaceOk_true"
        "theorem productIrProgramId_eq"
        "theorem productIrGraphId_eq"
        "theorem productHostComposeId_eq"
        "theorem productIrProgramApi_eq"
        "theorem productIrProgramInitApi_eq"
        "theorem productIrProgramPushApi_eq"
        "theorem productIrProgramIsWellTypedApi_eq"
        "theorem productIrProgramCheckFailClosedApi_eq"
        "theorem productIrGraphApi_eq"
        "theorem productIrGraphInitApi_eq"
        "theorem productIrGraphPushNodeApi_eq"
        "theorem productIrGraphAddEdgeApi_eq"
        "theorem productHostComposeApi_eq"
        "theorem productHostComposeInitApi_eq"
        "theorem productHostComposeMintApi_eq"
        "theorem productHostComposeConsumeApi_eq"
        "theorem productApiSurfaceOk_true"
        "IR_PROGRAM_V0"
        "IR_GRAPH_EDGES_V0"
        "HOST_COMPOSE_V0"
        "HOST-PARITY-PROGRAM"
        "SELF-HOST-PARITY-PROGRAM"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "Not proof complete"
      ];
    }
    {
      # Freestanding codegen host honesty (SH4 remainder: plan/apply/body).
      # Theorems + smoke peeled to KernelEmitTheorems (same namespace).
      rel = "src/systems/SystemsLean/KernelEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_KERNEL_EMIT_V0"
        "SELF-HOST-KERNEL-EMIT"
        "HOST-KERNEL-EMIT"
        "SELF-HOST"
        "lowerEmitCompose"
        "emitHost"
        "emitKernelReady"
        "emitPlanPathReady"
        "emitApplyPathReady"
        "emitBodyPathReady"
        "emitKernelOk"
        "SystemsLean.KernelEmit"
        "KernelEmitTheorems"
        "KERNEL-EMIT-SMOKE"
        "EMIT-PLAN"
        "EMIT-APPLY"
        "EMIT-BODY"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-MULT"
        "HOST-KERNEL-PROGRAM"
        "programKernelReady"
        "emitMultReady"
        "planOk"
        "applyOk"
        "bodyOk"
        "EMIT_PLAN_V0"
        "EMIT_APPLY_V0"
        "EMIT_BODY_V0"
        "RUNTIME-FS"
        "FAIL-CLOSED"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_emit_plan"
        "slake_emit_apply"
        "slake_emit_body"
        "src/systems/self-host.md"
        "src/systems/SystemsLean/KernelEmit.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "KERNEL-EMIT-THEOREM"
        "HOST-KERNEL-EMIT-THEOREM"
      ];
      anyGroups = [
        [
          "emitSurfaceOk"
          "emitPlanPathReady"
          "emitApplyPathReady"
          "emitBodyPathReady"
        ]
      ];
    }
    {
      # KernelEmitTheorems: KERNEL-EMIT-THEOREM + KERNEL-EMIT-SMOKE peel
      # (same namespace KernelEmit).
      rel = "src/systems/SystemsLean/KernelEmitTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "KernelEmitTheorems"
        "SystemsLean.KernelEmitTheorems"
        "import SystemsLean.KernelEmit"
        "KERNEL-EMIT-THEOREM"
        "HOST-KERNEL-EMIT-THEOREM"
        "KERNEL-EMIT-SMOKE"
        "example"
        "emitKernelReady_true"
        "emitKernelOk_true"
        "emitPlanPathReady_true"
        "emitApplyPathReady_true"
        "emitBodyPathReady_true"
        "lowerEmitCompose_isSome"
        "lowerEmitCompose_plan_counts"
        "lowerEmitCompose_apply_tags"
        "lowerEmitCompose_body_fragment"
        "stageId_eq"
        "kernelEmitId_eq"
        "hostKernelEmitId_eq"
        "theorem emitKernelReady_true"
        "theorem emitKernelOk_true"
        "theorem emitPlanPathReady_true"
        "theorem lowerEmitCompose_isSome"
        "theorem lowerEmitCompose_plan_counts"
        "theorem lowerEmitCompose_apply_tags"
        "theorem lowerEmitCompose_body_fragment"
        "EMIT-PLAN"
        "EMIT-APPLY"
        "EMIT-BODY"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-MULT"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "Not proof complete"
      ];
    }
    {
      # Emit freestanding path parity host + product contracts
      # (Mult+Linear+Types+Program+Emit).
      # Theorems + smoke peeled to ParityEmitTheorems (same namespace).
      rel = "src/systems/SystemsLean/ParityEmit.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "SLAKE_SELF_HOST_PARITY_EMIT_V0"
        "HOST-PARITY-EMIT"
        "SELF-HOST-PARITY-EMIT"
        "emitParityReady"
        "emitContractParityOk"
        "multLinearTypesProgramEmitParityReady"
        "SystemsLean.ParityEmit"
        "ParityEmitTheorems"
        "PARITY-EMIT-SMOKE"
        "HOST-PARITY-EMIT-SMOKE"
        "EMIT_PLAN_V0"
        "EMIT_APPLY_V0"
        "EMIT_BODY_V0"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-MULT"
        "slake_emit_plan"
        "slake_emit_plan_id"
        "slake_emit_plan_from_compose"
        "slake_emit_plan_is_ready"
        "slake_emit_apply"
        "slake_emit_apply_id"
        "slake_emit_apply_from_compose"
        "slake_emit_apply_is_valid"
        "slake_emit_body"
        "slake_emit_body_id"
        "slake_emit_body_from_compose"
        "slake_emit_body_is_valid"
        "emitPlanPathReady"
        "emitApplyPathReady"
        "emitBodyPathReady"
        "emitMultReady"
        "HOST-KERNEL-EMIT"
        "HOST-PARITY-PROGRAM"
        "HOST-PARITY-TYPES"
        "HOST-PARITY-LINEAR"
        "HOST-PARITY-MULT"
        "RUNTIME-FS"
        "FAIL-CLOSED"
        "src/systems/smoke/slake_behavioral_probe.c"
        "src/systems/SystemsLean/ParityEmit.lean"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "PARITY-EMIT-THEOREM"
        "HOST-PARITY-EMIT-THEOREM"
      ];
      anyGroups = [
        [
          "emitParityOk"
          "paritySurfaceOk"
          "productApiSurfaceOk"
        ]
      ];
    }
    {
      # ParityEmitTheorems: PARITY-EMIT-THEOREM + PARITY-EMIT-SMOKE peel
      # (same namespace ParityEmit).
      rel = "src/systems/SystemsLean/ParityEmitTheorems.lean";
      all = [
        "SYSTEMS_LEAN_HOST"
        "ParityEmitTheorems"
        "SystemsLean.ParityEmitTheorems"
        "import SystemsLean.ParityEmit"
        "PARITY-EMIT-THEOREM"
        "HOST-PARITY-EMIT-THEOREM"
        "PARITY-EMIT-SMOKE"
        "HOST-PARITY-EMIT-SMOKE"
        "example"
        "emitParityReady_true"
        "emitContractParityOk_true"
        "emitParityOk_true"
        "multLinearTypesProgramEmitParityReady_true"
        "stageId_eq"
        "hostParityEmitId_eq"
        "selfHostParityEmitId_eq"
        "theorem emitParityReady_true"
        "theorem emitContractParityOk_true"
        "theorem multLinearTypesProgramEmitParityReady_true"
        "productEmitPlanId_eq"
        "productEmitApplyId_eq"
        "productEmitBodyId_eq"
        "productHostEmitSsotId_eq"
        "productHostEmitMultId_eq"
        "productEmitPlanApi_eq"
        "productEmitPlanIdApi_eq"
        "productEmitPlanFromComposeApi_eq"
        "productEmitPlanIsReadyApi_eq"
        "productEmitApplyApi_eq"
        "productEmitApplyIdApi_eq"
        "productEmitApplyFromComposeApi_eq"
        "productEmitApplyIsValidApi_eq"
        "productEmitBodyApi_eq"
        "productEmitBodyIdApi_eq"
        "productEmitBodyFromComposeApi_eq"
        "productEmitBodyIsValidApi_eq"
        "productApiSurfaceOk_true"
        "theorem productEmitPlanId_eq"
        "theorem productEmitApplyId_eq"
        "theorem productEmitBodyId_eq"
        "theorem productHostEmitSsotId_eq"
        "theorem productHostEmitMultId_eq"
        "theorem productEmitPlanApi_eq"
        "theorem productEmitPlanIdApi_eq"
        "theorem productEmitPlanFromComposeApi_eq"
        "theorem productEmitPlanIsReadyApi_eq"
        "theorem productEmitApplyApi_eq"
        "theorem productEmitApplyIdApi_eq"
        "theorem productEmitApplyFromComposeApi_eq"
        "theorem productEmitApplyIsValidApi_eq"
        "theorem productEmitBodyApi_eq"
        "theorem productEmitBodyIdApi_eq"
        "theorem productEmitBodyFromComposeApi_eq"
        "theorem productEmitBodyIsValidApi_eq"
        "theorem productApiSurfaceOk_true"
        "EMIT_PLAN_V0"
        "EMIT_APPLY_V0"
        "EMIT_BODY_V0"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-MULT"
        "HOST-PARITY-EMIT"
        "SELF-HOST-PARITY-EMIT"
        "UNIT_SURFACE"
        "Not freestanding residual free"
        "Not PROVABLY"
        "Not freestanding emit residual free"
        "Not proof complete"
      ];
    }
];
}
