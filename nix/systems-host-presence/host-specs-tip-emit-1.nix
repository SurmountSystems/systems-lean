# SPDX-License-Identifier: Unlicense
# Host presence token specs slice. Joined via specs.nix. Sub-1-KLOC.
# No bash, no Python.
{
  hostSpecsTipEmit1 = [
    {
      # HOST-EMIT-SSOT + HOST-EMIT-BODY durable artifact: dialect keys + scaffolding.
      rel = "src/systems/emit/host_emit_body_fragment.ssot.txt";
      all = [
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "EMPTY_FRAGMENT"
        "HEADER_OPEN"
        "HEADER_E"
        "HEADER_CLOSE"
        "TAG_OPEN"
        "TAG_MULT"
        "TAG_KIND"
        "TAG_CLOSE"
        "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"
        "NON-SSOT"
        "buildFragment"
        "BODY_C_HEADER_BEGIN"
        "BODY_C_BODY_BEGIN"
        "slake_emit_body_put_char"
        "slake_emit_body_put_u8"
        "slake_emit_body_from_compose"
        "SLAKE_EMIT_BODY_CAP"
        "EmitBody"
      ];
    }
    {
      # HOST-EMIT-MULT durable Mult product text (SH2).
      rel = "src/systems/emit/host_emit_mult.ssot.txt";
      all = [
        "HOST-EMIT-MULT"
        "NON-SSOT"
        "SELF-HOST-EMIT-MULT"
        "SLAKE_SELF_HOST_EMIT_MULT_V0"
        "MULT_NAME_0"
        "MULT_NAME_1"
        "MULT_NAME_OMEGA"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_mult_is_valid"
        "FAIL-CLOSED-UNKNOWN-GRADE"
        "MULT_C_HEADER_BEGIN"
        "MULT_C_BODY_BEGIN"
        "EmitMult"
      ];
    }
    {
      # HOST-EMIT-LINEAR durable Linear product text.
      rel = "src/systems/emit/host_emit_linear.ssot.txt";
      all = [
        "HOST-EMIT-LINEAR"
        "NON-SSOT"
        "SELF-HOST-EMIT-LINEAR"
        "SLAKE_SELF_HOST_EMIT_LINEAR_V0"
        "LINEAR-EXACT-ONCE"
        "CONSUME_TOKEN_HOST_V0"
        "JOIN-ALG"
        "slake_linear_consume"
        "slake_consume_token_consume"
        "LINEAR_C_HEADER_BEGIN"
        "LINEAR_C_BODY_BEGIN"
        "EmitLinear"
      ];
    }
    {
      # HOST-EMIT-ERASURE durable Erasure product text.
      rel = "src/systems/emit/host_emit_erasure.ssot.txt";
      all = [
        "HOST-EMIT-ERASURE"
        "NON-SSOT"
        "SELF-HOST-EMIT-ERASURE"
        "SLAKE_SELF_HOST_EMIT_ERASURE_V0"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "slake_erased"
        "slake_erased_mark"
        "slake_erasure_is_runtime_absent"
        "ERASURE_C_HEADER_BEGIN"
        "ERASURE_C_BODY_BEGIN"
        "EmitErasure"
      ];
    }
    {
      # HOST-EMIT-EXTRACT durable Extract + FAIL_CLOSED product text.
      rel = "src/systems/emit/host_emit_extract.ssot.txt";
      all = [
        "HOST-EMIT-EXTRACT"
        "NON-SSOT"
        "SELF-HOST-EMIT-EXTRACT"
        "SLAKE_SELF_HOST_EMIT_EXTRACT_V0"
        "FAIL_CLOSED_CHECKER_V1"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "slake_extract_status"
        "slake_check_bundle"
        "slake_check_fail_closed"
        "slake_extract_with_checks"
        "EXTRACT_C_HEADER_BEGIN"
        "EXTRACT_C_BODY_BEGIN"
        "EmitExtract"
      ];
    }
    {
      # HOST-EMIT-TYPES durable Types/TYPED_IR product text.
      rel = "src/systems/emit/host_emit_types.ssot.txt";
      all = [
        "HOST-EMIT-TYPES"
        "NON-SSOT"
        "SELF-HOST-EMIT-TYPES"
        "SLAKE_SELF_HOST_EMIT_TYPES_V0"
        "TYPED_IR_V0"
        "COMMON-UNIVERSE"
        "slake_type_tag"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "TYPES_C_HEADER_BEGIN"
        "TYPES_C_BODY_BEGIN"
        "EmitTypes"
      ];
    }
    {
      # HOST-EMIT-PROGRAM durable IR program product text.
      rel = "src/systems/emit/host_emit_program.ssot.txt";
      all = [
        "HOST-EMIT-PROGRAM"
        "NON-SSOT"
        "SELF-HOST-EMIT-PROGRAM"
        "SLAKE_SELF_HOST_EMIT_PROGRAM_V0"
        "IR_PROGRAM_V0"
        "SLAKE_IR_PROGRAM_CAP"
        "slake_ir_program"
        "slake_ir_program_init"
        "slake_ir_program_push"
        "slake_ir_program_is_well_typed"
        "PROGRAM_C_HEADER_BEGIN"
        "PROGRAM_C_BODY_BEGIN"
        "EmitProgram"
      ];
    }
    {
      # HOST-EMIT-GRAPH durable IR graph product text.
      rel = "src/systems/emit/host_emit_graph.ssot.txt";
      all = [
        "HOST-EMIT-GRAPH"
        "NON-SSOT"
        "SELF-HOST-EMIT-GRAPH"
        "SLAKE_SELF_HOST_EMIT_GRAPH_V0"
        "IR_GRAPH_EDGES_V0"
        "SLAKE_IR_EDGE_MAX"
        "slake_ir_graph"
        "slake_ir_edge"
        "slake_ir_graph_init"
        "slake_ir_graph_push_node"
        "slake_ir_graph_add_edge"
        "slake_ir_graph_is_well_typed"
        "GRAPH_C_HEADER_BEGIN"
        "GRAPH_C_BODY_BEGIN"
        "EmitGraph"
      ];
    }
    {
      # HOST-EMIT-COMPOSE durable host compose product text.
      rel = "src/systems/emit/host_emit_compose.ssot.txt";
      all = [
        "HOST-EMIT-COMPOSE"
        "NON-SSOT"
        "SELF-HOST-EMIT-COMPOSE"
        "SLAKE_SELF_HOST_EMIT_COMPOSE_V0"
        "HOST_COMPOSE_V0"
        "slake_host_compose"
        "slake_host_compose_init"
        "slake_host_compose_push_node"
        "slake_host_compose_add_edge"
        "slake_host_compose_mint"
        "slake_host_compose_consume"
        "slake_host_compose_mark_erased"
        "slake_host_compose_is_well_typed"
        "COMPOSE_C_HEADER_BEGIN"
        "COMPOSE_C_BODY_BEGIN"
        "EmitCompose"
      ];
    }
    {
      # HOST-EMIT-PLAN durable emit plan product text.
      rel = "src/systems/emit/host_emit_plan.ssot.txt";
      all = [
        "HOST-EMIT-PLAN"
        "NON-SSOT"
        "SELF-HOST-EMIT-PLAN"
        "SLAKE_SELF_HOST_EMIT_PLAN_V0"
        "EMIT_PLAN_V0"
        "slake_emit_plan"
        "slake_emit_plan_from_compose"
        "slake_emit_plan_is_ready"
        "PLAN_C_HEADER_BEGIN"
        "PLAN_C_BODY_BEGIN"
        "EmitPlan"
      ];
    }
    {
      # HOST-EMIT-APPLY durable emit apply product text.
      rel = "src/systems/emit/host_emit_apply.ssot.txt";
      all = [
        "HOST-EMIT-APPLY"
        "NON-SSOT"
        "SELF-HOST-EMIT-APPLY"
        "SLAKE_SELF_HOST_EMIT_APPLY_V0"
        "EMIT_APPLY_V0"
        "SLAKE_EMIT_APPLY_CAP"
        "slake_emit_apply"
        "slake_emit_apply_from_compose"
        "slake_emit_apply_is_valid"
        "APPLY_C_HEADER_BEGIN"
        "APPLY_C_BODY_BEGIN"
        "EmitApply"
      ];
    }
    {
      # HOST-EMIT-BANNER durable banner / version product text.
      rel = "src/systems/emit/host_emit_banner.ssot.txt";
      all = [
        "HOST-EMIT-BANNER"
        "NON-SSOT"
        "SELF-HOST-EMIT-BANNER"
        "SLAKE_SELF_HOST_EMIT_BANNER_V0"
        "slake_emit_version"
        "slake_unit_translation_id"
        "UNIT_TRANSLATION_V0"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "BANNER_C_HEADER_BEGIN"
        "BANNER_C_BODY_BEGIN"
        "EmitBanner"
      ];
    }
    {
      rel = "src/systems/SystemsLean.lean";
      all = [
        "import SystemsLean.Mult"
        "import SystemsLean.MultTheorems"
        "import SystemsLean.Linear"
        "import SystemsLean.LinearTheorems"
        "import SystemsLean.Types"
        "import SystemsLean.IrProgram"
        "import SystemsLean.IrProgramTheorems"
        "import SystemsLean.Erasure"
        "import SystemsLean.ErasureTheorems"
        "import SystemsLean.Extract"
        "import SystemsLean.ExtractTheorems"
        "import SystemsLean.IrGraph"
        "import SystemsLean.IrGraphTheorems"
        "import SystemsLean.HostCompose"
        "import SystemsLean.EmitPlan"
        "import SystemsLean.EmitApply"
        "import SystemsLean.EmitBody"
        "import SystemsLean.EmitBanner"
        "import SystemsLean.CompilePath"
        "import SystemsLean.JoinMap"
        "import SystemsLean.SelfHost"
        "import SystemsLean.SelfHostTheorems"
        "import SystemsLean.SurfaceMatrix"
        "import SystemsLean.KernelMult"
        "import SystemsLean.KernelMultTheorems"
        "import SystemsLean.EmitMult"
        "import SystemsLean.EmitLinear"
        "import SystemsLean.EmitErasure"
        "import SystemsLean.EmitExtract"
        "import SystemsLean.EmitTypes"
        "import SystemsLean.EmitProgram"
        "import SystemsLean.EmitGraph"
        "import SystemsLean.EmitCompose"
        "import SystemsLean.ParityMult"
        "import SystemsLean.ParityMultTheorems"
        "import SystemsLean.KernelLinear"
        "import SystemsLean.KernelLinearTheorems"
        "import SystemsLean.ParityLinear"
        "import SystemsLean.ParityLinearTheorems"
        "import SystemsLean.KernelTypes"
        "import SystemsLean.KernelTypesTheorems"
        "import SystemsLean.ParityTypes"
        "import SystemsLean.ParityTypesTheorems"
        "import SystemsLean.KernelProgram"
        "import SystemsLean.KernelProgramTheorems"
        "import SystemsLean.ParityProgram"
        "import SystemsLean.ParityProgramTheorems"
        "import SystemsLean.KernelEmit"
        "import SystemsLean.KernelEmitTheorems"
        "import SystemsLean.ParityEmit"
        "import SystemsLean.ParityEmitTheorems"
        "import SystemsLean.SelfApply"
        "import SystemsLean.SelfApplyTheorems"
        "import SystemsLean.SelfApplyFs"
        "import SystemsLean.LlvmHold"
        "import SystemsLean.LlvmHoldTheorems"
        "import SystemsLean.InventoryClose"
        "import SystemsLean.InventoryCloseTheorems"
        "import SystemsLean.ProductPath"
        "import SystemsLean.DualResidual"
        "import SystemsLean.DualResidualTheorems"
        "import SystemsLean.ProbeWire"
        "import SystemsLean.ProbeWireTheorems"
        "import SystemsLean.SpecProof"
        "import SystemsLean.SelfHostBody"
        "import SystemsLean.SelfHostBodyTheorems"
      ];
    }
  ];
}
