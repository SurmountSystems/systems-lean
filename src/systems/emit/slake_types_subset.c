/* TYPES-SUBSET-EMIT / SLAKE_TYPES_SUBSET_EMIT_V0 body
 * Host-built Types subset freestanding C (ideal ladder M1).
 * Input: SLAKE_TYPES_SUBSET_TYPES; dialect HOST-EMIT-TYPES.
 * Not full slake_freestanding.c regenerate; Types unit only.
 * RUNTIME-FS; no product GC.
 */

/* ---- Types (COMMON-UNIVERSE / TYPED_IR_V0) ----
 * HOST-EMIT-TYPES: dialect from SystemsLean.EmitTypes + host_emit_types.ssot.txt
 * (Lean FreestandingEmit embeds this Types product text).
 */

int slake_type_tag_init(slake_type_tag *t, uint32_t tag)
{
  if (t == 0) {
    return -1;
  }
  t->tag = tag;
  return 0;
}

uint32_t slake_type_tag_get(const slake_type_tag *t)
{
  if (t == 0) {
    return 0;
  }
  return t->tag;
}

/* ---- TYPED_IR_V0 (richer typed IR; not residual free; not full elaborator) ----
 * Kind/mult pairing fail-closed. Composes FAIL_CLOSED_CHECKER_V1 on check path.
 * HOST-EMIT-TYPES: dialect from SystemsLean.EmitTypes + host_emit_types.ssot.txt
 * (Lean FreestandingEmit embeds this Types product text).
 */

const char *slake_typed_ir_id(void)
{
  return "TYPED_IR_V0";
}

/* Internal: 1 if kind pairs with mult under TYPED_IR_V0 rules; 0 otherwise. */
static int slake_ir_kind_matches_mult(enum slake_ir_kind kind, enum slake_mult mult)
{
  if (mult == SLAKE_MULT_OMEGA && kind == SLAKE_IR_KIND_VALUE) {
    return 1;
  }
  if (mult == SLAKE_MULT_1 && kind == SLAKE_IR_KIND_LINEAR) {
    return 1;
  }
  if (mult == SLAKE_MULT_0 && kind == SLAKE_IR_KIND_ERASED) {
    return 1;
  }
  return 0;
}

int slake_ir_node_init(slake_ir_node *n, uint32_t type_tag,
                       enum slake_mult mult, enum slake_ir_kind kind)
{
  if (n == 0) {
    return -1;
  }
  /* Fail closed first; leave invalid on any reject path. */
  n->valid = 0;
  n->mult = mult;
  n->kind = kind;
  n->ty.tag = 0;
  if (slake_mult_is_valid(mult) != 1) {
    return -1;
  }
  if (slake_ir_kind_matches_mult(kind, mult) != 1) {
    return -1;
  }
  if (slake_type_tag_init(&n->ty, type_tag) != 0) {
    return -1;
  }
  n->valid = 1;
  return 0;
}

int slake_ir_node_is_well_typed(const slake_ir_node *n)
{
  if (n == 0) {
    return 0;
  }
  if (n->valid == 0) {
    return 0;
  }
  if (slake_mult_is_valid(n->mult) != 1) {
    return 0;
  }
  if (slake_ir_kind_matches_mult(n->kind, n->mult) != 1) {
    return 0;
  }
  return 1;
}

int slake_ir_node_check_fail_closed(const slake_ir_node *n,
    const slake_linear_token *linear,
    const slake_erased *erased)
{
  slake_check_bundle b;

  /* Well-typed IR required before composing FAIL_CLOSED_CHECKER_V1. */
  if (slake_ir_node_is_well_typed(n) != 1) {
    return (int)SLAKE_EXTRACT_FAIL_CLOSED;
  }
  b.mult = n->mult;
  b.linear = linear;
  b.erased = erased;
  b.claimed_runtime = SLAKE_RUNTIME_FS; /* product path always RUNTIME-FS */
  return slake_check_fail_closed(&b);
}
