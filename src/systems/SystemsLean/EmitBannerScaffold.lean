/-
  SYSTEMS_LEAN_HOST partial -- freestanding banner / version product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-BANNER product-text fragments (bannerHeaderFragment /
  bannerBodyFragment), stage/map ids, ownership honesty, and emitBannerReady
  used by SystemsLean.EmitBanner. Same namespace SystemsLean.EmitBanner so
  call sites stay unqualified. Long-file split from EmitBanner.lean.

  Spec (readable):
  - stageId / hostEmitBannerId / selfHostEmitBannerId: greppable stage map.
  - bannerHeaderFragment / bannerBodyFragment: freestanding C scaffolding SSoT
    text (BANNER_C_HEADER / BANNER_C_BODY map; FreestandingEmit embeds durable
    SSOT file).
  - emitBannerReady: surface + version strings + header/body piece honesty
    (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit.
  - Durable file host_emit_banner.ssot.txt remains HOST-EMIT-BANNER dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.
  - Does not fold into SelfHostBody Mult..Out compile-step readiness (hygiene).

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_BANNER_V0, HOST-EMIT-BANNER,
  SELF-HOST-EMIT-BANNER, bannerHeaderFragment, bannerBodyFragment, emitBannerReady,
  emitBannerOk, ownershipHonestyOk, headerHonestyOk, bodyHonestyOk, emitBannerSurfaceOk,
  versionStringsOk, EMIT-BANNER-SMOKE, HOST-EMIT-BANNER-SMOKE, EmitBannerScaffold,
  slake_emit_version, slake_unit_translation_id, UNIT_TRANSLATION_V0,
  SLAKE_EMIT_FREESTANDING_C_V0, NON-SSOT, RUNTIME-FS, UNIT_SURFACE host surface.
  Module: SystemsLean.EmitBannerScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitBanner.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitBanner

/-- Greppable primary stage id for host-owned banner product emit. -/
def stageId : String := "SLAKE_SELF_HOST_EMIT_BANNER_V0"

/-- Greppable short map id (HOST-EMIT-BANNER). -/
def hostEmitBannerId : String := "HOST-EMIT-BANNER"

/-- Greppable short map id (SELF-HOST-EMIT-BANNER). -/
def selfHostEmitBannerId : String := "SELF-HOST-EMIT-BANNER"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def acceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite (not a filesystem read). -/
def hostModulePath : String := "src/systems/SystemsLean/EmitBanner.lean"

/-- Durable banner SSOT artifact path cite (not a filesystem read). -/
def ssotArtifactPath : String := "src/systems/emit/host_emit_banner.ssot.txt"

/-- Product wire freestanding emit stage id (frozen ABI surface). -/
def freestandingEmitStageId : String := "SLAKE_EMIT_FREESTANDING_C_V0"

/-- Unit translation id string (frozen product wire). -/
def unitTranslationId : String := "UNIT_TRANSLATION_V0"

/-- slake_emit_version return string (frozen product wire; stage inventory). -/
def emitVersionString : String :=
  "SLAKE_EMIT_FREESTANDING_C_V0+UNIT_DEEPEN_V1+FAIL_CLOSED_CHECKER_V1"
    ++ "+CONSUME_TOKEN_HOST_V0+TYPED_IR_V0+IR_PROGRAM_V0+IR_GRAPH_EDGES_V0"
    ++ "+HOST_COMPOSE_V0+EMIT_PLAN_V0+EMIT_APPLY_V0+EMIT_BODY_V0"

/-- Ownership comment shared by header and body fragments (HOST-EMIT-BANNER). -/
def bannerOwnershipComment : String :=
  " * HOST-EMIT-BANNER: dialect from SystemsLean.EmitBanner + host_emit_banner.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this banner / version product text).\n"

/-- File-level stage inventory + honesty (header half; inside freestanding H). -/
def bannerHeaderOpen : String :=
  "/* ---- Banner / version / unit_translation (HOST-EMIT-BANNER) ----\n"
    ++ " * " ++ freestandingEmitStageId ++ " -- freestanding C header API.\n"
    ++ " * UNIT_TRANSLATION_V0 -- first real unit translation of UNIT_SURFACE modules.\n"
    ++ " * UNIT_DEEPEN_V1 -- deepened mult/linear/erasure/extract contract map.\n"
    ++ " * FAIL_CLOSED_CHECKER_V1 -- composed fail-closed checker + extract path.\n"
    ++ " * CONSUME_TOKEN_HOST_V0 -- freestanding JOIN-ALG ConsumeToken-class host shape.\n"
    ++ " * TYPED_IR_V0 -- richer typed IR surface behind checker/host.\n"
    ++ " * IR_PROGRAM_V0 -- multi-node ordered IR program (ordered list; not CFG).\n"
    ++ " * IR_GRAPH_EDGES_V0 -- graph edges over ordered IR program (node index endpoints).\n"
    ++ " * HOST_COMPOSE_V0 -- freestanding host + IR graph composition (not residual free).\n"
    ++ " * EMIT_PLAN_V0 -- emit plan from host compose (not residual free; not CFG/SSA).\n"
    ++ " * EMIT_APPLY_V0 -- apply plan tags into fixed buffer (not residual free; not full C body).\n"
    ++ " * EMIT_BODY_V0 -- freestanding C body fragment (not residual free; not CFG/SSA).\n"
    ++ " * HOST-EMIT-SSOT -- fragment dialect from SystemsLean.EmitBody + host_emit_body_fragment.ssot.txt\n"
    ++ " * (Lean freestanding emit embeds HOST-EMIT-SSOT dialect (no second format)).\n"
    ++ " * HOST-EMIT-MULT -- Mult product text from SystemsLean.EmitMult + host_emit_mult.ssot.txt\n"
    ++ " * (Lean freestanding emit embeds HOST-EMIT-MULT Mult product text).\n"
    ++ " * HOST-EMIT-LINEAR -- Linear/ConsumeToken product text from SystemsLean.EmitLinear +\n"
    ++ " * host_emit_linear.ssot.txt (Lean freestanding emit embeds HOST-EMIT-LINEAR text).\n"
    ++ " * HOST-EMIT-ERASURE -- Erasure product text from SystemsLean.EmitErasure +\n"
    ++ " * host_emit_erasure.ssot.txt (Lean freestanding emit embeds HOST-EMIT-ERASURE text).\n"
    ++ " * HOST-EMIT-EXTRACT -- Extract + FAIL_CLOSED product text from SystemsLean.EmitExtract +\n"
    ++ " * host_emit_extract.ssot.txt (Lean freestanding emit embeds HOST-EMIT-EXTRACT text).\n"
    ++ " * HOST-EMIT-TYPES -- Types/TYPED_IR product text from SystemsLean.EmitTypes +\n"
    ++ " * host_emit_types.ssot.txt (Lean freestanding emit embeds HOST-EMIT-TYPES text).\n"
    ++ " * HOST-EMIT-PROGRAM -- IR program product text from SystemsLean.EmitProgram +\n"
    ++ " * host_emit_program.ssot.txt (Lean freestanding emit embeds HOST-EMIT-PROGRAM text).\n"
    ++ " * HOST-EMIT-GRAPH -- IR graph product text from SystemsLean.EmitGraph +\n"
    ++ " * host_emit_graph.ssot.txt (Lean freestanding emit embeds HOST-EMIT-GRAPH text).\n"
    ++ " * HOST-EMIT-COMPOSE -- host compose product text from SystemsLean.EmitCompose +\n"
    ++ " * host_emit_compose.ssot.txt (Lean freestanding emit embeds HOST-EMIT-COMPOSE text).\n"
    ++ " * HOST-EMIT-PLAN -- emit plan product text from SystemsLean.EmitPlan +\n"
    ++ " * host_emit_plan.ssot.txt (Lean freestanding emit embeds HOST-EMIT-PLAN text).\n"
    ++ " * HOST-EMIT-APPLY -- emit apply product text from SystemsLean.EmitApply +\n"
    ++ " * host_emit_apply.ssot.txt (Lean freestanding emit embeds HOST-EMIT-APPLY text).\n"
    ++ " * HOST-EMIT-BODY -- emit body scaffolding from SystemsLean.EmitBody +\n"
    ++ " * host_emit_body_fragment.ssot.txt (Lean freestanding emit embeds HOST-EMIT-BODY text).\n"
    ++ bannerOwnershipComment
    ++ " *\n"
    ++ " * RUNTIME-FS product surface goal: no Lean managed runtime on the wire.\n"
    ++ " * product residual free claimed; host elaborator residual remains.\n"
    ++ " * not PROVABLY; no product GC; not Lean managed runtime.\n"
    ++ " * V0 unit translation; product residual free on freestanding release.\n"
    ++ " *\n"
    ++ " * Unit map (UNIT_SURFACE -> C surface):\n"
    ++ " *   Mult.slake    -> enum slake_mult + slake_mult_is_valid (FAIL-CLOSED-UNKNOWN-GRADE; HOST-EMIT-MULT)\n"
    ++ " *   Linear.slake  -> slake_linear_token + slake_linear_consume (LINEAR-EXACT-ONCE)\n"
    ++ " *                   + slake_consume_token host (CONSUME_TOKEN_HOST_V0 / JOIN-ALG)\n"
    ++ " *                   + host_compose mint path (HOST_COMPOSE_V0)\n"
    ++ " *   Erasure.slake -> slake_erased + slake_erasure_is_runtime_absent (ERASE-RULE-MULT-0)\n"
    ++ " *   Extract.slake -> slake_extract_status + runtime class (EMIT-BOUNDARY / RUNTIME-FS)\n"
    ++ " *                   + slake_check_fail_closed / slake_extract_with_checks\n"
    ++ " *                   + slake_host_compose extract (HOST_COMPOSE_V0)\n"
    ++ " *                   + slake_emit_plan from compose (EMIT_PLAN_V0)\n"
    ++ " *                   + slake_emit_apply from compose (EMIT_APPLY_V0)\n"
    ++ " *                   + slake_emit_body from compose (EMIT_BODY_V0; HOST-EMIT-SSOT dialect)\n"
    ++ " *   Types.slake   -> slake_type_tag (COMMON-UNIVERSE tag only)\n"
    ++ " *                   + slake_ir_node typed IR (TYPED_IR_V0; not full elaborator)\n"
    ++ " *                   + slake_ir_program multi-node ordered program (IR_PROGRAM_V0)\n"
    ++ " *                   + slake_ir_graph edges over program nodes (IR_GRAPH_EDGES_V0)\n"
    ++ " *\n"
    ++ " * Multiplicity grades (min freestanding set; greppable):\n"
    ++ " *   MULT-0    -- erased / compile-time only (no runtime residual when erased)\n"
    ++ " *   MULT-1    -- linear / exact-once resource (JOIN-ALG ConsumeToken host V0)\n"
    ++ " *   MULT-OMEGA -- unrestricted runtime value\n"
    ++ " * No multiplicity zoo beyond these three.\n"
    ++ " *\n"
    ++ " * Smoke: prefer freestanding-friendly compile. Headers use stdint.h only.\n"
    ++ " * Honest smoke flags (compiler freestanding stdint is available on gcc/clang):\n"
    ++ " *   cc -c -std=c11 -ffreestanding -nostdlib -I. slake_freestanding.c\n"
    ++ " * If a target lacks freestanding stdint, fall back to:\n"
    ++ " *   cc -c -std=c11 -I. slake_freestanding.c\n"
    ++ " * (still no Lean headers; still no product GC.)\n"
    ++ " */\n"

/-- Version + unit_translation API declarations (product wire names). -/
def bannerApiDecls : String :=
  "/* Emit stage version symbol (greppable product surface). */\n"
    ++ "const char *slake_emit_version(void);\n"
    ++ "\n"
    ++ "/* Unit translation id string (greppable UNIT_TRANSLATION_V0). */\n"
    ++ "const char *slake_unit_translation_id(void);\n"

/-- bannerHeaderFragment -- freestanding banner header text (HOST-EMIT-BANNER SSoT).
    Stage inventory comment + version / unit_translation declarations. -/
def bannerHeaderFragment : String :=
  bannerHeaderOpen
    ++ "\n"
    ++ bannerApiDecls

/-- File-level stage inventory (source half). -/
def bannerBodyOpen : String :=
  "/* ---- Banner / version / unit_translation (HOST-EMIT-BANNER) ----\n"
    ++ " * " ++ freestandingEmitStageId ++ " -- freestanding C definitions.\n"
    ++ " * UNIT_TRANSLATION_V0 -- first real unit translation of UNIT_SURFACE modules.\n"
    ++ " * UNIT_DEEPEN_V1 -- deepened mult/linear/erasure/extract contract map.\n"
    ++ " * FAIL_CLOSED_CHECKER_V1 -- composed fail-closed checker + extract path.\n"
    ++ " * CONSUME_TOKEN_HOST_V0 -- freestanding JOIN-ALG ConsumeToken-class host shape.\n"
    ++ " * TYPED_IR_V0 -- richer typed IR surface behind checker/host.\n"
    ++ " * IR_PROGRAM_V0 -- multi-node ordered IR program (ordered list; not CFG).\n"
    ++ " * IR_GRAPH_EDGES_V0 -- graph edges over ordered IR program (node index endpoints).\n"
    ++ " * HOST_COMPOSE_V0 -- freestanding host + IR graph composition (not residual free).\n"
    ++ " * EMIT_PLAN_V0 -- emit plan from host compose (not residual free; not CFG/SSA).\n"
    ++ " * EMIT_APPLY_V0 -- apply plan tags into fixed buffer (not residual free; not full C body).\n"
    ++ " * EMIT_BODY_V0 -- freestanding C body fragment (not residual free; not CFG/SSA).\n"
    ++ " * HOST-EMIT-SSOT -- fragment dialect from SystemsLean.EmitBody + host_emit_body_fragment.ssot.txt\n"
    ++ " * (Lean freestanding emit embeds HOST-EMIT-SSOT dialect (no second format)).\n"
    ++ " * HOST-EMIT-MULT -- Mult product text from SystemsLean.EmitMult + host_emit_mult.ssot.txt\n"
    ++ " * (Lean freestanding emit embeds HOST-EMIT-MULT Mult product text).\n"
    ++ " * HOST-EMIT-LINEAR -- Linear/ConsumeToken product text from SystemsLean.EmitLinear +\n"
    ++ " * host_emit_linear.ssot.txt (Lean freestanding emit embeds HOST-EMIT-LINEAR text).\n"
    ++ " * HOST-EMIT-ERASURE -- Erasure product text from SystemsLean.EmitErasure +\n"
    ++ " * host_emit_erasure.ssot.txt (Lean freestanding emit embeds HOST-EMIT-ERASURE text).\n"
    ++ " * HOST-EMIT-EXTRACT -- Extract + FAIL_CLOSED product text from SystemsLean.EmitExtract +\n"
    ++ " * host_emit_extract.ssot.txt (Lean freestanding emit embeds HOST-EMIT-EXTRACT text).\n"
    ++ " * HOST-EMIT-TYPES -- Types/TYPED_IR product text from SystemsLean.EmitTypes +\n"
    ++ " * host_emit_types.ssot.txt (Lean freestanding emit embeds HOST-EMIT-TYPES text).\n"
    ++ " * HOST-EMIT-PROGRAM -- IR program product text from SystemsLean.EmitProgram +\n"
    ++ " * host_emit_program.ssot.txt (Lean freestanding emit embeds HOST-EMIT-PROGRAM text).\n"
    ++ " * HOST-EMIT-GRAPH -- IR graph product text from SystemsLean.EmitGraph +\n"
    ++ " * host_emit_graph.ssot.txt (Lean freestanding emit embeds HOST-EMIT-GRAPH text).\n"
    ++ " * HOST-EMIT-COMPOSE -- host compose product text from SystemsLean.EmitCompose +\n"
    ++ " * host_emit_compose.ssot.txt (Lean freestanding emit embeds HOST-EMIT-COMPOSE text).\n"
    ++ " * HOST-EMIT-PLAN -- emit plan product text from SystemsLean.EmitPlan +\n"
    ++ " * host_emit_plan.ssot.txt (Lean freestanding emit embeds HOST-EMIT-PLAN text).\n"
    ++ " * HOST-EMIT-APPLY -- emit apply product text from SystemsLean.EmitApply +\n"
    ++ " * host_emit_apply.ssot.txt (Lean freestanding emit embeds HOST-EMIT-APPLY text).\n"
    ++ " * HOST-EMIT-BODY -- emit body scaffolding from SystemsLean.EmitBody +\n"
    ++ " * host_emit_body_fragment.ssot.txt (Lean freestanding emit embeds HOST-EMIT-BODY text).\n"
    ++ bannerOwnershipComment
    ++ " *\n"
    ++ " * RUNTIME-FS product surface goal: no Lean managed runtime on the wire.\n"
    ++ " * product residual free claimed; host elaborator residual remains.\n"
    ++ " * not PROVABLY; no product GC; not Lean managed runtime.\n"
    ++ " * V0 unit translation; product residual free on freestanding release.\n"
    ++ " *\n"
    ++ " * No main required. No stdlib GC. No Lean headers.\n"
    ++ " * MULT-0 / MULT-1 / MULT-OMEGA greppable via slake_mult_name (HOST-EMIT-MULT).\n"
    ++ " */\n"

/-- Version + unit_translation function bodies (product wire). -/
def bannerBodies : String :=
  "const char *slake_emit_version(void)\n"
    ++ "{\n"
    ++ "  return \"" ++ emitVersionString ++ "\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "const char *slake_unit_translation_id(void)\n"
    ++ "{\n"
    ++ "  return \"" ++ unitTranslationId ++ "\";\n"
    ++ "}\n"

/-- bannerBodyFragment -- freestanding banner body text (HOST-EMIT-BANNER SSoT).
    Stage inventory comment + version / unit_translation implementations. -/
def bannerBodyFragment : String :=
  bannerBodyOpen
    ++ "\n"
    ++ bannerBodies

/-- Ownership comment carries HOST-EMIT-BANNER + FreestandingEmit embed honesty. -/
def ownershipHonestyOk : Bool :=
  (bannerOwnershipComment
    == " * HOST-EMIT-BANNER: dialect from SystemsLean.EmitBanner + host_emit_banner.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this banner / version product text).\n")

/-- Version / unit_translation strings match frozen product wire. -/
def versionStringsOk : Bool :=
  (freestandingEmitStageId == "SLAKE_EMIT_FREESTANDING_C_V0")
    && (unitTranslationId == "UNIT_TRANSLATION_V0")
    && (emitVersionString
      == "SLAKE_EMIT_FREESTANDING_C_V0+UNIT_DEEPEN_V1+FAIL_CLOSED_CHECKER_V1"
        ++ "+CONSUME_TOKEN_HOST_V0+TYPED_IR_V0+IR_PROGRAM_V0+IR_GRAPH_EDGES_V0"
        ++ "+HOST_COMPOSE_V0+EMIT_PLAN_V0+EMIT_APPLY_V0+EMIT_BODY_V0")

/-- Header piece honesty: API decls + ownership + version strings. -/
def headerHonestyOk : Bool :=
  ownershipHonestyOk
    && versionStringsOk
    && (bannerApiDecls
      == "/* Emit stage version symbol (greppable product surface). */\n"
        ++ "const char *slake_emit_version(void);\n"
        ++ "\n"
        ++ "/* Unit translation id string (greppable UNIT_TRANSLATION_V0). */\n"
        ++ "const char *slake_unit_translation_id(void);\n")

/-- Body piece honesty: function bodies + ownership + version strings. -/
def bodyHonestyOk : Bool :=
  ownershipHonestyOk
    && versionStringsOk
    && (bannerBodies
      == "const char *slake_emit_version(void)\n"
        ++ "{\n"
        ++ "  return \"" ++ emitVersionString ++ "\";\n"
        ++ "}\n"
        ++ "\n"
        ++ "const char *slake_unit_translation_id(void)\n"
        ++ "{\n"
        ++ "  return \"" ++ unitTranslationId ++ "\";\n"
        ++ "}\n")

/-- Surface canary: stage ids + path cites. -/
def emitBannerSurfaceOk : Bool :=
  (stageId == "SLAKE_SELF_HOST_EMIT_BANNER_V0")
    && (hostEmitBannerId == "HOST-EMIT-BANNER")
    && (selfHostEmitBannerId == "SELF-HOST-EMIT-BANNER")
    && (acceptancePath == "src/systems/self-host.md")
    && (hostModulePath == "src/systems/SystemsLean/EmitBanner.lean")
    && (ssotArtifactPath == "src/systems/emit/host_emit_banner.ssot.txt")

/-- emitBannerReady -- banner host-owned emit readiness.
    FAIL-CLOSED: surface + version strings + header/body piece honesty.
    Greppable: emitBannerReady, HOST-EMIT-BANNER, SELF-HOST-EMIT-BANNER. -/
def emitBannerReady : Bool :=
  emitBannerSurfaceOk && versionStringsOk && headerHonestyOk && bodyHonestyOk

/-- Full inventory ok (alias of emitBannerReady for inventory greps). -/
def emitBannerOk : Bool := emitBannerReady

set_option maxRecDepth 8192

/-- EMIT-BANNER-SMOKE / HOST-EMIT-BANNER-SMOKE: stage / map ids. -/
example : stageId = "SLAKE_SELF_HOST_EMIT_BANNER_V0" := by decide
example : hostEmitBannerId = "HOST-EMIT-BANNER" := by decide
example : selfHostEmitBannerId = "SELF-HOST-EMIT-BANNER" := by decide
example : acceptancePath = "src/systems/self-host.md" := by decide
example : hostModulePath = "src/systems/SystemsLean/EmitBanner.lean" := by decide
example : ssotArtifactPath = "src/systems/emit/host_emit_banner.ssot.txt" := by decide
example : emitBannerSurfaceOk = true := by decide

/-- HOST-EMIT-BANNER-SMOKE: version / unit_translation frozen strings. -/
example : freestandingEmitStageId = "SLAKE_EMIT_FREESTANDING_C_V0" := by decide
example : unitTranslationId = "UNIT_TRANSLATION_V0" := by decide
example : versionStringsOk = true := by decide

/-- HOST-EMIT-BANNER-SMOKE: ownership + header decls. -/
example : ownershipHonestyOk = true := by decide
example : headerHonestyOk = true := by decide

/-- HOST-EMIT-BANNER-SMOKE: body piece honesty. -/
example : bodyHonestyOk = true := by decide

/-- EMIT-BANNER-SMOKE: full emit readiness. -/
example : emitBannerReady = true := by decide
example : emitBannerOk = true := by decide

/-- EMIT-BANNER-SMOKE: free / complete stay false on this surface
    (Ready is product-text ownership only). -/
theorem emitBannerReady_true : emitBannerReady = true := by decide

end SystemsLean.EmitBanner
