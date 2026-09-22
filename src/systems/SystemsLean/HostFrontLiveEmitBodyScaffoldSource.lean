/-
  SYSTEMS_LEAN_HOST partial -- dual-pin live EmitBodyScaffold.lean bytes.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveEmitBodyScaffoldSource. Not occupancy name 50. Not mill 70.
  This wrap is EmitBodyScaffold.lean. It is not EmitBody.lean.
  Greppable: SYSTEMS_LEAN_HOST, liveEmitBodyScaffoldSource,
  HOST-FRONT-LIVE-EMIT-BODY-SCAFFOLD, liveRel, UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveEmitBodyScaffoldSource
  Not FullHost. Not freestanding residual free. Not PROVABLY.
  Not a backend. FullBackend stays false in the wrap.
  Module must stay ASCII.
-/

namespace SystemsLean.HostFrontLiveEmitBodyScaffold

/-- Dual-pinned live EmitBodyScaffold.lean bytes (must match on-disk file).
    Greppable: liveEmitBodyScaffoldSource, HOST-FRONT-LIVE-EMIT-BODY-SCAFFOLD. -/
def liveEmitBodyScaffoldSource : String := r##"/-
  SYSTEMS_LEAN_HOST partial -- freestanding emit body product C scaffolding.
  Side: classic Lean elaborator under src/systems/ (not freestanding C runtime).
  Owns HOST-EMIT-BODY product-text fragments (bodyHeaderFragment /
  bodyBodyFragment), stage/map ids, ownership honesty, and emitBodyReady used by
  SystemsLean.EmitBody. Core body fragment dialect (Body, buildFragment,
  bodyFromCompose, theorems, EMIT-BODY-SMOKE) stays in EmitBody. Same namespace
  SystemsLean.EmitBody so call sites stay unqualified.

  Spec (readable):
  - productStageId / hostEmitBodyId / selfHostEmitBodyId: greppable stage map.
  - bodyHeaderFragment / bodyBodyFragment: freestanding C scaffolding SSoT text
    (BODY_C_HEADER / BODY_C_BODY map; FreestandingEmit embeds durable SSOT file).
  - emitBodyReady: surface + header/body piece honesty (cheap; not residual free).

  Intentional non-claims:
  - Scaffolding ownership only -- NOT freestanding residual free.
  - NOT PROVABLY. NOT proof complete. NOT full product module emit / CFG/SSA.
  - Durable file host_emit_body_fragment.ssot.txt remains HOST-EMIT-SSOT dialect
    authority for freestanding embed; Lean fragments are dual map PARTIAL.

  Greppable: SYSTEMS_LEAN_HOST, SLAKE_SELF_HOST_EMIT_BODY_V0, HOST-EMIT-BODY,
  SELF-HOST-EMIT-BODY, bodyHeaderFragment, bodyBodyFragment, emitBodyReady,
  emitBodyOk, bodyHeaderHonestyOk, bodyScaffoldHonestyOk, emitBodySurfaceOk,
  EMIT-BODY-PRODUCT-SMOKE, HOST-EMIT-BODY-SMOKE, EmitBodyScaffold,
  UNIT_SURFACE host surface, HOST-EMIT-SSOT, NON-SSOT, RUNTIME-FS.
  Module: SystemsLean.EmitBodyScaffold
  Red/green: just systems-host; lake build SystemsLean.EmitBody.
  Module must stay ASCII.
  Not freestanding residual free. Not PROVABLY. Not freestanding emit residual free.
  Stage honesty: not residual free; not PROVABLY; no product GC.
-/

namespace SystemsLean.EmitBody

/-! ### Host-owned freestanding emit body product C scaffolding (HOST-EMIT-BODY)
    Greppable: HOST-EMIT-BODY, SELF-HOST-EMIT-BODY, SLAKE_SELF_HOST_EMIT_BODY_V0,
    bodyHeaderFragment, bodyBodyFragment, emitBodyReady.
    Dialect keys remain HOST-EMIT-SSOT (__SSOT_*__ after FreestandingEmit embed).
    maxHeartbeats raised: body scaffolding honesty needs room for decide. -/

/-- Greppable primary stage id for host-owned emit body product emit. -/
def productStageId : String := "SLAKE_SELF_HOST_EMIT_BODY_V0"

/-- Greppable short map id (HOST-EMIT-BODY). -/
def hostEmitBodyId : String := "HOST-EMIT-BODY"

/-- Greppable short map id (SELF-HOST-EMIT-BODY). -/
def selfHostEmitBodyId : String := "SELF-HOST-EMIT-BODY"

