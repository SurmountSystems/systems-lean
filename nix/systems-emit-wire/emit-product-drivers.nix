# SPDX-License-Identifier: Unlicense
# Data slice for systems-emit-wire emit product. Joined by emit-product.nix; function of apis attrset.
# No bash, no Python in eval.
product:
with product;
rec {

  # Wave B: build + just build live in justfile (scripts deleted).
  # Wave C: Lean FreestandingEmit owns product wire write; bash emit deleted.
  # Compile-path shell stamp deleted: static presence is pure Nix (unit walk +
  # systems-host HOST-COMPILE-PATH / SLAKE_COMPILE_PATH_V1). Stage id
  # SLAKE_COMPILE_PATH_V0 remains greppable in just/product-wire.just as retired-shell honesty.
  requiredDriverAndEmit = [
    "justfile"
    "just/product-wire.just"
    "src/systems/SystemsLean/CompilePath.lean"
    "src/systems/SystemsLean/FreestandingEmit.lean"
    # SSOT load helpers peel (Body + Banner; Mult..Apply on Scaffold).
    "src/systems/SystemsLean/FreestandingEmitLoad.lean"
    "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean"
    # Thin Lake root for slake-emit-freestanding-c (critical path for just build).
    "src/systems/SystemsLean/FreestandingEmitMain.lean"
    "src/systems/lakefile.lean"
    "src/systems/emit/template_slake_freestanding.h.in"
    "src/systems/emit/template_slake_freestanding.c.in"
    emitH
    emitC
    behavioralProbe
    # HOST-EMIT-SSOT durable fragment dialect (Lean buildFragment owner).
    "src/systems/emit/host_emit_body_fragment.ssot.txt"
    # HOST-EMIT-BANNER durable banner / version product text (Lean EmitBanner owner).
    "src/systems/emit/host_emit_banner.ssot.txt"
    # HOST-EMIT-MULT durable Mult product text (Lean EmitMult owner).
    "src/systems/emit/host_emit_mult.ssot.txt"
    # HOST-EMIT-LINEAR durable Linear product text (Lean EmitLinear owner).
    "src/systems/emit/host_emit_linear.ssot.txt"
    # HOST-EMIT-ERASURE durable Erasure product text (Lean EmitErasure owner).
    "src/systems/emit/host_emit_erasure.ssot.txt"
    # HOST-EMIT-EXTRACT durable Extract + FAIL_CLOSED product text (Lean EmitExtract owner).
    "src/systems/emit/host_emit_extract.ssot.txt"
    # HOST-EMIT-TYPES durable Types/TYPED_IR product text (Lean EmitTypes owner).
    "src/systems/emit/host_emit_types.ssot.txt"
    # HOST-EMIT-PROGRAM durable IR program product text (Lean EmitProgram owner).
    "src/systems/emit/host_emit_program.ssot.txt"
    # HOST-EMIT-GRAPH durable IR graph product text (Lean EmitGraph owner).
    "src/systems/emit/host_emit_graph.ssot.txt"
    # HOST-EMIT-COMPOSE durable host compose product text (Lean EmitCompose owner).
    "src/systems/emit/host_emit_compose.ssot.txt"
    # HOST-EMIT-PLAN durable emit plan product text (Lean EmitPlan owner).
    "src/systems/emit/host_emit_plan.ssot.txt"
    # HOST-EMIT-APPLY durable emit apply product text (Lean EmitApply owner).
    "src/systems/emit/host_emit_apply.ssot.txt"
  ];

  optionalFiles = [
    releaseH
    releaseC
  ];

  # Drivers + emit product wire content.
  contentSpecs = [
    {
      # Host-informed compile path (replaces retired shell stamp).
      rel = "src/systems/SystemsLean/CompilePath.lean";
      all = [
        "SLAKE_COMPILE_PATH_V1"
        "HOST-COMPILE-PATH"
        "SYSTEMS_LEAN_HOST"
        "not product C"
      ];
    }
    {
      # Wave B/C: just build owns product wire process glue (modular just/product-wire.just);
      # Lean FreestandingEmit / freestanding-capable path is the emit writer.
      # SLAKE_COMPILE_PATH_V0 = retired shell stamp honesty (no script path).
      rel = "just/product-wire.just";
      all = [
        "SLAKE_COMPILE_PATH_V0"
        "SLAKE_COMPILE_PATH_V1"
        "HOST-COMPILE-PATH"
        "systems-emit-wire"
        "slake-emit"
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmit"
        "product residual free"
        "not PROVABLY"
      ];
    }
    {
      # Lake root for slake-emit-freestanding-c after main split (B13 supporting).
      rel = "src/systems/lakefile.lean";
      all = [
        "slake-emit-freestanding-c"
        "SystemsLean.FreestandingEmitMain"
      ];
    }
    {
      # Thin main forwards to FreestandingEmit; pure-eval file presence for lake root.
      rel = "src/systems/SystemsLean/FreestandingEmitMain.lean";
      all = [
        "FreestandingEmitMain"
        "FreestandingEmit.main"
        "slake-emit-freestanding-c"
        "SLAKE_EMIT_FREESTANDING_C_V0"
      ];
    }
    {
      rel = "src/systems/SystemsLean/FreestandingEmit.lean";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "product residual free"
        "no product GC"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "HOST-EMIT-BANNER"
        "HOST-EMIT-MULT"
        "HOST-EMIT-LINEAR"
        "HOST-EMIT-ERASURE"
        "HOST-EMIT-EXTRACT"
        "EmitExtractScaffold"
        "import SystemsLean.EmitExtractScaffold"
        "extractHeaderFragment"
        "HOST-EMIT-TYPES"
        "EmitTypesScaffold"
        "import SystemsLean.EmitTypesScaffold"
        "typesHeaderFragment"
        "HOST-EMIT-PROGRAM"
        "EmitProgramScaffold"
        "import SystemsLean.EmitProgramScaffold"
        "programHeaderFragment"
        "HOST-EMIT-GRAPH"
        "EmitGraphScaffold"
        "import SystemsLean.EmitGraphScaffold"
        "graphHeaderFragment"
        "HOST-EMIT-COMPOSE"
        "EmitComposeScaffold"
        "import SystemsLean.EmitComposeScaffold"
        "composeHeaderFragment"
        "HOST-EMIT-PLAN"
        "HOST-EMIT-APPLY"
        "planHeaderFragment"
        "EmitPlanScaffold"
        "import SystemsLean.EmitPlanScaffold"
        "applyHeaderFragment"
        "EmitApplyScaffold"
        "import SystemsLean.EmitApplyScaffold"
        # Dual SSOT equality gate (emit-time fail-closed; live pin).
        "DUAL-SSOT-EQUALITY"
        "dualSsotBlockEqual"
        "requireDualSsotEqual"
        "dualSsotEqualityLive"
        "bannerHeaderFragment"
        "multHeaderFragment"
        "bodyHeaderFragment"
        "EmitBodyScaffold"
        "import SystemsLean.EmitBodyScaffold"
        "host_emit_body_fragment.ssot.txt"
        "host_emit_banner.ssot.txt"
        "host_emit_mult.ssot.txt"
        "host_emit_linear.ssot.txt"
        "host_emit_erasure.ssot.txt"
        "host_emit_extract.ssot.txt"
        "host_emit_types.ssot.txt"
        "host_emit_program.ssot.txt"
        "host_emit_graph.ssot.txt"
        "host_emit_compose.ssot.txt"
        "host_emit_plan.ssot.txt"
        "host_emit_apply.ssot.txt"
        "template_slake_freestanding"
        "BODY_C_HEADER"
        "BODY_C_BODY"
        "BANNER_C_HEADER"
        "BANNER_C_BODY"
        "FreestandingEmitLoad"
        "FreestandingEmitLoadScaffold"
        "def renderHeader"
        "def emitAtRoot"
      ];
    }
    {
      # SSOT load peel: Body + Banner + Dual SSOT helpers.
      rel = "src/systems/SystemsLean/FreestandingEmitLoad.lean";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmitLoad"
        "FreestandingEmitLoadScaffold"
        "def stageId : String := \"SLAKE_EMIT_FREESTANDING_C_V0\""
        "def loadBodySsot"
        "def loadBannerSsot"
        "def requireDualSsotEqual"
        "dualSsotBlockEqual"
        "dualSsotEqualityLive"
        "DUAL-SSOT-EQUALITY"
        "BODY_C_HEADER"
        "BODY_C_BODY"
        "BANNER_C_HEADER"
        "BANNER_C_BODY"
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "HOST-EMIT-BANNER"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # Mult..Apply unit SSOT loaders peel (same namespace FreestandingEmit).
      rel = "src/systems/SystemsLean/FreestandingEmitLoadScaffold.lean";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "FreestandingEmitLoadScaffold"
        "SystemsLean.FreestandingEmitLoadScaffold"
        "def loadMultSsot"
        "def loadPlanSsot"
        "def loadApplySsot"
        "HOST-EMIT-MULT"
        "HOST-EMIT-LINEAR"
        "HOST-EMIT-PLAN"
        "HOST-EMIT-APPLY"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitBannerScaffold: HOST-EMIT-BANNER scaffolding split (same namespace EmitBanner).
      rel = "src/systems/SystemsLean/EmitBannerScaffold.lean";
      all = [
        "EmitBannerScaffold"
        "HOST-EMIT-BANNER"
        "SELF-HOST-EMIT-BANNER"
        "SLAKE_SELF_HOST_EMIT_BANNER_V0"
        "def bannerHeaderFragment : String :="
        "def bannerBodyFragment : String :="
        "def emitBannerReady : Bool :="
        "ssotArtifactPath"
        "host_emit_banner.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitMultScaffold: HOST-EMIT-MULT scaffolding split (same namespace EmitMult).
      rel = "src/systems/SystemsLean/EmitMultScaffold.lean";
      all = [
        "EmitMultScaffold"
        "HOST-EMIT-MULT"
        "SELF-HOST-EMIT-MULT"
        "SLAKE_SELF_HOST_EMIT_MULT_V0"
        "def multHeaderFragment : String :="
        "def multBodyFragment : String :="
        "def emitMultReady : Bool :="
        "ssotArtifactPath"
        "host_emit_mult.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitLinearScaffold: HOST-EMIT-LINEAR scaffolding peel (same namespace EmitLinear).
      rel = "src/systems/SystemsLean/EmitLinearScaffold.lean";
      all = [
        "EmitLinearScaffold"
        "HOST-EMIT-LINEAR"
        "SELF-HOST-EMIT-LINEAR"
        "SLAKE_SELF_HOST_EMIT_LINEAR_V0"
        "def linearHeaderFragment : String :="
        "def linearBodyFragment : String :="
        "def emitLinearReady : Bool :="
        "ssotArtifactPath"
        "host_emit_linear.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitErasureScaffold: HOST-EMIT-ERASURE scaffolding split (same namespace EmitErasure).
      rel = "src/systems/SystemsLean/EmitErasureScaffold.lean";
      all = [
        "EmitErasureScaffold"
        "HOST-EMIT-ERASURE"
        "SELF-HOST-EMIT-ERASURE"
        "SLAKE_SELF_HOST_EMIT_ERASURE_V0"
        "def erasureHeaderFragment : String :="
        "def erasureBodyFragment : String :="
        "def emitErasureReady : Bool :="
        "ssotArtifactPath"
        "host_emit_erasure.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitExtractScaffold: HOST-EMIT-EXTRACT scaffolding peel (same namespace EmitExtract).
      rel = "src/systems/SystemsLean/EmitExtractScaffold.lean";
      all = [
        "EmitExtractScaffold"
        "HOST-EMIT-EXTRACT"
        "SELF-HOST-EMIT-EXTRACT"
        "SLAKE_SELF_HOST_EMIT_EXTRACT_V0"
        "def extractHeaderFragment : String :="
        "def extractBodyFragment : String :="
        "def emitExtractReady : Bool :="
        "ssotArtifactPath"
        "host_emit_extract.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitTypesScaffold: HOST-EMIT-TYPES scaffolding peel (same namespace EmitTypes).
      rel = "src/systems/SystemsLean/EmitTypesScaffold.lean";
      all = [
        "EmitTypesScaffold"
        "HOST-EMIT-TYPES"
        "SELF-HOST-EMIT-TYPES"
        "SLAKE_SELF_HOST_EMIT_TYPES_V0"
        "def typesHeaderFragment : String :="
        "def typesBodyFragment : String :="
        "def emitTypesReady : Bool :="
        "ssotArtifactPath"
        "host_emit_types.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitProgramScaffold: HOST-EMIT-PROGRAM scaffolding peel (same namespace EmitProgram).
      rel = "src/systems/SystemsLean/EmitProgramScaffold.lean";
      all = [
        "EmitProgramScaffold"
        "HOST-EMIT-PROGRAM"
        "SELF-HOST-EMIT-PROGRAM"
        "SLAKE_SELF_HOST_EMIT_PROGRAM_V0"
        "def programHeaderFragment : String :="
        "def programBodyFragment : String :="
        "def emitProgramReady : Bool :="
        "ssotArtifactPath"
        "host_emit_program.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitGraphScaffold: HOST-EMIT-GRAPH scaffolding peel (same namespace EmitGraph).
      rel = "src/systems/SystemsLean/EmitGraphScaffold.lean";
      all = [
        "EmitGraphScaffold"
        "HOST-EMIT-GRAPH"
        "SELF-HOST-EMIT-GRAPH"
        "SLAKE_SELF_HOST_EMIT_GRAPH_V0"
        "def graphHeaderFragment : String :="
        "def graphBodyFragment : String :="
        "def emitGraphReady : Bool :="
        "ssotArtifactPath"
        "host_emit_graph.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitComposeScaffold: HOST-EMIT-COMPOSE scaffolding peel (same namespace EmitCompose).
      rel = "src/systems/SystemsLean/EmitComposeScaffold.lean";
      all = [
        "EmitComposeScaffold"
        "HOST-EMIT-COMPOSE"
        "SELF-HOST-EMIT-COMPOSE"
        "SLAKE_SELF_HOST_EMIT_COMPOSE_V0"
        "def composeHeaderFragment : String :="
        "def composeBodyFragment : String :="
        "def emitComposeReady : Bool :="
        "ssotArtifactPath"
        "host_emit_compose.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitPlanScaffold: HOST-EMIT-PLAN scaffolding peel (same namespace EmitPlan).
      rel = "src/systems/SystemsLean/EmitPlanScaffold.lean";
      all = [
        "EmitPlanScaffold"
        "HOST-EMIT-PLAN"
        "SELF-HOST-EMIT-PLAN"
        "SLAKE_SELF_HOST_EMIT_PLAN_V0"
        "def planHeaderFragment : String :="
        "def planBodyFragment : String :="
        "def emitPlanReady : Bool :="
        "planSsotArtifactPath"
        "host_emit_plan.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitApplyScaffold: HOST-EMIT-APPLY scaffolding peel (same namespace EmitApply).
      rel = "src/systems/SystemsLean/EmitApplyScaffold.lean";
      all = [
        "EmitApplyScaffold"
        "HOST-EMIT-APPLY"
        "SELF-HOST-EMIT-APPLY"
        "SLAKE_SELF_HOST_EMIT_APPLY_V0"
        "def applyHeaderFragment : String :="
        "def applyBodyFragment : String :="
        "def emitApplyReady : Bool :="
        "applySsotArtifactPath"
        "host_emit_apply.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # EmitBodyScaffold: HOST-EMIT-BODY scaffolding peel (same namespace EmitBody).
      rel = "src/systems/SystemsLean/EmitBodyScaffold.lean";
      all = [
        "EmitBodyScaffold"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "def bodyHeaderFragment : String :="
        "def bodyBodyFragment : String :="
        "def emitBodyReady : Bool :="
        "bodySsotArtifactPath"
        "host_emit_body_fragment.ssot.txt"
        "not residual free"
        "not PROVABLY"
      ];
    }
    {
      # Thin template shell: SPDX + stage cite + placeholders (banner SSOT-owned).
      rel = "src/systems/emit/template_slake_freestanding.h.in";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "__HOST_EMIT_BANNER_HEADER__"
        "__HOST_EMIT_MULT_HEADER__"
        "__HOST_EMIT_LINEAR_HEADER__"
        "__HOST_EMIT_ERASURE_HEADER__"
        "__HOST_EMIT_EXTRACT_HEADER__"
        "__HOST_EMIT_TYPES_HEADER__"
        "__HOST_EMIT_PROGRAM_HEADER__"
        "__HOST_EMIT_GRAPH_HEADER__"
        "__HOST_EMIT_COMPOSE_HEADER__"
        "__HOST_EMIT_PLAN_HEADER__"
        "__HOST_EMIT_APPLY_HEADER__"
        "__HOST_EMIT_BODY_HEADER__"
      ];
    }
    {
      # Thin template shell: SPDX + stage cite + placeholders (banner SSOT-owned).
      rel = "src/systems/emit/template_slake_freestanding.c.in";
      all = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
        "__HOST_EMIT_BANNER_BODY__"
        "__HOST_EMIT_MULT_BODY__"
        "__HOST_EMIT_LINEAR_BODY__"
        "__HOST_EMIT_ERASURE_BODY__"
        "__HOST_EMIT_EXTRACT_BODY__"
        "__HOST_EMIT_TYPES_BODY__"
        "__HOST_EMIT_PROGRAM_BODY__"
        "__HOST_EMIT_GRAPH_BODY__"
        "__HOST_EMIT_COMPOSE_BODY__"
        "__HOST_EMIT_PLAN_BODY__"
        "__HOST_EMIT_APPLY_BODY__"
        "__HOST_EMIT_BODY_BODY__"
      ];
    }
    {
      # HOST-EMIT-SSOT + HOST-EMIT-BODY: dialect keys + body scaffolding for EMIT_BODY_V0.
      rel = "src/systems/emit/host_emit_body_fragment.ssot.txt";
      all = [
        "HOST-EMIT-SSOT"
        "HOST-EMIT-BODY"
        "SELF-HOST-EMIT-BODY"
        "SLAKE_SELF_HOST_EMIT_BODY_V0"
        "EMPTY_FRAGMENT"
        "HEADER_OPEN"
        "/* EMIT_BODY_V0 RUNTIME-FS r=0 e=0 */"
        "NON-SSOT"
        "BODY_C_HEADER_BEGIN"
        "BODY_C_BODY_BEGIN"
        "slake_emit_body_put_char"
        "slake_emit_body_put_u8"
        "slake_emit_body_from_compose"
        "SLAKE_EMIT_BODY_CAP"
      ];
    }
    {
      # HOST-EMIT-BANNER: banner / version / unit_translation owned by Lean EmitBanner.
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
      ];
    }
    {
      # HOST-EMIT-MULT: Mult product C text owned by Lean EmitMult (SH2).
      rel = "src/systems/emit/host_emit_mult.ssot.txt";
      all = [
        "HOST-EMIT-MULT"
        "NON-SSOT"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "slake_mult_is_valid"
        "MULT_C_HEADER_BEGIN"
        "MULT_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-LINEAR: Linear product C text owned by Lean EmitLinear.
      rel = "src/systems/emit/host_emit_linear.ssot.txt";
      all = [
        "HOST-EMIT-LINEAR"
        "NON-SSOT"
        "LINEAR-EXACT-ONCE"
        "CONSUME_TOKEN_HOST_V0"
        "JOIN-ALG"
        "slake_linear_consume"
        "slake_consume_token_consume"
        "LINEAR_C_HEADER_BEGIN"
        "LINEAR_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-ERASURE: Erasure product C text owned by Lean EmitErasure.
      rel = "src/systems/emit/host_emit_erasure.ssot.txt";
      all = [
        "HOST-EMIT-ERASURE"
        "NON-SSOT"
        "ERASE-RULE-MULT-0"
        "ERASE-NO-RUNTIME"
        "slake_erased"
        "slake_erased_mark"
        "slake_erasure_is_runtime_absent"
        "ERASURE_C_HEADER_BEGIN"
        "ERASURE_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-EXTRACT: Extract + FAIL_CLOSED product C text owned by Lean EmitExtract.
      rel = "src/systems/emit/host_emit_extract.ssot.txt";
      all = [
        "HOST-EMIT-EXTRACT"
        "NON-SSOT"
        "FAIL_CLOSED_CHECKER_V1"
        "EMIT-BOUNDARY"
        "RUNTIME-FS"
        "slake_extract_status"
        "slake_check_bundle"
        "slake_check_fail_closed"
        "slake_extract_with_checks"
        "EXTRACT_C_HEADER_BEGIN"
        "EXTRACT_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-TYPES: Types/TYPED_IR product C text owned by Lean EmitTypes.
      rel = "src/systems/emit/host_emit_types.ssot.txt";
      all = [
        "HOST-EMIT-TYPES"
        "NON-SSOT"
        "TYPED_IR_V0"
        "COMMON-UNIVERSE"
        "slake_type_tag"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "TYPES_C_HEADER_BEGIN"
        "TYPES_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-PROGRAM: IR program product C text owned by Lean EmitProgram.
      rel = "src/systems/emit/host_emit_program.ssot.txt";
      all = [
        "HOST-EMIT-PROGRAM"
        "NON-SSOT"
        "IR_PROGRAM_V0"
        "SLAKE_IR_PROGRAM_CAP"
        "slake_ir_program"
        "slake_ir_program_init"
        "slake_ir_program_push"
        "slake_ir_program_is_well_typed"
        "PROGRAM_C_HEADER_BEGIN"
        "PROGRAM_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-GRAPH: IR graph product C text owned by Lean EmitGraph.
      rel = "src/systems/emit/host_emit_graph.ssot.txt";
      all = [
        "HOST-EMIT-GRAPH"
        "NON-SSOT"
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
      ];
    }
    {
      # HOST-EMIT-COMPOSE: host compose product C text owned by Lean EmitCompose.
      rel = "src/systems/emit/host_emit_compose.ssot.txt";
      all = [
        "HOST-EMIT-COMPOSE"
        "NON-SSOT"
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
      ];
    }
    {
      # HOST-EMIT-PLAN: emit plan product C text owned by Lean EmitPlan.
      rel = "src/systems/emit/host_emit_plan.ssot.txt";
      all = [
        "HOST-EMIT-PLAN"
        "NON-SSOT"
        "EMIT_PLAN_V0"
        "slake_emit_plan"
        "slake_emit_plan_from_compose"
        "slake_emit_plan_is_ready"
        "PLAN_C_HEADER_BEGIN"
        "PLAN_C_BODY_BEGIN"
      ];
    }
    {
      # HOST-EMIT-APPLY: emit apply product C text owned by Lean EmitApply.
      rel = "src/systems/emit/host_emit_apply.ssot.txt";
      all = [
        "HOST-EMIT-APPLY"
        "NON-SSOT"
        "EMIT_APPLY_V0"
        "SLAKE_EMIT_APPLY_CAP"
        "slake_emit_apply"
        "slake_emit_apply_from_compose"
        "slake_emit_apply_is_valid"
        "APPLY_C_HEADER_BEGIN"
        "APPLY_C_BODY_BEGIN"
      ];
    }
    {
      rel = emitH;
      all = emitProductAll;
      none = emitProductNone;
    }
    {
      rel = emitC;
      all = emitProductAll;
      none = emitProductNone;
    }
    {
      # Smoke debt only -- fail closed if probe stripped; not product wire growth.
      # HOST-PARITY-MULT (SH3): product Mult name / is_known / enum tag parity.
      # HOST-PARITY-LINEAR: product Linear / CONSUME_TOKEN path honesty labels.
      # HOST-PARITY-TYPES: product TYPED_IR / slake_ir_node path honesty labels.
      # HOST-PARITY-PROGRAM: product IR_PROGRAM / IR_GRAPH / HOST_COMPOSE path
      # honesty labels (Mult+Linear+Types+Program freestanding path).
      # HOST-PARITY-EMIT: product EMIT_PLAN / EMIT_APPLY / EMIT_BODY path
      # honesty labels (Mult+Linear+Types+Program+Emit freestanding path).
      rel = behavioralProbe;
      all = [
        "slake_freestanding.h"
        "UNIT_TRANSLATION_V0"
        "UNIT_DEEPEN_V1"
        "slake_emit_body_is_valid"
        "main"
        "HOST-PARITY-MULT"
        "SELF-HOST-PARITY-MULT"
        "SLAKE_SELF_HOST_PARITY_MULT_V0"
        "PARITY-MULT-SMOKE"
        "slake_mult_name"
        "slake_mult_is_known"
        "MULT-0"
        "MULT-1"
        "MULT-OMEGA"
        "HOST-PARITY-LINEAR"
        "SELF-HOST-PARITY-LINEAR"
        "SLAKE_SELF_HOST_PARITY_LINEAR_V0"
        "PARITY-LINEAR-SMOKE"
        "slake_linear_token_init"
        "slake_linear_consume"
        "slake_consume_token_mint"
        "CONSUME_TOKEN_HOST_V0"
        "HOST-PARITY-TYPES"
        "SELF-HOST-PARITY-TYPES"
        "SLAKE_SELF_HOST_PARITY_TYPES_V0"
        "PARITY-TYPES-SMOKE"
        "TYPED_IR_V0"
        "slake_ir_node"
        "slake_ir_node_init"
        "slake_ir_node_is_well_typed"
        "slake_ir_node_check_fail_closed"
        "HOST-PARITY-PROGRAM"
        "SELF-HOST-PARITY-PROGRAM"
        "SLAKE_SELF_HOST_PARITY_PROGRAM_V0"
        "PARITY-PROGRAM-SMOKE"
        "IR_PROGRAM_V0"
        "IR_GRAPH_EDGES_V0"
        "HOST_COMPOSE_V0"
        "slake_ir_program"
        "slake_ir_graph"
        "slake_host_compose"
        "HOST-PARITY-EMIT"
        "SELF-HOST-PARITY-EMIT"
        "SLAKE_SELF_HOST_PARITY_EMIT_V0"
        "PARITY-EMIT-SMOKE"
        "EMIT_PLAN_V0"
        "EMIT_APPLY_V0"
        "EMIT_BODY_V0"
        "slake_emit_plan"
        "slake_emit_apply"
        "slake_emit_body"
      ];
      none = [
        "SLAKE_EMIT_FREESTANDING_C_V0"
      ];
    }
  ];

  optionalContentSpecs = [
    {
      rel = releaseH;
      all = releaseAll;
      none = releaseNone;
    }
    {
      rel = releaseC;
      all = releaseAll;
      none = releaseNone;
    }
  ];

}