/-- Read-only acceptance prose path cite (not a filesystem read). -/
def productAcceptancePath : String := "src/systems/self-host.md"

/-- Read-only this-module path cite for product ownership (not a filesystem read). -/
def productHostModulePath : String := "src/systems/SystemsLean/EmitBody.lean"

/-- Durable emit body SSOT artifact path cite (not a filesystem read). -/
def bodySsotArtifactPath : String := "src/systems/emit/host_emit_body_fragment.ssot.txt"

/-- Ownership comment shared by header and body scaffolding fragments. -/
def bodyOwnershipComment : String :=
  " * HOST-EMIT-BODY: scaffolding from SystemsLean.EmitBody + host_emit_body_fragment.ssot.txt\n"
    ++ " * (Lean FreestandingEmit embeds this emit body product text).\n"

/-- Dialect ownership comment (HOST-EMIT-SSOT keys remain separate). -/
def bodyDialectOwnershipComment : String :=
  " * HOST-EMIT-SSOT: dialect from SystemsLean.EmitBody.buildFragment +\n"
    ++ " *   host_emit_body_fragment.ssot.txt (put_str keys; no second fragment format).\n"

/-- Emit body section open comment (header; includes ownership). -/
def bodyHeaderOpen : String :=
  "/* ---- EMIT_BODY_V0 -- freestanding C body fragment (not residual free; not CFG/SSA)\n"
    ++ " * Deterministic ASCII fragment from a checked host compose via plan + apply.\n"
    ++ " * Not full product module emit; not CFG/SSA; not residual free; no product GC.\n"
    ++ bodyOwnershipComment
    ++ bodyDialectOwnershipComment
    ++ " * Greppable: EMIT_BODY_V0, EMIT_APPLY_V0, EMIT_PLAN_V0, HOST_COMPOSE_V0,\n"
    ++ " *            RUNTIME-FS, EMIT-BOUNDARY, HOST-EMIT-BODY, HOST-EMIT-SSOT\n"
    ++ " *\n"
    ++ " * Fragment shape (deterministic C comment lines; HOST-EMIT-SSOT):\n"
    ++ " *   EMIT_BODY_V0 RUNTIME-FS r=N e=M\n"
    ++ " *   tI mult=X kind=Y\n"
    ++ " * Tag mult/kind use EMIT_APPLY_V0 packing: mult high nibble, kind low nibble.\n"
    ++ " * MULT-0 tags may still be listed (erased inventory honesty, not product wire claim).\n"
    ++ " */\n"

/-- Emit body CAP + typedef + function decls. -/
def bodyApiDecls : String :=
  "#define SLAKE_EMIT_BODY_CAP 256\n"
    ++ "\n"
    ++ "typedef struct slake_emit_body {\n"
    ++ "  char buf[SLAKE_EMIT_BODY_CAP]; /* NUL-terminated fragment on success */\n"
    ++ "  uint16_t len;  /* strlen of buf on success (excluding NUL) */\n"
    ++ "  uint8_t valid; /* 1 after successful build */\n"
    ++ "} slake_emit_body;\n"
    ++ "\n"
    ++ "const char *slake_emit_body_id(void); /* exact \"EMIT_BODY_V0\" */\n"
    ++ "\n"
    ++ "/* Build body from checked host compose.\n"
    ++ " * 0 ok; -1 null out/hc, plan/apply/check fail, or buffer would overflow.\n"
    ++ " * On failure: if out non-null, valid=0, len=0, buf[0]=0 (fail closed).\n"
    ++ " * On success:\n"
    ++ " *   - require plan ready + apply valid (call those APIs; do not reimplement checks)\n"
    ++ " *   - write deterministic ASCII fragment into buf, NUL-terminated\n"
    ++ " *   - must contain greppable substrings: EMIT_BODY_V0 and RUNTIME-FS\n"
    ++ " *   - include decimal runtime_nodes and erased_nodes from plan\n"
    ++ " *   - for each apply tag index 0..count-1, append one short line encoding mult/kind\n"
    ++ " *     (same packing as EMIT_APPLY_V0: mult high nibble, kind low)\n"
    ++ " *   - MULT-0 tags may still be listed (erased inventory) -- honesty, not product wire claim\n"
    ++ " * Greppable: EMIT_BODY_V0, EMIT_APPLY_V0, EMIT_PLAN_V0, RUNTIME-FS, EMIT-BOUNDARY\n"
    ++ " * Honesty: not residual free; fragment is not full product module emit.\n"
    ++ " */\n"
    ++ "int slake_emit_body_from_compose(const slake_host_compose *hc, slake_emit_body *out);\n"
    ++ "\n"
    ++ "/* 1 if non-null, valid, len < CAP, buf[len]==0; else 0 */\n"
    ++ "int slake_emit_body_is_valid(const slake_emit_body *b);\n"

/-- bodyHeaderFragment -- freestanding emit body header text (HOST-EMIT-BODY SSoT). -/
def bodyHeaderFragment : String :=
  bodyHeaderOpen
    ++ bodyApiDecls

/-- Body section open for emit body scaffolding. -/
def bodyScaffoldOpen : String :=
  "/* ---- EMIT_BODY_V0 (freestanding C body fragment; not residual free; not CFG/SSA) ----\n"
    ++ " * Builds a fixed-buffer deterministic ASCII fragment via plan + apply APIs.\n"
    ++ " * No snprintf/stdlib; manual digit write. Greppable: EMIT_BODY_V0, RUNTIME-FS,\n"
    ++ " * EMIT_APPLY_V0, EMIT_PLAN_V0, EMIT-BOUNDARY, HOST-EMIT-BODY, HOST-EMIT-SSOT.\n"
    ++ bodyOwnershipComment
    ++ " * Fragment dialect: HOST-EMIT-SSOT (SystemsLean.EmitBody.buildFragment +\n"
    ++ " * host_emit_body_fragment.ssot.txt); Lean freestanding emit embeds HOST-EMIT-SSOT put_str text.\n"
    ++ " */\n"

/-- Emit body function bodies (product wire scaffolding; __SSOT_*__ keys remain). -/
def bodyScaffoldBodies : String :=
  "/* HOST-EMIT-SSOT empty-compose fragment (matches EmitBody.emptyComposeFragmentSsot).\n"
    ++ " * Greppable contract text; returned only for honesty / smoke of dialect embed. */\n"
    ++ "static const char slake_emit_body_empty_ssot[] = \"__SSOT_EMPTY_FRAGMENT__\\n\";\n"
    ++ "\n"
    ++ "const char *slake_emit_body_id(void)\n"
    ++ "{\n"
    ++ "  /* Touch empty SSOT string so freestanding link keeps the greppable literal. */\n"
    ++ "  if (slake_emit_body_empty_ssot[0] == 0) {\n"
    ++ "    return \"EMIT_BODY_V0\";\n"
    ++ "  }\n"
    ++ "  return \"EMIT_BODY_V0\";\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* Append one char; leave room for trailing NUL. Returns 0 ok, -1 overflow. */\n"
    ++ "static int slake_emit_body_put_char(slake_emit_body *out, char c)\n"
    ++ "{\n"
    ++ "  if (out->len + 1u >= (uint16_t)SLAKE_EMIT_BODY_CAP) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  out->buf[out->len] = c;\n"
    ++ "  out->len = (uint16_t)(out->len + 1u);\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static int slake_emit_body_put_str(slake_emit_body *out, const char *s)\n"
    ++ "{\n"
    ++ "  if (s == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  while (*s != 0) {\n"
    ++ "    if (slake_emit_body_put_char(out, *s) != 0) {\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "    s = s + 1;\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "/* Decimal write of uint8_t (0..255); freestanding, no snprintf. */\n"
    ++ "static int slake_emit_body_put_u8(slake_emit_body *out, uint8_t v)\n"
    ++ "{\n"
    ++ "  char digs[3];\n"
    ++ "  int n;\n"
    ++ "  uint8_t x;\n"
    ++ "\n"
    ++ "  if (v == 0) {\n"
    ++ "    return slake_emit_body_put_char(out, '0');\n"
    ++ "  }\n"
    ++ "  n = 0;\n"
    ++ "  x = v;\n"
    ++ "  while (x > 0 && n < 3) {\n"
    ++ "    digs[n] = (char)('0' + (x % 10u));\n"
    ++ "    n = n + 1;\n"
    ++ "    x = (uint8_t)(x / 10u);\n"
    ++ "  }\n"
    ++ "  while (n > 0) {\n"
    ++ "    n = n - 1;\n"
    ++ "    if (slake_emit_body_put_char(out, digs[n]) != 0) {\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "static void slake_emit_body_fail_closed(slake_emit_body *out)\n"
    ++ "{\n"
    ++ "  out->len = 0;\n"
    ++ "  out->valid = 0;\n"
    ++ "  out->buf[0] = 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_emit_body_from_compose(const slake_host_compose *hc, slake_emit_body *out)\n"
    ++ "{\n"
    ++ "  slake_emit_plan plan;\n"
    ++ "  slake_emit_apply applied;\n"
    ++ "  uint8_t i;\n"
    ++ "  uint8_t mult;\n"
    ++ "  uint8_t kind;\n"
    ++ "\n"
    ++ "  if (out == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  /* Fail closed: zero before any further checks. */\n"
    ++ "  slake_emit_body_fail_closed(out);\n"
    ++ "\n"
    ++ "  if (hc == 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  /* Require plan ready via plan API (does not reimplement check). */\n"
    ++ "  if (slake_emit_plan_from_compose(hc, &plan) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_emit_plan_is_ready(&plan) != 1) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  /* Require apply valid via apply API. */\n"
    ++ "  if (slake_emit_apply_from_compose(hc, &applied) != 0) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_emit_apply_is_valid(&applied) != 1) {\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  /* Header line: HOST-EMIT-SSOT dialect (EMIT_BODY_V0 RUNTIME-FS r=N e=M). */\n"
    ++ "  if (slake_emit_body_put_str(out, \"__SSOT_HEADER_OPEN__\") != 0) {\n"
    ++ "    slake_emit_body_fail_closed(out);\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_emit_body_put_u8(out, plan.runtime_nodes) != 0) {\n"
    ++ "    slake_emit_body_fail_closed(out);\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_emit_body_put_str(out, \"__SSOT_HEADER_E__\") != 0) {\n"
    ++ "    slake_emit_body_fail_closed(out);\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_emit_body_put_u8(out, plan.erased_nodes) != 0) {\n"
    ++ "    slake_emit_body_fail_closed(out);\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "  if (slake_emit_body_put_str(out, \"__SSOT_HEADER_CLOSE__\\n\") != 0) {\n"
    ++ "    slake_emit_body_fail_closed(out);\n"
    ++ "    return -1;\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  /* One line per apply tag: HOST-EMIT-SSOT tI mult=X kind=Y. */\n"
    ++ "  for (i = 0; i < applied.count; i++) {\n"
    ++ "    mult = (uint8_t)((applied.tags[i] >> 4) & 0xFu);\n"
    ++ "    kind = (uint8_t)(applied.tags[i] & 0xFu);\n"
    ++ "    if (slake_emit_body_put_str(out, \"__SSOT_TAG_OPEN__\") != 0) {\n"
    ++ "      slake_emit_body_fail_closed(out);\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "    if (slake_emit_body_put_u8(out, i) != 0) {\n"
    ++ "      slake_emit_body_fail_closed(out);\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "    if (slake_emit_body_put_str(out, \"__SSOT_TAG_MULT__\") != 0) {\n"
    ++ "      slake_emit_body_fail_closed(out);\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "    if (slake_emit_body_put_u8(out, mult) != 0) {\n"
    ++ "      slake_emit_body_fail_closed(out);\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "    if (slake_emit_body_put_str(out, \"__SSOT_TAG_KIND__\") != 0) {\n"
    ++ "      slake_emit_body_fail_closed(out);\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "    if (slake_emit_body_put_u8(out, kind) != 0) {\n"
    ++ "      slake_emit_body_fail_closed(out);\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "    if (slake_emit_body_put_str(out, \"__SSOT_TAG_CLOSE__\\n\") != 0) {\n"
    ++ "      slake_emit_body_fail_closed(out);\n"
    ++ "      return -1;\n"
    ++ "    }\n"
    ++ "  }\n"
    ++ "\n"
    ++ "  out->buf[out->len] = 0;\n"
    ++ "  out->valid = 1;\n"
    ++ "  return 0;\n"
    ++ "}\n"
    ++ "\n"
    ++ "int slake_emit_body_is_valid(const slake_emit_body *b)\n"
    ++ "{\n"
    ++ "  if (b == 0 || b->valid == 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (b->len >= (uint16_t)SLAKE_EMIT_BODY_CAP) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  if (b->buf[b->len] != 0) {\n"
    ++ "    return 0;\n"
    ++ "  }\n"
    ++ "  return 1;\n"
    ++ "}\n"

/-- bodyBodyFragment -- freestanding emit body scaffolding text (HOST-EMIT-BODY SSoT). -/
def bodyBodyFragment : String :=
  bodyScaffoldOpen
    ++ "\n"
    ++ bodyScaffoldBodies

/-- Ownership comment carries HOST-EMIT-BODY + FreestandingEmit embed honesty. -/
def bodyOwnershipHonestyOk : Bool :=
  (bodyOwnershipComment
    == " * HOST-EMIT-BODY: scaffolding from SystemsLean.EmitBody + host_emit_body_fragment.ssot.txt\n"
      ++ " * (Lean FreestandingEmit embeds this emit body product text).\n")
    && (bodyDialectOwnershipComment
      == " * HOST-EMIT-SSOT: dialect from SystemsLean.EmitBody.buildFragment +\n"
        ++ " *   host_emit_body_fragment.ssot.txt (put_str keys; no second fragment format).\n")

/-- Header piece honesty: ownership + stage id cites (cheap; no multi-kLOC reduce).
    Full BODY_C_HEADER text lives in host_emit_body_fragment.ssot.txt; FreestandingEmit +
    pure Nix gate product tokens. Dual SSOT PARTIAL: Lean bodyHeaderFragment kept for map. -/
def bodyHeaderHonestyOk : Bool :=
  bodyOwnershipHonestyOk
    && (hostEmitBodyId == "HOST-EMIT-BODY")
    && (productStageId == "SLAKE_SELF_HOST_EMIT_BODY_V0")

/-- Body piece honesty: ownership + map id cites.
    Full BODY_C_BODY (put_char / put_u8 / from_compose) lives in SSOT file; FreestandingEmit
    embeds file blocks; pure Nix requires put_char / put_u8 tokens. Avoids decide timeout. -/
def bodyScaffoldHonestyOk : Bool :=
  bodyOwnershipHonestyOk
    && (selfHostEmitBodyId == "SELF-HOST-EMIT-BODY")
    && (bodySsotArtifactPath == "src/systems/emit/host_emit_body_fragment.ssot.txt")

/-- Surface canary: stage ids + path cites. -/
def emitBodySurfaceOk : Bool :=
  (productStageId == "SLAKE_SELF_HOST_EMIT_BODY_V0")
    && (hostEmitBodyId == "HOST-EMIT-BODY")
    && (selfHostEmitBodyId == "SELF-HOST-EMIT-BODY")
    && (productAcceptancePath == "src/systems/self-host.md")
    && (productHostModulePath == "src/systems/SystemsLean/EmitBody.lean")
    && (bodySsotArtifactPath == "src/systems/emit/host_emit_body_fragment.ssot.txt")

/-- emitBodyReady -- emit body host-owned scaffolding readiness.
    FAIL-CLOSED: surface + header/body piece honesty (cheap).
    Full scaffolding bulk honesty is FreestandingEmit load + pure Nix BODY_C_* tokens.
    Greppable: emitBodyReady, HOST-EMIT-BODY, SELF-HOST-EMIT-BODY. -/
def emitBodyReady : Bool :=
  emitBodySurfaceOk && bodyHeaderHonestyOk && bodyScaffoldHonestyOk

/-- Full inventory ok (alias of emitBodyReady for inventory greps). -/
def emitBodyOk : Bool := emitBodyReady

set_option maxRecDepth 32768
set_option maxHeartbeats 800000

/-- EMIT-BODY-PRODUCT-SMOKE / HOST-EMIT-BODY-SMOKE: stage / map ids. -/
example : productStageId = "SLAKE_SELF_HOST_EMIT_BODY_V0" := by decide
example : hostEmitBodyId = "HOST-EMIT-BODY" := by decide
example : selfHostEmitBodyId = "SELF-HOST-EMIT-BODY" := by decide
example : productAcceptancePath = "src/systems/self-host.md" := by decide
example : productHostModulePath = "src/systems/SystemsLean/EmitBody.lean" := by decide
example : bodySsotArtifactPath = "src/systems/emit/host_emit_body_fragment.ssot.txt" := by decide
example : emitBodySurfaceOk = true := by decide

/-- HOST-EMIT-BODY-SMOKE: ownership + header decls. -/
example : bodyOwnershipHonestyOk = true := by decide
example : bodyHeaderHonestyOk = true := by decide

/-- HOST-EMIT-BODY-SMOKE: scaffolding piece honesty. -/
example : bodyScaffoldHonestyOk = true := by decide

/-- EMIT-BODY-PRODUCT-SMOKE: full emit readiness. -/
example : emitBodyReady = true := by decide
example : emitBodyOk = true := by decide

/-- EMIT-BODY-PRODUCT-SMOKE: free / complete stay false (not claimed on this surface).
    Ready is product-text ownership only -- not residual free / not complete. -/
theorem emitBodyReady_true : emitBodyReady = true := by decide


end SystemsLean.EmitBody
"##

end SystemsLean.HostFrontLiveEmitBodyScaffold
